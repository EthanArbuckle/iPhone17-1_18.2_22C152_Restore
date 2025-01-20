@interface ICDCloudPushNotificationAccountRegistrationState
- (ICDCloudPushNotificationAccountRegistrationState)initWithDictionaryRepresentation:(id)a3;
- (NSArray)mediaKinds;
- (NSData)APNSToken;
- (id)dictionaryRepresentation;
- (void)setAPNSToken:(id)a3;
- (void)setMediaKinds:(id)a3;
@end

@implementation ICDCloudPushNotificationAccountRegistrationState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaKinds, 0);

  objc_storeStrong((id *)&self->_APNSToken, 0);
}

- (void)setMediaKinds:(id)a3
{
}

- (NSArray)mediaKinds
{
  return self->_mediaKinds;
}

- (void)setAPNSToken:(id)a3
{
}

- (NSData)APNSToken
{
  return self->_APNSToken;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionaryWithCapacity:2];
  v4 = v3;
  APNSToken = self->_APNSToken;
  if (APNSToken) {
    [v3 setObject:APNSToken forKey:@"APNSToken"];
  }
  mediaKinds = self->_mediaKinds;
  if (mediaKinds) {
    [v4 setObject:mediaKinds forKey:@"mediaKinds"];
  }

  return v4;
}

- (ICDCloudPushNotificationAccountRegistrationState)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(ICDCloudPushNotificationAccountRegistrationState *)self init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ic_dataValueForKey:", @"APNSToken");
    APNSToken = v5->_APNSToken;
    v5->_APNSToken = (NSData *)v6;

    uint64_t v8 = objc_msgSend(v4, "ic_arrayValueForKey:", @"mediaKinds");
    mediaKinds = v5->_mediaKinds;
    v5->_mediaKinds = (NSArray *)v8;
  }
  return v5;
}

@end