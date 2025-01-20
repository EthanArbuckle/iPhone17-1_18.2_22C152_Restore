@interface HandwritingReflowView
- (_TtC8PaperKit21HandwritingReflowView)initWithCoder:(id)a3;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didMoveToWindow;
- (void)drawingContinuation:(id)a3;
- (void)layoutSubviews;
- (void)longPress:(id)a3;
- (void)tap;
@end

@implementation HandwritingReflowView

- (_TtC8PaperKit21HandwritingReflowView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized HandwritingReflowView.init(coder:)();
}

- (void)didMoveToWindow
{
  v2 = self;
  HandwritingReflowView.didMoveToWindow()();
}

- (void)tap
{
  v2 = (void *)*((unsigned __int8 *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8PaperKit21HandwritingReflowView_isInReflowMode);
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit21HandwritingReflowView_isInReflowMode) = v2 ^ 1;
  id v3 = self;
  HandwritingReflowView.isInReflowMode.didset(v2);
}

- (void)drawingContinuation:(id)a3
{
  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = self;
  HandwritingReflowView.drawingContinuation(_:)(v4);
}

- (void)longPress:(id)a3
{
  v5 = (UILongPressGestureRecognizer *)a3;
  v4 = self;
  HandwritingReflowView.longPress(_:)(v5);
}

- (void)layoutSubviews
{
  v2 = self;
  HandwritingReflowView.layoutSubviews()();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  HandwritingReflowView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10.super.super.isa = specialized HandwritingReflowView.editMenuInteraction(_:menuFor:suggestedActions:)().super.super.isa;

  return v10.super.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit21HandwritingReflowView_reflowTextbox));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit21HandwritingReflowView_caret));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit21HandwritingReflowView_editMenuInteraction));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end