@interface RCRecordButtonAppFactory
- (_TtC10VoiceMemos24RCRecordButtonAppFactory)init;
- (_TtC10VoiceMemos24RCRecordButtonAppFactory)initWithRecordButtonRepository:(id)a3 interactionHandler:(id)a4;
- (id)createRecordButton;
@end

@implementation RCRecordButtonAppFactory

- (id)createRecordButton
{
  v2 = self;
  v3 = (void *)sub_100018AD0();

  return v3;
}

- (_TtC10VoiceMemos24RCRecordButtonAppFactory)initWithRecordButtonRepository:(id)a3 interactionHandler:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  v5 = (_TtC10VoiceMemos24RCRecordButtonAppFactory *)sub_10000FFD8(v4);

  swift_unknownObjectRelease();
  return v5;
}

- (_TtC10VoiceMemos24RCRecordButtonAppFactory)init
{
  result = (_TtC10VoiceMemos24RCRecordButtonAppFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10VoiceMemos24RCRecordButtonAppFactory_recordButtonRepository));
  sub_10002F48C((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos24RCRecordButtonAppFactory_recordButtonPresenter);
  v3 = (char *)self + OBJC_IVAR____TtC10VoiceMemos24RCRecordButtonAppFactory_interactionHandler;

  sub_10000C4A4((uint64_t)v3);
}

@end