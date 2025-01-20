@interface PowerUIDesktopModePredictor
- (MLModel)model;
- (NSDate)pluginDate;
- (NSString)defaultsDomain;
- (OS_os_log)log;
- (PowerUIDesktopModePredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5;
- (PowerUITrialManager)trialManager;
- (_CDLocalContext)context;
- (double)desktopEntryThreshold;
- (double)pluginBatteryLevel;
- (double)threshold;
- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3;
- (os_unfair_lock_s)loadModelLock;
- (os_unfair_lock_s)lock;
- (unint64_t)modelVersion;
- (unint64_t)predictorType;
- (void)setContext:(id)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setDesktopEntryThreshold:(double)a3;
- (void)setLoadModelLock:(os_unfair_lock_s)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setPluginBatteryLevel:(double)a3;
- (void)setPluginDate:(id)a3;
- (void)setThreshold:(double)a3;
- (void)setTrialManager:(id)a3;
@end

@implementation PowerUIDesktopModePredictor

- (PowerUIDesktopModePredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PowerUIDesktopModePredictor;
  return [(PowerUIDesktopModePredictor *)&v6 init];
}

- (unint64_t)predictorType
{
  return 3;
}

- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF910], "distantFuture", a3);
}

- (unint64_t)modelVersion
{
  return 3;
}

- (MLModel)model
{
  return self->_model;
}

- (NSDate)pluginDate
{
  return self->_pluginDate;
}

- (void)setPluginDate:(id)a3
{
}

- (double)pluginBatteryLevel
{
  return self->_pluginBatteryLevel;
}

- (void)setPluginBatteryLevel:(double)a3
{
  self->_pluginBatteryLevel = a3;
}

- (double)desktopEntryThreshold
{
  return self->_desktopEntryThreshold;
}

- (void)setDesktopEntryThreshold:(double)a3
{
  self->_desktopEntryThreshold = a3;
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)loadModelLock
{
  return self->_loadModelLock;
}

- (void)setLoadModelLock:(os_unfair_lock_s)a3
{
  self->_loadModelLock = a3;
}

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_pluginDate, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end