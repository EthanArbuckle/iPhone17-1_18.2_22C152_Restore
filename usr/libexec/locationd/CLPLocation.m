@interface CLPLocation
- (CLPLocation)initWithDaemonLocation:(CLDaemonLocation *)a3 rawMotionActivity:(CLMotionActivity *)a4 motionActivity:(double)a5 dominantMotionActivity:(int)a6 vehicleConnected:(int)a7 vehicleConnectionStateChanged:(id)a8;
- (id)initWithDaemonLocation:(CLDaemonLocation *)a3;
@end

@implementation CLPLocation

- (id)initWithDaemonLocation:(CLDaemonLocation *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CLPLocation;
  v4 = [(CLPLocation *)&v15 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (HIDWORD(a3->rawCourse) == 1)
  {
    [(CLPLocation *)v4 setLatitude:*(double *)(&a3->suitability + 1)];
    v6 = (double *)((char *)&a3->coordinate.latitude + 4);
LABEL_6:
    [(CLPLocation *)v5 setLongitude:*v6];
    goto LABEL_7;
  }
  if (a3->floor == 1)
  {
    [(CLPLocation *)v4 setLatitude:*(double *)((char *)&a3->lifespan + 4)];
    v6 = (double *)(&a3->type + 1);
    goto LABEL_6;
  }
LABEL_7:
  double v7 = *(double *)((char *)&a3->coordinate.longitude + 4);
  *(float *)&double v7 = v7;
  [(CLPLocation *)v5 setHorizontalAccuracy:v7];
  [(CLPLocation *)v5 setTimestamp:*(double *)((char *)&a3->courseAccuracy + 4)];
  [(CLPLocation *)v5 setProvider:LODWORD(a3->lifespan)];
  if (*(double *)((char *)&a3->speedAccuracy + 4) >= 0.0)
  {
    double v8 = *(double *)((char *)&a3->verticalAccuracy + 4);
    *(float *)&double v8 = v8;
    [(CLPLocation *)v5 setSpeed:v8];
    double v9 = *(double *)((char *)&a3->speed + 4);
    *(float *)&double v9 = v9;
    [(CLPLocation *)v5 setSpeedAccuracy:v9];
    double v10 = *(double *)((char *)&a3->speedAccuracy + 4);
    *(float *)&double v10 = v10;
    [(CLPLocation *)v5 setCourse:v10];
    double v11 = *(double *)((char *)&a3->course + 4);
    *(float *)&double v11 = v11;
    [(CLPLocation *)v5 setCourseAccuracy:v11];
  }
  if (*(double *)((char *)&a3->altitude + 4) > 0.0)
  {
    double v12 = *(double *)((char *)&a3->horizontalAccuracy + 4);
    *(float *)&double v12 = v12;
    [(CLPLocation *)v5 setAltitude:v12];
    double v13 = *(double *)((char *)&a3->altitude + 4);
    *(float *)&double v13 = v13;
    [(CLPLocation *)v5 setVerticalAccuracy:v13];
  }
  return v5;
}

- (CLPLocation)initWithDaemonLocation:(CLDaemonLocation *)a3 rawMotionActivity:(CLMotionActivity *)a4 motionActivity:(double)a5 dominantMotionActivity:(int)a6 vehicleConnected:(int)a7 vehicleConnectionStateChanged:(id)a8
{
  uint64_t v13 = *(void *)&a9;
  uint64_t v14 = *(void *)&a8;
  uint64_t v15 = *(void *)&a7;
  uint64_t v16 = *(void *)&a6;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
  v56[6] = *(_OWORD *)&a3->lifespan;
  v56[7] = rawCoordinate;
  v57[0] = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)((char *)v57 + 12) = *(_OWORD *)&a3->integrity;
  long long v19 = *(_OWORD *)&a3->speed;
  v56[2] = *(_OWORD *)&a3->altitude;
  v56[3] = v19;
  long long v20 = *(_OWORD *)&a3->timestamp;
  v56[4] = *(_OWORD *)&a3->course;
  v56[5] = v20;
  long long v21 = *(_OWORD *)&a3->coordinate.longitude;
  v56[0] = *(_OWORD *)&a3->suitability;
  v56[1] = v21;
  v22 = [(CLPLocation *)self initWithDaemonLocation:v56];
  if (v22)
  {
    id v23 = objc_alloc((Class)CLPMotionActivity);
    long long v24 = *(_OWORD *)&a4[1].isStanding;
    v54[6] = *(_OWORD *)&a4[1].mountedConfidence;
    v54[7] = v24;
    uint64_t v55 = *(void *)&a4[1].isVehicleConnected;
    long long v25 = *(_OWORD *)&a4->isVehicleConnected;
    v54[2] = *(_OWORD *)&a4->isStanding;
    v54[3] = v25;
    long long v26 = *(_OWORD *)&a4[1].type;
    v54[4] = *(_OWORD *)&a4->vehicleType;
    v54[5] = v26;
    long long v27 = *(_OWORD *)&a4->mountedConfidence;
    v54[0] = *(_OWORD *)&a4->type;
    v54[1] = v27;
    id v28 = [v23 initWithCLMotionActivity:v54];
    [(CLPLocation *)v22 setRawMotionActivity:v28];

    id v29 = objc_alloc((Class)CLPMotionActivity);
    long long v30 = *(_OWORD *)(v16 + 112);
    v52[6] = *(_OWORD *)(v16 + 96);
    v52[7] = v30;
    uint64_t v53 = *(void *)(v16 + 128);
    long long v31 = *(_OWORD *)(v16 + 48);
    v52[2] = *(_OWORD *)(v16 + 32);
    v52[3] = v31;
    long long v32 = *(_OWORD *)(v16 + 80);
    v52[4] = *(_OWORD *)(v16 + 64);
    v52[5] = v32;
    long long v33 = *(_OWORD *)(v16 + 16);
    v52[0] = *(_OWORD *)v16;
    v52[1] = v33;
    id v34 = [v29 initWithCLMotionActivity:v52];
    [(CLPLocation *)v22 setMotionActivity:v34];

    id v35 = objc_alloc((Class)CLPMotionActivity);
    long long v36 = *(_OWORD *)(v15 + 112);
    v50[6] = *(_OWORD *)(v15 + 96);
    v50[7] = v36;
    uint64_t v51 = *(void *)(v15 + 128);
    long long v37 = *(_OWORD *)(v15 + 48);
    v50[2] = *(_OWORD *)(v15 + 32);
    v50[3] = v37;
    long long v38 = *(_OWORD *)(v15 + 80);
    v50[4] = *(_OWORD *)(v15 + 64);
    v50[5] = v38;
    long long v39 = *(_OWORD *)(v15 + 16);
    v50[0] = *(_OWORD *)v15;
    v50[1] = v39;
    id v40 = [v35 initWithCLMotionActivity:v50];
    [(CLPLocation *)v22 setDominantMotionActivity:v40];

    [(CLPLocation *)v22 setMotionVehicleConnected:v14];
    [(CLPLocation *)v22 setMotionVehicleConnectedStateChanged:v13];
    id v41 = objc_alloc((Class)CLPVehicleType);
    long long v42 = *(_OWORD *)(v16 + 112);
    v48[6] = *(_OWORD *)(v16 + 96);
    v48[7] = v42;
    uint64_t v49 = *(void *)(v16 + 128);
    long long v43 = *(_OWORD *)(v16 + 48);
    v48[2] = *(_OWORD *)(v16 + 32);
    v48[3] = v43;
    long long v44 = *(_OWORD *)(v16 + 80);
    v48[4] = *(_OWORD *)(v16 + 64);
    v48[5] = v44;
    long long v45 = *(_OWORD *)(v16 + 16);
    v48[0] = *(_OWORD *)v16;
    v48[1] = v45;
    id v46 = [v41 initWithCLMotionActivity:v48];
    [(CLPLocation *)v22 setVehicleType:v46];
  }
  return v22;
}

@end