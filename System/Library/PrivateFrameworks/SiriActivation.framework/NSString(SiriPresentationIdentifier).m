@interface NSString(SiriPresentationIdentifier)
+ (__CFString)stringWithSiriPresentationIdentifier:()SiriPresentationIdentifier;
- (uint64_t)siriPresentationIdentifier;
@end

@implementation NSString(SiriPresentationIdentifier)

- (uint64_t)siriPresentationIdentifier
{
  uint64_t v2 = 1;
  v3 = [NSString stringWithSiriPresentationIdentifier:1];
  char v4 = [a1 isEqualToString:v3];

  if ((v4 & 1) == 0)
  {
    uint64_t v2 = 2;
    v5 = [NSString stringWithSiriPresentationIdentifier:2];
    char v6 = [a1 isEqualToString:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v2 = 3;
      v7 = [NSString stringWithSiriPresentationIdentifier:3];
      char v8 = [a1 isEqualToString:v7];

      if ((v8 & 1) == 0)
      {
        v9 = [NSString stringWithSiriPresentationIdentifier:4];
        int v10 = [a1 isEqualToString:v9];

        if (v10) {
          return 4;
        }
        else {
          return 3;
        }
      }
    }
  }
  return v2;
}

+ (__CFString)stringWithSiriPresentationIdentifier:()SiriPresentationIdentifier
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown siri presentation identifier : %li>", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6B67E28[a3];
  }
  return v3;
}

@end