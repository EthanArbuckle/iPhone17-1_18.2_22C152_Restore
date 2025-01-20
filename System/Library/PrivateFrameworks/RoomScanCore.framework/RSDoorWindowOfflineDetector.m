@interface RSDoorWindowOfflineDetector
- (RSDoorWindowOfflineDetector)init;
@end

@implementation RSDoorWindowOfflineDetector

- (void).cxx_destruct
{
}

- (RSDoorWindowOfflineDetector)init
{
  v7.receiver = self;
  v7.super_class = (Class)RSDoorWindowOfflineDetector;
  v2 = [(RSDoorWindowOfflineDetector *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    doorWindowDetector = v2->_doorWindowDetector;
    v2->_doorWindowDetector = (RSOrthographicDetector *)v3;

    v5 = v2->_doorWindowDetector;
    if (v5) {
      v5->normalizedOutput = 0;
    }
    v2->_isCurvedWindowDoorEnabled = 0;
  }
  return v2;
}

@end