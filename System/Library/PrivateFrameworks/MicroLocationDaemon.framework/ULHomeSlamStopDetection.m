@interface ULHomeSlamStopDetection
- (BOOL)_shouldExitStaticState:(const void *)a3;
- (ULDatabase)db;
- (ULHomeSlamFence)largeFence;
- (ULHomeSlamFence)smallFence;
- (ULHomeSlamFence)staticFence;
- (ULHomeSlamStopDetection)initWithDB:(ULDatabase *)a3;
- (ULHomeSlamTimer)longTimer;
- (ULHomeSlamTimer)shortTimer;
- (id)_getStopMotionTriggersFromOdometryEntries:()vector<CLMiLoOdometryTable:(std::allocator<CLMiLoOdometryTable::Entry>> *)a3 :Entry;
- (id)_shouldExitMotionState:(const void *)a3;
- (id)runStopDetectionAnalysisFromTime:(double)a3 toTime:;
- (int64_t)state;
- (uint64_t)_timepointToDate:(double)a1;
- (void)_enterMotionStateAtTime:(void *)a1;
- (void)_enterStaticState;
- (void)_runMotionStateLogicWithEntry:(const void *)a3 andTriggers:(id)a4;
- (void)_runStaticStateLogicWithEntry:(const void *)a3 andTriggers:(id)a4;
- (void)_setLargeMotionFence;
- (void)_setLongMotionTimerStartingDate:(id)a3;
- (void)_setShortMotionTimerStartingDate:(id)a3;
- (void)_setSmallMotionFence;
- (void)_setStaticFence;
- (void)_updateFencesAndTimersInMotionStateWithEntry:(const void *)a3;
- (void)setDb:(ULDatabase *)a3;
- (void)setLargeFence:(id)a3;
- (void)setLongTimer:(id)a3;
- (void)setShortTimer:(id)a3;
- (void)setSmallFence:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStaticFence:(id)a3;
@end

@implementation ULHomeSlamStopDetection

- (ULHomeSlamStopDetection)initWithDB:(ULDatabase *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ULHomeSlamStopDetection;
  v4 = [(ULHomeSlamStopDetection *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ULHomeSlamStopDetection *)v4 setDb:a3];
  }
  return v5;
}

- (id)runStopDetectionAnalysisFromTime:(double)a3 toTime:
{
  id v6 = *(id *)([a1 db] + 120);
  objc_super v7 = v6;
  if (v6)
  {
    [v6 fetchOdometryASCFromTime:a2 toTime:a3];
  }
  else
  {
    v11 = 0;
    v12 = 0;
    uint64_t v13 = 0;
  }

  memset(v10, 0, sizeof(v10));
  std::vector<CLMiLoOdometryTable::Entry>::__init_with_size[abi:ne180100]<CLMiLoOdometryTable::Entry*,CLMiLoOdometryTable::Entry*>((char *)v10, v11, v12, ((char *)v12 - (char *)v11) >> 5);
  v8 = [a1 _getStopMotionTriggersFromOdometryEntries:v10];
  v14 = (long long **)v10;
  std::vector<CLMiLoOdometryTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  v14 = &v11;
  std::vector<CLMiLoOdometryTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  return v8;
}

- (id)_getStopMotionTriggersFromOdometryEntries:()vector<CLMiLoOdometryTable:(std::allocator<CLMiLoOdometryTable::Entry>> *)a3 :Entry
{
  v5 = [MEMORY[0x263EFF980] array];
  [(ULHomeSlamStopDetection *)self _enterStaticState];
  var0 = a3->var0;
  var1 = a3->var1;
  while (var0 != var1)
  {
    int64_t v8 = [(ULHomeSlamStopDetection *)self state];
    if (v8)
    {
      if (v8 == 1) {
        [(ULHomeSlamStopDetection *)self _runStaticStateLogicWithEntry:var0 andTriggers:v5];
      }
    }
    else
    {
      [(ULHomeSlamStopDetection *)self _runMotionStateLogicWithEntry:var0 andTriggers:v5];
    }
    var0 += 2;
  }
  return v5;
}

- (void)_runStaticStateLogicWithEntry:(const void *)a3 andTriggers:(id)a4
{
  id v9 = a4;
  if ([(ULHomeSlamStopDetection *)self _shouldExitStaticState:a3])
  {
    [(ULHomeSlamStopDetection *)self _enterMotionStateAtTime:*((double *)a3 + 2)];
    id v6 = [ULHomeSlamMotionChangeTrigger alloc];
    objc_super v7 = [(ULHomeSlamStopDetection *)self _timepointToDate:*((double *)a3 + 2)];
    int64_t v8 = [(ULHomeSlamMotionChangeTrigger *)v6 initWithdate:v7 andTrigger:0];
    [v9 addObject:v8];
  }
}

- (void)_runMotionStateLogicWithEntry:(const void *)a3 andTriggers:(id)a4
{
  id v8 = a4;
  id v6 = [(ULHomeSlamStopDetection *)self _shouldExitMotionState:a3];
  if (v6)
  {
    objc_super v7 = [[ULHomeSlamMotionChangeTrigger alloc] initWithdate:v6 andTrigger:1];
    [v8 addObject:v7];

    [(ULHomeSlamStopDetection *)self _enterStaticState];
    [(ULHomeSlamStopDetection *)self _runStaticStateLogicWithEntry:a3 andTriggers:v8];
  }
  else
  {
    [(ULHomeSlamStopDetection *)self _updateFencesAndTimersInMotionStateWithEntry:a3];
  }
}

- (BOOL)_shouldExitStaticState:(const void *)a3
{
  v4 = [(ULHomeSlamStopDetection *)self staticFence];
  LOBYTE(a3) = [v4 didFenceCrossWithOdometryEntry:a3];

  return (char)a3;
}

- (id)_shouldExitMotionState:(const void *)a3
{
  v4 = [(ULHomeSlamStopDetection *)self _timepointToDate:*((double *)a3 + 2)];
  v5 = [(ULHomeSlamStopDetection *)self shortTimer];
  id v6 = [v5 checkTimeoutAtDate:v4];

  if (!v6)
  {
    objc_super v7 = [(ULHomeSlamStopDetection *)self longTimer];
    id v6 = [v7 checkTimeoutAtDate:v4];
  }
  return v6;
}

- (void)_updateFencesAndTimersInMotionStateWithEntry:(const void *)a3
{
  id v9 = [(ULHomeSlamStopDetection *)self _timepointToDate:*((double *)a3 + 2)];
  v5 = [(ULHomeSlamStopDetection *)self largeFence];
  int v6 = [v5 didFenceCrossWithOdometryEntry:a3];

  if (v6) {
    [(ULHomeSlamStopDetection *)self _setLongMotionTimerStartingDate:v9];
  }
  objc_super v7 = [(ULHomeSlamStopDetection *)self smallFence];
  int v8 = [v7 didFenceCrossWithOdometryEntry:a3];

  if (v8) {
    [(ULHomeSlamStopDetection *)self _setShortMotionTimerStartingDate:v9];
  }
}

- (void)_enterStaticState
{
  [(ULHomeSlamStopDetection *)self setState:1];
  [(ULHomeSlamStopDetection *)self _setStaticFence];
}

- (void)_enterMotionStateAtTime:(void *)a1
{
  [a1 setState:0];
  [a1 _setLargeMotionFence];
  [a1 _setSmallMotionFence];
  id v4 = [a1 _timepointToDate:a2];
  objc_msgSend(a1, "_setLongMotionTimerStartingDate:");
  [a1 _setShortMotionTimerStartingDate:v4];
}

- (void)_setStaticFence
{
  v3 = [ULHomeSlamFence alloc];
  id v4 = +[ULDefaultsSingleton shared];
  v5 = [v4 defaultsDictionary];

  int v6 = [NSString stringWithUTF8String:"ULHomeSlamStaticFenceSize"];
  objc_super v7 = [v5 objectForKey:v6];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v8 = v7;
  }
  else {
    id v8 = &unk_2704F0D50;
  }
  id v10 = v8;

  [v10 floatValue];
  id v9 = -[ULHomeSlamFence initWithFenceRadius:](v3, "initWithFenceRadius:");
  [(ULHomeSlamStopDetection *)self setStaticFence:v9];
}

- (void)_setLargeMotionFence
{
  v3 = [ULHomeSlamFence alloc];
  id v4 = +[ULDefaultsSingleton shared];
  v5 = [v4 defaultsDictionary];

  int v6 = [NSString stringWithUTF8String:"ULHomeSlamMotionLargeFenceSize"];
  objc_super v7 = [v5 objectForKey:v6];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v8 = v7;
  }
  else {
    id v8 = &unk_2704F1140;
  }
  id v10 = v8;

  [v10 floatValue];
  id v9 = -[ULHomeSlamFence initWithFenceRadius:](v3, "initWithFenceRadius:");
  [(ULHomeSlamStopDetection *)self setLargeFence:v9];
}

- (void)_setSmallMotionFence
{
  v3 = [ULHomeSlamFence alloc];
  id v4 = +[ULDefaultsSingleton shared];
  v5 = [v4 defaultsDictionary];

  int v6 = [NSString stringWithUTF8String:"ULHomeSlamMotionSmallFenceSize"];
  objc_super v7 = [v5 objectForKey:v6];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v8 = v7;
  }
  else {
    id v8 = &unk_2704F0D60;
  }
  id v10 = v8;

  [v10 floatValue];
  id v9 = -[ULHomeSlamFence initWithFenceRadius:](v3, "initWithFenceRadius:");
  [(ULHomeSlamStopDetection *)self setSmallFence:v9];
}

- (void)_setLongMotionTimerStartingDate:(id)a3
{
  id v11 = a3;
  id v4 = [ULHomeSlamTimer alloc];
  v5 = +[ULDefaultsSingleton shared];
  int v6 = [v5 defaultsDictionary];

  objc_super v7 = [NSString stringWithUTF8String:"ULHomeSlamMotionLongTimerLength"];
  id v8 = [v6 objectForKey:v7];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v9 = v8;
  }
  else {
    id v9 = &unk_2704F1128;
  }

  [v9 doubleValue];
  id v10 = -[ULHomeSlamTimer initWithTimeout:andStartTime:](v4, "initWithTimeout:andStartTime:", v11);
  [(ULHomeSlamStopDetection *)self setLongTimer:v10];
}

- (void)_setShortMotionTimerStartingDate:(id)a3
{
  id v11 = a3;
  id v4 = [ULHomeSlamTimer alloc];
  v5 = +[ULDefaultsSingleton shared];
  int v6 = [v5 defaultsDictionary];

  objc_super v7 = [NSString stringWithUTF8String:"ULHomeSlamMotionShortTimerLength"];
  id v8 = [v6 objectForKey:v7];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v9 = v8;
  }
  else {
    id v9 = &unk_2704F1110;
  }

  [v9 doubleValue];
  id v10 = -[ULHomeSlamTimer initWithTimeout:andStartTime:](v4, "initWithTimeout:andStartTime:", v11);
  [(ULHomeSlamStopDetection *)self setShortTimer:v10];
}

- (uint64_t)_timepointToDate:(double)a1
{
  return [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)a1];
}

- (ULDatabase)db
{
  return self->_db;
}

- (void)setDb:(ULDatabase *)a3
{
  self->_db = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (ULHomeSlamFence)largeFence
{
  return self->_largeFence;
}

- (void)setLargeFence:(id)a3
{
}

- (ULHomeSlamFence)smallFence
{
  return self->_smallFence;
}

- (void)setSmallFence:(id)a3
{
}

- (ULHomeSlamFence)staticFence
{
  return self->_staticFence;
}

- (void)setStaticFence:(id)a3
{
}

- (ULHomeSlamTimer)longTimer
{
  return self->_longTimer;
}

- (void)setLongTimer:(id)a3
{
}

- (ULHomeSlamTimer)shortTimer
{
  return self->_shortTimer;
}

- (void)setShortTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTimer, 0);
  objc_storeStrong((id *)&self->_longTimer, 0);
  objc_storeStrong((id *)&self->_staticFence, 0);
  objc_storeStrong((id *)&self->_smallFence, 0);
  objc_storeStrong((id *)&self->_largeFence, 0);
}

@end