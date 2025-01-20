@interface TVRUIButtonEvent
+ (id)createButtonEvent:(int64_t)a3 buttonType:(int64_t)a4;
- (NSDate)timestamp;
- (id)_initWithButtonType:(int64_t)a3 eventType:(int64_t)a4;
- (id)description;
- (int64_t)buttonType;
- (int64_t)eventType;
@end

@implementation TVRUIButtonEvent

- (id)_initWithButtonType:(int64_t)a3 eventType:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TVRUIButtonEvent;
  id result = [(TVRUIButtonEvent *)&v7 init];
  if (result)
  {
    *((void *)result + 2) = a3;
    *((void *)result + 3) = a4;
  }
  return result;
}

+ (id)createButtonEvent:(int64_t)a3 buttonType:(int64_t)a4
{
  v6 = objc_alloc_init(TVRUIButtonEvent);
  v6->_buttonType = a4;
  v6->_eventType = a3;
  return v6;
}

- (id)description
{
  if (description_onceToken != -1) {
    dispatch_once(&description_onceToken, &__block_literal_global_6);
  }
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[TVRUIButtonEvent buttonType](self, "buttonType"), @"buttonType");
  id v5 = (id)objc_msgSend(v3, "appendInteger:withName:", -[TVRUIButtonEvent eventType](self, "eventType"), @"eventType");
  id v6 = (id)[v3 appendClass:objc_opt_class() withName:@"class"];
  objc_super v7 = (void *)description_dateFormatter;
  v8 = [(TVRUIButtonEvent *)self timestamp];
  v9 = [v7 stringFromDate:v8];
  [v3 appendString:v9 withName:@"timestamp"];

  v10 = [v3 build];

  return v10;
}

uint64_t __31__TVRUIButtonEvent_description__block_invoke()
{
  description_dateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263F08790]);
  return MEMORY[0x270F9A758]();
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
}

@end