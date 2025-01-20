@interface STSDiagnosticExtension
- (_TtC13STSDiagnostic22STSDiagnosticExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation STSDiagnosticExtension

- (id)attachmentList
{
  v2 = self;
  uint64_t v3 = sub_1000027F4();

  if (v3)
  {
    v4.super.isa = sub_100007148().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

- (id)attachmentsForParameters:(id)a3
{
  if (a3) {
    sub_1000070E8();
  }
  NSArray v4 = self;
  uint64_t v5 = sub_100006908();

  swift_bridgeObjectRelease();
  if (v5)
  {
    v6.super.isa = sub_100007148().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }
  return v6.super.isa;
}

- (_TtC13STSDiagnostic22STSDiagnosticExtension)init
{
  v2 = self;
  sub_1000070C8();
  uint64_t v3 = &v2->logPath[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath];
  *(void *)uint64_t v3 = 0xD000000000000030;
  *((void *)v3 + 1) = 0x80000001000077D0;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for STSDiagnosticExtension();
  return [(STSDiagnosticExtension *)&v5 init];
}

- (void).cxx_destruct
{
  v2 = &self->logPath[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logger];
  uint64_t v3 = sub_1000070D8();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end