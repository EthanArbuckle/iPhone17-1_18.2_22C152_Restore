@interface FigTimeObj
+ (BOOL)classIsAbstract;
+ (BOOL)supportsSecureCoding;
+ (id)timeWithTime:(id *)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)isEqual:(id)a3;
- (FigTimeObj)initWithCMTime:(id *)a3;
- (FigTimeObj)initWithCoder:(id)a3;
- (FigTimeObj)initWithFigTime:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compareWithTime:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(id *)a3;
- (void)setTime:(id *)a3;
@end

@implementation FigTimeObj

- (FigTimeObj)initWithFigTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  return [(FigTimeObj *)self initWithCMTime:&v4];
}

- (FigTimeObj)initWithCMTime:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigTimeObj;
  result = [(FigTimeObj *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    result->_time.epoch = a3->var3;
    *(_OWORD *)&result->_time.value = v5;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (void)getValue:(id *)a3
{
  long long v3 = *(_OWORD *)&self->_time.value;
  a3->var3 = self->_time.epoch;
  *(_OWORD *)&a3->var0 = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigTimeObj)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigTimeObj;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = [(FigTimeObj *)&v6 init];
  if (v4)
  {
    v4->_time.epoch = [a3 decodeInt64ForKey:@"epoch"];
    v4->_time.value = [a3 decodeInt64ForKey:@"value"];
    v4->_time.timescale = [a3 decodeInt32ForKey:@"timescale"];
    v4->_time.flags = [a3 decodeInt32ForKey:@"flags"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_time.epoch forKey:@"epoch"];
  [a3 encodeInt64:self->_time.value forKey:@"value"];
  [a3 encodeInt32:self->_time.timescale forKey:@"timescale"];
  uint64_t flags = self->_time.flags;

  [a3 encodeInt32:flags forKey:@"flags"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = +[FigTimeObj allocWithZone:a3];
  $95D729B680665BEAEFA1D6FCA8238556 time = self->_time;
  return [(FigTimeObj *)v4 initWithCMTime:&time];
}

- (int64_t)compareWithTime:(id)a3
{
  CMTime time1 = (CMTime)self->_time;
  CMTime v5 = *(CMTime *)((char *)a3 + 8);
  int32_t v3 = CMTimeCompare(&time1, &v5);
  if (v3 < 0) {
    return -1;
  }
  else {
    return v3 != 0;
  }
}

- (unint64_t)hash
{
  uint64_t timescale = self->_time.timescale;
  if (timescale) {
    return ((self->_time.value << 10) / timescale);
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v19 = v3;
  uint64_t v20 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = *(_OWORD *)&self->_time.value;
    int64_t epoch = self->_time.epoch;
    CMTime time2 = *(CMTime *)((char *)a3 + 8);
    v7 = (CMTime *)&v17;
    p_CMTime time2 = &time2;
    return CMTimeCompare(v7, p_time2) == 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !strcmp((const char *)[a3 objCType], "{?=qiIq}"))
  {
    [a3 getValue:&v14];
    long long v12 = *(_OWORD *)&self->_time.value;
    int64_t v13 = self->_time.epoch;
    long long v10 = v14;
    uint64_t v11 = v15;
    v7 = (CMTime *)&v12;
    p_CMTime time2 = (CMTime *)&v10;
    return CMTimeCompare(v7, p_time2) == 0;
  }
  return 0;
}

+ (id)timeWithTime:(id *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  return (id)[v4 initWithCMTime:&v6];
}

+ (BOOL)classIsAbstract
{
  return 0;
}

@end