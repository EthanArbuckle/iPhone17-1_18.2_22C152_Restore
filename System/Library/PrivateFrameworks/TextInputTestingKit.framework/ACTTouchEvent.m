@interface ACTTouchEvent
- (ACTTouchEvent)initWithTouchEvent:(id)a3;
- (TIKeyboardTouchEvent)touchEvent;
- (id)description;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTTouchEvent

- (void).cxx_destruct
{
}

- (TIKeyboardTouchEvent)touchEvent
{
  return self->_touchEvent;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ACTTouchEvent *)self touchEvent];
  id v8 = (id)[v9 _performTouchEvent:v7 typingLog:v6];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(ACTTouchEvent *)self touchEvent];
  v7 = [v3 stringWithFormat:@"<%@: touchEvent=%@>", v5, v6];

  return v7;
}

- (ACTTouchEvent)initWithTouchEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACTTouchEvent;
  id v6 = [(ACTTouchEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_touchEvent, a3);
  }

  return v7;
}

@end