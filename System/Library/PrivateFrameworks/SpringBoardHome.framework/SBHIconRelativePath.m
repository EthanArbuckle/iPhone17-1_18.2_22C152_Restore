@interface SBHIconRelativePath
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)priorIconIdentifiers;
- (NSArray)subsequentIconIdentifiers;
- (NSString)description;
- (NSString)folderIdentifier;
- (NSString)listIdentifier;
- (SBHIconRelativePath)iconRelativePathWithFolderIdentifier:(id)a3 listIdentifier:(id)a4;
- (SBHIconRelativePath)initWithCoder:(id)a3;
- (SBHIconRelativePath)initWithFolderIdentifier:(id)a3 listIdentifier:(id)a4 priorIconIdentifiers:(id)a5 subsequentIconIdentifiers:(id)a6 gridCellInfoOptions:(unint64_t)a7;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)gridCellInfoOptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBHIconRelativePath

- (SBHIconRelativePath)initWithFolderIdentifier:(id)a3 listIdentifier:(id)a4 priorIconIdentifiers:(id)a5 subsequentIconIdentifiers:(id)a6 gridCellInfoOptions:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SBHIconRelativePath;
  v16 = [(SBHIconRelativePath *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    folderIdentifier = v16->_folderIdentifier;
    v16->_folderIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    listIdentifier = v16->_listIdentifier;
    v16->_listIdentifier = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    priorIconIdentifiers = v16->_priorIconIdentifiers;
    v16->_priorIconIdentifiers = (NSArray *)v21;

    uint64_t v23 = [v15 copy];
    subsequentIconIdentifiers = v16->_subsequentIconIdentifiers;
    v16->_subsequentIconIdentifiers = (NSArray *)v23;

    v16->_gridCellInfoOptions = a7;
  }

  return v16;
}

- (SBHIconRelativePath)iconRelativePathWithFolderIdentifier:(id)a3 listIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFolderIdentifier:v7 listIdentifier:v6 priorIconIdentifiers:self->_priorIconIdentifiers subsequentIconIdentifiers:self->_subsequentIconIdentifiers gridCellInfoOptions:self->_gridCellInfoOptions];

  return (SBHIconRelativePath *)v8;
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
  [v5 encodeObject:self->_priorIconIdentifiers forKey:@"priorIconIdentifiers"];
  [v5 encodeObject:self->_subsequentIconIdentifiers forKey:@"subsequentIconIdentifiers"];
  [v5 encodeInteger:self->_gridCellInfoOptions forKey:@"gridCellInfoOptions"];
}

- (SBHIconRelativePath)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"folderIdentifier"];

  id v7 = self;
  v8 = [v4 decodeObjectOfClass:v7 forKey:@"listIdentifier"];

  v9 = self;
  v10 = [v4 decodeArrayOfObjectsOfClass:v9 forKey:@"priorIconIdentifiers"];

  v11 = self;
  id v12 = [v4 decodeArrayOfObjectsOfClass:v11 forKey:@"subsequentIconIdentifiers"];

  uint64_t v13 = [v4 decodeIntegerForKey:@"gridCellInfoOptions"];
  id v14 = [(SBHIconRelativePath *)self initWithFolderIdentifier:v6 listIdentifier:v8 priorIconIdentifiers:v10 subsequentIconIdentifiers:v12 gridCellInfoOptions:v13];

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_folderIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_listIdentifier hash] + v3;
  uint64_t v5 = [(NSArray *)self->_priorIconIdentifiers hash];
  return v4 + v5 + [(NSArray *)self->_subsequentIconIdentifiers hash] + self->_gridCellInfoOptions;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SBHIconRelativePath *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      BOOL v8 = BSEqualStrings()
        && BSEqualStrings()
        && BSEqualArrays()
        && BSEqualArrays()
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
  return (NSString *)[(SBHIconRelativePath *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHIconRelativePath *)self succinctDescriptionBuilder];
  NSUInteger v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  NSUInteger v3 = [(SBHIconRelativePath *)self descriptionBuilderWithMultilinePrefix:a3];
  NSUInteger v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  NSUInteger v4 = [(SBHIconRelativePath *)self succinctDescriptionBuilder];
  uint64_t v5 = [(SBHIconRelativePath *)self folderIdentifier];
  [v4 appendString:v5 withName:@"folderIdentifier"];

  id v6 = [(SBHIconRelativePath *)self listIdentifier];
  [v4 appendString:v6 withName:@"listIdentifier"];

  id v7 = [(SBHIconRelativePath *)self priorIconIdentifiers];
  BOOL v8 = [v7 componentsJoinedByString:@","];
  [v4 appendString:v8 withName:@"priorIconIdentifiers"];

  v9 = [(SBHIconRelativePath *)self subsequentIconIdentifiers];
  v10 = [v9 componentsJoinedByString:@","];
  [v4 appendString:v10 withName:@"subsequentIconIdentifiers"];

  id v11 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", -[SBHIconRelativePath gridCellInfoOptions](self, "gridCellInfoOptions"), @"gridCellInfoOptions", 1);
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

- (NSArray)priorIconIdentifiers
{
  return self->_priorIconIdentifiers;
}

- (NSArray)subsequentIconIdentifiers
{
  return self->_subsequentIconIdentifiers;
}

- (unint64_t)gridCellInfoOptions
{
  return self->_gridCellInfoOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsequentIconIdentifiers, 0);
  objc_storeStrong((id *)&self->_priorIconIdentifiers, 0);
  objc_storeStrong((id *)&self->_listIdentifier, 0);
  objc_storeStrong((id *)&self->_folderIdentifier, 0);
}

@end