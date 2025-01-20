@interface PLGasGaugeAgent
+ (id)entryEventPointDefinitionGasGaugePower;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (PLGasGaugeAgent)init;
- (PLIOKitOperatorComposition)ggComposition;
- (void)dealloc;
- (void)init;
- (void)initOperatorDependancies;
- (void)logEventPointMetricMonitorInstantKeys;
- (void)setGgComposition:(id)a3;
@end

@implementation PLGasGaugeAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLGasGaugeAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLGasGaugeAgent)init
{
  if (+[PLSMCAgent supportsBasicSMC])
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v3) {
      [(PLGasGaugeAgent *)v3 init];
    }
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLGasGaugeAgent;
    self = [(PLAgent *)&v13 init];
    v11 = self;
  }

  return v11;
}

- (void)initOperatorDependancies
{
}

- (void)dealloc
{
  io_connect_t v3 = [(PLIOKitOperatorComposition *)self->_ggComposition conn];
  if (v3) {
    IOServiceClose(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLGasGaugeAgent;
  [(PLAgent *)&v4 dealloc];
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"MetricMonitorInstantKeys";
  objc_super v2 = +[PLGasGaugeAgent entryEventPointDefinitionGasGaugePower];
  v6[0] = v2;
  io_connect_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointDefinitionGasGaugePower
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F40124C8;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  uint64_t v8 = @"GasGaugePower";
  io_connect_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  objc_super v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  uint64_t v9 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

- (void)logEventPointMetricMonitorInstantKeys
{
}

- (PLIOKitOperatorComposition)ggComposition
{
  return self->_ggComposition;
}

- (void)setGgComposition:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, MEMORY[0x1E4F14500], a3, "PLGasGaugeAgent returning nil because this device has an SMC", a5, a6, a7, a8, 0);
}

@end