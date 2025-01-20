@interface PRRenderingEventAction
+ (id)newActionWithType:(id)a3 location:(CGPoint)a4;
- (CGPoint)location;
- (NSString)eventType;
- (PRRenderingEventAction)initWithType:(id)a3 location:(CGPoint)a4;
@end

@implementation PRRenderingEventAction

- (PRRenderingEventAction)initWithType:(id)a3 location:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v7 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setObject:v8 forSetting:0];

  *(CGFloat *)v14 = x;
  *(CGFloat *)&v14[1] = y;
  v10 = [MEMORY[0x1E4F29238] valueWithBytes:v14 objCType:"{CGPoint=dd}"];
  [v9 setObject:v10 forSetting:1];

  v13.receiver = self;
  v13.super_class = (Class)PRRenderingEventAction;
  v11 = [(PRRenderingEventAction *)&v13 initWithInfo:v9 responder:0];

  return v11;
}

+ (id)newActionWithType:(id)a3 location:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc((Class)a1), "initWithType:location:", v7, x, y);

  return v8;
}

- (NSString)eventType
{
  v2 = [(PRRenderingEventAction *)self info];
  v3 = [v2 objectForSetting:0];

  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (CGPoint)location
{
  v2 = [(PRRenderingEventAction *)self info];
  v3 = [v2 objectForSetting:1];

  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  objc_msgSend(v7, "bs_CGPointValue");
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

@end