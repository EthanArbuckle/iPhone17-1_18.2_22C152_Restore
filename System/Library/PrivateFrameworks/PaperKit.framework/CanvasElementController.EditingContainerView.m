@interface CanvasElementController.EditingContainerView
- (_TtCC8PaperKit23CanvasElementControllerP33_DA32B6809F82252A18050DB886E8EA8120EditingContainerView)initWithCoder:(id)a3;
- (_TtCC8PaperKit23CanvasElementControllerP33_DA32B6809F82252A18050DB886E8EA8120EditingContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CanvasElementController.EditingContainerView

- (_TtCC8PaperKit23CanvasElementControllerP33_DA32B6809F82252A18050DB886E8EA8120EditingContainerView)initWithCoder:(id)a3
{
  result = (_TtCC8PaperKit23CanvasElementControllerP33_DA32B6809F82252A18050DB886E8EA8120EditingContainerView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(CanvasElementController.EditingContainerView *)&v4 layoutSubviews];
  if ((v2[OBJC_IVAR____TtCC8PaperKit23CanvasElementControllerP33_DA32B6809F82252A18050DB886E8EA8120EditingContainerView_isCompactToolPicker] & 1) == 0)
  {
    v3 = *(void **)&v2[OBJC_IVAR____TtCC8PaperKit23CanvasElementControllerP33_DA32B6809F82252A18050DB886E8EA8120EditingContainerView_editingView];
    objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
    objc_msgSend(v3, sel_setFrame_);
  }
}

- (_TtCC8PaperKit23CanvasElementControllerP33_DA32B6809F82252A18050DB886E8EA8120EditingContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtCC8PaperKit23CanvasElementControllerP33_DA32B6809F82252A18050DB886E8EA8120EditingContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8PaperKit23CanvasElementControllerP33_DA32B6809F82252A18050DB886E8EA8120EditingContainerView_editingView));
}

@end