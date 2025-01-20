@interface SignpostSupportMachTimeTranslationRange
- (BOOL)containsMachAbsoluteTime:(unint64_t)a3;
- (BOOL)containsMachContinuousTime:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)setEndMachAbsoluteTimestamp:(unint64_t)a3 endMachContinuousTime:(unint64_t)a4;
- (SignpostSupportMachTimeTranslationRange)initWithArrayRepresentation:(id)a3;
- (SignpostSupportMachTimeTranslationRange)initWithStartMachAbsoluteTime:(unint64_t)a3 startContinuousTime:(unint64_t)a4;
- (id)debugDescription;
- (id)serializableArrayRepresentation;
- (int64_t)absoluteMinusContinuousDelta;
- (int64_t)continuousMinusAbsoluteDelta;
- (unint64_t)endMachAbsoluteTime;
- (unint64_t)endMachContinuousTime;
- (unint64_t)machAbsoluteTimeForMachContinuousTime:(unint64_t)a3;
- (unint64_t)machContinuousTimeDuration;
- (unint64_t)machContinuousTimeForMachAbsoluteTime:(unint64_t)a3;
- (unint64_t)startMachAbsoluteTime;
- (unint64_t)startMachContinuousTime;
@end

@implementation SignpostSupportMachTimeTranslationRange

- (id)debugDescription
{
  unint64_t v3 = [(SignpostSupportMachTimeTranslationRange *)self endMachContinuousTime];
  v4 = NSString;
  unint64_t v5 = [(SignpostSupportMachTimeTranslationRange *)self startMachAbsoluteTime];
  if (v3 == -1) {
    objc_msgSend(v4, "stringWithFormat:", @"machAbsoluteTime: [%llu - Unknown] machContinuousTime: [%llu - Unknown]", v5, -[SignpostSupportMachTimeTranslationRange startMachContinuousTime](self, "startMachContinuousTime"), v8, v9);
  }
  else {
  v6 = objc_msgSend(v4, "stringWithFormat:", @"machAbsoluteTime: [%llu - %llu] machContinuousTime: [%llu - %llu]", v5, -[SignpostSupportMachTimeTranslationRange endMachAbsoluteTime](self, "endMachAbsoluteTime"), -[SignpostSupportMachTimeTranslationRange startMachAbsoluteTime](self, "startMachAbsoluteTime"), -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](self, "endMachContinuousTime"));
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(SignpostSupportMachTimeTranslationRange *)self startMachAbsoluteTime];
    if (v6 == [v5 startMachAbsoluteTime]
      && (unint64_t v7 = [(SignpostSupportMachTimeTranslationRange *)self startMachContinuousTime],
          v7 == [v5 startMachContinuousTime])
      && (unint64_t v8 = [(SignpostSupportMachTimeTranslationRange *)self endMachAbsoluteTime],
          v8 == [v5 endMachAbsoluteTime]))
    {
      unint64_t v9 = [(SignpostSupportMachTimeTranslationRange *)self endMachContinuousTime];
      BOOL v10 = v9 == [v5 endMachContinuousTime];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)machContinuousTimeDuration
{
  unint64_t result = [(SignpostSupportMachTimeTranslationRange *)self endMachContinuousTime];
  if (result != -1)
  {
    unint64_t v4 = [(SignpostSupportMachTimeTranslationRange *)self endMachContinuousTime];
    return v4 - [(SignpostSupportMachTimeTranslationRange *)self startMachContinuousTime];
  }
  return result;
}

- (int64_t)absoluteMinusContinuousDelta
{
  unint64_t v3 = [(SignpostSupportMachTimeTranslationRange *)self startMachAbsoluteTime];
  return v3 - [(SignpostSupportMachTimeTranslationRange *)self startMachContinuousTime];
}

- (int64_t)continuousMinusAbsoluteDelta
{
  unint64_t v3 = [(SignpostSupportMachTimeTranslationRange *)self startMachContinuousTime];
  return v3 - [(SignpostSupportMachTimeTranslationRange *)self startMachAbsoluteTime];
}

- (BOOL)setEndMachAbsoluteTimestamp:(unint64_t)a3 endMachContinuousTime:(unint64_t)a4
{
  if (a3 - a4 != [(SignpostSupportMachTimeTranslationRange *)self absoluteMinusContinuousDelta]|| [(SignpostSupportMachTimeTranslationRange *)self startMachContinuousTime] >= a4)
  {
    return 0;
  }
  self->_endMachAbsoluteTime = a3;
  self->_endMachContinuousTime = a4;
  return 1;
}

- (BOOL)containsMachAbsoluteTime:(unint64_t)a3
{
  return [(SignpostSupportMachTimeTranslationRange *)self endMachAbsoluteTime] != -1
      && [(SignpostSupportMachTimeTranslationRange *)self startMachAbsoluteTime] <= a3
      && [(SignpostSupportMachTimeTranslationRange *)self endMachAbsoluteTime] >= a3;
}

- (BOOL)containsMachContinuousTime:(unint64_t)a3
{
  return [(SignpostSupportMachTimeTranslationRange *)self endMachContinuousTime] != -1
      && [(SignpostSupportMachTimeTranslationRange *)self startMachContinuousTime] <= a3
      && [(SignpostSupportMachTimeTranslationRange *)self endMachContinuousTime] >= a3;
}

- (unint64_t)machAbsoluteTimeForMachContinuousTime:(unint64_t)a3
{
  unint64_t v4 = [(SignpostSupportMachTimeTranslationRange *)self absoluteMinusContinuousDelta]
     + a3;
  if (![(SignpostSupportMachTimeTranslationRange *)self containsMachAbsoluteTime:v4]) {
    -[SignpostSupportMachTimeTranslationRange machAbsoluteTimeForMachContinuousTime:]();
  }
  return v4;
}

- (unint64_t)machContinuousTimeForMachAbsoluteTime:(unint64_t)a3
{
  unint64_t v4 = [(SignpostSupportMachTimeTranslationRange *)self continuousMinusAbsoluteDelta]
     + a3;
  if (![(SignpostSupportMachTimeTranslationRange *)self containsMachContinuousTime:v4]) {
    -[SignpostSupportMachTimeTranslationRange machContinuousTimeForMachAbsoluteTime:]();
  }
  return v4;
}

- (SignpostSupportMachTimeTranslationRange)initWithStartMachAbsoluteTime:(unint64_t)a3 startContinuousTime:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SignpostSupportMachTimeTranslationRange;
  unint64_t result = [(SignpostSupportMachTimeTranslationRange *)&v7 init];
  if (result)
  {
    result->_startMachContinuousTime = a4;
    result->_endMachContinuousTime = -1;
    result->_startMachAbsoluteTime = a3;
    result->_endMachAbsoluteTime = -1;
  }
  return result;
}

- (SignpostSupportMachTimeTranslationRange)initWithArrayRepresentation:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 4)
  {
    v12.receiver = self;
    v12.super_class = (Class)SignpostSupportMachTimeTranslationRange;
    id v5 = [(SignpostSupportMachTimeTranslationRange *)&v12 init];
    if (v5)
    {
      unint64_t v6 = [v4 objectAtIndexedSubscript:0];
      v5->_startMachAbsoluteTime = [v6 unsignedLongLongValue];

      objc_super v7 = [v4 objectAtIndexedSubscript:1];
      v5->_startMachContinuousTime = [v7 unsignedLongLongValue];

      unint64_t v8 = [v4 objectAtIndexedSubscript:2];
      v5->_endMachAbsoluteTime = [v8 unsignedLongLongValue];

      unint64_t v9 = [v4 objectAtIndexedSubscript:3];
      v5->_endMachContinuousTime = [v9 unsignedLongLongValue];
    }
    self = v5;
    BOOL v10 = self;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)serializableArrayRepresentation
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostSupportMachTimeTranslationRange startMachAbsoluteTime](self, "startMachAbsoluteTime"));
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostSupportMachTimeTranslationRange startMachContinuousTime](self, "startMachContinuousTime"));
  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostSupportMachTimeTranslationRange endMachAbsoluteTime](self, "endMachAbsoluteTime"));
  objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](self, "endMachContinuousTime"));
  unint64_t v8 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, v7, 0);

  return v8;
}

- (unint64_t)startMachAbsoluteTime
{
  return self->_startMachAbsoluteTime;
}

- (unint64_t)endMachAbsoluteTime
{
  return self->_endMachAbsoluteTime;
}

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (void)machAbsoluteTimeForMachContinuousTime:.cold.1()
{
}

- (void)machContinuousTimeForMachAbsoluteTime:.cold.1()
{
}

@end