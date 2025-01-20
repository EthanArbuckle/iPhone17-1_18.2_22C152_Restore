@interface NSString
- (id)stringByResolvingRealPathWithError:(id *)a3;
@end

@implementation NSString

- (id)stringByResolvingRealPathWithError:(id *)a3
{
  if ([(NSString *)self isEqualToString:&stru_100096EC0])
  {
    if (a3)
    {
      v12[0] = NSLocalizedDescriptionKey;
      v12[1] = NSFilePathErrorKey;
      v13[0] = @"Receiver must not be the empty string.";
      v13[1] = self;
      v5 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
      *a3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:v5];
    }
LABEL_7:
    id v7 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    long long v9 = xmmword_1000768E8;
    memset(v11, 0, 512);
    while (1)
    {
      v6 = self;
      if (getattrlist([(NSString *)v6 fileSystemRepresentation], &v9, v11, 0x40CuLL, 0) != -1)break; {
      if (*__error() != 35)
      }
        goto LABEL_7;
    }
    id v7 = [objc_alloc((Class)NSString) initWithUTF8String:(char *)v11 + SDWORD1(v11[0]) + 4];
  }
  return v7;
}

@end