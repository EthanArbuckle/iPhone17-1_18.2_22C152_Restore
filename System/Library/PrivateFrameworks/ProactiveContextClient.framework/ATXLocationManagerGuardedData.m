@interface ATXLocationManagerGuardedData
- (ATXLocationManagerGuardedData)init;
- (void)clear;
@end

@implementation ATXLocationManagerGuardedData

- (ATXLocationManagerGuardedData)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXLocationManagerGuardedData;
  v2 = [(ATXLocationManagerGuardedData *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ATXLocationManagerGuardedData *)v2 clear];
  }
  return v3;
}

- (void)clear
{
  currentLocation = self->currentLocation;
  self->currentLocation = 0;

  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  lastRequestLocationDate = self->lastRequestLocationDate;
  self->lastRequestLocationDate = v4;

  v6 = (ATXLocationManagerState *)objc_opt_new();
  state = self->state;
  self->state = v6;

  v8 = [MEMORY[0x1E4F1C9C8] distantPast];
  lastLOIUpdateTimestamp = self->lastLOIUpdateTimestamp;
  self->lastLOIUpdateTimestamp = v8;

  v10 = [MEMORY[0x1E4F1C9C8] distantPast];
  lastPredictedLOIsUpdateTimestamp = self->lastPredictedLOIsUpdateTimestamp;
  self->lastPredictedLOIsUpdateTimestamp = v10;

  self->lastPredictedExitTimesUpdateTimestamp = [MEMORY[0x1E4F1C9C8] distantPast];

  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lastPredictedExitTimesUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->lastPredictedLOIsUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->lastRoutineModeTimestamp, 0);
  objc_storeStrong((id *)&self->lastLOIUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->state, 0);
  objc_storeStrong((id *)&self->lastRequestLocationDate, 0);

  objc_storeStrong((id *)&self->currentLocation, 0);
}

@end