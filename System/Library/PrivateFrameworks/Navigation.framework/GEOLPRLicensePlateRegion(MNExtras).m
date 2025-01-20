@interface GEOLPRLicensePlateRegion(MNExtras)
- (id)plateInfosMatchingVehicle:()MNExtras;
- (id)restrictionRegionsContainingLatLngs:()MNExtras inRadius:;
@end

@implementation GEOLPRLicensePlateRegion(MNExtras)

- (id)plateInfosMatchingVehicle:()MNExtras
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "licensePlateInfosCount"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = objc_msgSend(a1, "licensePlateInfos", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([v4 matchesPlateInfo:v11]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)restrictionRegionsContainingLatLngs:()MNExtras inRadius:
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "regionsCount"));
  uint64_t v8 = [a1 regions];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__GEOLPRLicensePlateRegion_MNExtras__restrictionRegionsContainingLatLngs_inRadius___block_invoke;
  v14[3] = &unk_1E60F7568;
  id v15 = v6;
  double v17 = a2;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v14];

  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

@end