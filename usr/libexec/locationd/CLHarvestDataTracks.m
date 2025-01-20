@interface CLHarvestDataTracks
+ (BOOL)supportsSecureCoding;
- (BOOL)isProactiveLocationSession;
- (BOOL)motionVehicleConnected;
- (BOOL)motionVehicleConnectedStateChanged;
- (CLDaemonLocation)location;
- (CLHarvestDataTracks)initWithCoder:(id)a3;
- (CLHarvestDataTracks)initWithTracksData:(HarvestData *)a3 andLocation:;
- (CLMotionActivity)dominantMotionActivity;
- (CLMotionActivity)motionActivity;
- (CLMotionActivity)rawMotionActivity;
- (CLPAccessoryMeta)activeAccessory;
- (NSString)bundleId;
- (NSString)bundleIds;
- (NSString)tripId;
- (double)tripTimestamp;
- (id).cxx_construct;
- (id)description;
- (id)jsonObject;
- (int)context;
- (int)mcc;
- (int)mnc;
- (int)modeIndicator;
- (int)rat;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveAccessory:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setBundleIds:(id)a3;
- (void)setContext:(int)a3;
- (void)setDominantMotionActivity:(CLMotionActivity *)a3;
- (void)setIsProactiveLocationSession:(BOOL)a3;
- (void)setLocation:(CLDaemonLocation *)a3;
- (void)setMcc:(int)a3;
- (void)setMnc:(int)a3;
- (void)setModeIndicator:(int)a3;
- (void)setMotionActivity:(CLMotionActivity *)a3;
- (void)setMotionVehicleConnected:(BOOL)a3;
- (void)setMotionVehicleConnectedStateChanged:(BOOL)a3;
- (void)setRat:(int)a3;
- (void)setRawMotionActivity:(CLMotionActivity *)a3;
- (void)setTripId:(id)a3;
- (void)setTripTimestamp:(double)a3;
@end

@implementation CLHarvestDataTracks

- (CLHarvestDataTracks)initWithCoder:(id)a3
{
  v56.receiver = self;
  v56.super_class = (Class)CLHarvestDataTracks;
  v4 = [(CLHarvestDataTracks *)&v56 init];
  if (v4)
  {
    id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"LocationKey"];
    if (v5)
    {
      [v5 clientLocation];
    }
    else
    {
      long long v54 = 0u;
      memset(v55, 0, 28);
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
    }
    v45[6] = v53;
    v45[7] = v54;
    v46[0] = v55[0];
    *(_OWORD *)((char *)v46 + 12) = *(_OWORD *)((char *)v55 + 12);
    v45[2] = v49;
    v45[3] = v50;
    v45[4] = v51;
    v45[5] = v52;
    v45[0] = v47;
    v45[1] = v48;
    [(CLHarvestDataTracks *)v4 setLocation:v45];
    [a3 decodeFloatForKey:@"TripTimestampKey"];
    [(CLHarvestDataTracks *)v4 setTripTimestamp:v6];
    -[CLHarvestDataTracks setTripId:](v4, "setTripId:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TripIdKey"]);
    -[CLHarvestDataTracks setRat:](v4, "setRat:", [a3 decodeIntForKey:@"RatKey"]);
    -[CLHarvestDataTracks setMcc:](v4, "setMcc:", [a3 decodeIntForKey:@"MccKey"]);
    -[CLHarvestDataTracks setMnc:](v4, "setMnc:", [a3 decodeIntForKey:@"MncKey"]);
    -[CLHarvestDataTracks setContext:](v4, "setContext:", [a3 decodeIntForKey:@"ContextKey"]);
    -[CLHarvestDataTracks setBundleId:](v4, "setBundleId:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdKey"]);
    -[CLHarvestDataTracks setBundleIds:](v4, "setBundleIds:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdsKey"]);
    if ([a3 containsValueForKey:@"ModeIndicatorKey"]) {
      uint64_t v7 = (uint64_t)[a3 decodeIntForKey:@"ModeIndicatorKey"];
    }
    else {
      uint64_t v7 = 78;
    }
    [(CLHarvestDataTracks *)v4 setModeIndicator:v7];
    if ([a3 containsValueForKey:@"ActiveAccessoryKey"]) {
      -[CLHarvestDataTracks setActiveAccessory:](v4, "setActiveAccessory:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"ActiveAccessoryKey"]);
    }
    -[CLHarvestDataTracks setIsProactiveLocationSession:](v4, "setIsProactiveLocationSession:", [a3 decodeBoolForKey:@"IsProactiveLocationSessionKey"]);
    -[CLHarvestDataTracks setMotionVehicleConnectedStateChanged:](v4, "setMotionVehicleConnectedStateChanged:", [a3 decodeBoolForKey:@"MotionVehicleStateChangedKey"]);
    -[CLHarvestDataTracks setMotionVehicleConnected:](v4, "setMotionVehicleConnected:", [a3 decodeBoolForKey:@"MotionVehicleKey"]);
    id v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"RawMotionActivityKey"];
    if (v8)
    {
      [v8 activity];
    }
    else
    {
      uint64_t v44 = 0;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
    }
    v34[6] = v42;
    v34[7] = v43;
    uint64_t v35 = v44;
    v34[2] = v38;
    v34[3] = v39;
    v34[4] = v40;
    v34[5] = v41;
    v34[0] = v36;
    v34[1] = v37;
    [(CLHarvestDataTracks *)v4 setRawMotionActivity:v34];
    id v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"MotionActivityKey"];
    if (v9)
    {
      [v9 activity];
    }
    else
    {
      uint64_t v33 = 0;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
    }
    v23[6] = v31;
    v23[7] = v32;
    uint64_t v24 = v33;
    v23[2] = v27;
    v23[3] = v28;
    v23[4] = v29;
    v23[5] = v30;
    v23[0] = v25;
    v23[1] = v26;
    [(CLHarvestDataTracks *)v4 setMotionActivity:v23];
    id v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"DominantMotionActivityKey"];
    if (v10)
    {
      [v10 activity];
    }
    else
    {
      uint64_t v22 = 0;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
    }
    v12[6] = v20;
    v12[7] = v21;
    uint64_t v13 = v22;
    v12[2] = v16;
    v12[3] = v17;
    v12[4] = v18;
    v12[5] = v19;
    v12[0] = v14;
    v12[1] = v15;
    [(CLHarvestDataTracks *)v4 setDominantMotionActivity:v12];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = objc_alloc((Class)CLLocation);
  if (self)
  {
    [(CLHarvestDataTracks *)self location];
  }
  else
  {
    long long v27 = 0u;
    memset(v28, 0, 28);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
  }
  v29[6] = v26;
  v29[7] = v27;
  v30[0] = v28[0];
  *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)((char *)v28 + 12);
  v29[2] = v22;
  v29[3] = v23;
  v29[4] = v24;
  v29[5] = v25;
  v29[0] = v20;
  v29[1] = v21;
  id v6 = [v5 initWithClientLocation:v29];
  [a3 encodeObject:v6 forKey:@"LocationKey"];

  [(CLHarvestDataTracks *)self tripTimestamp];
  *(float *)&double v7 = v7;
  [a3 encodeFloat:@"TripTimestampKey" forKey:v7];
  [a3 encodeObject:-[CLHarvestDataTracks tripId](self, "tripId") forKey:@"TripIdKey"];
  [a3 encodeInt:-[CLHarvestDataTracks rat](self, "rat") forKey:@"RatKey"];
  [a3 encodeInt:-[CLHarvestDataTracks mcc](self, "mcc") forKey:@"MccKey"];
  [a3 encodeInt:-[CLHarvestDataTracks mnc](self, "mnc") forKey:@"MncKey"];
  [a3 encodeInt:-[CLHarvestDataTracks context](self, "context") forKey:@"ContextKey"];
  [a3 encodeObject:-[CLHarvestDataTracks bundleId](self, "bundleId") forKey:@"BundleIdKey"];
  [a3 encodeObject:-[CLHarvestDataTracks bundleIds](self, "bundleIds") forKey:@"BundleIdsKey"];
  [a3 encodeInt:-[CLHarvestDataTracks modeIndicator](self, "modeIndicator") forKey:@"ModeIndicatorKey"];
  [a3 encodeObject:-[CLHarvestDataTracks activeAccessory](self, "activeAccessory") forKey:@"ActiveAccessoryKey"];
  [a3 encodeBool:-[CLHarvestDataTracks isProactiveLocationSession](self, "isProactiveLocationSession") forKey:@"IsProactiveLocationSessionKey"];
  [a3 encodeBool:-[CLHarvestDataTracks motionVehicleConnectedStateChanged](self, "motionVehicleConnectedStateChanged") forKey:@"MotionVehicleStateChangedKey"];
  [a3 encodeBool:-[CLHarvestDataTracks motionVehicleConnected](self, "motionVehicleConnected") forKey:@"MotionVehicleKey"];
  id v8 = [CLHarvestDataMotionActivity alloc];
  if (self)
  {
    [(CLHarvestDataTracks *)self rawMotionActivity];
  }
  else
  {
    uint64_t v19 = 0;
    memset(v18, 0, sizeof(v18));
  }
  id v9 = [(CLHarvestDataMotionActivity *)v8 initWithMotionActivity:v18];
  [a3 encodeObject:v9 forKey:@"RawMotionActivityKey"];

  id v10 = [CLHarvestDataMotionActivity alloc];
  if (self)
  {
    [(CLHarvestDataTracks *)self motionActivity];
  }
  else
  {
    uint64_t v17 = 0;
    memset(v16, 0, sizeof(v16));
  }
  v11 = [(CLHarvestDataMotionActivity *)v10 initWithMotionActivity:v16];
  [a3 encodeObject:v11 forKey:@"MotionActivityKey"];

  v12 = [CLHarvestDataMotionActivity alloc];
  if (self)
  {
    [(CLHarvestDataTracks *)self dominantMotionActivity];
  }
  else
  {
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
  }
  uint64_t v13 = [(CLHarvestDataMotionActivity *)v12 initWithMotionActivity:v14];
  [a3 encodeObject:v13 forKey:@"DominantMotionActivityKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHarvestDataTracks)initWithTracksData:(HarvestData *)a3 andLocation:
{
  v4 = v3;
  v36.receiver = self;
  v36.super_class = (Class)CLHarvestDataTracks;
  id v6 = [(CLHarvestDataTracks *)&v36 init];
  double v7 = v6;
  if (v6)
  {
    long long v8 = v4[7];
    v34[6] = v4[6];
    v34[7] = v8;
    v35[0] = v4[8];
    *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)((char *)v4 + 140);
    long long v9 = v4[3];
    v34[2] = v4[2];
    v34[3] = v9;
    long long v10 = v4[5];
    v34[4] = v4[4];
    v34[5] = v10;
    long long v11 = v4[1];
    v34[0] = *v4;
    v34[1] = v11;
    [(CLHarvestDataTracks *)v6 setLocation:v34];
    [(CLHarvestDataTracks *)v7 setTripTimestamp:a3->var0];
    p_var1 = &a3->var1;
    if (*((char *)&a3->var1.__r_.__value_.var0.var1 + 23) < 0) {
      p_var1 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_var1->__r_.__value_.var0.var1.__data_;
    }
    [(CLHarvestDataTracks *)v7 setTripId:+[NSString stringWithUTF8String:p_var1]];
    [(CLHarvestDataTracks *)v7 setRat:a3->var1.__r_.var0];
    [(CLHarvestDataTracks *)v7 setMcc:*(unsigned int *)&a3->var1.__r_.var1];
    [(CLHarvestDataTracks *)v7 setMnc:LODWORD(a3->var1.var0)];
    [(CLHarvestDataTracks *)v7 setContext:HIDWORD(a3->var1.var0)];
    uint64_t v13 = a3 + 1;
    if (a3[1].var1.__r_.__value_.var0.var0.__data_[15] < 0) {
      uint64_t v13 = *(HarvestData **)&v13->var0;
    }
    [(CLHarvestDataTracks *)v7 setBundleId:+[NSString stringWithUTF8String:v13]];
    long long v14 = &a3[1].var1.__r_.__value_.var0.var1 + 1;
    if (SHIBYTE(a3[1].var1.var0) < 0) {
      long long v14 = (void *)*v14;
    }
    [(CLHarvestDataTracks *)v7 setBundleIds:+[NSString stringWithUTF8String:v14]];
    [(CLHarvestDataTracks *)v7 setIsProactiveLocationSession:BYTE4(a3[2].var0)];
    [(CLHarvestDataTracks *)v7 setMotionVehicleConnectedStateChanged:BYTE5(a3[2].var0)];
    [(CLHarvestDataTracks *)v7 setMotionVehicleConnected:BYTE6(a3[2].var0)];
    long long v15 = *(_OWORD *)&a3[3].var1.var0;
    long long v16 = *((_OWORD *)&a3[4].var1.__r_.__value_.var0.var1 + 1);
    v32[6] = *(_OWORD *)a3[4].var1.__r_.__value_.var0.var0.__data_;
    v32[7] = v16;
    int64_t var0 = a3[4].var1.var0;
    long long v17 = *((_OWORD *)&a3[2].var1.__r_.__value_.var0.var1 + 1);
    long long v18 = *(_OWORD *)a3[3].var1.__r_.__value_.var0.var0.__data_;
    v32[2] = *(_OWORD *)&a3[2].var1.var0;
    v32[3] = v18;
    v32[4] = *((_OWORD *)&a3[3].var1.__r_.__value_.var0.var1 + 1);
    v32[5] = v15;
    v32[0] = *(_OWORD *)a3[2].var1.__r_.__value_.var0.var0.__data_;
    v32[1] = v17;
    [(CLHarvestDataTracks *)v7 setRawMotionActivity:v32];
    long long v19 = *(_OWORD *)&a3[7].var1.__r_.__value_.var0.var1.__size_;
    v30[6] = *(_OWORD *)&a3[7].var0;
    v30[7] = v19;
    uint64_t v31 = *(void *)&a3[7].var1.__r_.var0;
    long long v20 = *(_OWORD *)&a3[6].var0;
    _OWORD v30[2] = *(_OWORD *)&a3[5].var1.__r_.var0;
    v30[3] = v20;
    long long v21 = *(_OWORD *)&a3[6].var1.__r_.var0;
    v30[4] = *(_OWORD *)&a3[6].var1.__r_.__value_.var0.var1.__size_;
    v30[5] = v21;
    long long v22 = *(_OWORD *)&a3[5].var1.__r_.__value_.var0.var1.__size_;
    v30[0] = *(_OWORD *)&a3[5].var0;
    v30[1] = v22;
    [(CLHarvestDataTracks *)v7 setMotionActivity:v30];
    long long v23 = *(_OWORD *)a3[10].var1.__r_.__value_.var0.var0.__data_;
    v28[6] = *(_OWORD *)&a3[9].var1.var0;
    v28[7] = v23;
    uint64_t v29 = *((void *)&a3[10].var1.__r_.__value_.var0.var1 + 2);
    long long v24 = *(_OWORD *)&a3[8].var1.var0;
    _OWORD v28[2] = *((_OWORD *)&a3[8].var1.__r_.__value_.var0.var1 + 1);
    v28[3] = v24;
    long long v25 = *((_OWORD *)&a3[9].var1.__r_.__value_.var0.var1 + 1);
    v28[4] = *(_OWORD *)a3[9].var1.__r_.__value_.var0.var0.__data_;
    v28[5] = v25;
    long long v26 = *(_OWORD *)a3[8].var1.__r_.__value_.var0.var0.__data_;
    v28[0] = *(_OWORD *)&a3[7].var1.var0;
    v28[1] = v26;
    [(CLHarvestDataTracks *)v7 setDominantMotionActivity:v28];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHarvestDataTracks;
  [(CLHarvestDataTracks *)&v3 dealloc];
}

- (id)jsonObject
{
  v16[0] = @"location";
  id v3 = objc_alloc((Class)CLLocation);
  if (self)
  {
    [(CLHarvestDataTracks *)self location];
  }
  else
  {
    long long v12 = 0u;
    memset(v13, 0, 28);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
  }
  v14[6] = v11;
  v14[7] = v12;
  v15[0] = v13[0];
  *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)((char *)v13 + 12);
  v14[2] = v7;
  v14[3] = v8;
  v14[4] = v9;
  v14[5] = v10;
  v14[0] = v5;
  v14[1] = v6;
  v17[0] = [v3 initWithClientLocation:v14, v5, v6, v7, v8, v9, v10, v11, v12, v13[0], *(void *)&v13[1], *((void *)&v13[1] + 1)].jsonObject;
  v16[1] = @"tripTimestamp";
  [(CLHarvestDataTracks *)self tripTimestamp];
  v17[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v16[2] = @"tripId";
  v17[2] = [(CLHarvestDataTracks *)self tripId];
  v16[3] = @"rat";
  v17[3] = +[NSNumber numberWithInt:[(CLHarvestDataTracks *)self rat]];
  v16[4] = @"mcc";
  v17[4] = +[NSNumber numberWithInt:[(CLHarvestDataTracks *)self mcc]];
  v16[5] = @"mnc";
  v17[5] = +[NSNumber numberWithInt:[(CLHarvestDataTracks *)self mnc]];
  v16[6] = @"context";
  v17[6] = +[NSNumber numberWithInt:[(CLHarvestDataTracks *)self context]];
  v16[7] = @"bundleId";
  v17[7] = [(CLHarvestDataTracks *)self bundleId];
  _OWORD v16[8] = @"bundleIds";
  v17[8] = [(CLHarvestDataTracks *)self bundleIds];
  v16[9] = @"modeIndicator";
  v17[9] = +[NSNumber numberWithUnsignedInt:[(CLHarvestDataTracks *)self modeIndicator]];
  v16[10] = @"isProactiveLocationSession";
  v17[10] = +[NSNumber numberWithBool:[(CLHarvestDataTracks *)self isProactiveLocationSession]];
  return +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:11];
}

- (id)description
{
  id v2 = [[objc_alloc((Class)NSString) initWithData:+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", -[CLHarvestDataTracks jsonObject](self, "jsonObject"), 0, 0) encoding:4];

  return v2;
}

- (CLDaemonLocation)location
{
  $AB5116BA7E623E054F959CECB034F4E7 v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self[3].course;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self[3].speed;
  retstr->rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self[3].timestamp;
  long long v4 = *(_OWORD *)&self[3].suitability;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self[2].ellipsoidalAltitude;
  *(_OWORD *)&retstr->speed = v4;
  long long v5 = *(_OWORD *)&self[3].altitude;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self[3].coordinate.longitude;
  *(_OWORD *)&retstr->timestamp = v5;
  long long v6 = *(_OWORD *)&self[2].referenceFrame;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self[2].rawCourse;
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)(&self[3].confidence + 1);
  return self;
}

- (void)setLocation:(CLDaemonLocation *)a3
{
  long long v3 = *(_OWORD *)&a3->coordinate.longitude;
  *(_OWORD *)&self->_location.suitability = *(_OWORD *)&a3->suitability;
  *(_OWORD *)&self->_location.coordinate.longitude = v3;
  long long v4 = *(_OWORD *)&a3->altitude;
  long long v5 = *(_OWORD *)&a3->speed;
  long long v6 = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)&self->_location.course = *(_OWORD *)&a3->course;
  *(_OWORD *)&self->_location.timestamp = v6;
  *(_OWORD *)&self->_location.altitude = v4;
  *(_OWORD *)&self->_location.speed = v5;
  long long v7 = *(_OWORD *)&a3->lifespan;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
  long long v9 = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)&self->_location.integrity = *(_OWORD *)&a3->integrity;
  self->_location.$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = rawCoordinate;
  *(_OWORD *)&self->_location.rawCourse = v9;
  *(_OWORD *)&self->_location.lifespan = v7;
}

- (double)tripTimestamp
{
  return self->_tripTimestamp;
}

- (void)setTripTimestamp:(double)a3
{
  self->_tripTimestamp = a3;
}

- (NSString)tripId
{
  return self->_tripId;
}

- (void)setTripId:(id)a3
{
}

- (int)rat
{
  return self->_rat;
}

- (void)setRat:(int)a3
{
  self->_rat = a3;
}

- (int)mcc
{
  return self->_mcc;
}

- (void)setMcc:(int)a3
{
  self->_mcc = a3;
}

- (int)mnc
{
  return self->_mnc;
}

- (void)setMnc:(int)a3
{
  self->_mnc = a3;
}

- (int)context
{
  return self->_context;
}

- (void)setContext:(int)a3
{
  self->_context = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
}

- (int)modeIndicator
{
  return self->_modeIndicator;
}

- (void)setModeIndicator:(int)a3
{
  self->_modeIndicator = a3;
}

- (CLPAccessoryMeta)activeAccessory
{
  return self->_activeAccessory;
}

- (void)setActiveAccessory:(id)a3
{
}

- (BOOL)isProactiveLocationSession
{
  return self->_isProactiveLocationSession;
}

- (void)setIsProactiveLocationSession:(BOOL)a3
{
  self->_isProactiveLocationSession = a3;
}

- (BOOL)motionVehicleConnectedStateChanged
{
  return self->_motionVehicleConnectedStateChanged;
}

- (void)setMotionVehicleConnectedStateChanged:(BOOL)a3
{
  self->_motionVehicleConnectedStateChanged = a3;
}

- (BOOL)motionVehicleConnected
{
  return self->_motionVehicleConnected;
}

- (void)setMotionVehicleConnected:(BOOL)a3
{
  self->_motionVehicleConnected = a3;
}

- (CLMotionActivity)rawMotionActivity
{
  long long v10 = *(_OWORD *)&self[1].fsmTransitionData.fConsecStatic;
  long long v11 = *(_OWORD *)&self[2].conservativeMountedProbability;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[2].source;
  *(_OWORD *)&retstr[1].isStanding = v11;
  *(double *)&retstr[1].isVehicleConnected = self[2].timestamp;
  long long v12 = *(_OWORD *)&self[1].source;
  long long v13 = *(_OWORD *)&self[1].timestamp;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self[1].conservativeMountedProbability;
  *(_OWORD *)&retstr->isVehicleConnected = v13;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[1].estExitTime;
  *(_OWORD *)&retstr[1].type = v10;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->fsmTransitionData.fConsecStatic;
  *(_OWORD *)&retstr->mountedConfidence = v12;
  return self;
}

- (void)setRawMotionActivity:(CLMotionActivity *)a3
{
  *(_OWORD *)&self->_rawMotionActivity.type = *(_OWORD *)&a3->type;
  long long v12 = *(_OWORD *)&a3->mountedConfidence;
  long long v13 = *(_OWORD *)&a3->isStanding;
  long long v14 = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_rawMotionActivity.vehicleType = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_rawMotionActivity.isVehicleConnected = v14;
  *(_OWORD *)&self->_rawMotionActivity.isStanding = v13;
  *(_OWORD *)&self->_rawMotionActivity.mountedConfidence = v12;
  long long v15 = *(_OWORD *)&a3[1].type;
  long long v16 = *(_OWORD *)&a3[1].mountedConfidence;
  long long v17 = *(_OWORD *)&a3[1].isStanding;
  *(void *)&self->_anon_98[48] = *(void *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_98[32] = v17;
  *(_OWORD *)&self->_anon_98[16] = v16;
  *(_OWORD *)self->_anon_98 = v15;
}

- (CLMotionActivity)motionActivity
{
  long long v10 = *(_OWORD *)&self[4].type;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[3].vehicleType;
  *(_OWORD *)&retstr[1].isStanding = v10;
  *(void *)&retstr[1].isVehicleConnected = *(void *)&self[4].mountedConfidence;
  long long v11 = *(_OWORD *)&self[3].mountedConfidence;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self[3].type;
  *(_OWORD *)&retstr->isVehicleConnected = v11;
  long long v12 = *(_OWORD *)&self[3].isVehicleConnected;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[3].isStanding;
  *(_OWORD *)&retstr[1].type = v12;
  long long v13 = *(_OWORD *)&self[2].vehicleType;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self[2].isVehicleConnected;
  *(_OWORD *)&retstr->mountedConfidence = v13;
  return self;
}

- (void)setMotionActivity:(CLMotionActivity *)a3
{
  *(_OWORD *)&self->_motionActivity.type = *(_OWORD *)&a3->type;
  long long v12 = *(_OWORD *)&a3->mountedConfidence;
  long long v13 = *(_OWORD *)&a3->isStanding;
  long long v14 = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_motionActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_motionActivity.vehicleType = v14;
  *(_OWORD *)&self->_motionActivity.mountedConfidence = v12;
  *(_OWORD *)&self->_motionActivity.isStanding = v13;
  long long v15 = *(_OWORD *)&a3[1].type;
  long long v16 = *(_OWORD *)&a3[1].mountedConfidence;
  long long v17 = *(_OWORD *)&a3[1].isStanding;
  *(void *)&self->_anon_120[48] = *(void *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_120[16] = v16;
  *(_OWORD *)&self->_anon_120[32] = v17;
  *(_OWORD *)self->_anon_120 = v15;
}

- (CLMotionActivity)dominantMotionActivity
{
  *(void *)&retstr[1].isVehicleConnected = *(void *)&self[5].fsmTransitionData.fConsecStatic;
  long long v10 = *(_OWORD *)&self[5].estExitTime;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[5].timestamp;
  *(_OWORD *)&retstr[1].isStanding = v10;
  long long v11 = *(_OWORD *)&self[4].fsmTransitionData.fConsecStatic;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self[4].estExitTime;
  *(_OWORD *)&retstr->isVehicleConnected = v11;
  long long v12 = *(_OWORD *)&self[5].conservativeMountedProbability;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[5].source;
  *(_OWORD *)&retstr[1].type = v12;
  long long v13 = *(_OWORD *)&self[4].timestamp;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self[4].conservativeMountedProbability;
  *(_OWORD *)&retstr->mountedConfidence = v13;
  return self;
}

- (void)setDominantMotionActivity:(CLMotionActivity *)a3
{
  *(_OWORD *)&self->_dominantMotionActivity.type = *(_OWORD *)&a3->type;
  long long v12 = *(_OWORD *)&a3->mountedConfidence;
  long long v13 = *(_OWORD *)&a3->isStanding;
  long long v14 = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_dominantMotionActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_dominantMotionActivity.vehicleType = v14;
  *(_OWORD *)&self->_dominantMotionActivity.mountedConfidence = v12;
  *(_OWORD *)&self->_dominantMotionActivity.isStanding = v13;
  long long v15 = *(_OWORD *)&a3[1].type;
  long long v16 = *(_OWORD *)&a3[1].mountedConfidence;
  long long v17 = *(_OWORD *)&a3[1].isStanding;
  *(void *)&self->_anon_1a8[48] = *(void *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_1a8[16] = v16;
  *(_OWORD *)&self->_anon_1a8[32] = v17;
  *(_OWORD *)self->_anon_1a8 = v15;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 120) = 0xFFFF;
  *(_OWORD *)((char *)self + 484) = 0u;
  __asm { FMOV            V2.2D, #-1.0 }
  *(_OWORD *)((char *)self + 500) = xmmword_101D1C320;
  *(_OWORD *)((char *)self + 516) = _Q2;
  *(_OWORD *)((char *)self + 532) = _Q2;
  *(_OWORD *)((char *)self + 548) = _Q2;
  *((_DWORD *)self + 141) = 0;
  *((void *)self + 71) = 0xBFF0000000000000;
  *((_OWORD *)self + 36) = 0u;
  *((_DWORD *)self + 148) = 0;
  *(void *)((char *)self + 596) = 0xBFF0000000000000;
  *((_DWORD *)self + 151) = 0x7FFFFFFF;
  *((void *)self + 76) = 0;
  *((void *)self + 78) = 0;
  *((void *)self + 77) = 0;
  *((unsigned char *)self + 632) = 0;
  return self;
}

@end