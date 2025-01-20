@interface UuidToEndpointId
+ (id)fetchRequest;
@end

@implementation UuidToEndpointId

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"UuidToEndpointId"];
}

@end