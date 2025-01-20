@interface MessageInboxEntry
+ (id)fetchRequest;
@end

@implementation MessageInboxEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MessageInboxEntry"];
}

@end