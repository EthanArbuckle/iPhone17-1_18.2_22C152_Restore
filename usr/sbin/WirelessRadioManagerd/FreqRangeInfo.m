@interface FreqRangeInfo
- (BOOL)isEqual:(id)a3;
- (FreqRangeInfo)init;
- (FreqRangeInfo)initWithFreq:(unint64_t)a3 Bw:(unint64_t)a4;
- (FreqRangeInfo)initWithObj:(id)a3;
- (FreqRangeInfo)initWithStartFreq:(unint64_t)a3 EndFreq:(unint64_t)a4;
- (id)logPrint;
- (unint64_t)FreqEnd;
- (unint64_t)FreqStart;
- (unint64_t)bw;
- (unint64_t)centerFreq;
- (unsigned)Priority;
- (void)applyBwLimitFromCenter:(unint64_t)a3;
- (void)applyBwLimitFromRight:(unint64_t)a3;
- (void)setBwOnly:(unint64_t)a3;
- (void)setCenterFreqOnly:(unint64_t)a3;
- (void)setEndFreqOnly:(unint64_t)a3;
- (void)setFreq:(unint64_t)a3 Bw:(unint64_t)a4;
- (void)setFreqWithObj:(id)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setStartFreq:(unint64_t)a3 EndFreq:(unint64_t)a4;
- (void)setStartFreqOnly:(unint64_t)a3;
@end

@implementation FreqRangeInfo

- (FreqRangeInfo)initWithFreq:(unint64_t)a3 Bw:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FreqRangeInfo;
  result = [(FreqRangeInfo *)&v7 init];
  result->_centerFreq = a3;
  result->_bw = a4;
  result->_FreqStart = a3 - (a4 >> 1);
  result->_FreqEnd = a3 + (a4 >> 1);
  result->_Priority = 255;
  return result;
}

- (FreqRangeInfo)initWithStartFreq:(unint64_t)a3 EndFreq:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FreqRangeInfo;
  v6 = [(FreqRangeInfo *)&v8 init];
  [(FreqRangeInfo *)v6 setStartFreq:a3 EndFreq:a4];
  v6->_Priority = 255;
  return v6;
}

- (void)setStartFreq:(unint64_t)a3 EndFreq:(unint64_t)a4
{
  if (a4 >= a3) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = a4;
  }
  if (a4 <= a3) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = a4;
  }
  self->_FreqStart = v4;
  self->_FreqEnd = v5;
  self->_centerFreq = (a4 + a3) >> 1;
  self->_bw = v5 - v4;
}

- (id)logPrint
{
  return +[NSString stringWithFormat:@"[%lluHz, %lluHz]", self->_centerFreq, self->_bw];
}

- (FreqRangeInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)FreqRangeInfo;
  result = [(FreqRangeInfo *)&v3 init];
  *(_OWORD *)&result->_FreqStart = 0u;
  *(_OWORD *)&result->_centerFreq = 0u;
  result->_Priority = 255;
  return result;
}

- (void)setFreqWithObj:(id)a3
{
  id v4 = a3;
  self->_FreqStart = (unint64_t)[v4 FreqStart];
  self->_FreqEnd = (unint64_t)[v4 FreqEnd];
  self->_centerFreq = (unint64_t)[v4 centerFreq];
  id v5 = [v4 bw];

  self->_bw = (unint64_t)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id centerFreq = self->_centerFreq;
  BOOL v7 = 0;
  if (centerFreq == [v4 centerFreq])
  {
    id bw = self->_bw;
    if (bw == [v4 bw]) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (unint64_t)centerFreq
{
  return self->_centerFreq;
}

- (unint64_t)bw
{
  return self->_bw;
}

- (unint64_t)FreqStart
{
  return self->_FreqStart;
}

- (unint64_t)FreqEnd
{
  return self->_FreqEnd;
}

- (void)applyBwLimitFromRight:(unint64_t)a3
{
  if (self->_bw > a3)
  {
    unint64_t FreqEnd = self->_FreqEnd;
    self->_FreqStart = FreqEnd - a3;
    self->_id centerFreq = (FreqEnd - a3 + FreqEnd) >> 1;
    self->_id bw = a3;
  }
}

- (FreqRangeInfo)initWithObj:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FreqRangeInfo;
  id v3 = a3;
  id v4 = [(FreqRangeInfo *)&v7 init];
  v4->_FreqStart = (unint64_t)[v3 FreqStart:v7.receiver super_class:v7.super_class];
  v4->_unint64_t FreqEnd = (unint64_t)[v3 FreqEnd];
  v4->_id centerFreq = (unint64_t)[v3 centerFreq];
  id v5 = [v3 bw];

  v4->_id bw = (unint64_t)v5;
  return v4;
}

- (void)setStartFreqOnly:(unint64_t)a3
{
  self->_FreqStart = a3;
  unint64_t FreqEnd = self->_FreqEnd;
  self->_id centerFreq = (FreqEnd + a3) >> 1;
  self->_id bw = FreqEnd - a3;
}

- (void)setEndFreqOnly:(unint64_t)a3
{
  unint64_t FreqStart = self->_FreqStart;
  self->_unint64_t FreqEnd = a3;
  self->_id centerFreq = (FreqStart + a3) >> 1;
  self->_id bw = a3 - FreqStart;
}

- (void)setFreq:(unint64_t)a3 Bw:(unint64_t)a4
{
  self->_id centerFreq = a3;
  self->_id bw = a4;
  self->_unint64_t FreqStart = a3 - (a4 >> 1);
  self->_unint64_t FreqEnd = a3 + (a4 >> 1);
}

- (void)setCenterFreqOnly:(unint64_t)a3
{
  unint64_t bw = self->_bw;
  self->_unint64_t FreqStart = a3 - (bw >> 1);
  self->_unint64_t FreqEnd = a3 + (bw >> 1);
  self->_id centerFreq = a3;
}

- (void)setBwOnly:(unint64_t)a3
{
  self->_unint64_t bw = a3;
  unint64_t centerFreq = self->_centerFreq;
  self->_unint64_t FreqStart = centerFreq - (a3 >> 1);
  self->_unint64_t FreqEnd = centerFreq + (a3 >> 1);
}

- (void)applyBwLimitFromCenter:(unint64_t)a3
{
  if (self->_bw > a3)
  {
    unint64_t v3 = self->_FreqStart + self->_FreqEnd;
    unint64_t v4 = (v3 - a3) >> 1;
    unint64_t v5 = (v3 + a3) >> 1;
    self->_unint64_t FreqStart = v4;
    self->_unint64_t FreqEnd = v5;
    self->_unint64_t centerFreq = (v4 + v5) >> 1;
    self->_unint64_t bw = v5 - v4;
  }
}

- (unsigned)Priority
{
  return self->_Priority;
}

- (void)setPriority:(unsigned int)a3
{
  self->_Priority = a3;
}

@end