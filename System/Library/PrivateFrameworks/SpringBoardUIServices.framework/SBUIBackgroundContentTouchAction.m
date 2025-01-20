@interface SBUIBackgroundContentTouchAction
- (CGPoint)location;
- (SBUIBackgroundContentTouchAction)initWithLocation:(CGPoint)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
@end

@implementation SBUIBackgroundContentTouchAction

- (SBUIBackgroundContentTouchAction)initWithLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
  [v6 setObject:v7 forSetting:1];

  v10.receiver = self;
  v10.super_class = (Class)SBUIBackgroundContentTouchAction;
  v8 = [(SBUIBackgroundContentTouchAction *)&v10 initWithInfo:v6 responder:0];

  return v8;
}

- (CGPoint)location
{
  v2 = [(SBUIBackgroundContentTouchAction *)self info];
  v3 = [v2 objectForSetting:1];
  [v3 CGPointValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"location";
  }
  else {
    return 0;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 == 1)
  {
    objc_msgSend(a4, "CGPointValue", a3, v5);
    double v7 = NSStringFromCGPoint(v9);
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

@end