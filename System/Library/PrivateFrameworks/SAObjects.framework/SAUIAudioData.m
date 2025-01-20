@interface SAUIAudioData
+ (id)audioData;
- (NSData)audioBuffer;
- (SAUIAudioDescription)decoderStreamDescription;
- (SAUIAudioDescription)playerStreamDescription;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioBuffer:(id)a3;
- (void)setDecoderStreamDescription:(id)a3;
- (void)setPlayerStreamDescription:(id)a3;
@end

@implementation SAUIAudioData

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AudioData";
}

+ (id)audioData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)audioBuffer
{
  return (NSData *)[(AceObject *)self propertyForKey:@"audioBuffer"];
}

- (void)setAudioBuffer:(id)a3
{
}

- (SAUIAudioDescription)decoderStreamDescription
{
  return (SAUIAudioDescription *)AceObjectAceObjectForProperty(self, @"decoderStreamDescription");
}

- (void)setDecoderStreamDescription:(id)a3
{
}

- (SAUIAudioDescription)playerStreamDescription
{
  return (SAUIAudioDescription *)AceObjectAceObjectForProperty(self, @"playerStreamDescription");
}

- (void)setPlayerStreamDescription:(id)a3
{
}

@end