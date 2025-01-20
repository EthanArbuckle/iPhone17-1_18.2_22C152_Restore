@interface SBHFeatureIntroductionManager
- (NSString)description;
- (SBHFeatureIntroductionManager)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)featureIntroductionItemAtLocation:(unint64_t)a3;
- (id)featureIntroductionItemAtLocation:(unint64_t)a3 withIdentifier:(id)a4;
- (id)featureIntroductionItemsSetAtLocation:(unint64_t)a3;
- (id)featureLocationKeyFromLocation:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)featureLocationFromMask:(unint64_t)a3;
- (void)addFeatureIntroductionItem:(id)a3 atLocations:(unint64_t)a4;
- (void)removeAllFeatureIntroductionsAtLocations:(unint64_t)a3;
- (void)removeFeatureIntroductionAtAllLocationsWithItem:(id)a3;
- (void)removeFeatureIntroductionItem:(id)a3 atLocations:(unint64_t)a4;
@end

@implementation SBHFeatureIntroductionManager

- (SBHFeatureIntroductionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBHFeatureIntroductionManager;
  v2 = [(SBHFeatureIntroductionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    allFeatureIntroductionItems = v2->_allFeatureIntroductionItems;
    v2->_allFeatureIntroductionItems = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)featureLocationKeyFromLocation:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return off_1E6AAF888[a3 - 1];
  }
}

- (unint64_t)featureLocationFromMask:(unint64_t)a3
{
  *((void *)&v4 + 1) = a3;
  *(void *)&long long v4 = a3 - 2;
  unint64_t v3 = v4 >> 1;
  if (v3 > 7) {
    return 0;
  }
  else {
    return qword_1D81E5210[v3];
  }
}

- (id)featureIntroductionItemsSetAtLocation:(unint64_t)a3
{
  allFeatureIntroductionItems = self->_allFeatureIntroductionItems;
  objc_super v6 = -[SBHFeatureIntroductionManager featureLocationKeyFromLocation:](self, "featureLocationKeyFromLocation:");
  v7 = [(NSMutableDictionary *)allFeatureIntroductionItems objectForKey:v6];

  if (!v7)
  {
    v7 = [MEMORY[0x1E4F1CA80] set];
    v8 = self->_allFeatureIntroductionItems;
    v9 = [(SBHFeatureIntroductionManager *)self featureLocationKeyFromLocation:a3];
    [(NSMutableDictionary *)v8 setValue:v7 forKey:v9];
  }
  return v7;
}

- (void)addFeatureIntroductionItem:(id)a3 atLocations:(unint64_t)a4
{
  id v10 = a3;
  if (!v10 || !a4) {
    goto LABEL_8;
  }
  if ((a4 & 2) == 0)
  {
    if ((a4 & 4) == 0) {
      goto LABEL_5;
    }
LABEL_12:
    v8 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:4]];
    [v8 addObject:v10];

    if ((a4 & 8) == 0)
    {
LABEL_6:
      if ((a4 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    goto LABEL_13;
  }
  v7 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:2]];
  [v7 addObject:v10];

  if ((a4 & 4) != 0) {
    goto LABEL_12;
  }
LABEL_5:
  if ((a4 & 8) == 0) {
    goto LABEL_6;
  }
LABEL_13:
  v9 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:8]];
  [v9 addObject:v10];

  if ((a4 & 0x10) != 0)
  {
LABEL_7:
    objc_super v6 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:16]];
    [v6 addObject:v10];
  }
LABEL_8:
}

- (void)removeFeatureIntroductionItem:(id)a3 atLocations:(unint64_t)a4
{
  char v4 = a4;
  id v10 = a3;
  if ((v4 & 2) != 0)
  {
    v7 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:2]];
    [v7 removeObject:v10];

    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:4]];
  [v8 removeObject:v10];

  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:8]];
  [v9 removeObject:v10];

  if ((v4 & 0x10) != 0)
  {
LABEL_5:
    objc_super v6 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:16]];
    [v6 removeObject:v10];
  }
LABEL_6:
}

- (void)removeFeatureIntroductionAtAllLocationsWithItem:(id)a3
{
  id v4 = a3;
  v5 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:2]];
  [v5 removeObject:v4];

  objc_super v6 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:4]];
  [v6 removeObject:v4];

  v7 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:8]];
  [v7 removeObject:v4];

  id v8 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:16]];
  [v8 removeObject:v4];
}

- (void)removeAllFeatureIntroductionsAtLocations:(unint64_t)a3
{
  char v3 = a3;
  if ((a3 & 2) != 0)
  {
    v5 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:2]];
    [v5 removeAllObjects];

    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      v7 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:8]];
      [v7 removeAllObjects];

      if ((v3 & 0x10) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v6 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:4]];
  [v6 removeAllObjects];

  if ((v3 & 8) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((v3 & 0x10) == 0) {
    return;
  }
LABEL_9:
  id v8 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:16]];
  [v8 removeAllObjects];
}

- (id)featureIntroductionItemAtLocation:(unint64_t)a3
{
  uint64_t v3 = 4;
  unint64_t v4 = a3 & 0x10;
  if ((a3 & 8) != 0) {
    unint64_t v4 = 8;
  }
  if ((a3 & 4) == 0) {
    uint64_t v3 = v4;
  }
  if ((a3 & 2) != 0) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v3;
  }
  objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemsSetAtLocation:[(SBHFeatureIntroductionManager *)self featureLocationFromMask:v5]];
  id v8 = [v6 setWithSet:v7];

  return v8;
}

- (id)featureIntroductionItemAtLocation:(unint64_t)a3 withIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(SBHFeatureIntroductionManager *)self featureIntroductionItemAtLocation:a3];
  id v8 = [v7 allObjects];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "featureIntroductionIdentifier", (void)v17);
        char v15 = [v14 isEqual:v6];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (NSString)description
{
  return (NSString *)[(SBHFeatureIntroductionManager *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBHFeatureIntroductionManager *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  unint64_t v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_allFeatureIntroductionItems withName:@"_allFeatureIntroductionItems"];
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBHFeatureIntroductionManager *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void).cxx_destruct
{
}

@end