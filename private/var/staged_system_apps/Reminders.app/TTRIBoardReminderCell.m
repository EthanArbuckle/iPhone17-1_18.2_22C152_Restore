@interface TTRIBoardReminderCell
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityElements;
- (NSString)accessibilityIdentifier;
- (_TtC9Reminders21TTRIBoardReminderCell)initWithCoder:(id)a3;
- (_TtC9Reminders21TTRIBoardReminderCell)initWithFrame:(CGRect)a3;
- (id)_accessibilityInternalTextLinks;
- (unint64_t)_maskedCornersForSystemBackgroundView;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)prepareForReuse;
- (void)setAccessibilityIdentifier:(id)a3;
@end

@implementation TTRIBoardReminderCell

- (_TtC9Reminders21TTRIBoardReminderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders21TTRIBoardReminderCell *)sub_100270370(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders21TTRIBoardReminderCell)initWithCoder:(id)a3
{
  return (_TtC9Reminders21TTRIBoardReminderCell *)sub_100270740(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1002708F0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100271250();
}

- (void)applyLayoutAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  uint64_t v5 = (char *)v8.receiver;
  [(TTRIBoardReminderCell *)&v8 applyLayoutAttributes:v4];
  type metadata accessor for TTRBoardColumnItemLayoutAttributes();
  uint64_t v6 = swift_dynamicCastClass();
  if (v6)
  {
    v7 = (void *)(v6 + direct field offset for TTRBoardColumnItemLayoutAttributes.backgroundRoundedCorners);
    swift_beginAccess();
    *(void *)&v5[OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_roundedCorners] = *v7;
  }
}

- (unint64_t)_maskedCornersForSystemBackgroundView
{
  v2 = self;
  CACornerMask v3 = TTRRectCorners.cornerMask(layoutDirection:isFlipped:)((UIUserInterfaceLayoutDirection)[(TTRIBoardReminderCell *)v2 effectiveUserInterfaceLayoutDirection], 1);

  return v3;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  double v10 = sub_100271588(width, height, a4, a5);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = self;
  id v6 = [(TTRIBoardReminderCell *)v5 contentView];
  [v6 sizeThatFits:width, height];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  v2 = self;
  sub_1002717A4();
}

- (NSString)accessibilityIdentifier
{
  v2 = self;
  sub_1002741A8();
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

- (void)setAccessibilityIdentifier:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TTRIBoardReminderCell *)&v8 setAccessibilityIdentifier:a3];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = sub_100274570();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  char v3 = sub_1002749D8();

  return v3 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  char v3 = (_TtC9Reminders21TTRIBoardReminderCell *)[(TTRIBoardReminderCell *)v2 contentView];
  type metadata accessor for TTRIBoardReminderCellContentView();
  if (swift_dynamicCastClass())
  {
    NSArray v4 = (_TtC9Reminders21TTRIBoardReminderCell *)UIView.firstResponderDescendant.getter();

    if (!v4)
    {
      unsigned __int8 v5 = 0;
      goto LABEL_7;
    }
    unsigned __int8 v5 = [(TTRIBoardReminderCell *)v4 resignFirstResponder];
    char v3 = v4;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  v2 = v3;
LABEL_7:

  return v5;
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  unint64_t v3 = sub_100275198();

  if (v3)
  {
    sub_1000368FC(0, (unint64_t *)&unk_10078E660);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (id)_accessibilityInternalTextLinks
{
  v2 = self;
  id v3 = [(TTRIBoardReminderCell *)v2 contentView];
  type metadata accessor for TTRIBoardReminderCellContentView();
  if (swift_dynamicCastClass()) {
    sub_1004F7E60();
  }

  sub_1000368FC(0, &qword_100794B18);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_delegate);
  swift_release();
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_viewModelState, (uint64_t *)&unk_10079F390);
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_titleModule, &qword_100794B30);
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_notesModule, &qword_100794B38);
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_autoCompleteModule, &qword_100794B40);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders21TTRIBoardReminderCell_customAccessibilityElement);
}

@end