@interface PXStoryStyleConfiguration
- (BOOL)isCustomized;
- (BOOL)isEqual:(id)a3;
- (NSString)originalColorGradeCategory;
- (PXStoryAutoEditDecisionList)autoEditDecisionList;
- (PXStorySongResource)songResource;
- (PXStoryStyleConfiguration)init;
- (PXStoryStyleConfiguration)initWithOriginalColorGradeCategory:(id)a3 customColorGradeKind:(int64_t)a4 songResource:(id)a5 autoEditDecisionList:(id)a6 isCustomized:(BOOL)a7;
- (id)copyWithAutoEditDecisionList:(id)a3;
- (id)copyWithCustomizedColorGradeKind:(int64_t)a3;
- (id)copyWithCustomizedSongResource:(id)a3;
- (id)description;
- (int64_t)customColorGradeKind;
- (unint64_t)hash;
@end

@implementation PXStoryStyleConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoEditDecisionList, 0);
  objc_storeStrong((id *)&self->_songResource, 0);
  objc_storeStrong((id *)&self->_originalColorGradeCategory, 0);
}

- (BOOL)isCustomized
{
  return self->_isCustomized;
}

- (PXStoryAutoEditDecisionList)autoEditDecisionList
{
  return self->_autoEditDecisionList;
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (NSString)originalColorGradeCategory
{
  return self->_originalColorGradeCategory;
}

- (unint64_t)hash
{
  v3 = [(PXStoryStyleConfiguration *)self originalColorGradeCategory];
  uint64_t v4 = [v3 hash];

  return v4 ^ (2 * [(PXStoryStyleConfiguration *)self customColorGradeKind]);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXStoryStyleConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(PXStoryStyleConfiguration *)self originalColorGradeCategory];
      id v7 = [(PXStoryStyleConfiguration *)v5 originalColorGradeCategory];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqualToString:v7];

        if (!v8) {
          goto LABEL_13;
        }
      }
      int64_t v10 = [(PXStoryStyleConfiguration *)self customColorGradeKind];
      if (v10 != [(PXStoryStyleConfiguration *)v5 customColorGradeKind])
      {
LABEL_13:
        LOBYTE(v9) = 0;
LABEL_22:

        goto LABEL_23;
      }
      id v11 = [(PXStoryStyleConfiguration *)self songResource];
      id v12 = [(PXStoryStyleConfiguration *)v5 songResource];
      if (v11 == v12)
      {
      }
      else
      {
        int v13 = [v11 isEqual:v12];

        if (!v13)
        {
          LOBYTE(v9) = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      id v14 = [(PXStoryStyleConfiguration *)self autoEditDecisionList];
      id v15 = [(PXStoryStyleConfiguration *)v5 autoEditDecisionList];
      if (v14 == v15)
      {
      }
      else
      {
        int v16 = [v14 isEqual:v15];

        if (!v16)
        {
          LOBYTE(v9) = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      BOOL v17 = [(PXStoryStyleConfiguration *)self isCustomized];
      BOOL v9 = v17 ^ [(PXStoryStyleConfiguration *)v5 isCustomized] ^ 1;
      goto LABEL_20;
    }
    LOBYTE(v9) = 0;
  }
LABEL_23:

  return v9;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(PXStoryStyleConfiguration *)self originalColorGradeCategory];
  [(PXStoryStyleConfiguration *)self customColorGradeKind];
  id v7 = PFStoryColorGradeKindToString();
  int v8 = [(PXStoryStyleConfiguration *)self songResource];
  BOOL v9 = [(PXStoryStyleConfiguration *)self autoEditDecisionList];
  int64_t v10 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; colorGradeCategory: %@; colorGradeKind: %@; songResource: %@; EDL:%@>",
                  v5,
                  self,
                  v6,
                  v7,
                  v8,
                  v9);

  return v10;
}

- (id)copyWithAutoEditDecisionList:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(PXStoryStyleConfiguration *)self originalColorGradeCategory];
  int64_t v7 = [(PXStoryStyleConfiguration *)self customColorGradeKind];
  int v8 = [(PXStoryStyleConfiguration *)self songResource];
  BOOL v9 = objc_msgSend(v5, "initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:", v6, v7, v8, v4, -[PXStoryStyleConfiguration isCustomized](self, "isCustomized"));

  return v9;
}

- (id)copyWithCustomizedSongResource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(PXStoryStyleConfiguration *)self originalColorGradeCategory];
  int64_t v7 = [(PXStoryStyleConfiguration *)self customColorGradeKind];
  int v8 = [(PXStoryStyleConfiguration *)self autoEditDecisionList];
  BOOL v9 = (void *)[v5 initWithOriginalColorGradeCategory:v6 customColorGradeKind:v7 songResource:v4 autoEditDecisionList:v8 isCustomized:1];

  return v9;
}

- (id)copyWithCustomizedColorGradeKind:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(PXStoryStyleConfiguration *)self originalColorGradeCategory];
  int64_t v7 = [(PXStoryStyleConfiguration *)self songResource];
  int v8 = [(PXStoryStyleConfiguration *)self autoEditDecisionList];
  BOOL v9 = (void *)[v5 initWithOriginalColorGradeCategory:v6 customColorGradeKind:a3 songResource:v7 autoEditDecisionList:v8 isCustomized:1];

  return v9;
}

- (PXStoryStyleConfiguration)initWithOriginalColorGradeCategory:(id)a3 customColorGradeKind:(int64_t)a4 songResource:(id)a5 autoEditDecisionList:(id)a6 isCustomized:(BOOL)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryStyleConfiguration;
  id v15 = [(PXStoryStyleConfiguration *)&v19 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    originalColorGradeCategory = v15->_originalColorGradeCategory;
    v15->_originalColorGradeCategory = (NSString *)v16;

    v15->_customColorGradeKind = a4;
    objc_storeStrong((id *)&v15->_songResource, a5);
    objc_storeStrong((id *)&v15->_autoEditDecisionList, a6);
    v15->_isCustomized = a7;
  }

  return v15;
}

- (PXStoryStyleConfiguration)init
{
  return [(PXStoryStyleConfiguration *)self initWithOriginalColorGradeCategory:0 customColorGradeKind:0 songResource:0 autoEditDecisionList:0 isCustomized:0];
}

@end