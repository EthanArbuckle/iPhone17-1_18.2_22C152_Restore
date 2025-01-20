@interface STReminderListObject
+ (BOOL)supportsSecureCoding;
- (STReminderListObject)initWithCoder:(id)a3;
- (id)_aceValue;
- (id)name;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
@end

@implementation STReminderListObject

- (void).cxx_destruct
{
}

- (STReminderListObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STReminderListObject;
  v5 = [(STSiriModelObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STReminderListObject;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"_name", v5.receiver, v5.super_class);
}

- (void)setName:(id)a3
{
}

- (id)name
{
  return self->_name;
}

- (id)_aceValue
{
  id v3 = objc_alloc_init(MEMORY[0x263F64BA8]);
  id v4 = [(STReminderListObject *)self name];
  [v3 setName:v4];

  objc_super v5 = NSURL;
  uint64_t v6 = [(STSiriModelObject *)self identifier];
  v7 = [v5 URLWithString:v6];
  [v3 setIdentifier:v7];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end