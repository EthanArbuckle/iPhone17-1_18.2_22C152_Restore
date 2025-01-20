@interface SAThreadStateMicrostackshot
+ (id)stateWithMicrostackshot:(const micro_snapshot *)a3 thread:(const thread_snapshot *)a4 startTimestamp:(id)a5 endTimestamp:(id)a6 startSampleIndex:(unint64_t)a7 endSampleIndex:(unint64_t)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 machTimebase:(mach_timebase_info)a12;
- (BOOL)isBatteryAndUserActivityValid;
- (BOOL)isIORecord;
- (BOOL)isInterruptRecord;
- (BOOL)isMicrostackshot;
- (BOOL)isOnBattery;
- (BOOL)isTimerArmingRecord;
- (BOOL)isUserActive;
- (BOOL)isUserMode;
- (unsigned)cpuSpeedMhz;
- (unsigned)microstackshotFlags;
@end

@implementation SAThreadStateMicrostackshot

- (unsigned)microstackshotFlags
{
  return self->_microstackshotFlags;
}

- (BOOL)isMicrostackshot
{
  return self->_microstackshotFlags & 1;
}

- (BOOL)isInterruptRecord
{
  return (self->_microstackshotFlags >> 1) & 1;
}

- (BOOL)isTimerArmingRecord
{
  return (self->_microstackshotFlags >> 2) & 1;
}

- (BOOL)isIORecord
{
  return (self->_microstackshotFlags >> 3) & 1;
}

- (BOOL)isUserMode
{
  return (self->_microstackshotFlags >> 4) & 1;
}

- (BOOL)isBatteryAndUserActivityValid
{
  return (self->_microstackshotFlags >> 5) & 1;
}

- (BOOL)isUserActive
{
  return (self->_microstackshotFlags >> 6) & 1;
}

- (BOOL)isOnBattery
{
  return self->_microstackshotFlags >> 7;
}

- (unsigned)cpuSpeedMhz
{
  return 100 * self->_cpuSpeed100Mhz;
}

+ (id)stateWithMicrostackshot:(const micro_snapshot *)a3 thread:(const thread_snapshot *)a4 startTimestamp:(id)a5 endTimestamp:(id)a6 startSampleIndex:(unint64_t)a7 endSampleIndex:(unint64_t)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 machTimebase:(mach_timebase_info)a12
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a6;
  id v21 = a5;
  v22 = [SAThreadStateMicrostackshot alloc];
  if (v22)
  {
    v31.receiver = v22;
    v31.super_class = (Class)SAThreadStateMicrostackshot;
    v23 = objc_msgSendSuper2(&v31, sel_initWithStackshotThreadV1_startTimestamp_endTimestamp_startSampleIndex_endSampleIndex_leafUserFrame_leafOfCRootFramesReplacedBySwiftAsync_leafKernelFrame_machTimebase_, a4, v21, v20, a7, a8, v19, v18, v17, a12);
    v24 = v23;
    if (v23)
    {
      unsigned int v25 = *(unsigned __int16 *)(&a3->var4 + 1);
      if (a3->var4) {
        char v26 = 3;
      }
      else {
        char v26 = 1;
      }
      char v27 = a3->var4 & 8 | (4 * ((a3->var4 & 2) != 0)) & 0xEF | (16 * ((a3->var4 & 4) != 0)) | v26;
      if ((v25 & 2) != 0) {
        char v28 = 96;
      }
      else {
        char v28 = 32;
      }
      if (v25) {
        v27 |= v28 & 0x7F | ((v25 >> 2) << 7);
      }
      v23[184] = v27;
      v23[19] |= 0x40u;
      -[SAThreadState setCpuNum:]((uint64_t)v23, LOWORD(a3->var1));
      v24[93] = HIWORD(a3->var1);
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end