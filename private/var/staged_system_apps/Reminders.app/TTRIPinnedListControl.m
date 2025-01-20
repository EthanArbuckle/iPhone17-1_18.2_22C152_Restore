@interface TTRIPinnedListControl
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (BOOL)isHighlighted;
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (BOOL)isSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityElements;
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (_TtC9Reminders21TTRIPinnedListControl)initWithCoder:(id)a3;
- (_TtC9Reminders21TTRIPinnedListControl)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setAccessibilityCustomActions:(id)isa;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation TTRIPinnedListControl

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v2 = (char *)v12.receiver;
  [(TTRIPinnedListControl *)&v12 layoutSubviews];
  [v2 bounds];
  v7 = *(void **)&v2[OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_gradientBackgroundView];
  if (v7)
  {
    double v8 = v3;
    double v9 = v4;
    double v10 = v5;
    double v11 = v6;
    [v7 setFrame:];
    [*(id *)&v2[OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_grid] setFrame:v8, v9, v10, v11];
  }
  else
  {
    __break(1u);
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TTRIPinnedListControl *)&v3 tintColorDidChange];
  sub_10002D748();
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (BOOL)isHighlighted
{
  return sub_10001EBE0(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (BOOL)isSelected
{
  return sub_10001EBE0(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_grid) sizeThatFits:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9Reminders21TTRIPinnedListControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001449AC();
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v6 = a3;
    v7 = self;
    double v8 = (void *)sub_1002EAB58((uint64_t)v7);

    swift_unknownObjectRelease();
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  char v5 = *((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_isContextMenuTarget);
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_isContextMenuTarget) = 1;
  if ((v5 & 1) == 0)
  {
    id v8 = a3;
    id v9 = a4;
    swift_unknownObjectRetain();
    double v10 = self;
    sub_1001433A0();

    swift_unknownObjectRelease();
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  int v5 = *((unsigned __int8 *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_isContextMenuTarget);
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_isContextMenuTarget) = 0;
  if (v5 == 1)
  {
    id v8 = a3;
    id v9 = a4;
    swift_unknownObjectRetain();
    double v10 = self;
    sub_1001433A0();

    swift_unknownObjectRelease();
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001437EC(v6, (uint64_t)v7);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  id v2 = self;
  UIAccessibilityTraits v3 = sub_1001439D4();

  return v3;
}

- (NSString)accessibilityLabel
{
  id v2 = self;
  sub_100143B08();
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

- (NSArray)accessibilityUserInputLabels
{
  id v2 = self;
  uint64_t v3 = sub_100144378();

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

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (NSString)accessibilityHint
{
  id v2 = self;
  if ((UIAccessibilityTraitNotEnabled & ~sub_1001439D4()) != 0)
  {
    TTRAccesibility.AccountsList.Hint.List.unsafeMutableAddressor();
    swift_bridgeObjectRetain();

    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)accessibilityCustomActions
{
  id v2 = self;
  unint64_t v3 = sub_10014453C();

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

- (void)setAccessibilityCustomActions:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_1000368FC(0, (unint64_t *)&unk_10078E660);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TTRIPinnedListControl *)&v8 setAccessibilityCustomActions:isa];
}

- (_TtC9Reminders21TTRIPinnedListControl)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_10002ED34((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_pinnedList);
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_gradientBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_countLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_stackedAvatarsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_grid));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders21TTRIPinnedListControl_secondRowStackView);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v6 = a3;
    swift_unknownObjectRetain();
    id v7 = self;
    sub_1002EAD74((uint64_t)v7);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  sub_1000368FC(0, (unint64_t *)&qword_100791B50);
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

@end