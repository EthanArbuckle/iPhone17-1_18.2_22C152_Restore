@interface ICQueryResultsController
- (ICQuery)query;
- (ICQueryResultsController)initWithManagedObjectContext:(id)a3 query:(id)a4;
- (ICQueryResultsControllerObjC)queryResultsControllerObjC;
- (NSManagedObjectContext)managedObjectContext;
- (id)performFetch;
- (void)setQuery:(id)a3;
- (void)setQueryResultsControllerObjC:(id)a3;
@end

@implementation ICQueryResultsController

- (ICQueryResultsController)initWithManagedObjectContext:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQueryResultsController;
  v8 = [(ICQueryResultsController *)&v12 init];
  if (v8)
  {
    v9 = [[ICQueryResultsControllerObjC alloc] initWithManagedObjectContext:v6 query:v7];
    queryResultsControllerObjC = v8->_queryResultsControllerObjC;
    v8->_queryResultsControllerObjC = v9;
  }
  return v8;
}

- (id)performFetch
{
  v2 = [(ICQueryResultsController *)self queryResultsControllerObjC];
  v3 = [v2 performFetch];

  return v3;
}

- (NSManagedObjectContext)managedObjectContext
{
  v2 = [(ICQueryResultsController *)self queryResultsControllerObjC];
  v3 = [v2 managedObjectContext];

  return (NSManagedObjectContext *)v3;
}

- (ICQuery)query
{
  v2 = [(ICQueryResultsController *)self queryResultsControllerObjC];
  v3 = [v2 query];

  return (ICQuery *)v3;
}

- (void)setQuery:(id)a3
{
}

- (ICQueryResultsControllerObjC)queryResultsControllerObjC
{
  return self->_queryResultsControllerObjC;
}

- (void)setQueryResultsControllerObjC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResultsControllerObjC, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end