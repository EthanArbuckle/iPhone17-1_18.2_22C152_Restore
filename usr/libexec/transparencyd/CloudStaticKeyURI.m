@interface CloudStaticKeyURI
+ (id)fetchRequest;
@end

@implementation CloudStaticKeyURI

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CloudStaticKeyURI"];
}

@end