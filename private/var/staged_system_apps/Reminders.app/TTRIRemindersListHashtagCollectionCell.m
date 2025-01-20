@interface TTRIRemindersListHashtagCollectionCell
+ (Class)containerViewClass;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityElements;
- (_TtC9Reminders38TTRIRemindersListHashtagCollectionCell)initWithCoder:(id)a3;
- (_TtC9Reminders38TTRIRemindersListHashtagCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)dealloc;
- (void)hashtagButtonAction:(id)a3;
- (void)layoutSubviews;
- (void)ttrAccessibilityServicesDidChange;
@end

@implementation TTRIRemindersListHashtagCollectionCell

+ (Class)containerViewClass
{
  type metadata accessor for TTRIMarginTransferringContainerStackView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC9Reminders38TTRIRemindersListHashtagCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC9Reminders38TTRIRemindersListHashtagCollectionCell *)sub_100648F78(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders38TTRIRemindersListHashtagCollectionCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10064D19C();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6[3] = ObjectType;
  v6[0] = self;
  v4 = self;
  static UIAccessibility.removeAccessibilityStatusChangeObserver(_:)();
  sub_100038CD8((uint64_t)v6);
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(TTRIRemindersListHashtagCollectionCell *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_delegate]);
  sub_10003B6F8((uint64_t)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_viewModel], (uint64_t *)&unk_1007AD380);

  sub_10064D3F4(*(void **)&self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_hashtagSelector], *(void **)&self->delegate[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_hashtagSelector]);
  id v3 = &self->NUITableViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders38TTRIRemindersListHashtagCollectionCell_internalSelection];
  uint64_t v4 = type metadata accessor for REMHashtagLabelSpecifier();
  objc_super v5 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006497A4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v5 = self;
  sub_100649880(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)hashtagButtonAction:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    objc_super v5 = self;
  }
  sub_10064ADC0((uint64_t)v6);

  sub_10003B6F8((uint64_t)v6, &qword_100788D60);
}

- (NSArray)accessibilityElements
{
  v2 = self;
  id v3 = sub_10064B344();

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

- (void)ttrAccessibilityServicesDidChange
{
  v2 = self;
  sub_10064A0E8();
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double width = a4.width;
  id v7 = a3;
  double v8 = self;
  sub_10064D2B8(v7, width);
}

@end