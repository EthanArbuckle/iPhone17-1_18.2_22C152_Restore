@interface FormatLayoutView
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)isAccessibilityElement;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityElements;
- (NSString)accessibilityHint;
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (NSString)accessibilityLanguage;
- (NSString)accessibilityValue;
- (NSString)ts_accessibilityElementHelp;
- (_TtC8NewsFeed16FormatLayoutView)initWithCoder:(id)a3;
- (_TtC8NewsFeed16FormatLayoutView)initWithFrame:(CGRect)a3;
- (int64_t)accessibilityContainerType;
- (unint64_t)accessibilityTraits;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation FormatLayoutView

- (void)layoutSubviews
{
  v2 = self;
  FormatLayoutView.layoutSubviews()();
}

- (_TtC8NewsFeed16FormatLayoutView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed16FormatLayoutView *)sub_1BFE6C610(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  v2 = self;
  FormatLayoutView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_onSizeInvalidation));
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_onKeyboardWillShow));
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_onKeyboardWillHide));
  swift_release();
  sub_1BFEE4C00((uint64_t)self + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_feedItem, &qword_1EB873480, type metadata accessor for FeedItem);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_tapGesture);
}

- (_TtC8NewsFeed16FormatLayoutView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1301300();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = [(FormatLayoutView *)v9 subviews];
  sub_1BFC39268(0, (unint64_t *)&qword_1EB87A2C0);
  unint64_t v11 = sub_1C151EBCC();

  id v12 = v8;
  v13 = v9;
  LOBYTE(v4) = sub_1C12FDE08(v11, v13, v4, x, y);
  swift_bridgeObjectRelease();

  return v4 & 1;
}

- (int64_t)accessibilityContainerType
{
  v2 = self;
  int64_t v3 = FormatLayoutView.accessibilityContainerType.getter();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_accessibilityRenderer))
    return 0;
  v2 = self;
  swift_retain();
  uint64_t v3 = sub_1C0CD9F5C();
  __int16 v5 = v4;
  swift_release();

  if ((v5 & 0x100) != 0) {
    return 0;
  }
  else {
    return v5 & (v3 != 0);
  }
}

- (NSArray)accessibilityElements
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_accessibilityRenderer);
  if (v2)
  {
    uint64_t v3 = self;
    swift_retain();
    uint64_t v4 = sub_1C0CDA1B4();

    swift_release();
    if (v4)
    {
      v2 = (void *)sub_1C151EBAC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSArray *)v2;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_1C12FC154((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDAA2C);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1C12FC154((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDADE0);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1C12FC154((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDADF8);
}

- (NSString)ts_accessibilityElementHelp
{
  return (NSString *)sub_1C12FC154((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDAE10);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1C12FC154((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDAE28);
}

- (NSString)accessibilityLanguage
{
  return (NSString *)sub_1C12FC154((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDAFD8);
}

- (unint64_t)accessibilityTraits
{
  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_accessibilityRenderer))
    return 0;
  v2 = self;
  swift_retain();
  unint64_t v3 = sub_1C0CDB088();

  swift_release();
  return v3;
}

- (NSArray)accessibilityCustomActions
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_accessibilityRenderer);
  if (v2)
  {
    unint64_t v3 = self;
    swift_retain();
    uint64_t v4 = sub_1C0CDB3AC();

    swift_release();
    if (v4)
    {
      sub_1BFC39268(0, &qword_1EB85DFF0);
      v2 = (void *)sub_1C151EBAC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSArray *)v2;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = objc_msgSend(v7, sel_view);
  if (v9)
  {
    id v10 = v9;
    type metadata accessor for FormatButton();
    unint64_t v11 = (void *)swift_dynamicCastClass();
    if (!v11) {
  }
    }
  else
  {
    unint64_t v11 = 0;
  }

  return v11 != 0;
}

@end