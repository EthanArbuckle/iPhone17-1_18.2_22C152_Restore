@interface _UIDismissInteraction
- (BOOL)isActive;
- (BOOL)isEnabled;
- (UIView)view;
- (_UIDismissInteraction)init;
- (_UIDismissInteractionDelegate)delegate;
- (unint64_t)styles;
- (void)didMoveToView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setStyles:(unint64_t)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIDismissInteraction

- (unint64_t)styles
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____UIDismissInteraction_styles);
}

- (UIView)view
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UIDismissInteraction__view, a2);
  return (UIView *)v2;
}

- (_UIDismissInteraction)init
{
  return (_UIDismissInteraction *)sub_1858B5AF4();
}

- (void)setIsEnabled:(BOOL)a3
{
  v4 = self;
  sub_18547D97C(a3);
}

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1858B5CD0(a3);
}

- (void)setDelegate:(id)a3
{
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1858B5EA0(a3);
}

- (_UIDismissInteractionDelegate)delegate
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR____UIDismissInteraction_delegate, a2);
  return (_UIDismissInteractionDelegate *)v2;
}

- (BOOL)isEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____UIDismissInteraction_isEnabled);
}

- (void)setStyles:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDismissInteraction_styles) = (Class)a3;
  v3 = self;
  sub_1855ED448();
}

- (BOOL)isActive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____UIDismissInteraction__isActive);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_18596AE14((uint64_t)self + OBJC_IVAR____UIDismissInteraction_delegate);
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end