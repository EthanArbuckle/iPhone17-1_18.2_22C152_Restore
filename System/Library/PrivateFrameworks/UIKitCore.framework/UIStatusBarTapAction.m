@interface UIStatusBarTapAction
- (UIStatusBarTapAction)initWithType:(int64_t)a3 xPosition:(double)a4;
- (double)xPosition;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
- (int64_t)type;
@end

@implementation UIStatusBarTapAction

- (int64_t)UIActionType
{
  return 36;
}

- (UIStatusBarTapAction)initWithType:(int64_t)a3 xPosition:(double)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v8 = [NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forSetting:1];

  v9 = [NSNumber numberWithDouble:a4];
  [v7 setObject:v9 forSetting:2];

  v12.receiver = self;
  v12.super_class = (Class)UIStatusBarTapAction;
  v10 = [(UIStatusBarTapAction *)&v12 initWithInfo:v7 timeout:0 forResponseOnQueue:0 withHandler:0.0];

  return v10;
}

- (int64_t)type
{
  v2 = [(UIStatusBarTapAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (double)xPosition
{
  v2 = [(UIStatusBarTapAction *)self info];
  v3 = [v2 objectForSetting:2];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v3 = @"xPosition";
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return @"type";
  }
  else {
    return v3;
  }
}

@end