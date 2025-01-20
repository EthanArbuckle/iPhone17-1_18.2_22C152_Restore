@interface KTRequestID
+ (id)fetchRequest;
@end

@implementation KTRequestID

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"KTRequestID"];
}

@end