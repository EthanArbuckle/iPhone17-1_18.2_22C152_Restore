@interface PKImageDescriptorSymbol
+ (BOOL)supportsSecureCoding;
+ (id)createForName:(id)a3 withTintColor:(int64_t)a4;
+ (id)createForName:(id)a3 withTintColor:(int64_t)a4 hasBackground:(BOOL)a5;
- (NSString)name;
- (PKImageDescriptorSymbol)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKImageDescriptorSymbol

+ (id)createForName:(id)a3 withTintColor:(int64_t)a4
{
  return (id)[a1 createForName:a3 withTintColor:a4 hasBackground:0];
}

+ (id)createForName:(id)a3 withTintColor:(int64_t)a4 hasBackground:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  id v7 = a3;
  v8 = +[PKImageDescriptor _createForType:withTintColor:hasBackground:]((uint64_t)PKImageDescriptor, 1, a4, a5);
  uint64_t v9 = [v7 copy];

  v10 = (void *)v8[4];
  v8[4] = v9;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKImageDescriptorSymbol)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKImageDescriptorSymbol;
  v5 = [(PKImageDescriptor *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKImageDescriptorSymbol;
  id v4 = a3;
  [(PKImageDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"name", v5.receiver, v5.super_class);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end