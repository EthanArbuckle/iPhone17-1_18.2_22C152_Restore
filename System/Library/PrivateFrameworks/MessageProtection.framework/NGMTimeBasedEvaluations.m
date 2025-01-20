@interface NGMTimeBasedEvaluations
+ (BOOL)prekeyCanBeDeleted:(id)a3;
+ (BOOL)prekeyShouldBeRolled:(id)a3;
+ (BOOL)shouldRekeyIfLastRekeyFrom:(id)a3;
+ (BOOL)validateFetchedPrekeyTimestamp:(double)a3 forEvaluationType:(unint64_t)a4;
+ (double)timeIntervalAllowedForAction:(unint64_t)a3;
+ (id)debugDescriptionForAction:(unint64_t)a3;
+ (id)nowDate;
+ (id)oldestDateAllowedToSendTo;
+ (id)sharedManager;
+ (void)setNowDate:(id)a3;
- (NSDate)date;
- (void)setDate:(id)a3;
@end

@implementation NGMTimeBasedEvaluations

+ (id)sharedManager
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sharedManager_sharedMyManager)
  {
    id v3 = objc_alloc_init((Class)v2);
    v4 = (void *)sharedManager_sharedMyManager;
    sharedManager_sharedMyManager = (uint64_t)v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)sharedManager_sharedMyManager;
  return v5;
}

+ (id)nowDate
{
  id v2 = [a1 sharedManager];
  id v3 = [v2 date];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF910] now];
  }
  v5 = v4;

  return v5;
}

+ (void)setNowDate:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedManager];
  [v5 setDate:v4];
}

+ (id)oldestDateAllowedToSendTo
{
  id v2 = (void *)MEMORY[0x263EFF910];
  id v3 = [a1 nowDate];
  [v3 timeIntervalSince1970];
  id v5 = [v2 dateWithTimeIntervalSince1970:v4 + -2678400.0];

  return v5;
}

+ (double)timeIntervalAllowedForAction:(unint64_t)a3
{
  double result = dbl_216494370[a3 == 1];
  if (a3 == 2) {
    return 12355200.0;
  }
  return result;
}

+ (id)debugDescriptionForAction:(unint64_t)a3
{
  id v3 = @"registering";
  if (a3 == 1) {
    id v3 = @"encrypting to";
  }
  if (a3 == 2) {
    return @"validating signature of message";
  }
  else {
    return v3;
  }
}

+ (BOOL)validateFetchedPrekeyTimestamp:(double)a3 forEvaluationType:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v7 = [a1 nowDate];
  [v7 timeIntervalSince1970];
  double v9 = v8 - a3;

  [a1 timeIntervalAllowedForAction:a4];
  BOOL v11 = v9 < 0.0;
  if (v9 >= 0.0)
  {
    double v20 = v10;
    if (v9 <= v10) {
      return 1;
    }
    v12 = MessageProtectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v31 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:a3];
      v22 = [v31 description];
      v23 = (void *)MEMORY[0x263EFF910];
      v24 = [a1 nowDate];
      [v24 timeIntervalSince1970];
      v26 = [v23 dateWithTimeIntervalSince1970:v25 - v20];
      v27 = [v26 description];
      v28 = [a1 nowDate];
      v29 = [v28 description];
      v30 = [a1 debugDescriptionForAction:a4];
      *(_DWORD *)buf = 138413058;
      v33 = v22;
      __int16 v34 = 2112;
      v35 = v27;
      __int16 v36 = 2112;
      v37 = v29;
      __int16 v38 = 2112;
      v39 = v30;
      _os_log_error_impl(&dword_2163F2000, v12, OS_LOG_TYPE_ERROR, "The encryption prekey is older (%@) than the last allowed date (%@) for %@ at %@.", buf, 0x2Au);
    }
  }
  else
  {
    v12 = MessageProtectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  return v11;
}

+ (BOOL)shouldRekeyIfLastRekeyFrom:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [a1 nowDate];
    [v5 timeIntervalSince1970];
    double v7 = v6;
    [v4 timeIntervalSince1970];
    double v9 = v7 - v8;

    if (v9 < 0.0)
    {
      double v10 = MessageProtectionLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = 0;
        BOOL v11 = "A KEM rekeying happened with a date logged in the future.";
        v12 = (uint8_t *)&v20;
LABEL_13:
        _os_log_impl(&dword_2163F2000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    double v10 = MessageProtectionLog();
    BOOL v16 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9 <= 604800.0)
    {
      if (v16)
      {
        __int16 v18 = 0;
        BOOL v11 = "We have rekeyed less than a week ago.";
        v12 = (uint8_t *)&v18;
        goto LABEL_13;
      }
LABEL_14:
      BOOL v13 = 0;
      goto LABEL_15;
    }
    if (!v16)
    {
      BOOL v13 = 1;
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "A week or more has passed since our last KEM rekeying, should rekey again.";
    BOOL v13 = 1;
    uint64_t v15 = buf;
    goto LABEL_10;
  }
  double v10 = MessageProtectionLog();
  BOOL v13 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v21 = 0;
    uint64_t v14 = "Rekeying since we don't have a last rekey date.";
    uint64_t v15 = (uint8_t *)&v21;
LABEL_10:
    _os_log_impl(&dword_2163F2000, v10, OS_LOG_TYPE_INFO, v14, v15, 2u);
  }
LABEL_15:

  return v13;
}

+ (BOOL)prekeyCanBeDeleted:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 nowDate];
  [v5 timeIntervalSince1970];
  double v7 = v6;
  double v8 = [v4 publicPrekey];
  [v8 timestamp];
  double v10 = v7 - v9;

  BOOL v11 = v10 >= 0.0;
  if (v10 < 0.0)
  {
    v12 = MessageProtectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      BOOL v13 = "The encryption prekey appears to have been signed with a date in the future.                    The time was"
            " probably rolled back on the phone.";
      uint64_t v14 = v12;
      uint32_t v15 = 2;
      goto LABEL_7;
    }
  }
  else
  {
    if (v10 <= 10368000.0)
    {
      BOOL v11 = 0;
      goto LABEL_10;
    }
    v12 = MessageProtectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v4;
      BOOL v13 = "Removing prekey %@ since it's safe to delete it now (expired).";
      uint64_t v14 = v12;
      uint32_t v15 = 12;
LABEL_7:
      _os_log_impl(&dword_2163F2000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, v15);
    }
  }

LABEL_10:
  return v11;
}

+ (BOOL)prekeyShouldBeRolled:(id)a3
{
  id v4 = a3;
  id v5 = [a1 nowDate];
  [v5 timeIntervalSince1970];
  double v7 = v6;
  double v8 = [v4 publicPrekey];

  [v8 timestamp];
  double v10 = v7 - v9;

  if (v10 < 0.0)
  {
    BOOL v11 = MessageProtectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[NGMTimeBasedEvaluations prekeyShouldBeRolled:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
LABEL_7:

    return 1;
  }
  if (v10 > 604800.0)
  {
    BOOL v11 = MessageProtectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[NGMTimeBasedEvaluations prekeyShouldBeRolled:](v11, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_7;
  }
  return 0;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)validateFetchedPrekeyTimestamp:(uint64_t)a3 forEvaluationType:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prekeyShouldBeRolled:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prekeyShouldBeRolled:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end