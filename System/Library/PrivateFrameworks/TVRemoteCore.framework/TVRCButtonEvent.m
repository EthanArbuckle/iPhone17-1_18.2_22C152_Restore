@interface TVRCButtonEvent
+ (BOOL)supportsSecureCoding;
+ (id)buttonEventForButton:(id)a3 eventType:(int64_t)a4;
- (NSDate)timestamp;
- (TVRCButton)button;
- (TVRCButtonEvent)initWithCoder:(id)a3;
- (id)_init;
- (id)description;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TVRCButtonEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)buttonEventForButton:(id)a3 eventType:(int64_t)a4
{
  id v5 = a3;
  v6 = [[TVRCButtonEvent alloc] _init];
  v7 = (void *)v6[2];
  v6[2] = v5;
  id v8 = v5;

  v6[3] = a4;
  uint64_t v9 = [MEMORY[0x263EFF910] date];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)TVRCButtonEvent;
  return [(TVRCButtonEvent *)&v3 init];
}

- (TVRCButtonEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRCButtonEvent;
  id v5 = [(TVRCButtonEvent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"button"];
    button = v5->_button;
    v5->_button = (TVRCButton *)v8;

    v5->_eventType = [v4 decodeIntegerForKey:@"eventType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeObject:timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_button forKey:@"button"];
  [v5 encodeInteger:self->_eventType forKey:@"eventType"];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t eventType = self->_eventType;
  if (eventType >= 4)
  {
    v7 = NSString;
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
    uint64_t v6 = [v7 stringWithFormat:@"Unknown %@", v8];
  }
  else
  {
    uint64_t v6 = off_2647AF680[eventType];
  }
  uint64_t v9 = [v3 stringWithFormat:@"<%@ %p type=%@; button=%@>", v4, self, v6, self->_button];;

  return v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (TVRCButton)button
{
  return self->_button;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end