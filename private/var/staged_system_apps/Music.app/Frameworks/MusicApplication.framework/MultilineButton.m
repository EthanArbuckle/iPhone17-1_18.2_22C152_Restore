@interface MultilineButton
- (BOOL)isAccessibilityElement;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC16MusicApplication15MultilineButton)initWithCoder:(id)a3;
- (_TtC16MusicApplication15MultilineButton)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation MultilineButton

- (_TtC16MusicApplication15MultilineButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication15MultilineButton *)sub_4A21A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication15MultilineButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4A4A0C();
}

- (BOOL)isEnabled
{
  return sub_4A2BC4(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  v4 = self;
  sub_4A2C68(a3, (SEL *)&selRef_isEnabled, (SEL *)&selRef_setEnabled_);
}

- (BOOL)isHighlighted
{
  return sub_4A2BC4(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_4A2A60(a3);
}

- (BOOL)isSelected
{
  return sub_4A2BC4(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  sub_4A2C68(a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4A2D84();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_4A3010(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = self;
  if (!-[MultilineButton pointInside:withEvent:](v8, "pointInside:withEvent:", v7, x, y))
  {

    goto LABEL_5;
  }
  unsigned __int8 v9 = [(MultilineButton *)v8 isEnabled];

  if ((v9 & 1) == 0)
  {
LABEL_5:

    double v8 = 0;
  }

  return v8;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MultilineButton();
  id v2 = v3.receiver;
  [(MultilineButton *)&v3 tintColorDidChange];
  sub_4A3554();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MultilineButton();
  [(MultilineButton *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  id v2 = self;
  sub_4A332C();
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
  if (a3)
  {
    sub_AB6510();
    uint64_t v4 = self;
    NSString v5 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MultilineButton();
  [(MultilineButton *)&v7 setAccessibilityLabel:v5];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MultilineButton();
  [(MultilineButton *)&v4 setAccessibilityTraits:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15MultilineButton_borderColor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15MultilineButton_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15MultilineButton_backgroundImageView));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication15MultilineButton_activityIndicatorView);
}

@end