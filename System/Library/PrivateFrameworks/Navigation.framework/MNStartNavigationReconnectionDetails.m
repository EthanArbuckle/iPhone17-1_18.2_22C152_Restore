@interface MNStartNavigationReconnectionDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isReconnecting;
- (MNStartNavigationReconnectionDetails)initWithCoder:(id)a3;
- (NSArray)spokenAnnouncements;
- (NSData)serverSessionState;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)initialRouteSource;
- (unint64_t)targetLegIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setInitialRouteSource:(unint64_t)a3;
- (void)setIsReconnecting:(BOOL)a3;
- (void)setServerSessionState:(id)a3;
- (void)setSpokenAnnouncements:(id)a3;
- (void)setTargetLegIndex:(unint64_t)a3;
@end

@implementation MNStartNavigationReconnectionDetails

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[MNStartNavigationReconnectionDetails allocWithZone:a3] init];
  v5 = v4;
  if (v4)
  {
    v4->_isReconnecting = self->_isReconnecting;
    v4->_initialRouteSource = self->_initialRouteSource;
    v4->_targetLegIndex = self->_targetLegIndex;
    uint64_t v6 = [(NSArray *)self->_spokenAnnouncements copy];
    spokenAnnouncements = v5->_spokenAnnouncements;
    v5->_spokenAnnouncements = (NSArray *)v6;

    uint64_t v8 = [(NSData *)self->_serverSessionState copy];
    serverSessionState = v5->_serverSessionState;
    v5->_serverSessionState = (NSData *)v8;

    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNStartNavigationReconnectionDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MNStartNavigationReconnectionDetails;
  v5 = [(MNStartNavigationReconnectionDetails *)&v15 init];
  if (v5)
  {
    v5->_isReconnecting = [v4 decodeBoolForKey:@"_isReconnecting"];
    v5->_initialRouteSource = [v4 decodeIntegerForKey:@"_initialRouteSource"];
    v5->_targetLegIndex = [v4 decodeIntegerForKey:@"_targetLegIndex"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_spokenAnnouncements"];
    spokenAnnouncements = v5->_spokenAnnouncements;
    v5->_spokenAnnouncements = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serverSessionState"];
    serverSessionState = v5->_serverSessionState;
    v5->_serverSessionState = (NSData *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isReconnecting = self->_isReconnecting;
  id v5 = a3;
  [v5 encodeBool:isReconnecting forKey:@"_isReconnecting"];
  [v5 encodeInteger:self->_initialRouteSource forKey:@"_initialRouteSource"];
  [v5 encodeInteger:self->_targetLegIndex forKey:@"_targetLegIndex"];
  [v5 encodeObject:self->_spokenAnnouncements forKey:@"_spokenAnnouncements"];
  [v5 encodeObject:self->_serverSessionState forKey:@"_serverSessionState"];
}

- (BOOL)isReconnecting
{
  return self->_isReconnecting;
}

- (void)setIsReconnecting:(BOOL)a3
{
  self->_BOOL isReconnecting = a3;
}

- (unint64_t)initialRouteSource
{
  return self->_initialRouteSource;
}

- (void)setInitialRouteSource:(unint64_t)a3
{
  self->_initialRouteSource = a3;
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  self->_targetLegIndex = a3;
}

- (NSArray)spokenAnnouncements
{
  return self->_spokenAnnouncements;
}

- (void)setSpokenAnnouncements:(id)a3
{
}

- (NSData)serverSessionState
{
  return self->_serverSessionState;
}

- (void)setServerSessionState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSessionState, 0);
  objc_storeStrong((id *)&self->_spokenAnnouncements, 0);
}

@end