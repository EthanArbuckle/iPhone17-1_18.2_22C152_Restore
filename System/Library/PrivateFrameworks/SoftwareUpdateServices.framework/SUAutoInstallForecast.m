@interface SUAutoInstallForecast
+ (BOOL)supportsSecureCoding;
+ (id)createForecast;
- (BOOL)_isDateExpired:(id)a3;
- (BOOL)_isForecastExpired;
- (BOOL)_isForecastLogicallyExpired;
- (BOOL)isEqual:(id)a3;
- (NSDate)firstUnlock;
- (NSDate)suEndDate;
- (NSDate)suStartDate;
- (NSDate)unlockEndDate;
- (NSDate)unlockStartDate;
- (SUAutoInstallForecast)init;
- (SUAutoInstallForecast)initWithCoder:(id)a3;
- (id)_calendar;
- (id)_forecastDateCache;
- (id)_roundedEndTime;
- (id)_roundedStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)scheduleType;
- (void)encodeWithCoder:(id)a3;
- (void)setFirstUnlock:(id)a3;
- (void)setSuEndDate:(id)a3;
- (void)setSuStartDate:(id)a3;
- (void)setUnlockEndDate:(id)a3;
- (void)setUnlockStartDate:(id)a3;
@end

@implementation SUAutoInstallForecast

- (SUAutoInstallForecast)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUAutoInstallForecast;
  v2 = [(SUAutoInstallForecast *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SUAutoInstallForecast *)v2 setUnlockStartDate:0];
    [(SUAutoInstallForecast *)v3 setUnlockEndDate:0];
    [(SUAutoInstallForecast *)v3 setSuStartDate:0];
    [(SUAutoInstallForecast *)v3 setSuEndDate:0];
    [(SUAutoInstallForecast *)v3 setFirstUnlock:0];
  }
  return v3;
}

- (int64_t)scheduleType
{
  v2 = [(SUAutoInstallForecast *)self _forecastDateCache];
  int64_t v3 = [v2 scheduleType];

  return v3;
}

- (id)description
{
  v16 = NSString;
  v17 = [(SUAutoInstallForecast *)self unlockStartDate];
  int64_t v3 = +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:");
  v4 = [(SUAutoInstallForecast *)self unlockEndDate];
  objc_super v5 = +[SUUtility prettyPrintDate:v4];
  v6 = [(SUAutoInstallForecast *)self suStartDate];
  v7 = +[SUUtility prettyPrintDate:v6];
  v8 = [(SUAutoInstallForecast *)self suEndDate];
  v9 = +[SUUtility prettyPrintDate:v8];
  v10 = [(SUAutoInstallForecast *)self firstUnlock];
  v11 = +[SUUtility prettyPrintDate:v10];
  int64_t v12 = [(SUAutoInstallForecast *)self scheduleType];
  if ((unint64_t)(v12 - 1) > 2) {
    v13 = @"Unknown";
  }
  else {
    v13 = off_26447EED8[v12 - 1];
  }
  v14 = [v16 stringWithFormat:@"AutoInstallForecast <%p> :\n            unlockStart = %@\n            unlockEnd = %@\n            suStart = %@\n            suEnd = %@\n            firstUnlock = %@\n            _scheduleType = %@\n", self, v3, v5, v7, v9, v11, v13];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUAutoInstallForecast *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v6 = [(SUAutoInstallForecast *)self unlockStartDate];
      v7 = [(SUAutoInstallForecast *)v5 unlockStartDate];
      if ([v6 isEqualToDate:v7])
      {
        v8 = [(SUAutoInstallForecast *)self unlockEndDate];
        v9 = [(SUAutoInstallForecast *)v5 unlockEndDate];
        if ([v8 isEqualToDate:v9])
        {
          v10 = [(SUAutoInstallForecast *)self suStartDate];
          v11 = [(SUAutoInstallForecast *)v5 suStartDate];
          if ([v10 isEqualToDate:v11])
          {
            v15 = [(SUAutoInstallForecast *)self suEndDate];
            int64_t v12 = [(SUAutoInstallForecast *)v5 suEndDate];
            char v13 = [v15 isEqualToDate:v12];
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (id)_calendar
{
  v2 = [(SUAutoInstallForecast *)self _forecastDateCache];
  int64_t v3 = [v2 calendar];

  return v3;
}

- (BOOL)_isForecastLogicallyExpired
{
  v2 = self;
  int64_t v3 = [(SUAutoInstallForecast *)self suStartDate];
  LOBYTE(v2) = [(SUAutoInstallForecast *)v2 _isDateExpired:v3];

  return (char)v2;
}

- (BOOL)_isForecastExpired
{
  v2 = self;
  int64_t v3 = [(SUAutoInstallForecast *)self suEndDate];
  LOBYTE(v2) = [(SUAutoInstallForecast *)v2 _isDateExpired:v3];

  return (char)v2;
}

- (id)_roundedStartTime
{
  v2 = [(SUAutoInstallForecast *)self _forecastDateCache];
  int64_t v3 = [v2 roundedStartTime];

  return v3;
}

- (id)_roundedEndTime
{
  v2 = [(SUAutoInstallForecast *)self _forecastDateCache];
  int64_t v3 = [v2 roundedEndTime];

  return v3;
}

- (id)_forecastDateCache
{
  lazy_forecastDateCache = self->_lazy_forecastDateCache;
  if (!lazy_forecastDateCache)
  {
    v4 = [[_SUAutoInstallForecastDateCache alloc] initWithForecast:self];
    objc_super v5 = self->_lazy_forecastDateCache;
    self->_lazy_forecastDateCache = v4;

    lazy_forecastDateCache = self->_lazy_forecastDateCache;
  }
  return lazy_forecastDateCache;
}

- (BOOL)_isDateExpired:(id)a3
{
  int64_t v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  objc_super v5 = [v3 date];
  v6 = [v4 laterDate:v5];

  return v6 == v5;
}

+ (id)createForecast
{
  id v2 = objc_alloc_init(MEMORY[0x263F34FD8]);
  int64_t v3 = [v2 getUnlockAndSoftwareUpdateTimes];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F351A8]];
  int64_t v12 = v4;
  if (!v4 || ([v4 dateByAddingTimeInterval:-7200.0], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    SULogInfo(@"Duet failed to return kCDSleepAutoSuUnlockKey", v5, v6, v7, v8, v9, v10, v11, v111);
    v33 = 0;
    goto LABEL_31;
  }
  v14 = (void *)v13;
  uint64_t v15 = [v3 objectForKeyedSubscript:*MEMORY[0x263F35198]];
  if (!v15)
  {
    SULogInfo(@"Duet failed to return kCDSleepAutoSuExpirationTimeKey", v16, v17, v18, v19, v20, v21, v22, v111);
    goto LABEL_8;
  }
  v23 = (void *)v15;
  v24 = [MEMORY[0x263EFF910] date];
  v25 = [v23 laterDate:v24];

  if (v25 == v23)
  {
    v123 = v23;
    v34 = [MEMORY[0x263EFF910] now];
    v35 = specificTimeOnDate(v34, 2, 0, 0);
    uint64_t v36 = specificTimeOnDate(v34, 4, 0, 0);
    v37 = specificTimeOnDate(v34, 5, 0, 0);
    v38 = [v35 dateByAddingTimeInterval:86400.0];
    uint64_t v39 = [v37 dateByAddingTimeInterval:86400.0];
    uint64_t v40 = [v34 compare:v35];
    v122 = v35;
    v41 = v35;
    v42 = v37;
    if (v40 != -1)
    {
      uint64_t v43 = [v34 compare:v36];
      if (v43 == -1) {
        v41 = v34;
      }
      else {
        v41 = v38;
      }
      if (v43 == -1) {
        v42 = v37;
      }
      else {
        v42 = (void *)v39;
      }
    }
    v124 = (void *)v39;
    v119 = v34;
    v120 = v37;
    v121 = (void *)v36;
    id v44 = v41;
    id v45 = v42;
    v46 = [v45 dateByAddingTimeInterval:86400.0];

    v47 = +[SUUtility prettyPrintDate:v44];
    v112 = +[SUUtility prettyPrintDate:v46];
    SULogInfo(@"suStartDate = %@, suEndDate = %@", v48, v49, v50, v51, v52, v53, v54, (uint64_t)v47);

    v55 = objc_alloc_init(SUAutoInstallForecast);
    uint64_t v56 = [v3 objectForKeyedSubscript:@"unrestricted_sleep_end"];
    if (v56) {
      [(SUAutoInstallForecast *)v55 setFirstUnlock:v56];
    }
    v117 = (void *)v56;
    if (MGGetBoolAnswer())
    {
      v57 = +[SUPreferences sharedInstance];
      v58 = [v57 autoSUStartDelta];

      if (v58)
      {
        v59 = +[SUPreferences sharedInstance];
        v60 = [v59 autoSUStartDelta];
        double v61 = (double)(unint64_t)(60 * [v60 unsignedIntegerValue]);

        uint64_t v62 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v61];

        v113 = +[SUUtility prettyPrintDate:v62];
        SULogInfo(@"Overriding suStartDate with time interval: %f : %@", v63, v64, v65, v66, v67, v68, v69, *(uint64_t *)&v61);

        id v44 = (id)v62;
      }
      v70 = +[SUPreferences sharedInstance];
      v71 = [v70 autoSUEndDelta];

      if (v71)
      {
        v72 = +[SUPreferences sharedInstance];
        v73 = [v72 autoSUEndDelta];
        double v74 = (double)(unint64_t)(60 * [v73 unsignedIntegerValue]);

        uint64_t v75 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v74];

        v114 = +[SUUtility prettyPrintDate:v75];
        SULogInfo(@"Overriding suEndDate with time interval: %f : %@", v76, v77, v78, v79, v80, v81, v82, *(uint64_t *)&v74);

        v46 = (void *)v75;
      }
      v83 = +[SUPreferences sharedInstance];
      v84 = [v83 autoSUUnlockStartDelta];

      v118 = v46;
      if (v84)
      {
        v85 = +[SUPreferences sharedInstance];
        v86 = [v85 autoSUUnlockStartDelta];
        double v87 = (double)(unint64_t)(60 * [v86 unsignedIntegerValue]);

        uint64_t v88 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v87];

        v115 = +[SUUtility prettyPrintDate:v88];
        SULogInfo(@"Overriding unlockStartDate with time interval: %f : %@", v89, v90, v91, v92, v93, v94, v95, *(uint64_t *)&v87);

        v14 = (void *)v88;
      }
      v96 = v44;
      v97 = +[SUPreferences sharedInstance];
      v98 = [v97 autoSUUnlockEndDelta];

      if (v98)
      {
        v99 = +[SUPreferences sharedInstance];
        v100 = [v99 autoSUUnlockEndDelta];
        double v101 = (double)(unint64_t)(60 * [v100 unsignedIntegerValue]);

        v102 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v101];

        v116 = +[SUUtility prettyPrintDate:v102];
        SULogInfo(@"Overriding unlockEndDate with time interval: %f : %@", v103, v104, v105, v106, v107, v108, v109, *(uint64_t *)&v101);

LABEL_29:
        [(SUAutoInstallForecast *)v55 setUnlockStartDate:v14];
        [(SUAutoInstallForecast *)v55 setUnlockEndDate:v102];
        [(SUAutoInstallForecast *)v55 setSuStartDate:v96];
        [(SUAutoInstallForecast *)v55 setSuEndDate:v118];
        v33 = v55;

        goto LABEL_30;
      }
    }
    else
    {
      v118 = v46;
      v96 = v44;
    }
    v102 = v123;
    goto LABEL_29;
  }
  SULogInfo(@"unlock end date has already passed", v26, v27, v28, v29, v30, v31, v32, v111);

LABEL_8:
  v33 = 0;
LABEL_30:

LABEL_31:
  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUAutoInstallForecast)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUAutoInstallForecast;
  uint64_t v5 = [(SUAutoInstallForecast *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnlockStart"];
    [(SUAutoInstallForecast *)v5 setUnlockStartDate:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnlockEnd"];
    [(SUAutoInstallForecast *)v5 setUnlockEndDate:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUStart"];
    [(SUAutoInstallForecast *)v5 setSuStartDate:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUEnd"];
    [(SUAutoInstallForecast *)v5 setSuEndDate:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstUnlock"];
    [(SUAutoInstallForecast *)v5 setFirstUnlock:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUAutoInstallForecast *)self unlockStartDate];
  [v4 encodeObject:v5 forKey:@"UnlockStart"];

  uint64_t v6 = [(SUAutoInstallForecast *)self unlockEndDate];
  [v4 encodeObject:v6 forKey:@"UnlockEnd"];

  uint64_t v7 = [(SUAutoInstallForecast *)self suStartDate];
  [v4 encodeObject:v7 forKey:@"SUStart"];

  uint64_t v8 = [(SUAutoInstallForecast *)self suEndDate];
  [v4 encodeObject:v8 forKey:@"SUEnd"];

  id v9 = [(SUAutoInstallForecast *)self firstUnlock];
  [v4 encodeObject:v9 forKey:@"firstUnlock"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SUAutoInstallForecast);
  uint64_t v5 = [(SUAutoInstallForecast *)self unlockStartDate];
  [(SUAutoInstallForecast *)v4 setUnlockStartDate:v5];

  uint64_t v6 = [(SUAutoInstallForecast *)self unlockEndDate];
  [(SUAutoInstallForecast *)v4 setUnlockEndDate:v6];

  uint64_t v7 = [(SUAutoInstallForecast *)self suStartDate];
  [(SUAutoInstallForecast *)v4 setSuStartDate:v7];

  uint64_t v8 = [(SUAutoInstallForecast *)self suEndDate];
  [(SUAutoInstallForecast *)v4 setSuEndDate:v8];

  id v9 = [(SUAutoInstallForecast *)self firstUnlock];
  [(SUAutoInstallForecast *)v4 setFirstUnlock:v9];

  return v4;
}

- (NSDate)unlockStartDate
{
  return self->_unlockStartDate;
}

- (void)setUnlockStartDate:(id)a3
{
}

- (NSDate)unlockEndDate
{
  return self->_unlockEndDate;
}

- (void)setUnlockEndDate:(id)a3
{
}

- (NSDate)suStartDate
{
  return self->_suStartDate;
}

- (void)setSuStartDate:(id)a3
{
}

- (NSDate)suEndDate
{
  return self->_suEndDate;
}

- (void)setSuEndDate:(id)a3
{
}

- (NSDate)firstUnlock
{
  return self->_firstUnlock;
}

- (void)setFirstUnlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazy_forecastDateCache, 0);
  objc_storeStrong((id *)&self->_firstUnlock, 0);
  objc_storeStrong((id *)&self->_suEndDate, 0);
  objc_storeStrong((id *)&self->_suStartDate, 0);
  objc_storeStrong((id *)&self->_unlockEndDate, 0);
  objc_storeStrong((id *)&self->_unlockStartDate, 0);
}

@end