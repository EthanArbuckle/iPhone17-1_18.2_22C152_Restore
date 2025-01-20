@interface NSURL
- (BOOL)isQuickTime;
- (id)temporaryMovieLink:(id *)a3;
@end

@implementation NSURL

- (id)temporaryMovieLink:(id *)a3
{
  v5 = +[NSFileManager defaultManager];
  v6 = [v5 URLForDirectory:99 inDomain:1 appropriateForURL:self create:1 error:a3];
  if (v6)
  {
    v7 = [(NSURL *)self lastPathComponent];
    v8 = [v6 URLByAppendingPathComponent:v7];
    v9 = [v8 rc_URLByReplacingPathExtensionWithExtension:RCAudioFileExtensionQT];

    if ([v5 linkItemAtURL:self toURL:v9 error:a3]) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)isQuickTime
{
  v2 = [(NSURL *)self pathExtension];
  if ([v2 isEqualToString:RCAudioFileExtensionQTA]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [v2 isEqualToString:RCAudioFileExtensionQT];
  }

  return v3;
}

@end