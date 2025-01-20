@interface GKRealTimeMultiplayerAcceptBulletin
+ (BOOL)supportsSecureCoding;
- (BOOL)isAccept;
- (GKRealTimeMultiplayerAcceptBulletin)initWithCoder:(id)a3;
- (GKRealTimeMultiplayerAcceptBulletin)initWithPushNotification:(id)a3;
- (NSData)peerRelayIP;
- (NSData)relayConnectionID;
- (NSData)relayToken;
- (NSData)relayTranscationID;
- (NSData)selfRelayIP;
- (NSNumber)blobType;
- (NSNumber)peerRelayPort;
- (NSNumber)relayType;
- (NSNumber)selfRelayPort;
- (id)aggregateDictionaryKey;
- (id)debugLine;
- (id)notificationName;
- (void)assembleBulletin;
- (void)encodeWithCoder:(id)a3;
- (void)handleAction:(id)a3;
- (void)setBlobType:(id)a3;
- (void)setPeerRelayIP:(id)a3;
- (void)setPeerRelayPort:(id)a3;
- (void)setRelayConnectionID:(id)a3;
- (void)setRelayToken:(id)a3;
- (void)setRelayTranscationID:(id)a3;
- (void)setRelayType:(id)a3;
- (void)setSelfRelayIP:(id)a3;
- (void)setSelfRelayPort:(id)a3;
@end

@implementation GKRealTimeMultiplayerAcceptBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountInviteAccept;
}

- (id)debugLine
{
  return @"accept push";
}

- (id)notificationName
{
  return GKAcceptGameInviteNotification;
}

- (BOOL)isAccept
{
  return 1;
}

- (GKRealTimeMultiplayerAcceptBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerAcceptBulletin initWithPushNotification:", buf, 2u);
  }
  v31.receiver = self;
  v31.super_class = (Class)GKRealTimeMultiplayerAcceptBulletin;
  v7 = [(GKRealTimeMultiplayerBulletin *)&v31 initWithPushNotification:v4];
  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"e"];
    v9 = [(GKBulletin *)v7 dataFrom64String:v8];
    [(GKRealTimeMultiplayerBulletin *)v7 setSelfTicket:v9];

    uint64_t v10 = [v4 objectForKeyedSubscript:@"g"];
    blobType = v7->_blobType;
    v7->_blobType = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"t"];
    relayType = v7->_relayType;
    v7->_relayType = (NSNumber *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"k"];
    relayConnectionID = v7->_relayConnectionID;
    v7->_relayConnectionID = (NSData *)v14;

    v16 = [v4 objectForKeyedSubscript:@"q"];
    uint64_t v17 = [(GKBulletin *)v7 dataFrom64String:v16];
    relayTranscationID = v7->_relayTranscationID;
    v7->_relayTranscationID = (NSData *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"h"];
    selfRelayIP = v7->_selfRelayIP;
    v7->_selfRelayIP = (NSData *)v19;

    uint64_t v21 = [v4 objectForKeyedSubscript:@"o"];
    selfRelayPort = v7->_selfRelayPort;
    v7->_selfRelayPort = (NSNumber *)v21;

    v23 = [v4 objectForKeyedSubscript:@"H"];
    uint64_t v24 = [(GKBulletin *)v7 dataFrom64String:v23];
    peerRelayIP = v7->_peerRelayIP;
    v7->_peerRelayIP = (NSData *)v24;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"O"];
    peerRelayPort = v7->_peerRelayPort;
    v7->_peerRelayPort = (NSNumber *)v26;

    uint64_t v28 = [v4 objectForKeyedSubscript:@"r"];
    relayToken = v7->_relayToken;
    v7->_relayToken = (NSData *)v28;
  }
  return v7;
}

- (GKRealTimeMultiplayerAcceptBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerAcceptBulletin initWithCoder:", buf, 2u);
  }
  v27.receiver = self;
  v27.super_class = (Class)GKRealTimeMultiplayerAcceptBulletin;
  v7 = [(GKRealTimeMultiplayerBulletin *)&v27 initWithCoder:v4];
  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blobType"];
    blobType = v7->_blobType;
    v7->_blobType = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relayType"];
    relayType = v7->_relayType;
    v7->_relayType = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relayConnectionID"];
    relayConnectionID = v7->_relayConnectionID;
    v7->_relayConnectionID = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relayTranscationID"];
    relayTranscationID = v7->_relayTranscationID;
    v7->_relayTranscationID = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selfRelayIP"];
    selfRelayIP = v7->_selfRelayIP;
    v7->_selfRelayIP = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selfRelayPort"];
    selfRelayPort = v7->_selfRelayPort;
    v7->_selfRelayPort = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerRelayIP"];
    peerRelayIP = v7->_peerRelayIP;
    v7->_peerRelayIP = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerRelayPort"];
    peerRelayPort = v7->_peerRelayPort;
    v7->_peerRelayPort = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relayToken"];
    relayToken = v7->_relayToken;
    v7->_relayToken = (NSData *)v24;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerAcceptBulletin encodeWithCoder:", buf, 2u);
  }
  v16.receiver = self;
  v16.super_class = (Class)GKRealTimeMultiplayerAcceptBulletin;
  [(GKRealTimeMultiplayerBulletin *)&v16 encodeWithCoder:v4];
  v7 = [(GKRealTimeMultiplayerAcceptBulletin *)self blobType];
  [v4 encodeObject:v7 forKey:@"blobType"];

  uint64_t v8 = [(GKRealTimeMultiplayerAcceptBulletin *)self relayType];
  [v4 encodeObject:v8 forKey:@"relayType"];

  v9 = [(GKRealTimeMultiplayerAcceptBulletin *)self relayConnectionID];
  [v4 encodeObject:v9 forKey:@"relayConnectionID"];

  uint64_t v10 = [(GKRealTimeMultiplayerAcceptBulletin *)self relayTranscationID];
  [v4 encodeObject:v10 forKey:@"relayTranscationID"];

  v11 = [(GKRealTimeMultiplayerAcceptBulletin *)self selfRelayIP];
  [v4 encodeObject:v11 forKey:@"selfRelayIP"];

  uint64_t v12 = [(GKRealTimeMultiplayerAcceptBulletin *)self selfRelayPort];
  [v4 encodeObject:v12 forKey:@"selfRelayPort"];

  v13 = [(GKRealTimeMultiplayerAcceptBulletin *)self peerRelayIP];
  [v4 encodeObject:v13 forKey:@"peerRelayIP"];

  uint64_t v14 = [(GKRealTimeMultiplayerAcceptBulletin *)self peerRelayPort];
  [v4 encodeObject:v14 forKey:@"peerRelayPort"];

  v15 = [(GKRealTimeMultiplayerAcceptBulletin *)self relayToken];
  [v4 encodeObject:v15 forKey:@"relayToken"];
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerAcceptBulletin assembleBulletin:", buf, 2u);
  }
  v17.receiver = self;
  v17.super_class = (Class)GKRealTimeMultiplayerAcceptBulletin;
  [(GKRealTimeMultiplayerActionBulletin *)&v17 assembleBulletin];
  id v5 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v5 setType:1];
  v6 = [(GKBulletin *)self gameDescriptor];
  v7 = [v6 adamID];
  [(GKBulletinAction *)v5 setAdamID:v7];

  uint64_t v8 = [(GKBulletin *)self gameDescriptor];
  v9 = [v8 bundleIdentifier];
  [(GKBulletinAction *)v5 setBundleID:v9];

  [(GKBulletinAction *)v5 setTitle:&stru_1002E4F58];
  [(GKBulletin *)self setDefaultAction:v5];
  [(GKBulletin *)self setBulletinType:402];
  uint64_t v10 = [(GKGameplayBulletin *)self originatorPlayer];
  v11 = [v10 displayNameWithOptions:0];

  if (v11)
  {
    uint64_t v12 = +[GCFLocalizedStrings KETTLE_INVITEE_ACCEPTED_ALERT_MESSAGE_ALIAS_1_FORMAT];
    v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v11);
  }
  else
  {
    v13 = +[GCFLocalizedStrings KETTLE_INVITEE_ACCEPTED_ALERT_MESSAGE];
  }
  uint64_t v14 = +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE];
  v15 = [(GKBulletin *)self gameName];
  objc_super v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v15);
  [(GKBulletin *)self setTitle:v16];

  [(GKBulletin *)self setMessage:v13];
}

- (void)handleAction:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerAcceptBulletin handleAction:", buf, 2u);
  }
  v13.receiver = self;
  v13.super_class = (Class)GKRealTimeMultiplayerAcceptBulletin;
  [(GKBulletin *)&v13 handleAction:v4];
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  uint64_t v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "bulletin handle multiplayer action: %@", buf, 0xCu);
  }
  v9 = [(GKBulletin *)self gameDescriptor];
  uint64_t v10 = [v9 bundleIdentifier];
  v11 = +[GKClientProxy clientForBundleID:v10];

  uint64_t v12 = [(GKRealTimeMultiplayerBulletin *)self clientNotification];
  [v11 acceptInviteWithNotification:v12];
}

- (NSNumber)blobType
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setBlobType:(id)a3
{
}

- (NSNumber)relayType
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setRelayType:(id)a3
{
}

- (NSData)relayConnectionID
{
  return (NSData *)objc_getProperty(self, a2, 400, 1);
}

- (void)setRelayConnectionID:(id)a3
{
}

- (NSData)relayTranscationID
{
  return (NSData *)objc_getProperty(self, a2, 408, 1);
}

- (void)setRelayTranscationID:(id)a3
{
}

- (NSData)selfRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 416, 1);
}

- (void)setSelfRelayIP:(id)a3
{
}

- (NSNumber)selfRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setSelfRelayPort:(id)a3
{
}

- (NSData)peerRelayIP
{
  return (NSData *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPeerRelayIP:(id)a3
{
}

- (NSNumber)peerRelayPort
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setPeerRelayPort:(id)a3
{
}

- (NSData)relayToken
{
  return (NSData *)objc_getProperty(self, a2, 448, 1);
}

- (void)setRelayToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayToken, 0);
  objc_storeStrong((id *)&self->_peerRelayPort, 0);
  objc_storeStrong((id *)&self->_peerRelayIP, 0);
  objc_storeStrong((id *)&self->_selfRelayPort, 0);
  objc_storeStrong((id *)&self->_selfRelayIP, 0);
  objc_storeStrong((id *)&self->_relayTranscationID, 0);
  objc_storeStrong((id *)&self->_relayConnectionID, 0);
  objc_storeStrong((id *)&self->_relayType, 0);

  objc_storeStrong((id *)&self->_blobType, 0);
}

@end