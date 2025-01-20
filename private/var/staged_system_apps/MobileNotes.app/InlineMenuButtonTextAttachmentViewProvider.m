@interface InlineMenuButtonTextAttachmentViewProvider
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (_TtC11MobileNotes42InlineMenuButtonTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6;
- (void)loadView;
@end

@implementation InlineMenuButtonTextAttachmentViewProvider

- (_TtC11MobileNotes42InlineMenuButtonTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  swift_unknownObjectRetain();
  v13 = [(InlineMenuButtonTextAttachmentViewProvider *)&v15 initWithTextAttachment:v10 parentView:v11 textLayoutManager:v12 location:a6];
  -[InlineMenuButtonTextAttachmentViewProvider setTracksTextAttachmentViewBounds:](v13, "setTracksTextAttachmentViewBounds:", 1, v15.receiver, v15.super_class);

  swift_unknownObjectRelease();
  return v13;
}

- (void)loadView
{
  v2 = self;
  sub_100250AD8();
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double height = a6.size.height;
  double width = a6.size.width;
  double v11 = a6.origin.y;
  double v12 = a6.origin.x;
  type metadata accessor for Key(0);
  sub_1001BBF80();
  uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  id v17 = a5;
  v18 = self;
  double v19 = sub_100250C44(v12, v11, width, height, x, y, v16, (uint64_t)a4, (uint64_t)a5);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

@end