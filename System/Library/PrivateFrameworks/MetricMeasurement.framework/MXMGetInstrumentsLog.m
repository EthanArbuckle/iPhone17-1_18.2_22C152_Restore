@interface MXMGetInstrumentsLog
@end

@implementation MXMGetInstrumentsLog

uint64_t ___MXMGetInstrumentsLog_block_invoke()
{
  _MXMGetInstrumentsLog__instrumentsLogger = (uint64_t)os_log_create("com.apple.metricmeasurement", "PointsOfInterest");
  return MEMORY[0x270F9A758]();
}

@end