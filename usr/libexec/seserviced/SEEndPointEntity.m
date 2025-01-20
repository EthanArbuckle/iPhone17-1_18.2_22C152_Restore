@interface SEEndPointEntity
+ (id)fetchRequest;
@end

@implementation SEEndPointEntity

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"SEEndPointEntity"];
}

@end