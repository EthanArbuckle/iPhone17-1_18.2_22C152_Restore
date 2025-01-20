@interface NSUserDefaults
+ (void)crl_registerDefaults;
- (BOOL)CRLEnsureOwnershipOfDataUserDefault;
- (int64_t)CRLMathRecognitionMode;
@end

@implementation NSUserDefaults

+ (void)crl_registerDefaults
{
  if (qword_1016A9198 != -1) {
    dispatch_once(&qword_1016A9198, &stru_1014DD0F0);
  }
}

- (BOOL)CRLEnsureOwnershipOfDataUserDefault
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unsigned __int8 v4 = [(NSUserDefaults *)v2 BOOLForKey:v3];

  return v4;
}

- (int64_t)CRLMathRecognitionMode
{
  return [(NSUserDefaults *)self integerForKey:@"CRLMathRecognitionMode"];
}

@end