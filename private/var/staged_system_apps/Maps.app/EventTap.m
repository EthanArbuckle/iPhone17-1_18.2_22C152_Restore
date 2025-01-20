@interface EventTap
+ (EventTap)eventTapWithHandler:(id)a3;
- (EventTap)initWithHandler:(id)a3;
- (void)sendEvent:(id)a3;
@end

@implementation EventTap

+ (EventTap)eventTapWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithHandler:v4];

  return (EventTap *)v5;
}

- (EventTap)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EventTap;
  id v5 = [(EventTap *)&v9 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id handler = v5->_handler;
    v5->_id handler = v6;
  }
  return v5;
}

- (void)sendEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end