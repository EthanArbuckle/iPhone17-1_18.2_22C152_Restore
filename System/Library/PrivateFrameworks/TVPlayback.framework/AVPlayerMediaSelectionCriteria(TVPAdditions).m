@interface AVPlayerMediaSelectionCriteria(TVPAdditions)
- (uint64_t)tvp_isEqualToCriteria:()TVPAdditions;
@end

@implementation AVPlayerMediaSelectionCriteria(TVPAdditions)

- (uint64_t)tvp_isEqualToCriteria:()TVPAdditions
{
  id v6 = a3;
  if (a1 != v6)
  {
    v7 = [a1 preferredLanguages];
    v8 = [v6 preferredLanguages];
    if (v7 != v8)
    {
      v3 = [a1 preferredLanguages];
      v4 = [v6 preferredLanguages];
      if (![v3 isEqual:v4])
      {
        uint64_t v9 = 0;
        goto LABEL_16;
      }
    }
    v10 = [a1 preferredMediaCharacteristics];
    v11 = [v6 preferredMediaCharacteristics];
    if (v10 != v11)
    {
      v12 = [a1 preferredMediaCharacteristics];
      v13 = [v6 preferredMediaCharacteristics];
      if (![v12 isEqual:v13])
      {
        uint64_t v9 = 0;
        goto LABEL_14;
      }
      v25 = v13;
      v26 = v12;
    }
    v14 = [a1 principalMediaCharacteristics];
    uint64_t v15 = [v6 principalMediaCharacteristics];
    if (v14 == (void *)v15)
    {

      uint64_t v9 = 1;
    }
    else
    {
      v16 = (void *)v15;
      [a1 principalMediaCharacteristics];
      v17 = v24 = v3;
      [v6 principalMediaCharacteristics];
      v23 = v10;
      v18 = v8;
      v19 = v7;
      v21 = v20 = v4;
      uint64_t v9 = [v17 isEqual:v21];

      v4 = v20;
      v7 = v19;
      v8 = v18;
      v10 = v23;

      v3 = v24;
    }
    v13 = v25;
    v12 = v26;
    if (v10 == v11)
    {
LABEL_15:

      if (v7 == v8)
      {
LABEL_17:

        goto LABEL_18;
      }
LABEL_16:

      goto LABEL_17;
    }
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v9 = 1;
LABEL_18:

  return v9;
}

@end