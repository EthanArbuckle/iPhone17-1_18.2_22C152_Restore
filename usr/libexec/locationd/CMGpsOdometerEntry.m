@interface CMGpsOdometerEntry
- (CLOdometerEntry)gpsOdomEntry;
- (CMGpsOdometerEntry)initWithOdometerEntry:(CLOdometerEntry *)a3;
- (double)dist;
- (id)date;
@end

@implementation CMGpsOdometerEntry

- (CMGpsOdometerEntry)initWithOdometerEntry:(CLOdometerEntry *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CMGpsOdometerEntry;
  result = [(CMGpsOdometerEntry *)&v14 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->startTime;
    long long v6 = *(_OWORD *)&a3->accuracy;
    long long v7 = *(_OWORD *)&a3->speed;
    *(_OWORD *)&result->gpsOdomEntry.odometer = *(_OWORD *)&a3->odometer;
    *(_OWORD *)&result->gpsOdomEntry.speed = v7;
    *(_OWORD *)&result->gpsOdomEntry.accuracy = v6;
    *(_OWORD *)&result->gpsOdomEntry.startTime = v5;
    long long v8 = *(_OWORD *)&a3->timestampGps;
    long long v9 = *(_OWORD *)&a3->quality;
    long long v10 = *(_OWORD *)&a3->groundAltitude;
    *(_OWORD *)&result->gpsOdomEntry.smoothedGPSAltitude = *(_OWORD *)&a3->smoothedGPSAltitude;
    *(_OWORD *)&result->gpsOdomEntry.groundAltitude = v10;
    *(_OWORD *)&result->gpsOdomEntry.quality = v9;
    *(_OWORD *)&result->gpsOdomEntry.timestampGps = v8;
    long long v11 = *(_OWORD *)&a3->gpsCourseRadians;
    long long v12 = *(_OWORD *)&a3->slope;
    long long v13 = *(_OWORD *)&a3->batchedLocationFixType;
    result->gpsOdomEntry.trackProximityInfo = a3->trackProximityInfo;
    *(_OWORD *)&result->gpsOdomEntry.batchedLocationFixType = v13;
    *(_OWORD *)&result->gpsOdomEntry.slope = v12;
    *(_OWORD *)&result->gpsOdomEntry.gpsCourseRadians = v11;
  }
  return result;
}

- (id)date
{
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:self->gpsOdomEntry.startTime];
}

- (double)dist
{
  return self->gpsOdomEntry.odometer;
}

- (CLOdometerEntry)gpsOdomEntry
{
  long long v3 = *(_OWORD *)&self->maxAbsSlope;
  *(_OWORD *)&retstr->gpsCourseRadians = *(_OWORD *)&self->gpsCourseAccuracy;
  *(_OWORD *)&retstr->slope = v3;
  CLOdometerTrackProximityInfo v4 = *(CLOdometerTrackProximityInfo *)&self->trackProximityInfo.distanceToTrackMeters;
  *(_OWORD *)&retstr->batchedLocationFixType = *(_OWORD *)&self->trackRunOdometerHasBeenCorrected;
  retstr->trackProximityInfo = v4;
  long long v5 = *(_OWORD *)&self->type;
  *(_OWORD *)&retstr->timestampGps = *(_OWORD *)&self->machContinuousTime;
  *(_OWORD *)&retstr->quality = v5;
  long long v6 = *(_OWORD *)&self->smoothedGPSAltitudeUncertainty;
  *(_OWORD *)&retstr->groundAltitude = *(_OWORD *)&self->groundAltitudeUncertainty;
  *(_OWORD *)&retstr->smoothedGPSAltitude = v6;
  long long v7 = *(_OWORD *)&self->gpsAltitude;
  *(_OWORD *)&retstr->startTime = *(_OWORD *)&self->distance;
  *(_OWORD *)&retstr->accuracy = v7;
  long long v8 = *(_OWORD *)&self->gpsSpeedAccuracy;
  *(_OWORD *)&retstr->speed = *(_OWORD *)&self->rawSpeed;
  *(_OWORD *)&retstr->odometer = v8;
  return self;
}

@end