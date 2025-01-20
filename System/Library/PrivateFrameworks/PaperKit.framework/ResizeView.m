@interface ResizeView
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC8PaperKit10ResizeView)initWithCoder:(id)a3;
- (_TtC8PaperKit10ResizeView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dragMoved:(id)a3;
- (void)layoutSubviews;
- (void)resizeHandleMoved:(id)a3;
- (void)rotate:(id)a3;
@end

@implementation ResizeView

- (_TtC8PaperKit10ResizeView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized ResizeView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  ResizeView.layoutSubviews()();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  ResizeView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (void)resizeHandleMoved:(id)a3
{
  id v4 = a3;
  v5 = self;
  ResizeView.resizeHandleMoved(_:)(v4);
}

- (void)dragMoved:(id)a3
{
  id v4 = (UIPanGestureRecognizer *)a3;
  v5 = self;
  ResizeView.dragMoved(_:)(v4);
}

- (void)rotate:(id)a3
{
  id v4 = (UIRotationGestureRecognizer *)a3;
  v5 = self;
  ResizeView.rotate(_:)(v4);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = ResizeView.gestureRecognizerShouldBegin(_:)(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  v6 = (UIGestureRecognizer *)a3;
  v7 = (UIGestureRecognizer *)a4;
  id v8 = self;
  Swift::Bool v9 = ResizeView.gestureRecognizer(_:shouldBeRequiredToFailBy:)(v6, v7);

  return v9;
}

- (_TtC8PaperKit10ResizeView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit10ResizeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of ResizeView.ActiveHandle(*(id *)((char *)&self->super.super.super.isa
                                                    + OBJC_IVAR____TtC8PaperKit10ResizeView_currentActiveHandle));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit10ResizeView_rotationGestureRecognizer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit10ResizeView_nudgeTimer);
}

@end