@interface TSTime
+ (id)timeConverter;
- (BOOL)isEqual:(id)a3;
- (NSDate)taiDate;
- (NSDate)utcDate;
- (TSGPSTime)gpsTime;
- (TSTime)init;
- (TSTime)initWithGPSTime:(id)a3;
- (TSTime)initWithNanosecondsSinceEpoch:(unint64_t)a3;
- (TSTime)initWithTAIDate:(id)a3;
- (TSTime)initWithUTCDate:(id)a3;
- (TSTime)initWithgPTPTime:(id)a3;
- (TSgPTPTime)gPTPTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)timeByAddingNanoseconds:(int64_t)a3;
- (int64_t)nanosecondsSinceTime:(id)a3;
- (unint64_t)hash;
- (unint64_t)nanosecondsSinceEpoch;
@end

@implementation TSTime

+ (id)timeConverter
{
  if (timeConverter_onceToken != -1) {
    dispatch_once(&timeConverter_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)_sharedTimeConverter;
  return v2;
}

uint64_t __23__TSTime_timeConverter__block_invoke()
{
  _sharedTimeConverter = objc_alloc_init(TSTimeConverter);
  return MEMORY[0x1F41817F8]();
}

- (TSTime)init
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [(TSTime *)self initWithUTCDate:v3];

  return v4;
}

- (TSTime)initWithUTCDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() timeConverter];
  v6 = [v5 taiDateFromUTCDate:v4];

  v7 = [(TSTime *)self initWithTAIDate:v6];
  return v7;
}

- (TSTime)initWithTAIDate:(id)a3
{
  id v4 = a3;
  [v4 timeIntervalSince1970];
  v6 = [(TSTime *)self initWithNanosecondsSinceEpoch:(unint64_t)(v5 * 1000000000.0)];
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_timeTraceable = 257;
    [v4 timeIntervalSince1970];
    if (v8 < 0.0)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (TSTime)initWithGPSTime:(id)a3
{
  result = -[TSTime initWithNanosecondsSinceEpoch:](self, "initWithNanosecondsSinceEpoch:", [a3 nanosecondsSinceEpoch] + 315964819000000000);
  if (result) {
    *(_WORD *)&result->_timeTraceable = 257;
  }
  return result;
}

- (TSTime)initWithgPTPTime:(id)a3
{
  id v4 = a3;
  double v5 = -[TSTime initWithNanosecondsSinceEpoch:](self, "initWithNanosecondsSinceEpoch:", [v4 nanosecondsSinceEpoch]);
  if (v5)
  {
    if ([v4 isTimeTraceable]
      && [v4 isPTPTimescale]
      && [v4 isFrequencyTraceable])
    {
      v5->_grandmasterIdentity = [v4 grandmasterIdentity];
      v5->_localPortNumber = [v4 localPortNumber];
      v5->_frequencyTraceable = [v4 isFrequencyTraceable];
      v5->_timeTraceable = [v4 isTimeTraceable];
    }
    else
    {

      double v5 = 0;
    }
  }

  return v5;
}

- (TSTime)initWithNanosecondsSinceEpoch:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSTime;
  result = [(TSTime *)&v5 init];
  if (result)
  {
    result->_nanosecondsSinceEpoch = a3;
    result->_grandmasterIdentity = -1;
    result->_localPortNumber = 0;
  }
  return result;
}

- (NSDate)utcDate
{
  v3 = [(id)objc_opt_class() timeConverter];
  id v4 = [(TSTime *)self taiDate];
  objc_super v5 = [v3 utcDateFromTAIDate:v4];

  return (NSDate *)v5;
}

- (NSDate)taiDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)self->_nanosecondsSinceEpoch / 1000000000.0];
}

- (TSGPSTime)gpsTime
{
  if (self->_nanosecondsSinceEpoch < 0x46288542E03FE00) {
    v2 = 0;
  }
  else {
    v2 = [[TSGPSTime alloc] initWithNanosecondsSinceEpoch:self->_nanosecondsSinceEpoch - 315964819000000000];
  }
  return v2;
}

- (TSgPTPTime)gPTPTime
{
  v2 = [[TSgPTPTime alloc] initWithNanosecondsSinceEpoch:self->_nanosecondsSinceEpoch onGrandmaster:self->_grandmasterIdentity withLocalPortNumber:self->_localPortNumber ptpTimescale:1 timeTraceable:self->_timeTraceable frequencyTraceable:self->_frequencyTraceable];
  return v2;
}

- (int64_t)nanosecondsSinceTime:(id)a3
{
  return self->_nanosecondsSinceEpoch - *((void *)a3 + 4);
}

- (id)timeByAddingNanoseconds:(int64_t)a3
{
  if (a3 < 0 && self->_nanosecondsSinceEpoch < a3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = (void *)[(TSTime *)self copy];
    v4[4] += a3;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 4) = self->_nanosecondsSinceEpoch;
  *((void *)result + 2) = self->_grandmasterIdentity;
  *((unsigned char *)result + 8) = self->_initedWithgPTP;
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
    || [(TSTime *)self isMemberOfClass:objc_opt_class()])
  {
    unint64_t v5 = [(TSTime *)self nanosecondsSinceEpoch];
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
  unint64_t grandmasterIdentity = self->_grandmasterIdentity;
  id v4 = NSString;
  unint64_t v5 = [(TSTime *)self nanosecondsSinceEpoch];
  if (grandmasterIdentity == -1) {
    objc_msgSend(v4, "stringWithFormat:", @"TAI Time %llu", v5, v8);
  }
  else {
  BOOL v6 = objc_msgSend(v4, "stringWithFormat:", @"TAI Time %llu GM 0x%016llx", v5, self->_grandmasterIdentity);
  }
  return v6;
}

- (unint64_t)nanosecondsSinceEpoch
{
  return self->_nanosecondsSinceEpoch;
}

@end