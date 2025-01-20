@interface GKCDPlayerActivity
+ (id)fetchRequest;
@end

@implementation GKCDPlayerActivity

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GKCDPlayerActivity"];
}

@end