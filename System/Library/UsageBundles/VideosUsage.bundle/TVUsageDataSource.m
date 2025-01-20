@interface TVUsageDataSource
- (BOOL)isEqual:(id)a3;
- (NSString)categoryIdentifier;
- (TVUsageDataSource)initWithQuery:(id)a3 entityType:(int64_t)a4 categoryIdentifier:(id)a5 usageItemBlock:(id)a6 usageHeaderBlock:(id)a7;
- (id)_prunedDataSource;
- (id)headerBlock;
- (id)headerItem;
- (id)itemBlock;
- (id)usageItemForEntity:(id)a3;
- (unint64_t)count;
- (void)setHeaderBlock:(id)a3;
- (void)setItemBlock:(id)a3;
@end

@implementation TVUsageDataSource

- (TVUsageDataSource)initWithQuery:(id)a3 entityType:(int64_t)a4 categoryIdentifier:(id)a5 usageItemBlock:(id)a6 usageHeaderBlock:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TVUsageDataSource;
  v16 = [(TVUsageDataSource *)&v23 initWithQuery:a3 entityType:a4];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_categoryIdentifier, a5);
    id v18 = [v14 copy];
    id itemBlock = v17->_itemBlock;
    v17->_id itemBlock = v18;

    id v20 = [v15 copy];
    id headerBlock = v17->_headerBlock;
    v17->_id headerBlock = v20;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)count
{
  v3 = [(TVUsageDataSource *)self categoryIdentifier];
  unsigned int v4 = [v3 isEqualToString:@"CATEGORY_TV_SHOWS"];

  if (v4)
  {
    v5 = [(TVUsageDataSource *)self entities];
    id v6 = [v5 count];

    return (unint64_t)v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TVUsageDataSource;
    return [(TVUsageDataSource *)&v8 count];
  }
}

- (id)usageItemForEntity:(id)a3
{
  return (id)(*((uint64_t (**)(void))self->_itemBlock + 2))();
}

- (id)headerItem
{
  id headerBlock = (void (**)(void, void))self->_headerBlock;
  if (headerBlock)
  {
    v3 = [(TVUsageDataSource *)self query];
    ((void (**)(void, void *))headerBlock)[2](headerBlock, v3);
    id headerBlock = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }

  return headerBlock;
}

- (id)_prunedDataSource
{
  v3 = [(TVUsageDataSource *)self query];
  unsigned int v4 = [v3 filterPredicates];

  id v5 = [objc_alloc((Class)MPMediaQuery) initWithFilterPredicates:v4];
  [v5 setIgnoreSystemFilterPredicates:1];
  [v5 setIgnoreRestrictionsPredicates:1];
  id v6 = [(TVUsageDataSource *)self query];
  objc_msgSend(v5, "setGroupingType:", objc_msgSend(v6, "groupingType"));

  id v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithQuery:entityType:categoryIdentifier:usageItemBlock:usageHeaderBlock:", v5, -[TVUsageDataSource entityType](self, "entityType"), self->_categoryIdentifier, self->_itemBlock, self->_headerBlock);

  return v7;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (id)itemBlock
{
  return self->_itemBlock;
}

- (void)setItemBlock:(id)a3
{
}

- (id)headerBlock
{
  return self->_headerBlock;
}

- (void)setHeaderBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_headerBlock, 0);
  objc_storeStrong(&self->_itemBlock, 0);

  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
}

@end