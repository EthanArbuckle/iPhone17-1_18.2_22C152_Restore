@interface CKRecordID
+ (id)fc_staticSecureSentinelRecordID;
+ (id)fc_staticSentinelRecordID;
@end

@implementation CKRecordID

+ (id)fc_staticSecureSentinelRecordID
{
  self;
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"static_sentinel_secure"];
  return v0;
}

+ (id)fc_staticSentinelRecordID
{
  self;
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"static_sentinel"];
  return v0;
}

@end