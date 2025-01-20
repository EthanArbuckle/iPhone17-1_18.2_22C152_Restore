@interface MRDIDSRemoteControlServiceRemoteControlChannel
- (MRExternalDeviceTransportConnection)transport;
- (NSDate)connectionAttemptDate;
- (NSObject)notificationToken;
- (NSString)destination;
- (NSString)session;
- (id)debugDescription;
- (void)setConnectionAttemptDate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setNotificationToken:(id)a3;
- (void)setSession:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation MRDIDSRemoteControlServiceRemoteControlChannel

- (id)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  [v3 appendFormat:@"  destination = %@\n", self->_destination];
  [v3 appendFormat:@"  session = %@\n", self->_session];
  connectionAttemptDate = self->_connectionAttemptDate;
  [(NSDate *)connectionAttemptDate timeIntervalSinceNow];
  [v3 appendFormat:@"  connectionAttemptDate = %@ (%lf seconds ago)\n", connectionAttemptDate, v5];
  v6 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@"  transport = %@\n", v6];

  [v3 appendString:@"}>"];

  return v3;
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSString)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (MRExternalDeviceTransportConnection)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
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
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end