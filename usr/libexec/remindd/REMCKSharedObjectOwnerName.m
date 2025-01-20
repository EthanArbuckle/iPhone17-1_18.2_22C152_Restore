@interface REMCKSharedObjectOwnerName
+ (NSString)cdEntityName;
+ (id)fetchRequest;
@end

@implementation REMCKSharedObjectOwnerName

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCKSharedObjectOwnerName";
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCKSharedObjectOwnerName"];
}

@end