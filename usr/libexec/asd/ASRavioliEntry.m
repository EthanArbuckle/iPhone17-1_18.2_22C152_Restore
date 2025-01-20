@interface ASRavioliEntry
+ (id)fetchRequest;
@end

@implementation ASRavioliEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"DB_R09283478"];
}

@end