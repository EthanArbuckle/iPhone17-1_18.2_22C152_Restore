@interface AWDCoreRoutineLearnedLocationTrainingMetrics(RTLearnedLocationEngineTrainingMetrics)
- (id)initWithLearnedLocationEngineMetrics:()RTLearnedLocationEngineTrainingMetrics;
@end

@implementation AWDCoreRoutineLearnedLocationTrainingMetrics(RTLearnedLocationEngineTrainingMetrics)

- (id)initWithLearnedLocationEngineMetrics:()RTLearnedLocationEngineTrainingMetrics
{
  v4 = (objc_class *)MEMORY[0x1E4FB8CA8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v5 maxIntervalBetweenLocations];
  [v6 setMaxIntervalBetweenLocations:(unint64_t)v7];
  [v5 intervalSinceLastAttempt];
  [v6 setIntervalSinceLastAttempt:(unint64_t)v8];
  [v5 latency];
  [v6 setLatency:(unint64_t)v9];
  v10 = [NSNumber numberWithUnsignedInteger:[v5 locationsProcessed]];
  [v6 setLocationsProcessed:[v10 unsignedIntValue]];

  v11 = [NSNumber numberWithUnsignedInteger:[v5 placeCountDevice]];
  [v6 setPlaceCountDevice:[v11 unsignedIntValue]];

  v12 = [NSNumber numberWithUnsignedInteger:[v5 placeCountTotal]];
  [v6 setPlaceCountTotal:[v12 unsignedIntValue]];

  v13 = [v5 awdPlaces];
  [v6 setPlaces:v13];

  v14 = [NSNumber numberWithUnsignedInteger:[v5 visitCountDevice]];
  [v6 setVisitCountDevice:[v14 unsignedIntValue]];

  v15 = [NSNumber numberWithUnsignedInteger:[v5 visitCountTotal]];
  [v6 setVisitCountTotal:[v15 unsignedIntValue]];

  v16 = [v5 awdVisits];
  [v6 setVisits:v16];

  uint64_t v17 = [v5 trainedVisits];
  [v6 setTrainedVisits:v17];

  return v6;
}

@end