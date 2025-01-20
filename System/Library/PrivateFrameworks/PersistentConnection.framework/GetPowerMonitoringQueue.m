@interface GetPowerMonitoringQueue
@end

@implementation GetPowerMonitoringQueue

uint64_t ___GetPowerMonitoringQueue_block_invoke()
{
  sPowerMonitoringQueue = (uint64_t)dispatch_queue_create("PCSimpleTimer-powermonitoringq", 0);
  return MEMORY[0x1F41817F8]();
}

@end