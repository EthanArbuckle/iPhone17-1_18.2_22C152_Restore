@interface CLHarvestExternalAdapter
- (BOOL)valid;
- (CLHarvestExternalAdapter)initWithHarvesterExternal:(void *)a3 andSilo:(id)a4;
- (void)invalidate;
- (void)onVisit:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation CLHarvestExternalAdapter

- (CLHarvestExternalAdapter)initWithHarvesterExternal:(void *)a3 andSilo:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLHarvestExternalAdapter;
  result = [(CLHarvestExternalAdapter *)&v7 init];
  if (result)
  {
    result->_harvesterExternal = a3;
    result->_silo = (CLDispatchSilo *)a4;
    result->_valid = 1;
  }
  else
  {
    MEMORY[0x18] = 0;
  }
  return result;
}

- (void)onVisit:(id)a3
{
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  silo = self->_silo;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10140424C;
  v5[3] = &unk_10229FED8;
  v5[4] = self;
  -[CLDispatchSilo async:](silo, "async:", v5, a4);
}

- (void)invalidate
{
  self->_valid = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end