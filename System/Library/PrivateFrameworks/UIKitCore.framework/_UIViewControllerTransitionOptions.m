@interface _UIViewControllerTransitionOptions
- (BOOL)popPreemptsPushInSwiftUIEnabled;
- (CGRect)frameOfSourceInDestination;
- (NSArray)dimmingVisualEffects;
- (UIColor)dimmingColor;
- (_UIViewControllerTransitionOptions)init;
- (void)setDimmingColor:(id)a3;
- (void)setDimmingVisualEffects:(id)a3;
- (void)setFrameOfSourceInDestination:(CGRect)a3;
- (void)setPopPreemptsPushInSwiftUIEnabled:(BOOL)a3;
@end

@implementation _UIViewControllerTransitionOptions

- (UIColor)dimmingColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____UIViewControllerTransitionOptions_dimmingColor));
}

- (void)setDimmingColor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_dimmingColor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_dimmingColor) = (Class)a3;
  id v3 = a3;
}

- (NSArray)dimmingVisualEffects
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_dimmingVisualEffects))
  {
    sub_1853B985C(0, (unint64_t *)&unk_1E8FAF5B0);
    swift_bridgeObjectRetain();
    v2 = (void *)sub_186A1EB1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setDimmingVisualEffects:(id)a3
{
  if (a3)
  {
    sub_1853B985C(0, (unint64_t *)&unk_1E8FAF5B0);
    id v4 = (objc_class *)sub_186A1EB3C();
  }
  else
  {
    id v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_dimmingVisualEffects) = v4;
  swift_bridgeObjectRelease();
}

- (CGRect)frameOfSourceInDestination
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_frameOfSourceInDestination);
  double v3 = *(double *)&self->dimmingColor[OBJC_IVAR____UIViewControllerTransitionOptions_frameOfSourceInDestination];
  double v4 = *(double *)&self->dimmingVisualEffects[OBJC_IVAR____UIViewControllerTransitionOptions_frameOfSourceInDestination];
  double v5 = *(double *)&self->frameOfSourceInDestination[OBJC_IVAR____UIViewControllerTransitionOptions_frameOfSourceInDestination];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrameOfSourceInDestination:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_frameOfSourceInDestination) = a3;
}

- (BOOL)popPreemptsPushInSwiftUIEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_popPreemptsPushInSwiftUIEnabled);
}

- (void)setPopPreemptsPushInSwiftUIEnabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____UIViewControllerTransitionOptions_popPreemptsPushInSwiftUIEnabled) = a3;
}

- (_UIViewControllerTransitionOptions)init
{
  return (_UIViewControllerTransitionOptions *)sub_18596793C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end