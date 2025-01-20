@interface TUIRenderModelAuxiliary
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (NSArray)navigationItems;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIIdentifier)identifier;
- (TUIRenderModelAuxiliary)initWithModels:(id)a3;
- (TUIRenderModelAuxiliary)initWithNavigationItems:(id)a3;
- (id)triggers;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TUIRenderModelAuxiliary

- (TUIRenderModelAuxiliary)initWithNavigationItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIRenderModelAuxiliary;
  v5 = [(TUIRenderModelAuxiliary *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    navigationItems = v5->_navigationItems;
    v5->_navigationItems = v6;
  }
  return v5;
}

- (TUIRenderModelAuxiliary)initWithModels:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUIRenderModelAuxiliary;
  v5 = [(TUIRenderModelAuxiliary *)&v19 init];
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v11) navigationItems:(void)v15];
          [(NSArray *)v6 addObjectsFromArray:v12];

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    navigationItems = v5->_navigationItems;
    v5->_navigationItems = v6;
  }
  return v5;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = self->_navigationItems;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        long long v13 = *(_OWORD *)&a4->c;
        v14[0] = *(_OWORD *)&a4->a;
        v14[1] = v13;
        v14[2] = *(_OWORD *)&a4->tx;
        [v12 appendResourcesToCollector:v6 transform:v14];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (unint64_t)kind
{
  return 9;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = TUIDynamicCast(v5, v4);

  if (TUIRenderModelIsEqualToRenderModel(self, v6))
  {
    id v7 = [(TUIRenderModelAuxiliary *)self navigationItems];
    id v8 = [v6 navigationItems];
    BOOL v9 = v7 == v8 || [v7 isEqual:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (id)triggers
{
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_navigationItems;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 observeTrigger:v14];
        id v11 = [v10 length];

        if (v11)
        {
          v12 = [v9 observeTrigger];
          [v3 addObject:v12];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)hash
{
  v2 = [(TUIRenderModelAuxiliary *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (NSArray)navigationItems
{
  return self->_navigationItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationItems, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end