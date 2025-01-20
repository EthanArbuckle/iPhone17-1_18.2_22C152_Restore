@interface SATTSSpeechSynthesisWordTimingInfo
+ (id)speechSynthesisWordTimingInfo;
- (NSNumber)sampleIndex;
- (NSString)word;
- (float)timestamp;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)length;
- (int64_t)offset;
- (void)setLength:(int64_t)a3;
- (void)setOffset:(int64_t)a3;
- (void)setSampleIndex:(id)a3;
- (void)setTimestamp:(float)a3;
- (void)setWord:(id)a3;
@end

@implementation SATTSSpeechSynthesisWordTimingInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.tts";
}

- (id)encodedClassName
{
  return @"SpeechSynthesisWordTimingInfo";
}

+ (id)speechSynthesisWordTimingInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)length
{
  return AceObjectIntegerForProperty(self, @"length");
}

- (void)setLength:(int64_t)a3
{
}

- (int64_t)offset
{
  return AceObjectIntegerForProperty(self, @"offset");
}

- (void)setOffset:(int64_t)a3
{
}

- (NSNumber)sampleIndex
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"sampleIndex"];
}

- (void)setSampleIndex:(id)a3
{
}

- (float)timestamp
{
  return AceObjectFloatForProperty(self, @"timestamp");
}

- (void)setTimestamp:(float)a3
{
}

- (NSString)word
{
  return (NSString *)[(AceObject *)self propertyForKey:@"word"];
}

- (void)setWord:(id)a3
{
}

@end