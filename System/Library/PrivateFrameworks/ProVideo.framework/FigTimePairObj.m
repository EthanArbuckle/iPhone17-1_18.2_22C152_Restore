@interface FigTimePairObj
+ (BOOL)supportsSecureCoding;
+ (id)pairWithPair:(PC_CMTimePair *)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)first;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)second;
- (BOOL)isEqual:(id)a3;
- (FigTimePairObj)initWithCoder:(id)a3;
- (FigTimePairObj)initWithFigTimePair:(PC_CMTimePair *)a3;
- (FigTimePairObj)initWithFirst:(id *)a3 Second:(id *)a4;
- (PC_CMTimePair)pair;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(PC_CMTimePair *)a3;
- (void)setFirst:(id *)a3;
- (void)setPair:(PC_CMTimePair *)a3;
- (void)setSecond:(id *)a3;
@end

@implementation FigTimePairObj

- (FigTimePairObj)initWithFirst:(id *)a3 Second:(id *)a4
{
  *(void *)v7 = a3->var3;
  long long v4 = *(_OWORD *)&a3->var0;
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v7[8] = *a4;
  v6[0] = v4;
  v6[1] = *(_OWORD *)v7;
  v6[2] = *(_OWORD *)&v7[16];
  v6[3] = v4;
  return [(FigTimePairObj *)self initWithFigTimePair:v6];
}

- (FigTimePairObj)initWithFigTimePair:(PC_CMTimePair *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigTimePairObj;
  result = [(FigTimePairObj *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->first.value;
    long long v6 = *(_OWORD *)&a3->first.epoch;
    *(_OWORD *)&result->_pair.second.timescale = *(_OWORD *)&a3->second.timescale;
    *(_OWORD *)&result->_pair.first.epoch = v6;
    *(_OWORD *)&result->_pair.first.value = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigTimePairObj)initWithCoder:(id)a3
{
  long long v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"first"];
  if (v5)
  {
    [v5 time];
  }
  else
  {
    long long v9 = 0uLL;
    uint64_t v10 = 0;
  }
  long long v11 = v9;
  *(void *)v12 = v10;
  long long v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"second"];
  if (v6)
  {
    [v6 time];
  }
  else
  {
    long long v9 = 0uLL;
    uint64_t v10 = 0;
  }
  *(_OWORD *)&v12[8] = v9;
  *(void *)&v12[24] = v10;
  v8[0] = v11;
  v8[1] = *(_OWORD *)v12;
  v8[2] = *(_OWORD *)&v12[16];
  return [(FigTimePairObj *)self initWithFigTimePair:v8];
}

- (void)encodeWithCoder:(id)a3
{
  long long v5 = [FigTimeObj alloc];
  long long v8 = *(_OWORD *)&self->_pair.first.value;
  int64_t epoch = self->_pair.first.epoch;
  objc_msgSend(a3, "encodeObject:forKey:", -[FigTimeObj initWithFigTime:](v5, "initWithFigTime:", &v8), @"first");
  long long v6 = [FigTimeObj alloc];
  $95D729B680665BEAEFA1D6FCA8238556 second = self->_pair.second;
  objc_msgSend(a3, "encodeObject:forKey:", -[FigTimeObj initWithFigTime:](v6, "initWithFigTime:", &second), @"second");
}

- (id)copyWithZone:(_NSZone *)a3
{
  long long v4 = +[FigTimePairObj allocWithZone:a3];
  long long v5 = *(_OWORD *)&self->_pair.first.epoch;
  v7[0] = *(_OWORD *)&self->_pair.first.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&self->_pair.second.timescale;
  return [(FigTimePairObj *)v4 initWithFigTimePair:v7];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)first
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&self->var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)second
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (PC_CMTimePair)pair
{
  long long v3 = *(_OWORD *)&self->second.value;
  *(_OWORD *)&retstr->first.value = *(_OWORD *)&self->first.timescale;
  *(_OWORD *)&retstr->first.int64_t epoch = v3;
  *(_OWORD *)&retstr->second.timescale = *(_OWORD *)&self->second.epoch;
  return self;
}

- (void)setFirst:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_pair.first.int64_t epoch = a3->var3;
  *(_OWORD *)&self->_pair.first.value = v3;
}

- (void)setSecond:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_pair.second.int64_t epoch = a3->var3;
  *(_OWORD *)&self->_pair.second.value = v3;
}

- (void)setPair:(PC_CMTimePair *)a3
{
  long long v3 = *(_OWORD *)&a3->first.value;
  long long v4 = *(_OWORD *)&a3->first.epoch;
  *(_OWORD *)&self->_pair.second.timescale = *(_OWORD *)&a3->second.timescale;
  *(_OWORD *)&self->_pair.first.int64_t epoch = v4;
  *(_OWORD *)&self->_pair.first.value = v3;
}

- (void)getValue:(PC_CMTimePair *)a3
{
  long long v3 = *(_OWORD *)&self->_pair.first.value;
  long long v4 = *(_OWORD *)&self->_pair.second.timescale;
  *(_OWORD *)&a3->first.int64_t epoch = *(_OWORD *)&self->_pair.first.epoch;
  *(_OWORD *)&a3->second.timescale = v4;
  *(_OWORD *)&a3->first.value = v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v27 = v3;
  uint64_t v28 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v7 = *(_OWORD *)&self->_pair.first.epoch;
    long long v19 = *(_OWORD *)&self->_pair.first.value;
    *(_OWORD *)v20 = v7;
    *(_OWORD *)&v20[16] = *(_OWORD *)&self->_pair.second.timescale;
    long long v8 = *(_OWORD *)((char *)a3 + 24);
    long long v17 = *(_OWORD *)((char *)a3 + 8);
    *(_OWORD *)v18 = v8;
    *(_OWORD *)&v18[16] = *(_OWORD *)((char *)a3 + 40);
    CMTime time1 = (CMTime)self->_pair.first;
    $95D729B680665BEAEFA1D6FCA8238556 first = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)a3 + 8);
    if (!CMTimeCompare(&time1, (CMTime *)&first))
    {
      CMTime v25 = *(CMTime *)&v20[8];
      long long v23 = *(_OWORD *)&v18[8];
      uint64_t v24 = *(void *)&v18[24];
      long long v9 = &v25;
      uint64_t v10 = (CMTime *)&v23;
      return CMTimeCompare(v9, v10) == 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !strcmp((const char *)[a3 objCType], "{PC_CMTimePair={?=qiIq}{?=qiIq}}"))
    {
      [a3 getValue:&time1];
      *(_OWORD *)v13 = *(_OWORD *)&self->_pair.first.epoch;
      *(_OWORD *)&v13[16] = *(_OWORD *)&self->_pair.second.timescale;
      *(void *)v12 = v15;
      *(_OWORD *)&v12[8] = v16;
      $95D729B680665BEAEFA1D6FCA8238556 first = self->_pair.first;
      CMTime v25 = time1;
      if (!CMTimeCompare((CMTime *)&first, &v25))
      {
        long long v23 = *(_OWORD *)&v13[8];
        uint64_t v24 = *(void *)&v13[24];
        long long v21 = *(_OWORD *)v12;
        uint64_t v22 = *(void *)&v12[16];
        long long v9 = (CMTime *)&v23;
        uint64_t v10 = (CMTime *)&v21;
        return CMTimeCompare(v9, v10) == 0;
      }
    }
  }
  return 0;
}

- (unint64_t)hash
{
  long long v3 = *(_OWORD *)&self->_pair.first.value;
  int64_t epoch = self->_pair.first.epoch;
  return GetCMTimeHash((uint64_t)&v3);
}

+ (id)pairWithPair:(PC_CMTimePair *)a3
{
  uint64_t v4 = [FigTimePairObj alloc];
  long long v5 = *(_OWORD *)&a3->first.epoch;
  v7[0] = *(_OWORD *)&a3->first.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->second.timescale;
  return [(FigTimePairObj *)v4 initWithFigTimePair:v7];
}

@end