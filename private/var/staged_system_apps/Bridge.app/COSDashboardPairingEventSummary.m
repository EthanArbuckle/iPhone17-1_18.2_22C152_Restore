@interface COSDashboardPairingEventSummary
- (NSString)dashboardKey;
- (id)eventValue;
- (void)setDashboardKey:(id)a3;
- (void)setEventValue:(id)a3;
@end

@implementation COSDashboardPairingEventSummary

- (void)setEventValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Pairing event summary values must be NSString or NSNumber" userInfo:0];
      objc_exception_throw(v6);
    }
  }
  id eventValue = self->_eventValue;
  self->_id eventValue = v4;
}

- (NSString)dashboardKey
{
  return self->_dashboardKey;
}

- (void)setDashboardKey:(id)a3
{
}

- (id)eventValue
{
  return self->_eventValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventValue, 0);

  objc_storeStrong((id *)&self->_dashboardKey, 0);
}

@end