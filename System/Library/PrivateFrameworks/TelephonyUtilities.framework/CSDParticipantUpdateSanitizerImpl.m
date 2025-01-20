@interface CSDParticipantUpdateSanitizerImpl
- (CSDParticipantUpdateSanitizerImpl)init;
- (CSDParticipantUpdateSanitizerImpl)initWithVoucherManager:(id)a3;
- (void)sanitize:(id)a3 completion:(id)a4;
@end

@implementation CSDParticipantUpdateSanitizerImpl

- (CSDParticipantUpdateSanitizerImpl)initWithVoucherManager:(id)a3
{
  return (CSDParticipantUpdateSanitizerImpl *)sub_100322220((uint64_t)a3);
}

- (void)sanitize:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1003222E0(v7, (uint64_t)v8, v6);
  _Block_release(v6);
}

- (CSDParticipantUpdateSanitizerImpl)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end