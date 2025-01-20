@interface PLBatteryUIResponseTypeLastChargeLevel
- (NSDictionary)resultDictionary;
- (NSNumber)lastChargeTimestamp;
- (NSNumber)lastChargeValue;
- (PLBatteryUIResponderService)responderService;
- (id)dependencies;
- (void)configure:(id)a3;
- (void)run;
- (void)setLastChargeTimestamp:(id)a3;
- (void)setLastChargeValue:(id)a3;
- (void)setResponderService:(id)a3;
- (void)setResultDictionary:(id)a3;
@end

@implementation PLBatteryUIResponseTypeLastChargeLevel

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  v4 = [MEMORY[0x1E4F929C0] objectForKey:@"lastChargingValue" forApplicationID:@"com.apple.powerlogd" synchronize:1];
  [(PLBatteryUIResponseTypeLastChargeLevel *)self setLastChargeValue:v4];

  id v5 = [MEMORY[0x1E4F929C0] objectForKey:@"lastChargingTimestamp" forApplicationID:@"com.apple.powerlogd" synchronize:1];
  [(PLBatteryUIResponseTypeLastChargeLevel *)self setLastChargeTimestamp:v5];
}

- (void)run
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = [a1 lastChargeTimestamp];
  id v5 = [a1 lastChargeValue];
  int v6 = 138412546;
  v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "Missing last charge info: %@ - %@%%", (uint8_t *)&v6, 0x16u);
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
}

- (NSNumber)lastChargeValue
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastChargeValue:(id)a3
{
}

- (NSNumber)lastChargeTimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastChargeTimestamp:(id)a3
{
}

- (NSDictionary)resultDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResultDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_lastChargeTimestamp, 0);
  objc_storeStrong((id *)&self->_lastChargeValue, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end