@interface SVDSpeakerCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingQualityScoreRangeWithLowerBound:(int64_t)a3 upperBound:(int64_t)a4;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
+ (id)newWithBuilder:(id)a3;
- (SVDSpeakerCapability)initWithCoder:(id)a3;
- (SVDSpeakerCapability)initWithStatus:(int64_t)a3 qualityScore:(int64_t)a4;
- (id)_swiftBacking;
- (int64_t)qualityScore;
- (int64_t)supportStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDSpeakerCapability

- (void).cxx_destruct
{
}

- (SVDSpeakerCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDSpeakerCapability;
  v5 = [(SVDSpeakerCapability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDSpeakerCapabilityBackingKey"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution17SpeakerCapability *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (int64_t)qualityScore
{
  return [(SpeakerCapability *)self->_backing qualityScore];
}

- (int64_t)supportStatus
{
  return [(SpeakerCapability *)self->_backing supportStatus];
}

- (SVDSpeakerCapability)initWithStatus:(int64_t)a3 qualityScore:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SVDSpeakerCapability;
  uint64_t v6 = [(SVDSpeakerCapability *)&v10 init];
  if (v6)
  {
    v7 = [[_TtC27SiriVirtualDeviceResolution17SpeakerCapability alloc] initWithStatus:a3 qualityScore:a4];
    backing = v6->_backing;
    v6->_backing = v7;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)capabilityDescriptionMatchingQualityScoreRangeWithLowerBound:(int64_t)a3 upperBound:(int64_t)a4
{
  id v4 = +[SpeakerCapability capabilityDescriptionMatchingQualityScoreRangeWithLowerBound:a3 upperBound:a4];
  v5 = [[SVDCapabilityDescription alloc] initWithBacking:v4];

  return v5;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  v3 = +[SpeakerCapability capabilityDescriptionMatchingSupportStatus:a3];
  id v4 = [[SVDCapabilityDescription alloc] initWithBacking:v3];

  return v4;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVDMutableSpeakerCapability *))a3;
  id v4 = objc_alloc_init(_SVDMutableSpeakerCapability);
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = [[SVDSpeakerCapability alloc] initWithStatus:[(_SVDMutableSpeakerCapability *)v4 status] qualityScore:[(_SVDMutableSpeakerCapability *)v4 qualityScore]];

  return v5;
}

@end