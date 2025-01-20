@interface REMCDGroceryOperationQueueItem
- (REMCDGroceryOperationQueueItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation REMCDGroceryOperationQueueItem

- (REMCDGroceryOperationQueueItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(REMCDGroceryOperationQueueItem *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end