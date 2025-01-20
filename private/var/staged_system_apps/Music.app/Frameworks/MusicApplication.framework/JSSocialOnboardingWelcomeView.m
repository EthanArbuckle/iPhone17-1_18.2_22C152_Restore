@interface JSSocialOnboardingWelcomeView
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC16MusicApplication29JSSocialOnboardingWelcomeView)initWithCoder:(id)a3;
- (_TtC16MusicApplication29JSSocialOnboardingWelcomeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
@end

@implementation JSSocialOnboardingWelcomeView

- (_TtC16MusicApplication29JSSocialOnboardingWelcomeView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication29JSSocialOnboardingWelcomeView *)JSSocialOnboardingWelcomeView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication29JSSocialOnboardingWelcomeView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication29JSSocialOnboardingWelcomeViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(JSSocialOnboardingWelcomeView *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  v2 = self;
  JSSocialOnboardingWelcomeView.accessibilityLabel.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_AB6510();
    v6 = self;
    a3 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(JSSocialOnboardingWelcomeView *)&v8 setAccessibilityLabel:a3];
}

- (void)layoutSubviews
{
  v2 = self;
  JSSocialOnboardingWelcomeView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  NSString v5 = self;
  double v6 = JSSocialOnboardingWelcomeView.sizeThatFits(_:)(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_artwork));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_textStackView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication29JSSocialOnboardingWelcomeView_imageArtworkCatalog);
}

@end