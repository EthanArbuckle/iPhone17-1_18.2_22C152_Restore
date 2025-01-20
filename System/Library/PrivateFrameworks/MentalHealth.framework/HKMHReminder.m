@interface HKMHReminder
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (HKMHReminder)initWithCoder:(id)a3;
- (HKMHReminder)initWithDateComponents:(id)a3 isEnabled:(BOOL)a4;
- (NSDateComponents)dateComponents;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMHReminder

- (HKMHReminder)initWithDateComponents:(id)a3 isEnabled:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMHReminder;
  v7 = [(HKMHReminder *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    dateComponents = v7->_dateComponents;
    v7->_dateComponents = (NSDateComponents *)v8;

    v7->_isEnabled = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHReminder)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"EnabledKey"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateComponentsKey"];

  v7 = [(HKMHReminder *)self initWithDateComponents:v6 isEnabled:v5];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isEnabled = self->_isEnabled;
  id v5 = a3;
  [v5 encodeBool:isEnabled forKey:@"EnabledKey"];
  [v5 encodeObject:self->_dateComponents forKey:@"DateComponentsKey"];
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void).cxx_destruct
{
}

@end