@interface FormatButton
- (BOOL)isAccessibilityElement;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityElements;
- (NSString)accessibilityHint;
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (NSString)accessibilityLanguage;
- (NSString)accessibilityValue;
- (NSString)ts_accessibilityElementHelp;
- (_TtC8NewsFeed12FormatButton)initWithCoder:(id)a3;
- (_TtC8NewsFeed12FormatButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (int64_t)accessibilityContainerType;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation FormatButton

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(FormatButton *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  sub_1C151F8FC();
}

- (_TtC8NewsFeed12FormatButton)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed12FormatButton *)FormatButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed12FormatButton)initWithCoder:(id)a3
{
  id v3 = a3;
  _s8NewsFeed12FormatButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  [(FormatButton *)v8 bounds];
  v13.origin.CGFloat x = UIEdgeInsetsInsetRect_0(v9);
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  BOOL v10 = CGRectContainsPoint(v13, v12);

  return v10;
}

- (BOOL)isSelected
{
  return sub_1C1383954(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return sub_1C1383954(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return sub_1C1383954(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed12FormatButton_formatLayoutView));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed12FormatButton_longPressGesture));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed12FormatButton_createMenuElementsBlock);
  sub_1BFC3E5C0(v3);
}

- (int64_t)accessibilityContainerType
{
  id v2 = self;
  int64_t v3 = FormatButton.accessibilityContainerType.getter();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  if (!*(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed12FormatButton_accessibilityRenderer))
    return 0;
  id v2 = self;
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
  id v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed12FormatButton_accessibilityRenderer);
  if (v2)
  {
    uint64_t v3 = self;
    swift_retain();
    uint64_t v4 = sub_1C0CDA1B4();

    swift_release();
    if (v4)
    {
      id v2 = (void *)sub_1C151EBAC();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v2 = 0;
    }
  }
  return (NSArray *)v2;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_1C1385320((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDAA2C);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1C1385320((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDADE0);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1C1385320((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDADF8);
}

- (NSString)ts_accessibilityElementHelp
{
  return (NSString *)sub_1C1385320((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDAE10);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1C1385320((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDAE28);
}

- (NSString)accessibilityLanguage
{
  return (NSString *)sub_1C1385320((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1C0CDAFD8);
}

- (unint64_t)accessibilityTraits
{
  if (!*(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed12FormatButton_accessibilityRenderer))
    return 0;
  id v2 = self;
  swift_retain();
  unint64_t v3 = sub_1C0CDB088();

  swift_release();
  return v3;
}

- (NSArray)accessibilityCustomActions
{
  id v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed12FormatButton_accessibilityRenderer);
  if (v2)
  {
    unint64_t v3 = self;
    swift_retain();
    uint64_t v4 = sub_1C0CDB3AC();

    swift_release();
    if (v4)
    {
      sub_1BFC39268(0, &qword_1EB85DFF0);
      id v2 = (void *)sub_1C151EBAC();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v2 = 0;
    }
  }
  return (NSArray *)v2;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = (void *)_s8NewsFeed12FormatButtonC22contextMenuInteraction_016configurationForF10AtLocationSo09UIContextF13ConfigurationCSgSo0lfG0C_So7CGPointVtF_0();

  return v7;
}

@end