@interface NBBackupiCloudModel
+ (id)fetchRequest;
@end

@implementation NBBackupiCloudModel

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"NBBackupiCloudModel"];
}

@end