@interface PDSharingRelayServerRequest
- (NSData)deviceAttestation;
- (NSString)correlationIdentifier;
- (NSString)deviceClaim;
- (NSString)mailboxIdentifier;
- (NSURL)relayServerHost;
- (PDSharingRelayServerRequest)initWithMailboxIdentifier:(id)a3 relayServerHost:(id)a4;
- (id)_murlMailboxRequestWithAdditionalEndpointComponents:(id)a3;
- (id)_murlRequestWithEndpointComponents:(id)a3;
- (id)_notificationTokenDictFromToken:(id)a3 topic:(id)a4;
- (id)_urlRequest;
- (id)_urlRequestWithBaseURL:(id)a3;
- (void)setCorrelationIdentifier:(id)a3;
- (void)setDeviceAttestation:(id)a3;
- (void)setDeviceClaim:(id)a3;
- (void)setMailboxIdentifier:(id)a3;
- (void)setRelayServerHost:(id)a3;
@end

@implementation PDSharingRelayServerRequest

- (PDSharingRelayServerRequest)initWithMailboxIdentifier:(id)a3 relayServerHost:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDSharingRelayServerRequest;
  v9 = [(PDSharingRelayServerRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mailboxIdentifier, a3);
    objc_storeStrong((id *)&v10->_relayServerHost, a4);
  }

  return v10;
}

- (id)_urlRequestWithBaseURL:(id)a3
{
  return 0;
}

- (id)_murlRequestWithEndpointComponents:(id)a3
{
  v4 = [(PDSharingRelayServerRequest *)self _murlRequestWithServiceURL:self->_relayServerHost version:PKSharingRelayServerRequestVersion endpointComponents:a3 queryParameters:0 appleAccountInformation:0];
  v5 = [v4 allHTTPHeaderFields];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100417CD4;
  v13[3] = &unk_100749F60;
  id v6 = v4;
  id v14 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v13];

  [v6 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v6 setValue:self->_deviceClaim forHTTPHeaderField:@"Device-Claim"];
  id v7 = [(NSData *)self->_deviceAttestation base64EncodedStringWithOptions:0];
  [v6 setValue:v7 forHTTPHeaderField:@"deviceAttestation"];

  correlationIdentifier = self->_correlationIdentifier;
  if (correlationIdentifier)
  {
    v9 = correlationIdentifier;
  }
  else
  {
    id v10 = objc_alloc_init((Class)NSUUID);
    v9 = [v10 UUIDString];
  }
  [v6 setValue:v9 forHTTPHeaderField:@"Mailbox-Request-Id"];
  id v11 = v6;

  return v11;
}

- (id)_murlMailboxRequestWithAdditionalEndpointComponents:(id)a3
{
  id v4 = a3;
  mailboxIdentifier = self->_mailboxIdentifier;
  v11[0] = PKSharingRelayServerMailboxURI;
  v11[1] = mailboxIdentifier;
  id v6 = +[NSArray arrayWithObjects:v11 count:2];
  id v7 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v4];

    id v7 = (void *)v8;
  }
  v9 = [(PDSharingRelayServerRequest *)self _murlRequestWithEndpointComponents:v7];

  return v9;
}

- (id)_urlRequest
{
  return 0;
}

- (id)_notificationTokenDictFromToken:(id)a3 topic:(id)a4
{
  id v4 = a3;
  if (a3)
  {
    id v5 = a4;
    id v6 = v4;
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [v7 setObject:@"com.apple.apns" forKeyedSubscript:@"type"];
    [v7 setObject:v6 forKeyedSubscript:@"tokenData"];

    [v7 setObject:v5 forKeyedSubscript:@"tokenTopic"];
    id v4 = [v7 copy];
  }
  return v4;
}

- (NSString)mailboxIdentifier
{
  return self->_mailboxIdentifier;
}

- (void)setMailboxIdentifier:(id)a3
{
}

- (NSURL)relayServerHost
{
  return self->_relayServerHost;
}

- (void)setRelayServerHost:(id)a3
{
}

- (NSString)deviceClaim
{
  return self->_deviceClaim;
}

- (void)setDeviceClaim:(id)a3
{
}

- (NSData)deviceAttestation
{
  return self->_deviceAttestation;
}

- (void)setDeviceAttestation:(id)a3
{
}

- (NSString)correlationIdentifier
{
  return self->_correlationIdentifier;
}

- (void)setCorrelationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceAttestation, 0);
  objc_storeStrong((id *)&self->_deviceClaim, 0);
  objc_storeStrong((id *)&self->_relayServerHost, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifier, 0);
}

@end