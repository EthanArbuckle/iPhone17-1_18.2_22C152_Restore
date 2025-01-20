@interface DeviceSignature
+ (id)fetchRequest;
@end

@implementation DeviceSignature

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"DeviceSignature"];
}

@end