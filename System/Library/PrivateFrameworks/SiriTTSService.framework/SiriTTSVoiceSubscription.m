@interface SiriTTSVoiceSubscription
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)accessoryId;
- (NSString)clientId;
- (NSString)description;
- (SiriTTSSynthesisVoice)voice;
- (SiriTTSVoiceSubscription)init;
- (SiriTTSVoiceSubscription)initWithCoder:(id)a3;
- (SiriTTSVoiceSubscription)initWithVoice:(id)a3 clientId:(id)a4 accessoryId:(id)a5;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryId:(id)a3;
- (void)setClientId:(id)a3;
- (void)setVoice:(id)a3;
@end

@implementation SiriTTSVoiceSubscription

- (SiriTTSSynthesisVoice)voice
{
  id v2 = sub_19CE8C6B8();
  return (SiriTTSSynthesisVoice *)v2;
}

- (void)setVoice:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CE8C758(v4);
}

- (NSString)clientId
{
  return (NSString *)sub_19CE8D6AC((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CE8C82C);
}

- (void)setClientId:(id)a3
{
  sub_19CED5260();
  id v4 = self;
  sub_19CE8C8E0();
}

- (NSString)accessoryId
{
  return (NSString *)sub_19CE88280((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CE8C9D0);
}

- (void)setAccessoryId:(id)a3
{
}

- (SiriTTSVoiceSubscription)initWithVoice:(id)a3 clientId:(id)a4 accessoryId:(id)a5
{
  uint64_t v7 = sub_19CED5260();
  uint64_t v9 = v8;
  if (a5)
  {
    a5 = (id)sub_19CED5260();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  return (SiriTTSVoiceSubscription *)SynthesisVoiceSubscription.init(voice:clientId:accessoryId:)(a3, v7, v9, (uint64_t)a5, v11);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_19CED5AB0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_19CE8CB78((uint64_t)v8);

  sub_19CDAE90C((uint64_t)v8, (uint64_t *)&unk_1EB534C40);
  return v6 & 1;
}

- (int64_t)hash
{
  id v2 = self;
  int64_t v3 = sub_19CE8CE04();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return static SynthesisVoiceSubscription.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CE8D010(v4);
}

- (SiriTTSVoiceSubscription)initWithCoder:(id)a3
{
  return (SiriTTSVoiceSubscription *)SynthesisVoiceSubscription.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19CE8DBF8(self, (uint64_t)a2, (void (*)(void))sub_19CE8D3F4);
}

- (SiriTTSVoiceSubscription)init
{
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_139();
  swift_bridgeObjectRelease();
}

@end