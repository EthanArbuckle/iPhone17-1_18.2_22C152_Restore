@interface TUIInteractionsHelper
- (NSArray)linkEntities;
- (NSArray)linkEntityInteractions;
- (TUIInteractionsHelper)initWithView:(id)a3;
- (void)detachInteractions;
- (void)updateInteractionsWithBuilder:(id)a3;
- (void)updateWithLinkEntities:(id)a3;
@end

@implementation TUIInteractionsHelper

- (TUIInteractionsHelper)initWithView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIInteractionsHelper;
  result = [(TUIInteractionsHelper *)&v5 init];
  if (result)
  {
    result->_view = (UIView *)a3;
    result->_flags.linkEntitiesNeedsUpdate = 0;
  }
  return result;
}

- (void)updateWithLinkEntities:(id)a3
{
  v4 = (NSArray *)a3;
  linkEntities = self->_linkEntities;
  if (linkEntities != v4)
  {
    v9 = v4;
    unsigned __int8 v6 = [(NSArray *)linkEntities isEqual:v4];
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)[(NSArray *)v9 copy];
      v8 = self->_linkEntities;
      self->_linkEntities = v7;

      v4 = v9;
      self->_flags.linkEntitiesNeedsUpdate = 1;
    }
  }
}

- (void)detachInteractions
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_linkEntityInteractions;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[UIView removeInteraction:](self->_view, "removeInteraction:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v7), (void)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  linkEntityInteractions = self->_linkEntityInteractions;
  self->_linkEntityInteractions = 0;
}

- (void)updateInteractionsWithBuilder:(id)a3
{
  id v4 = a3;
  if (self->_flags.linkEntitiesNeedsUpdate)
  {
    self->_flags.linkEntitiesNeedsUpdate = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = self->_linkEntityInteractions;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          [(UIView *)self->_view removeInteraction:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v10 = self->_linkEntities;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      v13 = 0;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = [v4 interactionForLinkEntity:*(void *)(*((void *)&v19 + 1) + 8 * (void)j) v19];
          if (v16)
          {
            if (!v13) {
              v13 = objc_opt_new();
            }
            [v13 addObject:v16];
            [(UIView *)self->_view addInteraction:v16];
          }
        }
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    v17 = (NSArray *)[v13 copy];
    linkEntityInteractions = self->_linkEntityInteractions;
    self->_linkEntityInteractions = v17;
  }
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (NSArray)linkEntityInteractions
{
  return self->_linkEntityInteractions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntityInteractions, 0);

  objc_storeStrong((id *)&self->_linkEntities, 0);
}

@end