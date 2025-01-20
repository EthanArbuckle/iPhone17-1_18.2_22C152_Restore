@interface SocialButton
- (BOOL)isAccessibilityElement;
- (BOOL)isHighlighted;
- (CGRect)frame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC16MusicApplication12SocialButton)initWithCoder:(id)a3;
- (_TtC16MusicApplication12SocialButton)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation SocialButton

- (_TtC16MusicApplication12SocialButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12SocialButton *)sub_5404FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12SocialButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_542084();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SocialButton();
  return [(SocialButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for SocialButton();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  char v7 = [(SocialButton *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(SocialButton *)&v8 setHighlighted:v3];
  sub_540E8C(v7);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SocialButton();
  [(SocialButton *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v8 = (objc_class *)type metadata accessor for SocialButton();
  v11.receiver = self;
  v11.super_class = v8;
  objc_super v9 = self;
  [(SocialButton *)&v11 frame];
  v10.receiver = v9;
  v10.super_class = v8;
  -[SocialButton setFrame:](&v10, "setFrame:", x, y, width, height);
  sub_5411D4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  sub_54130C(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SocialButton();
  double v2 = (char *)v5.receiver;
  [(SocialButton *)&v5 tintColorDidChange];
  unint64_t v3 = sub_A611C((uint64_t)_swiftEmptyArrayStorage);
  double v4 = (unint64_t *)&v2[OBJC_IVAR____TtC16MusicApplication12SocialButton_cachedBackgroundImagesForAppearances];
  swift_beginAccess();
  *double v4 = v3;
  swift_bridgeObjectRelease();
  sub_54186C();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SocialButton();
  double v2 = (char *)v13.receiver;
  [(SocialButton *)&v13 layoutSubviews];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v2 music_inheritedLayoutInsets];
  [*(id *)&v2[OBJC_IVAR____TtC16MusicApplication12SocialButton_titleCompositingView] setFrame:UIEdgeInsetsInsetRect(v4, v6, v8, v10, v11, v12)];
  [*(id *)&v2[OBJC_IVAR____TtC16MusicApplication12SocialButton_backgroundImageView] setFrame:v4, v6, v8, v10];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = self;
  if (!-[SocialButton pointInside:withEvent:](v8, "pointInside:withEvent:", v7, x, y))
  {

    goto LABEL_5;
  }
  unsigned __int8 v9 = [(SocialButton *)v8 isEnabled];

  if ((v9 & 1) == 0)
  {
LABEL_5:

    double v8 = 0;
  }

  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SocialButton();
  [(SocialButton *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  if (*(void *)(*(char **)((char *)&self->super.super.super.super.isa
                            + OBJC_IVAR____TtC16MusicApplication12SocialButton_titleCompositingView)
                 + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text
                 + 8))
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    sub_AB6510();
    objc_super v4 = self;
    NSString v5 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SocialButton();
  [(SocialButton *)&v7 setAccessibilityLabel:v5];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SocialButton();
  [(SocialButton *)&v4 setAccessibilityTraits:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12SocialButton_backgroundImageView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication12SocialButton_titleCompositingView);
}

@end