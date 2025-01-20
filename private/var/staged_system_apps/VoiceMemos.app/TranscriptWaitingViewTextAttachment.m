@interface TranscriptWaitingViewTextAttachment
- (BOOL)isEqual:(id)a3;
- (BOOL)usesTextAttachmentView;
- (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment)init;
- (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment)initWithCoder:(id)a3;
- (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment)initWithData:(id)a3 ofType:(id)a4;
- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5;
@end

@implementation TranscriptWaitingViewTextAttachment

- (BOOL)usesTextAttachmentView
{
  return 1;
}

- (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC10VoiceMemos35TranscriptWaitingViewTextAttachment_textAttachmentViewProvider) = 0;
  swift_bridgeObjectRetain();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TranscriptWaitingViewTextAttachment();
  v4 = [(TranscriptWaitingViewTextAttachment *)&v6 initWithData:0 ofType:v3];

  [(TranscriptWaitingViewTextAttachment *)v4 setAllowsTextAttachmentView:1];
  return v4;
}

- (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000F8084();
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = a5;
  v11 = self;
  v12 = sub_1000F8110(a3, (uint64_t)a4, a5);

  swift_unknownObjectRelease();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1000F7C9C((uint64_t)v8);

  sub_1000F7FBC((uint64_t)v8);
  return v6;
}

- (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
  }
  result = (_TtC10VoiceMemos35TranscriptWaitingViewTextAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos35TranscriptWaitingViewTextAttachment_textAttachmentViewProvider));
}

@end