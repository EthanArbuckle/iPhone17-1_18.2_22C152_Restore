@interface MRDRapportRemoteControlServiceConnection
+ (BOOL)supportsSecureCoding;
- (MRDRapportRemoteControlServiceConnection)initWithCoder:(id)a3;
- (MRRapportTransportConnection)connection;
- (NSDate)connectionAttemptDate;
- (NSObject)notificationToken;
- (NSString)destinationGroupUID;
- (NSString)destinationOutputDeviceUID;
- (NSString)name;
- (NSString)sessionUID;
- (NSString)sourceUID;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionAttemptDate:(id)a3;
- (void)setDestinationGroupUID:(id)a3;
- (void)setDestinationOutputDeviceUID:(id)a3;
- (void)setName:(id)a3;
- (void)setNotificationToken:(id)a3;
- (void)setSessionUID:(id)a3;
- (void)setSourceUID:(id)a3;
@end

@implementation MRDRapportRemoteControlServiceConnection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sourceUID = self->_sourceUID;
  id v5 = a3;
  [v5 encodeObject:sourceUID forKey:@"source"];
  [v5 encodeObject:self->_sessionUID forKey:@"session"];
  [v5 encodeObject:self->_destinationOutputDeviceUID forKey:@"destination"];
  [v5 encodeObject:self->_connectionAttemptDate forKey:@"date"];
}

- (MRDRapportRemoteControlServiceConnection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MRDRapportRemoteControlServiceConnection);
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
  id v7 = [v6 copy];
  [(MRDRapportRemoteControlServiceConnection *)v5 setSourceUID:v7];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destination"];
  id v9 = [v8 copy];
  [(MRDRapportRemoteControlServiceConnection *)v5 setDestinationOutputDeviceUID:v9];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session"];

  [(MRDRapportRemoteControlServiceConnection *)v5 setSessionUID:v10];
  return v5;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"source=%@(%@) session=%@", self->_sourceUID, self->_name, self->_sessionUID];

  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  id v4 = [(MRDRapportRemoteControlServiceConnection *)self notificationToken];
  [v3 removeObserver:v4];

  v5.receiver = self;
  v5.super_class = (Class)MRDRapportRemoteControlServiceConnection;
  [(MRDRapportRemoteControlServiceConnection *)&v5 dealloc];
}

- (NSString)destinationOutputDeviceUID
{
  return self->_destinationOutputDeviceUID;
}

- (void)setDestinationOutputDeviceUID:(id)a3
{
}

- (NSString)destinationGroupUID
{
  return self->_destinationGroupUID;
}

- (void)setDestinationGroupUID:(id)a3
{
}

- (NSString)sourceUID
{
  return self->_sourceUID;
}

- (void)setSourceUID:(id)a3
{
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (void)setSessionUID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (MRRapportTransportConnection)connection
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
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sessionUID, 0);
  objc_storeStrong((id *)&self->_sourceUID, 0);
  objc_storeStrong((id *)&self->_destinationGroupUID, 0);

  objc_storeStrong((id *)&self->_destinationOutputDeviceUID, 0);
}

@end