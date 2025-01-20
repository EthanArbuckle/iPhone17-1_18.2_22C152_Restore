@interface ICLockedTextAttachmentView
- (BOOL)shouldAddMenuLongPressGesture;
- (BOOL)shouldAddPanGesture;
- (ICLockedTextAttachmentView)initWithCoder:(id)a3;
- (ICLockedTextAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6;
- (ICLockedTextAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5;
- (void)didTapAttachment:(id)a3;
- (void)openAttachment;
@end

@implementation ICLockedTextAttachmentView

- (ICLockedTextAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  return (ICLockedTextAttachmentView *)LockedTextAttachmentView.init(frame:textAttachment:textContainer:forManualRendering:)(a4, a5, a6, x, y, width, height);
}

- (ICLockedTextAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3)
  {
    self;
    v9 = (void *)swift_dynamicCastObjCClass();
    if (v9) {
      id v10 = a3;
    }
  }
  else
  {
    v9 = 0;
  }
  v11 = -[ICLockedTextAttachmentView initWithFrame:textAttachment:textContainer:forManualRendering:](self, sel_initWithFrame_textAttachment_textContainer_forManualRendering_, v9, a4, v5, 0.0, 0.0, 0.0, 0.0);

  return v11;
}

- (ICLockedTextAttachmentView)initWithCoder:(id)a3
{
  result = (ICLockedTextAttachmentView *)sub_20C163BD0();
  __break(1u);
  return result;
}

- (BOOL)shouldAddMenuLongPressGesture
{
  return 0;
}

- (BOOL)shouldAddPanGesture
{
  return 0;
}

- (void)didTapAttachment:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_20C1638F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    BOOL v5 = self;
  }
  LockedTextAttachmentView.didTapAttachment(_:)();

  sub_20BFD5754((uint64_t)v6);
}

- (void)openAttachment
{
  v2 = self;
  LockedTextAttachmentView.openAttachment()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___ICLockedTextAttachmentView_lockedView));
}

@end