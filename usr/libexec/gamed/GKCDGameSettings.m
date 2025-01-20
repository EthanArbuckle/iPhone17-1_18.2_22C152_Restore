@interface GKCDGameSettings
+ (id)fetchRequest;
@end

@implementation GKCDGameSettings

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GKCDGameSettings"];
}

@end