@interface FPTime
+ (FPTime)now;
- (FPTime)init;
- (NSDate)date;
- (double)wallTime;
- (unint64_t)machAbsoluteTime;
- (unint64_t)machAbsoluteTimeNsec;
- (unint64_t)machContinuousTime;
- (unint64_t)machContinuousTimeNsec;
@end

@implementation FPTime

- (FPTime)init
{
  v5.receiver = self;
  v5.super_class = (Class)FPTime;
  v2 = [(FPTime *)&v5 init];
  if (v2)
  {
    v3 = 0;
    if (!mach_get_times())
    {
      v2->_wallTime = (double)0 - *MEMORY[0x263EFFAF8] + (double)0 * 0.000000001;
      v3 = v2;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (FPTime)now
{
  v2 = objc_alloc_init(FPTime);

  return v2;
}

- (unint64_t)machAbsoluteTimeNsec
{
  unint64_t machAbsoluteTime = self->_machAbsoluteTime;
  if (qword_26AB1E328 != -1) {
    dispatch_once(&qword_26AB1E328, &unk_26CFD2670);
  }
  return machAbsoluteTime * dword_26AB1E320 / *(unsigned int *)algn_26AB1E324;
}

- (unint64_t)machContinuousTimeNsec
{
  unint64_t machContinuousTime = self->_machContinuousTime;
  if (qword_26AB1E328 != -1) {
    dispatch_once(&qword_26AB1E328, &unk_26CFD2670);
  }
  return machContinuousTime * dword_26AB1E320 / *(unsigned int *)algn_26AB1E324;
}

- (NSDate)date
{
  return (NSDate *)MEMORY[0x270F9A6D0](MEMORY[0x263EFF910], sel_dateWithTimeIntervalSinceReferenceDate_);
}

- (unint64_t)machAbsoluteTime
{
  return self->_machAbsoluteTime;
}

- (unint64_t)machContinuousTime
{
  return self->_machContinuousTime;
}

- (double)wallTime
{
  return self->_wallTime;
}

@end