@interface PXTipsAppDonation
+ (id)_eventIdentifierForEvent:(int64_t)a3;
+ (void)donateSignalForEvent:(int64_t)a3;
@end

@implementation PXTipsAppDonation

+ (id)_eventIdentifierForEvent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"com.apple.mobileslideshow.trashed-photo";
  }
  else {
    return off_1E5DD2950[a3 - 1];
  }
}

+ (void)donateSignalForEvent:(int64_t)a3
{
  id v8 = [a1 _eventIdentifierForEvent:a3];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F4FE08]) initWithContentIdentifier:v8 context:@"com.apple.mobileslideshow" osBuild:0 userInfo:0];
  v4 = BiomeLibrary();
  v5 = [v4 Discoverability];
  v6 = [v5 Signals];
  v7 = [v6 source];

  [v7 sendEvent:v3];
}

@end