@interface STStatusBarDataBoolEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (STStatusBarDataBoolEntry)entryWithBoolValue:(BOOL)a3;
- (BOOL)BOOLValue;
- (STStatusBarDataBoolEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataBoolEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataBoolEntry

- (BOOL)BOOLValue
{
  return *(&self->super._enabled + 1);
}

+ (STStatusBarDataBoolEntry)entryWithBoolValue:(BOOL)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[9] = a3;

  return (STStatusBarDataBoolEntry *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBoolEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), @"BOOLValue", v5.receiver, v5.super_class);
}

- (STStatusBarDataBoolEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataBoolEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v7 initWithCoder:v3];
  char v5 = objc_msgSend(v3, "decodeBoolForKey:", @"BOOLValue", v7.receiver, v7.super_class);

  *(&v4->super._enabled + 1) = v5;
  return v4;
}

- (id)succinctDescriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataBoolEntry;
  id v3 = [(STStatusBarDataEntry *)&v6 succinctDescriptionBuilder];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataBoolEntry BOOLValue](self, "BOOLValue"), @"BOOLValue");

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataBoolEntry;
  char v5 = [(STStatusBarDataEntry *)&v13 _equalsBuilderWithObject:v4];
  id v6 = v4;
  BOOL v7 = [(STStatusBarDataBoolEntry *)self BOOLValue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__STStatusBarDataBoolEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E6B630D0;
  id v12 = v6;
  id v8 = v6;
  id v9 = (id)[v5 appendBool:v7 counterpart:v11];

  return v5;
}

uint64_t __53__STStatusBarDataBoolEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) BOOLValue];
}

- (id)_hashBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataBoolEntry;
  id v3 = [(STStatusBarDataEntry *)&v6 _hashBuilder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataBoolEntry BOOLValue](self, "BOOLValue"));

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataBoolEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), @"BOOLValue", v5.receiver, v5.super_class);
}

- (STStatusBarDataBoolEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataBoolEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v7 initWithBSXPCCoder:v4];
  if (v5) {
    *(&v5->super._enabled + 1) = [v4 decodeBoolForKey:@"BOOLValue"];
  }

  return v5;
}

@end