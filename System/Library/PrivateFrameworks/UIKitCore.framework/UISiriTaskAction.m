@interface UISiriTaskAction
- (AFSiriTask)payload;
- (UISiriTaskAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (UISiriTaskAction)initWithPayload:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
@end

@implementation UISiriTaskAction

- (UISiriTaskAction)initWithPayload:(id)a3
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F4F7A0];
    id v5 = a3;
    id v6 = objc_alloc_init(v4);
    [v6 setObject:v5 forSetting:1];

    v9.receiver = self;
    v9.super_class = (Class)UISiriTaskAction;
    self = [(UISiriTaskAction *)&v9 initWithInfo:v6 timeout:0 forResponseOnQueue:0 withHandler:0.0];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UISiriTaskAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return 0;
}

- (AFSiriTask)payload
{
  v2 = [(UISiriTaskAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (AFSiriTask *)v3;
}

- (int64_t)UIActionType
{
  return 8;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"payload";
  }
  else {
    return 0;
  }
}

@end