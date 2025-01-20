@interface APManagedContendDataEnumerator
- (APManagedContendDataEnumerator)initWithManagedContext:(id)a3 contentDataItemIds:(id)a4;
- (APManagedContext)managedContext;
- (NSArray)contentDataItemIds;
- (id)nextObject;
- (unint64_t)currentContentDataItemIdIndex;
- (void)setCurrentContentDataItemIdIndex:(unint64_t)a3;
@end

@implementation APManagedContendDataEnumerator

- (APManagedContendDataEnumerator)initWithManagedContext:(id)a3 contentDataItemIds:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(APManagedContendDataEnumerator *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managedContext, a3);
    objc_storeStrong((id *)&v10->_contentDataItemIds, a4);
    [(APManagedContendDataEnumerator *)v10 setCurrentContentDataItemIdIndex:0];
  }

  return v10;
}

- (id)nextObject
{
  for (i = self; ; self = i)
  {
    unint64_t v3 = [(APManagedContendDataEnumerator *)self currentContentDataItemIdIndex];
    v4 = [(APManagedContendDataEnumerator *)i contentDataItemIds];
    id v5 = [v4 count];

    if (v3 >= (unint64_t)v5)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v6 = [(APManagedContendDataEnumerator *)i contentDataItemIds];
    id v7 = [(APManagedContendDataEnumerator *)i currentContentDataItemIdIndex];
    [(APManagedContendDataEnumerator *)i setCurrentContentDataItemIdIndex:v7 + 1];
    id v8 = [v6 objectAtIndexedSubscript:v7];

    v9 = [(APManagedContendDataEnumerator *)i managedContext];
    v10 = [v9 managedContentDataForId:v8];

    if (v10)
    {
      if ([v10 isAvailable]) {
        break;
      }
    }
  }
LABEL_7:

  return v10;
}

- (APManagedContext)managedContext
{
  return self->_managedContext;
}

- (NSArray)contentDataItemIds
{
  return self->_contentDataItemIds;
}

- (unint64_t)currentContentDataItemIdIndex
{
  return self->_currentContentDataItemIdIndex;
}

- (void)setCurrentContentDataItemIdIndex:(unint64_t)a3
{
  self->_currentContentDataItemIdIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDataItemIds, 0);

  objc_storeStrong((id *)&self->_managedContext, 0);
}

@end