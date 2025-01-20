@interface TagView
- (BOOL)accessibilityActivate;
- (CGRect)accessibilityFrame;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityElements;
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityValue;
- (NSString)title;
- (NSString)tsaxAccessibilityLabelForReordering;
- (_TtC7NewsUI27TagView)initWithCoder:(id)a3;
- (_TtC7NewsUI27TagView)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityValue:(id)a3;
- (void)setTsaxAccessibilityLabelForReordering:(id)a3;
@end

@implementation TagView

- (NSString)tsaxAccessibilityLabelForReordering
{
  v2 = (char *)self + OBJC_IVAR____TtC7NewsUI27TagView_tsaxAccessibilityLabelForReordering;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1DFDFDCE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setTsaxAccessibilityLabelForReordering:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1DFDFDD20();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7NewsUI27TagView_tsaxAccessibilityLabelForReordering);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC7NewsUI27TagView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI27TagView *)sub_1DEE14890(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI27TagView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DEE1ECE4();
}

- (NSString)title
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI27TagView_titleLabel);
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    uint64_t v5 = v4;
    sub_1DFDFDD20();

    uint64_t v6 = (void *)sub_1DFDFDCE0();
    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v6 = 0;
  }
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI27TagView_contentAccessibilityElement));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  unint64_t v3 = TagView.accessibilityTraits.getter();

  return v3;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)sub_1DEE166D8(self, (uint64_t)a2, TagView.accessibilityElements.getter);
}

- (CGRect)accessibilityFrame
{
  v2 = self;
  double v3 = TagView.accessibilityFrame.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (NSString)accessibilityValue
{
  v2 = self;
  TagView.accessibilityValue.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    double v5 = (void *)sub_1DFDFDCE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1DFDFDD20();
    double v6 = self;
    a3 = (id)sub_1DFDFDCE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TagView *)&v8 setAccessibilityValue:a3];
}

- (NSArray)accessibilityUserInputLabels
{
  return (NSArray *)sub_1DEE166D8(self, (uint64_t)a2, (uint64_t (*)(void))TagView.accessibilityUserInputLabels.getter);
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  Swift::Bool v3 = TagView.accessibilityActivate()();

  return v3;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  uint64_t v3 = TagView.accessibilityCustomActions.getter();

  if (v3)
  {
    sub_1DE919914(0, (unint64_t *)&qword_1EBABAF70);
    uint64_t v4 = (void *)sub_1DFDFE200();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSArray *)v4;
}

@end