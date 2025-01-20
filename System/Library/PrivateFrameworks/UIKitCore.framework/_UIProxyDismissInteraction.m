@interface _UIProxyDismissInteraction
- (_UIProxyDismissInteraction)init;
- (void)beginAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4;
- (void)cancelWithVelocity:(CGPoint)a3 originalPosition:(CGPoint)a4;
- (void)dismissWithVelocity:(CGPoint)a3;
- (void)issueUpdate:(id)a3;
@end

@implementation _UIProxyDismissInteraction

- (void)beginAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  v8 = self;
  sub_185A45B50(v7, v6, x, y);
}

- (void)issueUpdate:(id)a3
{
  id v4 = a3;
  double v6 = self;
  if ([(_UIDismissInteraction *)v6 isActive]
    && (v5 = [(_UIDismissInteraction *)v6 delegate]) != 0)
  {
    [(_UIDismissInteractionDelegate *)v5 dismissInteraction:v6 didIssueUpdate:v4];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)dismissWithVelocity:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = self;
  if ([(_UIDismissInteraction *)v6 isActive])
  {
    v5 = [(_UIDismissInteraction *)v6 delegate];
    if (v5)
    {
      -[_UIDismissInteractionDelegate dismissInteraction:didDismissWithVelocity:](v5, sel_dismissInteraction_didDismissWithVelocity_, v6, x, y);
      swift_unknownObjectRelease();
    }
    *((unsigned char *)&v6->super.super.isa + OBJC_IVAR____UIDismissInteraction__isActive) = 0;
  }
}

- (void)cancelWithVelocity:(CGPoint)a3 originalPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  v9 = self;
  if ([(_UIDismissInteraction *)v9 isActive])
  {
    v8 = [(_UIDismissInteraction *)v9 delegate];
    if (v8)
    {
      -[_UIDismissInteractionDelegate dismissInteraction:didCancelWithVelocity:originalPosition:](v8, sel_dismissInteraction_didCancelWithVelocity_originalPosition_, v9, v7, v6, x, y);
      swift_unknownObjectRelease();
    }
    *((unsigned char *)&v9->super.super.isa + OBJC_IVAR____UIDismissInteraction__isActive) = 0;
  }
}

- (_UIProxyDismissInteraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIProxyDismissInteraction;
  return [(_UIDismissInteraction *)&v3 init];
}

@end