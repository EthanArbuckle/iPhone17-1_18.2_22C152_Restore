@interface KTCoreDataSTHandle
+ (id)fetchRequest;
@end

@implementation KTCoreDataSTHandle

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"STStaticKeyHandle"];
}

@end