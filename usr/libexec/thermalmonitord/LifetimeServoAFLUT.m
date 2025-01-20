@interface LifetimeServoAFLUT
- (LifetimeServoAFLUT)initWithAFTableColumns:(id)a3;
- (float)accelerationFactor:(int)a3 voltage:(int)a4;
@end

@implementation LifetimeServoAFLUT

- (LifetimeServoAFLUT)initWithAFTableColumns:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)LifetimeServoAFLUT;
  v4 = [(LifetimeServoAFLUT *)&v17 init];
  if (v4)
  {
    int v5 = [a3 count];
    v4->_uint64_t columnCount = v5;
    if (v5 <= 26)
    {
      if (v5 >= 1)
      {
        uint64_t v7 = 0;
        do
        {
          id v8 = [a3 objectAtIndex:v7];
          v4->_afLUTColumns[v7++] = -[LifetimeServoAFLUTColumn initWithLUTColumn:voltage:]([LifetimeServoAFLUTColumn alloc], "initWithLUTColumn:voltage:", [v8 objectForKey:@"afColumn"], [v8 objectForKey:@"voltage"]);
          uint64_t columnCount = v4->_columnCount;
        }
        while (v7 < columnCount);
        if ((int)columnCount >= 2)
        {
          uint64_t v10 = 0;
          do
          {
            v11 = (id *)(&v4->super.isa + v10);
            int v12 = [v11[3] voltage];
            if (v12 >= (int)[v11[4] voltage])
            {
              v13 = qword_1000AABC0;
              if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
                sub_100056900(&v15, v16, v13);
              }
            }
            ++v10;
          }
          while (v10 < v4->_columnCount - 1);
        }
      }
      v4->_minVoltage = [(LifetimeServoAFLUTColumn *)v4->_afLUTColumns[0] voltage];
      v4->_maxVoltage = [(LifetimeServoAFLUTColumn *)v4->_afLUTColumns[v4->_columnCount - 1] voltage];
    }
    else
    {
      v6 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_1000568BC(v6);
      }
      return 0;
    }
  }
  return v4;
}

- (float)accelerationFactor:(int)a3 voltage:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  int minVoltage = self->_minVoltage;
  if (minVoltage <= a4)
  {
    if (self->_maxVoltage >= a4) {
      int minVoltage = a4;
    }
    else {
      int minVoltage = self->_maxVoltage;
    }
  }
  afLUTColumns = self->_afLUTColumns;
  if (self->_columnCount < 2)
  {
    unsigned int v11 = 1;
  }
  else
  {
    uint64_t v8 = 4;
    while (minVoltage > (int)[*((id *)&self->super.isa + v8) voltage])
    {
      int v9 = v8 + 1;
      uint64_t v10 = v8 - 2;
      ++v8;
      if (v10 >= self->_columnCount)
      {
        unsigned int v11 = v9 - 3;
        goto LABEL_12;
      }
    }
    unsigned int v11 = v8 - 3;
  }
LABEL_12:
  int v12 = &afLUTColumns[v11];
  unsigned int v13 = [(LifetimeServoAFLUTColumn *)*(v12 - 1) voltage];
  unsigned int v14 = [(LifetimeServoAFLUTColumn *)afLUTColumns[v11] voltage];
  [(LifetimeServoAFLUTColumn *)*(v12 - 1) accelerationFactor:v4];
  float v16 = v15;
  [(LifetimeServoAFLUTColumn *)afLUTColumns[v11] accelerationFactor:v4];
  float v18 = 0.0;
  if (v14 != v13) {
    return (float)((float)(v16 * (float)(int)(v14 - minVoltage)) + (float)(v17 * (float)(int)(minVoltage - v13)))
  }
         / (float)(int)(v14 - v13);
  return v18;
}

@end