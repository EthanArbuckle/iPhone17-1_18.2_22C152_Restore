@interface STStatusBarDataEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)disabledEntry;
+ (id)entry;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (STStatusBarDataEntry)init;
- (STStatusBarDataEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataEntry)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataEntry

+ (id)disabledEntry
{
  v2 = objc_alloc_init((Class)a1);
  v2[8] = 0;

  return v2;
}

- (STStatusBarDataEntry)init
{
  v3.receiver = self;
  v3.super_class = (Class)STStatusBarDataEntry;
  result = [(STStatusBarDataEntry *)&v3 init];
  result->_enabled = 1;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v4 isEnabled] & 1) != 0
    || [(STStatusBarDataEntry *)self isEnabled])
  {
    v5 = [(STStatusBarDataEntry *)self _equalsBuilderWithObject:v4];
    char v6 = [v5 isEqual];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL v6 = [(STStatusBarDataEntry *)self isEnabled];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__STStatusBarDataEntry__equalsBuilderWithObject___block_invoke;
  v10[3] = &unk_1E6B630D0;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendBool:v6 counterpart:v10];

  return v5;
}

uint64_t __49__STStatusBarDataEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isEnabled];
}

+ (id)entry
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (STStatusBarDataEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v7 init];
  char v5 = objc_msgSend(v3, "decodeBoolForKey:", @"enabled", v7.receiver, v7.super_class);

  v4->_enabled = v5;
  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (STStatusBarDataEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataEntry;
  char v5 = [(STStatusBarDataEntry *)&v7 init];
  if (v5) {
    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[(STStatusBarDataEntry *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STStatusBarDataEntry *)self debugDescriptionWithMultilinePrefix:0];
}

- (unint64_t)hash
{
  id v2 = [(STStatusBarDataEntry *)self _hashBuilder];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)_hashBuilder
{
  unint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[STStatusBarDataEntry isEnabled](self, "isEnabled"));

  return v3;
}

- (id)succinctDescription
{
  id v2 = [(STStatusBarDataEntry *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  unint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[STStatusBarDataEntry isEnabled](self, "isEnabled"), @"enabled");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(STStatusBarDataEntry *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(STStatusBarDataEntry *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STStatusBarDataEntry *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(STStatusBarDataEntry *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  return v7;
}

@end