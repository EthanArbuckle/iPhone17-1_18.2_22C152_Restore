@interface GEOLPRLicensePlateRegion
@end

@implementation GEOLPRLicensePlateRegion

void __83__GEOLPRLicensePlateRegion_MNExtras__restrictionRegionsContainingLatLngs_inRadius___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v3, "mapRegion", (void)v12);
        v11 = [v10 mapRegion];
        [v9 coordinate];
        LODWORD(v9) = objc_msgSend(v11, "containsCoordinate:radius:");

        if (v9)
        {
          [*(id *)(a1 + 40) addObject:v3];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

@end