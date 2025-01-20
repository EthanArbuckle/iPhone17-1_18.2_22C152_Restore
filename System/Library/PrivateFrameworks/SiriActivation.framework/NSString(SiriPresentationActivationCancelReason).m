@interface NSString(SiriPresentationActivationCancelReason)
+ (__CFString)stringWithSiriPresentationActivationCancelReason:()SiriPresentationActivationCancelReason;
- (uint64_t)cancelReason;
@end

@implementation NSString(SiriPresentationActivationCancelReason)

+ (__CFString)stringWithSiriPresentationActivationCancelReason:()SiriPresentationActivationCancelReason
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"SiriPresentationActivationCancelReasonShellEvent";
  }
  else {
    return off_1E6B67E50[a3 - 1];
  }
}

- (uint64_t)cancelReason
{
  v2 = [NSString stringWithSiriPresentationActivationCancelReason:0];
  char v3 = [a1 isEqualToString:v2];

  uint64_t v4 = 0;
  if ((v3 & 1) == 0)
  {
    uint64_t v4 = 1;
    v5 = [NSString stringWithSiriPresentationActivationCancelReason:1];
    char v6 = [a1 isEqualToString:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v4 = 2;
      v7 = [NSString stringWithSiriPresentationActivationCancelReason:2];
      char v8 = [a1 isEqualToString:v7];

      if ((v8 & 1) == 0)
      {
        uint64_t v4 = 3;
        v9 = [NSString stringWithSiriPresentationActivationCancelReason:3];
        char v10 = [a1 isEqualToString:v9];

        if ((v10 & 1) == 0)
        {
          uint64_t v4 = 4;
          v11 = [NSString stringWithSiriPresentationActivationCancelReason:4];
          char v12 = [a1 isEqualToString:v11];

          if ((v12 & 1) == 0)
          {
            v13 = [NSString stringWithSiriPresentationActivationCancelReason:5];
            int v14 = [a1 isEqualToString:v13];

            if (v14) {
              return 5;
            }
            else {
              return 0;
            }
          }
        }
      }
    }
  }
  return v4;
}

@end