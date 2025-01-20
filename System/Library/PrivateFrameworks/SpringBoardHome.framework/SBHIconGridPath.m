@interface SBHIconGridPath
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)folderIdentifier;
- (NSString)listIdentifier;
- (SBHIconGridPath)iconGridPathWithGridCellIndex:(unint64_t)a3;
- (SBHIconGridPath)iconGridPathWithListIdentifier:(id)a3 gridCellIndex:(unint64_t)a4;
- (SBHIconGridPath)initWithCoder:(id)a3;
- (SBHIconGridPath)initWithFolderIdentifier:(id)a3 listIdentifier:(id)a4 gridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)gridCellIndex;
- (unint64_t)gridCellInfoOptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBHIconGridPath

- (SBHIconGridPath)initWithFolderIdentifier:(id)a3 listIdentifier:(id)a4 gridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBHIconGridPath;
  v12 = [(SBHIconGridPath *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    folderIdentifier = v12->_folderIdentifier;
    v12->_folderIdentifier = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    listIdentifier = v12->_listIdentifier;
    v12->_listIdentifier = (NSString *)v15;

    v12->_gridCellIndex = a5;
    v12->_gridCellInfoOptions = a6;
  }

  return v12;
}

- (SBHIconGridPath)iconGridPathWithListIdentifier:(id)a3 gridCellIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  v8 = [(SBHIconGridPath *)self folderIdentifier];
  v9 = objc_msgSend(v7, "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v8, v6, a4, -[SBHIconGridPath gridCellInfoOptions](self, "gridCellInfoOptions"));

  return (SBHIconGridPath *)v9;
}

- (SBHIconGridPath)iconGridPathWithGridCellIndex:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(SBHIconGridPath *)self folderIdentifier];
  id v7 = [(SBHIconGridPath *)self listIdentifier];
  v8 = objc_msgSend(v5, "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v6, v7, a3, -[SBHIconGridPath gridCellInfoOptions](self, "gridCellInfoOptions"));

  return (SBHIconGridPath *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  folderIdentifier = self->_folderIdentifier;
  id v5 = a3;
  [v5 encodeObject:folderIdentifier forKey:@"folderIdentifier"];
  [v5 encodeObject:self->_listIdentifier forKey:@"listIdentifier"];
  [v5 encodeInteger:self->_gridCellIndex forKey:@"gridCellIndex"];
  [v5 encodeInteger:self->_gridCellInfoOptions forKey:@"gridCellInfoOptions"];
}

- (SBHIconGridPath)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"folderIdentifier"];

  id v7 = self;
  v8 = [v4 decodeObjectOfClass:v7 forKey:@"listIdentifier"];

  uint64_t v9 = [v4 decodeIntegerForKey:@"gridCellIndex"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"gridCellInfoOptions"];

  id v11 = [(SBHIconGridPath *)self initWithFolderIdentifier:v6 listIdentifier:v8 gridCellIndex:v9 gridCellInfoOptions:v10];
  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_folderIdentifier hash];
  return [(NSString *)self->_listIdentifier hash] + v3 + self->_gridCellIndex + self->_gridCellInfoOptions;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBHIconGridPath *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      BOOL v8 = BSEqualStrings()
        && BSEqualStrings()
        && self->_gridCellIndex == v7->_gridCellIndex
        && self->_gridCellInfoOptions == v7->_gridCellInfoOptions;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)[(SBHIconGridPath *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHIconGridPath *)self succinctDescriptionBuilder];
  NSUInteger v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  NSUInteger v3 = [(SBHIconGridPath *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBHIconGridPath *)self succinctDescriptionBuilder];
  id v5 = [(SBHIconGridPath *)self folderIdentifier];
  [v4 appendString:v5 withName:@"folderIdentifier"];

  id v6 = [(SBHIconGridPath *)self listIdentifier];
  [v4 appendString:v6 withName:@"listIdentifier"];

  id v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBHIconGridPath gridCellIndex](self, "gridCellIndex"), @"gridCellIndex");
  BOOL v8 = SBHStringForGridCellInfoOptions([(SBHIconGridPath *)self gridCellInfoOptions]);
  [v4 appendString:v8 withName:@"gridCellInfoOptions"];

  return v4;
}

- (NSString)folderIdentifier
{
  return self->_folderIdentifier;
}

- (NSString)listIdentifier
{
  return self->_listIdentifier;
}

- (unint64_t)gridCellIndex
{
  return self->_gridCellIndex;
}

- (unint64_t)gridCellInfoOptions
{
  return self->_gridCellInfoOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listIdentifier, 0);
  objc_storeStrong((id *)&self->_folderIdentifier, 0);
}

@end