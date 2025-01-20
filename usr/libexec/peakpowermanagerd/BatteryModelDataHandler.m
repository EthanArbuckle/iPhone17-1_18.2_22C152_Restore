@interface BatteryModelDataHandler
+ (id)sharedInstance;
- (BOOL)getBatteryModelDataFromKernel;
- (BOOL)getPPMDebugDict:(const __CFDictionary *)a3;
- (BOOL)moveBatteryModelDataFromDiskToKext:(unsigned int)a3;
- (BOOL)setBatteryModelDataToDisk;
- (BOOL)setBatteryModelDataToKernel:(id)a3;
- (BOOL)verifyHashData:(char *)a3;
- (BatteryModelDataHandler)init;
- (NSUserDefaults)defaults;
- (OS_os_log)log;
- (id)createKextModelFromProtobufModel:(id)a3;
- (id)getBatteryModelFileURLString:(unsigned int)a3;
- (id)getDeviceType;
- (id)loadProtobufModelWithFileName:(id)a3;
- (int)getIntValueForKeyFromBatteryData:(id)a3;
- (unsigned)getBatteryChemID;
- (void)setDefaults:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation BatteryModelDataHandler

- (BatteryModelDataHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)BatteryModelDataHandler;
  v2 = [(BatteryModelDataHandler *)&v8 init];
  if (v2)
  {
    v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.peakpowermanagerd"];
    defaults = v2->_defaults;
    v2->_defaults = v3;

    os_log_t v5 = os_log_create("com.apple.peakpowermanagerd", "batteryModelDataHandling");
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10001E1F0 != -1) {
    dispatch_once(&qword_10001E1F0, &stru_100018328);
  }
  v2 = (void *)qword_10001E1E8;

  return v2;
}

- (int)getIntValueForKeyFromBatteryData:(id)a3
{
  id v4 = a3;
  int valuePtr = 0;
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000102BC(log, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_12;
  }
  CFDictionaryRef v5 = IOServiceMatching("AppleSmartBattery");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if (!MatchingService)
  {
    sleep(0);
    v11 = self->_log;
    int v10 = 0;
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    sub_100010334(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_12:
    int v10 = 0;
    goto LABEL_10;
  }
  CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, @"BatteryData", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    sleep(0);
    v19 = self->_log;
    int v10 = 0;
    if (!os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    sub_1000103AC(v19, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_12;
  }
  CFDictionaryRef v8 = CFProperty;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, v4);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  }
  else
  {
    v36 = self->_log;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR)) {
      sub_100010424(v36, v37, v38, v39, v40, v41, v42, v43);
    }
  }
  CFRelease(v8);
  int v10 = valuePtr;
LABEL_10:

  return v10;
}

- (unsigned)getBatteryChemID
{
  unsigned int v3 = [(BatteryModelDataHandler *)self getIntValueForKeyFromBatteryData:@"AlgoChemID"];
  if (v3 == 6439) {
    uint64_t v4 = 8552;
  }
  else {
    uint64_t v4 = v3;
  }
  [(NSUserDefaults *)self->_defaults setInteger:v4 forKey:@"savedChemID"];
  return v4;
}

- (id)getDeviceType
{
  size_t size = 0;
  int v3 = sysctlbyname("hw.targettype", 0, &size, 0, 0);
  if (v3)
  {
    int v10 = v3;
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000105D0(v10, log);
    }
    goto LABEL_15;
  }
  uint64_t v4 = malloc_type_malloc(size, 0x100004077774924uLL);
  if (!v4)
  {
    uint64_t v12 = self->_log;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_10001049C((os_log_t)v12);
    }
LABEL_15:
    CFDictionaryRef v8 = 0;
    goto LABEL_8;
  }
  CFDictionaryRef v5 = v4;
  int v6 = sysctlbyname("hw.targettype", v4, &size, 0, 0);
  v7 = self->_log;
  if (v6)
  {
    int v13 = v6;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100010558(v13, v7);
    }
    CFDictionaryRef v8 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000104E0((uint64_t)v5, v7);
    }
    CFDictionaryRef v8 = +[NSString stringWithUTF8String:v5];
  }
  free(v5);
LABEL_8:

  return v8;
}

- (id)getBatteryModelFileURLString:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  CFDictionaryRef v5 = +[NSFileManager defaultManager];
  int v6 = [(BatteryModelDataHandler *)self getDeviceType];
  if (v6)
  {
    id v30 = 0;
    v7 = [v5 URLForDirectory:5 inDomain:8 appropriateForURL:0 create:0 error:&v30];
    id v8 = v30;
    if (v7)
    {
      v9 = +[NSString stringWithFormat:@"PPM/BatteryModels/%@/%x.rcmodel", v6, v3];
      int v10 = [v7 URLByAppendingPathComponent:v9];

      id v11 = v10;
      uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v11 fileSystemRepresentation]);
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000107B8();
      }
      if (([v5 fileExistsAtPath:v12] & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_100010738();
        }

        uint64_t v12 = 0;
      }
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_1000106C0(log, v23, v24, v25, v26, v27, v28, v29);
      }
      uint64_t v12 = 0;
      id v11 = 0;
    }
  }
  else
  {
    uint64_t v14 = self->_log;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_100010648(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    uint64_t v12 = 0;
    id v11 = 0;
    id v8 = 0;
  }

  return v12;
}

- (id)loadProtobufModelWithFileName:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100010838(log, v12, v13, v14, v15, v16, v17, v18);
    }
    v9 = 0;
    CFDictionaryRef v5 = 0;
    goto LABEL_9;
  }
  id v30 = 0;
  CFDictionaryRef v5 = +[PBStreamReader readProtoBuffersOfClass:objc_opt_class() fromFile:v4 error:&v30];
  id v6 = v30;
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = [v5 firstObject];
    if (v8)
    {
      v9 = (void *)v8;
    }
    else
    {
      uint64_t v22 = self->_log;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
        sub_100010960(v22, v23, v24, v25, v26, v27, v28, v29);
      }
      v9 = 0;
    }
LABEL_9:
    uint64_t v19 = 0;
    goto LABEL_10;
  }
  uint64_t v19 = v6;
  uint64_t v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_1000108B0(v20, v19);
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)createKextModelFromProtobufModel:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000109D8(log, v90, v91, v92, v93, v94, v95, v96);
    }
    goto LABEL_13;
  }
  id v5 = +[NSMutableData dataWithLength:39912];
  id v6 = [v5 mutableBytes];
  if (!v6)
  {
    v97 = self->_log;
    if (os_log_type_enabled((os_log_t)v97, OS_LOG_TYPE_ERROR)) {
      sub_100010A50(v97, v98, v99, v100, v101, v102, v103, v104);
    }

LABEL_13:
    id v5 = 0;
    goto LABEL_5;
  }
  BOOL v7 = v6;
  uint64_t v8 = (float *)(v6 + 9205);
  *id v6 = [v4 chemID];
  [v4 maxRdcRatio];
  *((_DWORD *)v8 + 513) = v9;
  [v4 maxRdcRatioR2Extrap];
  *((_DWORD *)v8 + 514) = v10;
  [v4 maxRdcR25Ratio];
  *((_DWORD *)v8 + 515) = v11;
  [v4 baselineWRdc];
  *(_DWORD *)uint64_t v8 = v12;
  *((_DWORD *)v8 + 516) = [v4 mLBConfig];
  uint64_t v13 = [v4 bmuResistance];
  sub_10000F260(v7 + 4591, v13);

  uint64_t v14 = (long long *)[v4 baselineRdcs];
  long long v16 = v14[1];
  long long v15 = v14[2];
  long long v17 = *v14;
  *(_OWORD *)(v7 + 9201) = *(long long *)((char *)v14 + 44);
  *(_OWORD *)(v7 + 9194) = v16;
  *(_OWORD *)(v7 + 9198) = v15;
  *(_OWORD *)(v7 + 9190) = v17;
  memcpy(v7 + 9206, [v4 gridOCVs], 0x4BCuLL);
  uint64_t v18 = [v4 qmaxs];
  int v19 = v18[4];
  *(_OWORD *)(v7 + 9509) = *(_OWORD *)v18;
  v7[9513] = v19;
  uint64_t v20 = [v4 r0];
  sub_10000F1BC(v7 + 1, v20);

  uint64_t v21 = [v4 r1];
  sub_10000F1BC((_OWORD *)v7 + 64, v21);

  uint64_t v22 = [v4 r2];
  sub_10000F1BC(v7 + 511, v22);

  uint64_t v23 = [v4 r3];
  sub_10000F1BC(v7 + 766, v23);

  uint64_t v24 = [v4 rdc];
  sub_10000F1BC(v7 + 1021, v24);

  uint64_t v25 = [v4 baselineR0];
  sub_10000F1BC((_OWORD *)v7 + 574, v25);

  uint64_t v26 = [v4 baselineR1];
  sub_10000F1BC(v7 + 2551, v26);

  uint64_t v27 = [v4 baselineR2];
  sub_10000F1BC(v7 + 2806, v27);

  uint64_t v28 = [v4 baselineR3];
  sub_10000F1BC(v7 + 3061, v28);

  uint64_t v29 = [v4 baselineR4];
  sub_10000F1BC((_OWORD *)v7 + 829, v29);

  id v30 = [v4 rCFreq1];
  sub_10000F1BC((_OWORD *)v7 + 319, v30);

  uint64_t v31 = [v4 rCFreq2];
  sub_10000F1BC(v7 + 1531, v31);

  uint64_t v32 = [v4 rCFreq3];
  sub_10000F1BC(v7 + 1786, v32);

  uint64_t v33 = [v4 rCFreq4];
  sub_10000F1BC(v7 + 2041, v33);

  uint64_t v34 = [v4 baselineRCFreq1];
  sub_10000F1BC(v7 + 3571, v34);

  uint64_t v35 = [v4 baselineRCFreq2];
  sub_10000F1BC(v7 + 3826, v35);

  v36 = [v4 baselineRCFreq3];
  sub_10000F1BC(v7 + 4081, v36);

  uint64_t v37 = [v4 baselineRCFreq4];
  sub_10000F1BC((_OWORD *)v7 + 1084, v37);

  memcpy(v7 + 4600, [v4 agingCoeffForR0s], 0x198uLL);
  memcpy(v7 + 4702, [v4 agingCoeffForR1s], 0x198uLL);
  memcpy(v7 + 4804, [v4 agingCoeffForR2s], 0x198uLL);
  memcpy(v7 + 4906, [v4 agingCoeffForR3s], 0x198uLL);
  memcpy(v7 + 5008, [v4 agingCoeffForRdcs], 0x198uLL);
  memcpy(v7 + 5110, [v4 agingCoeffForR0TemperatureCoeffs], 0x660uLL);
  memcpy(v7 + 5518, [v4 agingCoeffForR1TemperatureCoeffs], 0x660uLL);
  memcpy(v7 + 5926, [v4 agingCoeffForR2TemperatureCoeffs], 0x660uLL);
  memcpy(v7 + 6334, [v4 agingCoeffForR3TemperatureCoeffs], 0x660uLL);
  memcpy(v7 + 6742, [v4 agingCoeffForRdcTemperatureCoeffs], 0x660uLL);
  memcpy(v7 + 7150, [v4 agingCoeffForRCFreq1s], 0x198uLL);
  memcpy(v7 + 7252, [v4 agingCoeffForRCFreq2s], 0x198uLL);
  memcpy(v7 + 7354, [v4 agingCoeffForRCFreq3s], 0x198uLL);
  memcpy(v7 + 7456, [v4 agingCoeffForRCFreq4s], 0x198uLL);
  memcpy(v7 + 7558, [v4 agingCoeffForRCFreq1TemperatureCoeffs], 0x660uLL);
  memcpy(v7 + 7966, [v4 agingCoeffForRCFreq2TemperatureCoeffs], 0x660uLL);
  memcpy(v7 + 8374, [v4 agingCoeffForRCFreq3TemperatureCoeffs], 0x660uLL);
  memcpy(v7 + 8782, [v4 agingCoeffForRCFreq4TemperatureCoeffs], 0x660uLL);
  uint64_t v38 = [v4 slopeForR0Extraps];
  *(_OWORD *)(v7 + 9514) = *v38;
  long long v39 = v38[4];
  long long v41 = v38[1];
  long long v40 = v38[2];
  *(_OWORD *)(v7 + 9526) = v38[3];
  *(_OWORD *)(v7 + 9530) = v39;
  *(_OWORD *)(v7 + 9518) = v41;
  *(_OWORD *)(v7 + 9522) = v40;
  long long v42 = v38[8];
  long long v44 = v38[5];
  long long v43 = v38[6];
  *(_OWORD *)(v7 + 9542) = v38[7];
  *(_OWORD *)(v7 + 9546) = v42;
  *(_OWORD *)(v7 + 9534) = v44;
  *(_OWORD *)(v7 + 9538) = v43;
  long long v46 = v38[10];
  long long v45 = v38[11];
  long long v47 = v38[9];
  *(_OWORD *)(v7 + 9561) = *(_OWORD *)((char *)v38 + 188);
  *(_OWORD *)(v7 + 9554) = v46;
  *(_OWORD *)(v7 + 9558) = v45;
  *(_OWORD *)(v7 + 9550) = v47;
  v48 = [v4 slopeForR1Extraps];
  *(_OWORD *)(v7 + 9565) = *v48;
  long long v49 = v48[4];
  long long v51 = v48[1];
  long long v50 = v48[2];
  *(_OWORD *)(v7 + 9577) = v48[3];
  *(_OWORD *)(v7 + 9581) = v49;
  *(_OWORD *)(v7 + 9569) = v51;
  *(_OWORD *)(v7 + 9573) = v50;
  long long v52 = v48[8];
  long long v54 = v48[5];
  long long v53 = v48[6];
  *(_OWORD *)(v7 + 9593) = v48[7];
  *(_OWORD *)(v7 + 9597) = v52;
  *(_OWORD *)(v7 + 9585) = v54;
  *(_OWORD *)(v7 + 9589) = v53;
  long long v56 = v48[10];
  long long v55 = v48[11];
  long long v57 = v48[9];
  *((_OWORD *)v7 + 2403) = *(_OWORD *)((char *)v48 + 188);
  *(_OWORD *)(v7 + 9605) = v56;
  *(_OWORD *)(v7 + 9609) = v55;
  *(_OWORD *)(v7 + 9601) = v57;
  v58 = [v4 slopeForR2Extraps];
  *((_OWORD *)v7 + 2404) = *v58;
  long long v59 = v58[3];
  long long v60 = v58[4];
  long long v61 = v58[2];
  *((_OWORD *)v7 + 2405) = v58[1];
  *((_OWORD *)v7 + 2408) = v60;
  *((_OWORD *)v7 + 2407) = v59;
  *((_OWORD *)v7 + 2406) = v61;
  long long v62 = v58[7];
  long long v63 = v58[8];
  long long v64 = v58[6];
  *((_OWORD *)v7 + 2409) = v58[5];
  *((_OWORD *)v7 + 2412) = v63;
  *((_OWORD *)v7 + 2411) = v62;
  *((_OWORD *)v7 + 2410) = v64;
  long long v66 = v58[10];
  long long v65 = v58[11];
  long long v67 = *(_OWORD *)((char *)v58 + 188);
  *((_OWORD *)v7 + 2413) = v58[9];
  *(_OWORD *)(v7 + 9663) = v67;
  *((_OWORD *)v7 + 2415) = v65;
  *((_OWORD *)v7 + 2414) = v66;
  v68 = [v4 slopeForR3Extraps];
  *(_OWORD *)(v7 + 9667) = *v68;
  long long v69 = v68[4];
  long long v71 = v68[1];
  long long v70 = v68[2];
  *(_OWORD *)(v7 + 9679) = v68[3];
  *(_OWORD *)(v7 + 9683) = v69;
  *(_OWORD *)(v7 + 9671) = v71;
  *(_OWORD *)(v7 + 9675) = v70;
  long long v72 = v68[8];
  long long v74 = v68[5];
  long long v73 = v68[6];
  *(_OWORD *)(v7 + 9695) = v68[7];
  *(_OWORD *)(v7 + 9699) = v72;
  *(_OWORD *)(v7 + 9687) = v74;
  *(_OWORD *)(v7 + 9691) = v73;
  long long v76 = v68[10];
  long long v75 = v68[11];
  long long v77 = v68[9];
  *(_OWORD *)(v7 + 9714) = *(_OWORD *)((char *)v68 + 188);
  *(_OWORD *)(v7 + 9707) = v76;
  *(_OWORD *)(v7 + 9711) = v75;
  *(_OWORD *)(v7 + 9703) = v77;
  [v4 wRdcRatioThresh];
  v8[517] = v78;
  if (v78 != 0.0)
  {
    v79 = [v4 coeffSOCs];
    long long v81 = v79[1];
    long long v80 = v79[2];
    *((_OWORD *)v7 + 2432) = *v79;
    *((_OWORD *)v7 + 2433) = v81;
    *((_OWORD *)v7 + 2434) = v80;
    long long v83 = v79[4];
    long long v82 = v79[5];
    int v84 = *((_DWORD *)v79 + 24);
    *((_OWORD *)v7 + 2435) = v79[3];
    v7[9752] = v84;
    *((_OWORD *)v7 + 2437) = v82;
    *((_OWORD *)v7 + 2436) = v83;
    memcpy(v7 + 9753, [v4 coeffVs], 0x384uLL);
    v85 = v7 + 9723;
    v86 = [v4 gridWRdcRatios];
    int v87 = v86[4];
    *(_OWORD *)v85 = *(_OWORD *)v86;
    v85[4] = v87;
  }
LABEL_5:

  return v5;
}

- (BOOL)moveBatteryModelDataFromDiskToKext:(unsigned int)a3
{
  id v4 = [(BatteryModelDataHandler *)self getBatteryModelFileURLString:*(void *)&a3];
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100010AC8((os_log_t)log);
    }
    goto LABEL_11;
  }
  uint64_t v5 = [(BatteryModelDataHandler *)self loadProtobufModelWithFileName:v4];
  if (!v5)
  {
    int v12 = self->_log;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_100010B58(v12, v13, v14, v15, v16, v17, v18, v19);
    }
LABEL_11:
    uint64_t v8 = 0;
    id v6 = 0;
LABEL_17:
    BOOL v9 = 0;
    goto LABEL_6;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(BatteryModelDataHandler *)self createKextModelFromProtobufModel:v5];
  if (!v7)
  {
    uint64_t v20 = self->_log;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
      sub_100010BD0(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    uint64_t v8 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = (void *)v7;
  if (![(BatteryModelDataHandler *)self setBatteryModelDataToKernel:v7])
  {
    uint64_t v28 = self->_log;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
      sub_100010C48(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_17;
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (BOOL)setBatteryModelDataToKernel:(id)a3
{
  io_connect_t connect = 0;
  *(_OWORD *)md = 0u;
  long long v37 = 0u;
  id v4 = [a3 bytes];
  if (v4)
  {
    uint64_t v5 = v4;
    CC_SHA256_Init(&v34);
    CC_SHA256_Update(&v34, v5, 0x9BE8u);
    CC_SHA256_Final(md, &v34);
    CFDictionaryRef v6 = IOServiceMatching("ApplePPM");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (MatchingService)
    {
      if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_100010EA8();
        }
      }
      else if (IOConnectCallStructMethod(connect, 0x18u, v5, 0x9BE8uLL, 0, 0))
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_100010E28();
        }
      }
      else
      {
        if ([(BatteryModelDataHandler *)self verifyHashData:md])
        {
          BOOL v8 = 1;
          goto LABEL_7;
        }
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
          sub_100010DB0(log, v27, v28, v29, v30, v31, v32, v33);
        }
      }
    }
    else
    {
      uint64_t v18 = self->_log;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
        sub_100010D38(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
  else
  {
    int v10 = self->_log;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_100010CC0(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  BOOL v8 = 0;
LABEL_7:
  if (connect) {
    IOServiceClose(connect);
  }
  return v8;
}

- (BOOL)getPPMDebugDict:(const __CFDictionary *)a3
{
  CFDictionaryRef v4 = IOServiceMatching("ApplePPM");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (!MatchingService) {
    return 0;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"PPMVector", kCFAllocatorDefault, 0);
  CFTypeID v7 = CFGetTypeID(CFProperty);
  BOOL v8 = v7 == CFDictionaryGetTypeID();
  if (v8) {
    *a3 = CFDictionaryCreateCopy(kCFAllocatorDefault, (CFDictionaryRef)CFProperty);
  }
  CFRelease(CFProperty);
  return v8;
}

- (BOOL)verifyHashData:(char *)a3
{
  CFDictionaryRef theDict = 0;
  *(_OWORD *)buffer = 0u;
  long long v41 = 0u;
  BOOL v5 = [(BatteryModelDataHandler *)self getPPMDebugDict:&theDict];
  if (theDict)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"PPMBatteryModel");
    if (Value)
    {
      CFDataRef v7 = (const __CFData *)CFDictionaryGetValue(Value, @"RCParamsHash");
      if (v7)
      {
        CFDataRef v8 = v7;
        v42.length = CFDataGetLength(v7);
        v42.location = 0;
        CFDataGetBytes(v8, v42, buffer);
        if (*(void *)a3 == *(void *)buffer
          && *((void *)a3 + 1) == *(void *)&buffer[8]
          && *((void *)a3 + 2) == (void)v41
          && *((void *)a3 + 3) == *((void *)&v41 + 1))
        {
          BOOL v5 = 1;
          goto LABEL_16;
        }
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
          sub_100011090((unsigned __int8 *)a3, buffer, (os_log_t)log);
        }
      }
      else
      {
        uint64_t v29 = self->_log;
        if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR)) {
          sub_100011018(v29, v30, v31, v32, v33, v34, v35, v36);
        }
      }
    }
    else
    {
      uint64_t v21 = self->_log;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
        sub_100010FA0(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v13 = self->_log;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_100010F28(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
LABEL_16:
  if (theDict) {
    CFRelease(theDict);
  }
  return v5;
}

- (BOOL)setBatteryModelDataToDisk
{
  return 1;
}

- (BOOL)getBatteryModelDataFromKernel
{
  return 1;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end