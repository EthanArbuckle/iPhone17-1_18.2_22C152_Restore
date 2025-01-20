@interface CHWorkoutCacheContainer
- (CHEffortSampleCollection)effortSampleCollection;
- (HKUnit)userPreferredDistanceUnit;
- (NSArray)cadenceSamples;
- (NSArray)customSplits;
- (NSArray)cyclingSpeedSamples;
- (NSArray)distanceSamples;
- (NSArray)downhillRuns;
- (NSArray)groundContactTimeSamples;
- (NSArray)heartRateReadings;
- (NSArray)intervals;
- (NSArray)paceSamples;
- (NSArray)powerSamples;
- (NSArray)recoveryHeartRateReadings;
- (NSArray)segments;
- (NSArray)splits;
- (NSArray)strideLengthSamples;
- (NSArray)strokeSamples;
- (NSArray)swimmingSets;
- (NSArray)trackLaps;
- (NSArray)verticalOscillationSamples;
- (NSDictionary)swimDistanceByStrokeStyle;
- (NSDictionary)swimmingSplits;
- (NSMutableDictionary)totalDistance;
- (NSNumber)averageHeartRate;
- (void)setAverageHeartRate:(id)a3;
- (void)setCadenceSamples:(id)a3;
- (void)setCustomSplits:(id)a3;
- (void)setCyclingSpeedSamples:(id)a3;
- (void)setDistanceSamples:(id)a3;
- (void)setDownhillRuns:(id)a3;
- (void)setEffortSampleCollection:(id)a3;
- (void)setGroundContactTimeSamples:(id)a3;
- (void)setHeartRateReadings:(id)a3;
- (void)setIntervals:(id)a3;
- (void)setPaceSamples:(id)a3;
- (void)setPowerSamples:(id)a3;
- (void)setRecoveryHeartRateReadings:(id)a3;
- (void)setSegments:(id)a3;
- (void)setSplits:(id)a3;
- (void)setStrideLengthSamples:(id)a3;
- (void)setStrokeSamples:(id)a3;
- (void)setSwimDistanceByStrokeStyle:(id)a3;
- (void)setSwimmingSets:(id)a3;
- (void)setSwimmingSplits:(id)a3;
- (void)setTotalDistance:(id)a3;
- (void)setTrackLaps:(id)a3;
- (void)setUserPreferredDistanceUnit:(id)a3;
- (void)setVerticalOscillationSamples:(id)a3;
@end

@implementation CHWorkoutCacheContainer

- (NSArray)heartRateReadings
{
  return self->_heartRateReadings;
}

- (void)setHeartRateReadings:(id)a3
{
}

- (NSArray)recoveryHeartRateReadings
{
  return self->_recoveryHeartRateReadings;
}

- (void)setRecoveryHeartRateReadings:(id)a3
{
}

- (NSNumber)averageHeartRate
{
  return self->_averageHeartRate;
}

- (void)setAverageHeartRate:(id)a3
{
}

- (NSArray)cadenceSamples
{
  return self->_cadenceSamples;
}

- (void)setCadenceSamples:(id)a3
{
}

- (NSArray)distanceSamples
{
  return self->_distanceSamples;
}

- (void)setDistanceSamples:(id)a3
{
}

- (NSMutableDictionary)totalDistance
{
  return self->_totalDistance;
}

- (void)setTotalDistance:(id)a3
{
}

- (NSArray)groundContactTimeSamples
{
  return self->_groundContactTimeSamples;
}

- (void)setGroundContactTimeSamples:(id)a3
{
}

- (NSArray)paceSamples
{
  return self->_paceSamples;
}

- (void)setPaceSamples:(id)a3
{
}

- (NSArray)powerSamples
{
  return self->_powerSamples;
}

- (void)setPowerSamples:(id)a3
{
}

- (NSArray)cyclingSpeedSamples
{
  return self->_cyclingSpeedSamples;
}

- (void)setCyclingSpeedSamples:(id)a3
{
}

- (NSArray)strideLengthSamples
{
  return self->_strideLengthSamples;
}

- (void)setStrideLengthSamples:(id)a3
{
}

- (NSArray)strokeSamples
{
  return self->_strokeSamples;
}

- (void)setStrokeSamples:(id)a3
{
}

- (NSArray)verticalOscillationSamples
{
  return self->_verticalOscillationSamples;
}

- (void)setVerticalOscillationSamples:(id)a3
{
}

- (NSArray)splits
{
  return self->_splits;
}

- (void)setSplits:(id)a3
{
}

- (NSArray)customSplits
{
  return self->_customSplits;
}

- (void)setCustomSplits:(id)a3
{
}

- (NSDictionary)swimmingSplits
{
  return self->_swimmingSplits;
}

- (void)setSwimmingSplits:(id)a3
{
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (NSArray)intervals
{
  return self->_intervals;
}

- (void)setIntervals:(id)a3
{
}

- (NSArray)trackLaps
{
  return self->_trackLaps;
}

- (void)setTrackLaps:(id)a3
{
}

- (NSArray)swimmingSets
{
  return self->_swimmingSets;
}

- (void)setSwimmingSets:(id)a3
{
}

- (NSArray)downhillRuns
{
  return self->_downhillRuns;
}

- (void)setDownhillRuns:(id)a3
{
}

- (HKUnit)userPreferredDistanceUnit
{
  return self->_userPreferredDistanceUnit;
}

- (void)setUserPreferredDistanceUnit:(id)a3
{
}

- (NSDictionary)swimDistanceByStrokeStyle
{
  return self->_swimDistanceByStrokeStyle;
}

- (void)setSwimDistanceByStrokeStyle:(id)a3
{
}

- (CHEffortSampleCollection)effortSampleCollection
{
  return self->_effortSampleCollection;
}

- (void)setEffortSampleCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effortSampleCollection, 0);
  objc_storeStrong((id *)&self->_swimDistanceByStrokeStyle, 0);
  objc_storeStrong((id *)&self->_userPreferredDistanceUnit, 0);
  objc_storeStrong((id *)&self->_downhillRuns, 0);
  objc_storeStrong((id *)&self->_swimmingSets, 0);
  objc_storeStrong((id *)&self->_trackLaps, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_swimmingSplits, 0);
  objc_storeStrong((id *)&self->_customSplits, 0);
  objc_storeStrong((id *)&self->_splits, 0);
  objc_storeStrong((id *)&self->_verticalOscillationSamples, 0);
  objc_storeStrong((id *)&self->_strokeSamples, 0);
  objc_storeStrong((id *)&self->_strideLengthSamples, 0);
  objc_storeStrong((id *)&self->_cyclingSpeedSamples, 0);
  objc_storeStrong((id *)&self->_powerSamples, 0);
  objc_storeStrong((id *)&self->_paceSamples, 0);
  objc_storeStrong((id *)&self->_groundContactTimeSamples, 0);
  objc_storeStrong((id *)&self->_totalDistance, 0);
  objc_storeStrong((id *)&self->_distanceSamples, 0);
  objc_storeStrong((id *)&self->_cadenceSamples, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
  objc_storeStrong((id *)&self->_recoveryHeartRateReadings, 0);

  objc_storeStrong((id *)&self->_heartRateReadings, 0);
}

@end