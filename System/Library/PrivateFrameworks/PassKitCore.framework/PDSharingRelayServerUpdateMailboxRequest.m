@interface PDSharingRelayServerUpdateMailboxRequest
- (NSString)notificationToken;
- (NSString)notificationTopic;
- (PDSharingMailboxPayload)payload;
- (id)_urlRequest;
- (void)setNotificationToken:(id)a3;
- (void)setNotificationTopic:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation PDSharingRelayServerUpdateMailboxRequest

- (id)_urlRequest
{
  v3 = [(PDSharingRelayServerRequest *)self _murlMailboxRequestWithAdditionalEndpointComponents:0];
  [v3 setHTTPMethod:@"PUT"];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [(PDSharingMailboxPayload *)self->_payload dictionaryRepresentation];
  [v4 setObject:v5 forKeyedSubscript:@"payload"];

  v6 = [(PDSharingRelayServerRequest *)self _notificationTokenDictFromToken:self->_notificationToken topic:self->_notificationTopic];
  [v4 setObject:v6 forKeyedSubscript:@"notificationToken"];

  v7 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v4];
  [v3 setHTTPBody:v7];

  return v3;
}

- (PDSharingMailboxPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(id)a3
{
}

- (NSString)notificationTopic
{
  return self->_notificationTopic;
}

- (void)setNotificationTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationTopic, 0);
  objc_storeStrong((id *)&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end