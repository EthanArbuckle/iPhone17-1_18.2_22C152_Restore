@interface PDSharingRelayServerCreateMailboxRequest
- (NSString)accessRights;
- (NSString)notificationToken;
- (NSString)notificationTopic;
- (PDSharingMailboxPayload)payload;
- (PKSharingMessageDisplayInformation)displayInformation;
- (id)_urlRequest;
- (unint64_t)timeToLive;
- (void)setAccessRights:(id)a3;
- (void)setDisplayInformation:(id)a3;
- (void)setNotificationToken:(id)a3;
- (void)setNotificationTopic:(id)a3;
- (void)setPayload:(id)a3;
- (void)setTimeToLive:(unint64_t)a3;
@end

@implementation PDSharingRelayServerCreateMailboxRequest

- (id)_urlRequest
{
  uint64_t v18 = PKSharingRelayServerMailboxURI;
  v3 = +[NSArray arrayWithObjects:&v18 count:1];
  v4 = [(PDSharingRelayServerRequest *)self _murlRequestWithEndpointComponents:v3];

  [v4 setHTTPMethod:@"POST"];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = [(PDSharingMailboxPayload *)self->_payload dictionaryRepresentation];
  [v5 setObject:v6 forKeyedSubscript:@"payload"];

  v7 = [(PDSharingRelayServerRequest *)self _notificationTokenDictFromToken:self->_notificationToken topic:self->_notificationTopic];
  [v5 setObject:v7 forKeyedSubscript:@"notificationToken"];

  v8 = [(PKSharingMessageDisplayInformation *)self->_displayInformation openGraphURL];
  v9 = [v8 absoluteString];
  [v5 setObject:v9 forKeyedSubscript:@"displayInformationUrl"];

  if (self->_accessRights) {
    CFStringRef accessRights = (const __CFString *)self->_accessRights;
  }
  else {
    CFStringRef accessRights = @"RD";
  }
  v16[0] = @"accessRights";
  v16[1] = @"expiration";
  v17[0] = accessRights;
  id v11 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceNow:", (double)self->_timeToLive, @"accessRights", @"expiration", accessRights);
  v12 = RFC3339DateStringFromDateInUTCWithIntegralSeconds();
  v17[1] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v5 setObject:v13 forKeyedSubscript:@"mailboxConfiguration"];

  v14 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v5];
  [v4 setHTTPBody:v14];

  return v4;
}

- (PDSharingMailboxPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (PKSharingMessageDisplayInformation)displayInformation
{
  return self->_displayInformation;
}

- (void)setDisplayInformation:(id)a3
{
}

- (NSString)accessRights
{
  return self->_accessRights;
}

- (void)setAccessRights:(id)a3
{
}

- (unint64_t)timeToLive
{
  return self->_timeToLive;
}

- (void)setTimeToLive:(unint64_t)a3
{
  self->_timeToLive = a3;
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
  objc_storeStrong((id *)&self->_accessRights, 0);
  objc_storeStrong((id *)&self->_displayInformation, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end