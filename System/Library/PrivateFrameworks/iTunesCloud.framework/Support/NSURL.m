@interface NSURL
- (BOOL)ic_referencesSameFile:(id)a3;
@end

@implementation NSURL

- (BOOL)ic_referencesSameFile:(id)a3
{
  id v4 = a3;
  if (-[NSURL isFileURL](self, "isFileURL") && [v4 isFileURL])
  {
    if ([(NSURL *)self isEqual:v4])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      v7 = [(NSURL *)self path];
      v8 = [v7 stringByStandardizingPath];

      v9 = [v4 path];
      v10 = [v9 stringByStandardizingPath];

      if ([v8 isEqualToString:v10])
      {
        unsigned __int8 v5 = 1;
      }
      else
      {
        v11 = [v8 stringByResolvingSymlinksInPath];

        uint64_t v12 = [v10 stringByResolvingSymlinksInPath];

        unsigned __int8 v5 = [v11 isEqualToString:v12];
        v8 = v11;
        v10 = (void *)v12;
      }
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end