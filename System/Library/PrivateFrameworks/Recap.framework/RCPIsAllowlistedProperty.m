@interface RCPIsAllowlistedProperty
@end

@implementation RCPIsAllowlistedProperty

uint64_t ___RCPIsAllowlistedProperty_block_invoke()
{
  _RCPIsAllowlistedProperty_propertyNames = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"DeviceOpenedByEventSystem", @"LastActivityTimestamp", @"BatchInterval", @"PreserveTimestamp", @"BKReadyToReceivePointerEvents", 0);
  return MEMORY[0x1F41817F8]();
}

@end