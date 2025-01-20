@interface TTRIRemindersListSectionHeader
- (BOOL)floating;
- (BOOL)isAccessibilityElement;
- (NSArray)accessibilityElements;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (_TtC9Reminders30TTRIRemindersListSectionHeader)initWithCoder:(id)a3;
- (_TtC9Reminders30TTRIRemindersListSectionHeader)initWithReuseIdentifier:(id)a3;
- (void)didTap:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setFloating:(BOOL)a3;
@end

@implementation TTRIRemindersListSectionHeader

- (_TtC9Reminders30TTRIRemindersListSectionHeader)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  sub_100261B3C(v3, v4);
  return result;
}

- (_TtC9Reminders30TTRIRemindersListSectionHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10026347C();
}

- (BOOL)floating
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TTRIRemindersListSectionHeader *)&v3 floating];
}

- (void)setFloating:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10026281C(a3);
}

- (void)didTap:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v5 = a3;
    v6 = self;
    sub_1003885B0((uint64_t)v6);

    swift_unknownObjectRelease();
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_100262E9C(self, (uint64_t)a2, (void (*)(void))sub_100262C8C);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_100262E9C(self, (uint64_t)a2, (void (*)(void))sub_100262F1C);
}

- (void)setAccessibilityHint:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TTRIRemindersListSectionHeader *)&v8 setAccessibilityHint:a3];
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_delegate);
  sub_100050E5C((uint64_t)self + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_title, (uint64_t)v3);
  sub_1001CF7EC((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_1001CF858);
  sub_1002635C8((uint64_t)self + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_sectionID);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_titlesContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_titlesTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_titlesBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_topSeparatorLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_contentViewBottomToTopSeparatorBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIRemindersListSectionHeader_tapGestureRecognizer));
}

@end