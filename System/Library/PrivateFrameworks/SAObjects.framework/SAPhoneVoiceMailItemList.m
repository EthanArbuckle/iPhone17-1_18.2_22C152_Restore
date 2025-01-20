@interface SAPhoneVoiceMailItemList
+ (id)voiceMailItemList;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAPhoneVoiceMailItemList

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"VoiceMailItemList";
}

+ (id)voiceMailItemList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end