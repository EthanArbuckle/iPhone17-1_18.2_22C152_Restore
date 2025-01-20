@interface MediaShowcasingToolbar
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI22MediaShowcasingToolbar)initWithCoder:(id)a3;
- (_TtC8VideosUI22MediaShowcasingToolbar)initWithFrame:(CGRect)a3;
@end

@implementation MediaShowcasingToolbar

- (_TtC8VideosUI22MediaShowcasingToolbar)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI22MediaShowcasingToolbar *)sub_1E361EECC();
}

- (_TtC8VideosUI22MediaShowcasingToolbar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E361F5CC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1E36215E4();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_onMutePressed));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState);
  double v4 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState);
  double v5 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState);
  double v6 = *(_UITraitChangeRegistry **)((char *)&self->super._traitChangeRegistry
                                  + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState);
  double v7 = *(NSArray **)((char *)&self->super._subviewCache
                   + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState);
  objc_release(*(id *)((char *)&self->super._layerRetained
                     + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState));

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar____lazy_storage___stackView));
  swift_release();
  double v8 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_navigationItem);
}

@end