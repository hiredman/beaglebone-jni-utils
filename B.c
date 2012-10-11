#include <sys/types.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "B.h"

JNIEXPORT jlong JNICALL Java_a_B_mem
(JNIEnv * env, jobject obj, jlong off, jlong size) {

  int fd = open("/dev/mem", O_RDWR|O_SYNC);
  return (long)mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, off);

}

