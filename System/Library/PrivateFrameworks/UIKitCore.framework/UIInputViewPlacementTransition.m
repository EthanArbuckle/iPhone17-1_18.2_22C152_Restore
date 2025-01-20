@interface UIInputViewPlacementTransition
+ (id)transitionForExistingPlacement:(id)a3 animationStyle:(id)a4;
+ (id)transitionFromPlacement:(id)a3 toPlacement:(id)a4 withAnimationStyle:(id)a5;
- (BOOL)cancelled;
- (BOOL)didAdvanceAnimationToState:(int)a3;
- (NSObject)animationContext;
- (UIInputViewAnimationController)animationController;
- (UIInputViewAnimationStyle)animationStyle;
- (UIInputViewSetNotificationInfo)notificationInfo;
- (UIInputViewSetPlacement)fromPlacement;
- (UIInputViewSetPlacement)toPlacement;
- (int)animationState;
- (unint64_t)notifications;
- (void)dealloc;
- (void)setAnimationContext:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setAnimationState:(int)a3;
- (void)setAnimationStyle:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setFromPlacement:(id)a3;
- (void)setNotificationInfo:(id)a3;
- (void)setNotifications:(unint64_t)a3;
- (void)setToPlacement:(id)a3;
@end

@implementation UIInputViewPlacementTransition

+ (id)transitionFromPlacement:(id)a3 toPlacement:(id)a4 withAnimationStyle:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  [v10 setFromPlacement:v9];

  [v10 setToPlacement:v8];
  [v10 setAnimationStyle:v7];

  return v10;
}

+ (id)transitionForExistingPlacement:(id)a3 animationStyle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setFromPlacement:v6];
  [v7 setToPlacement:v6];

  [v7 setAnimationStyle:v5];
  return v7;
}

- (BOOL)didAdvanceAnimationToState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = ![(UIInputViewPlacementTransition *)self cancelled]
    && [(UIInputViewPlacementTransition *)self animationState] == v3 - 1;
  id v6 = [(UIInputViewPlacementTransition *)self fromPlacement];
  if ([v6 isInteractive])
  {
    id v7 = [(UIInputViewPlacementTransition *)self toPlacement];
    int v8 = [v7 isInteractive] ^ 1;
  }
  else
  {
    int v8 = 0;
  }

  if ((v5 | v8) == 1) {
    [(UIInputViewPlacementTransition *)self setAnimationState:v3];
  }
  return v5 | v8;
}

- (void)dealloc
{
  if (self->animationContext) {
    -[UIInputViewAnimationController completeAnimationWithHost:context:](self->animationController, "completeAnimationWithHost:context:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewPlacementTransition;
  [(UIInputViewPlacementTransition *)&v3 dealloc];
}

- (UIInputViewSetPlacement)fromPlacement
{
  return self->fromPlacement;
}

- (void)setFromPlacement:(id)a3
{
}

- (UIInputViewSetPlacement)toPlacement
{
  return self->toPlacement;
}

- (void)setToPlacement:(id)a3
{
}

- (UIInputViewAnimationStyle)animationStyle
{
  return self->animationStyle;
}

- (void)setAnimationStyle:(id)a3
{
}

- (UIInputViewSetNotificationInfo)notificationInfo
{
  return self->notificationInfo;
}

- (void)setNotificationInfo:(id)a3
{
}

- (unint64_t)notifications
{
  return self->notifications;
}

- (void)setNotifications:(unint64_t)a3
{
  self->notifications = a3;
}

- (int)animationState
{
  return self->animationState;
}

- (void)setAnimationState:(int)a3
{
  self->animationState = a3;
}

- (BOOL)cancelled
{
  return self->cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->cancelled = a3;
}

- (NSObject)animationContext
{
  return self->animationContext;
}

- (void)setAnimationContext:(id)a3
{
}

- (UIInputViewAnimationController)animationController
{
  return self->animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->animationController, 0);
  objc_storeStrong((id *)&self->animationContext, 0);
  objc_storeStrong((id *)&self->notificationInfo, 0);
  objc_storeStrong((id *)&self->animationStyle, 0);
  objc_storeStrong((id *)&self->toPlacement, 0);
  objc_storeStrong((id *)&self->fromPlacement, 0);
}

@end