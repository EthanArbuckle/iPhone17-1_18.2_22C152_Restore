@interface WBSAutoplayQuirkWhitelistSnapshotTransformer
- (id)objectFromData:(id)a3;
@end

@implementation WBSAutoplayQuirkWhitelistSnapshotTransformer

- (id)objectFromData:(id)a3
{
  id v3 = a3;
  v4 = [[WBSAutoplayQuirkWhitelistSnapshot alloc] initWithSnapshotData:v3 error:0];

  return v4;
}

@end