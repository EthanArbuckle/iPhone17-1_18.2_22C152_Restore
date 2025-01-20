@interface StartSpeechDictationRequestMessage
- (NSString)debugDescription;
- (NSString)description;
@end

@implementation StartSpeechDictationRequestMessage

- (NSString)description
{
  return (NSString *)sub_25D08B188(self, (uint64_t)a2, (void (*)(void))sub_25D08B0C0);
}

- (NSString)debugDescription
{
  return (NSString *)sub_25D08B188(self, (uint64_t)a2, (void (*)(void))sub_25CF69C08);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes34StartSpeechDictationRequestMessage_dictationOptions));
}

@end