@interface CXSandboxExtendedURL
- (BOOL)csd_isSymbolicLink;
@end

@implementation CXSandboxExtendedURL

- (BOOL)csd_isSymbolicLink
{
  v2 = [(CXSandboxExtendedURL *)self URL];
  v3 = [v2 path];

  if ([v3 length])
  {
    v4 = +[NSFileManager defaultManager];
    id v10 = 0;
    v5 = [v4 attributesOfItemAtPath:v3 error:&v10];
    id v6 = v10;

    if (v5)
    {
      v7 = [v5 objectForKeyedSubscript:NSFileType];
      unsigned __int8 v8 = [v7 isEqual:NSFileTypeSymbolicLink];
    }
    else
    {
      v5 = sub_100008DCC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1003B0888((uint64_t)v6, v5);
      }
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

@end