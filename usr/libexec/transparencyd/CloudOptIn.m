@interface CloudOptIn
+ (id)fetchRequest;
@end

@implementation CloudOptIn

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CloudOptIn"];
}

@end