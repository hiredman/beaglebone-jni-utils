package a;
public class B {
    public native long mem(long offset, long size);
    /* make sure the shared library is loaded by the same classloader as the class */
    public static void loadLibrary(String l) {
        System.loadLibrary(l);
    }
    public static void load(String l) {
        System.load(l);
    }
}
