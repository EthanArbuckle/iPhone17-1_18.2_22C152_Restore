@interface MNLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)_canProjectAlongRoute;
- (BOOL)_navigation_hasValidCourse;
- (BOOL)_navigation_isStale;
- (BOOL)isDirectional;
- (BOOL)isEqualToLocation:(id)a3;
- (BOOL)isLeeched;
- (BOOL)isProjected;
- (BOOL)locationUnreliable;
- (BOOL)speedLimitIsMPH;
- (CLLocation)rawLocation;
- (CLLocationCoordinate2D)_navigation_rawShiftedCoordinate;
- (CLLocationCoordinate2D)rawShiftedCoordinate;
- (GEONavigationMatchInfo)detailedMatchInfo;
- (GEORoadMatch)roadMatch;
- (GEORouteMatch)routeMatch;
- (MNLocation)initWithCLLocation:(id)a3;
- (MNLocation)initWithClientLocation:(id *)a3;
- (MNLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4;
- (MNLocation)initWithCoder:(id)a3;
- (MNLocation)initWithRawLocation:(id)a3;
- (MNLocation)initWithRawLocation:(id)a3 locationMatchType:(unint64_t)a4;
- (MNLocation)initWithRoadMatch:(id)a3 rawLocation:(id)a4 locationMatchType:(unint64_t)a5;
- (MNLocation)initWithRouteMatch:(id)a3 rawLocation:(id)a4 locationMatchType:(unint64_t)a5;
- (NSDate)expirationDate;
- (NSDate)originalDate;
- (NSString)roadName;
- (NSString)shieldText;
- (NSUUID)routeID;
- (NSUUID)uuid;
- (double)distanceToEndOfCurrentLeg;
- (double)distanceToEndOfRoute;
- (double)traceTimestamp;
- (id)_navigation_detailedMatchInfo;
- (id)_navigation_routeMatch;
- (id)_referenceFrameAsString:(int)a3;
- (id)_roadFeature;
- (id)description;
- (id)matchInfo;
- (id)propagatedLocationForTimeInterval:(double)a3 shouldProjectAlongRoute:(BOOL)a4;
- (int)rampType;
- (int64_t)shieldType;
- (int64_t)speedLimitShieldType;
- (unint64_t)speedLimit;
- (unint64_t)state;
- (unint64_t)stepIndex;
- (unint64_t)traceIndex;
- (unsigned)roadLineType;
- (void)_readFromRoadFeature:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDetailedMatchInfo:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIsDirectional:(BOOL)a3;
- (void)setIsLeeched:(BOOL)a3;
- (void)setLocationUnreliable:(BOOL)a3;
- (void)setOriginalDate:(id)a3;
- (void)setRampType:(int)a3;
- (void)setRawLocation:(id)a3;
- (void)setRawShiftedCoordinate:(CLLocationCoordinate2D)a3;
- (void)setRoadLineType:(unsigned int)a3;
- (void)setRoadMatch:(id)a3;
- (void)setRoadName:(id)a3;
- (void)setRouteMatch:(id)a3;
- (void)setShieldText:(id)a3;
- (void)setShieldType:(int64_t)a3;
- (void)setSpeedLimit:(unint64_t)a3;
- (void)setSpeedLimitIsMPH:(BOOL)a3;
- (void)setSpeedLimitShieldType:(int64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)setTraceIndex:(unint64_t)a3;
- (void)setTraceTimestamp:(double)a3;
- (void)setUuid:(id)a3;
@end

@implementation MNLocation

- (NSUUID)uuid
{
  return self->_uuid;
}

- (MNLocation)initWithCLLocation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 clientLocation];
  }
  else
  {
    long long v16 = 0u;
    memset(v17, 0, 28);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
  }
  v6 = objc_msgSend(v5, "matchInfo", v9, v10, v11, v12, v13, v14, v15, v16, *(void *)v17, *(_OWORD *)&v17[8], *(void *)&v17[24]);
  v7 = [(MNLocation *)self initWithClientLocation:&v9 matchInfo:v6];

  return v7;
}

- (MNLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4
{
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MNLocation;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
  long long v29 = *(_OWORD *)&a3->var11;
  $F24F406B2B787EFB06265DBA3D28CBD5 v30 = var13;
  v31[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)&a3->var16;
  long long v8 = *(_OWORD *)&a3->var5;
  long long v25 = *(_OWORD *)&a3->var3;
  long long v26 = v8;
  long long v9 = *(_OWORD *)&a3->var9;
  long long v27 = *(_OWORD *)&a3->var7;
  long long v28 = v9;
  long long v10 = *(_OWORD *)&a3->var1.var1;
  long long v23 = *(_OWORD *)&a3->var0;
  long long v24 = v10;
  long long v11 = [(MNLocation *)&v32 initWithClientLocation:&v23];
  if (v11)
  {
    if (GEOConfigGetBOOL())
    {
      uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
      uuid = v11->_uuid;
      v11->_uuid = (NSUUID *)v12;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    $F24F406B2B787EFB06265DBA3D28CBD5 v15 = a3->var13;
    long long v29 = *(_OWORD *)&a3->var11;
    $F24F406B2B787EFB06265DBA3D28CBD5 v30 = v15;
    v31[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)&a3->var16;
    long long v16 = *(_OWORD *)&a3->var5;
    long long v25 = *(_OWORD *)&a3->var3;
    long long v26 = v16;
    long long v17 = *(_OWORD *)&a3->var9;
    long long v27 = *(_OWORD *)&a3->var7;
    long long v28 = v17;
    long long v18 = *(_OWORD *)&a3->var1.var1;
    long long v23 = *(_OWORD *)&a3->var0;
    long long v24 = v18;
    uint64_t v19 = [v14 initWithClientLocation:&v23 matchInfo:v6];
    rawLocation = v11->_rawLocation;
    v11->_rawLocation = (CLLocation *)v19;

    v11->_traceIndex = 0x7FFFFFFFFFFFFFFFLL;
    v21 = v11;
  }

  return v11;
}

- (void)setIsLeeched:(BOOL)a3
{
  self->_isLeeched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_detailedMatchInfo, 0);
  objc_storeStrong((id *)&self->_rawLocation, 0);
  objc_storeStrong((id *)&self->_roadMatch, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (MNLocation)initWithClientLocation:(id *)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
  v8[6] = *(_OWORD *)&a3->var11;
  v8[7] = var13;
  v9[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)&a3->var16;
  long long v4 = *(_OWORD *)&a3->var5;
  v8[2] = *(_OWORD *)&a3->var3;
  v8[3] = v4;
  long long v5 = *(_OWORD *)&a3->var9;
  v8[4] = *(_OWORD *)&a3->var7;
  v8[5] = v5;
  long long v6 = *(_OWORD *)&a3->var1.var1;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v6;
  return [(MNLocation *)self initWithClientLocation:v8 matchInfo:0];
}

- (MNLocation)initWithRouteMatch:(id)a3 rawLocation:(id)a4 locationMatchType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  long long v11 = v10;
  long long v32 = 0u;
  memset(v33, 0, 28);
  long long v30 = 0u;
  long long v31 = 0u;
  memset(&v29[22], 0, 80);
  if (v10) {
    [v10 clientLocation];
  }
  if (a5 != 2)
  {
    if (a5) {
      goto LABEL_14;
    }
    if (v11)
    {
      [v11 clientLocation];
      if (DWORD2(v29[20]) == 2)
      {
        objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
        *(void *)((char *)&v29[22] + 4) = v12;
        objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
        *(void *)((char *)&v29[22] + 12) = v13;
LABEL_12:
        [v11 rawCourse];
        goto LABEL_13;
      }
      [v11 clientLocation];
    }
    else
    {
      memset(&v29[12], 0, 156);
      memset(&v29[2], 0, 156);
    }
    *(_OWORD *)((char *)&v29[22] + 4) = *(_OWORD *)((char *)&v29[8] + 4);
    goto LABEL_12;
  }
  [v9 locationCoordinate3D];
  *(void *)((char *)&v29[22] + 4) = v14;
  [v9 locationCoordinate3D];
  *(void *)((char *)&v29[22] + 12) = v15;
  [v9 locationCoordinate3D];
  *(void *)((char *)&v29[23] + 12) = v16;
  [v9 matchedCourse];
LABEL_13:
  *(void *)((char *)&v29[25] + 12) = v17;
LABEL_14:
  v28[6] = v31;
  v28[7] = v32;
  v29[0] = v33[0];
  *(_OWORD *)((char *)v29 + 12) = *(_OWORD *)((char *)v33 + 12);
  v28[2] = v29[24];
  v28[3] = v29[25];
  v28[4] = v29[26];
  v28[5] = v30;
  v28[0] = v29[22];
  v28[1] = v29[23];
  long long v18 = [(MNLocation *)self initWithClientLocation:v28];
  if (v18)
  {
    uint64_t v19 = [v9 road];
    v20 = [v19 feature];

    [(MNLocation *)v18 _readFromRoadFeature:v20];
    v21 = [v9 route];
    uint64_t v22 = [v21 uniqueRouteID];
    routeID = v18->_routeID;
    v18->_routeID = (NSUUID *)v22;

    objc_storeStrong((id *)&v18->_rawLocation, a4);
    objc_storeStrong((id *)&v18->_routeMatch, a3);
    v18->_state = 1;
    objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
    v18->_rawShiftedCoordinate.latitude = v24;
    v18->_rawShiftedCoordinate.longitude = v25;
    long long v26 = v18;
  }
  return v18;
}

- (MNLocation)initWithRoadMatch:(id)a3 rawLocation:(id)a4 locationMatchType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  long long v11 = v10;
  long long v28 = 0u;
  memset(v29, 0, 28);
  long long v26 = 0u;
  long long v27 = 0u;
  memset(&v25[22], 0, 80);
  if (v10) {
    [v10 clientLocation];
  }
  if (a5 != 2)
  {
    if (a5) {
      goto LABEL_14;
    }
    if (v11)
    {
      [v11 clientLocation];
      if (DWORD2(v25[20]) == 2)
      {
        objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
        *(void *)((char *)&v25[22] + 4) = v12;
        objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
        *(void *)((char *)&v25[22] + 12) = v13;
LABEL_12:
        [v11 rawCourse];
        goto LABEL_13;
      }
      [v11 clientLocation];
    }
    else
    {
      memset(&v25[12], 0, 156);
      memset(&v25[2], 0, 156);
    }
    *(_OWORD *)((char *)&v25[22] + 4) = *(_OWORD *)((char *)&v25[8] + 4);
    goto LABEL_12;
  }
  [v9 coordinateOnRoad];
  *(void *)((char *)&v25[22] + 4) = v14;
  [v9 coordinateOnRoad];
  *(void *)((char *)&v25[22] + 12) = v15;
  [v9 coordinateOnRoad];
  *(void *)((char *)&v25[23] + 12) = v16;
  [v9 courseOnRoad];
LABEL_13:
  *(void *)((char *)&v25[25] + 12) = v17;
LABEL_14:
  v24[6] = v27;
  v24[7] = v28;
  v25[0] = v29[0];
  *(_OWORD *)((char *)v25 + 12) = *(_OWORD *)((char *)v29 + 12);
  v24[2] = v25[24];
  v24[3] = v25[25];
  v24[4] = v25[26];
  v24[5] = v26;
  v24[0] = v25[22];
  v24[1] = v25[23];
  long long v18 = [(MNLocation *)self initWithClientLocation:v24];
  if (v18)
  {
    uint64_t v19 = [v9 roadFeature];
    [(MNLocation *)v18 _readFromRoadFeature:v19];
    objc_storeStrong((id *)&v18->_rawLocation, a4);
    objc_storeStrong((id *)&v18->_roadMatch, a3);
    v18->_state = 2;
    objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
    v18->_rawShiftedCoordinate.latitude = v20;
    v18->_rawShiftedCoordinate.longitude = v21;
    uint64_t v22 = v18;
  }
  return v18;
}

- (MNLocation)initWithRawLocation:(id)a3 locationMatchType:(unint64_t)a4
{
  id v7 = a3;
  long long v8 = v7;
  long long v22 = 0u;
  memset(v23, 0, 60);
  memset(v21, 0, sizeof(v21));
  long long v20 = 0u;
  memset(&v19[12], 0, 32);
  if (!v7)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      goto LABEL_9;
    }
    memset(&v19[2], 0, 156);
    goto LABEL_7;
  }
  [v7 clientLocation];
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    goto LABEL_9;
  }
  [v8 clientLocation];
  if (DWORD2(v19[10]) != 2)
  {
LABEL_7:
    *(_OWORD *)((char *)&v19[12] + 4) = *(_OWORD *)((char *)v23 + 4);
    goto LABEL_8;
  }
  objc_msgSend(v8, "_navigation_rawShiftedCoordinate");
  *(void *)((char *)&v19[12] + 4) = v9;
  objc_msgSend(v8, "_navigation_rawShiftedCoordinate");
  *(void *)((char *)&v19[12] + 12) = v10;
LABEL_8:
  [v8 rawCourse];
  *(void *)((char *)v21 + 12) = v11;
LABEL_9:
  v18[6] = v23[0];
  v18[7] = v23[1];
  v19[0] = v23[2];
  *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)((char *)&v23[2] + 12);
  v18[2] = v20;
  v18[3] = v21[0];
  v18[4] = v21[1];
  v18[5] = v22;
  v18[0] = v19[12];
  v18[1] = v19[13];
  uint64_t v12 = [(MNLocation *)self initWithClientLocation:v18];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rawLocation, a3);
    v13->_state = 0;
    objc_msgSend(v8, "_navigation_rawShiftedCoordinate");
    v13->_rawShiftedCoordinate.latitude = v14;
    v13->_rawShiftedCoordinate.longitude = v15;
    uint64_t v16 = v13;
  }

  return v13;
}

- (MNLocation)initWithRawLocation:(id)a3
{
  return [(MNLocation *)self initWithRawLocation:a3 locationMatchType:1];
}

- (id)propagatedLocationForTimeInterval:(double)a3 shouldProjectAlongRoute:(BOOL)a4
{
  BOOL v4 = a4;
  long long v39 = 0u;
  memset(v40, 0, 28);
  long long v37 = 0u;
  long long v38 = 0u;
  memset(v36, 0, sizeof(v36));
  long long v35 = 0u;
  memset(&v34[2], 0, 32);
  [(MNLocation *)self clientLocation];
  id v7 = self->_routeMatch;
  if (v4 && [(MNLocation *)self _canProjectAlongRoute])
  {
    [(MNLocation *)self speed];
    double v9 = v8 * a3;
    uint64_t v10 = [(GEORouteMatch *)self->_routeMatch route];
    uint64_t v11 = [(GEORouteMatch *)self->_routeMatch step];
    uint64_t v12 = objc_msgSend(v10, "routeCoordinateForDistance:afterRouteCoordinate:", -[GEORouteMatch routeCoordinate](self->_routeMatch, "routeCoordinate"), v9);
    uint64_t v13 = [v11 endRouteCoordinate];
    if ((GEOConfigGetBOOL() & 1) == 0 && GEOPolylineCoordinateIsABeforeB()) {
      uint64_t v12 = v13;
    }
    [v10 pointAtRouteCoordinate:v12];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [v10 courseAtRouteCoordinateIndex:v12];
    double v21 = v20;
    *(double *)((char *)&v34[2] + 4) = v15;
    *(double *)((char *)&v34[2] + 12) = v17;
    *(double *)((char *)v36 + 12) = v20;
    id v22 = objc_alloc(MEMORY[0x1E4F649D8]);
    uint64_t v23 = [(GEORouteMatch *)self->_routeMatch stepIndex];
    CLLocationDegrees v24 = [(MNLocation *)self timestamp];
    CLLocationDegrees v25 = objc_msgSend(v22, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v10, v12, v23, v24, v15, v17, v19, v21);

    objc_msgSend(v25, "setIsGoodMatch:", -[GEORouteMatch isGoodMatch](self->_routeMatch, "isGoodMatch"));
    objc_msgSend(v25, "setShouldProjectLocationAlongRoute:", -[GEORouteMatch shouldProjectLocationAlongRoute](self->_routeMatch, "shouldProjectLocationAlongRoute"));
    [(GEORouteMatch *)self->_routeMatch distanceFromRoute];
    objc_msgSend(v25, "setDistanceFromRoute:");
    [(GEORouteMatch *)self->_routeMatch modifiedHorizontalAccuracy];
    objc_msgSend(v25, "setModifiedHorizontalAccuracy:");
    [(GEORouteMatch *)self->_routeMatch modifiedCourseAccuracy];
    objc_msgSend(v25, "setModifiedCourseAccuracy:");
    objc_msgSend(v25, "setIsTunnelProjection:", -[GEORouteMatch isTunnelProjection](self->_routeMatch, "isTunnelProjection"));
    [v25 setProjectedFrom:self->_routeMatch];

    id v7 = (GEORouteMatch *)v25;
  }
  else
  {
    uint64_t v10 = [(MNLocation *)self propagateLocationToTime:a3];
    [v10 coordinate];
    uint64_t v27 = v26;
    [v10 coordinate];
    *(void *)((char *)&v34[2] + 4) = v27;
    *(void *)((char *)&v34[2] + 12) = v28;
    [v10 course];
    *(void *)((char *)v36 + 12) = v29;
  }

  long long v30 = [MNLocation alloc];
  v33[6] = v38;
  v33[7] = v39;
  v34[0] = v40[0];
  *(_OWORD *)((char *)v34 + 12) = *(_OWORD *)((char *)v40 + 12);
  _OWORD v33[2] = v35;
  v33[3] = v36[0];
  v33[4] = v36[1];
  v33[5] = v37;
  v33[0] = v34[2];
  v33[1] = v34[3];
  long long v31 = [(MNLocation *)v30 initWithClientLocation:v33];
  [(MNLocation *)v31 setState:self->_state];
  [(MNLocation *)v31 setRouteMatch:v7];
  [(MNLocation *)v31 setRoadMatch:self->_roadMatch];
  [(MNLocation *)v31 setRawLocation:self->_rawLocation];
  [(MNLocation *)v31 setRoadName:self->_roadName];
  [(MNLocation *)v31 setShieldText:self->_shieldText];
  [(MNLocation *)v31 setShieldType:self->_shieldType];
  [(MNLocation *)v31 setRoadLineType:self->_roadLineType];
  [(MNLocation *)v31 setRampType:self->_rampType];
  [(MNLocation *)v31 setSpeedLimit:self->_speedLimit];
  [(MNLocation *)v31 setSpeedLimitIsMPH:self->_speedLimitIsMPH];
  [(MNLocation *)v31 setSpeedLimitShieldType:self->_speedLimitShieldType];
  [(MNLocation *)v31 setIsDirectional:self->_isDirectional];
  [(MNLocation *)v31 setLocationUnreliable:self->_locationUnreliable];
  [(MNLocation *)v31 setExpirationDate:self->_expirationDate];
  [(MNLocation *)v31 setOriginalDate:self->_originalDate];
  -[MNLocation setRawShiftedCoordinate:](v31, "setRawShiftedCoordinate:", self->_rawShiftedCoordinate.latitude, self->_rawShiftedCoordinate.longitude);
  [(MNLocation *)v31 setTraceIndex:self->_traceIndex];
  [(MNLocation *)v31 setTraceTimestamp:self->_traceTimestamp];

  return v31;
}

- (BOOL)isEqualToLocation:(id)a3
{
  BOOL v4 = a3;
  if (!v4) {
    goto LABEL_77;
  }
  if (GEOConfigGetBOOL())
  {
    uint64_t v5 = v4[2];
    unint64_t v6 = self->_uuid;
    id v7 = (void *)v6;
    if (v6 | v5) {
      LOBYTE(v5) = [(id)v6 isEqual:v5];
    }
    else {
      LOBYTE(v5) = 1;
    }

    goto LABEL_78;
  }
  [(MNLocation *)self coordinate];
  double v9 = v8;
  double v11 = v10;
  [v4 coordinate];
  LOBYTE(v5) = 0;
  if (vabdd_f64(v9, v13) >= 0.000001) {
    goto LABEL_78;
  }
  if (vabdd_f64(v11, v12) >= 0.000001) {
    goto LABEL_78;
  }
  [(MNLocation *)self rawCoordinate];
  double v15 = v14;
  double v17 = v16;
  [v4 rawCoordinate];
  LOBYTE(v5) = 0;
  if (vabdd_f64(v15, v19) >= 0.000001 || vabdd_f64(v17, v18) >= 0.000001) {
    goto LABEL_78;
  }
  [(MNLocation *)self altitude];
  double v21 = v20;
  [v4 altitude];
  if (vabdd_f64(v21, v22) >= 0.000001) {
    goto LABEL_77;
  }
  [(MNLocation *)self horizontalAccuracy];
  double v24 = v23;
  [v4 horizontalAccuracy];
  if (vabdd_f64(v24, v25) >= 0.000001) {
    goto LABEL_77;
  }
  [(MNLocation *)self verticalAccuracy];
  double v27 = v26;
  [v4 verticalAccuracy];
  if (vabdd_f64(v27, v28) >= 0.000001) {
    goto LABEL_77;
  }
  [(MNLocation *)self course];
  double v30 = v29;
  [v4 course];
  if (vabdd_f64(v30, v31) >= 0.000001) {
    goto LABEL_77;
  }
  [(MNLocation *)self rawCourse];
  double v33 = v32;
  [v4 rawCourse];
  if (vabdd_f64(v33, v34) >= 0.000001) {
    goto LABEL_77;
  }
  [(MNLocation *)self courseAccuracy];
  double v36 = v35;
  [v4 courseAccuracy];
  if (vabdd_f64(v36, v37) >= 0.000001) {
    goto LABEL_77;
  }
  [(MNLocation *)self speed];
  double v39 = v38;
  [v4 speed];
  if (vabdd_f64(v39, v40) >= 0.000001) {
    goto LABEL_77;
  }
  [(MNLocation *)self speedAccuracy];
  double v42 = v41;
  [v4 speedAccuracy];
  if (vabdd_f64(v42, v43) >= 0.000001) {
    goto LABEL_77;
  }
  uint64_t v5 = [(MNLocation *)self timestamp];
  v44 = [v4 timestamp];
  if (![(id)v5 isEqualToDate:v44]) {
    goto LABEL_75;
  }
  int v45 = [(MNLocation *)self type];
  if (v45 != [v4 type]) {
    goto LABEL_75;
  }
  int v46 = [(MNLocation *)self integrity];
  if (v46 != [v4 integrity]) {
    goto LABEL_75;
  }
  int v47 = [(MNLocation *)self referenceFrame];
  if (v47 != [v4 referenceFrame]) {
    goto LABEL_75;
  }
  [(MNLocation *)self clientLocation];
  [v4 clientLocation];
  if (v131 != v130) {
    goto LABEL_75;
  }
  [(MNLocation *)self rawShiftedCoordinate];
  double v49 = v48;
  double v51 = v50;
  [v4 rawShiftedCoordinate];
  double v53 = v52;
  double v55 = vabdd_f64(v49, v54);

  LOBYTE(v5) = 0;
  if (v55 >= 0.000001 || vabdd_f64(v51, v53) >= 0.000001) {
    goto LABEL_78;
  }
  if (self->_state != v4[3]) {
    goto LABEL_77;
  }
  v56 = (void *)v4[4];
  unint64_t v57 = self->_routeID;
  unint64_t v58 = v56;
  if (v57 | v58)
  {
    v59 = (void *)v58;
    int v60 = [(id)v57 isEqual:v58];

    if (!v60) {
      goto LABEL_77;
    }
  }
  v61 = (void *)v4[11];
  unint64_t v62 = self->_roadName;
  unint64_t v63 = v61;
  if (v62 | v63)
  {
    v64 = (void *)v63;
    int v65 = [(id)v62 isEqual:v63];

    if (!v65) {
      goto LABEL_77;
    }
  }
  v66 = (void *)v4[12];
  unint64_t v67 = self->_shieldText;
  unint64_t v68 = v66;
  if (v67 | v68)
  {
    v69 = (void *)v68;
    int v70 = [(id)v67 isEqual:v68];

    if (!v70) {
      goto LABEL_77;
    }
  }
  if (self->_shieldType != v4[13]) {
    goto LABEL_77;
  }
  if (self->_roadLineType != *((_DWORD *)v4 + 28)) {
    goto LABEL_77;
  }
  if (self->_rampType != *((_DWORD *)v4 + 29)) {
    goto LABEL_77;
  }
  if (self->_speedLimit != v4[15]) {
    goto LABEL_77;
  }
  if (self->_speedLimitIsMPH != *((unsigned __int8 *)v4 + 128)) {
    goto LABEL_77;
  }
  if (self->_isDirectional != *((unsigned __int8 *)v4 + 144)) {
    goto LABEL_77;
  }
  if (self->_locationUnreliable != *((unsigned __int8 *)v4 + 145)) {
    goto LABEL_77;
  }
  v71 = (void *)v4[19];
  unint64_t v72 = self->_expirationDate;
  unint64_t v73 = v71;
  if (v72 | v73)
  {
    v74 = (void *)v73;
    int v75 = [(id)v72 isEqual:v73];

    if (!v75) {
      goto LABEL_77;
    }
  }
  v76 = (void *)v4[20];
  unint64_t v77 = self->_originalDate;
  unint64_t v78 = v76;
  if (v77 | v78)
  {
    v79 = (void *)v78;
    int v80 = [(id)v77 isEqual:v78];

    if (!v80)
    {
LABEL_77:
      LOBYTE(v5) = 0;
      goto LABEL_78;
    }
  }
  BOOL v81 = self->_routeMatch == 0;
  v82 = [v4 routeMatch];
  LODWORD(v5) = v81 ^ (v82 != 0);

  routeMatch = self->_routeMatch;
  if (!routeMatch)
  {
    if (!v5) {
      goto LABEL_78;
    }
    goto LABEL_57;
  }
  if (!v5) {
    goto LABEL_78;
  }
  int v84 = [(GEORouteMatch *)routeMatch routeCoordinate];
  uint64_t v5 = [v4 routeMatch];
  if (v84 != [(id)v5 routeCoordinate]) {
    goto LABEL_76;
  }
  LODWORD(v85) = (unint64_t)[(GEORouteMatch *)self->_routeMatch routeCoordinate] >> 32;
  v44 = [v4 routeMatch];
  if (vabds_f32(v85, COERCE_FLOAT((unint64_t)[v44 routeCoordinate] >> 32)) >= 0.000001)
  {
LABEL_75:

LABEL_76:
    goto LABEL_77;
  }
  [(GEORouteMatch *)self->_routeMatch locationCoordinate];
  double v87 = v86;
  v88 = [v4 routeMatch];
  [v88 locationCoordinate];
  if (vabdd_f64(v87, v89) >= 0.000001)
  {
LABEL_74:

    goto LABEL_75;
  }
  [(GEORouteMatch *)self->_routeMatch locationCoordinate];
  double v91 = v90;
  v92 = [v4 routeMatch];
  [v92 locationCoordinate];
  if (vabdd_f64(v91, v93) >= 0.000001)
  {
LABEL_73:

    goto LABEL_74;
  }
  [(GEORouteMatch *)self->_routeMatch matchedCourse];
  double v95 = v94;
  v96 = [v4 routeMatch];
  [v96 matchedCourse];
  if (vabdd_f64(v95, v97) >= 0.000001)
  {
LABEL_72:

    goto LABEL_73;
  }
  int v98 = [(GEORouteMatch *)self->_routeMatch isGoodMatch];
  v99 = [v4 routeMatch];
  if (v98 != [v99 isGoodMatch])
  {
LABEL_71:

    goto LABEL_72;
  }
  [(GEORouteMatch *)self->_routeMatch distanceFromRoute];
  double v101 = v100;
  v102 = [v4 routeMatch];
  [v102 distanceFromRoute];
  if (vabdd_f64(v101, v103) >= 0.000001)
  {
LABEL_70:

    goto LABEL_71;
  }
  [(GEORouteMatch *)self->_routeMatch modifiedHorizontalAccuracy];
  double v105 = v104;
  v129 = [v4 routeMatch];
  [v129 modifiedHorizontalAccuracy];
  if (vabdd_f64(v105, v106) >= 0.000001)
  {

    goto LABEL_70;
  }
  [(GEORouteMatch *)self->_routeMatch modifiedCourseAccuracy];
  double v108 = v107;
  v109 = [v4 routeMatch];
  [v109 modifiedCourseAccuracy];
  double v111 = vabdd_f64(v108, v110);

  if (v111 >= 0.000001) {
    goto LABEL_77;
  }
LABEL_57:
  BOOL v112 = self->_roadMatch == 0;
  v113 = [v4 roadMatch];
  int v114 = v112 ^ (v113 != 0);

  roadMatch = self->_roadMatch;
  if (roadMatch) {
    LOBYTE(v5) = 0;
  }
  else {
    LOBYTE(v5) = v114;
  }
  if (roadMatch && v114)
  {
    [(GEORoadMatch *)roadMatch coordinateOnRoad];
    double v117 = v116;
    v118 = [v4 roadMatch];
    [v118 coordinateOnRoad];
    if (vabdd_f64(v117, v119) >= 0.000001)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      [(GEORoadMatch *)self->_roadMatch coordinateOnRoad];
      double v121 = v120;
      v122 = [v4 roadMatch];
      [v122 coordinateOnRoad];
      if (vabdd_f64(v121, v123) >= 0.000001)
      {
        LOBYTE(v5) = 0;
      }
      else
      {
        [(GEORoadMatch *)self->_roadMatch courseOnRoad];
        double v125 = v124;
        v126 = [v4 roadMatch];
        [v126 courseOnRoad];
        LOBYTE(v5) = vabdd_f64(v125, v127) < 0.000001;
      }
    }
  }
LABEL_78:

  return v5;
}

- (void)setRouteMatch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 route];
  unint64_t v6 = [v5 uniqueRouteID];
  routeID = self->_routeID;
  self->_routeID = v6;

  routeMatch = self->_routeMatch;
  self->_routeMatch = (GEORouteMatch *)v4;
}

- (NSString)roadName
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (!state)
  {
LABEL_11:
    id v4 = 0;
    goto LABEL_12;
  }
  if (state != 2)
  {
    if (state == 1)
    {
      roadName = self->_roadName;
      if (!roadName) {
        roadName = self->_shieldText;
      }
      goto LABEL_7;
    }
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315650;
      double v8 = "-[MNLocation roadName]";
      __int16 v9 = 2080;
      double v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/MNLocation.m";
      __int16 v11 = 1024;
      int v12 = 373;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_11;
  }
  roadName = self->_roadName;
  if (roadName)
  {
LABEL_7:
    id v4 = roadName;
    goto LABEL_12;
  }
  id v4 = [(GEORoadMatch *)self->_roadMatch roadName];
LABEL_12:
  return v4;
}

- (unint64_t)stepIndex
{
  routeMatch = self->_routeMatch;
  if (routeMatch) {
    return [(GEORouteMatch *)routeMatch stepIndex];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)isProjected
{
  if (!self->_routeMatch || [(MNLocation *)self state] != 1) {
    return 0;
  }
  routeMatch = self->_routeMatch;
  return [(GEORouteMatch *)routeMatch isTunnelProjection];
}

- (NSDate)originalDate
{
  originalDate = self->_originalDate;
  if (originalDate)
  {
    v3 = originalDate;
  }
  else
  {
    v3 = [(CLLocation *)self->_rawLocation timestamp];
  }
  return v3;
}

- (void)setRawShiftedCoordinate:(CLLocationCoordinate2D)a3
{
  self->_rawShiftedCoordinate = a3;
}

- (double)distanceToEndOfRoute
{
  routeMatch = self->_routeMatch;
  if (!routeMatch) {
    return -1.0;
  }
  uint64_t v4 = [(GEORouteMatch *)routeMatch routeCoordinate];
  uint64_t v5 = [(GEORouteMatch *)self->_routeMatch route];
  [v5 distanceToEndFromRouteCoordinate:v4];
  double v7 = v6;

  return v7;
}

- (double)distanceToEndOfCurrentLeg
{
  routeMatch = self->_routeMatch;
  if (!routeMatch) {
    return -1.0;
  }
  uint64_t v4 = [(GEORouteMatch *)routeMatch routeCoordinate];
  uint64_t v5 = [(GEORouteMatch *)self->_routeMatch leg];
  uint64_t v6 = [v5 endRouteCoordinate];

  if (GEOPolylineCoordinateIsABeforeB()) {
    return -1.0;
  }
  double v8 = [(GEORouteMatch *)self->_routeMatch route];
  [v8 distanceBetweenRouteCoordinate:v4 andRouteCoordinate:v6];
  double v10 = v9;

  return v10;
}

- (id)matchInfo
{
  return (id)[(CLLocation *)self->_rawLocation matchInfo];
}

- (BOOL)_canProjectAlongRoute
{
  int v3 = [(GEORouteMatch *)self->_routeMatch shouldProjectLocationAlongRoute];
  if (self->_state == 1) {
    char v4 = [(GEORouteMatch *)self->_routeMatch isGoodMatch];
  }
  else {
    char v4 = 0;
  }
  [(MNLocation *)self speed];
  if (v5 >= 0.0)
  {
    [(MNLocation *)self speedAccuracy];
    BOOL v6 = v8 >= 0.0;
    if (!v3) {
      return 0;
    }
  }
  else
  {
    BOOL v6 = 0;
    if (!v3) {
      return 0;
    }
  }
  return v4 & v6;
}

- (id)_roadFeature
{
  if (self->_state == 2)
  {
    v2 = [(GEORoadMatch *)self->_roadMatch roadFeature];
  }
  else
  {
    int v3 = [(GEORouteMatch *)self->_routeMatch road];
    v2 = [v3 feature];
  }
  return v2;
}

- (void)_readFromRoadFeature:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [v4 feature];
    BOOL v6 = [v5 attributes];
    self->_roadLineType = [v6 lineType];

    double v7 = [v4 feature];
    double v8 = [v7 attributes];
    self->_rampType = [v8 rampType];

    self->_speedLimit = [v4 displaySpeedLimit];
    self->_speedLimitIsMPH = [v4 displaySpeedLimitIsMPH];
    LODWORD(v7) = [v4 speedLimitShieldId];

    self->_speedLimitShieldType = v7;
  }
}

- (BOOL)_navigation_isStale
{
  if ([(MNLocation *)self isProjected] || [(MNLocation *)self locationUnreliable])
  {
    LOBYTE(expirationDate) = 1;
  }
  else
  {
    expirationDate = self->_expirationDate;
    if (expirationDate)
    {
      double v5 = [MEMORY[0x1E4F1C9C8] date];
      LOBYTE(expirationDate) = [(NSDate *)expirationDate compare:v5] != NSOrderedDescending;
    }
  }
  return (char)expirationDate;
}

- (BOOL)_navigation_hasValidCourse
{
  v4.receiver = self;
  v4.super_class = (Class)MNLocation;
  return [(CLLocation *)&v4 _navigation_hasValidCourse]
      || [(MNLocation *)self state] != 0;
}

- (id)_navigation_routeMatch
{
  return self->_routeMatch;
}

- (CLLocationCoordinate2D)_navigation_rawShiftedCoordinate
{
  double latitude = self->_rawShiftedCoordinate.latitude;
  double longitude = self->_rawShiftedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (id)_navigation_detailedMatchInfo
{
  return self->_detailedMatchInfo;
}

- (id)description
{
  int v3 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = [NSString stringWithFormat:@"UUID: %@", self->_uuid];
  [v3 addObject:v4];

  unint64_t state = self->_state;
  if (state > 2) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = off_1E60FB660[state];
  }
  double v7 = [NSString stringWithFormat:@"Match type: %@", v6];
  [v3 addObject:v7];

  double v8 = NSString;
  [(MNLocation *)self coordinate];
  uint64_t v10 = v9;
  [(MNLocation *)self coordinate];
  uint64_t v12 = v11;
  [(MNLocation *)self horizontalAccuracy];
  uint64_t v14 = v13;
  [(MNLocation *)self rawCoordinate];
  uint64_t v16 = v15;
  [(MNLocation *)self rawCoordinate];
  double v18 = [v8 stringWithFormat:@"Coordinate: %f, %f ±%0.2f (raw: %f, %f)", v10, v12, v14, v16, v17];
  [v3 addObject:v18];

  double v19 = NSString;
  [(MNLocation *)self course];
  uint64_t v21 = v20;
  [(MNLocation *)self courseAccuracy];
  uint64_t v23 = v22;
  [(MNLocation *)self rawCourse];
  double v25 = objc_msgSend(v19, "stringWithFormat:", @"Course: %0.2f° ±%0.2f (raw: %0.2f°)", v21, v23, v24);
  [v3 addObject:v25];

  double v26 = NSString;
  [(MNLocation *)self speed];
  uint64_t v28 = v27;
  [(CLLocation *)self _navigation_speedAccuracy];
  double v30 = objc_msgSend(v26, "stringWithFormat:", @"Speed: %0.2f m/s ±%0.2f", v28, v29);
  [v3 addObject:v30];

  id v31 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v31 setDateFormat:@"yyyy-MM-dd h:mm:ss.SSS a"];
  double v32 = [(MNLocation *)self timestamp];
  double v33 = [v31 stringFromDate:v32];

  double v34 = NSString;
  double v35 = [(MNLocation *)self timestamp];
  [v35 timeIntervalSinceReferenceDate];
  double v37 = [v34 stringWithFormat:@"Date: %@ (%0.3f)", v33, v36];
  [v3 addObject:v37];

  double v38 = (void *)MEMORY[0x1E4F64670];
  [(MNLocation *)self coordinate];
  if (objc_msgSend(v38, "isLocationShiftRequiredForCoordinate:"))
  {
    double v39 = NSString;
    double v40 = [(MNLocation *)self _referenceFrameAsString:[(MNLocation *)self referenceFrame]];
    [(MNLocation *)self clientLocation];
    double v41 = [(MNLocation *)self _referenceFrameAsString:v45];
    double v42 = [v39 stringWithFormat:@"Reference frame: %@ (raw: %@)", v40, v41];
    [v3 addObject:v42];
  }
  double v43 = [v3 componentsJoinedByString:@"\n"];

  return v43;
}

- (id)_referenceFrameAsString:(int)a3
{
  int v3 = @"Unknown";
  if (a3 == 2) {
    int v3 = @"ChinaShifted";
  }
  if (a3 == 1) {
    return @"WGS84";
  }
  else {
    return v3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MNLocation;
  double v5 = [(MNLocation *)&v34 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_unint64_t state = [v4 decodeIntegerForKey:@"_state"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeID"];
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_rawLocation"];
    rawLocation = v5->_rawLocation;
    v5->_rawLocation = (CLLocation *)v10;

    unint64_t v33 = 0;
    id v12 = v4;
    uint64_t v13 = (const void *)[v12 decodeBytesForKey:@"_rawShiftedCoordinate" returnedLength:&v33];
    if (v33 && v13)
    {
      if (v33 >= 0x10) {
        size_t v14 = 16;
      }
      else {
        size_t v14 = v33;
      }
      memcpy(&v5->_rawShiftedCoordinate, v13, v14);
    }
    uint64_t v15 = [v12 decodeObjectOfClass:objc_opt_class() forKey:@"_roadName"];
    roadName = v5->_roadName;
    v5->_roadName = (NSString *)v15;

    uint64_t v17 = [v12 decodeObjectOfClass:objc_opt_class() forKey:@"_shieldText"];
    shieldText = v5->_shieldText;
    v5->_shieldText = (NSString *)v17;

    v5->_shieldType = [v12 decodeIntegerForKey:@"_shieldType"];
    v5->_roadLineType = [v12 decodeIntegerForKey:@"_roadLineType"];
    v5->_rampType = [v12 decodeIntegerForKey:@"_rampType"];
    v5->_speedLimit = [v12 decodeIntegerForKey:@"_speedLimit"];
    v5->_speedLimitIsMPH = [v12 decodeBoolForKey:@"_speedLimitIsMPH"];
    v5->_speedLimitShieldType = [v12 decodeIntegerForKey:@"_speedLimitShieldType"];
    v5->_isDirectional = [v12 decodeBoolForKey:@"_isDirectional"];
    v5->_locationUnreliable = [v12 decodeBoolForKey:@"_locationUnreliable"];
    uint64_t v19 = [v12 decodeObjectOfClass:objc_opt_class() forKey:@"_expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v19;

    uint64_t v21 = [v12 decodeObjectOfClass:objc_opt_class() forKey:@"_originalDate"];
    originalDate = v5->_originalDate;
    v5->_originalDate = (NSDate *)v21;

    uint64_t v23 = [v12 decodeObjectOfClass:objc_opt_class() forKey:@"_routeMatch"];
    routeMatch = v5->_routeMatch;
    v5->_routeMatch = (GEORouteMatch *)v23;

    uint64_t v25 = [v12 decodeObjectOfClass:objc_opt_class() forKey:@"_roadMatch"];
    roadMatch = v5->_roadMatch;
    v5->_roadMatch = (GEORoadMatch *)v25;

    if (!v5->_rawLocation)
    {
      id v27 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      [(MNLocation *)v5 clientLocation];
      uint64_t v28 = [v27 initWithClientLocation:v32];
      uint64_t v29 = v5->_rawLocation;
      v5->_rawLocation = (CLLocation *)v28;
    }
    v5->_traceIndex = 0x7FFFFFFFFFFFFFFFLL;
    double v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MNLocation;
  id v4 = a3;
  [(MNLocation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, @"_uuid", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_state forKey:@"_state"];
  [v4 encodeObject:self->_routeID forKey:@"_routeID"];
  [v4 encodeObject:self->_rawLocation forKey:@"_rawLocation"];
  [v4 encodeBytes:&self->_rawShiftedCoordinate length:16 forKey:@"_rawShiftedCoordinate"];
  [v4 encodeObject:self->_roadName forKey:@"_roadName"];
  [v4 encodeObject:self->_shieldText forKey:@"_shieldText"];
  [v4 encodeInteger:self->_shieldType forKey:@"_shieldType"];
  [v4 encodeInteger:self->_roadLineType forKey:@"_roadLineType"];
  [v4 encodeInteger:self->_rampType forKey:@"_rampType"];
  [v4 encodeInteger:self->_speedLimit forKey:@"_speedLimit"];
  [v4 encodeBool:self->_speedLimitIsMPH forKey:@"_speedLimitIsMPH"];
  [v4 encodeInteger:self->_speedLimitShieldType forKey:@"_speedLimitShieldType"];
  [v4 encodeBool:self->_isDirectional forKey:@"_isDirectional"];
  [v4 encodeBool:self->_locationUnreliable forKey:@"_locationUnreliable"];
  [v4 encodeObject:self->_expirationDate forKey:@"_expirationDate"];
  [v4 encodeObject:self->_originalDate forKey:@"_originalDate"];
  [v4 encodeObject:self->_routeMatch forKey:@"_routeMatch"];
  [v4 encodeObject:self->_roadMatch forKey:@"_roadMatch"];
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (GEORoadMatch)roadMatch
{
  return self->_roadMatch;
}

- (void)setRoadMatch:(id)a3
{
}

- (CLLocation)rawLocation
{
  return self->_rawLocation;
}

- (void)setRawLocation:(id)a3
{
}

- (GEONavigationMatchInfo)detailedMatchInfo
{
  return self->_detailedMatchInfo;
}

- (void)setDetailedMatchInfo:(id)a3
{
}

- (void)setRoadName:(id)a3
{
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (void)setShieldText:(id)a3
{
}

- (int64_t)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(int64_t)a3
{
  self->_shieldType = a3;
}

- (unsigned)roadLineType
{
  return self->_roadLineType;
}

- (void)setRoadLineType:(unsigned int)a3
{
  self->_roadLineType = a3;
}

- (int)rampType
{
  return self->_rampType;
}

- (void)setRampType:(int)a3
{
  self->_rampType = a3;
}

- (unint64_t)speedLimit
{
  return self->_speedLimit;
}

- (void)setSpeedLimit:(unint64_t)a3
{
  self->_speedLimit = a3;
}

- (BOOL)speedLimitIsMPH
{
  return self->_speedLimitIsMPH;
}

- (void)setSpeedLimitIsMPH:(BOOL)a3
{
  self->_speedLimitIsMPH = a3;
}

- (int64_t)speedLimitShieldType
{
  return self->_speedLimitShieldType;
}

- (void)setSpeedLimitShieldType:(int64_t)a3
{
  self->_speedLimitShieldType = a3;
}

- (BOOL)isDirectional
{
  return self->_isDirectional;
}

- (void)setIsDirectional:(BOOL)a3
{
  self->_isDirectional = a3;
}

- (BOOL)locationUnreliable
{
  return self->_locationUnreliable;
}

- (void)setLocationUnreliable:(BOOL)a3
{
  self->_locationUnreliable = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setOriginalDate:(id)a3
{
}

- (CLLocationCoordinate2D)rawShiftedCoordinate
{
  double latitude = self->_rawShiftedCoordinate.latitude;
  double longitude = self->_rawShiftedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (BOOL)isLeeched
{
  return self->_isLeeched;
}

- (unint64_t)traceIndex
{
  return self->_traceIndex;
}

- (void)setTraceIndex:(unint64_t)a3
{
  self->_traceIndex = a3;
}

- (double)traceTimestamp
{
  return self->_traceTimestamp;
}

- (void)setTraceTimestamp:(double)a3
{
  self->_traceTimestamp = a3;
}

@end