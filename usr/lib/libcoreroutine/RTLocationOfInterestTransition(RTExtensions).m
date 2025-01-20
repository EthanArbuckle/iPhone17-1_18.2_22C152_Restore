@interface RTLocationOfInterestTransition(RTExtensions)
+ (id)locationOfInterestTransitionsFromLearnedTransitions:()RTExtensions;
+ (uint64_t)modeOfTransportationFromMotionActivityType:()RTExtensions;
+ (uint64_t)motionActivityTypeFromModeOfTransportation:()RTExtensions;
- (uint64_t)initWithLearnedTransition:()RTExtensions;
@end

@implementation RTLocationOfInterestTransition(RTExtensions)

- (uint64_t)initWithLearnedTransition:()RTExtensions
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F5CE20];
    id v5 = a3;
    uint64_t v6 = [v4 modeOfTransportationFromMotionActivityType:[v5 predominantMotionActivityType]];
    id v7 = objc_alloc(MEMORY[0x1E4F5CE20]);
    v8 = [v5 identifier];
    v9 = [v5 startDate];
    v10 = [v5 stopDate];
    v11 = [v5 visitIdentifierOrigin];
    v12 = [v5 visitIdentifierDestination];

    uint64_t v13 = [v7 initWithIdentifier:v8 startDate:v9 stopDate:v10 visitIdentifierOrigin:v11 visitIdentifierDestination:v12 modeOfTransportation:v6];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)locationOfInterestTransitionsFromLearnedTransitions:()RTExtensions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v3 count]];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v12 = objc_alloc(MEMORY[0x1E4F5CE20]);
          uint64_t v13 = [v12 initWithLearnedTransition:v11, v15];
          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (uint64_t)modeOfTransportationFromMotionActivityType:()RTExtensions
{
  if ((unint64_t)(a3 - 2) > 3) {
    return 0;
  }
  else {
    return qword_1DA0FF0B8[a3 - 2];
  }
}

+ (uint64_t)motionActivityTypeFromModeOfTransportation:()RTExtensions
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1DA0FF0D8[a3 - 1];
  }
}

@end