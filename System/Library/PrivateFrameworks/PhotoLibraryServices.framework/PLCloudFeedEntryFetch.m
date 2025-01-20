@interface PLCloudFeedEntryFetch
- (NSEntityDescription)entity;
- (NSPredicate)predicate;
- (PLCloudFeedEntryFetch)initWithPredicate:(id)a3 entity:(id)a4;
@end

@implementation PLCloudFeedEntryFetch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (NSEntityDescription)entity
{
  return self->_entity;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (PLCloudFeedEntryFetch)initWithPredicate:(id)a3 entity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLCloudFeedEntryFetch;
  v9 = [(PLCloudFeedEntryFetch *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    objc_storeStrong((id *)&v10->_entity, a4);
  }

  return v10;
}

@end