@interface REMChangeTracking(REMAuxiliaryChangeInfoAdditions)
@end

@implementation REMChangeTracking(REMAuxiliaryChangeInfoAdditions)

- (void)fetchAuxiliaryChangeInfosOfType:()REMAuxiliaryChangeInfoAdditions withChangeObject:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (coalescedChangeObjects == nil) -- changeObject.coalescedChanges should not be nil if changeObject.isCoalesced is YES", v1, 2u);
}

@end