@interface AsrResultCandidateMessage
- (NSString)debugDescription;
- (NSString)description;
@end

@implementation AsrResultCandidateMessage

- (NSString)description
{
  return (NSString *)sub_25CF6E4A8(self, (uint64_t)a2, (void (*)(void))sub_25CF6E274);
}

- (NSString)debugDescription
{
  return (NSString *)sub_25CF6E4A8(self, (uint64_t)a2, (void (*)(void))sub_25CF69C08);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16SiriMessageTypes25AsrResultCandidateMessage_speechPackage));
}

@end