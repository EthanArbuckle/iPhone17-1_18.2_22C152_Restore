@interface MBError
+ (BOOL)isNSFileNotFoundError:(id)a3;
+ (BOOL)isTooManyOpenFilesError:(id)a3;
@end

@implementation MBError

+ (BOOL)isNSFileNotFoundError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)4 || objc_msgSend(v3, "code") == (id)260)
  {
    v4 = [v3 domain];
    unsigned __int8 v5 = [v4 isEqualToString:NSCocoaErrorDomain];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)isTooManyOpenFilesError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)24
    && ([v3 domain],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isEqualToString:NSPOSIXErrorDomain],
        v4,
        (v5 & 1) != 0))
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v7 = [v3 userInfo];
    v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if (v8 && [v8 code] == (id)24)
    {
      v9 = [v8 domain];
      unsigned __int8 v6 = [v9 isEqualToString:NSPOSIXErrorDomain];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  return v6;
}

@end