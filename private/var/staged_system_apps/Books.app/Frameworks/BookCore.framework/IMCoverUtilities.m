@interface IMCoverUtilities
+ (BOOL)isUndesirableImageData:(id)a3 error:(id *)a4;
@end

@implementation IMCoverUtilities

+ (BOOL)isUndesirableImageData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 hash];
  char v7 = v6 == (id)254731557 || v6 == (id)153495661;
  if (v6 == (id)254731557 || v6 == (id)153495661)
  {
    if (a4)
    {
      *a4 = +[NSError errorWithDomain:@"kIMCoverUtilitiesErrorDomain" code:-1000 userInfo:0];
    }
  }
  else
  {
    v8 = CGImageSourceCreateWithData((CFDataRef)v5, 0);
    if (v8)
    {
      v9 = v8;
      if (BKGenericBookCoverIsLegacyGenericBookCoverImageSource(v8))
      {
        if (a4)
        {
          *a4 = +[NSError errorWithDomain:@"kIMCoverUtilitiesErrorDomain" code:-1001 userInfo:0];
        }
        char v7 = 1;
      }
      CFRelease(v9);
    }
  }

  return v7;
}

@end