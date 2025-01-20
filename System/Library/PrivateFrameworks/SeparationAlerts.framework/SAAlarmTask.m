@interface SAAlarmTask
- (NSDate)fireDate;
- (NSUUID)alarmUUID;
- (SATimeClientProtocol)client;
- (void)setAlarmUUID:(id)a3;
- (void)setClient:(id)a3;
- (void)setFireDate:(id)a3;
@end

@implementation SAAlarmTask

- (NSUUID)alarmUUID
{
  return self->_alarmUUID;
}

- (void)setAlarmUUID:(id)a3
{
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (SATimeClientProtocol)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (SATimeClientProtocol *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_alarmUUID, 0);
}

@end