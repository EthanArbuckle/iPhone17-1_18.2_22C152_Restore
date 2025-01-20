@interface FCBundleSubscriptionChangeSet
- (FCBundleSubscriptionChangeSet)initWithTagIDsAdded:(id)a3 tagIDsRemoved:(id)a4;
- (NSArray)tagIDsAdded;
- (NSArray)tagIDsRemoved;
- (void)setTagIDsAdded:(id)a3;
- (void)setTagIDsRemoved:(id)a3;
@end

@implementation FCBundleSubscriptionChangeSet

- (FCBundleSubscriptionChangeSet)initWithTagIDsAdded:(id)a3 tagIDsRemoved:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCBundleSubscriptionChangeSet;
  v8 = [(FCBundleSubscriptionChangeSet *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    tagIDsAdded = v8->_tagIDsAdded;
    v8->_tagIDsAdded = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    tagIDsRemoved = v8->_tagIDsRemoved;
    v8->_tagIDsRemoved = (NSArray *)v11;
  }
  return v8;
}

- (NSArray)tagIDsAdded
{
  return self->_tagIDsAdded;
}

- (void)setTagIDsAdded:(id)a3
{
}

- (NSArray)tagIDsRemoved
{
  return self->_tagIDsRemoved;
}

- (void)setTagIDsRemoved:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagIDsRemoved, 0);
  objc_storeStrong((id *)&self->_tagIDsAdded, 0);
}

@end