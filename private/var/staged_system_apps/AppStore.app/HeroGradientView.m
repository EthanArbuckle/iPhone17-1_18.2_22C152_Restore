@interface HeroGradientView
- (_TtC8AppStore16HeroGradientView)initWithCoder:(id)a3;
- (_TtC8AppStore16HeroGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeroGradientView

- (_TtC8AppStore16HeroGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore16HeroGradientView *)sub_10053F15C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore16HeroGradientView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore16HeroGradientView_gradient;
  id v6 = objc_allocWithZone((Class)CAGradientLayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore16HeroGradientView_wantsTopGradient) = 1;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore16HeroGradientView_wantsBottomGradient) = 1;

  result = (_TtC8AppStore16HeroGradientView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HeroGradientView();
  v2 = (char *)v4.receiver;
  [(HeroGradientView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore16HeroGradientView_gradient];
  [v2 bounds];
  [v3 setFrame:];
  sub_10053F4C0();
}

- (void).cxx_destruct
{
}

@end