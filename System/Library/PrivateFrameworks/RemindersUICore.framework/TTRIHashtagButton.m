@interface TTRIHashtagButton
- (BOOL)canBecomeFocused;
- (BOOL)ttriAccessibilityShouldUseViewHierarchyForFindingScrollParent;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC15RemindersUICore17TTRIHashtagButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICore17TTRIHashtagButton)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setAccessibilityUserInputLabels:(id)a3;
@end

@implementation TTRIHashtagButton

- (_TtC15RemindersUICore17TTRIHashtagButton)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore17TTRIHashtagButton *)sub_1B97FDA24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore17TTRIHashtagButton)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore17TTRIHashtagButton *)sub_1B97FDB44(a3);
}

- (BOOL)canBecomeFocused
{
  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_focusDelegate;
  swift_beginAccess();
  if (MEMORY[0x1BA9DB180](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(uint64_t (**)(void))(v4 + 8);
    v6 = self;
    char v7 = v5();

    swift_unknownObjectRelease();
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  TTRIHashtagButton.didUpdateFocus(in:with:)((UIFocusUpdateContext)v6, (UIFocusAnimationCoordinator)v7);
}

- (NSString)accessibilityLabel
{
  v2 = self;
  TTRIHashtagButton.accessibilityLabel.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B996E9B0();
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
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = (char *)v7.receiver;
  unint64_t v3 = [(TTRIHashtagButton *)&v7 accessibilityTraits];
  uint64_t v4 = &v2[OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_isExcluded];
  swift_beginAccess();
  if (*v4 == 1)
  {
    uint64_t v5 = *MEMORY[0x1E4FB2590];

    if ((v5 & v3) != 0) {
      v3 &= ~v5;
    }
  }
  else
  {
  }
  return v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(TTRIHashtagButton *)&v4 setAccessibilityTraits:a3];
}

- (NSString)accessibilityValue
{
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_isExcluded;
  swift_beginAccess();
  objc_super v4 = 0;
  if (*v3 == 1)
  {
    uint64_t v5 = qword_1E9EFAF78;
    id v6 = self;
    if (v5 != -1) {
      swift_once();
    }
    _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();

    objc_super v4 = (void *)sub_1B996E9B0();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v4;
}

- (NSString)accessibilityHint
{
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_accessibilityDelegate;
  objc_super v4 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_accessibilityDelegate, a2);
  if (v4)
  {
    uint64_t v5 = *((void *)v3 + 1);
    swift_getObjectType();
    id v6 = *(void (**)(void))(v5 + 8);
    objc_super v7 = self;
    v6();
    uint64_t v9 = v8;

    swift_unknownObjectRelease();
    if (v9)
    {
      objc_super v4 = (void *)sub_1B996E9B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      objc_super v4 = 0;
    }
  }

  return (NSString *)v4;
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  uint64_t v3 = TTRIHashtagButton.accessibilityUserInputLabels.getter();

  if (v3)
  {
    objc_super v4 = (void *)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setAccessibilityUserInputLabels:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1B996EE50();
    id v6 = self;
    a3 = (id)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TTRIHashtagButton *)&v8 setAccessibilityUserInputLabels:a3];
}

- (NSArray)accessibilityCustomActions
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_accessibilityDelegate;
  objc_super v4 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_accessibilityDelegate, a2);
  if (v4)
  {
    uint64_t v5 = *((void *)v3 + 1);
    swift_getObjectType();
    id v6 = *(uint64_t (**)(void))(v5 + 16);
    objc_super v7 = self;
    uint64_t v8 = v6();

    swift_unknownObjectRelease();
    if (v8)
    {
      sub_1B90BFD68(0, &qword_1E9F01CE0);
      objc_super v4 = (void *)sub_1B996EE40();
      swift_bridgeObjectRelease();
    }
    else
    {
      objc_super v4 = 0;
    }
  }

  return (NSArray *)v4;
}

- (BOOL)ttriAccessibilityShouldUseViewHierarchyForFindingScrollParent
{
  return 1;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_focusDelegate);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore17TTRIHashtagButton_accessibilityDelegate;

  sub_1B90D88A0((uint64_t)v3);
}

@end