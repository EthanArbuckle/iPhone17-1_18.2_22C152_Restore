@interface REMCDTemplateOperationQueueItem
- (NSString)description;
- (REMCDTemplateOperationQueueItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation REMCDTemplateOperationQueueItem

- (NSString)description
{
  v2 = self;
  sub_1001C2AF4();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (REMCDTemplateOperationQueueItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(REMCDTemplateOperationQueueItem *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end