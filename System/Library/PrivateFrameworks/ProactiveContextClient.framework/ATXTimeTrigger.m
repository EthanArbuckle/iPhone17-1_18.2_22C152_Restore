@interface ATXTimeTrigger
+ (BOOL)supportsSecureCoding;
- (ATXTimeTrigger)initWithCoder:(id)a3;
- (NSDateComponents)timeComponents;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 3;
}

- (ATXTimeTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXTimeTrigger;
  v5 = [(ATXTimeTrigger *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeComponents"];
    timeComponents = v5->_timeComponents;
    v5->_timeComponents = (NSDateComponents *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDateComponents)timeComponents
{
  return self->_timeComponents;
}

- (void).cxx_destruct
{
}

@end