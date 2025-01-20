@interface ULDarwinNotificationRecord
- (NSNumber)registrationToken;
- (NSString)notificationName;
- (ULDarwinNotificationRecord)initWithNotificationName:(id)a3 registrationToken:(id)a4 handler:(id)a5;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setNotificationName:(id)a3;
- (void)setRegistrationToken:(id)a3;
@end

@implementation ULDarwinNotificationRecord

- (ULDarwinNotificationRecord)initWithNotificationName:(id)a3 registrationToken:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ULDarwinNotificationRecord;
  v11 = [(ULDarwinNotificationRecord *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(ULDarwinNotificationRecord *)v11 setNotificationName:v8];
    [(ULDarwinNotificationRecord *)v12 setRegistrationToken:v9];
    [(ULDarwinNotificationRecord *)v12 setHandler:v10];
  }

  return v12;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
}

- (NSNumber)registrationToken
{
  return self->_registrationToken;
}

- (void)setRegistrationToken:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_registrationToken, 0);

  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end