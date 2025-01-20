@interface KTRequestFailure
+ (id)fetchRequest;
@end

@implementation KTRequestFailure

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"KTRequestFailure"];
}

@end