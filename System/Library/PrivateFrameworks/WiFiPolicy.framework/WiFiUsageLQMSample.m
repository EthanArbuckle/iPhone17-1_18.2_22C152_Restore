@interface WiFiUsageLQMSample
+ (BOOL)isPerSecond:(id)a3;
+ (id)allLQMProperties;
+ (id)binLabelfromFieldName:(id)a3 value:(int64_t)a4;
+ (id)featureFromFieldName:(id)a3;
+ (int64_t)subtract:(int64_t)a3 From:(int64_t)a4;
+ (void)initialize;
- (id)asDictionaryInto:(id)a3;
- (id)description;
- (id)numberForKeyPath:(id)a3;
@end

@implementation WiFiUsageLQMSample

- (id)numberForKeyPath:(id)a3
{
  v3 = [(WiFiUsageLQMSample *)self valueForKeyPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 unsignedLongValue] == 0x7FFFFFFFFFFFFFFFLL) {
      v5 = 0;
    }
    else {
      v5 = v4;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (int64_t)subtract:(int64_t)a3 From:(int64_t)a4
{
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a4 - a3;
  }
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(id)objc_opt_class() allLQMProperties];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = [(WiFiUsageLQMSample *)self numberForKeyPath:v9];
        [v3 appendFormat:@"%@:%@,", v9, v10, (void)v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = [NSString stringWithString:v3];

  return v11;
}

+ (BOOL)isPerSecond:(id)a3
{
  v3 = (void *)WiFiUsageLQMFieldNameToRoundMethod;
  id v4 = a3;
  uint64_t v5 = [v3 allKeys];
  uint64_t v6 = [NSString stringWithFormat:@"%@PerSecond", v4];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (id)asDictionaryInto:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    id v4 = (id)objc_opt_new();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(id)objc_opt_class() allLQMProperties];
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    v8 = @"perCoreRssiInUse";
    do
    {
      uint64_t v9 = 0;
      uint64_t v25 = v6;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        v11 = [(WiFiUsageLQMSample *)self numberForKeyPath:v10];
        [v4 setObject:v11 forKeyedSubscript:v10];

        if ([(id)objc_opt_class() isPerSecond:v10])
        {
          uint64_t v12 = v7;
          long long v13 = v8;
          long long v14 = NSNumber;
          long long v15 = [v4 objectForKeyedSubscript:v10];
          [v15 doubleValue];
          double v17 = v16;
          uint64_t v18 = [(WiFiUsageLQMSample *)self numberForKeyPath:@"duration"];
          v19 = objc_msgSend(v14, "numberWithLong:", (uint64_t)(v17 / (double)objc_msgSend(v18, "integerValue")));
          v20 = [NSString stringWithFormat:@"%@PerSecond", v10];
          [v4 setObject:v19 forKeyedSubscript:v20];

          v8 = v13;
          uint64_t v7 = v12;
          uint64_t v6 = v25;
        }
        if ([v10 isEqualToString:v8])
        {
          v21 = [v4 objectForKeyedSubscript:v10];
          uint64_t v22 = [v21 unsignedIntValue];

          v23 = +[WiFiUsagePrivacyFilter getLabelForCoreRssiMode:v22];
          [v4 setObject:v23 forKeyedSubscript:v10];
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)allLQMProperties
{
  unsigned int outCount = 0;
  v3 = objc_opt_new();
  if ([a1 isSubclassOfClass:objc_opt_class()])
  {
    while (1)
    {
      id v4 = class_copyPropertyList((Class)a1, &outCount);
      if (outCount) {
        break;
      }
      a1 = (id)[a1 superclass];
      if (v4) {
        goto LABEL_12;
      }
LABEL_13:
      if (([a1 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
        goto LABEL_14;
      }
    }
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Attributes = property_getAttributes(v4[i]);
      if (!Attributes) {
        goto LABEL_8;
      }
      uint64_t v7 = Attributes;
      v8 = [NSString stringWithUTF8String:Attributes];
      char v9 = [v8 hasPrefix:@"T@"];

      if ((v9 & 1) == 0)
      {
        v10 = [NSString stringWithUTF8String:v7];
        char v11 = [v10 hasPrefix:@"T#"];

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = [NSString stringWithUTF8String:v7];
          char v13 = [v12 hasPrefix:@"T:"];

          if ((v13 & 1) == 0)
          {
LABEL_8:
            long long v14 = objc_msgSend(NSString, "stringWithCString:encoding:", property_getName(v4[i]), objc_msgSend(NSString, "defaultCStringEncoding"));
            [v3 addObject:v14];
          }
        }
      }
    }
    a1 = (id)[a1 superclass];
LABEL_12:
    free(v4);
    goto LABEL_13;
  }
LABEL_14:
  long long v15 = (void *)[v3 copy];

  return v15;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)WiFiUsageLQMFieldNameToFeatureMethod;
  WiFiUsageLQMFieldNameToFeatureMethod = v2;

  defaultForPercentages = 2;
  id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v97 = [NSNumber numberWithInt:3];
  v85 = [NSNumber numberWithInt:4];
  v94 = [NSNumber numberWithInt:5];
  v96 = [NSNumber numberWithInt:1];
  v95 = [NSNumber numberWithInt:1];
  v93 = [NSNumber numberWithInt:1];
  v82 = [NSNumber numberWithInt:1];
  v91 = [NSNumber numberWithInt:6];
  v90 = [NSNumber numberWithInt:2];
  v92 = [NSNumber numberWithInt:2];
  v88 = [NSNumber numberWithInt:2];
  v87 = [NSNumber numberWithInt:13];
  v89 = [NSNumber numberWithInt:13];
  v86 = [NSNumber numberWithInt:6];
  v84 = [NSNumber numberWithInt:2];
  v72 = [NSNumber numberWithInt:2];
  v83 = [NSNumber numberWithInt:2];
  v64 = [NSNumber numberWithInt:2];
  v81 = [NSNumber numberWithInt:2];
  v80 = [NSNumber numberWithInt:2];
  v56 = [NSNumber numberWithInt:2];
  v79 = [NSNumber numberWithInt:2];
  v78 = [NSNumber numberWithInt:2];
  v77 = [NSNumber numberWithInt:2];
  v76 = [NSNumber numberWithInt:2];
  v75 = [NSNumber numberWithInt:2];
  v74 = [NSNumber numberWithInt:2];
  v19 = [NSNumber numberWithInt:2];
  v73 = [NSNumber numberWithInt:2];
  v71 = [NSNumber numberWithInt:2];
  v70 = [NSNumber numberWithInt:2];
  v69 = [NSNumber numberWithInt:2];
  uint64_t v18 = [NSNumber numberWithInt:1];
  v68 = [NSNumber numberWithInt:1];
  v67 = [NSNumber numberWithInt:1];
  v66 = [NSNumber numberWithInt:9];
  v65 = [NSNumber numberWithInt:11];
  v63 = [NSNumber numberWithInt:11];
  v62 = [NSNumber numberWithInt:12];
  v61 = [NSNumber numberWithInt:1];
  double v17 = [NSNumber numberWithInt:1];
  v60 = [NSNumber numberWithInt:1];
  v59 = [NSNumber numberWithInt:1];
  v58 = [NSNumber numberWithInt:1];
  v57 = [NSNumber numberWithInt:1];
  v55 = [NSNumber numberWithInt:1];
  v54 = [NSNumber numberWithInt:1];
  v53 = [NSNumber numberWithInt:1];
  double v16 = [NSNumber numberWithInt:1];
  v52 = [NSNumber numberWithInt:8];
  v51 = [NSNumber numberWithInt:8];
  v50 = [NSNumber numberWithInt:8];
  v49 = [NSNumber numberWithInt:8];
  v48 = [NSNumber numberWithInt:8];
  v47 = [NSNumber numberWithInt:9];
  v46 = [NSNumber numberWithInt:9];
  v45 = [NSNumber numberWithInt:9];
  v44 = [NSNumber numberWithInt:9];
  v43 = [NSNumber numberWithInt:9];
  v42 = [NSNumber numberWithInt:7];
  v41 = [NSNumber numberWithInt:7];
  v40 = [NSNumber numberWithInt:8];
  v39 = [NSNumber numberWithInt:8];
  v38 = [NSNumber numberWithInt:7];
  v37 = [NSNumber numberWithInt:7];
  v36 = [NSNumber numberWithInt:7];
  v35 = [NSNumber numberWithInt:7];
  v34 = [NSNumber numberWithInt:1];
  v33 = [NSNumber numberWithInt:1];
  uint64_t v32 = [NSNumber numberWithInt:1];
  v31 = [NSNumber numberWithInt:11];
  long long v30 = [NSNumber numberWithInt:2];
  long long v29 = [NSNumber numberWithInt:2];
  long long v28 = [NSNumber numberWithInt:2];
  long long v27 = [NSNumber numberWithInt:2];
  v26 = [NSNumber numberWithInt:9];
  uint64_t v25 = [NSNumber numberWithInt:2];
  v24 = [NSNumber numberWithInt:2];
  v23 = [NSNumber numberWithInt:2];
  uint64_t v22 = [NSNumber numberWithInt:9];
  v21 = [NSNumber numberWithInt:2];
  id v4 = [NSNumber numberWithInt:2];
  long long v15 = [NSNumber numberWithInt:2];
  uint64_t v5 = [NSNumber numberWithInt:2];
  long long v14 = [NSNumber numberWithInt:2];
  uint64_t v6 = [NSNumber numberWithInt:9];
  char v13 = [NSNumber numberWithInt:9];
  uint64_t v7 = [NSNumber numberWithInt:9];
  v8 = [NSNumber numberWithInt:9];
  uint64_t v12 = [NSNumber numberWithInt:9];
  char v11 = [NSNumber numberWithInt:27];
  uint64_t v9 = objc_msgSend(v20, "initWithObjectsAndKeys:", v97, @"rssi", v85, @"noise", v94, @"snr", v96, @"selfCca", v95, @"otherCca", v93, @"interference", v82, @"totalReportedCca", v91, @"decodingAttemptsPerSecond", v90,
         @"rxStartOverDecodingAttemptsPercentage",
         v92,
         @"rxCrsGlitchOverDecodingAttemptsPercentage",
         v88,
         @"rxBadPlcpOverDecodingAttemptsPercentage",
         v87,
         @"ofdmDesense",
         v89,
         @"bPhyDesense",
         v86,
         @"txLatencyP95",
         v84,
         @"rxDecodingErrorsOverRxStart",
         v72,
         @"rxUcastOverRxStart",
         v83,
         @"rxBeaconOverRxStart",
         v64,
         @"rxAnyErrOverDecodingErrors",
         v81,
         @"rxBadFCSOverDecodingErrors",
         v80,
         @"rxFifo0OvflOverDecodingErrors",
         v56,
         @"rxFifo1OvflOverDecodingErrors",
         v79,
         @"rxFrmTooLongOverDecodingErrors",
         v78,
         @"rxFrmTooShrtOverDecodingErrors",
         v77,
         @"rxNoDelimOverDecodingErrors",
         v76,
         @"rxResponseTimeoutOverDecodingErrors",
         v75,
         @"rxUcastCtrlPercentage",
         v74,
         @"rxUcastMgmtPercentage",
         v19,
         @"rxUcastDataPercentage",
         v73,
         @"rxBACKOverRxCtrlFrmsPercentage",
         v71,
         @"rxUcastACKOverRxCtrlFrmsPercentage",
         v70);
  v10 = (void *)WiFiUsageLQMFieldNameToRoundMethod;
  WiFiUsageLQMFieldNameToRoundMethod = v9;
}

+ (id)binLabelfromFieldName:(id)a3 value:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [(id)WiFiUsageLQMFieldNameToRoundMethod objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 integerValue];

  if (v7) {
    goto LABEL_5;
  }
  if (([v5 hasSuffix:@"Perc"] & 1) != 0
    || [v5 hasSuffix:@"Percentage"])
  {
    uint64_t v7 = defaultForPercentages;
LABEL_5:
    switch(v7)
    {
      case 0:
        break;
      case 1:
        int64_t v10 = a4;
        uint64_t v11 = 0;
        goto LABEL_22;
      case 2:
        int64_t v12 = a4;
        uint64_t v13 = 0;
        goto LABEL_24;
      case 3:
        int64_t v14 = a4;
        uint64_t v15 = 0;
        goto LABEL_26;
      case 4:
        int64_t v16 = a4;
        uint64_t v17 = 0;
        goto LABEL_28;
      case 5:
        int64_t v18 = a4;
        uint64_t v19 = 0;
        goto LABEL_30;
      case 6:
        int64_t v20 = a4;
        uint64_t v21 = 0;
        goto LABEL_32;
      case 7:
        int64_t v22 = a4;
        uint64_t v23 = 0;
        goto LABEL_34;
      case 8:
        int64_t v24 = a4;
        uint64_t v25 = 0;
        goto LABEL_36;
      case 9:
        int64_t v26 = a4;
        uint64_t v27 = 0;
        goto LABEL_38;
      case 10:
        int64_t v28 = a4;
        uint64_t v29 = 0;
        goto LABEL_40;
      case 11:
        int64_t v30 = a4;
        uint64_t v31 = 0;
        goto LABEL_42;
      case 12:
        int64_t v32 = a4;
        uint64_t v33 = 0;
        goto LABEL_44;
      case 13:
        int64_t v34 = a4;
        uint64_t v35 = 0;
        goto LABEL_46;
      case 14:
        int64_t v10 = a4;
        uint64_t v11 = 2;
LABEL_22:
        uint64_t v8 = +[WiFiUsagePrivacyFilter getBinEvery10Over100:v10 As:v11];
        goto LABEL_48;
      case 15:
        int64_t v12 = a4;
        uint64_t v13 = 2;
LABEL_24:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinEvery10thOverRatioScale:v12 As:v13];
        goto LABEL_48;
      case 16:
        int64_t v14 = a4;
        uint64_t v15 = 2;
LABEL_26:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinRssi:v14 As:v15];
        goto LABEL_48;
      case 17:
        int64_t v16 = a4;
        uint64_t v17 = 2;
LABEL_28:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinNoise:v16 As:v17];
        goto LABEL_48;
      case 18:
        int64_t v18 = a4;
        uint64_t v19 = 2;
LABEL_30:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinSnr:v18 As:v19];
        goto LABEL_48;
      case 19:
        int64_t v20 = a4;
        uint64_t v21 = 2;
LABEL_32:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinDecodingAttempts:v20 As:v21];
        goto LABEL_48;
      case 20:
        int64_t v22 = a4;
        uint64_t v23 = 2;
LABEL_34:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinBytesPerFrame:v22 As:v23];
        goto LABEL_48;
      case 21:
        int64_t v24 = a4;
        uint64_t v25 = 2;
LABEL_36:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinBytesPerPacket:v24 As:v25];
        goto LABEL_48;
      case 22:
        int64_t v26 = a4;
        uint64_t v27 = 2;
LABEL_38:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinFrames:v26 As:v27];
        goto LABEL_48;
      case 23:
        int64_t v28 = a4;
        uint64_t v29 = 2;
LABEL_40:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinRetries:v28 As:v29];
        goto LABEL_48;
      case 24:
        int64_t v30 = a4;
        uint64_t v31 = 2;
LABEL_42:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinMpduDensity:v30 As:v31];
        goto LABEL_48;
      case 25:
        int64_t v32 = a4;
        uint64_t v33 = 2;
LABEL_44:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinQueuedAmpdu:v32 As:v33];
        goto LABEL_48;
      case 26:
        int64_t v34 = a4;
        uint64_t v35 = 2;
LABEL_46:
        uint64_t v8 = +[WiFiUsageLQMTransformations getBinDesense:v34 As:v35];
        goto LABEL_48;
      case 27:
        uint64_t v8 = +[WiFiUsageLQMTransformations getLabelTrafficState:a4];
        goto LABEL_48;
      default:
        uint64_t v9 = 0;
        goto LABEL_49;
    }
  }
  uint64_t v8 = [NSNumber numberWithLong:a4];
LABEL_48:
  uint64_t v9 = (void *)v8;
LABEL_49:

  return v9;
}

+ (id)featureFromFieldName:(id)a3
{
  return @"median";
}

@end