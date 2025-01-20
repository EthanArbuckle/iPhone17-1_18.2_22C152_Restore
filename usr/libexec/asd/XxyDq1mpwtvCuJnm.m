@interface XxyDq1mpwtvCuJnm
+ (id)sharedInstance;
+ (void)x7PkBasAKbApbiZS:(_KUwyEjpVZR65eUyl *)a3;
- (BOOL)LjU00AjDrcTJbVJD;
- (BOOL)SNfHoVX7xML3tdWp;
- (BOOL)jRTN5Tg2R7nMgayq;
- (CLLocationManager)N8Azi3NI6QrNPsLP;
- (CLLocationSourceInformation)vCWRguBEmim3giZ9;
- (NSDate)LUsBOf3PLbri6v6o;
- (NSNumber)kp3LsdVLlXwFNqJV;
- (NSNumber)yABQBiEYyLNkt6IY;
- (XxyDq1mpwtvCuJnm)init;
- (double)Msur5CGmk1XEBjLD;
- (double)zDlKxUFITTJsP8iN;
- (int)YGGzx6XAo42A7s6x;
- (void)UupMWO2j2nYek7xf:(id)a3 exi2C8VfynTXu5cU:(_KUwyEjpVZR65eUyl *)a4 TYPlhTGwKuAdWgfx:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
- (void)initLocationManager:(id)a3 dko5Pwm7el1Ulopu:(double)a4;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setJRTN5Tg2R7nMgayq:(BOOL)a3;
- (void)setKp3LsdVLlXwFNqJV:(id)a3;
- (void)setLUsBOf3PLbri6v6o:(id)a3;
- (void)setMsur5CGmk1XEBjLD:(double)a3;
- (void)setN8Azi3NI6QrNPsLP:(id)a3;
- (void)setVCWRguBEmim3giZ9:(id)a3;
- (void)setYABQBiEYyLNkt6IY:(id)a3;
- (void)setYGGzx6XAo42A7s6x:(int)a3;
- (void)setZDlKxUFITTJsP8iN:(double)a3;
@end

@implementation XxyDq1mpwtvCuJnm

+ (void)x7PkBasAKbApbiZS:(_KUwyEjpVZR65eUyl *)a3
{
  v4 = dispatch_queue_create("com.apple.asd.clpw", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011B38;
  block[3] = &unk_10065ED90;
  block[4] = a3;
  dispatch_async(v4, block);
}

+ (id)sharedInstance
{
  if (!qword_1006A5D48)
  {
    if (+[NSThread isMainThread])
    {
      uint64_t v2 = objc_opt_new();
      v3 = (void *)qword_1006A5D48;
      qword_1006A5D48 = v2;
    }
    else
    {
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_10065EEF0);
    }
  }
  v4 = (void *)qword_1006A5D48;

  return v4;
}

- (XxyDq1mpwtvCuJnm)init
{
  v5.receiver = self;
  v5.super_class = (Class)XxyDq1mpwtvCuJnm;
  uint64_t v2 = [(XxyDq1mpwtvCuJnm *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(XxyDq1mpwtvCuJnm *)v2 setYABQBiEYyLNkt6IY:0];
    [(XxyDq1mpwtvCuJnm *)v3 setKp3LsdVLlXwFNqJV:0];
    [(XxyDq1mpwtvCuJnm *)v3 setZDlKxUFITTJsP8iN:-1.0];
    [(XxyDq1mpwtvCuJnm *)v3 setVCWRguBEmim3giZ9:0];
  }
  return v3;
}

- (BOOL)LjU00AjDrcTJbVJD
{
  return self->_jRTN5Tg2R7nMgayq;
}

- (BOOL)SNfHoVX7xML3tdWp
{
  return self->_YGGzx6XAo42A7s6x < 3u;
}

- (void)UupMWO2j2nYek7xf:(id)a3 exi2C8VfynTXu5cU:(_KUwyEjpVZR65eUyl *)a4 TYPlhTGwKuAdWgfx:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v92 = 0;
  v13 = +[NSDate date];
  *(CLLocationAccuracy *)v93 = kCLLocationAccuracyBestForNavigation;
  *(CLLocationAccuracy *)&v93[1] = kCLLocationAccuracyBest;
  *(CLLocationAccuracy *)&v93[2] = kCLLocationAccuracyNearestTenMeters;
  *(CLLocationAccuracy *)&v93[3] = kCLLocationAccuracyHundredMeters;
  *(CLLocationAccuracy *)&v93[4] = kCLLocationAccuracyKilometer;
  *(CLLocationAccuracy *)&v93[5] = kCLLocationAccuracyThreeKilometers;
  v14 = self->_yABQBiEYyLNkt6IY;
  p_kp3LsdVLlXwFNqJV = &self->_kp3LsdVLlXwFNqJV;
  location = (id *)&self->_vCWRguBEmim3giZ9;
  v91 = self->_kp3LsdVLlXwFNqJV;
  double zDlKxUFITTJsP8iN = self->_zDlKxUFITTJsP8iN;
  v17 = self->_vCWRguBEmim3giZ9;
  v18 = v17;
  if (a4->var0 == 4)
  {
    v89 = (void (**)(void, void))v10;
    unsigned int var1 = a4->var1;
    if (var1 == 5)
    {
      v87 = v14;
      v88 = v17;
      +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:a4->var4.var0.var0 gsx0MJUoOpcxcozG:a4->var4.var1.var0.var1];
      v85 = id v84 = v12;
      *(void *)&self->_double Msur5CGmk1XEBjLD = v93[a4->var4.var5.var2];
      v26 = [v11 i4KDOQicW9Xd5WBz];
      v27 = +[Yp00msaYdVlZesvU eJSthhES04gLkDjz:&a4->var4.var15.var2.var1 i4KDOQicW9Xd5WBz:v26 TWWnmIjkBlMfHmma:v12 eZh1LWn1FH2uQtPX:&v92];

      double v22 = 0.0;
      if (!v92)
      {
        [v27 doubleValue];
        double v22 = v28 * 0.001;
      }
      id v83 = v11;
      v29 = [v11 i4KDOQicW9Xd5WBz:a4];
      v30 = +[Yp00msaYdVlZesvU eJSthhES04gLkDjz:(char *)&a4->var4.var26 + 168 i4KDOQicW9Xd5WBz:v29 TWWnmIjkBlMfHmma:v12 eZh1LWn1FH2uQtPX:&v92];

      if (v92)
      {

        v30 = &off_1006881A8;
      }
      v24 = &objc_autorelease_ptr;
      [v30 doubleValue];
      double var4 = v31;

      double Msur5CGmk1XEBjLD = self->_Msur5CGmk1XEBjLD;
      uint64_t v20 = v85;
    }
    else
    {
      if (var1 != 4)
      {
        v25 = (void (**)(void, void))v10;
        (*((void (**)(id, void))v10 + 2))(v10, 0);
        goto LABEL_58;
      }
      v87 = v14;
      v88 = v17;
      id v83 = v11;
      id v84 = v12;
      uint64_t v20 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:a4->var4.var0.var0 gsx0MJUoOpcxcozG:a4->var4.var1.var0.var1];
      double Msur5CGmk1XEBjLD = *(double *)&v93[a4->var4.var5.var2];
      self->_double Msur5CGmk1XEBjLD = Msur5CGmk1XEBjLD;
      v81 = a4;
      double v22 = (double)a4->var4.var5.var3 * 0.001;
      double var4 = (double)a4->var4.var5.var4;
      v24 = &objc_autorelease_ptr;
    }
    v86 = (void *)v20;
    -[XxyDq1mpwtvCuJnm initLocationManager:dko5Pwm7el1Ulopu:](self, "initLocationManager:dko5Pwm7el1Ulopu:", v20, Msur5CGmk1XEBjLD, v81);
    double v32 = -v22;
    do
    {
      v33 = +[NSRunLoop currentRunLoop];
      v34 = [v24[491] dateWithTimeIntervalSinceNow:0.003];
      [v33 runUntilDate:v34];

      [v13 timeIntervalSinceNow];
      double v36 = v35;
    }
    while (![(XxyDq1mpwtvCuJnm *)self LjU00AjDrcTJbVJD] && v36 > v32);
    int YGGzx6XAo42A7s6x = self->_YGGzx6XAo42A7s6x;
    v25 = v89;
    if (YGGzx6XAo42A7s6x > 2)
    {
      [(NSDate *)self->_LUsBOf3PLbri6v6o timeIntervalSinceNow];
      double v44 = var4 * -0.001;
      yABQBiEYyLNkt6IY = self->_yABQBiEYyLNkt6IY;
      BOOL v47 = v46 < v44 || yABQBiEYyLNkt6IY == 0;
      if (v47 || !*p_kp3LsdVLlXwFNqJV || self->_Msur5CGmk1XEBjLD < self->_zDlKxUFITTJsP8iN)
      {
        self->_yABQBiEYyLNkt6IY = 0;

        kp3LsdVLlXwFNqJV = self->_kp3LsdVLlXwFNqJV;
        self->_kp3LsdVLlXwFNqJV = 0;

        vCWRguBEmim3giZ9 = self->_vCWRguBEmim3giZ9;
        self->_vCWRguBEmim3giZ9 = 0;

        v50 = [(XxyDq1mpwtvCuJnm *)self N8Azi3NI6QrNPsLP];
        [v50 startUpdatingLocation];
      }
      do
      {
        [v13 timeIntervalSinceNow];
        double v36 = v51;
        if (self->_yABQBiEYyLNkt6IY && *p_kp3LsdVLlXwFNqJV
          || (double v52 = self->_zDlKxUFITTJsP8iN, v52 >= 0.0) && v52 <= self->_Msur5CGmk1XEBjLD)
        {
          BOOL v55 = 0;
        }
        else
        {
          LUsBOf3PLbri6v6o = self->_LUsBOf3PLbri6v6o;
          if (LUsBOf3PLbri6v6o)
          {
            [(NSDate *)LUsBOf3PLbri6v6o timeIntervalSinceNow];
            BOOL v55 = v54 < v44;
          }
          else
          {
            BOOL v55 = 1;
          }
        }
        unsigned __int8 v56 = [(XxyDq1mpwtvCuJnm *)self SNfHoVX7xML3tdWp];
        v57 = +[NSRunLoop currentRunLoop];
        v58 = [v24[491] dateWithTimeIntervalSinceNow:0.003];
        [v57 runUntilDate:v58];

        v24 = &objc_autorelease_ptr;
      }
      while ((v56 & 1) == 0 && v55 && v36 > v32);
      v59 = [(XxyDq1mpwtvCuJnm *)self N8Azi3NI6QrNPsLP];
      [v59 stopUpdatingLocation];

      v60 = self->_yABQBiEYyLNkt6IY;
      if (v60 && *p_kp3LsdVLlXwFNqJV)
      {
        v61 = v60;

        v62 = self->_kp3LsdVLlXwFNqJV;
        double zDlKxUFITTJsP8iN = self->_zDlKxUFITTJsP8iN;
        v63 = self->_vCWRguBEmim3giZ9;

        if (zDlKxUFITTJsP8iN > self->_Msur5CGmk1XEBjLD) {
          uint64_t v38 = 139007;
        }
        else {
          uint64_t v38 = 0;
        }
        v25 = v89;
      }
      else
      {
        v63 = v88;
        v25 = v89;
        v61 = v87;
        v62 = v91;
        if (v87 && v91)
        {
          uint64_t v38 = 139006;
        }
        else
        {
          self->_double zDlKxUFITTJsP8iN = 0.0;
          uint64_t v38 = 139002;
        }
      }
      [(NSNumber *)v61 doubleValue];
      double v65 = v64 * 1000000.0;
      [(NSNumber *)v62 doubleValue];
      double v67 = v66 * 1000000.0;
      v87 = v61;
      objc_storeStrong((id *)&self->_yABQBiEYyLNkt6IY, v61);
      v91 = v62;
      objc_storeStrong((id *)&self->_kp3LsdVLlXwFNqJV, v62);
      self->_double zDlKxUFITTJsP8iN = zDlKxUFITTJsP8iN;
      v88 = v63;
      objc_storeStrong(location, v63);
      uint64_t v43 = (uint64_t)v65;
      uint64_t v42 = (uint64_t)v67;
    }
    else
    {
      if (YGGzx6XAo42A7s6x >= 3) {
        uint64_t v38 = 139000;
      }
      else {
        uint64_t v38 = (YGGzx6XAo42A7s6x + 139003);
      }
      self->_double zDlKxUFITTJsP8iN = 0.0;
      v39 = self->_yABQBiEYyLNkt6IY;
      self->_yABQBiEYyLNkt6IY = 0;

      v40 = self->_kp3LsdVLlXwFNqJV;
      self->_kp3LsdVLlXwFNqJV = 0;

      v41 = self->_vCWRguBEmim3giZ9;
      self->_vCWRguBEmim3giZ9 = 0;

      uint64_t v42 = 0;
      uint64_t v43 = 0;
    }
    id v68 = objc_alloc_init((Class)NSMutableArray);
    id v69 = objc_alloc_init((Class)NSMutableDictionary);
    v70 = +[NSNumber numberWithInt:v38];
    [v69 setObject:v70 forKeyedSubscript:@"ec"];

    v71 = +[NSNumber numberWithInteger:v43];
    [v69 setObject:v71 forKeyedSubscript:@"mlat"];

    v72 = +[NSNumber numberWithInteger:v42];
    [v69 setObject:v72 forKeyedSubscript:@"mlon"];

    if (*(_DWORD *)(v82 + 4) >= 3u)
    {
      v73 = +[NSNumber numberWithDouble:zDlKxUFITTJsP8iN];
      [v69 setObject:v73 forKeyedSubscript:@"ha"];

      v74 = +[NSNumber numberWithDouble:0.0 - v36];
      [v69 setObject:v74 forKeyedSubscript:@"time"];

      if (*(_DWORD *)(v82 + 4) >= 4u)
      {
        v75 = self->_LUsBOf3PLbri6v6o;
        if (v75)
        {
          v76 = v75;
        }
        else
        {
          v76 = +[NSDate date];
        }
        v77 = v76;
        [v69 setObject:v76 forKeyedSubscript:@"lt"];
        if (*location)
        {
          v78 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*location isSimulatedBySoftware]);
          [v69 setObject:v78 forKeyedSubscript:@"sim"];

          v79 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*location isProducedByAccessory]);
          [v69 setObject:v79 forKeyedSubscript:@"acc"];
        }
      }
    }
    v80 = +[NSDictionary dictionaryWithDictionary:v69];
    [v68 addObject:v80];

    ((void (**)(void, id))v25)[2](v25, v68);
    id v11 = v83;
    id v12 = v84;
    v14 = v87;
    v18 = v88;
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
    v25 = (void (**)(void, void))v10;
  }
LABEL_58:
}

- (void)initLocationManager:(id)a3 dko5Pwm7el1Ulopu:(double)a4
{
  id v6 = a3;
  if (+[NSThread isMainThread])
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    self->_int YGGzx6XAo42A7s6x = 0;
    self->_jRTN5Tg2R7nMgayq = 0;
    v7 = +[NSBundle bundleWithPath:v6];
    id v8 = [objc_alloc((Class)CLLocationManager) initWithEffectiveBundle:v7];
    [(XxyDq1mpwtvCuJnm *)self setN8Azi3NI6QrNPsLP:v8];

    v9 = [(XxyDq1mpwtvCuJnm *)self N8Azi3NI6QrNPsLP];
    [v9 setDelegate:self];

    id v10 = [(XxyDq1mpwtvCuJnm *)self N8Azi3NI6QrNPsLP];
    [v10 setDesiredAccuracy:a4];

    id v11 = [(XxyDq1mpwtvCuJnm *)self N8Azi3NI6QrNPsLP];
    [v11 setDistanceFilter:kCLLocationAccuracyKilometer];

    if ([(XxyDq1mpwtvCuJnm *)self LjU00AjDrcTJbVJD]
      && ![(XxyDq1mpwtvCuJnm *)self SNfHoVX7xML3tdWp])
    {
      id v12 = [(XxyDq1mpwtvCuJnm *)self N8Azi3NI6QrNPsLP];
      [v12 startUpdatingLocation];
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012880;
    block[3] = &unk_10065EF18;
    block[4] = self;
    id v14 = v6;
    double v15 = a4;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v5 = objc_msgSend(a4, "reverseObjectEnumerator", a3, 0);
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        if (!self->_LUsBOf3PLbri6v6o
          || ([*(id *)(*((void *)&v23 + 1) + 8 * (void)v9) timestamp],
              id v11 = (NSDate *)objc_claimAutoreleasedReturnValue(),
              id v12 = self->_LUsBOf3PLbri6v6o,
              v11,
              v11 > v12))
        {
          [v10 coordinate];
          +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          yABQBiEYyLNkt6IY = self->_yABQBiEYyLNkt6IY;
          self->_yABQBiEYyLNkt6IY = v13;

          [v10 coordinate];
          v16 = +[NSNumber numberWithDouble:v15];
          kp3LsdVLlXwFNqJV = self->_kp3LsdVLlXwFNqJV;
          self->_kp3LsdVLlXwFNqJV = v16;

          [v10 horizontalAccuracy];
          self->_double zDlKxUFITTJsP8iN = v18;
          v19 = [v10 timestamp];
          LUsBOf3PLbri6v6o = self->_LUsBOf3PLbri6v6o;
          self->_LUsBOf3PLbri6v6o = v19;

          v21 = [v10 sourceInformation];
          vCWRguBEmim3giZ9 = self->_vCWRguBEmim3giZ9;
          self->_vCWRguBEmim3giZ9 = v21;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  yABQBiEYyLNkt6IY = self->_yABQBiEYyLNkt6IY;
  self->_yABQBiEYyLNkt6IY = 0;

  kp3LsdVLlXwFNqJV = self->_kp3LsdVLlXwFNqJV;
  self->_kp3LsdVLlXwFNqJV = 0;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  self->_int YGGzx6XAo42A7s6x = a4;
  self->_jRTN5Tg2R7nMgayq = 1;
}

- (CLLocationManager)N8Azi3NI6QrNPsLP
{
  return (CLLocationManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setN8Azi3NI6QrNPsLP:(id)a3
{
}

- (int)YGGzx6XAo42A7s6x
{
  return self->_YGGzx6XAo42A7s6x;
}

- (void)setYGGzx6XAo42A7s6x:(int)a3
{
  self->_int YGGzx6XAo42A7s6x = a3;
}

- (BOOL)jRTN5Tg2R7nMgayq
{
  return self->_jRTN5Tg2R7nMgayq;
}

- (void)setJRTN5Tg2R7nMgayq:(BOOL)a3
{
  self->_jRTN5Tg2R7nMgayq = a3;
}

- (NSNumber)yABQBiEYyLNkt6IY
{
  return self->_yABQBiEYyLNkt6IY;
}

- (void)setYABQBiEYyLNkt6IY:(id)a3
{
}

- (NSNumber)kp3LsdVLlXwFNqJV
{
  return self->_kp3LsdVLlXwFNqJV;
}

- (void)setKp3LsdVLlXwFNqJV:(id)a3
{
}

- (double)Msur5CGmk1XEBjLD
{
  return self->_Msur5CGmk1XEBjLD;
}

- (void)setMsur5CGmk1XEBjLD:(double)a3
{
  self->_double Msur5CGmk1XEBjLD = a3;
}

- (double)zDlKxUFITTJsP8iN
{
  return self->_zDlKxUFITTJsP8iN;
}

- (void)setZDlKxUFITTJsP8iN:(double)a3
{
  self->_double zDlKxUFITTJsP8iN = a3;
}

- (NSDate)LUsBOf3PLbri6v6o
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLUsBOf3PLbri6v6o:(id)a3
{
}

- (CLLocationSourceInformation)vCWRguBEmim3giZ9
{
  return (CLLocationSourceInformation *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVCWRguBEmim3giZ9:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vCWRguBEmim3giZ9, 0);
  objc_storeStrong((id *)&self->_LUsBOf3PLbri6v6o, 0);
  objc_storeStrong((id *)&self->_kp3LsdVLlXwFNqJV, 0);
  objc_storeStrong((id *)&self->_yABQBiEYyLNkt6IY, 0);

  objc_storeStrong((id *)&self->_N8Azi3NI6QrNPsLP, 0);
}

@end