@interface RMStatusSubscriptionItem
- (id)reportDetails;
- (void)prepareForDeletion;
@end

@implementation RMStatusSubscriptionItem

- (void)prepareForDeletion
{
  v3 = [(RMStatusSubscriptionItem *)self managedObjectContext];
  v4 = +[NSSet setWithObject:self];
  v5 = [(RMStatusSubscriptionItem *)self subscribedStatusKeyPaths];
  id v6 = [v5 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v13 = [v12 statusSubscriptionItems];
        unsigned int v14 = [v13 isEqualToSet:v4];

        if (v14) {
          [v3 deleteObject:v12];
        }
        [v12 removeStatusSubscriptionItemsObject:self];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v15.receiver = self;
  v15.super_class = (Class)RMStatusSubscriptionItem;
  [(RMStatusSubscriptionItem *)&v15 prepareForDeletion];
}

- (id)reportDetails
{
  v3 = objc_opt_new();
  v4 = [(RMStatusSubscriptionItem *)self keyPath];
  [v3 setObject:v4 forKeyedSubscript:@"keyPath"];

  v5 = [(RMStatusSubscriptionItem *)self predicate];
  id v6 = [v5 predicateFormat];
  [v3 setObject:v6 forKeyedSubscript:@"predicate"];

  id v7 = [(RMStatusSubscriptionItem *)self properties];
  [v3 setObject:v7 forKeyedSubscript:@"properties"];

  return v3;
}

@end