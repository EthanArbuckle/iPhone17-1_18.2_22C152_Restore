@interface SAPhonePlayAudio
+ (id)playAudio;
- (BOOL)requiresResponse;
- (NSString)phoneAudioType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPhoneAudioType:(id)a3;
@end

@implementation SAPhonePlayAudio

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"PlayAudio";
}

+ (id)playAudio
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)phoneAudioType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"phoneAudioType"];
}

- (void)setPhoneAudioType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end