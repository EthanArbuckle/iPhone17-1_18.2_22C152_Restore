@interface GEOLPRDefinedPlateType(MNExtras)
- (uint64_t)hasDefinedPlateConditionsForVehicle:()MNExtras error:;
@end

@implementation GEOLPRDefinedPlateType(MNExtras)

- (uint64_t)hasDefinedPlateConditionsForVehicle:()MNExtras error:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = [a1 conditions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v17 = 0;
        uint64_t v13 = [v6 matchesDefinedPlateCondition:v12 error:&v17];
        id v14 = v17;
        v15 = v14;
        if (v13) {
          goto LABEL_13;
        }
        if (v14)
        {
          if (a4) {
            *a4 = v14;
          }
LABEL_13:

          goto LABEL_14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
  v15 = v7;
LABEL_14:

  return v13;
}

@end