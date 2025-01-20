@interface NPHMockTUProxyCall
- (BOOL)isOutgoing;
- (BOOL)isRTT;
- (BOOL)isSOS;
- (BOOL)mockIsOutgoing;
- (BOOL)mockIsSOS;
- (NSString)mockDestinationID;
- (NSString)mockDisplayName;
- (NSString)mockLocalizedLabel;
- (TUCallProvider)mockProvider;
- (TUDialRequest)mockDialRequestForRedial;
- (TUSenderIdentity)mockLocalSenderIdentity;
- (double)mockStartTime;
- (id)contactIdentifiers;
- (id)dialRequestForRedial;
- (id)displayName;
- (id)handle;
- (id)localSenderIdentity;
- (id)localizedLabel;
- (id)provider;
- (id)remoteParticipantHandles;
- (int)disconnectedReason;
- (int)mockDisconnectedReason;
- (int)mockService;
- (int)mockStatus;
- (int)service;
- (int)status;
- (unint64_t)nph_audioMessageType;
- (void)setMockDestinationID:(id)a3;
- (void)setMockDialRequestForRedial:(id)a3;
- (void)setMockDisconnectedReason:(int)a3;
- (void)setMockDisplayName:(id)a3;
- (void)setMockLocalSenderIdentity:(id)a3;
- (void)setMockLocalizedLabel:(id)a3;
- (void)setMockOutgoing:(BOOL)a3;
- (void)setMockProvider:(id)a3;
- (void)setMockSOS:(BOOL)a3;
- (void)setMockService:(int)a3;
- (void)setMockStartTime:(double)a3;
- (void)setMockStatus:(int)a3;
- (void)setNph_audioMessageType:(unint64_t)a3;
@end

@implementation NPHMockTUProxyCall

- (id)displayName
{
  v3 = [(NPHMockTUProxyCall *)self mockDisplayName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NPHMockTUProxyCall;
    id v5 = [(NPHMockTUProxyCall *)&v8 displayName];
  }
  v6 = v5;

  return v6;
}

- (id)localizedLabel
{
  v3 = [(NPHMockTUProxyCall *)self mockLocalizedLabel];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NPHMockTUProxyCall;
    id v5 = [(NPHMockTUProxyCall *)&v8 localizedLabel];
  }
  v6 = v5;

  return v6;
}

- (id)localSenderIdentity
{
  v3 = [(NPHMockTUProxyCall *)self mockLocalSenderIdentity];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NPHMockTUProxyCall;
    id v5 = [(NPHMockTUProxyCall *)&v8 localSenderIdentity];
  }
  v6 = v5;

  return v6;
}

- (int)status
{
  int result = [(NPHMockTUProxyCall *)self mockStatus];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)NPHMockTUProxyCall;
    return [(NPHMockTUProxyCall *)&v4 status];
  }
  return result;
}

- (int)service
{
  int result = [(NPHMockTUProxyCall *)self mockService];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)NPHMockTUProxyCall;
    return [(NPHMockTUProxyCall *)&v4 service];
  }
  return result;
}

- (id)provider
{
  if ([(NPHMockTUProxyCall *)self mockService] == 1)
  {
    v3 = +[TUCallCenter sharedInstance];
    objc_super v4 = [v3 providerManager];
    id v5 = [v4 telephonyProvider];
  }
  else
  {
    v6 = [(NPHMockTUProxyCall *)self mockProvider];
    v3 = v6;
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)NPHMockTUProxyCall;
      id v7 = [(NPHMockTUProxyCall *)&v9 provider];
    }
    id v5 = v7;
  }

  return v5;
}

- (int)disconnectedReason
{
  int result = [(NPHMockTUProxyCall *)self mockDisconnectedReason];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)NPHMockTUProxyCall;
    return [(NPHMockTUProxyCall *)&v4 disconnectedReason];
  }
  return result;
}

- (BOOL)isOutgoing
{
  if ([(NPHMockTUProxyCall *)self mockIsOutgoing]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NPHMockTUProxyCall;
  return [(NPHMockTUProxyCall *)&v4 isOutgoing];
}

- (BOOL)isSOS
{
  if ([(NPHMockTUProxyCall *)self mockIsSOS]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NPHMockTUProxyCall;
  return [(NPHMockTUProxyCall *)&v4 isSOS];
}

- (BOOL)isRTT
{
  return 1;
}

- (id)dialRequestForRedial
{
  v3 = [(NPHMockTUProxyCall *)self mockDialRequestForRedial];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NPHMockTUProxyCall;
    id v5 = [(NPHMockTUProxyCall *)&v8 dialRequestForRedial];
  }
  v6 = v5;

  return v6;
}

- (id)contactIdentifiers
{
  return &off_100011368;
}

- (id)handle
{
  id v2 = [objc_alloc((Class)TUHandle) initWithType:3 value:@"tomabuct_dev@icloud.com"];

  return v2;
}

- (id)remoteParticipantHandles
{
  id v2 = [(NPHMockTUProxyCall *)self handle];
  v3 = +[NSSet setWithObject:v2];

  return v3;
}

- (NSString)mockDisplayName
{
  return self->_mockDisplayName;
}

- (void)setMockDisplayName:(id)a3
{
}

- (NSString)mockLocalizedLabel
{
  return self->_mockLocalizedLabel;
}

- (void)setMockLocalizedLabel:(id)a3
{
}

- (TUSenderIdentity)mockLocalSenderIdentity
{
  return self->_mockLocalSenderIdentity;
}

- (void)setMockLocalSenderIdentity:(id)a3
{
}

- (int)mockService
{
  return self->_mockService;
}

- (void)setMockService:(int)a3
{
  self->_mockService = a3;
}

- (TUCallProvider)mockProvider
{
  return self->_mockProvider;
}

- (void)setMockProvider:(id)a3
{
}

- (NSString)mockDestinationID
{
  return self->_mockDestinationID;
}

- (void)setMockDestinationID:(id)a3
{
}

- (double)mockStartTime
{
  return self->_mockStartTime;
}

- (void)setMockStartTime:(double)a3
{
  self->_mockStartTime = a3;
}

- (int)mockDisconnectedReason
{
  return self->_mockDisconnectedReason;
}

- (void)setMockDisconnectedReason:(int)a3
{
  self->_mockDisconnectedReason = a3;
}

- (BOOL)mockIsOutgoing
{
  return self->_mockOutgoing;
}

- (void)setMockOutgoing:(BOOL)a3
{
  self->_mockOutgoing = a3;
}

- (int)mockStatus
{
  return self->_mockStatus;
}

- (void)setMockStatus:(int)a3
{
  self->_mockStatus = a3;
}

- (BOOL)mockIsSOS
{
  return self->_mockSOS;
}

- (void)setMockSOS:(BOOL)a3
{
  self->_mockSOS = a3;
}

- (TUDialRequest)mockDialRequestForRedial
{
  return self->_mockDialRequestForRedial;
}

- (void)setMockDialRequestForRedial:(id)a3
{
}

- (unint64_t)nph_audioMessageType
{
  return self->_nph_audioMessageType;
}

- (void)setNph_audioMessageType:(unint64_t)a3
{
  self->_nph_audioMessageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockDialRequestForRedial, 0);
  objc_storeStrong((id *)&self->_mockDestinationID, 0);
  objc_storeStrong((id *)&self->_mockProvider, 0);
  objc_storeStrong((id *)&self->_mockLocalSenderIdentity, 0);
  objc_storeStrong((id *)&self->_mockLocalizedLabel, 0);

  objc_storeStrong((id *)&self->_mockDisplayName, 0);
}

@end