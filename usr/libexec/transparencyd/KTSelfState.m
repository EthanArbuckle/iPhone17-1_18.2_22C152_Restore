@interface KTSelfState
+ (id)fetchRequest;
@end

@implementation KTSelfState

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"KTSelfState"];
}

@end