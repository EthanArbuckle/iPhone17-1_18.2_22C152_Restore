@interface FigTimeRangeObj
+ (BOOL)supportsSecureCoding;
+ (id)rangeWithRange:(id *)a3;
- ($202A6A048D39AE170264FF71A65A9479)range;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)end;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)start;
- (BOOL)isEqual:(id)a3;
- (FigTimeRangeObj)initWithCMTimeRange:(id *)a3;
- (FigTimeRangeObj)initWithCoder:(id)a3;
- (FigTimeRangeObj)initWithFigTimeRange:(id *)a3;
- (id)copyWithRange:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)sortByStartTimeAscending:(id)a3;
- (int64_t)sortByStartTimeDescending:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(id *)a3;
- (void)setDuration:(id *)a3;
- (void)setRange:(id *)a3;
- (void)setStart:(id *)a3;
@end

@implementation FigTimeRangeObj

- (id)copyWithRange:(id *)a3
{
  v4 = [FigTimeRangeObj alloc];
  long long v5 = *(_OWORD *)&a3->var0.var3;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  return [(FigTimeRangeObj *)v4 initWithFigTimeRange:v7];
}

- (FigTimeRangeObj)initWithFigTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  return [(FigTimeRangeObj *)self initWithCMTimeRange:v5];
}

- (FigTimeRangeObj)initWithCMTimeRange:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigTimeRangeObj;
  result = [(FigTimeRangeObj *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0.var0;
    long long v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_range.start.epoch = v6;
    *(_OWORD *)&result->_range.start.value = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigTimeRangeObj)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)FigTimeRangeObj;
  v4 = [(FigTimeRangeObj *)&v10 init];
  if (v4)
  {
    long long v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"start"];
    if (v5)
    {
      [v5 time];
    }
    else
    {
      long long v8 = 0uLL;
      uint64_t v9 = 0;
    }
    *((void *)v4 + 3) = v9;
    *(_OWORD *)(v4 + 8) = v8;
    long long v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"duration"];
    if (v6)
    {
      [v6 time];
    }
    else
    {
      long long v8 = 0uLL;
      uint64_t v9 = 0;
    }
    *((_OWORD *)v4 + 2) = v8;
    *((void *)v4 + 6) = v9;
  }
  return (FigTimeRangeObj *)v4;
}

+ (id)rangeWithRange:(id *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  long long v5 = *(_OWORD *)&a3->var0.var3;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  return (id)[v4 initWithCMTimeRange:v7];
}

- (void)encodeWithCoder:(id)a3
{
  long long v5 = [FigTimeObj alloc];
  long long v8 = *(_OWORD *)&self->_range.start.value;
  int64_t epoch = self->_range.start.epoch;
  objc_msgSend(a3, "encodeObject:forKey:", -[FigTimeObj initWithCMTime:](v5, "initWithCMTime:", &v8), @"start");
  long long v6 = [FigTimeObj alloc];
  $95D729B680665BEAEFA1D6FCA8238556 duration = self->_range.duration;
  objc_msgSend(a3, "encodeObject:forKey:", -[FigTimeObj initWithCMTime:](v6, "initWithCMTime:", &duration), @"duration");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[FigTimeRangeObj allocWithZone:a3];
  long long v5 = *(_OWORD *)&self->_range.start.epoch;
  v7[0] = *(_OWORD *)&self->_range.start.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&self->_range.duration.timescale;
  return [(FigTimeRangeObj *)v4 initWithCMTimeRange:v7];
}

- ($202A6A048D39AE170264FF71A65A9479)range
{
  long long v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (void)setRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_range.start.int64_t epoch = v4;
  *(_OWORD *)&self->_range.start.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)start
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&self->var1;
  return self;
}

- (void)setStart:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_range.start.int64_t epoch = a3->var3;
  *(_OWORD *)&self->_range.start.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)end
{
  long long v3 = *(_OWORD *)&self->_range.start.epoch;
  v5[0] = *(_OWORD *)&self->_range.start.value;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&self->_range.duration.timescale;
  PC_CMTimeRangeEnd((uint64_t)v5, (uint64_t)retstr);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_range.duration.int64_t epoch = a3->var3;
  *(_OWORD *)&self->_range.duration.value = v3;
}

- (void)getValue:(id *)a3
{
  long long v3 = *(_OWORD *)&self->_range.start.value;
  long long v4 = *(_OWORD *)&self->_range.duration.timescale;
  *(_OWORD *)&a3->var0.var3 = *(_OWORD *)&self->_range.start.epoch;
  *(_OWORD *)&a3->var1.var1 = v4;
  *(_OWORD *)&a3->var0.var0 = v3;
}

- (id)description
{
  long long v2 = *(_OWORD *)&self->_range.start.epoch;
  *(_OWORD *)&v4.start.value = *(_OWORD *)&self->_range.start.value;
  *(_OWORD *)&v4.start.int64_t epoch = v2;
  *(_OWORD *)&v4.duration.timescale = *(_OWORD *)&self->_range.duration.timescale;
  return (id)PC_CMTimeRangeToString(&v4);
}

- (int64_t)sortByStartTimeAscending:(id)a3
{
  if (self)
  {
    [(FigTimeRangeObj *)self start];
    if (a3)
    {
LABEL_3:
      [a3 start];
      goto LABEL_6;
    }
  }
  else
  {
    memset(&time1, 0, sizeof(time1));
    if (a3) {
      goto LABEL_3;
    }
  }
  memset(&v6, 0, sizeof(v6));
LABEL_6:
  int32_t v4 = CMTimeCompare(&time1, &v6);
  if (v4 < 0) {
    return -1;
  }
  else {
    return v4 != 0;
  }
}

- (int64_t)sortByStartTimeDescending:(id)a3
{
  if (self)
  {
    [(FigTimeRangeObj *)self start];
    if (a3)
    {
LABEL_3:
      [a3 start];
      goto LABEL_6;
    }
  }
  else
  {
    memset(&time1, 0, sizeof(time1));
    if (a3) {
      goto LABEL_3;
    }
  }
  memset(&v6, 0, sizeof(v6));
LABEL_6:
  int32_t v4 = CMTimeCompare(&time1, &v6);
  if (v4 > 0) {
    return -1;
  }
  else {
    return v4 >> 31;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v7 = *(_OWORD *)&self->_range.start.epoch;
    v17[0] = *(_OWORD *)&self->_range.start.value;
    v17[1] = v7;
    v17[2] = *(_OWORD *)&self->_range.duration.timescale;
    long long v8 = *(_OWORD *)((char *)a3 + 24);
    v16[0] = *(_OWORD *)((char *)a3 + 8);
    v16[1] = v8;
    v16[2] = *(_OWORD *)((char *)a3 + 40);
    uint64_t v9 = (CMTimeRange *)v17;
    objc_super v10 = (CMTimeRange *)v16;
    return CMTimeRangeEqual(v9, v10) != 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !strcmp((const char *)[a3 objCType], "{?={?=qiIq}{?=qiIq}}"))
  {
    [a3 getValue:v15];
    long long v12 = *(_OWORD *)&self->_range.start.epoch;
    v14[0] = *(_OWORD *)&self->_range.start.value;
    v14[1] = v12;
    v14[2] = *(_OWORD *)&self->_range.duration.timescale;
    v13[0] = v15[0];
    v13[1] = v15[1];
    v13[2] = v15[2];
    uint64_t v9 = (CMTimeRange *)v14;
    objc_super v10 = (CMTimeRange *)v13;
    return CMTimeRangeEqual(v9, v10) != 0;
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t timescale = self->_range.start.timescale;
  if (timescale) {
    return ((self->_range.start.value << 10) / timescale);
  }
  else {
    return 0;
  }
}

@end