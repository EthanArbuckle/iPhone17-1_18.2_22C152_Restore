@interface UIPPTRequestAction
- (BOOL)shouldChangeOrientation;
- (UIPPTRequestAction)initWithDesiredOrientation:(int64_t)a3;
- (int64_t)UIActionType;
- (int64_t)orientationRequested;
@end

@implementation UIPPTRequestAction

- (UIPPTRequestAction)initWithDesiredOrientation:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)UIPPTRequestAction;
  v7 = [(UIPPTRequestAction *)&v9 initWithInfo:v5 timeout:0 forResponseOnQueue:0 withHandler:0.0];

  return v7;
}

- (int64_t)UIActionType
{
  return 15;
}

- (BOOL)shouldChangeOrientation
{
  v2 = [(UIPPTRequestAction *)self info];
  v3 = [v2 objectForSetting:1];

  return v3 != 0;
}

- (int64_t)orientationRequested
{
  v2 = [(UIPPTRequestAction *)self info];
  v3 = [v2 objectForSetting:1];

  int64_t v4 = [v3 integerValue];
  return v4;
}

@end