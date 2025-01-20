@interface InlineDrawingTextAttachmentView
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (_TtC8PaperKit31InlineDrawingTextAttachmentView)initWithAttachment:(id)a3 drawingClass:(Class)a4 inserted:(BOOL)a5;
- (_TtC8PaperKit31InlineDrawingTextAttachmentView)initWithCoder:(id)a3;
- (_TtC8PaperKit31InlineDrawingTextAttachmentView)initWithFrame:(CGRect)a3 drawing:(id)a4;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (void)didMoveToWindow;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
@end

@implementation InlineDrawingTextAttachmentView

- (void)didMoveToWindow
{
  v2 = self;
  InlineDrawingTextAttachmentView.didMoveToWindow()();
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  char v8 = specialized InlineDrawingTextAttachmentView.dropInteraction(_:canHandle:)(a4);

  swift_unknownObjectRelease();
  return v8 & 1;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = specialized InlineDrawingTextAttachmentView.dropInteraction(_:sessionDidUpdate:)(a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  specialized InlineDrawingTextAttachmentView.dropInteraction(_:performDrop:)(a4);

  swift_unknownObjectRelease();
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return (int64_t)[(InlineDrawingTextAttachmentView *)self _dropDataOwner];
}

- (_TtC8PaperKit31InlineDrawingTextAttachmentView)initWithAttachment:(id)a3 drawingClass:(Class)a4 inserted:(BOOL)a5
{
  BOOL v5 = a5;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView_dropInteraction) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView_dropSessionType) = 3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView____lazy_storage___acceptedDropLayouts) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for InlineDrawingTextAttachmentView();
  return [(PKTextAttachmentDrawingView *)&v9 initWithAttachment:a3 drawingClass:a4 inserted:v5];
}

- (_TtC8PaperKit31InlineDrawingTextAttachmentView)initWithFrame:(CGRect)a3 drawing:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKDrawing?);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    id v12 = a4;
    static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v13 = type metadata accessor for PKDrawing();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = type metadata accessor for PKDrawing();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  return (_TtC8PaperKit31InlineDrawingTextAttachmentView *)InlineDrawingTextAttachmentView.init(frame:drawing:)((uint64_t)v11, x, y, width, height);
}

- (_TtC8PaperKit31InlineDrawingTextAttachmentView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView_dropInteraction) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView_dropSessionType) = 3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView____lazy_storage___acceptedDropLayouts) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InlineDrawingTextAttachmentView();
  return [(PKTextAttachmentDrawingView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView_dropInteraction));
  swift_bridgeObjectRelease();
}

@end