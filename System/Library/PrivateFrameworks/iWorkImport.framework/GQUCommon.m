@interface GQUCommon
+ (BOOL)fileExistsAtUrl:(__CFURL *)a3;
@end

@implementation GQUCommon

+ (BOOL)fileExistsAtUrl:(__CFURL *)a3
{
  if (!a3) {
    return 0;
  }
  CFStringRef v3 = CFURLCopyFileSystemPath(a3, kCFURLPOSIXPathStyle);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  BOOL v5 = [+[NSFileManager defaultManager] fileExistsAtPath:v3];
  CFRelease(v4);
  return v5;
}

@end