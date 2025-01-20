@interface _UIMagicMorphClippingView
- (_TtC5UIKit25_UIMagicMorphClippingView)initWithCoder:(id)a3;
- (_TtC5UIKit25_UIMagicMorphClippingView)initWithFrame:(CGRect)a3;
- (id)_parentTraitEnvironment;
@end

@implementation _UIMagicMorphClippingView

- (_TtC5UIKit25_UIMagicMorphClippingView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5UIKit25_UIMagicMorphClippingView_transformView;
  type metadata accessor for _UIMagicMorphTransformView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC5UIKit25_UIMagicMorphClippingView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (_TtC5UIKit25_UIMagicMorphClippingView)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit25_UIMagicMorphClippingView *)sub_185B11728(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_parentTraitEnvironment
{
  v2 = self;
  id v3 = sub_185B1187C();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit25_UIMagicMorphClippingView_transformView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5UIKit25_UIMagicMorphClippingView_transformViewLayer);
}

@end