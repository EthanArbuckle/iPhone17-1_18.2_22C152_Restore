@interface NTPBPersonalizationLocalData(FCAdditions)
- (id)openChangeGroupDeltasByFeatureKey;
- (id)remoteRecord;
- (void)setRemoteRecord:()FCAdditions;
@end

@implementation NTPBPersonalizationLocalData(FCAdditions)

- (id)remoteRecord
{
  v2 = [a1 remoteRecordData];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v4 = objc_opt_class();
    v5 = [a1 remoteRecordData];
    v6 = objc_msgSend(v3, "nf_securelyUnarchiveObjectOfClass:withData:", v4, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)openChangeGroupDeltasByFeatureKey
{
  v1 = [a1 openChangeGroupDeltas];
  v2 = objc_msgSend(v1, "fc_dictionaryWithKeyBlock:", &__block_literal_global_160);
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v4 = v2;

  return v4;
}

- (void)setRemoteRecord:()FCAdditions
{
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
    [a1 setRemoteRecordData:v4];
  }
  else
  {
    objc_msgSend(a1, "setRemoteRecordData:");
  }
}

@end