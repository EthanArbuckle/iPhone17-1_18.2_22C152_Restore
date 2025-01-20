@interface TMTimeSynthesizer
+ (BOOL)supportsSecureCoding;
+ (id)newSynthesizerFromDataRepresentation:(id)a3;
- (BOOL)intersects:(id)a3;
- (BOOL)isRunning;
- (NSString)lastInputSource;
- (NSString)name;
- (TMTime)lastQualityTime;
- (TMTimeSynthesizer)initWithClockAccuracy:(double)a3 noiseDensity:(double)a4 name:(id)a5;
- (TMTimeSynthesizer)initWithCoder:(id)a3;
- (double)rtcWhenBeyondUncertainty:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)synthesizedTimeAtLastRTC;
- (id)timeAtRtc:(double)a3;
- (void)dealloc;
- (void)displayLastQualityTime;
- (void)encodeWithCoder:(id)a3;
- (void)inflateHistoricalDataBy:(double)a3;
- (void)reset;
- (void)setLastInputSource:(id)a3;
- (void)setLastQualityTime:(id)a3;
- (void)setName:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)update:(id)a3 withError:(id *)a4;
@end

@implementation TMTimeSynthesizer

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithClockAccuracy:-[TMTimeSynthesizer name](self, "name") noiseDensity:self->_xoAccuracy name:self->_clkSg];
  [v4 setRunning:-[TMTimeSynthesizer isRunning](self, "isRunning")];
  *((void *)v4 + 1) = *(void *)&self->_rtc;
  *((void *)v4 + 2) = *(void *)&self->_utc;
  *((void *)v4 + 3) = *(void *)&self->_rateSf;
  *((void *)v4 + 6) = *(void *)&self->_utc_var;
  *((void *)v4 + 7) = *(void *)&self->_sf_var;
  *((void *)v4 + 8) = *(void *)&self->_utc_sf_cov;
  *((void *)v4 + 4) = *(void *)&self->_smoothedSf;
  *((_DWORD *)v4 + 26) = self->_measNumber;
  [v4 setLastQualityTime:-[TMTimeSynthesizer lastQualityTime](self, "lastQualityTime")];
  [v4 setLastInputSource:[-[TMTimeSynthesizer lastInputSource](self, "lastInputSource")];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:-[TMTimeSynthesizer name](self, "name") forKey:@"name"];
  [a3 encodeBool:-[TMTimeSynthesizer isRunning](self, "isRunning") forKey:@"running"];
  [a3 encodeDouble:@"rtc" forKey:self->_rtc];
  [a3 encodeDouble:@"utc" forKey:self->_utc];
  [a3 encodeDouble:@"rateSf" forKey:self->_rateSf];
  [a3 encodeDouble:@"utc_var" forKey:self->_utc_var];
  [a3 encodeDouble:@"sf_var" forKey:self->_sf_var];
  [a3 encodeDouble:@"utc_sf_cov" forKey:self->_utc_sf_cov];
  [a3 encodeDouble:@"xoAccuracy" forKey:self->_xoAccuracy];
  [a3 encodeDouble:@"clkSg" forKey:self->_clkSg];
  [a3 encodeDouble:@"smoothedSf" forKey:self->_smoothedSf];
  [a3 encodeInt:self->_measNumber forKey:@"measNumber"];
  [a3 encodeObject:-[TMTimeSynthesizer lastQualityTime](self, "lastQualityTime") forKey:@"lastQualityTime"];
  v5 = [(TMTimeSynthesizer *)self lastInputSource];

  [a3 encodeObject:v5 forKey:@"lastInputSource"];
}

- (TMTimeSynthesizer)initWithCoder:(id)a3
{
  id v4 = [(TMTimeSynthesizer *)self init];
  if (v4)
  {
    -[TMTimeSynthesizer setName:](v4, "setName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"]);
    -[TMTimeSynthesizer setRunning:](v4, "setRunning:", [a3 decodeBoolForKey:@"running"]);
    [a3 decodeDoubleForKey:@"rtc"];
    v4->_rtc = v5;
    [a3 decodeDoubleForKey:@"utc"];
    v4->_utc = v6;
    [a3 decodeDoubleForKey:@"rateSf"];
    v4->_rateSf = v7;
    [a3 decodeDoubleForKey:@"utc_var"];
    v4->_utc_var = v8;
    [a3 decodeDoubleForKey:@"sf_var"];
    v4->_sf_var = v9;
    [a3 decodeDoubleForKey:@"utc_sf_cov"];
    v4->_utc_sf_cov = v10;
    [a3 decodeDoubleForKey:@"xoAccuracy"];
    v4->_xoAccuracy = v11;
    [a3 decodeDoubleForKey:@"clkSg"];
    v4->_clkSg = v12;
    [a3 decodeDoubleForKey:@"smoothedSf"];
    v4->_smoothedSf = v13;
    v4->_measNumber = [a3 decodeIntForKey:@"measNumber"];
    -[TMTimeSynthesizer setLastQualityTime:](v4, "setLastQualityTime:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"lastQualityTime"]);
    -[TMTimeSynthesizer setLastInputSource:](v4, "setLastInputSource:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"lastInputSource"]);
    [(TMTimeSynthesizer *)v4 displayLastQualityTime];
    v4->_lastRtcForSmoothSf = 0.0;
  }
  return v4;
}

+ (id)newSynthesizerFromDataRepresentation:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, a1, @"TMTimeSynthesizer+Caching.m", 92, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  uint64_t v9 = 0;
  id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:a3 error:&v9];
  uint64_t v5 = v9;
  if (v9)
  {
    double v6 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B644(v5, v6);
    }
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
  [v4 finishDecoding];

  return v7;
}

- (id)dataRepresentation
{
  uint64_t v6 = 0;
  v2 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  uint64_t v3 = v6;
  if (v6)
  {
    id v4 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B6BC(v3, v4);
    }
  }
  return v2;
}

- (BOOL)intersects:(id)a3
{
  id v4 = [(TMTimeSynthesizer *)self synthesizedTimeAtLastRTC];
  [a3 rtc_s];
  [v4 propagatedTimeAtRTC:];
  double v6 = v5;
  [v4 utcUnc_s];
  double v8 = v7;
  [a3 rtc_s];
  double v10 = v9;
  [v4 rtc_s];
  double v12 = sub_1000064FC(v8, vabdd_f64(v10, v11));
  [a3 utc_s];
  double v14 = v13;
  [a3 utcUnc_s];
  double v16 = v15;
  [a3 source];
  if (v12 <= 0.0 || v16 <= 0.0) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"BOOL _timesIntersect(CFAbsoluteTime, CFTimeInterval, NSString *, CFAbsoluteTime, CFTimeInterval)"] file:@"TMTimeSynthesizer+Clamping.m" lineNumber:16 description:@"Negative uncertainty"];
  }
  BOOL v17 = v6 + v12 - (v14 - v16) >= 0.0 && v14 + v16 - (v6 - v12) >= 0.0;
  if (!v17) {
    AnalyticsSendEventLazy();
  }
  return v17;
}

- (void)inflateHistoricalDataBy:(double)a3
{
  double v5 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    double utc_var = self->_utc_var;
    double utc_sf_cov = self->_utc_sf_cov;
    int v12 = 138413058;
    double v13 = name;
    __int16 v14 = 2048;
    double v15 = a3;
    __int16 v16 = 2048;
    double v17 = utc_var;
    __int16 v18 = 2048;
    double v19 = utc_sf_cov;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@,Inflate,inflation_s,%lf,utcVar,%lf,sfCovar,%lf", (uint8_t *)&v12, 0x2Au);
  }
  if (a3 != 0.0)
  {
    double v9 = [(TMTimeSynthesizer *)self lastQualityTime];
    double v10 = v9;
    if (v9)
    {
      [(TMTime *)v9 utcUnc_s];
      [(TMTime *)v10 setUtcUnc_s:v11 + a3];
    }

    self->_double utc_var = self->_utc_var + a3 * (a3 + sqrt(self->_utc_var) * 2.0);
    self->_double utc_sf_cov = 0.0;
  }
}

- (void)dealloc
{
  [(TMTimeSynthesizer *)self setName:0];
  [(TMTimeSynthesizer *)self setLastQualityTime:0];
  [(TMTimeSynthesizer *)self setLastInputSource:0];
  v3.receiver = self;
  v3.super_class = (Class)TMTimeSynthesizer;
  [(TMTimeSynthesizer *)&v3 dealloc];
}

- (TMTimeSynthesizer)initWithClockAccuracy:(double)a3 noiseDensity:(double)a4 name:(id)a5
{
  double v8 = [(TMTimeSynthesizer *)self init];
  double v9 = v8;
  if (v8)
  {
    [(TMTimeSynthesizer *)v8 reset];
    v9->_clkSg = a4;
    v9->_xoAccuracy = a3;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v9->_rateSf = _Q0;
    v9->_lastRtcForSmoothSf = 0.0;
    [(TMTimeSynthesizer *)v9 setName:a5];
    v9->_lastInputSource = 0;
    [(TMTimeSynthesizer *)v9 displayLastQualityTime];
  }
  return v9;
}

- (void)displayLastQualityTime
{
  objc_super v3 = [(TMTimeSynthesizer *)self lastQualityTime];
  uint64_t v4 = qword_100033900;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      name = self->_name;
      double v7 = [(TMTime *)v3 source];
      [(TMTime *)v3 rtc_s];
      uint64_t v9 = v8;
      [(TMTime *)v3 utc_s];
      uint64_t v11 = v10;
      [(TMTime *)v3 utcUnc_s];
      int v17 = 138413314;
      __int16 v18 = name;
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      double v13 = "%@,lastQualityTime,Src,%@,Rtc,%.6lf,Utc,%.6lf,Unc,%.6lf";
      __int16 v14 = v4;
      uint32_t v15 = 52;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, v15);
    }
  }
  else if (v5)
  {
    __int16 v16 = self->_name;
    int v17 = 138412290;
    __int16 v18 = v16;
    double v13 = "%@,lastQualityTime,Empty";
    __int16 v14 = v4;
    uint32_t v15 = 12;
    goto LABEL_6;
  }
}

- (id)timeAtRtc:(double)a3
{
  BOOL v5 = sub_1000168CC((uint64_t)self, a3);
  if (v5)
  {
    double v6 = v5;
    double v7 = a3 - self->_rtc;
    [(TMTimeSynthesizerStates *)v5 utc];
    double v9 = v8 - self->_utc;
    if (v7 <= v9) {
      double v10 = v9 - v7;
    }
    else {
      double v10 = v7 - v9;
    }
    uint64_t v11 = sub_1000168CC((uint64_t)self, self->_rtc);
    BOOL v12 = v7 >= 0.0 && v10 <= 1.0;
    if (!v12 || ([(TMTimeSynthesizerStates *)v6 utc_var], v10 > sqrt(v13) * 50.0))
    {
      __int16 v14 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        double lastTimeRtc = self->_lastTimeRtc;
        double rtc = self->_rtc;
        int v24 = 138414082;
        __int16 v25 = name;
        __int16 v26 = 2112;
        v27 = v11;
        __int16 v28 = 2112;
        v29 = v6;
        __int16 v30 = 2048;
        double v31 = v7;
        __int16 v32 = 2048;
        double v33 = v9;
        __int16 v34 = 2048;
        double v35 = v10;
        __int16 v36 = 2048;
        double v37 = lastTimeRtc;
        __int16 v38 = 2048;
        double v39 = rtc;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@,WrongPredictState,Current,%@,PredictState,%@,dRtc,%.3lf,dUtc,%.3lf,ddtc,%.3lf,lastRtc,%.3lf,rtc,%.3lf", (uint8_t *)&v24, 0x52u);
      }
    }
    __int16 v18 = objc_alloc_init(TMTime);
    [(TMTimeSynthesizerStates *)v6 rtc];
    -[TMTime setRtc_s:](v18, "setRtc_s:");
    [(TMTimeSynthesizerStates *)v6 utc];
    -[TMTime setUtc_s:](v18, "setUtc_s:");
    [(TMTimeSynthesizerStates *)v6 utc_var];
    [(TMTime *)v18 setUtcUnc_s:sqrt(v19)];
    [(TMTimeSynthesizerStates *)v6 rateSf];
    -[TMTime setSf:](v18, "setSf:");
    [(TMTimeSynthesizerStates *)v6 sf_var];
    [(TMTime *)v18 setSfUnc:sqrt(v20)];
    [(TMTime *)v18 setSynthesized:1];
    [(TMTime *)v18 setSource:@"TMTimeSynthesizer"];
    [(TMTime *)v18 setReliability:sub_1000163D4(self, v18)];
  }
  else
  {
    __int16 v21 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = self->_name;
      int v24 = 138412290;
      __int16 v25 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@, Filter Not Available for timeAtRtc", (uint8_t *)&v24, 0xCu);
    }
    return 0;
  }
  return v18;
}

- (id)synthesizedTimeAtLastRTC
{
  if (self->_running) {
    return [(TMTimeSynthesizer *)self timeAtRtc:self->_lastTimeRtc];
  }
  else {
    return 0;
  }
}

- (double)rtcWhenBeyondUncertainty:(double)a3
{
  if (self->_running && (double utc_var = self->_utc_var, a3 * a3 >= utc_var) && !self->_needTimeNow && self->_measNumber > 3)
  {
    double v5 = (self->_sf_var + self->_clkSg * 10800.0 / 3.0) * 1.0e12;
    double v6 = (self->_utc_sf_cov + self->_utc_sf_cov) * 1.0e12;
    double v7 = (sqrt((utc_var - a3 * a3) * 1.0e12 * (v5 * -4.0) + v6 * v6) - v6) / (v5 + v5);
    double v8 = (a3 - sqrt(utc_var)) / (self->_xoAccuracy * 0.5);
    if (v7 < v8) {
      double v8 = v7;
    }
    return self->_rtc + v8 * 0.75;
  }
  else
  {
    self->_needTimeNow = 0;
    return -INFINITY;
  }
}

- (void)reset
{
  self->_running = 0;
}

- (void)update:(id)a3 withError:(id *)a4
{
  self->_needTimeNow = 0;
  if ([a3 isSynthesized])
  {
    double v7 = qword_1000338F8;
    if (!os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      if (!a4) {
        return;
      }
      goto LABEL_4;
    }
    sub_10001BC1C(v7);
    if (a4)
    {
LABEL_4:
      uint64_t v8 = 0;
LABEL_26:
      *a4 = +[NSError errorWithDomain:@"kTimedErrorDomain" code:v8 userInfo:0];
    }
  }
  else
  {
    [a3 utcUnc_s];
    if (v9 >= 0.000001)
    {
      BOOL running = self->_running;
      [a3 rtc_s];
      if (running && rtc < self->_rtc) {
        double rtc = self->_rtc;
      }
      self->_double lastTimeRtc = rtc;
      ++self->_measNumber;
      if (objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", @"MobileLockdown"))
      {
        if (self->_running)
        {
          double v19 = qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            name = self->_name;
            [a3 rtc_s];
            uint64_t v22 = v21;
            [a3 utc_s];
            uint64_t v24 = v23;
            [a3 utcUnc_s];
            uint64_t v26 = v25;
            id v27 = [a3 source];
            double v28 = self->_rtc;
            *(_DWORD *)buf = 138413570;
            v142 = name;
            __int16 v143 = 2048;
            *(void *)v144 = v22;
            *(_WORD *)&v144[8] = 2048;
            *(void *)&v144[10] = v24;
            *(_WORD *)&v144[18] = 2048;
            *(void *)&v144[20] = v26;
            *(_WORD *)&v144[28] = 2112;
            *(void *)&v144[30] = v27;
            *(_WORD *)&v144[38] = 2048;
            *(double *)&v144[40] = v28;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@,ignoreMobileLockdown,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@,_rtc,%.6lf", buf, 0x3Eu);
          }
          if (a4)
          {
            uint64_t v8 = 2;
            goto LABEL_26;
          }
          return;
        }
      }
      else if (self->_running)
      {
        [a3 rtc_s];
        if (v29 >= self->_rtc + -0.006)
        {
          [a3 rtc_s];
          if (v42 < self->_rtc) {
            double v42 = self->_rtc;
          }
          v43 = sub_1000168CC((uint64_t)self, v42);
          AnalyticsSendEventLazy();
          [a3 utcUnc_s];
          double v45 = v44;
          [a3 utcUnc_s];
          double v47 = v46;
          [(TMTimeSynthesizerStates *)v43 utc_var];
          double v49 = v48;
          [a3 utc_s];
          double v51 = v50;
          [(TMTimeSynthesizerStates *)v43 utc];
          double v53 = v51 - v52;
          [(TMTimeSynthesizerStates *)v43 utc_var];
          double v55 = v54;
          [a3 utcUnc_s];
          double v57 = v56;
          [a3 utcUnc_s];
          double v59 = v55 + v57 * v58;
          double v60 = 3.0;
          if ((objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", @"TMLSSourceComputed") & 1) == 0)
          {
            if ([objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", @"TimeSourceGnssValidPos") double v60 = 10.0; {
            else
            }
              double v60 = 5.0;
          }
          int v61 = sub_100015FC8((uint64_t)TMTimeSynthesizer, [a3 source]);
          int v62 = v61;
          if (v53 * v53 <= v59 * (v60 * v60))
          {
            double v102 = v45 * v47 * 1000000.0;
            double v103 = v49 * 1000000.0;
            double v104 = v103 + v102;
            if (v61) {
              self->_unint64_t rejects = 0;
            }
            [(TMTimeSynthesizerStates *)v43 rtc];
            self->_double rtc = v105;
            [(TMTimeSynthesizerStates *)v43 utc];
            self->_double utc = v106;
            [(TMTimeSynthesizerStates *)v43 rateSf];
            self->_double rateSf = v107;
            [(TMTimeSynthesizerStates *)v43 utc_var];
            self->_double utc_var = v108;
            [(TMTimeSynthesizerStates *)v43 sf_var];
            self->_sf_var = v109;
            [(TMTimeSynthesizerStates *)v43 utc_sf_cov];
            self->_double utc_sf_cov = v110;
            double v111 = v102 / v104;
            [(TMTimeSynthesizerStates *)v43 utc_sf_cov];
            double v113 = v112 * 1000000.0 / v104;
            double v114 = self->_rateSf + v53 * v113;
            self->_double utc = self->_utc + v103 / v104 * v53;
            self->_double rateSf = v114;
            double utc_sf_cov = self->_utc_sf_cov;
            double v116 = self->_sf_var - utc_sf_cov * v113;
            if (v116 < 6.25e-14) {
              double v116 = 6.25e-14;
            }
            self->_double utc_var = v111 * self->_utc_var;
            self->_sf_var = v116;
            self->_double utc_sf_cov = v111 * utc_sf_cov;
            -[TMTimeSynthesizer setLastInputSource:](self, "setLastInputSource:", [a3 source]);
            sub_1000165D8(self, a3);
            sub_100016F00((uint64_t)self);
            v117 = qword_100033900;
            if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
            {
              v118 = self->_name;
              double v120 = self->_rtc;
              double utc = self->_utc;
              double rateSf = self->_rateSf;
              double v140 = sqrt(self->_sf_var);
              double v138 = sqrt(self->_utc_var);
              double v139 = sqrt(self->_utc_sf_cov);
              long double v122 = log10(self->_clkSg);
              [a3 rtc_s];
              uint64_t v124 = v123;
              [a3 utc_s];
              uint64_t v126 = v125;
              [a3 utcUnc_s];
              uint64_t v128 = v127;
              id v129 = [a3 source];
              [(TMTimeSynthesizerStates *)v43 utc];
              uint64_t v131 = v130;
              [(TMTimeSynthesizerStates *)v43 utc_var];
              double v133 = sqrt(v132);
              [(TMTimeSynthesizerStates *)v43 rateSf];
              uint64_t v135 = v134;
              [(TMTimeSynthesizerStates *)v43 sf_var];
              int measNumber = self->_measNumber;
              *(_DWORD *)buf = 138416386;
              v142 = v118;
              __int16 v143 = 2048;
              *(double *)v144 = v120;
              *(_WORD *)&v144[8] = 2048;
              *(double *)&v144[10] = utc;
              *(_WORD *)&v144[18] = 2048;
              *(double *)&v144[20] = v138;
              *(_WORD *)&v144[28] = 2048;
              *(double *)&v144[30] = rateSf;
              *(_WORD *)&v144[38] = 2048;
              *(double *)&v144[40] = v140;
              __int16 v145 = 2048;
              double v146 = v139;
              __int16 v147 = 2048;
              long double v148 = v122;
              __int16 v149 = 2048;
              uint64_t v150 = v124;
              __int16 v151 = 2048;
              uint64_t v152 = v126;
              __int16 v153 = 2048;
              uint64_t v154 = v128;
              __int16 v155 = 2112;
              id v156 = v129;
              __int16 v157 = 2048;
              uint64_t v158 = v131;
              __int16 v159 = 2048;
              double v160 = v133;
              __int16 v161 = 2048;
              uint64_t v162 = v135;
              __int16 v163 = 2048;
              double v164 = sqrt(v137);
              __int16 v165 = 1024;
              int v166 = measNumber;
              _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%@,SynthesizedClock,rtc,%.6lf,utc,%.6lf,utcUnc,%.6lf,sf,%.8lf,sfUnc,%.8lf,utcSfCov,%.8lf,logNoise,%.6lf,timeRtc,%.6lf,timeUtc,%.6lf,timeUnc,%.6lf,timeSource,%@,predUtc,%.6lf,predUtcUnc,%.6lf,predSf,%.8lf,predSfUnc,%.8lf,measNumber,%d", buf, 0xA8u);
            }
            AnalyticsSendEventLazy();
          }
          else
          {
            v63 = qword_100033900;
            if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
            {
              v64 = self->_name;
              unint64_t rejects = self->_rejects;
              [(TMTimeSynthesizerStates *)v43 utc];
              uint64_t v67 = v66;
              [a3 rtc_s];
              uint64_t v69 = v68;
              [a3 utc_s];
              uint64_t v71 = v70;
              [a3 utcUnc_s];
              *(_DWORD *)buf = 138414082;
              v142 = v64;
              __int16 v143 = 2048;
              *(void *)v144 = rejects;
              *(_WORD *)&v144[8] = 2048;
              *(double *)&v144[10] = v53;
              *(_WORD *)&v144[18] = 2048;
              *(void *)&v144[20] = v67;
              *(_WORD *)&v144[28] = 2048;
              *(void *)&v144[30] = v69;
              *(_WORD *)&v144[38] = 2048;
              *(void *)&v144[40] = v71;
              __int16 v145 = 2048;
              double v146 = v72;
              __int16 v147 = 2112;
              long double v148 = COERCE_DOUBLE([a3 source]);
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%@,RejectATime,rejects,%lu,innv,%.6lf,predTime,%.6lf,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@", buf, 0x52u);
            }
            AnalyticsSendEventLazy();
            if (a4) {
              *a4 = +[NSError errorWithDomain:@"kTimedErrorDomain" code:4 userInfo:0];
            }
            if (v62)
            {
              unint64_t v73 = self->_rejects + 1;
              self->_unint64_t rejects = v73;
              self->_needTimeNow = 1;
              v74 = qword_100033900;
              if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
              {
                v75 = self->_name;
                [a3 rtc_s];
                uint64_t v77 = v76;
                [a3 utc_s];
                uint64_t v79 = v78;
                [a3 utcUnc_s];
                uint64_t v81 = v80;
                id v82 = [a3 source];
                *(_DWORD *)buf = 138413570;
                v142 = v75;
                __int16 v143 = 1024;
                *(_DWORD *)v144 = v73;
                *(_WORD *)&v144[4] = 2048;
                *(void *)&v144[6] = v77;
                *(_WORD *)&v144[14] = 2048;
                *(void *)&v144[16] = v79;
                *(_WORD *)&v144[24] = 2048;
                *(void *)&v144[26] = v81;
                *(_WORD *)&v144[34] = 2112;
                *(void *)&v144[36] = v82;
                _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%@,RequestFastTime,Reject,number,%u,rtc,%.6lf,utc,%.6lf,uncertainty,%.6lf,source,%@", buf, 0x3Au);
              }
              AnalyticsSendEventLazy();
              if (self->_rejects > 4
                || ([(TMTimeSynthesizerStates *)v43 utc_var],
                    double v84 = v83,
                    objc_msgSend(a3, "utcUnc_s"),
                    double v86 = v85,
                    objc_msgSend(a3, "utcUnc_s"),
                    v84 > v86 * v87 * 16.0))
              {
                v88 = qword_100033900;
                if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
                {
                  v89 = self->_name;
                  unint64_t v90 = self->_rejects;
                  [(TMTimeSynthesizerStates *)v43 utc];
                  uint64_t v92 = v91;
                  [(TMTimeSynthesizerStates *)v43 utc_var];
                  double v94 = sqrt(v93);
                  [a3 rtc_s];
                  uint64_t v96 = v95;
                  [a3 utc_s];
                  uint64_t v98 = v97;
                  [a3 utcUnc_s];
                  double v100 = v99;
                  double v101 = COERCE_DOUBLE([a3 source]);
                  *(_DWORD *)buf = 138414082;
                  v142 = v89;
                  __int16 v143 = 2048;
                  *(void *)v144 = v90;
                  *(_WORD *)&v144[8] = 2048;
                  *(void *)&v144[10] = v92;
                  *(_WORD *)&v144[18] = 2048;
                  *(double *)&v144[20] = v94;
                  *(_WORD *)&v144[28] = 2048;
                  *(void *)&v144[30] = v96;
                  *(_WORD *)&v144[38] = 2048;
                  *(void *)&v144[40] = v98;
                  __int16 v145 = 2048;
                  double v146 = v100;
                  __int16 v147 = 2112;
                  long double v148 = v101;
                  _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%@,ResetSynthesizer,rejects,%lu,predTime,%.6lf,predTimeUtc,%.6lf,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@", buf, 0x52u);
                }
                AnalyticsSendEventLazy();
                sub_100016AD0(self, a3);
                if (a4)
                {
                  uint64_t v8 = 5;
                  goto LABEL_26;
                }
              }
            }
          }
        }
        else
        {
          __int16 v30 = qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            double v31 = self->_name;
            [a3 rtc_s];
            uint64_t v33 = v32;
            [a3 utc_s];
            uint64_t v35 = v34;
            [a3 utcUnc_s];
            uint64_t v37 = v36;
            id v38 = [a3 source];
            double v39 = self->_rtc;
            *(_DWORD *)buf = 138413570;
            v142 = v31;
            __int16 v143 = 2048;
            *(void *)v144 = v33;
            *(_WORD *)&v144[8] = 2048;
            *(void *)&v144[10] = v35;
            *(_WORD *)&v144[18] = 2048;
            *(void *)&v144[20] = v37;
            *(_WORD *)&v144[28] = 2112;
            *(void *)&v144[30] = v38;
            *(_WORD *)&v144[38] = 2048;
            *(double *)&v144[40] = v39;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@,RtcRollBack,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@,_rtc,%.6lf", buf, 0x3Eu);
          }
          AnalyticsSendEventLazy();
          double v40 = self->_rtc;
          [a3 rtc_s];
          if (a4 && v40 - v41 > 3600.0)
          {
            uint64_t v8 = 3;
            goto LABEL_26;
          }
        }
        return;
      }
      sub_100016AD0(self, a3);
      return;
    }
    double v10 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_name;
      [a3 rtc_s];
      uint64_t v13 = v12;
      [a3 utc_s];
      uint64_t v15 = v14;
      [a3 utcUnc_s];
      *(_DWORD *)buf = 138413314;
      v142 = v11;
      __int16 v143 = 2048;
      *(void *)v144 = v13;
      *(_WORD *)&v144[8] = 2048;
      *(void *)&v144[10] = v15;
      *(_WORD *)&v144[18] = 2048;
      *(void *)&v144[20] = v16;
      *(_WORD *)&v144[28] = 2112;
      *(void *)&v144[30] = [a3 source];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@,zeroTimeUncertainty,timeRtc,%.6lf,timeUtc,%.6lf,timeUnc,%.6lf,timeSource,%@", buf, 0x34u);
    }
    if (a4)
    {
      uint64_t v8 = 1;
      goto LABEL_26;
    }
  }
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_BOOL running = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (TMTime)lastQualityTime
{
  return (TMTime *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastQualityTime:(id)a3
{
}

- (NSString)lastInputSource
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastInputSource:(id)a3
{
}

@end