@interface STStatusBarDataStringEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (STStatusBarDataStringEntry)entryWithStringValue:(id)a3;
- (NSString)stringValue;
- (STStatusBarDataStringEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataStringEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataStringEntry

+ (STStatusBarDataStringEntry)entryWithStringValue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = [v4 copy];

  v7 = (void *)v5[2];
  v5[2] = v6;

  return (STStatusBarDataStringEntry *)v5;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataStringEntry;
  v5 = [(STStatusBarDataEntry *)&v13 _equalsBuilderWithObject:v4];
  id v6 = v4;
  v7 = [(STStatusBarDataStringEntry *)self stringValue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__STStatusBarDataStringEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E6B630A8;
  id v12 = v6;
  id v8 = v6;
  id v9 = (id)[v5 appendString:v7 counterpart:v11];

  return v5;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
}

uint64_t __55__STStatusBarDataStringEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stringValue];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataStringEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, @"stringValue", v5.receiver, v5.super_class);
}

- (STStatusBarDataStringEntry)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataStringEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v8 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"stringValue", v8.receiver, v8.super_class);

  stringValue = v4->_stringValue;
  v4->_stringValue = (NSString *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataStringEntry;
  id v3 = [(STStatusBarDataEntry *)&v6 succinctDescriptionBuilder];
  id v4 = [(STStatusBarDataStringEntry *)self stringValue];
  [v3 appendString:v4 withName:@"stringValue"];

  return v3;
}

- (id)_hashBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataStringEntry;
  id v3 = [(STStatusBarDataEntry *)&v7 _hashBuilder];
  id v4 = [(STStatusBarDataStringEntry *)self stringValue];
  id v5 = (id)[v3 appendString:v4];

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataStringEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, @"stringValue", v5.receiver, v5.super_class);
}

- (STStatusBarDataStringEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataStringEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v9 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;
  }
  return v5;
}

@end