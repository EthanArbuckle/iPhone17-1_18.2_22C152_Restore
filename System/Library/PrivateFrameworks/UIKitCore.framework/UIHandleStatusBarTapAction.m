@interface UIHandleStatusBarTapAction
- (UIHandleStatusBarTapAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (UIHandleStatusBarTapAction)initWithStatusBarStyle:(int64_t)a3;
- (UIHandleStatusBarTapAction)initWithStatusBarStyle:(int64_t)a3 andStatusBarStyleOverride:(unint64_t)a4;
- (UIHandleStatusBarTapAction)initWithStatusBarStyleOverride:(unint64_t)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
- (int64_t)statusBarStyle;
- (unint64_t)statusBarStyleOverride;
@end

@implementation UIHandleStatusBarTapAction

- (UIHandleStatusBarTapAction)initWithStatusBarStyle:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)UIHandleStatusBarTapAction;
  v7 = [(UIHandleStatusBarTapAction *)&v9 initWithInfo:v5 timeout:0 forResponseOnQueue:0 withHandler:0.0];

  return v7;
}

- (UIHandleStatusBarTapAction)initWithStatusBarStyleOverride:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v6 forSetting:2];

  v9.receiver = self;
  v9.super_class = (Class)UIHandleStatusBarTapAction;
  v7 = [(UIHandleStatusBarTapAction *)&v9 initWithInfo:v5 timeout:0 forResponseOnQueue:0 withHandler:0.0];

  return v7;
}

- (UIHandleStatusBarTapAction)initWithStatusBarStyle:(int64_t)a3 andStatusBarStyleOverride:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v8 = [NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forSetting:1];

  objc_super v9 = [NSNumber numberWithUnsignedLongLong:a4];
  [v7 setObject:v9 forSetting:2];

  v12.receiver = self;
  v12.super_class = (Class)UIHandleStatusBarTapAction;
  v10 = [(UIHandleStatusBarTapAction *)&v12 initWithInfo:v7 timeout:0 forResponseOnQueue:0 withHandler:0.0];

  return v10;
}

- (UIHandleStatusBarTapAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return -[UIHandleStatusBarTapAction initWithStatusBarStyle:](self, "initWithStatusBarStyle:", -1, a5, a6, a4);
}

- (int64_t)statusBarStyle
{
  v2 = [(UIHandleStatusBarTapAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (unint64_t)statusBarStyleOverride
{
  v2 = [(UIHandleStatusBarTapAction *)self info];
  v3 = [v2 objectForSetting:2];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)UIActionType
{
  return 7;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v3 = @"statusBarStyleOverride";
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return @"statusBarStyle";
  }
  else {
    return v3;
  }
}

@end