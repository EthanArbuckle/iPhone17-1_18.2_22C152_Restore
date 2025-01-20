@interface STGenericIntentGroup
+ (BOOL)supportsSecureCoding;
- (NSString)name;
- (STGenericIntentGroup)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
@end

@implementation STGenericIntentGroup

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

- (STGenericIntentGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STGenericIntentGroup;
  v5 = [(STGenericIntentGroup *)&v10 init];
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