@interface SXReplicaAdvertisementComponentClassification
+ (id)roleString;
+ (int)role;
@end

@implementation SXReplicaAdvertisementComponentClassification

+ (int)role
{
  return 40;
}

+ (id)roleString
{
  return @"replica_advertisement";
}

@end