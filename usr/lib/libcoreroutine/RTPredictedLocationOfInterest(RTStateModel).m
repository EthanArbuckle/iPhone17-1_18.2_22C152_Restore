@interface RTPredictedLocationOfInterest(RTStateModel)
- (uint64_t)initWithLocationOfInterest:()RTStateModel confidence:nextEntryTime:motionActivityType:;
@end

@implementation RTPredictedLocationOfInterest(RTStateModel)

- (uint64_t)initWithLocationOfInterest:()RTStateModel confidence:nextEntryTime:motionActivityType:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v10 = (void *)MEMORY[0x1E4F5CE20];
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [v10 modeOfTransportationFromMotionActivityType:a6];
  id v14 = objc_alloc(MEMORY[0x1E4F5CEA0]);
  id v15 = objc_alloc(MEMORY[0x1E4F5CEE8]);
  v16 = [v12 identifier];
  v17 = (void *)[v15 initWithIdentifier:v16];
  v21[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v19 = [v14 initWithLocationOfInterest:v12 confidence:v11 nextEntryTime:v13 modeOfTransportation:v18 sources:a2];

  return v19;
}

@end