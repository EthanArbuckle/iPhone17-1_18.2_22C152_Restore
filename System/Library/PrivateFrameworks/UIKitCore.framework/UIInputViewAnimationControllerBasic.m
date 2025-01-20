@interface UIInputViewAnimationControllerBasic
- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5;
- (void)performAnimationWithHost:(id)a3 context:(id)a4;
@end

@implementation UIInputViewAnimationControllerBasic

- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5
{
  id v7 = a5;
  [a3 updateToPlacement:a4 withNormalAnimationsAndNotifications:0];
  return v7;
}

- (void)performAnimationWithHost:(id)a3 context:(id)a4
{
}

@end