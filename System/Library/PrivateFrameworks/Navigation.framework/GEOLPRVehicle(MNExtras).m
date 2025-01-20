@interface GEOLPRVehicle(MNExtras)
- (uint64_t)_matchesPower:()MNExtras andVehicle:;
- (uint64_t)matchesDefinedPlateCondition:()MNExtras error:;
- (uint64_t)matchesLicensePlateRegion:()MNExtras;
- (uint64_t)matchesPlateInfo:()MNExtras;
@end

@implementation GEOLPRVehicle(MNExtras)

- (uint64_t)_matchesPower:()MNExtras andVehicle:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 powerTypeKey];
  if (v8)
  {
    v9 = (void *)v8;
    uint64_t v10 = [v6 count];

    if (v10)
    {
      v11 = [a1 powerTypeKey];
      int v12 = [v6 containsObject:v11];

      if (!v12) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v13 = [a1 vehicleTypeKey];
  if (!v13) {
    goto LABEL_7;
  }
  v14 = (void *)v13;
  uint64_t v15 = [v7 count];

  if (v15
    && ([a1 vehicleTypeKey],
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v7 containsObject:v16],
        v16,
        !v17))
  {
LABEL_8:
    uint64_t v18 = 0;
  }
  else
  {
LABEL_7:
    uint64_t v18 = 1;
  }

  return v18;
}

- (uint64_t)matchesPlateInfo:()MNExtras
{
  id v4 = a3;
  v5 = [v4 powerTypeKeys];
  id v6 = [v4 vehicleTypeKeys];

  uint64_t v7 = [a1 _matchesPower:v5 andVehicle:v6];
  return v7;
}

- (uint64_t)matchesLicensePlateRegion:()MNExtras
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 licensePlateInfosCount])
  {
    v5 = [a1 powerTypeKey];
    if (v5)
    {
    }
    else
    {
      uint64_t v7 = [a1 vehicleTypeKey];

      if (!v7)
      {
        uint64_t v6 = 0;
        goto LABEL_17;
      }
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = objc_msgSend(v4, "licensePlateInfos", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = [v13 powerTypeKeys];
          uint64_t v15 = [v13 vehicleTypeKeys];
          char v16 = [a1 _matchesPower:v14 andVehicle:v15];

          if (v16)
          {
            uint64_t v6 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    uint64_t v6 = 0;
LABEL_16:
  }
  else
  {
    uint64_t v6 = 1;
  }
LABEL_17:

  return v6;
}

- (uint64_t)matchesDefinedPlateCondition:()MNExtras error:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 licensePlate];
  if (![v7 length])
  {

    goto LABEL_29;
  }
  uint64_t v8 = [a1 powerTypeKey];
  if (v8)
  {
  }
  else
  {
    uint64_t v9 = [a1 vehicleTypeKey];

    if (!v9) {
      goto LABEL_30;
    }
  }
  uint64_t v10 = [v6 powerTypeKeys];
  uint64_t v11 = [v6 vehicleTypeKeys];
  int v12 = [a1 _matchesPower:v10 andVehicle:v11];

  if (!v12)
  {
LABEL_29:
    uint64_t v9 = 0;
    goto LABEL_30;
  }
  uint64_t v13 = [a1 licensePlate];
  uint64_t v14 = [v13 length];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v15 = [v6 plateMatchConditions];
  uint64_t v40 = [v15 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (!v40)
  {
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v16 = *(void *)v50;
  v42 = v15;
  id v43 = v6;
  uint64_t v38 = *(void *)v50;
  v39 = a4;
  while (1)
  {
    uint64_t v17 = 0;
LABEL_10:
    if (*(void *)v50 != v16) {
      objc_enumerationMutation(v15);
    }
    long long v18 = *(void **)(*((void *)&v49 + 1) + 8 * v17);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v19 = [v18 patterns];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (!v20) {
      break;
    }
    uint64_t v21 = v20;
    uint64_t v41 = v17;
    uint64_t v22 = *(void *)v46;
LABEL_14:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v46 != v22) {
        objc_enumerationMutation(v19);
      }
      uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * v23);
      id v25 = objc_alloc(MEMORY[0x1E4F28FD8]);
      id v44 = 0;
      v26 = (void *)[v25 initWithPattern:v24 options:3 error:&v44];
      id v27 = v44;
      if (v26) {
        BOOL v32 = v27 == 0;
      }
      else {
        BOOL v32 = 0;
      }
      if (!v32)
      {
        v37 = v27;
        _mnLPRWrappedError(v39, -100, v27, @"Invalid regular expression: \"%@\"", v28, v29, v30, v31, v24);
        [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"InvalidRegEx"];

        uint64_t v9 = 0;
LABEL_31:
        uint64_t v15 = v42;
        id v6 = v43;
        goto LABEL_32;
      }
      v33 = [a1 licensePlate];
      objc_msgSend(v26, "rangeOfFirstMatchInString:options:range:", v33, 0, 0, v14);
      uint64_t v35 = v34;

      if (!v35) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v21) {
          goto LABEL_14;
        }
        uint64_t v9 = 1;
        goto LABEL_31;
      }
    }

    uint64_t v17 = v41 + 1;
    uint64_t v15 = v42;
    id v6 = v43;
    uint64_t v16 = v38;
    if (v41 + 1 != v40) {
      goto LABEL_10;
    }
    uint64_t v40 = [v42 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (!v40) {
      goto LABEL_28;
    }
  }
  uint64_t v9 = 1;
LABEL_32:

LABEL_30:
  return v9;
}

@end