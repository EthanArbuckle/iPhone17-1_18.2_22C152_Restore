@interface ThirdPartyMediaShadowEffectView
+ (Class)layerClass;
- (_TtC7Journal31ThirdPartyMediaShadowEffectView)initWithCoder:(id)a3;
- (_TtC7Journal31ThirdPartyMediaShadowEffectView)initWithFrame:(CGRect)a3;
@end

@implementation ThirdPartyMediaShadowEffectView

+ (Class)layerClass
{
  type metadata accessor for ThirdPartyMediaShadowEffectView.Layer();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC7Journal31ThirdPartyMediaShadowEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal31ThirdPartyMediaShadowEffectView *)sub_100587060(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal31ThirdPartyMediaShadowEffectView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC7Journal31ThirdPartyMediaShadowEffectView_contentView;
  id v5 = objc_allocWithZone((Class)UIView);
  v6 = self;
  v7 = (objc_class *)[v5 init];
  *(Class *)((char *)&self->super.super.super.isa + v4) = v7;

  type metadata accessor for ThirdPartyMediaShadowEffectView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal31ThirdPartyMediaShadowEffectView_contentView));
}

@end