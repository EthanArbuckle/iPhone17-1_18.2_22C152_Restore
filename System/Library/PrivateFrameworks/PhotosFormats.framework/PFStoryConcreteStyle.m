@interface PFStoryConcreteStyle
- (BOOL)isCustomized;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStyle:(id)a3;
- (NSString)diagnosticDescription;
- (NSString)identifier;
- (NSString)originalColorGradeCategory;
- (NSString)songAssetIdentifier;
- (PFStoryConcreteStyle)init;
- (PFStoryConcreteStyle)initWithIdentifier:(id)a3 originalColorGradeCategory:(id)a4 customColorGradeKind:(int64_t)a5 songAssetIdentifier:(id)a6 isCustomized:(BOOL)a7;
- (int64_t)customColorGradeKind;
@end

@implementation PFStoryConcreteStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_originalColorGradeCategory, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isCustomized
{
  return self->_isCustomized;
}

- (NSString)songAssetIdentifier
{
  return self->_songAssetIdentifier;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (NSString)originalColorGradeCategory
{
  return self->_originalColorGradeCategory;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqualToStyle:(id)a3
{
  v4 = (PFStoryConcreteStyle *)a3;
  if (self != v4)
  {
    id v5 = [(PFStoryConcreteStyle *)self originalColorGradeCategory];
    id v6 = [(PFStoryConcreteStyle *)v4 originalColorGradeCategory];
    if (v5 == v6)
    {
    }
    else
    {
      int v7 = [v5 isEqual:v6];

      if (!v7) {
        goto LABEL_11;
      }
    }
    int64_t v9 = [(PFStoryConcreteStyle *)self customColorGradeKind];
    if (v9 != [(PFStoryConcreteStyle *)v4 customColorGradeKind])
    {
LABEL_11:
      LOBYTE(v8) = 0;
LABEL_15:

      goto LABEL_16;
    }
    id v10 = [(PFStoryConcreteStyle *)self songAssetIdentifier];
    id v11 = [(PFStoryConcreteStyle *)v4 songAssetIdentifier];
    if (v10 == v11)
    {
    }
    else
    {
      int v12 = [v10 isEqual:v11];

      if (!v12)
      {
        LOBYTE(v8) = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    BOOL v13 = [(PFStoryConcreteStyle *)self isCustomized];
    BOOL v8 = v13 ^ [(PFStoryConcreteStyle *)v4 isCustomized] ^ 1;
    goto LABEL_14;
  }
  LOBYTE(v8) = 1;
LABEL_16:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isEqualToStyle:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (NSString)diagnosticDescription
{
  v3 = objc_alloc_init(PFStoryRecipeArchiver);
  id v4 = [(PFStoryRecipeArchiver *)v3 archivedJSONObjectWithStyle:self];
  char v5 = [v4 description];

  return (NSString *)v5;
}

- (PFStoryConcreteStyle)initWithIdentifier:(id)a3 originalColorGradeCategory:(id)a4 customColorGradeKind:(int64_t)a5 songAssetIdentifier:(id)a6 isCustomized:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PFStoryConcreteStyle;
  v15 = [(PFStoryConcreteStyle *)&v25 init];
  if (v15)
  {
    if (v12)
    {
      v16 = (NSString *)v12;
      identifier = v15->_identifier;
      v15->_identifier = v16;
    }
    else
    {
      identifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v18 = [identifier UUIDString];
      v19 = v15->_identifier;
      v15->_identifier = (NSString *)v18;
    }
    uint64_t v20 = [v13 copy];
    originalColorGradeCategory = v15->_originalColorGradeCategory;
    v15->_originalColorGradeCategory = (NSString *)v20;

    v15->_customColorGradeKind = a5;
    uint64_t v22 = [v14 copy];
    songAssetIdentifier = v15->_songAssetIdentifier;
    v15->_songAssetIdentifier = (NSString *)v22;

    v15->_isCustomized = a7;
  }

  return v15;
}

- (PFStoryConcreteStyle)init
{
  v2 = (void *)_PFAssertFailHandler();
  return (PFStoryConcreteStyle *)+[PFStoryRecipeStyleFactory createStyleWithOriginalColorGradeCategory:v4 customColorGradeKind:v5 songAssetIdentifier:v6 isCustomized:v7];
}

@end