@interface FetchRecord
+ (id)fetchRequest;
@end

@implementation FetchRecord

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"FetchRecord"];
}

@end