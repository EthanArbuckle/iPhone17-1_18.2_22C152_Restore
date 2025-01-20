@interface SiriTTSSynthesisVoice
+ (BOOL)supportsSecureCoding;
+ (int)voiceEnumForName:(id)a3;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)assetKey;
- (NSString)description;
- (NSString)language;
- (NSString)name;
- (SiriTTSSynthesisVoice)init;
- (SiriTTSSynthesisVoice)initWithCoder:(id)a3;
- (SiriTTSSynthesisVoice)initWithLanguage:(id)a3 name:(id)a4;
- (int64_t)footprint;
- (int64_t)gender;
- (int64_t)hash;
- (int64_t)type;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setFootprint:(int64_t)a3;
- (void)setGender:(int64_t)a3;
- (void)setLanguage:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation SiriTTSSynthesisVoice

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_92();
  swift_bridgeObjectRelease();
}

- (SiriTTSSynthesisVoice)initWithCoder:(id)a3
{
  return (SiriTTSSynthesisVoice *)SynthesisVoice.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDAA118();
}

- (NSString)language
{
  return (NSString *)sub_19CD9FCF4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CD9FD44);
}

+ (BOOL)supportsSecureCoding
{
  return static SynthesisVoice.supportsSecureCoding.getter() & 1;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)name
{
  return (NSString *)sub_19CDD6E7C((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CDD6ED8);
}

- (void)setName:(id)a3
{
}

- (int64_t)footprint
{
  return sub_19CDD70AC();
}

- (void)setFootprint:(int64_t)a3
{
}

- (int64_t)type
{
  return sub_19CDD7248();
}

- (void)setType:(int64_t)a3
{
}

- (int64_t)gender
{
  return sub_19CDD738C();
}

- (void)setGender:(int64_t)a3
{
}

- (int64_t)version
{
  return sub_19CDD7498();
}

- (void)setVersion:(int64_t)a3
{
}

- (SiriTTSSynthesisVoice)initWithLanguage:(id)a3 name:(id)a4
{
  uint64_t v5 = sub_19CED5260();
  uint64_t v7 = v6;
  if (a4)
  {
    uint64_t v8 = sub_19CED5260();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  return (SiriTTSSynthesisVoice *)SynthesisVoice.init(language:name:)(v5, v7, v8, v10);
}

- (BOOL)isEqual:(id)a3
{
  return sub_19CDD7844(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_19CDD7620);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_19CDD7908();

  return v3;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (NSString)description
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDD7B44);
}

- (NSString)assetKey
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDD7D44);
}

- (SiriTTSSynthesisVoice)init
{
}

+ (int)voiceEnumForName:(id)a3
{
  uint64_t v3 = sub_19CED5260();
  int v4 = static SynthesisVoice.voiceEnum(forName:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

@end