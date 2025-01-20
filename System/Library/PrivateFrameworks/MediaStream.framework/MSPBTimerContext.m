@interface MSPBTimerContext
+ (id)contextWithDate:(id)a3;
- (BOOL)isValid;
- (MSPBTimerContext)init;
- (NSDate)date;
- (void)setDate:(id)a3;
- (void)setIsValid:(BOOL)a3;
@end

@implementation MSPBTimerContext

- (void).cxx_destruct
{
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (MSPBTimerContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSPBTimerContext;
  result = [(MSPBTimerContext *)&v3 init];
  if (result) {
    result->_isValid = 1;
  }
  return result;
}

+ (id)contextWithDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setDate:v4];

  return v5;
}

@end