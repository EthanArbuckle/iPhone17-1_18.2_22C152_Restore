@interface NavdPaths
+ (id)pathInCacheDirWithFilename:(id)a3;
@end

@implementation NavdPaths

+ (id)pathInCacheDirWithFilename:(id)a3
{
  uint64_t v3 = qword_10160F9B0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10160F9B0, &stru_1012F9270);
  }
  v5 = [(id)qword_10160F9A8 stringByAppendingPathComponent:v4];

  return v5;
}

@end