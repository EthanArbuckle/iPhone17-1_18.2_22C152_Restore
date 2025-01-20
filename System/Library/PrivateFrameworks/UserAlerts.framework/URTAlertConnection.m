@interface URTAlertConnection
- (BSServiceConnection)connection;
- (URTAlert)alert;
- (URTAlertConnection)initWithConnection:(id)a3;
- (void)setAlert:(id)a3;
@end

@implementation URTAlertConnection

- (URTAlertConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)URTAlertConnection;
  v6 = [(URTAlertConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (URTAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end