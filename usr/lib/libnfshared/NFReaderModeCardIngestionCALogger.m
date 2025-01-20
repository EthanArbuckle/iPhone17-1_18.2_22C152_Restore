@interface NFReaderModeCardIngestionCALogger
+ (void)postAnalyticsReaderModeCardIngestionSession:(id)a3 prepOnly:(BOOL)a4;
@end

@implementation NFReaderModeCardIngestionCALogger

+ (void)postAnalyticsReaderModeCardIngestionSession:(id)a3 prepOnly:(BOOL)a4
{
  id v5 = a3;
  if (v5)
  {
    id v48 = v5;
    v6 = [v5 objectForKeyedSubscript:@"state"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v8 = [v48 objectForKeyedSubscript:@"state"];
      v9 = (void *)qword_1EB4D28E8;
      qword_1EB4D28E8 = v8;
    }
    v10 = [v48 objectForKeyedSubscript:@"spStatus"];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      uint64_t v12 = [v48 objectForKeyedSubscript:@"spStatus"];
      v13 = (void *)qword_1EB4D28C8;
      qword_1EB4D28C8 = v12;
    }
    v14 = [v48 objectForKeyedSubscript:@"sessionStatus"];
    objc_opt_class();
    char v15 = objc_opt_isKindOfClass();

    if (v15)
    {
      uint64_t v16 = [v48 objectForKeyedSubscript:@"sessionStatus"];
      v17 = (void *)qword_1EB4D28D0;
      qword_1EB4D28D0 = v16;
    }
    v18 = [v48 objectForKeyedSubscript:@"cardValidationStatus"];
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if (v19)
    {
      uint64_t v20 = [v48 objectForKeyedSubscript:@"cardValidationStatus"];
      v21 = (void *)qword_1EB4D28D8;
      qword_1EB4D28D8 = v20;
    }
    v22 = [v48 objectForKeyedSubscript:@"technology"];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if (v23)
    {
      uint64_t v24 = [v48 objectForKeyedSubscript:@"technology"];
      v25 = (void *)qword_1EB4D28E0;
      qword_1EB4D28E0 = v24;
    }
    v26 = [v48 objectForKeyedSubscript:@"sessionStartTime"];
    objc_opt_class();
    char v27 = objc_opt_isKindOfClass();

    if (v27)
    {
      uint64_t v28 = [v48 objectForKeyedSubscript:@"sessionStartTime"];
      v29 = (void *)_MergedGlobals_6;
      _MergedGlobals_6 = v28;
    }
    v30 = [v48 objectForKeyedSubscript:@"sessionEndTime"];
    objc_opt_class();
    char v31 = objc_opt_isKindOfClass();

    if (v31)
    {
      uint64_t v32 = [v48 objectForKeyedSubscript:@"sessionEndTime"];
      v33 = (void *)qword_1EB4D28C0;
      qword_1EB4D28C0 = v32;
    }
    id v5 = v48;
    if (!a4)
    {
      unint64_t v34 = 0;
      if (_MergedGlobals_6 && qword_1EB4D28C0)
      {
        [qword_1EB4D28C0 timeIntervalSinceDate:];
        unint64_t v34 = (unint64_t)(v35 * 1000.0);
      }
      v36 = objc_opt_new();
      v37 = [NSNumber numberWithUnsignedInteger:v34];
      [v36 setObject:v37 forKeyedSubscript:@"duration"];

      unsigned int v38 = +[NFCALogger getBatteryPercent];
      v39 = [NSNumber numberWithUnsignedInteger:v38];
      [v36 setObject:v39 forKeyedSubscript:@"currentBatteryLevel"];

      if (qword_1EB4D28E8) {
        [v36 setObject:qword_1EB4D28E8 forKeyedSubscript:@"state"];
      }
      if (qword_1EB4D28C8) {
        [v36 setObject:qword_1EB4D28C8 forKeyedSubscript:@"spStatus"];
      }
      if (qword_1EB4D28D0) {
        [v36 setObject:qword_1EB4D28D0 forKeyedSubscript:@"sessionStatus"];
      }
      if (qword_1EB4D28D8) {
        [v36 setObject:qword_1EB4D28D8 forKeyedSubscript:@"cardValidationStatus"];
      }
      if (qword_1EB4D28E0) {
        [v36 setObject:qword_1EB4D28E0 forKeyedSubscript:@"technology"];
      }
      v40 = +[NFCALogger sharedCALogger];
      [v40 postCAEventFor:@"com.apple.nfcd.cardIngestionSessionStateChangeEvent" eventInput:v36];

      v41 = (void *)_MergedGlobals_6;
      _MergedGlobals_6 = 0;

      v42 = (void *)qword_1EB4D28C0;
      qword_1EB4D28C0 = 0;

      v43 = (void *)qword_1EB4D28C8;
      qword_1EB4D28C8 = 0;

      v44 = (void *)qword_1EB4D28D0;
      qword_1EB4D28D0 = 0;

      v45 = (void *)qword_1EB4D28D8;
      qword_1EB4D28D8 = 0;

      v46 = (void *)qword_1EB4D28E0;
      qword_1EB4D28E0 = 0;

      v47 = (void *)qword_1EB4D28E8;
      qword_1EB4D28E8 = 0;

      id v5 = v48;
    }
  }
}

@end