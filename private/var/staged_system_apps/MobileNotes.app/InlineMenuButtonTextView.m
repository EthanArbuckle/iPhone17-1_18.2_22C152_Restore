@interface InlineMenuButtonTextView
- (BOOL)accessibilityActivate;
- (CGPoint)accessibilityActivationPoint;
- (NSArray)accessibilityElements;
- (NSAttributedString)accessibilityAttributedValue;
- (NSAttributedString)attributedText;
- (NSString)accessibilityHint;
- (UIButton)filterButton;
- (_TtC11MobileNotes24InlineMenuButtonTextView)initWithCoder:(id)a3;
- (_TtC11MobileNotes24InlineMenuButtonTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setAttributedText:(id)a3;
@end

@implementation InlineMenuButtonTextView

- (_TtC11MobileNotes24InlineMenuButtonTextView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_menu) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_preservesMenuLineHeight) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_fontSymbolicTraits;
  *(_DWORD *)v3 = 0;
  v3[4] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView____lazy_storage___menuAttachment) = 0;

  result = (_TtC11MobileNotes24InlineMenuButtonTextView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSAttributedString)attributedText
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(InlineMenuButtonTextView *)&v4 attributedText];

  return v2;
}

- (void)setAttributedText:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1004A0984(a3);
}

- (NSArray)accessibilityElements
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v4 = self;
  if (UIAccessibilityIsVoiceOverRunning()
    || (v9.receiver = v4,
        v9.super_class = ObjectType,
        (id v5 = [(InlineMenuButtonTextView *)&v9 accessibilityElements]) == 0))
  {

    v7.super.isa = 0;
  }
  else
  {
    v6 = v5;
    static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }

  return (NSArray *)v7.super.isa;
}

- (NSAttributedString)accessibilityAttributedValue
{
  v2 = self;
  id v3 = sub_1004A1618();

  return (NSAttributedString *)v3;
}

- (NSString)accessibilityHint
{
  v2 = self;
  sub_1004A1CB4();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (unint64_t)accessibilityTraits
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = self;
  if (UIAccessibilityIsVoiceOverRunning() && (NSString v5 = (void *)sub_1004A1924(), v5, v5))
  {
    unint64_t v6 = UIAccessibilityTraitButton;
  }
  else
  {
    v8.receiver = v4;
    v8.super_class = ObjectType;
    unint64_t v6 = [(InlineMenuButtonTextView *)&v8 accessibilityTraits];
  }

  return v6;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(InlineMenuButtonTextView *)&v4 setAccessibilityTraits:a3];
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  sub_1004A1E90();
  char v4 = v3;

  return v4 & 1;
}

- (CGPoint)accessibilityActivationPoint
{
  ObjectType = (objc_class *)swift_getObjectType();
  char v4 = self;
  NSString v5 = (void *)sub_1004A1924();
  if (v5)
  {
    unint64_t v6 = v5;
    [v5 accessibilityActivationPoint];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    v15.receiver = v4;
    v15.super_class = ObjectType;
    [(InlineMenuButtonTextView *)&v15 accessibilityActivationPoint];
    double v8 = v11;
    double v10 = v12;
  }
  double v13 = v8;
  double v14 = v10;
  result.y = v14;
  result.x = v13;
  return result;
}

- (UIButton)filterButton
{
  v2 = self;
  char v3 = (void *)sub_1004A1924();

  return (UIButton *)v3;
}

- (_TtC11MobileNotes24InlineMenuButtonTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  CGPoint result = (_TtC11MobileNotes24InlineMenuButtonTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_textStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_foregroundColor));
  char v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView____lazy_storage___menuAttachment);
}

@end