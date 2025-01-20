@interface CloudStaticKey
+ (id)fetchRequest;
@end

@implementation CloudStaticKey

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CloudStaticKey"];
}

@end