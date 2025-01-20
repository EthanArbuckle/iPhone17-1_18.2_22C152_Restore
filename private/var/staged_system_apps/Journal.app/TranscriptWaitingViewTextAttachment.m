@interface TranscriptWaitingViewTextAttachment
- (BOOL)usesTextAttachmentView;
- (_TtC7Journal35TranscriptWaitingViewTextAttachment)init;
- (_TtC7Journal35TranscriptWaitingViewTextAttachment)initWithCoder:(id)a3;
- (_TtC7Journal35TranscriptWaitingViewTextAttachment)initWithData:(id)a3 ofType:(id)a4;
- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5;
@end

@implementation TranscriptWaitingViewTextAttachment

- (BOOL)usesTextAttachmentView
{
  return 1;
}

- (_TtC7Journal35TranscriptWaitingViewTextAttachment)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7Journal35TranscriptWaitingViewTextAttachment_textAttachmentViewProvider) = 0;
  swift_bridgeObjectRetain();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TranscriptWaitingViewTextAttachment();
  v4 = [(TranscriptWaitingViewTextAttachment *)&v6 initWithData:0 ofType:v3];

  [(TranscriptWaitingViewTextAttachment *)v4 setAllowsTextAttachmentView:1];
  return v4;
}

- (_TtC7Journal35TranscriptWaitingViewTextAttachment)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7Journal35TranscriptWaitingViewTextAttachment_textAttachmentViewProvider) = 0;
  id v4 = a3;

  result = (_TtC7Journal35TranscriptWaitingViewTextAttachment *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = a5;
  v11 = self;
  id v12 = (id)sub_1001DE708(a3, (uint64_t)a4, a5);

  swift_unknownObjectRelease();

  return v12;
}

- (_TtC7Journal35TranscriptWaitingViewTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
  }
  result = (_TtC7Journal35TranscriptWaitingViewTextAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Journal35TranscriptWaitingViewTextAttachment_textAttachmentViewProvider));
}

@end