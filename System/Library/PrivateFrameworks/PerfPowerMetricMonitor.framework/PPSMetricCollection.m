@interface PPSMetricCollection
+ (BOOL)supportsSecureCoding;
+ (id)_metricSamplePropertyKeys;
+ (id)allPropertyKeys;
- (BOOL)isSystemPowerAvailableWhileCharging;
- (NSMutableDictionary)processMetrics;
- (NSNumber)sampleTime;
- (PPSMetricCollection)init;
- (PPSMetricCollection)initWithCoder:(id)a3;
- (PPSMetricSample)aneDCSBytes;
- (PPSMetricSample)aneEnergy;
- (PPSMetricSample)aneFabricBytes;
- (PPSMetricSample)anePower;
- (PPSMetricSample)batteryPower;
- (PPSMetricSample)batteryTemperature;
- (PPSMetricSample)cellularPower;
- (PPSMetricSample)chargingRate;
- (PPSMetricSample)cpuEnergy;
- (PPSMetricSample)cpuPower;
- (PPSMetricSample)dcInputPower;
- (PPSMetricSample)dcsEnergy;
- (PPSMetricSample)displayAPL;
- (PPSMetricSample)displayCost;
- (PPSMetricSample)displayFPS;
- (PPSMetricSample)displayPower;
- (PPSMetricSample)dramBytes;
- (PPSMetricSample)dramEnergy;
- (PPSMetricSample)dramPower;
- (PPSMetricSample)gpuEnergy;
- (PPSMetricSample)gpuPower;
- (PPSMetricSample)gpuSRAMEnergy;
- (PPSMetricSample)otherSocPower;
- (PPSMetricSample)pcieEnergy;
- (PPSMetricSample)skinTemperature;
- (PPSMetricSample)systemLoadPower;
- (PPSMetricSample)wifiAWDLRange;
- (PPSMetricSample)wifiAWDLStatus;
- (PPSMetricSample)wifiPower;
- (id)_stringFromInducedThermalPressure:(int64_t)a3;
- (id)_stringFromThermalPressure:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)inducedThermalPressure;
- (int64_t)thermalPressure;
- (void)combineWithMetricCollection:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAneDCSBytes:(id)a3;
- (void)setAneEnergy:(id)a3;
- (void)setAneFabricBytes:(id)a3;
- (void)setAnePower:(id)a3;
- (void)setBatteryPower:(id)a3;
- (void)setBatteryTemperature:(id)a3;
- (void)setCellularPower:(id)a3;
- (void)setChargingRate:(id)a3;
- (void)setCpuEnergy:(id)a3;
- (void)setCpuPower:(id)a3;
- (void)setDcInputPower:(id)a3;
- (void)setDcsEnergy:(id)a3;
- (void)setDisplayAPL:(id)a3;
- (void)setDisplayCost:(id)a3;
- (void)setDisplayFPS:(id)a3;
- (void)setDisplayPower:(id)a3;
- (void)setDramBytes:(id)a3;
- (void)setDramEnergy:(id)a3;
- (void)setDramPower:(id)a3;
- (void)setGpuEnergy:(id)a3;
- (void)setGpuPower:(id)a3;
- (void)setGpuSRAMEnergy:(id)a3;
- (void)setInducedThermalPressure:(int64_t)a3;
- (void)setIsSystemPowerAvailableWhileCharging:(BOOL)a3;
- (void)setOtherSocPower:(id)a3;
- (void)setPcieEnergy:(id)a3;
- (void)setProcessMetrics:(id)a3;
- (void)setSampleTime:(id)a3;
- (void)setSkinTemperature:(id)a3;
- (void)setSystemLoadPower:(id)a3;
- (void)setThermalPressure:(int64_t)a3;
- (void)setWifiAWDLRange:(id)a3;
- (void)setWifiAWDLStatus:(id)a3;
- (void)setWifiPower:(id)a3;
- (void)updateMetrics:(id)a3 forPid:(id)a4;
@end

@implementation PPSMetricCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allPropertyKeys
{
  if (allPropertyKeys_onceToken != -1) {
    dispatch_once(&allPropertyKeys_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)allPropertyKeys_keys;
  return v2;
}

void __38__PPSMetricCollection_allPropertyKeys__block_invoke()
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = +[PPSMetricCollection _metricSamplePropertyKeys];
  v1 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"isSystemPowerAvailableWhileCharging";
  v6[1] = @"thermalPressure";
  v6[2] = @"inducedThermalPressure";
  v6[3] = @"sampleTime";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v3 = [v1 setWithArray:v2];
  uint64_t v4 = [v0 setByAddingObjectsFromSet:v3];
  v5 = (void *)allPropertyKeys_keys;
  allPropertyKeys_keys = v4;
}

+ (id)_metricSamplePropertyKeys
{
  if (_metricSamplePropertyKeys_onceToken != -1) {
    dispatch_once(&_metricSamplePropertyKeys_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)_metricSamplePropertyKeys_keys;
  return v2;
}

uint64_t __48__PPSMetricCollection__metricSamplePropertyKeys__block_invoke()
{
  _metricSamplePropertyKeys_keys = [MEMORY[0x263EFFA08] setWithArray:&unk_2706F7D08];
  return MEMORY[0x270F9A758]();
}

- (PPSMetricCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPSMetricCollection;
  v2 = [(PPSMetricCollection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    processMetrics = v2->_processMetrics;
    v2->_processMetrics = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (PPSMetricCollection)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PPSMetricCollection;
  v5 = [(PPSMetricCollection *)&v28 init];
  if (v5)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    objc_super v6 = +[PPSMetricCollection _metricSamplePropertyKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
          v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v11];
          [(PPSMetricCollection *)v5 setValue:v12 forKey:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isSystemPowerAvailableWhileCharging"];
    v5->_isSystemPowerAvailableWhileCharging = [v13 BOOLValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thermalPressure"];
    v5->_thermalPressure = (int)[v14 intValue];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inducedThermalPressure"];
    v5->_inducedThermalPressure = (int)[v15 intValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sampleTime"];
    sampleTime = v5->_sampleTime;
    v5->_sampleTime = (NSNumber *)v16;

    v18 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    v19 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    v20 = [v4 decodeDictionaryWithKeysOfClasses:v18 objectsOfClasses:v19 forKey:@"processMetrics"];
    uint64_t v21 = [v20 mutableCopy];
    processMetrics = v5->_processMetrics;
    v5->_processMetrics = (NSMutableDictionary *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = +[PPSMetricCollection _metricSamplePropertyKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [(PPSMetricCollection *)self valueForKey:v10];
        [v4 encodeObject:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PPSMetricCollection isSystemPowerAvailableWhileCharging](self, "isSystemPowerAvailableWhileCharging"));
  [v4 encodeObject:v12 forKey:@"isSystemPowerAvailableWhileCharging"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[PPSMetricCollection thermalPressure](self, "thermalPressure"));
  [v4 encodeObject:v13 forKey:@"thermalPressure"];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[PPSMetricCollection inducedThermalPressure](self, "inducedThermalPressure"));
  [v4 encodeObject:v14 forKey:@"inducedThermalPressure"];

  v15 = [(PPSMetricCollection *)self sampleTime];
  [v4 encodeObject:v15 forKey:@"sampleTime"];

  uint64_t v16 = [(PPSMetricCollection *)self processMetrics];
  [v4 encodeObject:v16 forKey:@"processMetrics"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = [+[PPSMetricCollection allocWithZone:](PPSMetricCollection, "allocWithZone:") init];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = +[PPSMetricCollection _metricSamplePropertyKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = [(PPSMetricCollection *)self valueForKey:v11];
        v13 = (void *)[v12 copyWithZone:a3];
        [(PPSMetricCollection *)v5 setValue:v13 forKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v5->_isSystemPowerAvailableWhileCharging = self->_isSystemPowerAvailableWhileCharging;
  v5->_thermalPressure = self->_thermalPressure;
  v5->_inducedThermalPressure = self->_inducedThermalPressure;
  objc_storeStrong((id *)&v5->_sampleTime, self->_sampleTime);
  uint64_t v14 = [(NSMutableDictionary *)self->_processMetrics copyWithZone:a3];
  processMetrics = v5->_processMetrics;
  v5->_processMetrics = (NSMutableDictionary *)v14;

  return v5;
}

- (id)description
{
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x3032000000;
  v131 = __Block_byref_object_copy__0;
  v132 = __Block_byref_object_dispose__0;
  id v133 = 0;
  v55 = NSString;
  v126 = [(PPSMetricCollection *)self systemLoadPower];
  v125 = [v126 value];
  [v125 doubleValue];
  uint64_t v54 = v3;
  v124 = [(PPSMetricCollection *)self systemLoadPower];
  v123 = [v124 timestamp];
  v93 = PPSTimeStringFromDate(v123);
  v122 = [(PPSMetricCollection *)self batteryPower];
  v121 = [v122 value];
  [v121 doubleValue];
  uint64_t v53 = v4;
  v120 = [(PPSMetricCollection *)self batteryPower];
  v119 = [v120 timestamp];
  v91 = PPSTimeStringFromDate(v119);
  v118 = [(PPSMetricCollection *)self dcInputPower];
  v117 = [v118 value];
  [v117 doubleValue];
  uint64_t v52 = v5;
  v116 = [(PPSMetricCollection *)self dcInputPower];
  v115 = [v116 timestamp];
  v90 = PPSTimeStringFromDate(v115);
  v114 = [(PPSMetricCollection *)self cpuPower];
  v113 = [v114 value];
  [v113 doubleValue];
  uint64_t v51 = v6;
  v112 = [(PPSMetricCollection *)self cpuPower];
  v111 = [v112 timestamp];
  v89 = PPSTimeStringFromDate(v111);
  v110 = [(PPSMetricCollection *)self gpuPower];
  v109 = [v110 value];
  [v109 doubleValue];
  uint64_t v50 = v7;
  v108 = [(PPSMetricCollection *)self gpuPower];
  v107 = [v108 timestamp];
  v80 = PPSTimeStringFromDate(v107);
  v106 = [(PPSMetricCollection *)self dramPower];
  v105 = [v106 value];
  [v105 doubleValue];
  uint64_t v49 = v8;
  v104 = [(PPSMetricCollection *)self dramPower];
  v103 = [v104 timestamp];
  v79 = PPSTimeStringFromDate(v103);
  v102 = [(PPSMetricCollection *)self otherSocPower];
  v101 = [v102 value];
  [v101 doubleValue];
  uint64_t v48 = v9;
  v100 = [(PPSMetricCollection *)self otherSocPower];
  v99 = [v100 timestamp];
  v77 = PPSTimeStringFromDate(v99);
  v98 = [(PPSMetricCollection *)self wifiPower];
  v97 = [v98 value];
  [v97 doubleValue];
  uint64_t v11 = v10;
  v96 = [(PPSMetricCollection *)self wifiPower];
  v95 = [v96 timestamp];
  v76 = PPSTimeStringFromDate(v95);
  v94 = [(PPSMetricCollection *)self cellularPower];
  v92 = [v94 value];
  [v92 doubleValue];
  uint64_t v13 = v12;
  v88 = [(PPSMetricCollection *)self cellularPower];
  v87 = [v88 timestamp];
  v68 = PPSTimeStringFromDate(v87);
  v86 = [(PPSMetricCollection *)self displayPower];
  v85 = [v86 value];
  [v85 doubleValue];
  uint64_t v15 = v14;
  v84 = [(PPSMetricCollection *)self displayPower];
  v83 = [v84 timestamp];
  v67 = PPSTimeStringFromDate(v83);
  v82 = [(PPSMetricCollection *)self chargingRate];
  v81 = [v82 value];
  uint64_t v47 = [v81 intValue];
  v78 = [(PPSMetricCollection *)self chargingRate];
  v75 = [v78 timestamp];
  v65 = PPSTimeStringFromDate(v75);
  BOOL v16 = [(PPSMetricCollection *)self isSystemPowerAvailableWhileCharging];
  long long v17 = "NO";
  if (v16) {
    long long v17 = "YES";
  }
  v46 = v17;
  v74 = [(PPSMetricCollection *)self batteryTemperature];
  v73 = [v74 value];
  [v73 doubleValue];
  uint64_t v19 = v18;
  v72 = [(PPSMetricCollection *)self batteryTemperature];
  v71 = [v72 timestamp];
  v64 = PPSTimeStringFromDate(v71);
  v70 = [(PPSMetricCollection *)self skinTemperature];
  v69 = [v70 value];
  [v69 doubleValue];
  uint64_t v21 = v20;
  v66 = [(PPSMetricCollection *)self skinTemperature];
  v63 = [v66 timestamp];
  v59 = PPSTimeStringFromDate(v63);
  id v43 = [(PPSMetricCollection *)self _stringFromThermalPressure:[(PPSMetricCollection *)self thermalPressure]];
  uint64_t v45 = [v43 UTF8String];
  id v42 = [(PPSMetricCollection *)self _stringFromInducedThermalPressure:[(PPSMetricCollection *)self inducedThermalPressure]];
  uint64_t v44 = [v42 UTF8String];
  v62 = [(PPSMetricCollection *)self displayAPL];
  v61 = [v62 value];
  [v61 doubleValue];
  uint64_t v23 = v22;
  v60 = [(PPSMetricCollection *)self displayAPL];
  v58 = [v60 timestamp];
  v57 = PPSTimeStringFromDate(v58);
  v56 = [(PPSMetricCollection *)self displayCost];
  long long v24 = [v56 value];
  [v24 doubleValue];
  uint64_t v26 = v25;
  long long v27 = [(PPSMetricCollection *)self displayCost];
  objc_super v28 = [v27 timestamp];
  v29 = PPSTimeStringFromDate(v28);
  uint64_t v30 = [(PPSMetricCollection *)self displayFPS];
  v31 = [v30 value];
  [v31 doubleValue];
  uint64_t v33 = v32;
  v34 = [(PPSMetricCollection *)self displayFPS];
  v35 = [v34 timestamp];
  v36 = PPSTimeStringFromDate(v35);
  objc_msgSend(v55, "stringWithFormat:", @"------------------ Power -------------------\nSystem Load        %8.3f W   %@\nBattery            %8.3f W   %@\nDC Input           %8.3f W   %@\n\nCPU                %8.3f W   %@\nGPU                %8.3f W   %@\nDRAM               %8.3f W   %@\nOther SoC          %8.3f W   %@\nWiFi               %8.3f W   %@\nCellular           %8.3f W   %@\nDisplay            %8.3f W   %@\n\nCharging Rate      %8d mA  %@\n\nSystem Power Available While Charging: %s\n\n----------------- Thermal ------------------\nBattery            %8.3f °C  %@\nSkin               %8.3f °C  %@\n\nThermal Pressure   %8s\nInduced Pressure   %8s\n\n----------------- Display ------------------\nDisplay APL        %8.3f     %@\nDisplay Cost       %8.3f     %@\nDisplay Avg FPS    %8.3f     %@", v54, v93, v53, v91, v52, v90, v51, v89, v50, v80, v49, v79, v48, v77, v11, v76,
    v13,
    v68,
    v15,
    v67,
    v47,
    v65,
    v46,
    v19,
    v64,
    v21,
    v59,
    v45,
    v44,
    v23,
    v57,
    v26,
    v29,
    v33,
  uint64_t v37 = v36);
  v38 = (void *)v129[5];
  v129[5] = v37;

  v39 = [(PPSMetricCollection *)self processMetrics];
  v127[0] = MEMORY[0x263EF8330];
  v127[1] = 3221225472;
  v127[2] = __34__PPSMetricCollection_description__block_invoke;
  v127[3] = &unk_26543FDC8;
  v127[4] = &v128;
  [v39 enumerateKeysAndObjectsUsingBlock:v127];

  id v40 = (id)v129[5];
  _Block_object_dispose(&v128, 8);

  return v40;
}

void __34__PPSMetricCollection_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = a3;
  uint64_t v7 = [v5 stringByAppendingFormat:@"\n\n-------------- Process %-5d ---------------\n%@", objc_msgSend(a2, "intValue"), v6];

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)combineWithMetricCollection:(id)a3
{
  id v220 = a3;
  uint64_t v4 = [v220 sampleTime];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = [(PPSMetricCollection *)self sampleTime];

    if (v6)
    {
      uint64_t v7 = NSNumber;
      uint64_t v8 = [v220 sampleTime];
      [v8 doubleValue];
      double v10 = v9;
      uint64_t v11 = [(PPSMetricCollection *)self sampleTime];
      [v11 doubleValue];
      uint64_t v13 = [v7 numberWithDouble:v10 + v12];
      [(PPSMetricCollection *)self setSampleTime:v13];
    }
  }
  uint64_t v14 = [v220 cpuEnergy];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    BOOL v16 = [(PPSMetricCollection *)self cpuEnergy];

    if (v16)
    {
      long long v17 = NSNumber;
      uint64_t v18 = [(PPSMetricCollection *)self cpuEnergy];
      [v18 doubleValue];
      double v20 = v19;
      uint64_t v21 = [v220 cpuEnergy];
      [v21 doubleValue];
      uint64_t v23 = [v17 numberWithDouble:v20 + v22];
      long long v24 = [(PPSMetricCollection *)self cpuEnergy];
      uint64_t v25 = [v24 timestamp];
      uint64_t v26 = +[PPSMetricSample sampleWithValue:v23 timestamp:v25];
      [(PPSMetricCollection *)self setCpuEnergy:v26];
    }
  }
  uint64_t v27 = [v220 gpuEnergy];
  if (v27)
  {
    objc_super v28 = (void *)v27;
    v29 = [(PPSMetricCollection *)self gpuEnergy];

    if (v29)
    {
      uint64_t v30 = NSNumber;
      v31 = [(PPSMetricCollection *)self gpuEnergy];
      [v31 doubleValue];
      double v33 = v32;
      v34 = [v220 gpuEnergy];
      [v34 doubleValue];
      v36 = [v30 numberWithDouble:v33 + v35];
      uint64_t v37 = [(PPSMetricCollection *)self gpuEnergy];
      v38 = [v37 timestamp];
      v39 = +[PPSMetricSample sampleWithValue:v36 timestamp:v38];
      [(PPSMetricCollection *)self setGpuEnergy:v39];
    }
  }
  uint64_t v40 = [v220 gpuSRAMEnergy];
  if (v40)
  {
    v41 = (void *)v40;
    id v42 = [(PPSMetricCollection *)self gpuSRAMEnergy];

    if (v42)
    {
      id v43 = NSNumber;
      uint64_t v44 = [(PPSMetricCollection *)self gpuSRAMEnergy];
      [v44 doubleValue];
      double v46 = v45;
      uint64_t v47 = [v220 gpuSRAMEnergy];
      [v47 doubleValue];
      uint64_t v49 = [v43 numberWithDouble:v46 + v48];
      uint64_t v50 = [(PPSMetricCollection *)self gpuSRAMEnergy];
      uint64_t v51 = [v50 timestamp];
      uint64_t v52 = +[PPSMetricSample sampleWithValue:v49 timestamp:v51];
      [(PPSMetricCollection *)self setGpuSRAMEnergy:v52];
    }
  }
  uint64_t v53 = [v220 aneEnergy];
  if (v53)
  {
    uint64_t v54 = (void *)v53;
    v55 = [(PPSMetricCollection *)self aneEnergy];

    if (v55)
    {
      v56 = NSNumber;
      v57 = [(PPSMetricCollection *)self aneEnergy];
      [v57 doubleValue];
      double v59 = v58;
      v60 = [v220 aneEnergy];
      [v60 doubleValue];
      v62 = [v56 numberWithDouble:v59 + v61];
      v63 = [(PPSMetricCollection *)self aneEnergy];
      v64 = [v63 timestamp];
      v65 = +[PPSMetricSample sampleWithValue:v62 timestamp:v64];
      [(PPSMetricCollection *)self setAneEnergy:v65];
    }
  }
  uint64_t v66 = [v220 dcsEnergy];
  if (v66)
  {
    v67 = (void *)v66;
    v68 = [(PPSMetricCollection *)self dcsEnergy];

    if (v68)
    {
      v69 = NSNumber;
      v70 = [(PPSMetricCollection *)self dcsEnergy];
      [v70 doubleValue];
      double v72 = v71;
      v73 = [v220 dcsEnergy];
      [v73 doubleValue];
      v75 = [v69 numberWithDouble:v72 + v74];
      v76 = [(PPSMetricCollection *)self dcsEnergy];
      v77 = [v76 timestamp];
      v78 = +[PPSMetricSample sampleWithValue:v75 timestamp:v77];
      [(PPSMetricCollection *)self setDcsEnergy:v78];
    }
  }
  uint64_t v79 = [v220 dramEnergy];
  if (v79)
  {
    v80 = (void *)v79;
    v81 = [(PPSMetricCollection *)self dramEnergy];

    if (v81)
    {
      v82 = NSNumber;
      v83 = [(PPSMetricCollection *)self dramEnergy];
      [v83 doubleValue];
      double v85 = v84;
      v86 = [v220 dramEnergy];
      [v86 doubleValue];
      v88 = [v82 numberWithDouble:v85 + v87];
      v89 = [(PPSMetricCollection *)self dramEnergy];
      v90 = [v89 timestamp];
      v91 = +[PPSMetricSample sampleWithValue:v88 timestamp:v90];
      [(PPSMetricCollection *)self setDramEnergy:v91];
    }
  }
  uint64_t v92 = [v220 pcieEnergy];
  if (v92)
  {
    v93 = (void *)v92;
    v94 = [(PPSMetricCollection *)self pcieEnergy];

    if (v94)
    {
      v95 = NSNumber;
      v96 = [(PPSMetricCollection *)self pcieEnergy];
      [v96 doubleValue];
      double v98 = v97;
      v99 = [v220 pcieEnergy];
      [v99 doubleValue];
      v101 = [v95 numberWithDouble:v98 + v100];
      v102 = [(PPSMetricCollection *)self pcieEnergy];
      v103 = [v102 timestamp];
      v104 = +[PPSMetricSample sampleWithValue:v101 timestamp:v103];
      [(PPSMetricCollection *)self setPcieEnergy:v104];
    }
  }
  uint64_t v105 = [v220 dramBytes];
  if (v105)
  {
    v106 = (void *)v105;
    v107 = [(PPSMetricCollection *)self dramBytes];

    if (v107)
    {
      v108 = NSNumber;
      v109 = [(PPSMetricCollection *)self dramBytes];
      [v109 doubleValue];
      double v111 = v110;
      v112 = [v220 dramBytes];
      [v112 doubleValue];
      v114 = [v108 numberWithDouble:v111 + v113];
      v115 = [(PPSMetricCollection *)self dramBytes];
      v116 = [v115 timestamp];
      v117 = +[PPSMetricSample sampleWithValue:v114 timestamp:v116];
      [(PPSMetricCollection *)self setDramBytes:v117];
    }
  }
  uint64_t v118 = [v220 aneDCSBytes];
  if (v118)
  {
    v119 = (void *)v118;
    v120 = [(PPSMetricCollection *)self aneDCSBytes];

    if (v120)
    {
      v121 = NSNumber;
      v122 = [(PPSMetricCollection *)self aneDCSBytes];
      [v122 doubleValue];
      double v124 = v123;
      v125 = [v220 aneDCSBytes];
      [v125 doubleValue];
      v127 = [v121 numberWithDouble:v124 + v126];
      uint64_t v128 = [(PPSMetricCollection *)self aneDCSBytes];
      v129 = [v128 timestamp];
      uint64_t v130 = +[PPSMetricSample sampleWithValue:v127 timestamp:v129];
      [(PPSMetricCollection *)self setAneDCSBytes:v130];
    }
  }
  uint64_t v131 = [v220 aneFabricBytes];
  if (v131)
  {
    v132 = (void *)v131;
    id v133 = [(PPSMetricCollection *)self aneFabricBytes];

    if (v133)
    {
      v134 = NSNumber;
      v135 = [(PPSMetricCollection *)self aneFabricBytes];
      [v135 doubleValue];
      double v137 = v136;
      v138 = [v220 aneFabricBytes];
      [v138 doubleValue];
      v140 = [v134 numberWithDouble:v137 + v139];
      v141 = [(PPSMetricCollection *)self aneFabricBytes];
      v142 = [v141 timestamp];
      v143 = +[PPSMetricSample sampleWithValue:v140 timestamp:v142];
      [(PPSMetricCollection *)self setAneFabricBytes:v143];
    }
  }
  uint64_t v144 = [v220 systemLoadPower];
  if (v144)
  {
    v145 = (void *)v144;
    v146 = [(PPSMetricCollection *)self systemLoadPower];

    if (v146)
    {
      v147 = [v220 systemLoadPower];
      [(PPSMetricCollection *)self setSystemLoadPower:v147];
    }
  }
  uint64_t v148 = [v220 batteryPower];
  if (v148)
  {
    v149 = (void *)v148;
    v150 = [(PPSMetricCollection *)self batteryPower];

    if (v150)
    {
      v151 = [v220 batteryPower];
      [(PPSMetricCollection *)self setBatteryPower:v151];
    }
  }
  uint64_t v152 = [v220 dcInputPower];
  if (v152)
  {
    v153 = (void *)v152;
    v154 = [(PPSMetricCollection *)self dcInputPower];

    if (v154)
    {
      v155 = [v220 dcInputPower];
      [(PPSMetricCollection *)self setDcInputPower:v155];
    }
  }
  uint64_t v156 = [v220 cpuPower];
  if (v156)
  {
    v157 = (void *)v156;
    v158 = [(PPSMetricCollection *)self cpuPower];

    if (v158)
    {
      v159 = [v220 cpuPower];
      [(PPSMetricCollection *)self setCpuPower:v159];
    }
  }
  uint64_t v160 = [v220 gpuPower];
  if (v160)
  {
    v161 = (void *)v160;
    v162 = [(PPSMetricCollection *)self gpuPower];

    if (v162)
    {
      v163 = [v220 gpuPower];
      [(PPSMetricCollection *)self setGpuPower:v163];
    }
  }
  uint64_t v164 = [v220 dramPower];
  if (v164)
  {
    v165 = (void *)v164;
    v166 = [(PPSMetricCollection *)self dramPower];

    if (v166)
    {
      v167 = [v220 dramPower];
      [(PPSMetricCollection *)self setDramPower:v167];
    }
  }
  uint64_t v168 = [v220 anePower];
  if (v168)
  {
    v169 = (void *)v168;
    v170 = [(PPSMetricCollection *)self anePower];

    if (v170)
    {
      v171 = [v220 anePower];
      [(PPSMetricCollection *)self setAnePower:v171];
    }
  }
  uint64_t v172 = [v220 otherSocPower];
  if (v172)
  {
    v173 = (void *)v172;
    v174 = [(PPSMetricCollection *)self otherSocPower];

    if (v174)
    {
      v175 = [v220 otherSocPower];
      [(PPSMetricCollection *)self setOtherSocPower:v175];
    }
  }
  uint64_t v176 = [v220 wifiPower];
  if (v176)
  {
    v177 = (void *)v176;
    v178 = [(PPSMetricCollection *)self wifiPower];

    if (v178)
    {
      v179 = [v220 wifiPower];
      [(PPSMetricCollection *)self setWifiPower:v179];
    }
  }
  uint64_t v180 = [v220 cellularPower];
  if (v180)
  {
    v181 = (void *)v180;
    v182 = [(PPSMetricCollection *)self cellularPower];

    if (v182)
    {
      v183 = [v220 cellularPower];
      [(PPSMetricCollection *)self setCellularPower:v183];
    }
  }
  uint64_t v184 = [v220 displayPower];
  if (v184)
  {
    v185 = (void *)v184;
    v186 = [(PPSMetricCollection *)self displayPower];

    if (v186)
    {
      v187 = [v220 displayPower];
      [(PPSMetricCollection *)self setDisplayPower:v187];
    }
  }
  uint64_t v188 = [v220 displayFPS];
  if (v188)
  {
    v189 = (void *)v188;
    v190 = [(PPSMetricCollection *)self displayFPS];

    if (v190)
    {
      v191 = [v220 displayFPS];
      [(PPSMetricCollection *)self setDisplayFPS:v191];
    }
  }
  uint64_t v192 = [v220 wifiAWDLStatus];
  if (v192)
  {
    v193 = (void *)v192;
    v194 = [(PPSMetricCollection *)self wifiAWDLStatus];

    if (v194)
    {
      v195 = [v220 wifiAWDLStatus];
      [(PPSMetricCollection *)self setWifiAWDLStatus:v195];
    }
  }
  uint64_t v196 = [v220 wifiAWDLRange];
  if (v196)
  {
    v197 = (void *)v196;
    v198 = [(PPSMetricCollection *)self wifiAWDLRange];

    if (v198)
    {
      v199 = [v220 wifiAWDLRange];
      [(PPSMetricCollection *)self setWifiAWDLRange:v199];
    }
  }
  uint64_t v200 = [v220 chargingRate];
  if (v200)
  {
    v201 = (void *)v200;
    v202 = [(PPSMetricCollection *)self chargingRate];

    if (v202)
    {
      v203 = [v220 chargingRate];
      [(PPSMetricCollection *)self setChargingRate:v203];
    }
  }
  uint64_t v204 = [v220 batteryTemperature];
  if (v204)
  {
    v205 = (void *)v204;
    v206 = [(PPSMetricCollection *)self batteryTemperature];

    if (v206)
    {
      v207 = [v220 batteryTemperature];
      [(PPSMetricCollection *)self setBatteryTemperature:v207];
    }
  }
  uint64_t v208 = [v220 skinTemperature];
  if (v208)
  {
    v209 = (void *)v208;
    v210 = [(PPSMetricCollection *)self skinTemperature];

    if (v210)
    {
      v211 = [v220 skinTemperature];
      [(PPSMetricCollection *)self setSkinTemperature:v211];
    }
  }
  uint64_t v212 = [v220 displayAPL];
  if (v212)
  {
    v213 = (void *)v212;
    v214 = [(PPSMetricCollection *)self displayAPL];

    if (v214)
    {
      v215 = [v220 displayAPL];
      [(PPSMetricCollection *)self setDisplayAPL:v215];
    }
  }
  uint64_t v216 = [v220 displayCost];
  if (v216)
  {
    v217 = (void *)v216;
    v218 = [(PPSMetricCollection *)self displayCost];

    if (v218)
    {
      v219 = [v220 displayCost];
      [(PPSMetricCollection *)self setDisplayCost:v219];
    }
  }
  -[PPSMetricCollection setIsSystemPowerAvailableWhileCharging:](self, "setIsSystemPowerAvailableWhileCharging:", [v220 isSystemPowerAvailableWhileCharging]);
  -[PPSMetricCollection setThermalPressure:](self, "setThermalPressure:", [v220 thermalPressure]);
  -[PPSMetricCollection setInducedThermalPressure:](self, "setInducedThermalPressure:", [v220 inducedThermalPressure]);
}

- (id)_stringFromThermalPressure:(int64_t)a3
{
  if (a3 > 29)
  {
    switch(a3)
    {
      case 30:
        return @"Heavy";
      case 40:
        return @"Trapping";
      case 50:
        return @"Sleeping";
    }
  }
  else
  {
    switch(a3)
    {
      case 0:
        return @"Nominal";
      case 10:
        return @"Light";
      case 20:
        return @"Moderate";
    }
  }
  return @"Unknown";
}

- (id)_stringFromInducedThermalPressure:(int64_t)a3
{
  if (a3 <= 9)
  {
    if (a3 == -1) {
      return @"Not Set";
    }
    if (!a3) {
      return @"Nominal";
    }
  }
  else
  {
    switch(a3)
    {
      case 10:
        return @"Light";
      case 20:
        return @"Moderate";
      case 30:
        return @"Heavy";
    }
  }
  return @"Unknown";
}

- (void)updateMetrics:(id)a3 forPid:(id)a4
{
}

- (PPSMetricSample)systemLoadPower
{
  return self->_systemLoadPower;
}

- (void)setSystemLoadPower:(id)a3
{
}

- (PPSMetricSample)batteryPower
{
  return self->_batteryPower;
}

- (void)setBatteryPower:(id)a3
{
}

- (PPSMetricSample)dcInputPower
{
  return self->_dcInputPower;
}

- (void)setDcInputPower:(id)a3
{
}

- (PPSMetricSample)cpuPower
{
  return self->_cpuPower;
}

- (void)setCpuPower:(id)a3
{
}

- (PPSMetricSample)gpuPower
{
  return self->_gpuPower;
}

- (void)setGpuPower:(id)a3
{
}

- (PPSMetricSample)dramPower
{
  return self->_dramPower;
}

- (void)setDramPower:(id)a3
{
}

- (PPSMetricSample)anePower
{
  return self->_anePower;
}

- (void)setAnePower:(id)a3
{
}

- (PPSMetricSample)otherSocPower
{
  return self->_otherSocPower;
}

- (void)setOtherSocPower:(id)a3
{
}

- (PPSMetricSample)wifiPower
{
  return self->_wifiPower;
}

- (void)setWifiPower:(id)a3
{
}

- (PPSMetricSample)cellularPower
{
  return self->_cellularPower;
}

- (void)setCellularPower:(id)a3
{
}

- (PPSMetricSample)displayPower
{
  return self->_displayPower;
}

- (void)setDisplayPower:(id)a3
{
}

- (PPSMetricSample)displayFPS
{
  return self->_displayFPS;
}

- (void)setDisplayFPS:(id)a3
{
}

- (PPSMetricSample)wifiAWDLStatus
{
  return self->_wifiAWDLStatus;
}

- (void)setWifiAWDLStatus:(id)a3
{
}

- (PPSMetricSample)wifiAWDLRange
{
  return self->_wifiAWDLRange;
}

- (void)setWifiAWDLRange:(id)a3
{
}

- (PPSMetricSample)chargingRate
{
  return self->_chargingRate;
}

- (void)setChargingRate:(id)a3
{
}

- (BOOL)isSystemPowerAvailableWhileCharging
{
  return self->_isSystemPowerAvailableWhileCharging;
}

- (void)setIsSystemPowerAvailableWhileCharging:(BOOL)a3
{
  self->_isSystemPowerAvailableWhileCharging = a3;
}

- (PPSMetricSample)batteryTemperature
{
  return self->_batteryTemperature;
}

- (void)setBatteryTemperature:(id)a3
{
}

- (PPSMetricSample)skinTemperature
{
  return self->_skinTemperature;
}

- (void)setSkinTemperature:(id)a3
{
}

- (int64_t)thermalPressure
{
  return self->_thermalPressure;
}

- (void)setThermalPressure:(int64_t)a3
{
  self->_thermalPressure = a3;
}

- (int64_t)inducedThermalPressure
{
  return self->_inducedThermalPressure;
}

- (void)setInducedThermalPressure:(int64_t)a3
{
  self->_inducedThermalPressure = a3;
}

- (PPSMetricSample)displayAPL
{
  return self->_displayAPL;
}

- (void)setDisplayAPL:(id)a3
{
}

- (PPSMetricSample)displayCost
{
  return self->_displayCost;
}

- (void)setDisplayCost:(id)a3
{
}

- (NSMutableDictionary)processMetrics
{
  return self->_processMetrics;
}

- (void)setProcessMetrics:(id)a3
{
}

- (NSNumber)sampleTime
{
  return self->_sampleTime;
}

- (void)setSampleTime:(id)a3
{
}

- (PPSMetricSample)cpuEnergy
{
  return self->_cpuEnergy;
}

- (void)setCpuEnergy:(id)a3
{
}

- (PPSMetricSample)gpuEnergy
{
  return self->_gpuEnergy;
}

- (void)setGpuEnergy:(id)a3
{
}

- (PPSMetricSample)gpuSRAMEnergy
{
  return self->_gpuSRAMEnergy;
}

- (void)setGpuSRAMEnergy:(id)a3
{
}

- (PPSMetricSample)aneEnergy
{
  return self->_aneEnergy;
}

- (void)setAneEnergy:(id)a3
{
}

- (PPSMetricSample)dcsEnergy
{
  return self->_dcsEnergy;
}

- (void)setDcsEnergy:(id)a3
{
}

- (PPSMetricSample)dramEnergy
{
  return self->_dramEnergy;
}

- (void)setDramEnergy:(id)a3
{
}

- (PPSMetricSample)pcieEnergy
{
  return self->_pcieEnergy;
}

- (void)setPcieEnergy:(id)a3
{
}

- (PPSMetricSample)dramBytes
{
  return self->_dramBytes;
}

- (void)setDramBytes:(id)a3
{
}

- (PPSMetricSample)aneDCSBytes
{
  return self->_aneDCSBytes;
}

- (void)setAneDCSBytes:(id)a3
{
}

- (PPSMetricSample)aneFabricBytes
{
  return self->_aneFabricBytes;
}

- (void)setAneFabricBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aneFabricBytes, 0);
  objc_storeStrong((id *)&self->_aneDCSBytes, 0);
  objc_storeStrong((id *)&self->_dramBytes, 0);
  objc_storeStrong((id *)&self->_pcieEnergy, 0);
  objc_storeStrong((id *)&self->_dramEnergy, 0);
  objc_storeStrong((id *)&self->_dcsEnergy, 0);
  objc_storeStrong((id *)&self->_aneEnergy, 0);
  objc_storeStrong((id *)&self->_gpuSRAMEnergy, 0);
  objc_storeStrong((id *)&self->_gpuEnergy, 0);
  objc_storeStrong((id *)&self->_cpuEnergy, 0);
  objc_storeStrong((id *)&self->_sampleTime, 0);
  objc_storeStrong((id *)&self->_processMetrics, 0);
  objc_storeStrong((id *)&self->_displayCost, 0);
  objc_storeStrong((id *)&self->_displayAPL, 0);
  objc_storeStrong((id *)&self->_skinTemperature, 0);
  objc_storeStrong((id *)&self->_batteryTemperature, 0);
  objc_storeStrong((id *)&self->_chargingRate, 0);
  objc_storeStrong((id *)&self->_wifiAWDLRange, 0);
  objc_storeStrong((id *)&self->_wifiAWDLStatus, 0);
  objc_storeStrong((id *)&self->_displayFPS, 0);
  objc_storeStrong((id *)&self->_displayPower, 0);
  objc_storeStrong((id *)&self->_cellularPower, 0);
  objc_storeStrong((id *)&self->_wifiPower, 0);
  objc_storeStrong((id *)&self->_otherSocPower, 0);
  objc_storeStrong((id *)&self->_anePower, 0);
  objc_storeStrong((id *)&self->_dramPower, 0);
  objc_storeStrong((id *)&self->_gpuPower, 0);
  objc_storeStrong((id *)&self->_cpuPower, 0);
  objc_storeStrong((id *)&self->_dcInputPower, 0);
  objc_storeStrong((id *)&self->_batteryPower, 0);
  objc_storeStrong((id *)&self->_systemLoadPower, 0);
}

@end