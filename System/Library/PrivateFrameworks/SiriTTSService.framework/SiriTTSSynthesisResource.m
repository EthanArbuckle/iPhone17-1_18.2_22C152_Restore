@interface SiriTTSSynthesisResource
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)assetKey;
- (NSString)description;
- (NSString)language;
- (SiriTTSSynthesisResource)init;
- (SiriTTSSynthesisResource)initWithCoder:(id)a3;
- (SiriTTSSynthesisResource)initWithLanguage:(id)a3;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation SiriTTSSynthesisResource

- (NSString)language
{
  return (NSString *)sub_19CD9FCF4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CDD8938);
}

- (void)setLanguage:(id)a3
{
}

- (int64_t)version
{
  return sub_19CDD89D4();
}

- (void)setVersion:(int64_t)a3
{
}

- (SiriTTSSynthesisResource)initWithLanguage:(id)a3
{
  uint64_t v3 = sub_19CED5260();
  return (SiriTTSSynthesisResource *)SynthesisResource.init(language:)(v3, v4);
}

- (NSString)description
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDD8B90);
}

+ (BOOL)supportsSecureCoding
{
  return static SynthesisResource.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD8D6C();
}

- (SiriTTSSynthesisResource)initWithCoder:(id)a3
{
  return (SiriTTSSynthesisResource *)SynthesisResource.init(coder:)(a3);
}

- (NSString)assetKey
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDD9058);
}

- (SiriTTSSynthesisResource)init
{
}

- (void).cxx_destruct
{
}

@end