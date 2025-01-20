@interface STGenericIntentTopic
+ (BOOL)supportsSecureCoding;
- (NSString)name;
- (STGenericIntentTopic)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
@end

@implementation STGenericIntentTopic

- (void).cxx_destruct
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (STGenericIntentTopic)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STGenericIntentTopic;
  v5 = [(STGenericIntentTopic *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end