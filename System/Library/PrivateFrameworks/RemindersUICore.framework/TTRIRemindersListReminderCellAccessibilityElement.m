@interface TTRIRemindersListReminderCellAccessibilityElement
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (NSArray)accessibilityCustomRotors;
- (NSArray)accessibilityDragSourceDescriptors;
- (NSArray)accessibilityDropPointDescriptors;
- (NSArray)accessibilityUserInputLabels;
- (NSAttributedString)accessibilityAttributedLabel;
- (NSString)accessibilityHint;
- (_TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement)init;
- (_TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (id)_accessibilityInternalTextLinks;
- (unint64_t)accessibilityTraits;
@end

@implementation TTRIRemindersListReminderCellAccessibilityElement

- (CGRect)accessibilityFrame
{
  v2 = self;
  id v3 = [(TTRIRemindersListReminderCellAccessibilityElement *)v2 accessibilityContainer];
  if (!v3)
  {

LABEL_9:
    double v11 = 0.0;
    double v13 = 0.0;
    double v7 = 0.0;
    double v9 = 0.0;
    goto LABEL_10;
  }
  id v4 = v3;
  swift_getObjectType();
  if (swift_conformsToProtocol2()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  if (!v5)
  {

    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  objc_msgSend(v5, sel_accessibilityFrame);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  swift_unknownObjectRelease();
LABEL_10:
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

- (CGPoint)accessibilityActivationPoint
{
  v2 = self;
  id v3 = [(TTRIRemindersListReminderCellAccessibilityElement *)v2 accessibilityContainer];
  if (!v3)
  {

LABEL_9:
    double v7 = 0.0;
    double v9 = 0.0;
    goto LABEL_10;
  }
  id v4 = v3;
  swift_getObjectType();
  if (swift_conformsToProtocol2()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  if (!v5)
  {

    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  objc_msgSend(v5, sel_accessibilityActivationPoint);
  double v7 = v6;
  double v9 = v8;

  swift_unknownObjectRelease();
LABEL_10:
  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (NSAttributedString)accessibilityAttributedLabel
{
  v2 = self;
  id v3 = TTRIRemindersListReminderCellAccessibilityElement.accessibilityAttributedLabel.getter();

  return (NSAttributedString *)v3;
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  uint64_t v3 = TTRIRemindersListReminderCellAccessibilityElement.accessibilityUserInputLabels.getter();

  if (v3)
  {
    id v4 = (void *)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  unint64_t v3 = TTRIRemindersListReminderCellAccessibilityElement.accessibilityTraits.getter();

  return v3;
}

- (NSString)accessibilityHint
{
  v2 = self;
  TTRIRemindersListReminderCellAccessibilityElement.accessibilityHint.getter();
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

- (BOOL)accessibilityActivate
{
  return sub_1B9500920(self, (uint64_t)a2, (SEL *)&selRef_accessibilityActivate);
}

- (BOOL)accessibilityPerformEscape
{
  return sub_1B9500920(self, (uint64_t)a2, (SEL *)&selRef_accessibilityPerformEscape);
}

- (NSArray)accessibilityCustomRotors
{
  return (NSArray *)sub_1B94FFFF0(self, (uint64_t)a2, TTRIRemindersListReminderCellAccessibilityElement.accessibilityCustomRotors.getter, &qword_1E9EFCB20);
}

- (id)_accessibilityInternalTextLinks
{
  v2 = self;
  id v3 = [(TTRIRemindersListReminderCellAccessibilityElement *)v2 accessibilityContainer];
  if (v3)
  {
    id v4 = v3;
    swift_getObjectType();
    if (swift_conformsToProtocol2()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    if (v5)
    {
      double v6 = (_TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *)objc_msgSend(v5, sel__accessibilityInternalTextLinks);
      swift_unknownObjectRelease();
      if (v6)
      {
        sub_1B90BFD68(0, &qword_1E9EFCB48);
        sub_1B996EE50();

        v2 = v6;
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }

  sub_1B90BFD68(0, &qword_1E9EFCB48);
  double v7 = (void *)sub_1B996EE40();
  swift_bridgeObjectRelease();

  return v7;
}

- (NSArray)accessibilityDragSourceDescriptors
{
  return (NSArray *)sub_1B94FFFF0(self, (uint64_t)a2, (uint64_t (*)(void))TTRIRemindersListReminderCellAccessibilityElement.accessibilityDragSourceDescriptors.getter, (unint64_t *)&unk_1E9F01C50);
}

- (NSArray)accessibilityDropPointDescriptors
{
  return (NSArray *)sub_1B94FFFF0(self, (uint64_t)a2, (uint64_t (*)(void))TTRIRemindersListReminderCellAccessibilityElement.accessibilityDropPointDescriptors.getter, (unint64_t *)&unk_1E9F01C50);
}

- (BOOL)_accessibilityScrollToVisible
{
  return sub_1B9500920(self, (uint64_t)a2, (SEL *)&selRef__accessibilityScrollToVisible);
}

- (_TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1B9970200();
  swift_unknownObjectRelease();
  return (_TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement *)TTRIRemindersListReminderCellAccessibilityElement.init(accessibilityContainer:)(v4);
}

- (_TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement_ttriAccessibilityLabelSeparator;
  uint64_t v5 = qword_1EB9B6008;
  double v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = objc_allocWithZone(MEMORY[0x1E4F28B18]);
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  double v8 = (void *)sub_1B996E9B0();
  swift_bridgeObjectRelease();
  double v9 = (objc_class *)objc_msgSend(v7, sel_initWithString_, v8);

  *(Class *)((char *)&v6->super.super.super.isa + v4) = v9;
  v11.receiver = v6;
  v11.super_class = ObjectType;
  return [(TTRIRemindersListReminderCellAccessibilityElement *)&v11 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore49TTRIRemindersListReminderCellAccessibilityElement_ttriAccessibilityLabelSeparator));
}

@end