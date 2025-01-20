@interface SFTabSwitcherTransaction
- (BOOL)prefersDetachedTransition;
- (SFAnimationSettings)animationSettings;
- (SFTabSwitcherItem)insertedItemToDismissTo;
- (SFTabSwitcherScrollPosition)targetScrollPosition;
- (SFTabSwitcherTransaction)init;
- (void)setAnimationSettings:(id)a3;
- (void)setInsertedItemToDismissTo:(id)a3;
- (void)setPrefersDetachedTransition:(BOOL)a3;
- (void)setTargetScrollPosition:(id)a3;
@end

@implementation SFTabSwitcherTransaction

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_targetScrollPosition);
}

- (SFTabSwitcherTransaction)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_animationSettings) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_insertedItemToDismissTo) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_prefersDetachedTransition) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_targetScrollPosition) = 0;
  v3.receiver = self;
  v3.super_class = (Class)SFTabSwitcherTransaction;
  return [(SFTabSwitcherTransaction *)&v3 init];
}

- (BOOL)prefersDetachedTransition
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_prefersDetachedTransition);
}

- (SFTabSwitcherScrollPosition)targetScrollPosition
{
  return (SFTabSwitcherScrollPosition *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR___SFTabSwitcherTransaction_targetScrollPosition));
}

- (SFAnimationSettings)animationSettings
{
  return (SFAnimationSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___SFTabSwitcherTransaction_animationSettings));
}

- (SFTabSwitcherItem)insertedItemToDismissTo
{
  return (SFTabSwitcherItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___SFTabSwitcherTransaction_insertedItemToDismissTo));
}

- (void)setTargetScrollPosition:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_targetScrollPosition);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_targetScrollPosition) = (Class)a3;
  id v3 = a3;
}

- (void)setAnimationSettings:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_animationSettings);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_animationSettings) = (Class)a3;
  id v3 = a3;
}

- (void)setInsertedItemToDismissTo:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_insertedItemToDismissTo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_insertedItemToDismissTo) = (Class)a3;
  id v3 = a3;
}

- (void)setPrefersDetachedTransition:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherTransaction_prefersDetachedTransition) = a3;
}

@end