@interface RTPredictedLocationOfInterest(RTHistoryEntry)
- (uint64_t)initWithHistoryEntryPlaceDisplay:()RTHistoryEntry;
- (uint64_t)initWithHistoryEntryRoute:()RTHistoryEntry;
@end

@implementation RTPredictedLocationOfInterest(RTHistoryEntry)

- (uint64_t)initWithHistoryEntryRoute:()RTHistoryEntry
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithHistoryEntryRoute:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F5CF18]);
    v7 = [v4 usageDate];
    v8 = [v6 initWithUsageDate:v7 navigationWasInterrupted:[v4 navigationWasInterrupted]];

    id v9 = objc_alloc(MEMORY[0x1E4F5CEA0]);
    if ([v4 navigationWasInterrupted]) {
      double v10 = 1.0;
    }
    else {
      double v10 = 0.0;
    }
    v14[0] = v8;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v12 = [v9 initWithLocationOfInterest:v5 confidence:0 nextEntryTime:0 modeOfTransportation:v11 sources:v10];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (uint64_t)initWithHistoryEntryPlaceDisplay:()RTHistoryEntry
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F5CE10]) initWithHistoryEntryPlaceDisplay:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F5CF10]);
    v7 = [v4 usageDate];
    v8 = (void *)[v6 initWithUsageDate:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F5CEA0]);
    v13[0] = v8;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v11 = [v9 initWithLocationOfInterest:v5 confidence:0 nextEntryTime:0 modeOfTransportation:v10 sources:0.0];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

@end