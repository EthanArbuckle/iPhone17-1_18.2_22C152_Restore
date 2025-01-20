@interface FMListFooterActionButton
- (BOOL)isAccessibilityElement;
- (BOOL)isHighlighted;
- (NSString)accessibilityLabel;
- (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton)init;
- (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton)initWithCoder:(id)a3;
- (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)addAction:(id)a3 forControlEvents:(unint64_t)a4;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMListFooterActionButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  return [(FMListFooterActionButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  id v4 = v8.receiver;
  [(FMListFooterActionButton *)&v8 setHighlighted:v3];
  LODWORD(v3) = [v4 isHighlighted];
  v5 = self;
  v6 = &selRef_separatorColor;
  if (!v3) {
    v6 = &selRef_clearColor;
  }
  id v7 = [v5 *v6];
  [v4 setBackgroundColor:v7];
}

- (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton)init
{
  return (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton *)sub_10041AF38();
}

- (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10041C77C();
}

- (void)addAction:(id)a3 forControlEvents:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_10041BB20(v6, a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  id v4 = a3;
  id v5 = v6.receiver;
  [(FMListFooterActionButton *)&v6 traitCollectionDidChange:v4];
  sub_10041BC8C();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100006060(0, (unint64_t *)&qword_1006B0290);
  sub_1000C8370();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  objc_super v6 = self;
  id v13 = a4;
  [(FMListFooterActionButton *)v6 setHighlighted:0];
  uint64_t v7 = swift_bridgeObjectRetain();
  objc_super v8 = (void *)sub_1000E78B8(v7);
  swift_bridgeObjectRelease();
  if (v8)
  {
    [v8 locationInView:v6];
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    [(FMListFooterActionButton *)v6 bounds];
    v15.x = v10;
    v15.y = v12;
    if (CGRectContainsPoint(v16, v15)) {
      [(FMListFooterActionButton *)v6 sendActionsForControlEvents:64];
    }
  }

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_gestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_separatorLeadingConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_separatorLeadingAXConstraint);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  [(FMListFooterActionButton *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_textLabel);
  BOOL v3 = self;
  id v4 = [v2 accessibilityLabel];
  if (v4)
  {
    id v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v4 = self;
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  [(FMListFooterActionButton *)&v7 setAccessibilityLabel:v5];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  [(FMListFooterActionButton *)&v4 setAccessibilityTraits:a3];
}

@end