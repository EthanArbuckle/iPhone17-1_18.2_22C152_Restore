@interface STStatusBarDataBoolImageEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithImageNamed:(id)a3 BOOLValue:(BOOL)a4;
- (BOOL)BOOLValue;
- (STStatusBarDataBoolImageEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataBoolImageEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataBoolImageEntry

+ (id)entryWithImageNamed:(id)a3 BOOLValue:(BOOL)a4
{
  id result = (id)[a1 entryWithImageNamed:a3];
  *((unsigned char *)result + 24) = a4;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBoolImageEntry;
  id v4 = a3;
  [(STStatusBarDataImageEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_BOOLValue, @"BOOLValue", v5.receiver, v5.super_class);
}

- (STStatusBarDataBoolImageEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataBoolImageEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataImageEntry *)&v7 initWithCoder:v3];
  char v5 = objc_msgSend(v3, "decodeBoolForKey:", @"BOOLValue", v7.receiver, v7.super_class);

  v4->_BOOLValue = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataBoolImageEntry;
  id v3 = [(STStatusBarDataImageEntry *)&v6 succinctDescriptionBuilder];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataBoolImageEntry BOOLValue](self, "BOOLValue"), @"BOOLValue");

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataBoolImageEntry;
  char v5 = [(STStatusBarDataImageEntry *)&v13 _equalsBuilderWithObject:v4];
  id v6 = v4;
  BOOL v7 = [(STStatusBarDataBoolImageEntry *)self BOOLValue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__STStatusBarDataBoolImageEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E6B630D0;
  id v12 = v6;
  id v8 = v6;
  id v9 = (id)[v5 appendBool:v7 counterpart:v11];

  return v5;
}

uint64_t __58__STStatusBarDataBoolImageEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) BOOLValue];
}

- (id)_hashBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataBoolImageEntry;
  id v3 = [(STStatusBarDataImageEntry *)&v6 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataBoolImageEntry BOOLValue](self, "BOOLValue"));

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBoolImageEntry;
  id v4 = a3;
  [(STStatusBarDataImageEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_BOOLValue, @"BOOLValue", v5.receiver, v5.super_class);
}

- (STStatusBarDataBoolImageEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataBoolImageEntry;
  objc_super v5 = [(STStatusBarDataImageEntry *)&v7 initWithBSXPCCoder:v4];
  if (v5) {
    v5->_BOOLValue = [v4 decodeBoolForKey:@"BOOLValue"];
  }

  return v5;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

@end