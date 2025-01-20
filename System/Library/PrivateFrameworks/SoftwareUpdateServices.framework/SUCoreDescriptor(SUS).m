@interface SUCoreDescriptor(SUS)
- (uint64_t)isEqualToDescriptor:()SUS;
- (uint64_t)isRevokedSplat;
@end

@implementation SUCoreDescriptor(SUS)

- (uint64_t)isRevokedSplat
{
  v2 = [a1 softwareUpdateAssetType];
  if ([v2 isEqualToString:*MEMORY[0x263F77CA8]]) {
    uint64_t v3 = [a1 revoked];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)isEqualToDescriptor:()SUS
{
  id v4 = a3;
  if ([a1 isEqual:v4])
  {
    int v5 = [a1 rampEnabled];
    if (v5 == [v4 rampEnabled])
    {
      int v6 = [a1 granularlyRamped];
      if (v6 == [v4 granularlyRamped])
      {
        uint64_t v14 = 1;
        goto LABEL_6;
      }
    }
    [a1 rampEnabled];
    [a1 granularlyRamped];
    [v4 rampEnabled];
    [v4 granularlyRamped];
    SULogInfo(@"%s: ramping control flags changed (%d, %d) -> (%d, %d)", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUCoreDescriptor(SUS) isEqualToDescriptor:]");
  }
  uint64_t v14 = 0;
LABEL_6:

  return v14;
}

@end