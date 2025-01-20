@interface TUConversationActivitySession
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationActivitySession:(id)a3;
- (BOOL)isFirstJoin;
- (BOOL)isLightweightPrimaryInitiated;
- (BOOL)isLocalParticipantActive;
- (BOOL)isLocallyInitiated;
- (BOOL)isPermittedToJoin;
- (BOOL)isUsingAirplay;
- (BOOL)persistentSceneIsEligibleForAutoClose;
- (NSArray)persistentSceneIdentifiers;
- (NSDate)localCreationTimestamp;
- (NSDate)permittedJoinTimestamp;
- (NSDate)timestamp;
- (NSNumber)clientAudioSessionID;
- (NSSet)activeRemoteParticipants;
- (NSString)persistentSceneIdentifier;
- (NSUUID)UUID;
- (NSXPCListenerEndpoint)endpoint;
- (TUConversationActivity)activity;
- (TUConversationActivitySession)initWithActivity:(id)a3 locallyInitiated:(BOOL)a4 timestamp:(id)a5 isFirstJoin:(BOOL)a6;
- (TUConversationActivitySession)initWithActivity:(id)a3 state:(unint64_t)a4 endpoint:(id)a5 locallyInitiated:(BOOL)a6 timestamp:(id)a7 isFirstJoin:(BOOL)a8;
- (TUConversationActivitySession)initWithActivity:(id)a3 state:(unint64_t)a4 uuid:(id)a5 endpoint:(id)a6 locallyInitiated:(BOOL)a7 timestamp:(id)a8 isFirstJoin:(BOOL)a9 activeRemoteParticipants:(id)a10 isLocalParticipantActive:(BOOL)a11 applicationState:(unint64_t)a12;
- (TUConversationActivitySession)initWithActivity:(id)a3 uuid:(id)a4 locallyInitiated:(BOOL)a5 timestamp:(id)a6 isFirstJoin:(BOOL)a7;
- (TUConversationActivitySession)initWithCoder:(id)a3;
- (TUConversationActivitySession)initWithTUConversationActivitySession:(id)a3;
- (TUHandle)terminatingHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)publicCopy;
- (unint64_t)applicationState;
- (unint64_t)distributionCount;
- (unint64_t)hash;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)launchApplicationWithForcedURL:(id)a3 completion:(id)a4;
- (void)setActivity:(id)a3;
- (void)setClientAudioSessionID:(id)a3;
- (void)setDistributionCount:(unint64_t)a3;
- (void)setEndpoint:(id)a3;
- (void)setIsLightweightPrimaryInitiated:(BOOL)a3;
- (void)setIsLocallyInitiated:(BOOL)a3;
- (void)setLocalCreationTimestamp:(id)a3;
- (void)setPermittedJoinTimestamp:(id)a3;
- (void)setPermittedToJoin:(BOOL)a3;
- (void)setPersistentSceneIdentifier:(id)a3;
- (void)setPersistentSceneIdentifiers:(id)a3;
- (void)setPersistentSceneIsEligibleForAutoClose:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setTerminatingHandle:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUsingAirplay:(BOOL)a3;
@end

@implementation TUConversationActivitySession

- (TUConversationActivitySession)initWithActivity:(id)a3 state:(unint64_t)a4 uuid:(id)a5 endpoint:(id)a6 locallyInitiated:(BOOL)a7 timestamp:(id)a8 isFirstJoin:(BOOL)a9 activeRemoteParticipants:(id)a10 isLocalParticipantActive:(BOOL)a11 applicationState:(unint64_t)a12
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v28 = a10;
  v29.receiver = self;
  v29.super_class = (Class)TUConversationActivitySession;
  v21 = [(TUConversationActivitySession *)&v29 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_UUID, a5);
    objc_storeStrong((id *)&v22->_activity, a3);
    v22->_state = a4;
    objc_storeStrong((id *)&v22->_endpoint, a6);
    v22->_isLocallyInitiated = a7;
    v22->_isLightweightPrimaryInitiated = 0;
    objc_storeStrong((id *)&v22->_timestamp, a8);
    v22->_isFirstJoin = a9;
    objc_storeStrong((id *)&v22->_activeRemoteParticipants, a10);
    v22->_localParticipantActive = a11;
    v22->_permittedToJoin = 0;
    v22->_usingAirplay = 0;
    v22->_distributionCount = 0;
    v22->_applicationState = a12;
    v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    persistentSceneIdentifiers = v22->_persistentSceneIdentifiers;
    v22->_persistentSceneIdentifiers = v23;
  }
  return v22;
}

- (TUConversationActivitySession)initWithTUConversationActivitySession:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TUConversationActivitySession;
  v5 = [(TUConversationActivitySession *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 UUID];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 activity];
    activity = v5->_activity;
    v5->_activity = (TUConversationActivity *)v8;

    v5->_state = [v4 state];
    uint64_t v10 = [v4 endpoint];
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSXPCListenerEndpoint *)v10;

    v5->_isLocallyInitiated = [v4 isLocallyInitiated];
    v5->_isLightweightPrimaryInitiated = [v4 isLightweightPrimaryInitiated];
    uint64_t v12 = [v4 timestamp];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v12;

    v5->_isFirstJoin = [v4 isFirstJoin];
    uint64_t v14 = [v4 activeRemoteParticipants];
    activeRemoteParticipants = v5->_activeRemoteParticipants;
    v5->_activeRemoteParticipants = (NSSet *)v14;

    v5->_localParticipantActive = [v4 isLocalParticipantActive];
    v5->_distributionCount = [v4 distributionCount];
    v5->_permittedToJoin = [v4 isPermittedToJoin];
    v5->_usingAirplay = [v4 isUsingAirplay];
    v5->_persistentSceneIsEligibleForAutoClose = [v4 persistentSceneIsEligibleForAutoClose];
    uint64_t v16 = [v4 persistentSceneIdentifiers];
    persistentSceneIdentifiers = v5->_persistentSceneIdentifiers;
    v5->_persistentSceneIdentifiers = (NSArray *)v16;

    v5->_applicationState = [v4 applicationState];
    uint64_t v18 = [v4 clientAudioSessionID];
    clientAudioSessionID = v5->_clientAudioSessionID;
    v5->_clientAudioSessionID = (NSNumber *)v18;

    uint64_t v20 = [v4 localCreationTimestamp];
    localCreationTimestamp = v5->_localCreationTimestamp;
    v5->_localCreationTimestamp = (NSDate *)v20;

    uint64_t v22 = [v4 permittedJoinTimestamp];
    permittedJoinTimestamp = v5->_permittedJoinTimestamp;
    v5->_permittedJoinTimestamp = (NSDate *)v22;
  }
  return v5;
}

- (TUConversationActivitySession)initWithActivity:(id)a3 state:(unint64_t)a4 endpoint:(id)a5 locallyInitiated:(BOOL)a6 timestamp:(id)a7 isFirstJoin:(BOOL)a8
{
  BOOL v9 = a6;
  uint64_t v14 = (objc_class *)MEMORY[0x1E4F29128];
  id v15 = a7;
  id v16 = a5;
  id v17 = a3;
  id v18 = objc_alloc_init(v14);
  id v19 = [MEMORY[0x1E4F1CAD0] set];
  LOBYTE(v23) = 0;
  LOBYTE(v22) = a8;
  uint64_t v20 = [(TUConversationActivitySession *)self initWithActivity:v17 state:a4 uuid:v18 endpoint:v16 locallyInitiated:v9 timestamp:v15 isFirstJoin:v22 activeRemoteParticipants:v19 isLocalParticipantActive:v23 applicationState:1];

  return v20;
}

- (TUConversationActivitySession)initWithActivity:(id)a3 uuid:(id)a4 locallyInitiated:(BOOL)a5 timestamp:(id)a6 isFirstJoin:(BOOL)a7
{
  BOOL v8 = a5;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v12 set];
  LOBYTE(v20) = 0;
  LOBYTE(v19) = a7;
  id v17 = [(TUConversationActivitySession *)self initWithActivity:v15 state:0 uuid:v14 endpoint:0 locallyInitiated:v8 timestamp:v13 isFirstJoin:v19 activeRemoteParticipants:v16 isLocalParticipantActive:v20 applicationState:1];

  return v17;
}

- (TUConversationActivitySession)initWithActivity:(id)a3 locallyInitiated:(BOOL)a4 timestamp:(id)a5 isFirstJoin:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F29128];
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc_init(v10);
  id v14 = [(TUConversationActivitySession *)self initWithActivity:v12 uuid:v13 locallyInitiated:v7 timestamp:v11 isFirstJoin:v6];

  return v14;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(TUConversationActivitySession *)self activity];
  [v3 appendFormat:@" activity=%@", v4];

  objc_msgSend(v3, "appendFormat:", @" state=%lu", -[TUConversationActivitySession state](self, "state"));
  v5 = [(TUConversationActivitySession *)self UUID];
  [v3 appendFormat:@" UUID=%@", v5];

  BOOL v6 = [(TUConversationActivitySession *)self timestamp];
  [v3 appendFormat:@" timestamp=%@", v6];

  BOOL v7 = [(TUConversationActivitySession *)self endpoint];
  [v3 appendFormat:@" endpoint=%@", v7];

  BOOL v8 = [(TUConversationActivitySession *)self clientAudioSessionID];
  [v3 appendFormat:@" audioSessionID=%@", v8];

  if ([(TUConversationActivitySession *)self isLocallyInitiated]) {
    objc_msgSend(v3, "appendFormat:", @" isLocallyInitiated=%d", -[TUConversationActivitySession isLocallyInitiated](self, "isLocallyInitiated"));
  }
  if ([(TUConversationActivitySession *)self isLightweightPrimaryInitiated]) {
    objc_msgSend(v3, "appendFormat:", @" isLightweightPrimaryInitiated=%d", -[TUConversationActivitySession isLightweightPrimaryInitiated](self, "isLightweightPrimaryInitiated"));
  }
  if ([(TUConversationActivitySession *)self isFirstJoin]) {
    objc_msgSend(v3, "appendFormat:", @" isFirstJoin=%d", -[TUConversationActivitySession isFirstJoin](self, "isFirstJoin"));
  }
  if ([(TUConversationActivitySession *)self isPermittedToJoin]) {
    objc_msgSend(v3, "appendFormat:", @" isPermittedToJoin=%d", -[TUConversationActivitySession isPermittedToJoin](self, "isPermittedToJoin"));
  }
  if ([(TUConversationActivitySession *)self isUsingAirplay]) {
    objc_msgSend(v3, "appendFormat:", @" isUsingAirplay=%d", -[TUConversationActivitySession isUsingAirplay](self, "isUsingAirplay"));
  }
  if ([(TUConversationActivitySession *)self isLocalParticipantActive]) {
    objc_msgSend(v3, "appendFormat:", @" isLocalParticipantActive=%d", -[TUConversationActivitySession isLocalParticipantActive](self, "isLocalParticipantActive"));
  }
  BOOL v9 = [(TUConversationActivitySession *)self activeRemoteParticipants];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = [(TUConversationActivitySession *)self activeRemoteParticipants];
    id v12 = [v11 allObjects];
    id v13 = [v12 componentsJoinedByString:@", "];
    [v3 appendFormat:@" activeRemoteParticipants=%@", v13];
  }
  if ([(TUConversationActivitySession *)self distributionCount]) {
    objc_msgSend(v3, "appendFormat:", @" distributionCount=%ld", -[TUConversationActivitySession distributionCount](self, "distributionCount"));
  }
  id v14 = [(TUConversationActivitySession *)self persistentSceneIdentifiers];

  if (v14)
  {
    id v15 = [(TUConversationActivitySession *)self persistentSceneIdentifiers];
    [v3 appendFormat:@" persistentSceneIdentifiers=%@", v15];
  }
  if ([(TUConversationActivitySession *)self persistentSceneIsEligibleForAutoClose])
  {
    objc_msgSend(v3, "appendFormat:", @" persistentSceneIsEligibleForAutoClose=%d", -[TUConversationActivitySession persistentSceneIsEligibleForAutoClose](self, "persistentSceneIsEligibleForAutoClose"));
  }
  objc_msgSend(v3, "appendFormat:", @" applicationState=%lu", -[TUConversationActivitySession applicationState](self, "applicationState"));
  [v3 appendString:@">"];
  id v16 = (void *)[v3 copy];

  return v16;
}

- (NSString)persistentSceneIdentifier
{
  return (NSString *)[(NSArray *)self->_persistentSceneIdentifiers lastObject];
}

- (void)setPersistentSceneIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  BOOL v6 = [v4 arrayWithObjects:&v7 count:1];

  -[TUConversationActivitySession setPersistentSceneIdentifiers:](self, "setPersistentSceneIdentifiers:", v6, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationActivitySession *)self isEqualToConversationActivitySession:v4];

  return v5;
}

- (BOOL)isEqualToConversationActivitySession:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationActivitySession *)self UUID];
  BOOL v6 = [v4 UUID];
  if ([v5 isEqual:v6])
  {
    id v7 = [(TUConversationActivitySession *)self timestamp];
    [v7 timeIntervalSince1970];
    double v9 = v8;
    uint64_t v10 = [v4 timestamp];
    [v10 timeIntervalSince1970];
    if (v9 == v11 && (unint64_t v12 = -[TUConversationActivitySession state](self, "state"), v12 == [v4 state]))
    {
      id v13 = [(TUConversationActivitySession *)self endpoint];
      id v14 = [v4 endpoint];
      if (v13 == v14
        && (int v15 = [(TUConversationActivitySession *)self isLocallyInitiated],
            v15 == [v4 isLocallyInitiated])
        && (int v16 = [(TUConversationActivitySession *)self isLightweightPrimaryInitiated],
            v16 == [v4 isLightweightPrimaryInitiated])
        && (int v17 = [(TUConversationActivitySession *)self isFirstJoin],
            v17 == [v4 isFirstJoin])
        && (int v18 = [(TUConversationActivitySession *)self isPermittedToJoin],
            v18 == [v4 isPermittedToJoin]))
      {
        v21 = [(TUConversationActivitySession *)self activeRemoteParticipants];
        uint64_t v22 = [v4 activeRemoteParticipants];
        if (TUObjectsAreEqualOrNil((unint64_t)v21, (uint64_t)v22))
        {
          v33 = v21;
          int v23 = [(TUConversationActivitySession *)self isLocalParticipantActive];
          if (v23 == [v4 isLocalParticipantActive]
            && (int v24 = -[TUConversationActivitySession persistentSceneIsEligibleForAutoClose](self, "persistentSceneIsEligibleForAutoClose"), v24 == [v4 persistentSceneIsEligibleForAutoClose]))
          {
            unint64_t v25 = [(TUConversationActivitySession *)self persistentSceneIdentifiers];
            v31 = [v4 persistentSceneIdentifiers];
            v32 = (void *)v25;
            if (TUObjectsAreEqualOrNil(v25, (uint64_t)v31)
              && (unint64_t v26 = [(TUConversationActivitySession *)self distributionCount],
                  v26 == [v4 distributionCount])
              && (int v27 = [(TUConversationActivitySession *)self isUsingAirplay],
                  v27 == [v4 isUsingAirplay])
              && (unint64_t v28 = [(TUConversationActivitySession *)self applicationState],
                  v28 == [v4 applicationState]))
            {
              objc_super v29 = [(TUConversationActivitySession *)self clientAudioSessionID];
              v30 = [v4 clientAudioSessionID];
              BOOL v19 = v29 == v30;
            }
            else
            {
              BOOL v19 = 0;
            }
            v21 = v33;
          }
          else
          {
            BOOL v19 = 0;
            v21 = v33;
          }
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  v32 = [(TUConversationActivitySession *)self UUID];
  uint64_t v3 = [v32 hash];
  id v4 = [(TUConversationActivitySession *)self activity];
  uint64_t v5 = [v4 hash] ^ v3;
  BOOL v6 = [(TUConversationActivitySession *)self timestamp];
  uint64_t v7 = [v6 hash];
  unint64_t v8 = v5 ^ v7 ^ [(TUConversationActivitySession *)self state];
  double v9 = [(TUConversationActivitySession *)self endpoint];
  uint64_t v10 = [v9 hash];
  if ([(TUConversationActivitySession *)self isLocallyInitiated]) {
    uint64_t v11 = 1231;
  }
  else {
    uint64_t v11 = 1237;
  }
  unint64_t v12 = v8 ^ v10 ^ v11;
  if ([(TUConversationActivitySession *)self isLightweightPrimaryInitiated]) {
    uint64_t v13 = 1231;
  }
  else {
    uint64_t v13 = 1237;
  }
  if ([(TUConversationActivitySession *)self isFirstJoin]) {
    uint64_t v14 = 1231;
  }
  else {
    uint64_t v14 = 1237;
  }
  uint64_t v15 = v13 ^ v14;
  if ([(TUConversationActivitySession *)self isPermittedToJoin]) {
    uint64_t v16 = 1231;
  }
  else {
    uint64_t v16 = 1237;
  }
  uint64_t v17 = v12 ^ v15 ^ v16;
  int v18 = [(TUConversationActivitySession *)self activeRemoteParticipants];
  uint64_t v19 = [v18 hash];
  if ([(TUConversationActivitySession *)self isLocalParticipantActive]) {
    uint64_t v20 = 1231;
  }
  else {
    uint64_t v20 = 1237;
  }
  uint64_t v21 = v19 ^ v20;
  if ([(TUConversationActivitySession *)self persistentSceneIsEligibleForAutoClose])
  {
    uint64_t v22 = 1231;
  }
  else
  {
    uint64_t v22 = 1237;
  }
  uint64_t v23 = v21 ^ v22;
  int v24 = [(TUConversationActivitySession *)self persistentSceneIdentifiers];
  uint64_t v25 = v17 ^ v23 ^ [v24 hash];
  unint64_t v26 = [(TUConversationActivitySession *)self distributionCount];
  if ([(TUConversationActivitySession *)self isUsingAirplay]) {
    uint64_t v27 = 1231;
  }
  else {
    uint64_t v27 = 1237;
  }
  unint64_t v28 = v26 ^ v27 ^ [(TUConversationActivitySession *)self applicationState];
  objc_super v29 = [(TUConversationActivitySession *)self clientAudioSessionID];
  unint64_t v30 = v25 ^ v28 ^ [v29 hash];

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUConversationActivitySession allocWithZone:a3];

  return [(TUConversationActivitySession *)v4 initWithTUConversationActivitySession:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[TUMutableConversationActivitySession allocWithZone:a3];

  return [(TUConversationActivitySession *)v4 initWithTUConversationActivitySession:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivitySession)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = NSStringFromSelector(sel_activity);
  v51 = [v3 decodeObjectOfClass:v4 forKey:v5];

  BOOL v6 = NSStringFromSelector(sel_state);
  uint64_t v50 = [v3 decodeIntegerForKey:v6];

  uint64_t v7 = objc_opt_class();
  unint64_t v8 = NSStringFromSelector(sel_endpoint);
  double v9 = [v3 decodeObjectOfClass:v7 forKey:v8];

  uint64_t v10 = NSStringFromSelector(sel_isLocallyInitiated);
  uint64_t v11 = [v3 decodeBoolForKey:v10];

  uint64_t v12 = objc_opt_class();
  uint64_t v13 = NSStringFromSelector(sel_UUID);
  uint64_t v14 = [v3 decodeObjectOfClass:v12 forKey:v13];

  uint64_t v15 = objc_opt_class();
  uint64_t v16 = NSStringFromSelector(sel_timestamp);
  uint64_t v17 = [v3 decodeObjectOfClass:v15 forKey:v16];

  int v18 = NSStringFromSelector(sel_isFirstJoin);
  char v19 = [v3 decodeBoolForKey:v18];

  uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  uint64_t v23 = NSStringFromSelector(sel_activeRemoteParticipants);
  int v24 = [v3 decodeObjectOfClasses:v22 forKey:v23];

  uint64_t v25 = NSStringFromSelector(sel_isLocalParticipantActive);
  LOBYTE(v23) = [v3 decodeBoolForKey:v25];

  unint64_t v26 = NSStringFromSelector(sel_applicationState);
  uint64_t v27 = [v3 decodeIntegerForKey:v26];

  LOBYTE(v49) = (_BYTE)v23;
  LOBYTE(v48) = v19;
  unint64_t v28 = (void *)v14;
  objc_super v29 = [(TUConversationActivitySession *)self initWithActivity:v51 state:v50 uuid:v14 endpoint:v9 locallyInitiated:v11 timestamp:v17 isFirstJoin:v48 activeRemoteParticipants:v24 isLocalParticipantActive:v49 applicationState:v27];
  unint64_t v30 = NSStringFromSelector(sel_distributionCount);
  -[TUConversationActivitySession setDistributionCount:](v29, "setDistributionCount:", [v3 decodeIntegerForKey:v30]);

  v31 = NSStringFromSelector(sel_isLightweightPrimaryInitiated);
  -[TUConversationActivitySession setIsLightweightPrimaryInitiated:](v29, "setIsLightweightPrimaryInitiated:", [v3 decodeBoolForKey:v31]);

  v32 = NSStringFromSelector(sel_isPermittedToJoin);
  -[TUConversationActivitySession setPermittedToJoin:](v29, "setPermittedToJoin:", [v3 decodeBoolForKey:v32]);

  v33 = NSStringFromSelector(sel_persistentSceneIsEligibleForAutoClose);
  -[TUConversationActivitySession setPersistentSceneIsEligibleForAutoClose:](v29, "setPersistentSceneIsEligibleForAutoClose:", [v3 decodeBoolForKey:v33]);

  v34 = NSStringFromSelector(sel_isUsingAirplay);
  -[TUConversationActivitySession setUsingAirplay:](v29, "setUsingAirplay:", [v3 decodeBoolForKey:v34]);

  uint64_t v35 = objc_opt_class();
  v36 = NSStringFromSelector(sel_persistentSceneIdentifiers);
  v37 = [v3 decodeArrayOfObjectsOfClass:v35 forKey:v36];
  [(TUConversationActivitySession *)v29 setPersistentSceneIdentifiers:v37];

  uint64_t v38 = objc_opt_class();
  v39 = NSStringFromSelector(sel_clientAudioSessionID);
  v40 = [v3 decodeObjectOfClass:v38 forKey:v39];
  [(TUConversationActivitySession *)v29 setClientAudioSessionID:v40];

  uint64_t v41 = objc_opt_class();
  v42 = NSStringFromSelector(sel_localCreationTimestamp);
  v43 = [v3 decodeObjectOfClass:v41 forKey:v42];
  [(TUConversationActivitySession *)v29 setLocalCreationTimestamp:v43];

  uint64_t v44 = objc_opt_class();
  v45 = NSStringFromSelector(sel_permittedJoinTimestamp);
  v46 = [v3 decodeObjectOfClass:v44 forKey:v45];

  [(TUConversationActivitySession *)v29 setPermittedJoinTimestamp:v46];
  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationActivitySession *)self UUID];
  BOOL v6 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(TUConversationActivitySession *)self timestamp];
  unint64_t v8 = NSStringFromSelector(sel_timestamp);
  [v4 encodeObject:v7 forKey:v8];

  double v9 = [(TUConversationActivitySession *)self activity];
  uint64_t v10 = NSStringFromSelector(sel_activity);
  [v4 encodeObject:v9 forKey:v10];

  unint64_t v11 = [(TUConversationActivitySession *)self state];
  uint64_t v12 = NSStringFromSelector(sel_state);
  [v4 encodeInteger:v11 forKey:v12];

  uint64_t v13 = [(TUConversationActivitySession *)self endpoint];
  uint64_t v14 = NSStringFromSelector(sel_endpoint);
  [v4 encodeObject:v13 forKey:v14];

  BOOL v15 = [(TUConversationActivitySession *)self isLocallyInitiated];
  uint64_t v16 = NSStringFromSelector(sel_isLocallyInitiated);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(TUConversationActivitySession *)self isLightweightPrimaryInitiated];
  int v18 = NSStringFromSelector(sel_isLightweightPrimaryInitiated);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(TUConversationActivitySession *)self isFirstJoin];
  uint64_t v20 = NSStringFromSelector(sel_isFirstJoin);
  [v4 encodeBool:v19 forKey:v20];

  uint64_t v21 = [(TUConversationActivitySession *)self activeRemoteParticipants];
  uint64_t v22 = NSStringFromSelector(sel_activeRemoteParticipants);
  [v4 encodeObject:v21 forKey:v22];

  BOOL v23 = [(TUConversationActivitySession *)self isLocalParticipantActive];
  int v24 = NSStringFromSelector(sel_isLocalParticipantActive);
  [v4 encodeBool:v23 forKey:v24];

  unint64_t v25 = [(TUConversationActivitySession *)self distributionCount];
  unint64_t v26 = NSStringFromSelector(sel_distributionCount);
  [v4 encodeInteger:v25 forKey:v26];

  BOOL v27 = [(TUConversationActivitySession *)self isPermittedToJoin];
  unint64_t v28 = NSStringFromSelector(sel_isPermittedToJoin);
  [v4 encodeBool:v27 forKey:v28];

  BOOL v29 = [(TUConversationActivitySession *)self persistentSceneIsEligibleForAutoClose];
  unint64_t v30 = NSStringFromSelector(sel_persistentSceneIsEligibleForAutoClose);
  [v4 encodeBool:v29 forKey:v30];

  v31 = [(TUConversationActivitySession *)self persistentSceneIdentifiers];
  v32 = NSStringFromSelector(sel_persistentSceneIdentifiers);
  [v4 encodeObject:v31 forKey:v32];

  BOOL v33 = [(TUConversationActivitySession *)self isUsingAirplay];
  v34 = NSStringFromSelector(sel_isUsingAirplay);
  [v4 encodeBool:v33 forKey:v34];

  unint64_t v35 = [(TUConversationActivitySession *)self applicationState];
  v36 = NSStringFromSelector(sel_applicationState);
  [v4 encodeInteger:v35 forKey:v36];

  v37 = [(TUConversationActivitySession *)self clientAudioSessionID];
  uint64_t v38 = NSStringFromSelector(sel_clientAudioSessionID);
  [v4 encodeObject:v37 forKey:v38];

  v39 = [(TUConversationActivitySession *)self localCreationTimestamp];
  v40 = NSStringFromSelector(sel_localCreationTimestamp);
  [v4 encodeObject:v39 forKey:v40];

  id v42 = [(TUConversationActivitySession *)self permittedJoinTimestamp];
  uint64_t v41 = NSStringFromSelector(sel_permittedJoinTimestamp);
  [v4 encodeObject:v42 forKey:v41];
}

- (void)launchApplicationWithForcedURL:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(TUConversationActivitySession *)self activity];
  double v9 = [v8 representativeBundleIdentifier];

  if (v9 && [v9 length])
  {
    uint64_t v10 = TUDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = [(TUConversationActivitySession *)self activity];
      uint64_t v12 = [v11 activityIdentifier];
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      __int16 v35 = 2112;
      v36 = self;
      __int16 v37 = 2112;
      uint64_t v38 = v12;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Manually launching Expanse app with bundleIdentifier: %@ for activity session: %@ with activity identifier: %@", buf, 0x20u);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke;
    aBlock[3] = &unk_1E58E8C28;
    id v13 = v9;
    id v31 = v13;
    id v32 = v7;
    uint64_t v14 = _Block_copy(aBlock);
    id v15 = objc_alloc_init(MEMORY[0x1E4F224A0]);
    uint64_t v16 = TUUnlockDeviceWithPromptFrontBoardOptionsDictionary(v6 != 0);
    [v15 setFrontBoardOptions:v16];

    BOOL v17 = (void *)CUTWeakLinkClass();
    int v18 = v17;
    if (v6)
    {
      BOOL v19 = [v17 defaultWorkspace];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_115;
      v28[3] = &unk_1E58E72F0;
      id v29 = v14;
      [v19 openURL:v6 configuration:v15 completionHandler:v28];

      uint64_t v20 = v29;
    }
    else
    {
      id v27 = 0;
      uint64_t v22 = (void *)[objc_alloc((Class)CUTWeakLinkClass()) initWithBundleIdentifier:v13 allowPlaceholder:0 error:&v27];
      id v23 = v27;
      uint64_t v20 = v23;
      if (!v22 || v23)
      {
        (*((void (**)(void *, void, void, id))v14 + 2))(v14, 0, 0, v23);
      }
      else
      {
        int v24 = [v18 defaultWorkspace];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_2;
        v25[3] = &unk_1E58E5CF0;
        id v26 = v14;
        [v24 openApplicationWithBundleIdentifier:v13 configuration:v15 completionHandler:v25];
      }
    }
  }
  else
  {
    uint64_t v21 = TUDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[TUConversationActivitySession launchApplicationWithForcedURL:completion:]((uint64_t)self, (uint64_t)v9, v21);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

void __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unint64_t v8 = v7;
  if ((a3 & 1) == 0)
  {
    double v9 = TUDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      id v15 = v8;
      _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Application for activity session is not installed with bundleIdentifier: %@; error: %{public}@",
        (uint8_t *)&v12,
        0x16u);
    }
    goto LABEL_8;
  }
  if (v7 || (a2 & 1) == 0)
  {
    double v9 = TUDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_cold_1(a1, (uint64_t)v8, v9);
    }
LABEL_8:
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, a2, a3);
  }
}

uint64_t __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_115(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a3 == 0, 1, a3);
}

uint64_t __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)publicCopy
{
  v2 = (void *)[(TUConversationActivitySession *)self copy];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
  id v4 = (void *)v2[8];
  v2[8] = v3;

  return v2;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (TUConversationActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (BOOL)isLocallyInitiated
{
  return self->_isLocallyInitiated;
}

- (void)setIsLocallyInitiated:(BOOL)a3
{
  self->_isLocallyInitiated = a3;
}

- (NSNumber)clientAudioSessionID
{
  return self->_clientAudioSessionID;
}

- (void)setClientAudioSessionID:(id)a3
{
}

- (BOOL)isLightweightPrimaryInitiated
{
  return self->_isLightweightPrimaryInitiated;
}

- (void)setIsLightweightPrimaryInitiated:(BOOL)a3
{
  self->_isLightweightPrimaryInitiated = a3;
}

- (BOOL)isFirstJoin
{
  return self->_isFirstJoin;
}

- (BOOL)isPermittedToJoin
{
  return self->_permittedToJoin;
}

- (void)setPermittedToJoin:(BOOL)a3
{
  self->_permittedToJoin = a3;
}

- (BOOL)isLocalParticipantActive
{
  return self->_localParticipantActive;
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (NSArray)persistentSceneIdentifiers
{
  return self->_persistentSceneIdentifiers;
}

- (void)setPersistentSceneIdentifiers:(id)a3
{
}

- (BOOL)persistentSceneIsEligibleForAutoClose
{
  return self->_persistentSceneIsEligibleForAutoClose;
}

- (void)setPersistentSceneIsEligibleForAutoClose:(BOOL)a3
{
  self->_persistentSceneIsEligibleForAutoClose = a3;
}

- (unint64_t)distributionCount
{
  return self->_distributionCount;
}

- (void)setDistributionCount:(unint64_t)a3
{
  self->_distributionCount = a3;
}

- (unint64_t)applicationState
{
  return self->_applicationState;
}

- (TUHandle)terminatingHandle
{
  return self->_terminatingHandle;
}

- (void)setTerminatingHandle:(id)a3
{
}

- (BOOL)isUsingAirplay
{
  return self->_usingAirplay;
}

- (void)setUsingAirplay:(BOOL)a3
{
  self->_usingAirplay = a3;
}

- (NSDate)localCreationTimestamp
{
  return self->_localCreationTimestamp;
}

- (void)setLocalCreationTimestamp:(id)a3
{
}

- (NSDate)permittedJoinTimestamp
{
  return self->_permittedJoinTimestamp;
}

- (void)setPermittedJoinTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permittedJoinTimestamp, 0);
  objc_storeStrong((id *)&self->_localCreationTimestamp, 0);
  objc_storeStrong((id *)&self->_terminatingHandle, 0);
  objc_storeStrong((id *)&self->_persistentSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipants, 0);
  objc_storeStrong((id *)&self->_clientAudioSessionID, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)launchApplicationWithForcedURL:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_19C496000, a2, a3, "Failed to launch activity session: %@ with bundle identifier: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __75__TUConversationActivitySession_launchApplicationWithForcedURL_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_19C496000, a2, a3, "Failed to open activity session with bundleIdentifier: %@; error: %{public}@",
    *(void *)v3,
    *(void *)&v3[8],
    *(void *)&v3[16],
    *MEMORY[0x1E4F143B8]);
}

@end