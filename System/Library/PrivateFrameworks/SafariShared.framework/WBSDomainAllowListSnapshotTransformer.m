@interface WBSDomainAllowListSnapshotTransformer
- (id)objectFromData:(id)a3;
@end

@implementation WBSDomainAllowListSnapshotTransformer

- (id)objectFromData:(id)a3
{
  id v3 = a3;
  v4 = [[WBSDomainAllowListSnapshot alloc] initWithSnapshotData:v3 error:0];

  return v4;
}

@end