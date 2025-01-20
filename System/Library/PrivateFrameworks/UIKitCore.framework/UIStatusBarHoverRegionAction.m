@interface UIStatusBarHoverRegionAction
- (UIStatusBarHoverRegionAction)initWithRegion:(int64_t)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
- (int64_t)region;
@end

@implementation UIStatusBarHoverRegionAction

- (UIStatusBarHoverRegionAction)initWithRegion:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarHoverRegionAction;
  v7 = [(UIStatusBarHoverRegionAction *)&v9 initWithInfo:v5 timeout:0 forResponseOnQueue:0 withHandler:0.0];

  return v7;
}

- (int64_t)region
{
  v2 = [(UIStatusBarHoverRegionAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)UIActionType
{
  return 38;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"statusBarRegion";
  }
  else {
    return 0;
  }
}

uint64_t __55___UIStatusBarHoverRegionAction__hoverActionForRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([(id)UIApp handleStatusBarHoverActionForRegion:*(void *)(a1 + 32)] & 1) == 0)
  {
    int64_t v4 = [[UIStatusBarHoverRegionAction alloc] initWithRegion:*(void *)(a1 + 32)];
    id v5 = [v3 window];
    v6 = -[UIWindow _fbsScene](v5);
    v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [v6 sendActions:v7];
  }
  return 1;
}

@end