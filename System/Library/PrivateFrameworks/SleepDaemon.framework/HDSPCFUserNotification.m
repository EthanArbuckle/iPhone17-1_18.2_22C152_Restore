@interface HDSPCFUserNotification
+ (HDSPCFUserNotification)userNotificationWithIdentifier:(id)a3 notification:(__CFUserNotification *)a4 actionHandler:(id)a5;
- (HDSPCFUserNotification)initWithIdentifier:(id)a3 notification:(__CFUserNotification *)a4 actionHandler:(id)a5;
- (NSString)identifier;
- (__CFUserNotification)notification;
- (id)actionHandler;
@end

@implementation HDSPCFUserNotification

+ (HDSPCFUserNotification)userNotificationWithIdentifier:(id)a3 notification:(__CFUserNotification *)a4 actionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v9 notification:a4 actionHandler:v8];

  return (HDSPCFUserNotification *)v10;
}

- (HDSPCFUserNotification)initWithIdentifier:(id)a3 notification:(__CFUserNotification *)a4 actionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDSPCFUserNotification;
  v11 = [(HDSPCFUserNotification *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_notification = a4;
    uint64_t v13 = [v10 copy];
    id actionHandler = v12->_actionHandler;
    v12->_id actionHandler = (id)v13;

    v15 = v12;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end