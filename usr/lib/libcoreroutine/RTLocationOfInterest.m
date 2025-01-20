@interface RTLocationOfInterest
@end

@implementation RTLocationOfInterest

uint64_t __87__RTLocationOfInterest_RTCoreDataTransformable__createWithLearnedLocationOfInterestMO___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5CE28] createWithManagedObject:a2];
}

void __55__RTLocationOfInterest_RTStateModel__initWithOneState___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F5CE28];
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = [v4 identifier];
  v7 = (void *)MEMORY[0x1E4F1C9C8];
  v8 = [v4 EntryExit_s];
  [v8 entry_s];
  v9 = [v7 dateWithTimeIntervalSinceReferenceDate:x0];
  v10 = (void *)MEMORY[0x1E4F1C9C8];
  v11 = [v4 EntryExit_s];

  [v11 exit_s];
  v12 = [v10 dateWithTimeIntervalSinceReferenceDate:x0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:0 longitude:*(double *)(a1 + 40) horizontalUncertainty:*(double *)(a1 + 48) date:*(double *)(a1 + 56)];
  id v14 = (id)[v5 initWithIdentifier:v6 entry:v9 exit:v12 location:v13 locationOfInterestConfidence:0 locationOfInterestSource:0.0];

  [*(id *)(a1 + 32) addObject:v14];
}

@end