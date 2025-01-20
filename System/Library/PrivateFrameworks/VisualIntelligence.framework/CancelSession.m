@interface CancelSession
- (_TtC18VisualIntelligence13CancelSession)init;
- (void)cancel;
@end

@implementation CancelSession

- (void)cancel
{
  v2 = self;
  sub_1DCF47084();
}

- (_TtC18VisualIntelligence13CancelSession)init
{
  v2 = self;
  sub_1DD046588();
  *((unsigned char *)&v2->super.isa + OBJC_IVAR____TtC18VisualIntelligence13CancelSession__isCanceled) = 0;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC18VisualIntelligence13CancelSession_onCancels) = (Class)MEMORY[0x1E4FBC860];
  uint64_t v3 = OBJC_IVAR____TtC18VisualIntelligence13CancelSession_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE86960);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 16) = 0;
  *(Class *)((char *)&v2->super.isa + v3) = (Class)v4;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for CancelSession();
  return [(CancelSession *)&v6 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC18VisualIntelligence13CancelSession_identifier;
  uint64_t v3 = sub_1DD046598();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_release();
}

@end