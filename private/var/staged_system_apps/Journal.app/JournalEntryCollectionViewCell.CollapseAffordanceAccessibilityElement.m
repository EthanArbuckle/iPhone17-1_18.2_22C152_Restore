@interface JournalEntryCollectionViewCell.CollapseAffordanceAccessibilityElement
- (BOOL)accessibilityActivate;
- (CGRect)accessibilityFrame;
- (UIBezierPath)accessibilityPath;
- (_TtCC7Journal30JournalEntryCollectionViewCell38CollapseAffordanceAccessibilityElement)init;
- (_TtCC7Journal30JournalEntryCollectionViewCell38CollapseAffordanceAccessibilityElement)initWithAccessibilityContainer:(id)a3;
@end

@implementation JournalEntryCollectionViewCell.CollapseAffordanceAccessibilityElement

- (CGRect)accessibilityFrame
{
  v2 = self;
  double v3 = sub_1003F14A8();
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

- (UIBezierPath)accessibilityPath
{
  v2 = self;
  [(JournalEntryCollectionViewCell.CollapseAffordanceAccessibilityElement *)v2 accessibilityFrame];
  id v7 = [self bezierPathWithOvalInRect:v3, v4, v5, v6];

  return (UIBezierPath *)v7;
}

- (BOOL)accessibilityActivate
{
  v2 = *(uint64_t (**)(uint64_t))((char *)&self->super.super.super.isa
                                         + OBJC_IVAR____TtCC7Journal30JournalEntryCollectionViewCell38CollapseAffordanceAccessibilityElement_activationHandler);
  if (v2)
  {
    double v3 = self;
    uint64_t v4 = sub_1001A2550((uint64_t)v2);
    unsigned __int8 v5 = v2(v4);
    sub_10001ABB8((uint64_t)v2);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)type metadata accessor for JournalEntryCollectionViewCell.CollapseAffordanceAccessibilityElement();
    unsigned __int8 v5 = [(JournalEntryCollectionViewCell.CollapseAffordanceAccessibilityElement *)&v7 accessibilityActivate];
  }
  return v5 & 1;
}

- (_TtCC7Journal30JournalEntryCollectionViewCell38CollapseAffordanceAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  uint64_t v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC7Journal30JournalEntryCollectionViewCell38CollapseAffordanceAccessibilityElement_activationHandler);
  *uint64_t v4 = 0;
  v4[1] = 0;
  sub_10002E0BC(v9, v9[3]);
  uint64_t v5 = _bridgeAnythingToObjectiveC<A>(_:)();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for JournalEntryCollectionViewCell.CollapseAffordanceAccessibilityElement();
  double v6 = [(JournalEntryCollectionViewCell.CollapseAffordanceAccessibilityElement *)&v8 initWithAccessibilityContainer:v5];
  swift_unknownObjectRelease();
  _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v9);
  return v6;
}

- (_TtCC7Journal30JournalEntryCollectionViewCell38CollapseAffordanceAccessibilityElement)init
{
  double v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC7Journal30JournalEntryCollectionViewCell38CollapseAffordanceAccessibilityElement_activationHandler);
  uint64_t v4 = (objc_class *)type metadata accessor for JournalEntryCollectionViewCell.CollapseAffordanceAccessibilityElement();
  *double v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(JournalEntryCollectionViewCell.CollapseAffordanceAccessibilityElement *)&v6 init];
}

- (void).cxx_destruct
{
  sub_10001ABB8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCC7Journal30JournalEntryCollectionViewCell38CollapseAffordanceAccessibilityElement_activationHandler));
}

@end