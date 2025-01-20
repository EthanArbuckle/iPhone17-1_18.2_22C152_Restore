@interface SocialProfileHeaderRow
- (BOOL)isAccessibilityElement;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC16MusicApplication22SocialProfileHeaderRow)init;
- (_TtC16MusicApplication22SocialProfileHeaderRow)initWithCoder:(id)a3;
- (_TtC16MusicApplication22SocialProfileHeaderRow)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SocialProfileHeaderRow

- (_TtC16MusicApplication22SocialProfileHeaderRow)init
{
  return (_TtC16MusicApplication22SocialProfileHeaderRow *)sub_4A4B40();
}

- (_TtC16MusicApplication22SocialProfileHeaderRow)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4A616C();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SocialProfileHeaderRow();
  return [(SocialProfileHeaderRow *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for SocialProfileHeaderRow();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  char v7 = [(SocialProfileHeaderRow *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(SocialProfileHeaderRow *)&v8 setHighlighted:v3];
  sub_4A51DC(v7);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4A52D8();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = self;
  if (!-[SocialProfileHeaderRow pointInside:withEvent:](v8, "pointInside:withEvent:", v7, x, y))
  {

    goto LABEL_5;
  }
  unsigned __int8 v9 = [(SocialProfileHeaderRow *)v8 isEnabled];

  if ((v9 & 1) == 0)
  {
LABEL_5:

    objc_super v8 = 0;
  }

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  [(SocialProfileHeaderRow *)v4 intrinsicContentSize];
  double v6 = v5;
  sub_86E18();
  char v7 = sub_AB11F0();

  if (width >= v6) {
    double v8 = v6;
  }
  else {
    double v8 = width;
  }
  if (v7) {
    double v8 = v6;
  }
  double v9 = 48.0;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_4A57F4();

  double v4 = 48.0;
  double v5 = v3;
  result.height = v4;
  result.double width = v5;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_4A58D0((uint64_t)a3);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SocialProfileHeaderRow();
  [(SocialProfileHeaderRow *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  if (*(void *)(*(char **)((char *)&self->super.super.super.super.isa
                            + OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_titleCompositingView)
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
}

- (NSString)accessibilityValue
{
  NSString v2 = self;
  sub_4A5BF0();
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

- (void)setAccessibilityValue:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SocialProfileHeaderRow();
  [(SocialProfileHeaderRow *)&v4 setAccessibilityTraits:a3];
}

- (_TtC16MusicApplication22SocialProfileHeaderRow)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC16MusicApplication22SocialProfileHeaderRow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_chevronImageView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_titleCompositingView);
}

@end