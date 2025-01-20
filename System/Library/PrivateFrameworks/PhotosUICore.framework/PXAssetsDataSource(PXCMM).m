@interface PXAssetsDataSource(PXCMM)
- (uint64_t)aggregateMediaType;
@end

@implementation PXAssetsDataSource(PXCMM)

- (uint64_t)aggregateMediaType
{
  uint64_t v2 = [a1 numberOfSections];
  if (v2 < 1) {
    return 0;
  }
  uint64_t v3 = v2;
  char v4 = 0;
  uint64_t v5 = 0;
  char v6 = 0;
  do
  {
    uint64_t v7 = [a1 numberOfItemsInSection:v5];
    if (v7 < 1)
    {
LABEL_11:
      if ((v4 & 1) == 0) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      while (1)
      {
        v12[0] = [a1 identifier];
        v12[1] = v5;
        v12[2] = v9;
        v12[3] = 0x7FFFFFFFFFFFFFFFLL;
        v10 = [a1 assetAtItemIndexPath:v12];
        if ([v10 mediaType] == 1) {
          char v4 = 1;
        }
        else {
          v6 |= [v10 mediaType] == 2;
        }

        if (v4 & 1) != 0 && (v6) {
          break;
        }
        if (v8 == ++v9) {
          goto LABEL_11;
        }
      }
      char v6 = 1;
      char v4 = 1;
    }
    if (v6) {
      return 0;
    }
LABEL_15:
    ++v5;
  }
  while (v5 != v3);
  if (v6) {
    uint64_t result = 2;
  }
  else {
    uint64_t result = 0;
  }
  if (v4) {
    return 1;
  }
  return result;
}

@end