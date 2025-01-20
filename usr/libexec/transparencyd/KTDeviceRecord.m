@interface KTDeviceRecord
+ (id)fetchRequest;
@end

@implementation KTDeviceRecord

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"KTDeviceRecord"];
}

@end