@interface FormFillingView
- (_TtC8PaperKit15FormFillingView)initWithCoder:(id)a3;
- (_TtC8PaperKit15FormFillingView)initWithFrame:(CGRect)a3;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)doubleTap:(id)a3;
- (void)tap:(id)a3;
@end

@implementation FormFillingView

- (_TtC8PaperKit15FormFillingView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized FormFillingView.init(coder:)();
}

- (void)tap:(id)a3
{
  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  FormFillingView.tap(_:)(v4);
}

- (void)doubleTap:(id)a3
{
  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  FormFillingView.doubleTap(_:)(v4);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  FormFillingView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10.super.super.isa = specialized FormFillingView.editMenuInteraction(_:menuFor:suggestedActions:)().super.super.isa;

  return v10.super.super.isa;
}

- (_TtC8PaperKit15FormFillingView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit15FormFillingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit15FormFillingView_editMenuInteraction));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

@end