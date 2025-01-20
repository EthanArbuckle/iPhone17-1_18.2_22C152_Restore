@interface GamePlatform
+ (id)fetchRequest;
@end

@implementation GamePlatform

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GamePlatform"];
}

@end