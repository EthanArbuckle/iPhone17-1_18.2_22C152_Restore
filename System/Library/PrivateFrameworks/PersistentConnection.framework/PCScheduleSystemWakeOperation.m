@interface PCScheduleSystemWakeOperation
- (id)initForScheduledWake:(BOOL)a3 wakeDate:(id)a4 acceptableDelay:(double)a5 userVisible:(BOOL)a6 serviceIdentifier:(id)a7 uniqueIdentifier:(void *)a8;
- (void)main;
@end

@implementation PCScheduleSystemWakeOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_wakeDate, 0);
}

- (void)main
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1D340D000, a2, OS_LOG_TYPE_FAULT, "Unable to take power assertion. IOPMAssertionCreateWithName() returned %#x", (uint8_t *)v2, 8u);
}

- (id)initForScheduledWake:(BOOL)a3 wakeDate:(id)a4 acceptableDelay:(double)a5 userVisible:(BOOL)a6 serviceIdentifier:(id)a7 uniqueIdentifier:(void *)a8
{
  id v15 = a4;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PCScheduleSystemWakeOperation;
  v17 = [(PCScheduleSystemWakeOperation *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_scheduleOrCancel = a3;
    objc_storeStrong((id *)&v17->_wakeDate, a4);
    v18->_acceptableDelay = a5;
    v18->_userVisible = a6;
    uint64_t v19 = [v16 copy];
    serviceIdentifier = v18->_serviceIdentifier;
    v18->_serviceIdentifier = (NSString *)v19;

    v18->_unqiueIdentifier = a8;
  }

  return v18;
}

@end