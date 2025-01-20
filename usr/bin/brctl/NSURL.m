@interface NSURL
+ (id)brctl_fileURLWithUserInput:(const char *)a3;
@end

@implementation NSURL

+ (id)brctl_fileURLWithUserInput:(const char *)a3
{
  v3 = +[NSString stringWithUTF8String:a3];
  v4 = +[NSURL fileURLWithPath:v3];

  v5 = [v4 lastPathComponent];
  int v6 = _CFURLIsPromiseName();

  if (v6)
  {
    v7 = (void *)_CFURLCopyLogicalNameOfPromiseAtURL();
    if (v7)
    {
      v8 = [v4 URLByDeletingLastPathComponent];
      uint64_t v9 = [v8 URLByAppendingPathComponent:v7];

      v4 = (void *)v9;
    }
  }
  [v4 br_addPhysicalProperty];

  return v4;
}

@end