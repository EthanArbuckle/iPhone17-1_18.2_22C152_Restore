@interface _DASChargeRateReader
- (_CDContext)context;
- (_DASChargeRateReader)init;
- (id)currentValue;
- (id)lastModifiedDate;
- (void)setContext:(id)a3;
@end

@implementation _DASChargeRateReader

- (id)currentValue
{
  context = self->_context;
  v3 = +[_CDContextQueries keyPathForBatteryLevel];
  v4 = [(_CDContext *)context objectForKeyedSubscript:v3];

  return v4;
}

- (_DASChargeRateReader)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DASChargeRateReader;
  v2 = [(_DASChargeRateReader *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[_CDClientContext userContext];
    context = v2->_context;
    v2->_context = (_CDContext *)v3;
  }
  return v2;
}

- (id)lastModifiedDate
{
  return 0;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end