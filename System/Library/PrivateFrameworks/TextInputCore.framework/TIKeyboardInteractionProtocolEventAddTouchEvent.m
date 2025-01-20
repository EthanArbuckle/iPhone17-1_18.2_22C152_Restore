@interface TIKeyboardInteractionProtocolEventAddTouchEvent
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (TIKeyboardInteractionProtocolEventAddTouchEvent)initWithCoder:(id)a3;
- (TIKeyboardInteractionProtocolEventAddTouchEvent)initWithTouchEvent:(id)a3;
- (TIKeyboardTouchEvent)touchEvent;
- (void)encodeWithCoder:(id)a3;
- (void)sendTo:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolEventAddTouchEvent

- (void).cxx_destruct
{
}

- (TIKeyboardTouchEvent)touchEvent
{
  return self->_touchEvent;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(TIKeyboardTouchEvent *)self->_touchEvent shortDescription];
  v4 = [v2 stringWithFormat:@"<TouchEvent: %@>", v3];

  return (NSString *)v4;
}

- (void)sendTo:(id)a3
{
}

- (TIKeyboardInteractionProtocolEventAddTouchEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAddTouchEvent;
  v5 = [(TIKeyboardInteractionProtocolEventAddTouchEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"touchEvent"];
    touchEvent = v5->_touchEvent;
    v5->_touchEvent = (TIKeyboardTouchEvent *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (TIKeyboardInteractionProtocolEventAddTouchEvent)initWithTouchEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAddTouchEvent;
  uint64_t v6 = [(TIKeyboardInteractionProtocolEventAddTouchEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_touchEvent, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end