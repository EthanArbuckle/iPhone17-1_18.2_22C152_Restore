@interface BCReadingStatsTOCEntry
+ (id)fetchRequest;
@end

@implementation BCReadingStatsTOCEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"BCReadingStatsTOCEntry"];
}

@end