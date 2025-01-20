@interface SAMPRadioStation
+ (id)radioStation;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPRadioStation

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"RadioStation";
}

+ (id)radioStation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end