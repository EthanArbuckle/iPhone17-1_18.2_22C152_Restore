@interface TagView.ContentAccessibilityElement
- (BOOL)accessibilityActivate;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtCC7NewsUI27TagView27ContentAccessibilityElement)init;
- (_TtCC7NewsUI27TagView27ContentAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation TagView.ContentAccessibilityElement

- (CGRect)accessibilityFrame
{
  v2 = self;
  id v3 = [(TagView.ContentAccessibilityElement *)v2 accessibilityContainer];
  if (!v3)
  {

LABEL_6:
    double v10 = 0.0;
    double v12 = 0.0;
    double v6 = 0.0;
    double v8 = 0.0;
    goto LABEL_7;
  }
  v4 = v3;
  if ((objc_msgSend(v3, sel_respondsToSelector_, sel_accessibilityFrame) & 1) == 0)
  {

    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  objc_msgSend(v4, sel_accessibilityFrame);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  swift_unknownObjectRelease();
LABEL_7:
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = self;
  id v3 = [(TagView.ContentAccessibilityElement *)v2 accessibilityContainer];
  if (!v3)
  {

LABEL_6:
    double v8 = 0.0;
    double v6 = 0.0;
    goto LABEL_7;
  }
  v4 = v3;
  if ((objc_msgSend(v3, sel_respondsToSelector_, sel_accessibilityActivationPoint) & 1) == 0)
  {

    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  objc_msgSend(v4, sel_accessibilityActivationPoint);
  double v6 = v5;
  double v8 = v7;

  swift_unknownObjectRelease();
LABEL_7:
  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1DEE15988(self, (uint64_t)a2, (SEL *)&selRef_accessibilityLabel);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1DEE15988(self, (uint64_t)a2, (SEL *)&selRef_accessibilityValue);
}

- (NSArray)accessibilityUserInputLabels
{
  return (NSArray *)sub_1DEE166D8(self, (uint64_t)a2, sub_1DEE15AE4);
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  id v3 = [(TagView.ContentAccessibilityElement *)v2 accessibilityContainer];
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, sel_respondsToSelector_, sel_accessibilityTraits))
    {
      id v5 = objc_msgSend(v4, sel_accessibilityTraits);

      swift_unknownObjectRelease();
      return (unint64_t)v5;
    }
    swift_unknownObjectRelease();
  }
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for TagView.ContentAccessibilityElement();
  id v7 = [(TagView.ContentAccessibilityElement *)&v8 accessibilityTraits];

  return (unint64_t)v7;
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  id v3 = [(TagView.ContentAccessibilityElement *)v2 accessibilityContainer];
  if (v3)
  {
    unsigned __int8 v4 = objc_msgSend(v3, sel_accessibilityActivate);

    swift_unknownObjectRelease();
    return v4;
  }
  else
  {

    return 0;
  }
}

- (_TtCC7NewsUI27TagView27ContentAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1DFDFF780();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  uint64_t v4 = sub_1DFDFFF30();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TagView.ContentAccessibilityElement();
  id v5 = [(TagView.ContentAccessibilityElement *)&v7 initWithAccessibilityContainer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

- (_TtCC7NewsUI27TagView27ContentAccessibilityElement)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TagView.ContentAccessibilityElement();
  return [(TagView.ContentAccessibilityElement *)&v3 init];
}

@end