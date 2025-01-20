@interface _UITabCrossFadeTransition
+ (BOOL)isSupportedForTraits:(id)a3;
- (BOOL)_shouldCrossFadeBottomBars;
- (BOOL)_shouldCrossFadeNavigationBarVisibility;
- (BOOL)shouldPreemptWithContext:(id)a3;
- (_UITabCrossFadeTransition)init;
- (_UITabCrossFadeTransition)initWithBackgroundColor:(id)a3;
- (double)_customNavigationBarHidingDuration:(id)a3;
- (double)transitionDuration:(id)a3;
- (id)preemptWithContext:(id)a3;
- (int64_t)_navigationBarTransitionVariant;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)willBeginAfterPreemptionWithContext:(id)a3 data:(id)a4;
@end

@implementation _UITabCrossFadeTransition

- (_UITabCrossFadeTransition)initWithBackgroundColor:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____UITabCrossFadeTransition_wasPreempted) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UITabCrossFadeTransition_backgroundColor) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITabCrossFadeTransition;
  id v5 = a3;
  return [(_UITabCrossFadeTransition *)&v7 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UITabCrossFadeTransition_backgroundColor);
}

+ (BOOL)isSupportedForTraits:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, sel_userInterfaceIdiom) == (id)6)
  {

    return 0;
  }
  else
  {
    id v5 = objc_msgSend(v3, sel_userInterfaceIdiom);

    return v5 != (id)5;
  }
}

- (int64_t)_navigationBarTransitionVariant
{
  return 1;
}

- (BOOL)_shouldCrossFadeNavigationBarVisibility
{
  return 1;
}

- (BOOL)_shouldCrossFadeBottomBars
{
  return 1;
}

- (double)_customNavigationBarHidingDuration:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_185A77C3C(a3);
  double v7 = v6;
  swift_unknownObjectRelease();

  return v7;
}

- (double)transitionDuration:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  double v6 = sub_185A77CFC((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_185A76914(a3);
  swift_unknownObjectRelease();
}

- (void)animationEnded:(BOOL)a3
{
  id v3 = self;
  sub_185A78798();
}

- (BOOL)shouldPreemptWithContext:(id)a3
{
  return 1;
}

- (id)preemptWithContext:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____UITabCrossFadeTransition_wasPreempted) = 1;
  swift_unknownObjectRetain();
  id v5 = self;
  objc_msgSend(a3, sel_completeTransition_, 1);
  swift_unknownObjectRelease();

  return 0;
}

- (void)willBeginAfterPreemptionWithContext:(id)a3 data:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v5 = self;
  sub_186A1F1CC();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v6);
}

- (_UITabCrossFadeTransition)init
{
  result = (_UITabCrossFadeTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end