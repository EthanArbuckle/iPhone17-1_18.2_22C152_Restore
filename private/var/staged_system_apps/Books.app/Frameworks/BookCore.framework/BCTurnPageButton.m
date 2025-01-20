@interface BCTurnPageButton
+ (id)leftButton;
+ (id)rightButton;
- (BCTurnPageButton)initWithCoder:(id)a3;
- (BCTurnPageButton)initWithFrame:(CGRect)a3;
- (BCTurnPageButtonAccessibilityDelegate)delegate;
- (BOOL)canBecomeFocused;
- (BOOL)hovering;
- (BOOL)pressed;
- (BOOL)useMaterialFill;
- (NSString)accessibilityLabel;
- (UIColor)fillColor;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)setDelegate:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setHovering:(BOOL)a3;
- (void)setPressed:(BOOL)a3;
- (void)setUseMaterialFill:(BOOL)a3;
@end

@implementation BCTurnPageButton

- (BOOL)useMaterialFill
{
  v2 = (BOOL *)self + OBJC_IVAR___BCTurnPageButton_useMaterialFill;
  swift_beginAccess();
  return *v2;
}

- (void)setUseMaterialFill:(BOOL)a3
{
  int v3 = a3;
  v5 = (char *)self + OBJC_IVAR___BCTurnPageButton_useMaterialFill;
  swift_beginAccess();
  int v6 = *v5;
  unsigned char *v5 = v3;
  if (v6 != v3)
  {
    v7 = self;
    sub_1DC2C8();
  }
}

- (BOOL)hovering
{
  v2 = (BOOL *)self + OBJC_IVAR___BCTurnPageButton_hovering;
  swift_beginAccess();
  return *v2;
}

- (void)setHovering:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR___BCTurnPageButton_hovering;
  swift_beginAccess();
  BOOL *v5 = a3;
  int v6 = self;
  sub_1DAF74();
}

- (BOOL)pressed
{
  v2 = (BOOL *)self + OBJC_IVAR___BCTurnPageButton_pressed;
  swift_beginAccess();
  return *v2;
}

- (void)setPressed:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (char *)self + OBJC_IVAR___BCTurnPageButton_pressed;
  swift_beginAccess();
  unsigned char *v5 = v3;
  int v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___BCTurnPageButton_pressedLayer);
  if (v6)
  {
    double v7 = 0.0;
    if (v3) {
      *(float *)&double v7 = 1.0;
    }
    [v6 setOpacity:v7];
  }
}

- (UIColor)fillColor
{
  v2 = (id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___BCTurnPageButton_fillColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setFillColor:(id)a3
{
  id v5 = a3;
  int v6 = self;
  sub_1DB6F8(a3);
}

- (BCTurnPageButtonAccessibilityDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BCTurnPageButtonAccessibilityDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

+ (id)leftButton
{
  type metadata accessor for TurnPageButton();
  v2 = [(id)swift_getObjCClassFromMetadata() buttonWithType:0];
  v2[OBJC_IVAR___BCTurnPageButton_direction] = 0;
  sub_1DBC08();

  return v2;
}

+ (id)rightButton
{
  type metadata accessor for TurnPageButton();
  v2 = [(id)swift_getObjCClassFromMetadata() buttonWithType:0];
  v2[OBJC_IVAR___BCTurnPageButton_direction] = 1;
  sub_1DBC08();

  return v2;
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  double v7 = self;
  sub_1F2610();
  swift_unknownObjectRelease();
  sub_1DC134();

  sub_1B09C4((uint64_t)&v8);
}

- (BCTurnPageButton)initWithFrame:(CGRect)a3
{
  return (BCTurnPageButton *)TurnPageButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BCTurnPageButton)initWithCoder:(id)a3
{
  return (BCTurnPageButton *)TurnPageButton.init(coder:)(a3);
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR___BCTurnPageButton_delegate;

  sub_19ECC4((uint64_t)v3);
}

- (NSString)accessibilityLabel
{
  v2 = self;
  TurnPageButton.accessibilityLabel.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1F2160();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)accessibilityElementDidBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TurnPageButton();
  v2 = (char *)v5.receiver;
  [(BCTurnPageButton *)&v5 accessibilityElementDidBecomeFocused];
  uint64_t v3 = &v2[OBJC_IVAR___BCTurnPageButton_hovering];
  swift_beginAccess();
  *uint64_t v3 = 1;
  sub_1DAF74();
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong updateTurnPageButtonsForFocusChange];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)accessibilityElementDidLoseFocus
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TurnPageButton();
  v2 = (char *)v5.receiver;
  [(BCTurnPageButton *)&v5 accessibilityElementDidLoseFocus];
  uint64_t v3 = &v2[OBJC_IVAR___BCTurnPageButton_hovering];
  swift_beginAccess();
  *uint64_t v3 = 0;
  sub_1DAF74();
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong updateTurnPageButtonsForFocusChange];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

@end