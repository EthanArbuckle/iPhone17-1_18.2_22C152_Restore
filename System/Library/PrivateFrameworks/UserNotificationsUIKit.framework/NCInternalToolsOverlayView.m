@interface NCInternalToolsOverlayView
+ (id)debugViewIfInternal;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NCInternalToolsOverlayView)init;
- (NCInternalToolsOverlayView)initWithCoder:(id)a3;
- (NCInternalToolsOverlayView)initWithFrame:(CGRect)a3;
- (NCInternalToolsOverlayViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)handleLongPress:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation NCInternalToolsOverlayView

+ (id)debugViewIfInternal
{
  if (os_variant_has_internal_content()) {
    id v2 = objc_msgSend(objc_allocWithZone((Class)NCInternalToolsOverlayView), sel_init);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (NCInternalToolsOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo26NCInternalToolsOverlayViewC22UserNotificationsUIKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (NCInternalToolsOverlayViewDelegate)delegate
{
  id v2 = (void *)MEMORY[0x1D9481D00]((char *)self + OBJC_IVAR___NCInternalToolsOverlayView_delegate, a2);

  return (NCInternalToolsOverlayViewDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (NCInternalToolsOverlayView)init
{
  return (NCInternalToolsOverlayView *)sub_1D7D242E0();
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)NCInternalToolsOverlayView;
  id v2 = self;
  [(NCInternalToolsOverlayView *)&v6 layoutSubviews];
  sub_1D7D24008();
  id v3 = *(Class *)((char *)&v2->super.super.super.isa
                + OBJC_IVAR___NCInternalToolsOverlayView_doubleTapLongPressRecognizer);
  id v4 = objc_msgSend(v3, sel_view, v6.receiver, v6.super_class);

  if (!v4)
  {
    v5 = (NCInternalToolsOverlayView *)[(NCInternalToolsOverlayView *)v2 superview];
    [(NCInternalToolsOverlayView *)v5 addGestureRecognizer:v3];

    id v2 = v5;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  NCInternalToolsOverlayView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (NCInternalToolsOverlayView)initWithFrame:(CGRect)a3
{
  result = (NCInternalToolsOverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D7D23880((uint64_t)self + OBJC_IVAR___NCInternalToolsOverlayView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCInternalToolsOverlayView_doubleTapLongPressRecognizer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCInternalToolsOverlayView_debugHUDContainerView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalToolsOverlayView_hostingViewController);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = NCInternalToolsOverlayView.gestureRecognizerShouldBegin(_:)(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  BOOL result = 0;
  if (*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalToolsOverlayView_doubleTapLongPressRecognizer) == a3)
  {
    self;
    if (swift_dynamicCastObjCClass()) {
      return 1;
    }
    self;
    if (swift_dynamicCastObjCClass()) {
      return 1;
    }
  }
  return result;
}

- (void)handleLongPress:(id)a3
{
  id v4 = a3;
  objc_super v6 = self;
  id v5 = objc_msgSend(v4, sel_state);
  if (v5 == (id)3)
  {
    sub_1D7D25214();
  }
  else if (v5 == (id)1)
  {
    objc_msgSend(v4, sel_locationInView_, v6);
    sub_1D7D24FB8();
  }
}

@end