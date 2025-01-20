@interface SiriTTSProsodyProperties
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (SiriTTSProsodyProperties)init;
- (SiriTTSProsodyProperties)initWithCoder:(id)a3;
- (float)neuralSentenceDuration;
- (float)neuralSentenceEnergy;
- (float)neuralSentencePitch;
- (float)neuralSentencePitchRange;
- (float)neuralSentenceTilt;
- (void)encodeWithCoder:(id)a3;
- (void)setNeuralSentenceDuration:(float)a3;
- (void)setNeuralSentenceEnergy:(float)a3;
- (void)setNeuralSentencePitch:(float)a3;
- (void)setNeuralSentencePitchRange:(float)a3;
- (void)setNeuralSentenceTilt:(float)a3;
@end

@implementation SiriTTSProsodyProperties

- (float)neuralSentencePitch
{
  return sub_19CDCC7EC();
}

- (void)setNeuralSentencePitch:(float)a3
{
}

- (float)neuralSentencePitchRange
{
  return sub_19CDCC908();
}

- (void)setNeuralSentencePitchRange:(float)a3
{
}

- (float)neuralSentenceDuration
{
  return sub_19CDCCA24();
}

- (void)setNeuralSentenceDuration:(float)a3
{
}

- (float)neuralSentenceEnergy
{
  return sub_19CDCCB40();
}

- (void)setNeuralSentenceEnergy:(float)a3
{
}

- (float)neuralSentenceTilt
{
  return sub_19CDCCC5C();
}

- (void)setNeuralSentenceTilt:(float)a3
{
}

- (SiriTTSProsodyProperties)init
{
  return (SiriTTSProsodyProperties *)ProsodyProperties.init()();
}

+ (BOOL)supportsSecureCoding
{
  return static ProsodyProperties.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDCCEDC(v4);
}

- (SiriTTSProsodyProperties)initWithCoder:(id)a3
{
  return (SiriTTSProsodyProperties *)ProsodyProperties.init(coder:)(a3);
}

@end