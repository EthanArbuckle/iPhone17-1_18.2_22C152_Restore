@interface FormatAccessibilityShadowElement
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (NSArray)accessibilityCustomActions;
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (NSString)accessibilityLanguage;
- (NSString)accessibilityValue;
- (NSString)ts_accessibilityElementHelp;
- (_TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement)init;
- (_TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement)initWithAccessibilityContainer:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation FormatAccessibilityShadowElement

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_1C0CDB6E4(self, (uint64_t)a2, (void (*)(uint64_t, uint64_t))sub_1C12FD1C0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1C0CDB6E4(self, (uint64_t)a2, (void (*)(uint64_t, uint64_t))sub_1C12FD394);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1C0CDB6E4(self, (uint64_t)a2, (void (*)(uint64_t, uint64_t))sub_1C12FD568);
}

- (NSString)ts_accessibilityElementHelp
{
  return (NSString *)sub_1C0CDB6E4(self, (uint64_t)a2, (void (*)(uint64_t, uint64_t))sub_1C12FD73C);
}

- (NSString)accessibilityLanguage
{
  v2 = self;
  sub_1C0CDB9BC();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  unint64_t v3 = sub_1C0CDB088();

  return v3;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  uint64_t v3 = sub_1C0CDB3AC();

  if (v3)
  {
    sub_1BFC39268(0, &qword_1EB85DFF0);
    uint64_t v4 = (void *)sub_1C151EBAC();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSArray *)v4;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = MEMORY[0x1C18C9C60](*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement_accessibilityRenderer)+ 72, a2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    v5 = self;
    objc_msgSend(v4, sel_accessibilityFrame);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = 0.0;
    double v13 = 0.0;
    double v7 = 0.0;
    double v9 = 0.0;
  }
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (_TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1C151FF3C();
  swift_unknownObjectRelease();
  CGRect result = (_TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement)init
{
  CGRect result = (_TtC8NewsFeedP33_DD60186E3570D2ADA3A82D30FAA22DCC32FormatAccessibilityShadowElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end