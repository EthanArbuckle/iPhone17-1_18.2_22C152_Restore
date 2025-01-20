@interface STStatusBarDataQuietModeEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (STStatusBarDataQuietModeEntry)entryWithFocusName:(id)a3 imageNamed:(id)a4 BOOLValue:(BOOL)a5;
- (NSString)focusName;
- (STStatusBarDataQuietModeEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataQuietModeEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataQuietModeEntry

- (void).cxx_destruct
{
}

+ (STStatusBarDataQuietModeEntry)entryWithFocusName:(id)a3 imageNamed:(id)a4 BOOLValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [a1 entryWithImageNamed:a4 BOOLValue:v5];
  uint64_t v10 = [v8 copy];

  v11 = (void *)v9[4];
  v9[4] = v10;

  return (STStatusBarDataQuietModeEntry *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataQuietModeEntry;
  id v4 = a3;
  [(STStatusBarDataBoolImageEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_focusName, @"focusName", v5.receiver, v5.super_class);
}

- (STStatusBarDataQuietModeEntry)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataQuietModeEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataBoolImageEntry *)&v8 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"focusName", v8.receiver, v8.super_class);

  focusName = v4->_focusName;
  v4->_focusName = (NSString *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataQuietModeEntry;
  id v3 = [(STStatusBarDataBoolImageEntry *)&v6 succinctDescriptionBuilder];
  id v4 = [(STStatusBarDataQuietModeEntry *)self focusName];
  [v3 appendString:v4 withName:@"focusName"];

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STStatusBarDataQuietModeEntry;
  uint64_t v5 = [(STStatusBarDataBoolImageEntry *)&v13 _equalsBuilderWithObject:v4];
  id v6 = v4;
  v7 = [(STStatusBarDataQuietModeEntry *)self focusName];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__STStatusBarDataQuietModeEntry__equalsBuilderWithObject___block_invoke;
  v11[3] = &unk_1E6B630A8;
  id v12 = v6;
  id v8 = v6;
  id v9 = (id)[v5 appendString:v7 counterpart:v11];

  return v5;
}

uint64_t __58__STStatusBarDataQuietModeEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) focusName];
}

- (id)_hashBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataQuietModeEntry;
  id v3 = [(STStatusBarDataBoolImageEntry *)&v7 _hashBuilder];
  id v4 = [(STStatusBarDataQuietModeEntry *)self focusName];
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
  v5.super_class = (Class)STStatusBarDataQuietModeEntry;
  id v4 = a3;
  [(STStatusBarDataBoolImageEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_focusName, @"focusName", v5.receiver, v5.super_class);
}

- (STStatusBarDataQuietModeEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataQuietModeEntry;
  objc_super v5 = [(STStatusBarDataBoolImageEntry *)&v9 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"focusName"];
    focusName = v5->_focusName;
    v5->_focusName = (NSString *)v6;
  }
  return v5;
}

- (NSString)focusName
{
  return self->_focusName;
}

@end