@interface KTCoreDataSTStaticKey
+ (id)fetchRequest;
@end

@implementation KTCoreDataSTStaticKey

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"STStaticKey"];
}

@end