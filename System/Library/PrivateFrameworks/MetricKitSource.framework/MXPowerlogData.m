@interface MXPowerlogData
+ (BOOL)supportsSecureCoding;
- (BOOL)includesMultipleApplicationVersions;
- (MXAnimationMetric)animationMetrics;
- (MXAppExitMetric)applicationExitMetrics;
- (MXAppLaunchMetric)applicationLaunchMetrics;
- (MXAppResponsivenessMetric)applicationResponsivenessMetrics;
- (MXAppRunTimeMetric)applicationTimeMetrics;
- (MXCPUMetric)cpuMetrics;
- (MXCellularConditionMetric)cellularConditionMetrics;
- (MXDiskIOMetric)diskIOMetrics;
- (MXDisplayMetric)displayMetrics;
- (MXGPUMetric)gpuMetrics;
- (MXLocationActivityMetric)locationActivityMetrics;
- (MXMemoryMetric)memoryMetrics;
- (MXNetworkTransferMetric)networkTransferMetrics;
- (MXPowerlogData)initWithCoder:(id)a3;
- (NSArray)signpostMetrics;
- (NSDate)beginDate;
- (NSDate)endDate;
- (id)initPayloadDataWithMutipleAppVersions:(BOOL)a3 withTimeStampBegin:(id)a4 withTimeStampEnd:(id)a5 withMetrics:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimationMetrics:(id)a3;
- (void)setApplicationExitMetrics:(id)a3;
- (void)setApplicationLaunchMetrics:(id)a3;
- (void)setApplicationResponsivenessMetrics:(id)a3;
- (void)setApplicationTimeMetrics:(id)a3;
- (void)setBeginDate:(id)a3;
- (void)setCellularConditionMetrics:(id)a3;
- (void)setCpuMetrics:(id)a3;
- (void)setDiskIOMetrics:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setGpuMetrics:(id)a3;
- (void)setIncludesMultipleApplicationVersions:(BOOL)a3;
- (void)setLocationActivityMetrics:(id)a3;
- (void)setMemoryMetrics:(id)a3;
- (void)setNetworkTransferMetrics:(id)a3;
- (void)setSignpostMetrics:(id)a3;
@end

@implementation MXPowerlogData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initPayloadDataWithMutipleAppVersions:(BOOL)a3 withTimeStampBegin:(id)a4 withTimeStampEnd:(id)a5 withMetrics:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v45.receiver = self;
  v45.super_class = (Class)MXPowerlogData;
  v14 = [(MXSourceData *)&v45 init];
  v15 = v14;
  if (v14)
  {
    v14->_includesMultipleApplicationVersions = a3;
    objc_storeStrong((id *)&v14->_beginDate, a4);
    objc_storeStrong((id *)&v15->_endDate, a5);
    uint64_t v16 = [v13 objectForKeyedSubscript:@"cpuMetrics"];
    cpuMetrics = v15->_cpuMetrics;
    v15->_cpuMetrics = (MXCPUMetric *)v16;

    uint64_t v18 = [v13 objectForKeyedSubscript:@"gpuMetrics"];
    gpuMetrics = v15->_gpuMetrics;
    v15->_gpuMetrics = (MXGPUMetric *)v18;

    uint64_t v20 = [v13 objectForKeyedSubscript:@"cellularConditionMetrics"];
    cellularConditionMetrics = v15->_cellularConditionMetrics;
    v15->_cellularConditionMetrics = (MXCellularConditionMetric *)v20;

    uint64_t v22 = [v13 objectForKeyedSubscript:@"applicationTimeMetrics"];
    applicationTimeMetrics = v15->_applicationTimeMetrics;
    v15->_applicationTimeMetrics = (MXAppRunTimeMetric *)v22;

    uint64_t v24 = [v13 objectForKeyedSubscript:@"locationActivityMetrics"];
    locationActivityMetrics = v15->_locationActivityMetrics;
    v15->_locationActivityMetrics = (MXLocationActivityMetric *)v24;

    uint64_t v26 = [v13 objectForKeyedSubscript:@"networkTransferMetrics"];
    networkTransferMetrics = v15->_networkTransferMetrics;
    v15->_networkTransferMetrics = (MXNetworkTransferMetric *)v26;

    uint64_t v28 = [v13 objectForKeyedSubscript:@"applicationLaunchMetrics"];
    applicationLaunchMetrics = v15->_applicationLaunchMetrics;
    v15->_applicationLaunchMetrics = (MXAppLaunchMetric *)v28;

    uint64_t v30 = [v13 objectForKeyedSubscript:@"applicationResponsivenessMetrics"];
    applicationResponsivenessMetrics = v15->_applicationResponsivenessMetrics;
    v15->_applicationResponsivenessMetrics = (MXAppResponsivenessMetric *)v30;

    uint64_t v32 = [v13 objectForKeyedSubscript:@"diskIOMetrics"];
    diskIOMetrics = v15->_diskIOMetrics;
    v15->_diskIOMetrics = (MXDiskIOMetric *)v32;

    uint64_t v34 = [v13 objectForKeyedSubscript:@"memoryMetrics"];
    memoryMetrics = v15->_memoryMetrics;
    v15->_memoryMetrics = (MXMemoryMetric *)v34;

    uint64_t v36 = [v13 objectForKeyedSubscript:@"displayMetrics"];
    displayMetrics = v15->_displayMetrics;
    v15->_displayMetrics = (MXDisplayMetric *)v36;

    uint64_t v38 = [v13 objectForKeyedSubscript:@"animationMetrics"];
    animationMetrics = v15->_animationMetrics;
    v15->_animationMetrics = (MXAnimationMetric *)v38;

    uint64_t v40 = [v13 objectForKeyedSubscript:@"applicationExitMetrics"];
    applicationExitMetrics = v15->_applicationExitMetrics;
    v15->_applicationExitMetrics = (MXAppExitMetric *)v40;

    uint64_t v42 = [v13 objectForKeyedSubscript:@"signpostMetrics"];
    signpostMetrics = v15->_signpostMetrics;
    v15->_signpostMetrics = (NSArray *)v42;
  }
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  BOOL includesMultipleApplicationVersions = self->_includesMultipleApplicationVersions;
  id v7 = a3;
  v6 = [v4 numberWithBool:includesMultipleApplicationVersions];
  [v7 encodeObject:v6 forKey:@"multipleAppVersions"];

  [v7 encodeObject:self->_beginDate forKey:@"beginDate"];
  [v7 encodeObject:self->_endDate forKey:@"endDate"];
  [v7 encodeObject:self->_cpuMetrics forKey:@"cpuMetrics"];
  [v7 encodeObject:self->_gpuMetrics forKey:@"gpuMetrics"];
  [v7 encodeObject:self->_cellularConditionMetrics forKey:@"cellularConditionMetrics"];
  [v7 encodeObject:self->_applicationTimeMetrics forKey:@"applicationTimeMetrics"];
  [v7 encodeObject:self->_locationActivityMetrics forKey:@"locationActivityMetrics"];
  [v7 encodeObject:self->_networkTransferMetrics forKey:@"networkTransferMetrics"];
  [v7 encodeObject:self->_applicationLaunchMetrics forKey:@"applicationLaunchMetrics"];
  [v7 encodeObject:self->_applicationResponsivenessMetrics forKey:@"applicationResponsivenessMetrics"];
  [v7 encodeObject:self->_diskIOMetrics forKey:@"diskIOMetrics"];
  [v7 encodeObject:self->_memoryMetrics forKey:@"memoryMetrics"];
  [v7 encodeObject:self->_displayMetrics forKey:@"displayMetrics"];
  [v7 encodeObject:self->_animationMetrics forKey:@"animationMetrics"];
  [v7 encodeObject:self->_applicationExitMetrics forKey:@"applicationExitMetrics"];
  [v7 encodeObject:self->_signpostMetrics forKey:@"signpostMetrics"];
}

- (MXPowerlogData)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)MXPowerlogData;
  v5 = [(MXSourceData *)&v47 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multipleAppVersions"];
    v5->_BOOL includesMultipleApplicationVersions = [v6 BOOLValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beginDate"];
    beginDate = v5->_beginDate;
    v5->_beginDate = (NSDate *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cpuMetrics"];
    cpuMetrics = v5->_cpuMetrics;
    v5->_cpuMetrics = (MXCPUMetric *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gpuMetrics"];
    gpuMetrics = v5->_gpuMetrics;
    v5->_gpuMetrics = (MXGPUMetric *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cellularConditionMetrics"];
    cellularConditionMetrics = v5->_cellularConditionMetrics;
    v5->_cellularConditionMetrics = (MXCellularConditionMetric *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationTimeMetrics"];
    applicationTimeMetrics = v5->_applicationTimeMetrics;
    v5->_applicationTimeMetrics = (MXAppRunTimeMetric *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationActivityMetrics"];
    locationActivityMetrics = v5->_locationActivityMetrics;
    v5->_locationActivityMetrics = (MXLocationActivityMetric *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkTransferMetrics"];
    networkTransferMetrics = v5->_networkTransferMetrics;
    v5->_networkTransferMetrics = (MXNetworkTransferMetric *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationLaunchMetrics"];
    applicationLaunchMetrics = v5->_applicationLaunchMetrics;
    v5->_applicationLaunchMetrics = (MXAppLaunchMetric *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationResponsivenessMetrics"];
    applicationResponsivenessMetrics = v5->_applicationResponsivenessMetrics;
    v5->_applicationResponsivenessMetrics = (MXAppResponsivenessMetric *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diskIOMetrics"];
    diskIOMetrics = v5->_diskIOMetrics;
    v5->_diskIOMetrics = (MXDiskIOMetric *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"memoryMetrics"];
    memoryMetrics = v5->_memoryMetrics;
    v5->_memoryMetrics = (MXMemoryMetric *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayMetrics"];
    displayMetrics = v5->_displayMetrics;
    v5->_displayMetrics = (MXDisplayMetric *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"animationMetrics"];
    animationMetrics = v5->_animationMetrics;
    v5->_animationMetrics = (MXAnimationMetric *)v33;

    v35 = (void *)MEMORY[0x263EFFA08];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"applicationExitMetrics"];
    applicationExitMetrics = v5->_applicationExitMetrics;
    v5->_applicationExitMetrics = (MXAppExitMetric *)v39;

    v41 = (void *)MEMORY[0x263EFFA08];
    uint64_t v42 = objc_opt_class();
    v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
    uint64_t v44 = [v4 decodeObjectOfClasses:v43 forKey:@"signpostMetrics"];
    signpostMetrics = v5->_signpostMetrics;
    v5->_signpostMetrics = (NSArray *)v44;
  }
  return v5;
}

- (BOOL)includesMultipleApplicationVersions
{
  return self->_includesMultipleApplicationVersions;
}

- (void)setIncludesMultipleApplicationVersions:(BOOL)a3
{
  self->_BOOL includesMultipleApplicationVersions = a3;
}

- (NSDate)beginDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBeginDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEndDate:(id)a3
{
}

- (MXCPUMetric)cpuMetrics
{
  return (MXCPUMetric *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCpuMetrics:(id)a3
{
}

- (MXGPUMetric)gpuMetrics
{
  return (MXGPUMetric *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGpuMetrics:(id)a3
{
}

- (MXCellularConditionMetric)cellularConditionMetrics
{
  return (MXCellularConditionMetric *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCellularConditionMetrics:(id)a3
{
}

- (MXAppRunTimeMetric)applicationTimeMetrics
{
  return (MXAppRunTimeMetric *)objc_getProperty(self, a2, 56, 1);
}

- (void)setApplicationTimeMetrics:(id)a3
{
}

- (MXLocationActivityMetric)locationActivityMetrics
{
  return (MXLocationActivityMetric *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocationActivityMetrics:(id)a3
{
}

- (MXNetworkTransferMetric)networkTransferMetrics
{
  return (MXNetworkTransferMetric *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNetworkTransferMetrics:(id)a3
{
}

- (MXAppLaunchMetric)applicationLaunchMetrics
{
  return (MXAppLaunchMetric *)objc_getProperty(self, a2, 80, 1);
}

- (void)setApplicationLaunchMetrics:(id)a3
{
}

- (MXAppResponsivenessMetric)applicationResponsivenessMetrics
{
  return (MXAppResponsivenessMetric *)objc_getProperty(self, a2, 88, 1);
}

- (void)setApplicationResponsivenessMetrics:(id)a3
{
}

- (MXDiskIOMetric)diskIOMetrics
{
  return (MXDiskIOMetric *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDiskIOMetrics:(id)a3
{
}

- (MXMemoryMetric)memoryMetrics
{
  return (MXMemoryMetric *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMemoryMetrics:(id)a3
{
}

- (MXDisplayMetric)displayMetrics
{
  return (MXDisplayMetric *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDisplayMetrics:(id)a3
{
}

- (MXAnimationMetric)animationMetrics
{
  return (MXAnimationMetric *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAnimationMetrics:(id)a3
{
}

- (MXAppExitMetric)applicationExitMetrics
{
  return (MXAppExitMetric *)objc_getProperty(self, a2, 128, 1);
}

- (void)setApplicationExitMetrics:(id)a3
{
}

- (NSArray)signpostMetrics
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSignpostMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostMetrics, 0);
  objc_storeStrong((id *)&self->_applicationExitMetrics, 0);
  objc_storeStrong((id *)&self->_animationMetrics, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_memoryMetrics, 0);
  objc_storeStrong((id *)&self->_diskIOMetrics, 0);
  objc_storeStrong((id *)&self->_applicationResponsivenessMetrics, 0);
  objc_storeStrong((id *)&self->_applicationLaunchMetrics, 0);
  objc_storeStrong((id *)&self->_networkTransferMetrics, 0);
  objc_storeStrong((id *)&self->_locationActivityMetrics, 0);
  objc_storeStrong((id *)&self->_applicationTimeMetrics, 0);
  objc_storeStrong((id *)&self->_cellularConditionMetrics, 0);
  objc_storeStrong((id *)&self->_gpuMetrics, 0);
  objc_storeStrong((id *)&self->_cpuMetrics, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_beginDate, 0);
}

@end