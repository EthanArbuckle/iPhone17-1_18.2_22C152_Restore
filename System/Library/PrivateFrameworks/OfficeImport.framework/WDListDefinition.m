@interface WDListDefinition
- (NSString)styleId;
- (NSString)styleRefId;
- (WDListDefinition)initWithDocument:(id)a3 listDefinitionId:(int)a4 styleId:(id)a5;
- (id)addLevel;
- (id)description;
- (id)levelAt:(int)a3;
- (int)levelCount;
- (int)listDefinitionId;
- (int)type;
- (void)removeLastLevel;
- (void)setStyleRefId:(id)a3;
- (void)setType:(int)a3;
@end

@implementation WDListDefinition

- (id)addLevel
{
  if (!self->mLevels)
  {
    v3 = (NSMutableArray *)objc_opt_new();
    mLevels = self->mLevels;
    self->mLevels = v3;
  }
  v5 = [WDListLevel alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  v7 = [(WDListLevel *)v5 initWithDocument:WeakRetained];

  [(NSMutableArray *)self->mLevels addObject:v7];
  return v7;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)levelCount
{
  return [(NSMutableArray *)self->mLevels count];
}

- (id)levelAt:(int)a3
{
  if (self->mType) {
    int v4 = a3;
  }
  else {
    int v4 = 0;
  }
  int v5 = [(NSMutableArray *)self->mLevels count];
  if (v5)
  {
    mLevels = self->mLevels;
    if (v4 >= v5)
    {
      v8 = [(NSMutableArray *)mLevels objectAtIndex:0];
      if ([v8 legacy])
      {
        id v9 = v8;
      }
      else
      {
        id v9 = [(NSMutableArray *)self->mLevels lastObject];
      }
      v7 = v9;
    }
    else
    {
      v7 = [(NSMutableArray *)mLevels objectAtIndex:v4];
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int)type
{
  return self->mType;
}

- (void)removeLastLevel
{
}

- (WDListDefinition)initWithDocument:(id)a3 listDefinitionId:(int)a4 styleId:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WDListDefinition;
  v10 = [(WDListDefinition *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->mDocument, v8);
    v11->mListDefinitionId = a4;
    uint64_t v12 = [v9 copy];
    mStyleId = v11->mStyleId;
    v11->mStyleId = (NSString *)v12;
  }
  return v11;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDListDefinition;
  v2 = [(WDListDefinition *)&v4 description];
  return v2;
}

- (int)listDefinitionId
{
  return self->mListDefinitionId;
}

- (NSString)styleId
{
  return self->mStyleId;
}

- (NSString)styleRefId
{
  return self->mStyleRefId;
}

- (void)setStyleRefId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLevels, 0);
  objc_storeStrong((id *)&self->mStyleRefId, 0);
  objc_storeStrong((id *)&self->mStyleId, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end