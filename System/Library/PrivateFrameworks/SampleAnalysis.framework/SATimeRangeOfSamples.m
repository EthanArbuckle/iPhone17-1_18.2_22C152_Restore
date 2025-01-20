@interface SATimeRangeOfSamples
- (SATimeRangeOfSamples)initWithStartTime:(id)a3 endTime:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6;
- (SATimestamp)endTime;
- (SATimestamp)startTime;
- (id)debugDescription;
- (unint64_t)endSampleIndex;
- (unint64_t)startSampleIndex;
- (void)setEndSampleIndex:(unint64_t)a3;
- (void)setEndTime:(id)a3;
- (void)setStartSampleIndex:(unint64_t)a3;
- (void)setStartTime:(id)a3;
@end

@implementation SATimeRangeOfSamples

- (SATimeRangeOfSamples)initWithStartTime:(id)a3 endTime:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SATimeRangeOfSamples;
  v13 = [(SATimeRangeOfSamples *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startTime, a3);
    objc_storeStrong((id *)&v14->_endTime, a4);
    v14->_startSampleIndex = a5;
    v14->_endSampleIndex = a6;
  }

  return v14;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  unint64_t startSampleIndex = self->_startSampleIndex;
  unint64_t endSampleIndex = self->_endSampleIndex;
  v6 = [(SATimestamp *)self->_startTime debugDescription];
  v7 = [(SATimestamp *)self->_endTime debugDescription];
  v8 = (void *)[v3 initWithFormat:@"%lu-%lu %@-%@", startSampleIndex, endSampleIndex, v6, v7];

  return v8;
}

- (SATimestamp)startTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartTime:(id)a3
{
}

- (SATimestamp)endTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndTime:(id)a3
{
}

- (unint64_t)startSampleIndex
{
  return self->_startSampleIndex;
}

- (void)setStartSampleIndex:(unint64_t)a3
{
  self->_unint64_t startSampleIndex = a3;
}

- (unint64_t)endSampleIndex
{
  return self->_endSampleIndex;
}

- (void)setEndSampleIndex:(unint64_t)a3
{
  self->_unint64_t endSampleIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end