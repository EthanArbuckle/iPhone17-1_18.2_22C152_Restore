@interface ContextMenuPreviewItemController
- (_TtC8VideosUI32ContextMenuPreviewItemController)initWithCoder:(id)a3;
- (_TtC8VideosUI32ContextMenuPreviewItemController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation ContextMenuPreviewItemController

- (_TtC8VideosUI32ContextMenuPreviewItemController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E387C928();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8VideosUI32ContextMenuPreviewItemController *)sub_1E3727148(v5, v7, a4);
}

- (_TtC8VideosUI32ContextMenuPreviewItemController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI32ContextMenuPreviewItemController *)sub_1E372725C(a3);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI32ContextMenuPreviewItemController_cardView);
}

@end