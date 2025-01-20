@interface MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel
+ (BOOL)supportsSecureCoding;
- (MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel)initWithCoder:(id)a3;
- (unint64_t)type;
- (unint64_t)voiceGuidanceLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setVoiceGuidanceLevel:(unint64_t)a3;
@end

@implementation MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel

- (unint64_t)type
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MNNavigationServiceCallback_DidChangeVoiceGuidanceLevel;
  v5 = [(MNNavigationServiceCallbackParameters *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_voiceGuidanceLevel = [v4 decodeIntegerForKey:@"_voiceGuidanceLevel"];
    v6 = v5;
  }

  return v5;
}

- (unint64_t)voiceGuidanceLevel
{
  return self->_voiceGuidanceLevel;
}

- (void)setVoiceGuidanceLevel:(unint64_t)a3
{
  self->_voiceGuidanceLevel = a3;
}

@end