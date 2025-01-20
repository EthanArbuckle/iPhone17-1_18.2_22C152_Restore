@interface GKRealTimeMultiplayerBulletin
+ (BOOL)supportsSecureCoding;
- (BOOL)isMessageBasedInvite;
- (BOOL)isNearbyInvite;
- (BOOL)isSharePlayInvite;
- (BOOL)serverHosted;
- (GKRealTimeMultiplayerBulletin)init;
- (GKRealTimeMultiplayerBulletin)initWithCoder:(id)a3;
- (GKRealTimeMultiplayerBulletin)initWithPushNotification:(id)a3;
- (NSData)peerBlob;
- (NSData)peerNatIP;
- (NSData)peerPushToken;
- (NSData)selfTicket;
- (NSData)sessionToken;
- (NSDictionary)clientDictionary;
- (NSNumber)declineReason;
- (NSNumber)inviteVersion;
- (NSNumber)peerNatType;
- (NSNumber)selfNatType;
- (NSNumber)transportVersionToUse;
- (NSString)peerPseudonym;
- (NSString)sessionID;
- (id)clientNotification;
- (id)clientNotificationWithiCloudID:(id)a3;
- (id)customInviteSoundPathForBundleID:(id)a3;
- (id)description;
- (int64_t)inviteVersionFromMessage:(id)a3;
- (unint64_t)inviteApproach;
- (void)declineInviteWithReason:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)parseClientData:(id)a3;
- (void)setClientDictionary:(id)a3;
- (void)setDeclineReason:(id)a3;
- (void)setInviteApproach:(unint64_t)a3;
- (void)setInviteVersion:(id)a3;
- (void)setIsMessageBasedInvite:(BOOL)a3;
- (void)setIsNearbyInvite:(BOOL)a3;
- (void)setIsSharePlayInvite:(BOOL)a3;
- (void)setPeerBlob:(id)a3;
- (void)setPeerNatIP:(id)a3;
- (void)setPeerNatType:(id)a3;
- (void)setPeerPseudonym:(id)a3;
- (void)setPeerPushToken:(id)a3;
- (void)setSelfNatType:(id)a3;
- (void)setSelfTicket:(id)a3;
- (void)setServerHosted:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setTransportVersionToUse:(id)a3;
- (void)updateDeclineInviteTrackingForReason:(int64_t)a3;
@end

@implementation GKRealTimeMultiplayerBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKRealTimeMultiplayerBulletin)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKRealTimeMultiplayerBulletin;
  return [(GKRealTimeMultiplayerBulletin *)&v3 init];
}

- (int64_t)inviteVersionFromMessage:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin inviteVersionFromMessage:", v11, 2u);
  }
  uint64_t v6 = (uint64_t)[v3 length];
  id v7 = v3;
  v8 = (char *)[v7 bytes];
  if (v6 < 2 || v8[v6 - 2]) {
    int64_t v9 = 0;
  }
  else {
    int64_t v9 = v8[v6 - 1];
  }

  return v9;
}

- (void)parseClientData:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin parseClientData:", v9, 2u);
  }
  id v7 = +[NSNumber numberWithUnsignedChar:[(GKRealTimeMultiplayerBulletin *)self inviteVersionFromMessage:v4]];
  inviteVersion = self->_inviteVersion;
  self->_inviteVersion = v7;
}

- (GKRealTimeMultiplayerBulletin)initWithPushNotification:(id)a3
{
  id v4 = (NSDictionary *)a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin initWithPushNotification:", buf, 2u);
  }
  v49.receiver = self;
  v49.super_class = (Class)GKRealTimeMultiplayerBulletin;
  id v7 = [(GKMultiplayerBulletin *)&v49 initWithPushNotification:v4];
  if (v7)
  {
    uint64_t v8 = [(NSDictionary *)v4 objectForKeyedSubscript:@"x"];
    clientDictionary = v7->_clientDictionary;
    v7->_clientDictionary = (NSDictionary *)v8;

    v10 = [(NSDictionary *)v4 objectForKeyedSubscript:@"s"];
    uint64_t v11 = [(GKBulletin *)v7 dataFrom64String:v10];
    sessionToken = v7->_sessionToken;
    v7->_sessionToken = (NSData *)v11;

    v13 = [(NSDictionary *)v4 objectForKeyedSubscript:@"P"];
    uint64_t v14 = [(GKBulletin *)v7 dataFrom64String:v13];
    peerPushToken = v7->_peerPushToken;
    v7->_peerPushToken = (NSData *)v14;

    uint64_t v16 = [(NSDictionary *)v4 objectForKeyedSubscript:@"N"];
    peerNatType = v7->_peerNatType;
    v7->_peerNatType = (NSNumber *)v16;

    v18 = [(NSDictionary *)v4 objectForKeyedSubscript:@"A"];
    uint64_t v19 = [(GKBulletin *)v7 dataFrom64String:v18];
    peerNatIP = v7->_peerNatIP;
    v7->_peerNatIP = (NSData *)v19;

    v21 = [(NSDictionary *)v4 objectForKeyedSubscript:@"B"];
    uint64_t v22 = [(GKBulletin *)v7 dataFrom64String:v21];
    peerBlob = v7->_peerBlob;
    v7->_peerBlob = (NSData *)v22;

    uint64_t v24 = [(NSDictionary *)v7->_clientDictionary objectForKeyedSubscript:GKInviteSessionIDKey];
    sessionID = v7->_sessionID;
    v7->_sessionID = (NSString *)v24;

    uint64_t v26 = [(NSDictionary *)v7->_clientDictionary objectForKeyedSubscript:GKTransportPseudonymKey];
    peerPseudonym = v7->_peerPseudonym;
    v7->_peerPseudonym = (NSString *)v26;

    uint64_t v28 = GKSuggestedTransportVersionPushShortKey;
    v29 = [(NSDictionary *)v4 objectForKeyedSubscript:GKSuggestedTransportVersionPushShortKey];

    if (v29)
    {
      v30 = v4;
    }
    else
    {
      v31 = [(NSDictionary *)v7->_clientDictionary objectForKeyedSubscript:v28];

      if (!v31)
      {
        uint64_t v43 = +[NSNumber numberWithInteger:1];
        transportVersionToUse = v7->_transportVersionToUse;
        v7->_transportVersionToUse = (NSNumber *)v43;

        if (!os_log_GKGeneral) {
          id v45 = (id)GKOSLoggers();
        }
        v46 = (void *)os_log_GKMatch;
        if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
        {
          v47 = v46;
          v48 = +[NSNumber numberWithInteger:1];
          *(_DWORD *)buf = 138412290;
          v51 = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Default to use (%@) GKDefaultTransportVersionIfNeeded, since this is not included in the push notification.", buf, 0xCu);
        }
        goto LABEL_11;
      }
      v30 = v7->_clientDictionary;
    }
    uint64_t v32 = [(NSDictionary *)v30 objectForKeyedSubscript:v28];
    v33 = v7->_transportVersionToUse;
    v7->_transportVersionToUse = (NSNumber *)v32;

LABEL_11:
    v34 = [(GKRealTimeMultiplayerBulletin *)v7 clientDictionary];
    v35 = [v34 objectForKeyedSubscript:@"s"];
    v36 = [(GKBulletin *)v7 dataFrom64String:v35];

    [(GKRealTimeMultiplayerBulletin *)v7 parseClientData:v36];
    id v37 = objc_alloc((Class)GKGameDescriptor);
    v38 = [(NSDictionary *)v4 objectForKey:@"d"];
    id v39 = [v37 initWithPushDictionary:v38];
    [(GKBulletin *)v7 setGameDescriptor:v39];

    uint64_t v40 = [(NSDictionary *)v4 objectForKey:GKDeclineReasonKey];
    declineReason = v7->_declineReason;
    v7->_declineReason = (NSNumber *)v40;
  }
  return v7;
}

- (GKRealTimeMultiplayerBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin initWithCoder:", buf, 2u);
  }
  v38.receiver = self;
  v38.super_class = (Class)GKRealTimeMultiplayerBulletin;
  id v7 = [(GKGameplayBulletin *)&v38 initWithCoder:v4];
  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionToken"];
    sessionToken = v7->_sessionToken;
    v7->_sessionToken = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selfNatType"];
    selfNatType = v7->_selfNatType;
    v7->_selfNatType = (NSNumber *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverHosted"];
    v7->_serverHosted = [v12 BOOLValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPushToken"];
    peerPushToken = v7->_peerPushToken;
    v7->_peerPushToken = (NSData *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerNatType"];
    peerNatType = v7->_peerNatType;
    v7->_peerNatType = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerNatIP"];
    peerNatIP = v7->_peerNatIP;
    v7->_peerNatIP = (NSData *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerBlob"];
    peerBlob = v7->_peerBlob;
    v7->_peerBlob = (NSData *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selfTicket"];
    selfTicket = v7->_selfTicket;
    v7->_selfTicket = (NSData *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"declineReason"];
    declineReason = v7->_declineReason;
    v7->_declineReason = (NSNumber *)v23;

    uint64_t v25 = objc_opt_class();
    uint64_t v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"clientDictionary"];
    clientDictionary = v7->_clientDictionary;
    v7->_clientDictionary = (NSDictionary *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inviteVersion"];
    inviteVersion = v7->_inviteVersion;
    v7->_inviteVersion = (NSNumber *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    sessionID = v7->_sessionID;
    v7->_sessionID = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pseudonym"];
    peerPseudonym = v7->_peerPseudonym;
    v7->_peerPseudonym = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transportVersionToUse"];
    transportVersionToUse = v7->_transportVersionToUse;
    v7->_transportVersionToUse = (NSNumber *)v35;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin encodeWithCoder:", buf, 2u);
  }
  v21.receiver = self;
  v21.super_class = (Class)GKRealTimeMultiplayerBulletin;
  [(GKGameplayBulletin *)&v21 encodeWithCoder:v4];
  id v7 = [(GKRealTimeMultiplayerBulletin *)self sessionToken];
  [v4 encodeObject:v7 forKey:@"sessionToken"];

  uint64_t v8 = [(GKRealTimeMultiplayerBulletin *)self selfNatType];
  [v4 encodeObject:v8 forKey:@"selfNatType"];

  int64_t v9 = +[NSNumber numberWithBool:[(GKRealTimeMultiplayerBulletin *)self serverHosted]];
  [v4 encodeObject:v9 forKey:@"serverHosted"];

  uint64_t v10 = [(GKRealTimeMultiplayerBulletin *)self peerPushToken];
  [v4 encodeObject:v10 forKey:@"peerPushToken"];

  uint64_t v11 = [(GKRealTimeMultiplayerBulletin *)self peerNatType];
  [v4 encodeObject:v11 forKey:@"peerNatType"];

  v12 = [(GKRealTimeMultiplayerBulletin *)self peerNatIP];
  [v4 encodeObject:v12 forKey:@"peerNatIP"];

  uint64_t v13 = [(GKRealTimeMultiplayerBulletin *)self peerBlob];
  [v4 encodeObject:v13 forKey:@"peerBlob"];

  uint64_t v14 = [(GKRealTimeMultiplayerBulletin *)self selfTicket];
  [v4 encodeObject:v14 forKey:@"selfTicket"];

  uint64_t v15 = [(GKRealTimeMultiplayerBulletin *)self declineReason];
  [v4 encodeObject:v15 forKey:@"declineReason"];

  uint64_t v16 = [(GKRealTimeMultiplayerBulletin *)self clientDictionary];
  [v4 encodeObject:v16 forKey:@"clientDictionary"];

  uint64_t v17 = [(GKRealTimeMultiplayerBulletin *)self inviteVersion];
  [v4 encodeObject:v17 forKey:@"inviteVersion"];

  v18 = [(GKRealTimeMultiplayerBulletin *)self sessionID];
  [v4 encodeObject:v18 forKey:@"sessionID"];

  uint64_t v19 = [(GKRealTimeMultiplayerBulletin *)self peerPseudonym];
  [v4 encodeObject:v19 forKey:@"pseudonym"];

  v20 = [(GKRealTimeMultiplayerBulletin *)self transportVersionToUse];
  [v4 encodeObject:v20 forKey:@"transportVersionToUse"];
}

- (id)clientNotificationWithiCloudID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKRealTimeMultiplayerBulletin *)self clientNotification];
  uint64_t v6 = +[NSMutableDictionary dictionaryWithDictionary:v5];

  if (v4) {
    [v6 setObject:v4 forKeyedSubscript:@"iCloudID"];
  }

  return v6;
}

- (id)clientNotification
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin clientNotification", v35, 2u);
  }
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v6 = [(GKRealTimeMultiplayerBulletin *)self sessionToken];

  if (v6)
  {
    id v7 = [(GKRealTimeMultiplayerBulletin *)self sessionToken];
    [v5 setObject:v7 forKeyedSubscript:@"session-token"];
  }
  uint64_t v8 = [(GKGameplayBulletin *)self receiverPlayerID];

  if (v8)
  {
    int64_t v9 = [(GKGameplayBulletin *)self receiverPlayerID];
    [v5 setObject:v9 forKeyedSubscript:@"self-id"];
  }
  uint64_t v10 = [(GKGameplayBulletin *)self originatorPlayerID];

  if (v10)
  {
    uint64_t v11 = [(GKGameplayBulletin *)self originatorPlayerID];
    [v5 setObject:v11 forKeyedSubscript:@"peer-id"];
  }
  v12 = [(GKRealTimeMultiplayerBulletin *)self peerPushToken];

  if (v12)
  {
    uint64_t v13 = [(GKRealTimeMultiplayerBulletin *)self peerPushToken];
    [v5 setObject:v13 forKeyedSubscript:@"peer-push-token"];
  }
  uint64_t v14 = [(GKRealTimeMultiplayerBulletin *)self peerNatType];

  if (v14)
  {
    uint64_t v15 = [(GKRealTimeMultiplayerBulletin *)self peerNatType];
    [v5 setObject:v15 forKeyedSubscript:@"peer-nat-type"];
  }
  uint64_t v16 = [(GKRealTimeMultiplayerBulletin *)self peerNatIP];

  if (v16)
  {
    uint64_t v17 = [(GKRealTimeMultiplayerBulletin *)self peerNatIP];
    [v5 setObject:v17 forKeyedSubscript:@"peer-nat-ip"];
  }
  v18 = [(GKRealTimeMultiplayerBulletin *)self peerBlob];

  if (v18)
  {
    uint64_t v19 = [(GKRealTimeMultiplayerBulletin *)self peerBlob];
    [v5 setObject:v19 forKeyedSubscript:@"peer-blob"];
  }
  v20 = [(GKRealTimeMultiplayerBulletin *)self inviteVersion];

  if (v20)
  {
    objc_super v21 = [(GKRealTimeMultiplayerBulletin *)self inviteVersion];
    [v5 setObject:v21 forKeyedSubscript:@"invite-version"];
  }
  uint64_t v22 = [(GKRealTimeMultiplayerBulletin *)self transportVersionToUse];

  if (v22)
  {
    uint64_t v23 = [(GKRealTimeMultiplayerBulletin *)self transportVersionToUse];
    [v5 setObject:v23 forKeyedSubscript:GKSuggestedTransportVersionPushShortKey];
  }
  uint64_t v24 = [(GKRealTimeMultiplayerBulletin *)self selfTicket];

  if (v24)
  {
    uint64_t v25 = [(GKRealTimeMultiplayerBulletin *)self selfTicket];
    [v5 setObject:v25 forKeyedSubscript:GKInviteCDXTicketIDKey];
  }
  uint64_t v26 = [(GKRealTimeMultiplayerBulletin *)self sessionID];

  if (v26)
  {
    uint64_t v27 = [(GKRealTimeMultiplayerBulletin *)self sessionID];
    [v5 setObject:v27 forKeyedSubscript:GKInviteSessionIDKey];
  }
  uint64_t v28 = [(GKRealTimeMultiplayerBulletin *)self peerPseudonym];

  if (v28)
  {
    uint64_t v29 = [(GKRealTimeMultiplayerBulletin *)self peerPseudonym];
    [v5 setObject:v29 forKeyedSubscript:GKInvitePeerPseudonym];
  }
  v30 = [(GKBulletin *)self gameDescriptor];
  uint64_t v31 = [v30 bundleIdentifier];
  [v5 setObject:v31 forKeyedSubscript:GKBundleIDKey];

  uint64_t v32 = [(GKRealTimeMultiplayerBulletin *)self declineReason];

  if (v32)
  {
    uint64_t v33 = [(GKRealTimeMultiplayerBulletin *)self declineReason];
    [v5 setObject:v33 forKeyedSubscript:GKDeclineReasonKey];
  }

  return v5;
}

- (void)updateDeclineInviteTrackingForReason:(int64_t)a3
{
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin updateDeclineInviteTrackingForReason:", v11, 2u);
  }
  id v7 = +[NSNumber numberWithInteger:a3];
  [(GKRealTimeMultiplayerBulletin *)self setDeclineReason:v7];

  if ((unint64_t)a3 > 5) {
    uint64_t v8 = (id *)&GKReporterInviteDeclineUser;
  }
  else {
    uint64_t v8 = (id *)*(&off_1002DC6A0 + a3);
  }
  id v9 = *v8;
  uint64_t v10 = +[GKReporter reporter];
  [v10 reportEvent:GKReporterDomainInvite type:v9];
}

- (void)declineInviteWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  uint64_t v6 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    uint64_t v8 = +[NSNumber numberWithUnsignedInt:v3];
    int v15 = 138412290;
    uint64_t v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin: declineInviteWithReason: %@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v9 = v3;
  [(GKRealTimeMultiplayerBulletin *)self updateDeclineInviteTrackingForReason:v3];
  if (v3 == 5)
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_ERROR)) {
      sub_100152DB4();
    }
  }
  else
  {
    uint64_t v11 = +[GKInviteInternal inviteWithBulletin:self];
    v12 = [(GKBulletin *)self gameDescriptor];
    uint64_t v13 = [v12 bundleIdentifier];
    uint64_t v14 = +[GKService serviceForBundleID:v13 localPlayer:0];
    [v14 declineGameInvite:v11 reason:v9 handler:0];
  }
}

- (id)customInviteSoundPathForBundleID:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin: customInviteSoundPathForBundleID:", v13, 2u);
  }
  uint64_t v6 = GKGetBundlePathForIdentifier();
  id v7 = +[NSBundle bundleWithPath:v6];
  uint64_t v8 = [v7 _gkPathForInviteSound];
  uint64_t v9 = (void *)v8;
  id v10 = &stru_1002E4F58;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)GKRealTimeMultiplayerBulletin;
  id v3 = [(GKBulletin *)&v12 description];
  id v4 = [(GKBulletin *)self gameDescriptor];
  id v5 = [v4 bundleIdentifier];
  uint64_t v6 = [(GKGameplayBulletin *)self originatorPlayerID];
  id v7 = [(GKGameplayBulletin *)self receiverPlayerID];
  uint64_t v8 = [(GKRealTimeMultiplayerBulletin *)self sessionToken];
  uint64_t v9 = [(GKRealTimeMultiplayerBulletin *)self sessionID];
  id v10 = [v3 stringByAppendingFormat:@"\ngameDescriptor.bundleIdentifier:%@\noriginatorPlayerID:%@\nreceiverPlayerID:%@\nsessionToken:%@\nsessionID:%@\n", v5, v6, v7, v8, v9];

  return v10;
}

- (NSData)sessionToken
{
  return (NSData *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSessionToken:(id)a3
{
}

- (NSNumber)selfNatType
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSelfNatType:(id)a3
{
}

- (BOOL)serverHosted
{
  return self->_serverHosted;
}

- (void)setServerHosted:(BOOL)a3
{
  self->_serverHosted = a3;
}

- (NSData)peerPushToken
{
  return (NSData *)objc_getProperty(self, a2, 272, 1);
}

- (void)setPeerPushToken:(id)a3
{
}

- (NSNumber)peerNatType
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setPeerNatType:(id)a3
{
}

- (NSData)peerNatIP
{
  return (NSData *)objc_getProperty(self, a2, 288, 1);
}

- (void)setPeerNatIP:(id)a3
{
}

- (NSData)peerBlob
{
  return (NSData *)objc_getProperty(self, a2, 296, 1);
}

- (void)setPeerBlob:(id)a3
{
}

- (NSData)selfTicket
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSelfTicket:(id)a3
{
}

- (NSNumber)declineReason
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setDeclineReason:(id)a3
{
}

- (NSDictionary)clientDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 320, 1);
}

- (void)setClientDictionary:(id)a3
{
}

- (NSNumber)inviteVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setInviteVersion:(id)a3
{
}

- (BOOL)isMessageBasedInvite
{
  return self->_isMessageBasedInvite;
}

- (void)setIsMessageBasedInvite:(BOOL)a3
{
  self->_isMessageBasedInvite = a3;
}

- (unint64_t)inviteApproach
{
  return self->_inviteApproach;
}

- (void)setInviteApproach:(unint64_t)a3
{
  self->_inviteApproach = a3;
}

- (BOOL)isSharePlayInvite
{
  return self->_isSharePlayInvite;
}

- (void)setIsSharePlayInvite:(BOOL)a3
{
  self->_isSharePlayInvite = a3;
}

- (BOOL)isNearbyInvite
{
  return self->_isNearbyInvite;
}

- (void)setIsNearbyInvite:(BOOL)a3
{
  self->_isNearbyInvite = a3;
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)peerPseudonym
{
  return self->_peerPseudonym;
}

- (void)setPeerPseudonym:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPseudonym, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_inviteVersion, 0);
  objc_storeStrong((id *)&self->_clientDictionary, 0);
  objc_storeStrong((id *)&self->_declineReason, 0);
  objc_storeStrong((id *)&self->_selfTicket, 0);
  objc_storeStrong((id *)&self->_peerBlob, 0);
  objc_storeStrong((id *)&self->_peerNatIP, 0);
  objc_storeStrong((id *)&self->_peerNatType, 0);
  objc_storeStrong((id *)&self->_peerPushToken, 0);
  objc_storeStrong((id *)&self->_selfNatType, 0);

  objc_storeStrong((id *)&self->_sessionToken, 0);
}

@end