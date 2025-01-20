@interface ProcessMemoryUsage
- (BOOL)isActiveLimit;
- (BOOL)isDaemonXPCService;
- (BOOL)isLimitHard;
- (BOOL)isLimitIncreased;
- (BOOL)process_active;
- (NSString)bundleId;
- (NSString)bundleVersion;
- (NSString)processLaunchdName;
- (NSString)processName;
- (int)jetsam_priority;
- (int)memoryLimitMB;
- (unint64_t)interval_peak_neural_footprint;
- (unint64_t)interval_peak_phys_footprint;
- (unint64_t)neural_footprint;
- (unint64_t)peak_phys_footprint;
- (unint64_t)phys_footprint_size;
- (void)setBundleId:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setInterval_peak_neural_footprint:(unint64_t)a3;
- (void)setInterval_peak_phys_footprint:(unint64_t)a3;
- (void)setIsActiveLimit:(BOOL)a3;
- (void)setIsDaemonXPCService:(BOOL)a3;
- (void)setIsLimitHard:(BOOL)a3;
- (void)setIsLimitIncreased:(BOOL)a3;
- (void)setJetsam_priority:(int)a3;
- (void)setMemoryLimitMB:(int)a3;
- (void)setNeural_footprint:(unint64_t)a3;
- (void)setPeak_phys_footprint:(unint64_t)a3;
- (void)setPhys_footprint_size:(unint64_t)a3;
- (void)setProcessLaunchdName:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setProcess_active:(BOOL)a3;
@end

@implementation ProcessMemoryUsage

- (BOOL)isDaemonXPCService
{
  return self->_isDaemonXPCService;
}

- (void)setIsDaemonXPCService:(BOOL)a3
{
  self->_isDaemonXPCService = a3;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProcessName:(id)a3
{
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)processLaunchdName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProcessLaunchdName:(id)a3
{
}

- (unint64_t)phys_footprint_size
{
  return self->_phys_footprint_size;
}

- (void)setPhys_footprint_size:(unint64_t)a3
{
  self->_phys_footprint_size = a3;
}

- (unint64_t)peak_phys_footprint
{
  return self->_peak_phys_footprint;
}

- (void)setPeak_phys_footprint:(unint64_t)a3
{
  self->_peak_phys_footprint = a3;
}

- (unint64_t)interval_peak_phys_footprint
{
  return self->_interval_peak_phys_footprint;
}

- (void)setInterval_peak_phys_footprint:(unint64_t)a3
{
  self->_interval_peak_phys_footprint = a3;
}

- (unint64_t)neural_footprint
{
  return self->_neural_footprint;
}

- (void)setNeural_footprint:(unint64_t)a3
{
  self->_neural_footprint = a3;
}

- (unint64_t)interval_peak_neural_footprint
{
  return self->_interval_peak_neural_footprint;
}

- (void)setInterval_peak_neural_footprint:(unint64_t)a3
{
  self->_interval_peak_neural_footprint = a3;
}

- (int)jetsam_priority
{
  return self->_jetsam_priority;
}

- (void)setJetsam_priority:(int)a3
{
  self->_jetsam_priority = a3;
}

- (BOOL)process_active
{
  return self->_process_active;
}

- (void)setProcess_active:(BOOL)a3
{
  self->_process_active = a3;
}

- (int)memoryLimitMB
{
  return self->_memoryLimitMB;
}

- (void)setMemoryLimitMB:(int)a3
{
  self->_memoryLimitMB = a3;
}

- (BOOL)isLimitHard
{
  return self->_isLimitHard;
}

- (void)setIsLimitHard:(BOOL)a3
{
  self->_isLimitHard = a3;
}

- (BOOL)isActiveLimit
{
  return self->_isActiveLimit;
}

- (void)setIsActiveLimit:(BOOL)a3
{
  self->_isActiveLimit = a3;
}

- (BOOL)isLimitIncreased
{
  return self->_isLimitIncreased;
}

- (void)setIsLimitIncreased:(BOOL)a3
{
  self->_isLimitIncreased = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processLaunchdName, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end