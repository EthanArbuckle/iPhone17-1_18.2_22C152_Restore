@interface TSGPSTime
- (BOOL)isEqual:(id)a3;
- (TSGPSTime)initWithExtendedWeek:(unsigned int)a3 nanoseconds:(unint64_t)a4;
- (TSGPSTime)initWithExtendedWeek:(unsigned int)a3 seconds:(double)a4;
- (TSGPSTime)initWithNanosecondsSinceEpoch:(unint64_t)a3;
- (TSGPSTime)initWithWeek:(unsigned int)a3 nanoseconds:(unint64_t)a4 rollovers:(unsigned __int16)a5;
- (TSGPSTime)initWithWeek:(unsigned int)a3 seconds:(double)a4 rollovers:(unsigned __int16)a5;
- (double)seconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)nanoseconds;
- (unint64_t)nanosecondsSinceEpoch;
- (unsigned)extendedWeek;
- (unsigned)week;
@end

@implementation TSGPSTime

- (TSGPSTime)initWithNanosecondsSinceEpoch:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSGPSTime;
  result = [(TSGPSTime *)&v5 init];
  if (result) {
    result->_nanosecondsSinceEpoch = a3;
  }
  return result;
}

- (TSGPSTime)initWithExtendedWeek:(unsigned int)a3 seconds:(double)a4
{
  return [(TSGPSTime *)self initWithExtendedWeek:*(void *)&a3 nanoseconds:(unint64_t)(a4 * 1000000000.0)];
}

- (TSGPSTime)initWithExtendedWeek:(unsigned int)a3 nanoseconds:(unint64_t)a4
{
  return [(TSGPSTime *)self initWithNanosecondsSinceEpoch:a4 + 604800000000000 * a3];
}

- (TSGPSTime)initWithWeek:(unsigned int)a3 seconds:(double)a4 rollovers:(unsigned __int16)a5
{
  int v5 = a5 << 10;
  if (a3 >= 0x400) {
    int v5 = 0;
  }
  return [(TSGPSTime *)self initWithExtendedWeek:v5 + a3 seconds:a4];
}

- (TSGPSTime)initWithWeek:(unsigned int)a3 nanoseconds:(unint64_t)a4 rollovers:(unsigned __int16)a5
{
  int v5 = a5 << 10;
  if (a3 >= 0x400) {
    int v5 = 0;
  }
  return [(TSGPSTime *)self initWithExtendedWeek:v5 + a3 nanoseconds:a4];
}

- (unsigned)extendedWeek
{
  return self->_nanosecondsSinceEpoch / 0x2260FF9290000;
}

- (unsigned)week
{
  return (unsigned __int16)[(TSGPSTime *)self extendedWeek] & 0x3FF;
}

- (double)seconds
{
  return (double)[(TSGPSTime *)self nanoseconds] / 1000000000.0;
}

- (unint64_t)nanoseconds
{
  return self->_nanosecondsSinceEpoch % 0x2260FF9290000;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  *((void *)result + 1) = self->_nanosecondsSinceEpoch;
  return result;
}

- (unint64_t)hash
{
  return self->_nanosecondsSinceEpoch;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (([v4 isMemberOfClass:objc_opt_class()] & 1) != 0
    || [(TSGPSTime *)self isMemberOfClass:objc_opt_class()])
  {
    id v5 = [(TSGPSTime *)self nanosecondsSinceEpoch];
    BOOL v6 = v5 == [v4 nanosecondsSinceEpoch];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  uint64_t v3 = [(TSGPSTime *)self extendedWeek];
  [(TSGPSTime *)self seconds];
  return +[NSString stringWithFormat:@"GPS Time week %u seconds %0.9f", v3, v4];
}

- (unint64_t)nanosecondsSinceEpoch
{
  return self->_nanosecondsSinceEpoch;
}

@end