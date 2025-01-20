@interface STStatusBarDataImageEntry
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)entryWithImageNamed:(id)a3;
- (NSString)imageName;
- (STStatusBarDataImageEntry)initWithBSXPCCoder:(id)a3;
- (STStatusBarDataImageEntry)initWithCoder:(id)a3;
- (id)_equalsBuilderWithObject:(id)a3;
- (id)_hashBuilder;
- (id)succinctDescriptionBuilder;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataImageEntry

- (void).cxx_destruct
{
}

+ (id)entryWithImageNamed:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = [v4 copy];

  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataImageEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageName, @"imageName", v5.receiver, v5.super_class);
}

- (STStatusBarDataImageEntry)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataImageEntry;
  id v3 = a3;
  id v4 = [(STStatusBarDataEntry *)&v8 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"imageName", v8.receiver, v8.super_class);

  imageName = v4->_imageName;
  v4->_imageName = (NSString *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataImageEntry;
  id v3 = [(STStatusBarDataEntry *)&v6 succinctDescriptionBuilder];
  id v4 = [(STStatusBarDataImageEntry *)self imageName];
  [v3 appendString:v4 withName:@"imageName"];

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STStatusBarDataImageEntry;
  uint64_t v5 = [(STStatusBarDataEntry *)&v12 _equalsBuilderWithObject:v4];
  objc_super v6 = [(STStatusBarDataImageEntry *)self imageName];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__STStatusBarDataImageEntry__equalsBuilderWithObject___block_invoke;
  v10[3] = &unk_1E6B630A8;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendString:v6 counterpart:v10];

  return v5;
}

uint64_t __54__STStatusBarDataImageEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) imageName];
}

- (id)_hashBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataImageEntry;
  id v3 = [(STStatusBarDataEntry *)&v7 _hashBuilder];
  id v4 = [(STStatusBarDataImageEntry *)self imageName];
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
  v5.super_class = (Class)STStatusBarDataImageEntry;
  id v4 = a3;
  [(STStatusBarDataEntry *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageName, @"imageName", v5.receiver, v5.super_class);
}

- (STStatusBarDataImageEntry)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusBarDataImageEntry;
  objc_super v5 = [(STStatusBarDataEntry *)&v9 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"imageName"];
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;
  }
  return v5;
}

- (NSString)imageName
{
  return self->_imageName;
}

@end