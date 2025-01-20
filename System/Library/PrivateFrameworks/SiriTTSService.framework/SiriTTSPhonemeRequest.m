@interface SiriTTSPhonemeRequest
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NSString)text;
- (SiriTTSPhonemeRequest)init;
- (SiriTTSPhonemeRequest)initWithCoder:(id)a3;
- (SiriTTSPhonemeRequest)initWithText:(id)a3 voice:(id)a4 phonemeSystem:(int64_t)a5;
- (SiriTTSSynthesisVoice)voice;
- (int64_t)phonemeSystem;
- (void)encodeWithCoder:(id)a3;
- (void)setPhonemeSystem:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setVoice:(id)a3;
@end

@implementation SiriTTSPhonemeRequest

- (NSString)text
{
  return (NSString *)sub_19CD9FCF4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CDD3F9C);
}

- (void)setText:(id)a3
{
}

- (SiriTTSSynthesisVoice)voice
{
  id v2 = sub_19CDD40B0();
  return (SiriTTSSynthesisVoice *)v2;
}

- (void)setVoice:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD415C(v4);
}

- (int64_t)phonemeSystem
{
  return sub_19CDD4204();
}

- (void)setPhonemeSystem:(int64_t)a3
{
}

- (SiriTTSPhonemeRequest)initWithText:(id)a3 voice:(id)a4 phonemeSystem:(int64_t)a5
{
  uint64_t v7 = sub_19CED5260();
  return (SiriTTSPhonemeRequest *)PhonemeRequest.init(text:voice:phonemeSystem:)(v7, v8, (uint64_t)a4, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19CDD43F0(v4);
}

- (SiriTTSPhonemeRequest)initWithCoder:(id)a3
{
  return (SiriTTSPhonemeRequest *)PhonemeRequest.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19CDD8FE8(self, (uint64_t)a2, (void (*)(void))sub_19CDD46C8);
}

- (SiriTTSPhonemeRequest)init
{
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_92();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SiriTTSPhonemeRequest_voice);
}

@end