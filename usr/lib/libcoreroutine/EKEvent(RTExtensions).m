@interface EKEvent(RTExtensions)
- (BOOL)hasConfirmedSuggestedLocation;
- (BOOL)hasRejectedSuggestion;
- (BOOL)hasUserSpecifiedLocation;
- (uint64_t)hasSuggestedLocation;
- (uint64_t)needsSuggestedLocation;
@end

@implementation EKEvent(RTExtensions)

- (uint64_t)needsSuggestedLocation
{
  return [MEMORY[0x1E4F25638] shouldDoLocationPredictionForEvent:a1];
}

- (uint64_t)hasSuggestedLocation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[EKEvent(RTExtensions) hasSuggestedLocation]";
    __int16 v9 = 1024;
    int v10 = 32;
    _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "hasSuggestedLocation has an issue. Use EventModelProvider._hasSuggestedLocationForEvent (in %s:%d)", (uint8_t *)&v7, 0x12u);
  }

  v3 = [a1 structuredLocation];
  if (v3)
  {
    v4 = [a1 structuredLocation];
    uint64_t v5 = [v4 isPrediction];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasConfirmedSuggestedLocation
{
  return [a1 locationPredictionState] == 2;
}

- (BOOL)hasRejectedSuggestion
{
  return [a1 locationPredictionState] == 3;
}

- (BOOL)hasUserSpecifiedLocation
{
  v2 = [a1 preferredLocationWithoutPrediction];
  if (v2)
  {
    v3 = [a1 preferredLocationWithoutPrediction];
    v4 = [v3 geoLocation];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end