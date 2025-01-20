@interface MTCFUserNotification
- (MTOSTransaction)transaction;
- (NSString)identifier;
- (__CFUserNotification)notification;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNotification:(__CFUserNotification *)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MTCFUserNotification

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (MTOSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(__CFUserNotification *)a3
{
  self->_notification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end