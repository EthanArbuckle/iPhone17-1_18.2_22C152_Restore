@interface MRDIDSCompanionRemoteControlServiceConnection
- (MRExternalDeviceTransportConnection)connection;
- (NSDate)connectionAttemptDate;
- (NSObject)notificationToken;
- (NSString)destination;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setConnectionAttemptDate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setNotificationToken:(id)a3;
@end

@implementation MRDIDSCompanionRemoteControlServiceConnection

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = [(MRDIDSCompanionRemoteControlServiceConnection *)self notificationToken];
  [v3 removeObserver:v4];

  v5.receiver = self;
  v5.super_class = (Class)MRDIDSCompanionRemoteControlServiceConnection;
  [(MRDIDSCompanionRemoteControlServiceConnection *)&v5 dealloc];
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (MRExternalDeviceTransportConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSDate)connectionAttemptDate
{
  return self->_connectionAttemptDate;
}

- (void)setConnectionAttemptDate:(id)a3
{
}

- (NSObject)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_connectionAttemptDate, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end