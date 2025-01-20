@interface TTRIMenuButtonAttachmentProvider
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (_TtC15RemindersUICore32TTRIMenuButtonAttachmentProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6;
- (void)loadView;
@end

@implementation TTRIMenuButtonAttachmentProvider

- (_TtC15RemindersUICore32TTRIMenuButtonAttachmentProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore32TTRIMenuButtonAttachmentProvider_lightBackgroundAlpha) = (Class)0x3FB999999999999ALL;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore32TTRIMenuButtonAttachmentProvider_darkBackgroundAlpha) = (Class)0x3FB999999999999ALL;
  v17.receiver = self;
  v17.super_class = ObjectType;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  swift_unknownObjectRetain();
  v15 = [(NSTextAttachmentViewProvider *)&v17 initWithTextAttachment:v12 parentView:v13 textLayoutManager:v14 location:a6];
  -[NSTextAttachmentViewProvider setTracksTextAttachmentViewBounds:](v15, sel_setTracksTextAttachmentViewBounds_, 1, v17.receiver, v17.super_class);

  swift_unknownObjectRelease();
  return v15;
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
  sub_1B9109BA8();
  uint64_t v16 = sub_1B996E6E0();
  swift_unknownObjectRetain();
  id v17 = a5;
  v18 = self;
  double v19 = TTRIMenuButtonAttachmentProvider.attachmentBounds(for:location:textContainer:proposedLineFragment:position:)(v12, v11, width, height, x, y, v16, (uint64_t)a4, (uint64_t)a5);
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

- (void)loadView
{
  v2 = self;
  TTRIMenuButtonAttachmentProvider.loadView()();
}

@end