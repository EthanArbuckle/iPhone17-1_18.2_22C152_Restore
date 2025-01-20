@interface PPSProcessMetricCollection
+ (BOOL)supportsSecureCoding;
+ (id)_metricSamplePropertyKeys;
- (NSNumber)coalitionID;
- (NSNumber)sampleTime;
- (NSString)bundleID;
- (NSString)processName;
- (PPSMetricSample)aneEnergy;
- (PPSMetricSample)aneTime;
- (PPSMetricSample)applicationState;
- (PPSMetricSample)bytesRead;
- (PPSMetricSample)bytesWritten;
- (PPSMetricSample)cellIn;
- (PPSMetricSample)cellOut;
- (PPSMetricSample)cpuCost;
- (PPSMetricSample)cpuInstructions;
- (PPSMetricSample)cpuPInstructions;
- (PPSMetricSample)cpuSeconds;
- (PPSMetricSample)energyCost;
- (PPSMetricSample)energyOverhead;
- (PPSMetricSample)gpuCost;
- (PPSMetricSample)gpuEnergy;
- (PPSMetricSample)gpuTime;
- (PPSMetricSample)locationCost;
- (PPSMetricSample)networkCost;
- (PPSMetricSample)ongoingLocation;
- (PPSMetricSample)wifiIn;
- (PPSMetricSample)wifiOut;
- (PPSProcessMetricCollection)initWithCoder:(id)a3;
- (const)_stringForApplicationState:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)pid;
- (void)combineWithProcessMetricCollection:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAneEnergy:(id)a3;
- (void)setAneTime:(id)a3;
- (void)setApplicationState:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBytesRead:(id)a3;
- (void)setBytesWritten:(id)a3;
- (void)setCellIn:(id)a3;
- (void)setCellOut:(id)a3;
- (void)setCoalitionID:(id)a3;
- (void)setCpuCost:(id)a3;
- (void)setCpuInstructions:(id)a3;
- (void)setCpuPInstructions:(id)a3;
- (void)setCpuSeconds:(id)a3;
- (void)setEnergyCost:(id)a3;
- (void)setEnergyOverhead:(id)a3;
- (void)setGpuCost:(id)a3;
- (void)setGpuEnergy:(id)a3;
- (void)setGpuTime:(id)a3;
- (void)setLocationCost:(id)a3;
- (void)setNetworkCost:(id)a3;
- (void)setOngoingLocation:(id)a3;
- (void)setPid:(int)a3;
- (void)setProcessName:(id)a3;
- (void)setSampleTime:(id)a3;
- (void)setWifiIn:(id)a3;
- (void)setWifiOut:(id)a3;
@end

@implementation PPSProcessMetricCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_metricSamplePropertyKeys
{
  if (_metricSamplePropertyKeys_onceToken_0 != -1) {
    dispatch_once(&_metricSamplePropertyKeys_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)_metricSamplePropertyKeys_keys_0;
  return v2;
}

uint64_t __55__PPSProcessMetricCollection__metricSamplePropertyKeys__block_invoke()
{
  _metricSamplePropertyKeys_keys_0 = [MEMORY[0x263EFFA08] setWithArray:&unk_2706F7D20];
  return MEMORY[0x270F9A758]();
}

- (PPSProcessMetricCollection)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PPSProcessMetricCollection;
  v5 = [(PPSProcessMetricCollection *)&v27 init];
  if (v5)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v6 = +[PPSProcessMetricCollection _metricSamplePropertyKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
          v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v11];
          [(PPSProcessMetricCollection *)v5 setValue:v12 forKey:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__pid__"];
    v5->_pid = [v13 intValue];

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__coalitionID__"];
    coalitionID = v5->_coalitionID;
    v5->_coalitionID = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__processName__"];
    processName = v5->_processName;
    v5->_processName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__bundleID__"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__sampleTime__"];
    sampleTime = v5->_sampleTime;
    v5->_sampleTime = (NSNumber *)v20;
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
  v5 = +[PPSProcessMetricCollection _metricSamplePropertyKeys];
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
        uint64_t v11 = [(PPSProcessMetricCollection *)self valueForKey:v10];
        [v4 encodeObject:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v12 = objc_msgSend(NSNumber, "numberWithInt:", -[PPSProcessMetricCollection pid](self, "pid"));
  [v4 encodeObject:v12 forKey:@"__pid__"];

  v13 = [(PPSProcessMetricCollection *)self coalitionID];
  [v4 encodeObject:v13 forKey:@"__coalitionID__"];

  uint64_t v14 = [(PPSProcessMetricCollection *)self processName];
  [v4 encodeObject:v14 forKey:@"__processName__"];

  v15 = [(PPSProcessMetricCollection *)self bundleID];
  [v4 encodeObject:v15 forKey:@"__bundleID__"];

  uint64_t v16 = [(PPSProcessMetricCollection *)self sampleTime];
  [v4 encodeObject:v16 forKey:@"__sampleTime__"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = objc_alloc_init(PPSProcessMetricCollection);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = +[PPSProcessMetricCollection _metricSamplePropertyKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [(PPSProcessMetricCollection *)self valueForKey:v11];
        v13 = (void *)[v12 copyWithZone:a3];
        [(PPSProcessMetricCollection *)v5 setValue:v13 forKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v5->_pid = self->_pid;
  objc_storeStrong((id *)&v5->_processName, self->_processName);
  objc_storeStrong((id *)&v5->_bundleID, self->_bundleID);
  objc_storeStrong((id *)&v5->_sampleTime, self->_sampleTime);
  return v5;
}

- (id)description
{
  id v57 = (id)NSString;
  v79 = [(PPSProcessMetricCollection *)self energyCost];
  v78 = [v79 value];
  [v78 doubleValue];
  uint64_t v4 = v3;
  v77 = [(PPSProcessMetricCollection *)self energyCost];
  v76 = [v77 timestamp];
  v87 = PPSTimeStringFromDate(v76);
  v75 = [(PPSProcessMetricCollection *)self energyOverhead];
  v74 = [v75 value];
  [v74 doubleValue];
  uint64_t v6 = v5;
  v73 = [(PPSProcessMetricCollection *)self energyOverhead];
  v72 = [v73 timestamp];
  v86 = PPSTimeStringFromDate(v72);
  v71 = [(PPSProcessMetricCollection *)self cpuCost];
  v70 = [v71 value];
  [v70 doubleValue];
  uint64_t v8 = v7;
  v69 = [(PPSProcessMetricCollection *)self cpuCost];
  v68 = [v69 timestamp];
  v85 = PPSTimeStringFromDate(v68);
  v67 = [(PPSProcessMetricCollection *)self cpuSeconds];
  v66 = [v67 value];
  [v66 doubleValue];
  uint64_t v10 = v9;
  v65 = [(PPSProcessMetricCollection *)self cpuSeconds];
  v64 = [v65 timestamp];
  v84 = PPSTimeStringFromDate(v64);
  v63 = [(PPSProcessMetricCollection *)self gpuCost];
  v62 = [v63 value];
  [v62 doubleValue];
  uint64_t v12 = v11;
  v61 = [(PPSProcessMetricCollection *)self gpuCost];
  v60 = [v61 timestamp];
  v83 = PPSTimeStringFromDate(v60);
  v59 = [(PPSProcessMetricCollection *)self networkCost];
  v56 = [v59 value];
  uint64_t v42 = [v56 intValue];
  v55 = [(PPSProcessMetricCollection *)self networkCost];
  v54 = [v55 timestamp];
  v82 = PPSTimeStringFromDate(v54);
  v53 = [(PPSProcessMetricCollection *)self wifiIn];
  v52 = [v53 value];
  uint64_t v38 = [v52 intValue];
  v51 = [(PPSProcessMetricCollection *)self wifiIn];
  v50 = [v51 timestamp];
  v81 = PPSTimeStringFromDate(v50);
  v49 = [(PPSProcessMetricCollection *)self wifiOut];
  v48 = [v49 value];
  uint64_t v35 = [v48 intValue];
  v47 = [(PPSProcessMetricCollection *)self wifiOut];
  v46 = [v47 timestamp];
  v80 = PPSTimeStringFromDate(v46);
  v45 = [(PPSProcessMetricCollection *)self cellIn];
  v44 = [v45 value];
  uint64_t v31 = [v44 intValue];
  v43 = [(PPSProcessMetricCollection *)self cellIn];
  v41 = [v43 timestamp];
  uint64_t v29 = PPSTimeStringFromDate(v41);
  v40 = [(PPSProcessMetricCollection *)self cellOut];
  v39 = [v40 value];
  uint64_t v26 = [v39 intValue];
  v37 = [(PPSProcessMetricCollection *)self cellOut];
  v36 = [v37 timestamp];
  long long v25 = PPSTimeStringFromDate(v36);
  v34 = [(PPSProcessMetricCollection *)self locationCost];
  v33 = [v34 value];
  [v33 doubleValue];
  uint64_t v14 = v13;
  v32 = [(PPSProcessMetricCollection *)self locationCost];
  v30 = [v32 timestamp];
  long long v15 = PPSTimeStringFromDate(v30);
  v28 = [(PPSProcessMetricCollection *)self ongoingLocation];
  objc_super v27 = [v28 value];
  if ([v27 BOOLValue]) {
    long long v16 = "YES";
  }
  else {
    long long v16 = "NO";
  }
  long long v17 = [(PPSProcessMetricCollection *)self ongoingLocation];
  long long v18 = [v17 timestamp];
  long long v19 = PPSTimeStringFromDate(v18);
  uint64_t v20 = [(PPSProcessMetricCollection *)self applicationState];
  v21 = [v20 timestamp];
  uint64_t v22 = PPSTimeStringFromDate(v21);
  long long v23 = [(PPSProcessMetricCollection *)self applicationState];
  objc_msgSend(v57, "stringWithFormat:", @"Energy Cost        %8.3f     %@\nEnergy Overhead    %8.3f     %@\nCPU Cost           %8.3f     %@\nCPU Seconds        %8.3f s   %@\nGPU Cost           %8.3f     %@\nNetwork Cost       %8d     %@\nWiFi In            %8d B   %@\nWiFi Out           %8d B   %@\nCell In            %8d B   %@\nCell Out           %8d B   %@\nLocation Cost      %8.3f     %@\nOngoing Location   %8s     %@\nApplication State               %@\n%29s", v4, v87, v6, v86, v8, v85, v10, v84, v12, v83, v42, v82, v38, v81, v35, v80,
    v31,
    v29,
    v26,
    v25,
    v14,
    v15,
    v16,
    v19,
    v22,
    -[PPSProcessMetricCollection _stringForApplicationState:](self, "_stringForApplicationState:", [v23 intValue]));
  id v58 = (id)objc_claimAutoreleasedReturnValue();

  return v58;
}

- (void)combineWithProcessMetricCollection:(id)a3
{
  id v157 = a3;
  uint64_t v4 = [v157 sampleTime];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [(PPSProcessMetricCollection *)self sampleTime];

    if (v6)
    {
      uint64_t v7 = NSNumber;
      uint64_t v8 = [v157 sampleTime];
      [v8 doubleValue];
      double v10 = v9;
      uint64_t v11 = [(PPSProcessMetricCollection *)self sampleTime];
      [v11 doubleValue];
      uint64_t v13 = [v7 numberWithDouble:v10 + v12];
      [(PPSProcessMetricCollection *)self setSampleTime:v13];
    }
  }
  uint64_t v14 = [v157 cpuInstructions];
  if (v14)
  {
    long long v15 = (void *)v14;
    long long v16 = [(PPSProcessMetricCollection *)self cpuInstructions];

    if (v16)
    {
      long long v17 = NSNumber;
      long long v18 = [(PPSProcessMetricCollection *)self cpuInstructions];
      [v18 doubleValue];
      double v20 = v19;
      v21 = [v157 cpuInstructions];
      [v21 doubleValue];
      long long v23 = [v17 numberWithDouble:v20 + v22];
      long long v24 = [(PPSProcessMetricCollection *)self cpuInstructions];
      long long v25 = [v24 timestamp];
      uint64_t v26 = +[PPSMetricSample sampleWithValue:v23 timestamp:v25];
      [(PPSProcessMetricCollection *)self setCpuInstructions:v26];
    }
  }
  uint64_t v27 = [v157 cpuPInstructions];
  if (v27)
  {
    v28 = (void *)v27;
    uint64_t v29 = [(PPSProcessMetricCollection *)self cpuPInstructions];

    if (v29)
    {
      v30 = NSNumber;
      uint64_t v31 = [(PPSProcessMetricCollection *)self cpuPInstructions];
      [v31 doubleValue];
      double v33 = v32;
      v34 = [v157 cpuPInstructions];
      [v34 doubleValue];
      v36 = [v30 numberWithDouble:v33 + v35];
      v37 = [(PPSProcessMetricCollection *)self cpuPInstructions];
      uint64_t v38 = [v37 timestamp];
      v39 = +[PPSMetricSample sampleWithValue:v36 timestamp:v38];
      [(PPSProcessMetricCollection *)self setCpuPInstructions:v39];
    }
  }
  uint64_t v40 = [v157 wifiIn];
  if (v40)
  {
    v41 = (void *)v40;
    uint64_t v42 = [(PPSProcessMetricCollection *)self wifiIn];

    if (v42)
    {
      v43 = NSNumber;
      v44 = [(PPSProcessMetricCollection *)self wifiIn];
      [v44 doubleValue];
      double v46 = v45;
      v47 = [v157 wifiIn];
      [v47 doubleValue];
      v49 = [v43 numberWithDouble:v46 + v48];
      v50 = [(PPSProcessMetricCollection *)self wifiIn];
      v51 = [v50 timestamp];
      v52 = +[PPSMetricSample sampleWithValue:v49 timestamp:v51];
      [(PPSProcessMetricCollection *)self setWifiIn:v52];
    }
  }
  uint64_t v53 = [v157 wifiOut];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(PPSProcessMetricCollection *)self wifiOut];

    if (v55)
    {
      v56 = NSNumber;
      id v57 = [(PPSProcessMetricCollection *)self wifiOut];
      [v57 doubleValue];
      double v59 = v58;
      v60 = [v157 wifiOut];
      [v60 doubleValue];
      v62 = [v56 numberWithDouble:v59 + v61];
      v63 = [(PPSProcessMetricCollection *)self wifiOut];
      v64 = [v63 timestamp];
      v65 = +[PPSMetricSample sampleWithValue:v62 timestamp:v64];
      [(PPSProcessMetricCollection *)self setWifiOut:v65];
    }
  }
  uint64_t v66 = [v157 cellIn];
  if (v66)
  {
    v67 = (void *)v66;
    v68 = [(PPSProcessMetricCollection *)self cellIn];

    if (v68)
    {
      v69 = NSNumber;
      v70 = [(PPSProcessMetricCollection *)self cellIn];
      [v70 doubleValue];
      double v72 = v71;
      v73 = [v157 cellIn];
      [v73 doubleValue];
      v75 = [v69 numberWithDouble:v72 + v74];
      v76 = [(PPSProcessMetricCollection *)self cellIn];
      v77 = [v76 timestamp];
      v78 = +[PPSMetricSample sampleWithValue:v75 timestamp:v77];
      [(PPSProcessMetricCollection *)self setCellIn:v78];
    }
  }
  uint64_t v79 = [v157 cellOut];
  if (v79)
  {
    v80 = (void *)v79;
    v81 = [(PPSProcessMetricCollection *)self cellOut];

    if (v81)
    {
      v82 = NSNumber;
      v83 = [(PPSProcessMetricCollection *)self cellOut];
      [v83 doubleValue];
      double v85 = v84;
      v86 = [v157 cellOut];
      [v86 doubleValue];
      v88 = [v82 numberWithDouble:v85 + v87];
      v89 = [(PPSProcessMetricCollection *)self cellOut];
      v90 = [v89 timestamp];
      v91 = +[PPSMetricSample sampleWithValue:v88 timestamp:v90];
      [(PPSProcessMetricCollection *)self setCellOut:v91];
    }
  }
  uint64_t v92 = [v157 bytesRead];
  if (v92)
  {
    v93 = (void *)v92;
    v94 = [(PPSProcessMetricCollection *)self bytesRead];

    if (v94)
    {
      v95 = NSNumber;
      v96 = [(PPSProcessMetricCollection *)self bytesRead];
      [v96 doubleValue];
      double v98 = v97;
      v99 = [v157 bytesRead];
      [v99 doubleValue];
      v101 = [v95 numberWithDouble:v98 + v100];
      v102 = [(PPSProcessMetricCollection *)self bytesRead];
      v103 = [v102 timestamp];
      v104 = +[PPSMetricSample sampleWithValue:v101 timestamp:v103];
      [(PPSProcessMetricCollection *)self setBytesRead:v104];
    }
  }
  uint64_t v105 = [v157 bytesWritten];
  if (v105)
  {
    v106 = (void *)v105;
    v107 = [(PPSProcessMetricCollection *)self bytesWritten];

    if (v107)
    {
      v108 = NSNumber;
      v109 = [(PPSProcessMetricCollection *)self bytesWritten];
      [v109 doubleValue];
      double v111 = v110;
      v112 = [v157 bytesWritten];
      [v112 doubleValue];
      v114 = [v108 numberWithDouble:v111 + v113];
      v115 = [(PPSProcessMetricCollection *)self bytesWritten];
      v116 = [v115 timestamp];
      v117 = +[PPSMetricSample sampleWithValue:v114 timestamp:v116];
      [(PPSProcessMetricCollection *)self setBytesWritten:v117];
    }
  }
  uint64_t v118 = [v157 aneEnergy];
  if (v118)
  {
    v119 = (void *)v118;
    v120 = [(PPSProcessMetricCollection *)self aneEnergy];

    if (v120)
    {
      v121 = NSNumber;
      v122 = [(PPSProcessMetricCollection *)self aneEnergy];
      [v122 doubleValue];
      double v124 = v123;
      v125 = [v157 aneEnergy];
      [v125 doubleValue];
      v127 = [v121 numberWithDouble:v124 + v126];
      v128 = [(PPSProcessMetricCollection *)self aneEnergy];
      v129 = [v128 timestamp];
      v130 = +[PPSMetricSample sampleWithValue:v127 timestamp:v129];
      [(PPSProcessMetricCollection *)self setAneEnergy:v130];
    }
  }
  uint64_t v131 = [v157 aneTime];
  if (v131)
  {
    v132 = (void *)v131;
    v133 = [(PPSProcessMetricCollection *)self aneEnergy];

    if (v133)
    {
      v134 = NSNumber;
      v135 = [(PPSProcessMetricCollection *)self aneTime];
      [v135 doubleValue];
      double v137 = v136;
      v138 = [v157 aneTime];
      [v138 doubleValue];
      v140 = [v134 numberWithDouble:v137 + v139];
      v141 = [(PPSProcessMetricCollection *)self aneTime];
      v142 = [v141 timestamp];
      v143 = +[PPSMetricSample sampleWithValue:v140 timestamp:v142];
      [(PPSProcessMetricCollection *)self setAneTime:v143];
    }
  }
  uint64_t v144 = [v157 gpuEnergy];
  if (v144)
  {
    v145 = (void *)v144;
    v146 = [(PPSProcessMetricCollection *)self gpuEnergy];

    if (v146)
    {
      v147 = NSNumber;
      v148 = [(PPSProcessMetricCollection *)self gpuEnergy];
      [v148 doubleValue];
      double v150 = v149;
      v151 = [v157 gpuEnergy];
      [v151 doubleValue];
      v153 = [v147 numberWithDouble:v150 + v152];
      v154 = [(PPSProcessMetricCollection *)self gpuEnergy];
      v155 = [v154 timestamp];
      v156 = +[PPSMetricSample sampleWithValue:v153 timestamp:v155];
      [(PPSProcessMetricCollection *)self setGpuEnergy:v156];
    }
  }
}

- (const)_stringForApplicationState:(unsigned int)a3
{
  if (a3 < 9 && ((0x117u >> a3) & 1) != 0) {
    return off_26543FE20[a3];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)&a3);
  id v3 = objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)[v3 UTF8String];

  return v4;
}

- (PPSMetricSample)energyCost
{
  return self->_energyCost;
}

- (void)setEnergyCost:(id)a3
{
}

- (PPSMetricSample)energyOverhead
{
  return self->_energyOverhead;
}

- (void)setEnergyOverhead:(id)a3
{
}

- (PPSMetricSample)cpuCost
{
  return self->_cpuCost;
}

- (void)setCpuCost:(id)a3
{
}

- (PPSMetricSample)cpuSeconds
{
  return self->_cpuSeconds;
}

- (void)setCpuSeconds:(id)a3
{
}

- (PPSMetricSample)gpuCost
{
  return self->_gpuCost;
}

- (void)setGpuCost:(id)a3
{
}

- (PPSMetricSample)gpuTime
{
  return self->_gpuTime;
}

- (void)setGpuTime:(id)a3
{
}

- (PPSMetricSample)gpuEnergy
{
  return self->_gpuEnergy;
}

- (void)setGpuEnergy:(id)a3
{
}

- (PPSMetricSample)networkCost
{
  return self->_networkCost;
}

- (void)setNetworkCost:(id)a3
{
}

- (PPSMetricSample)wifiIn
{
  return self->_wifiIn;
}

- (void)setWifiIn:(id)a3
{
}

- (PPSMetricSample)wifiOut
{
  return self->_wifiOut;
}

- (void)setWifiOut:(id)a3
{
}

- (PPSMetricSample)cellIn
{
  return self->_cellIn;
}

- (void)setCellIn:(id)a3
{
}

- (PPSMetricSample)cellOut
{
  return self->_cellOut;
}

- (void)setCellOut:(id)a3
{
}

- (PPSMetricSample)locationCost
{
  return self->_locationCost;
}

- (void)setLocationCost:(id)a3
{
}

- (PPSMetricSample)ongoingLocation
{
  return self->_ongoingLocation;
}

- (void)setOngoingLocation:(id)a3
{
}

- (PPSMetricSample)applicationState
{
  return self->_applicationState;
}

- (void)setApplicationState:(id)a3
{
}

- (PPSMetricSample)cpuInstructions
{
  return self->_cpuInstructions;
}

- (void)setCpuInstructions:(id)a3
{
}

- (PPSMetricSample)cpuPInstructions
{
  return self->_cpuPInstructions;
}

- (void)setCpuPInstructions:(id)a3
{
}

- (PPSMetricSample)bytesRead
{
  return self->_bytesRead;
}

- (void)setBytesRead:(id)a3
{
}

- (PPSMetricSample)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(id)a3
{
}

- (PPSMetricSample)aneEnergy
{
  return self->_aneEnergy;
}

- (void)setAneEnergy:(id)a3
{
}

- (PPSMetricSample)aneTime
{
  return self->_aneTime;
}

- (void)setAneTime:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSNumber)coalitionID
{
  return self->_coalitionID;
}

- (void)setCoalitionID:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)sampleTime
{
  return self->_sampleTime;
}

- (void)setSampleTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTime, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_coalitionID, 0);
  objc_storeStrong((id *)&self->_aneTime, 0);
  objc_storeStrong((id *)&self->_aneEnergy, 0);
  objc_storeStrong((id *)&self->_bytesWritten, 0);
  objc_storeStrong((id *)&self->_bytesRead, 0);
  objc_storeStrong((id *)&self->_cpuPInstructions, 0);
  objc_storeStrong((id *)&self->_cpuInstructions, 0);
  objc_storeStrong((id *)&self->_applicationState, 0);
  objc_storeStrong((id *)&self->_ongoingLocation, 0);
  objc_storeStrong((id *)&self->_locationCost, 0);
  objc_storeStrong((id *)&self->_cellOut, 0);
  objc_storeStrong((id *)&self->_cellIn, 0);
  objc_storeStrong((id *)&self->_wifiOut, 0);
  objc_storeStrong((id *)&self->_wifiIn, 0);
  objc_storeStrong((id *)&self->_networkCost, 0);
  objc_storeStrong((id *)&self->_gpuEnergy, 0);
  objc_storeStrong((id *)&self->_gpuTime, 0);
  objc_storeStrong((id *)&self->_gpuCost, 0);
  objc_storeStrong((id *)&self->_cpuSeconds, 0);
  objc_storeStrong((id *)&self->_cpuCost, 0);
  objc_storeStrong((id *)&self->_energyOverhead, 0);
  objc_storeStrong((id *)&self->_energyCost, 0);
}

@end