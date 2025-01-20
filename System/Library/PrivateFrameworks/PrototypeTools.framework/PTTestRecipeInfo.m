@interface PTTestRecipeInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSIndexSet)events;
- (NSString)domainIdentifier;
- (NSString)recipeDescription;
- (NSString)title;
- (NSString)uniqueIdentifier;
- (PTTestRecipeInfo)initWithCoder:(id)a3;
- (PTTestRecipeInfo)initWithTestRecipe:(id)a3 domainInfo:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PTTestRecipeInfo

- (PTTestRecipeInfo)initWithTestRecipe:(id)a3 domainInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PTTestRecipeInfo;
  v8 = [(PTTestRecipeInfo *)&v26 init];
  if (v8)
  {
    uint64_t v9 = [v7 uniqueIdentifier];
    domainIdentifier = v8->_domainIdentifier;
    v8->_domainIdentifier = (NSString *)v9;

    uint64_t v11 = [v6 title];
    title = v8->_title;
    v8->_title = (NSString *)v11;

    v13 = NSString;
    v14 = [v7 domainGroupName];
    v15 = [v7 domainName];
    uint64_t v16 = [v13 stringWithFormat:@"%@ – %@: %@", v14, v15, v8->_title];
    recipeDescription = v8->_recipeDescription;
    v8->_recipeDescription = (NSString *)v16;

    v18 = [MEMORY[0x1E4F28E60] indexSet];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__PTTestRecipeInfo_initWithTestRecipe_domainInfo___block_invoke;
    v23[3] = &unk_1E63BC790;
    id v24 = v6;
    id v25 = v18;
    id v19 = v18;
    PTPrototypingEnumerateHardwareEventsWithBlock(v23);
    uint64_t v20 = [v19 copy];
    events = v8->_events;
    v8->_events = (NSIndexSet *)v20;
  }
  return v8;
}

uint64_t __50__PTTestRecipeInfo_initWithTestRecipe_domainInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _wantsEvent:a2];
  if (result)
  {
    v5 = *(void **)(a1 + 40);
    return [v5 addIndex:a2];
  }
  return result;
}

- (NSString)uniqueIdentifier
{
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v5 = [(NSString *)self->_title componentsSeparatedByCharactersInSet:v4];
    id v6 = [v5 componentsJoinedByString:&stru_1F19C8540];

    id v7 = [NSString stringWithFormat:@"%@-%@", self->_domainIdentifier, v6];
    v8 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v7;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  return uniqueIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && BSEqualStrings()
    && BSEqualStrings()
    && BSEqualObjects())
  {
    char v4 = BSEqualStrings();
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_title];
  id v5 = (id)[v3 appendString:self->_domainIdentifier];
  id v6 = (id)[v3 appendObject:self->_events];
  id v7 = (id)[v3 appendString:self->_recipeDescription];
  unint64_t v8 = [v3 hash];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  domainIdentifier = self->_domainIdentifier;
  id v5 = a3;
  [v5 encodeObject:domainIdentifier forKey:@"domainIdentifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_events forKey:@"events"];
  [v5 encodeObject:self->_recipeDescription forKey:@"description"];
}

- (PTTestRecipeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PTTestRecipeInfo;
  id v5 = [(PTTestRecipeInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainIdentifier"];
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"events"];
    events = v5->_events;
    v5->_events = (NSIndexSet *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
    recipeDescription = v5->_recipeDescription;
    v5->_recipeDescription = (NSString *)v12;
  }
  return v5;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSIndexSet)events
{
  return self->_events;
}

- (NSString)recipeDescription
{
  return self->_recipeDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeDescription, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end