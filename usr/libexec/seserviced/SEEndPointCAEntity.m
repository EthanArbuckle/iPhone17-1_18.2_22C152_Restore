@interface SEEndPointCAEntity
+ (id)fetchRequest;
@end

@implementation SEEndPointCAEntity

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"SEEndPointCAEntity"];
}

@end