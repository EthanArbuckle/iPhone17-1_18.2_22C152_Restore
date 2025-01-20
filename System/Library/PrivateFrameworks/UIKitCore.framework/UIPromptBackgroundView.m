@interface UIPromptBackgroundView
- (_TtC5UIKit22UIPromptBackgroundView)initWithCoder:(id)a3;
- (_TtC5UIKit22UIPromptBackgroundView)initWithFrame:(CGRect)a3;
- (double)_cornerRadius;
- (void)_setCornerRadius:(double)a3;
- (void)layoutSubviews;
@end

@implementation UIPromptBackgroundView

- (_TtC5UIKit22UIPromptBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1859989AC();
}

- (double)_cornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIPromptBackgroundView();
  [(UIView *)&v3 _cornerRadius];
  return result;
}

- (void)_setCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UIPromptBackgroundView();
  id v4 = v5.receiver;
  [(UIView *)&v5 _setCornerRadius:a3];
  sub_185994CE8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_185994DC8();
}

- (_TtC5UIKit22UIPromptBackgroundView)initWithFrame:(CGRect)a3
{
  double result = (_TtC5UIKit22UIPromptBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.bottom
                 + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[8] = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.top
                    + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[9] = v3;
  __int16 v9 = *(_WORD *)((char *)&self->super._layer + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  long long v4 = *(_OWORD *)((char *)&self->super._gestureRecognizers
                 + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[4] = *(_OWORD *)((char *)&self->super._subviewCache + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[5] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration + 16);
  v8[6] = *(_OWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[7] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[1] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super._traitChangeRegistry
                 + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[2] = *(_OWORD *)((char *)&self->super._cachedTraitCollection
                    + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[3] = v7;
  sub_1859938D0((uint64_t)v8);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_latencyEffectView));
}

@end