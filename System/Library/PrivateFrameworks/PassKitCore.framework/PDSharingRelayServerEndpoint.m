@interface PDSharingRelayServerEndpoint
- (BOOL)doesRemoteMailboxExist;
- (BOOL)doesRemoteMailboxSupportPushNotifications;
- (BOOL)hasOutstandingMessages;
- (NSData)payloadEncryptionPassword;
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSString)description;
- (NSString)deviceClaim;
- (NSString)transportIdentifier;
- (NSURL)relayServerHost;
- (PDSharingRelayServerEndpoint)init;
- (PDSharingRelayServerEndpoint)initWithMailboxIdentifier:(id)a3 provisioningType:(unint64_t)a4;
- (PDSharingRelayServerEndpoint)initWithProvisioningType:(unint64_t)a3;
- (unint64_t)channelType;
- (unint64_t)mailboxStatus;
- (unint64_t)pollingBackoffCounter;
- (unint64_t)provisioningType;
- (unint64_t)timeToLive;
- (void)rollTransportIdentifer;
- (void)setChannelType:(unint64_t)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDeviceClaim:(id)a3;
- (void)setDoesRemoteMailboxSupportPushNotifications:(BOOL)a3;
- (void)setHasOutstandingMessages:(BOOL)a3;
- (void)setMailboxStatus:(unint64_t)a3;
- (void)setPayloadEncryptionPassword:(id)a3;
- (void)setPollingBackoffCounter:(unint64_t)a3;
- (void)setProvisioningType:(unint64_t)a3;
- (void)setRelayServerHost:(id)a3;
- (void)setTimeToLive:(unint64_t)a3;
- (void)setTransportIdentifier:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation PDSharingRelayServerEndpoint

- (PDSharingRelayServerEndpoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDSharingRelayServerEndpoint;
  return [(PDSharingRelayServerEndpoint *)&v3 init];
}

- (PDSharingRelayServerEndpoint)initWithProvisioningType:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)NSUUID);
  v6 = [v5 UUIDString];
  v7 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:&stru_10075AAD8];

  v8 = [(PDSharingRelayServerEndpoint *)self initWithMailboxIdentifier:v7 provisioningType:a3];
  return v8;
}

- (PDSharingRelayServerEndpoint)initWithMailboxIdentifier:(id)a3 provisioningType:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDSharingRelayServerEndpoint;
  v8 = [(PDSharingRelayServerEndpoint *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transportIdentifier, a3);
    v9->_channelType = 1;
    v9->_provisioningType = a4;
    v9->_mailboxStatus = 0;
    v10 = (NSDate *)objc_alloc_init((Class)NSDate);
    createdAt = v9->_createdAt;
    v9->_createdAt = v10;

    if (a4 <= 2) {
      v9->_timeToLive = qword_1005B35E0[a4];
    }
  }

  return v9;
}

- (BOOL)doesRemoteMailboxExist
{
  return self->_mailboxStatus - 2 < 3;
}

- (void)rollTransportIdentifer
{
  id v3 = objc_alloc_init((Class)NSUUID);
  v4 = [v3 UUIDString];
  id v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:&stru_10075AAD8];

  transportIdentifier = self->_transportIdentifier;
  self->_transportIdentifier = v5;
}

- (void)setCreatedAt:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_createdAt, a3);
  updatedAt = self->_updatedAt;
  p_updatedAt = &self->_updatedAt;
  if (!updatedAt) {
    objc_storeStrong((id *)p_updatedAt, a3);
  }
}

- (void)setUpdatedAt:(id)a3
{
}

- (NSString)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  id v3 = self);
  v4 = v3;
  if (self->_mailboxStatus == 1)
  {
    [v3 appendFormat:@"mailboxIdentifier: '%@'; ", @"TBD"];
  }
  else
  {
    id v5 = PKSharingLoggableMailboxAddress();
    [v4 appendFormat:@"mailboxIdentifier: '%@'; ", v5];
  }
  unint64_t provisioningType = self->_provisioningType;
  CFStringRef v7 = @"unknown";
  CFStringRef v8 = @"stateful";
  if (provisioningType != 2) {
    CFStringRef v8 = @"unknown";
  }
  if (provisioningType == 1) {
    CFStringRef v9 = @"stateless";
  }
  else {
    CFStringRef v9 = v8;
  }
  [v4 appendFormat:@"provisioningType: '%@'; ", v9];
  unint64_t v10 = self->_channelType - 1;
  if (v10 <= 2) {
    CFStringRef v7 = *(&off_10073B3F8 + v10);
  }
  [v4 appendFormat:@"channelType: '%@'; ", v7];
  unint64_t v11 = self->_mailboxStatus - 1;
  if (v11 > 3) {
    CFStringRef v12 = @"unknown";
  }
  else {
    CFStringRef v12 = *(&off_10073B410 + v11);
  }
  [v4 appendFormat:@"mailboxStatus: '%@'; ", v12];
  [v4 appendFormat:@"deviceClaim: '%@'; ", self->_deviceClaim];
  objc_super v13 = [(NSData *)self->_payloadEncryptionPassword base64EncodedStringWithOptions:0];
  v14 = [v13 substringToIndex:6];
  [v4 appendFormat:@"encryptionPassword: '%@..'; ", v14];

  if (self->_hasOutstandingMessages) {
    CFStringRef v15 = @"Yes";
  }
  else {
    CFStringRef v15 = @"No";
  }
  [v4 appendFormat:@"hasOutstandingMessages: '%@..'; ", v15];
  objc_msgSend(v4, "appendFormat:", @"timeToLive: '%lu'; ", self->_timeToLive);
  [v4 appendFormat:@"createdAt: '%@'; ", self->_createdAt];
  [v4 appendFormat:@"updatedAt: '%@'; ", self->_updatedAt];
  [v4 appendFormat:@"relayServerHost: '%@'; ", self->_relayServerHost];
  if (self->_provisioningType == 2)
  {
    if (self->_doesRemoteMailboxSupportPushNotifications) {
      CFStringRef v16 = @"Y";
    }
    else {
      CFStringRef v16 = @"N";
    }
    [v4 appendFormat:@"supportsPushNotifications: '%@'; ", v16];
    objc_msgSend(v4, "appendFormat:", @"pollingBackoffCounter: '%lu'; ", self->_pollingBackoffCounter);
  }
  [v4 appendFormat:@">"];
  id v17 = [v4 copy];

  return (NSString *)v17;
}

- (NSString)transportIdentifier
{
  return self->_transportIdentifier;
}

- (void)setTransportIdentifier:(id)a3
{
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(unint64_t)a3
{
  self->_channelType = a3;
}

- (unint64_t)provisioningType
{
  return self->_provisioningType;
}

- (void)setProvisioningType:(unint64_t)a3
{
  self->_unint64_t provisioningType = a3;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (unint64_t)timeToLive
{
  return self->_timeToLive;
}

- (void)setTimeToLive:(unint64_t)a3
{
  self->_timeToLive = a3;
}

- (unint64_t)mailboxStatus
{
  return self->_mailboxStatus;
}

- (void)setMailboxStatus:(unint64_t)a3
{
  self->_mailboxStatus = a3;
}

- (BOOL)doesRemoteMailboxSupportPushNotifications
{
  return self->_doesRemoteMailboxSupportPushNotifications;
}

- (void)setDoesRemoteMailboxSupportPushNotifications:(BOOL)a3
{
  self->_doesRemoteMailboxSupportPushNotifications = a3;
}

- (unint64_t)pollingBackoffCounter
{
  return self->_pollingBackoffCounter;
}

- (void)setPollingBackoffCounter:(unint64_t)a3
{
  self->_pollingBackoffCounter = a3;
}

- (NSData)payloadEncryptionPassword
{
  return self->_payloadEncryptionPassword;
}

- (void)setPayloadEncryptionPassword:(id)a3
{
}

- (NSString)deviceClaim
{
  return self->_deviceClaim;
}

- (void)setDeviceClaim:(id)a3
{
}

- (BOOL)hasOutstandingMessages
{
  return self->_hasOutstandingMessages;
}

- (void)setHasOutstandingMessages:(BOOL)a3
{
  self->_hasOutstandingMessages = a3;
}

- (NSURL)relayServerHost
{
  return self->_relayServerHost;
}

- (void)setRelayServerHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayServerHost, 0);
  objc_storeStrong((id *)&self->_deviceClaim, 0);
  objc_storeStrong((id *)&self->_payloadEncryptionPassword, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
}

@end