@interface CSDMessagingConversationActivity
+ (CSDMessagingConversationActivity)activityWithCSDConversationActivity:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5;
+ (CSDMessagingConversationActivity)activityWithCSDConversationActivity:(id)a3 handle:(id)a4;
- (BOOL)hasActivityContext;
- (BOOL)hasActivityIdentifier;
- (BOOL)hasActivityMetadata;
- (BOOL)hasApplicationContext;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasFallbackApplicationName;
- (BOOL)hasFromHandle;
- (BOOL)hasIdentifierUUIDString;
- (BOOL)hasIsSystemActivity;
- (BOOL)hasMetadata;
- (BOOL)hasOriginatorHandle;
- (BOOL)hasTimestampAsTimeIntervalSinceReferenceDate;
- (BOOL)hasUpdatedDateEpochTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemActivity;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationActivityContext)activityContext;
- (CSDMessagingConversationActivityMetadata)activityMetadata;
- (CSDMessagingHandle)fromHandle;
- (CSDMessagingHandle)originatorHandle;
- (NSData)applicationContext;
- (NSData)metadata;
- (NSString)activityIdentifier;
- (NSString)bundleIdentifier;
- (NSString)fallbackApplicationName;
- (NSString)identifierUUIDString;
- (TUConversationActivity)tuConversationActivity;
- (double)timestampAsTimeIntervalSinceReferenceDate;
- (double)updatedDateEpochTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)mappedLifetimePolicy:(int64_t)a3;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityContext:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setActivityMetadata:(id)a3;
- (void)setApplicationContext:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFallbackApplicationName:(id)a3;
- (void)setFromHandle:(id)a3;
- (void)setHasIsSystemActivity:(BOOL)a3;
- (void)setHasTimestampAsTimeIntervalSinceReferenceDate:(BOOL)a3;
- (void)setHasUpdatedDateEpochTime:(BOOL)a3;
- (void)setIdentifierUUIDString:(id)a3;
- (void)setIsSystemActivity:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setOriginatorHandle:(id)a3;
- (void)setTimestampAsTimeIntervalSinceReferenceDate:(double)a3;
- (void)setUpdatedDateEpochTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivity

+ (CSDMessagingConversationActivity)activityWithCSDConversationActivity:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(CSDMessagingConversationActivity);
  v10 = [v7 UUID];
  v11 = [v10 UUIDString];
  [(CSDMessagingConversationActivity *)v9 setIdentifierUUIDString:v11];

  v12 = [v7 applicationContext];
  [(CSDMessagingConversationActivity *)v9 setApplicationContext:v12];

  v13 = [v7 bundleIdentifier];
  [(CSDMessagingConversationActivity *)v9 setBundleIdentifier:v13];

  v14 = [v7 activityIdentifier];
  [(CSDMessagingConversationActivity *)v9 setActivityIdentifier:v14];

  v15 = [v7 metadata];
  v16 = [v15 context];
  v17 = +[CSDMessagingConversationActivityContext activityContextWithTUActivityContext:v16];
  [(CSDMessagingConversationActivity *)v9 setActivityContext:v17];

  v18 = [v8 localMember];

  v19 = [v18 handle];
  v20 = +[CSDMessagingHandle handleWithTUHandle:v19];
  [(CSDMessagingConversationActivity *)v9 setOriginatorHandle:v20];

  v21 = [v7 timestamp];
  [v21 timeIntervalSince1970];
  -[CSDMessagingConversationActivity setUpdatedDateEpochTime:](v9, "setUpdatedDateEpochTime:");

  v22 = [v7 fallbackApplicationName];
  [(CSDMessagingConversationActivity *)v9 setFallbackApplicationName:v22];

  -[CSDMessagingConversationActivity setIsSystemActivity:](v9, "setIsSystemActivity:", [v7 isSystemActivity]);
  v23 = [v7 timestamp];
  [v23 timeIntervalSinceReferenceDate];
  -[CSDMessagingConversationActivity setTimestampAsTimeIntervalSinceReferenceDate:](v9, "setTimestampAsTimeIntervalSinceReferenceDate:");

  v24 = objc_alloc_init(CSDMessagingConversationActivityMetadata);
  v25 = [v7 metadata];
  v26 = [v25 title];
  [(CSDMessagingConversationActivityMetadata *)v24 setTitle:v26];

  v27 = [v7 metadata];
  v28 = [v27 subTitle];
  [(CSDMessagingConversationActivityMetadata *)v24 setSubtitle:v28];

  v29 = [v7 metadata];
  v30 = [v29 fallbackURL];
  v31 = [v30 absoluteString];
  [(CSDMessagingConversationActivityMetadata *)v24 setFallbackURL:v31];

  v32 = [v7 metadata];
  -[CSDMessagingConversationActivityMetadata setSupportsContinuationOnTV:](v24, "setSupportsContinuationOnTV:", [v32 supportsContinuationOnTV]);

  v33 = [v7 metadata];
  -[CSDMessagingConversationActivityMetadata setPreferredBroadcastingAttributes:](v24, "setPreferredBroadcastingAttributes:", [v33 preferredBroadcastingAttributes]);

  v34 = [v7 metadata];
  -[CSDMessagingConversationActivityMetadata setLifetimePolicy:](v24, "setLifetimePolicy:", [v34 lifetimePolicy]);

  v35 = objc_alloc_init(CSDMessagingConversationActivitySceneAssociationBehavior);
  v36 = [v7 metadata];
  v37 = [v36 sceneAssociationBehavior];
  v38 = [v37 targetContentIdentifier];
  [(CSDMessagingConversationActivitySceneAssociationBehavior *)v35 setTargetContentIdentifier:v38];

  v39 = [v7 metadata];
  v40 = [v39 sceneAssociationBehavior];
  -[CSDMessagingConversationActivitySceneAssociationBehavior setShouldAssociateScene:](v35, "setShouldAssociateScene:", [v40 shouldAssociateScene]);

  v41 = [v7 metadata];
  v42 = [v41 sceneAssociationBehavior];
  v43 = [v42 preferredSceneSessionRole];
  [(CSDMessagingConversationActivitySceneAssociationBehavior *)v35 setPreferredSceneSessionRole:v43];

  [(CSDMessagingConversationActivityMetadata *)v24 setSceneAssociationBehavior:v35];
  [(CSDMessagingConversationActivity *)v9 setActivityMetadata:v24];
  if (v5)
  {
    v44 = [v7 trustedFromHandle];

    if (v44)
    {
      v45 = [v7 trustedFromHandle];
      v46 = +[CSDMessagingHandle handleWithTUHandle:v45];
      [(CSDMessagingConversationActivity *)v9 setFromHandle:v46];
    }
  }

  return v9;
}

+ (CSDMessagingConversationActivity)activityWithCSDConversationActivity:(id)a3 handle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(CSDMessagingConversationActivity);
  id v8 = [v6 UUID];
  v9 = [v8 UUIDString];
  [(CSDMessagingConversationActivity *)v7 setIdentifierUUIDString:v9];

  v10 = [v6 applicationContext];
  [(CSDMessagingConversationActivity *)v7 setApplicationContext:v10];

  v11 = [v6 bundleIdentifier];
  [(CSDMessagingConversationActivity *)v7 setBundleIdentifier:v11];

  v12 = [v6 activityIdentifier];
  [(CSDMessagingConversationActivity *)v7 setActivityIdentifier:v12];

  v13 = [v6 metadata];
  v14 = [v13 context];
  v15 = +[CSDMessagingConversationActivityContext activityContextWithTUActivityContext:v14];
  [(CSDMessagingConversationActivity *)v7 setActivityContext:v15];

  v16 = +[CSDMessagingHandle handleWithTUHandle:v5];

  [(CSDMessagingConversationActivity *)v7 setOriginatorHandle:v16];
  v17 = [v6 timestamp];
  [v17 timeIntervalSince1970];
  -[CSDMessagingConversationActivity setUpdatedDateEpochTime:](v7, "setUpdatedDateEpochTime:");

  v18 = [v6 fallbackApplicationName];
  [(CSDMessagingConversationActivity *)v7 setFallbackApplicationName:v18];

  -[CSDMessagingConversationActivity setIsSystemActivity:](v7, "setIsSystemActivity:", [v6 isSystemActivity]);
  v19 = [v6 timestamp];
  [v19 timeIntervalSinceReferenceDate];
  -[CSDMessagingConversationActivity setTimestampAsTimeIntervalSinceReferenceDate:](v7, "setTimestampAsTimeIntervalSinceReferenceDate:");

  v20 = objc_alloc_init(CSDMessagingConversationActivityMetadata);
  v21 = [v6 metadata];
  v22 = [v21 title];
  [(CSDMessagingConversationActivityMetadata *)v20 setTitle:v22];

  v23 = [v6 metadata];
  v24 = [v23 subTitle];
  [(CSDMessagingConversationActivityMetadata *)v20 setSubtitle:v24];

  v25 = [v6 metadata];
  v26 = [v25 imageData];
  [(CSDMessagingConversationActivityMetadata *)v20 setImage:v26];

  v27 = [v6 metadata];
  v28 = [v27 fallbackURL];
  v29 = [v28 absoluteString];
  [(CSDMessagingConversationActivityMetadata *)v20 setFallbackURL:v29];

  v30 = [v6 metadata];
  -[CSDMessagingConversationActivityMetadata setSupportsContinuationOnTV:](v20, "setSupportsContinuationOnTV:", [v30 supportsContinuationOnTV]);

  v31 = [v6 metadata];
  -[CSDMessagingConversationActivityMetadata setPreferredBroadcastingAttributes:](v20, "setPreferredBroadcastingAttributes:", [v31 preferredBroadcastingAttributes]);

  v32 = [v6 metadata];
  -[CSDMessagingConversationActivityMetadata setLifetimePolicy:](v20, "setLifetimePolicy:", [v32 lifetimePolicy]);

  v33 = objc_alloc_init(CSDMessagingConversationActivitySceneAssociationBehavior);
  v34 = [v6 metadata];
  v35 = [v34 sceneAssociationBehavior];
  v36 = [v35 targetContentIdentifier];
  [(CSDMessagingConversationActivitySceneAssociationBehavior *)v33 setTargetContentIdentifier:v36];

  v37 = [v6 metadata];
  v38 = [v37 sceneAssociationBehavior];
  -[CSDMessagingConversationActivitySceneAssociationBehavior setShouldAssociateScene:](v33, "setShouldAssociateScene:", [v38 shouldAssociateScene]);

  v39 = [v6 metadata];
  v40 = [v39 sceneAssociationBehavior];
  v41 = [v40 preferredSceneSessionRole];
  [(CSDMessagingConversationActivitySceneAssociationBehavior *)v33 setPreferredSceneSessionRole:v41];

  [(CSDMessagingConversationActivityMetadata *)v20 setSceneAssociationBehavior:v33];
  v42 = [v6 metadata];

  -[CSDMessagingConversationActivityMetadata setSupportsActivityPreviews:](v20, "setSupportsActivityPreviews:", [v42 supportsActivityPreviews]);
  [(CSDMessagingConversationActivity *)v7 setActivityMetadata:v20];

  return v7;
}

- (TUConversationActivity)tuConversationActivity
{
  uint64_t v3 = +[TUConversationActivitySceneAssociationBehavior defaultBehavior];
  v4 = [(CSDMessagingConversationActivity *)self activityMetadata];
  unsigned int v5 = [v4 hasSceneAssociationBehavior];

  if (v5)
  {
    id v6 = objc_alloc((Class)TUConversationActivitySceneAssociationBehavior);
    v55 = [(CSDMessagingConversationActivity *)self activityMetadata];
    v53 = [v55 sceneAssociationBehavior];
    id v7 = [v53 targetContentIdentifier];
    id v8 = [(CSDMessagingConversationActivity *)self activityMetadata];
    v9 = [v8 sceneAssociationBehavior];
    id v10 = [v9 shouldAssociateScene];
    [(CSDMessagingConversationActivity *)self activityMetadata];
    v12 = v11 = (void *)v3;
    v13 = [v12 sceneAssociationBehavior];
    v14 = [v13 preferredSceneSessionRole];
    id v15 = [v6 initWithTargetContentIdentifier:v7 shouldAssociateScene:v10 preferredSceneSessionRole:v14];

    v56 = v15;
  }
  else
  {
    v56 = (void *)v3;
  }
  id v47 = objc_alloc((Class)TUConversationActivityMetadata);
  v54 = [(CSDMessagingConversationActivity *)self activityContext];
  v16 = [v54 tuConversationActivityContext];
  v52 = [(CSDMessagingConversationActivity *)self activityMetadata];
  v51 = [v52 fallbackURL];
  v46 = +[NSURL URLWithString:v51];
  v50 = [(CSDMessagingConversationActivity *)self activityMetadata];
  unsigned int v45 = [v50 supportsContinuationOnTV];
  v49 = [(CSDMessagingConversationActivity *)self activityMetadata];
  v43 = [v49 title];
  v48 = [(CSDMessagingConversationActivity *)self activityMetadata];
  v17 = [v48 subtitle];
  v44 = [(CSDMessagingConversationActivity *)self activityMetadata];
  v18 = [v44 image];
  v19 = [(CSDMessagingConversationActivity *)self activityMetadata];
  uint64_t v20 = [v19 preferredBroadcastingAttributes];
  v21 = [(CSDMessagingConversationActivity *)self activityMetadata];
  unsigned __int8 v22 = [v21 supportsActivityPreviews];
  v23 = [(CSDMessagingConversationActivity *)self activityMetadata];
  LOBYTE(v42) = v22;
  id v24 = objc_msgSend(v47, "initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:", v16, 0, v46, 0, v45, v43, v17, v18, v20, v56, v42, -[CSDMessagingConversationActivity mappedLifetimePolicy:](self, "mappedLifetimePolicy:", objc_msgSend(v23, "lifetimePolicy")));

  v25 = v24;
  id v26 = objc_alloc((Class)TUConversationActivity);
  v27 = [(CSDMessagingConversationActivity *)self bundleIdentifier];
  v28 = [(CSDMessagingConversationActivity *)self applicationContext];
  id v29 = objc_alloc((Class)NSUUID);
  v30 = [(CSDMessagingConversationActivity *)self identifierUUIDString];
  id v31 = [v29 initWithUUIDString:v30];
  v32 = [(CSDMessagingConversationActivity *)self activityIdentifier];
  v33 = [(CSDMessagingConversationActivity *)self fallbackApplicationName];
  id v34 = [v26 initWithBundleIdentifier:v27 metadata:v25 applicationContext:v28 uuid:v31 activityIdentifier:v32 fallbackApplicationName:v33];

  v35 = [(CSDMessagingConversationActivity *)self originatorHandle];
  v36 = [v35 tuHandle];
  [v34 setOriginator:v36];

  v37 = [(CSDMessagingConversationActivity *)self fromHandle];
  v38 = [v37 tuHandle];
  [v34 setTrustedFromHandle:v38];

  objc_msgSend(v34, "setSystemActivity:", -[CSDMessagingConversationActivity isSystemActivity](self, "isSystemActivity"));
  if ([(CSDMessagingConversationActivity *)self hasTimestampAsTimeIntervalSinceReferenceDate])
  {
    [(CSDMessagingConversationActivity *)self timestampAsTimeIntervalSinceReferenceDate];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    [(CSDMessagingConversationActivity *)self updatedDateEpochTime];
    +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  v39 = };
  [v34 setTimestamp:v39];

  v40 = [v34 sanitizedCopy];

  return (TUConversationActivity *)v40;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CSDMessagingConversationActivity;
  uint64_t v3 = [(CSDMessagingConversationActivity *)&v8 description];
  v4 = [(CSDMessagingConversationActivity *)self dictionaryRepresentation];
  unsigned int v5 = TULoggableStringForObject();
  id v6 = +[NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (int64_t)mappedLifetimePolicy:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 != 1 && a3 != 2)
  {
    v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      int64_t v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Couldn't convert TUConversationActivityLifetimePolicy=%ld to known value, setting to TUConversationActivityLifetimePolicyUnknown", (uint8_t *)&v6, 0xCu);
    }

    return 0;
  }
  return v3;
}

- (BOOL)hasIdentifierUUIDString
{
  return self->_identifierUUIDString != 0;
}

- (BOOL)hasApplicationContext
{
  return self->_applicationContext != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasActivityIdentifier
{
  return self->_activityIdentifier != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasActivityContext
{
  return self->_activityContext != 0;
}

- (BOOL)hasOriginatorHandle
{
  return self->_originatorHandle != 0;
}

- (void)setUpdatedDateEpochTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_updatedDateEpochTime = a3;
}

- (void)setHasUpdatedDateEpochTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpdatedDateEpochTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasFallbackApplicationName
{
  return self->_fallbackApplicationName != 0;
}

- (BOOL)hasActivityMetadata
{
  return self->_activityMetadata != 0;
}

- (void)setIsSystemActivity:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isSystemActivity = a3;
}

- (void)setHasIsSystemActivity:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsSystemActivity
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimestampAsTimeIntervalSinceReferenceDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestampAsTimeIntervalSinceReferenceDate = a3;
}

- (void)setHasTimestampAsTimeIntervalSinceReferenceDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampAsTimeIntervalSinceReferenceDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasFromHandle
{
  return self->_fromHandle != 0;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  identifierUUIDString = self->_identifierUUIDString;
  if (identifierUUIDString) {
    [v3 setObject:identifierUUIDString forKey:@"identifierUUIDString"];
  }
  applicationContext = self->_applicationContext;
  if (applicationContext) {
    [v4 setObject:applicationContext forKey:@"applicationContext"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  activityIdentifier = self->_activityIdentifier;
  if (activityIdentifier) {
    [v4 setObject:activityIdentifier forKey:@"activityIdentifier"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v4 setObject:metadata forKey:@"metadata"];
  }
  activityContext = self->_activityContext;
  if (activityContext)
  {
    v11 = [(CSDMessagingConversationActivityContext *)activityContext dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"activityContext"];
  }
  originatorHandle = self->_originatorHandle;
  if (originatorHandle)
  {
    v13 = [(CSDMessagingHandle *)originatorHandle dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"originatorHandle"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v14 = +[NSNumber numberWithDouble:self->_updatedDateEpochTime];
    [v4 setObject:v14 forKey:@"updatedDateEpochTime"];
  }
  fallbackApplicationName = self->_fallbackApplicationName;
  if (fallbackApplicationName) {
    [v4 setObject:fallbackApplicationName forKey:@"fallbackApplicationName"];
  }
  activityMetadata = self->_activityMetadata;
  if (activityMetadata)
  {
    v17 = [(CSDMessagingConversationActivityMetadata *)activityMetadata dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"activityMetadata"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v19 = +[NSNumber numberWithBool:self->_isSystemActivity];
    [v4 setObject:v19 forKey:@"isSystemActivity"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v20 = +[NSNumber numberWithDouble:self->_timestampAsTimeIntervalSinceReferenceDate];
    [v4 setObject:v20 forKey:@"timestampAsTimeIntervalSinceReferenceDate"];
  }
  fromHandle = self->_fromHandle;
  if (fromHandle)
  {
    unsigned __int8 v22 = [(CSDMessagingHandle *)fromHandle dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"fromHandle"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013C828((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifierUUIDString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_applicationContext)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_activityIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_activityContext)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_originatorHandle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_fallbackApplicationName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_activityMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_fromHandle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifierUUIDString)
  {
    objc_msgSend(v4, "setIdentifierUUIDString:");
    id v4 = v6;
  }
  if (self->_applicationContext)
  {
    objc_msgSend(v6, "setApplicationContext:");
    id v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v6, "setBundleIdentifier:");
    id v4 = v6;
  }
  if (self->_activityIdentifier)
  {
    objc_msgSend(v6, "setActivityIdentifier:");
    id v4 = v6;
  }
  if (self->_metadata)
  {
    objc_msgSend(v6, "setMetadata:");
    id v4 = v6;
  }
  if (self->_activityContext)
  {
    objc_msgSend(v6, "setActivityContext:");
    id v4 = v6;
  }
  if (self->_originatorHandle)
  {
    objc_msgSend(v6, "setOriginatorHandle:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_updatedDateEpochTime;
    *((unsigned char *)v4 + 108) |= 2u;
  }
  if (self->_fallbackApplicationName)
  {
    objc_msgSend(v6, "setFallbackApplicationName:");
    id v4 = v6;
  }
  if (self->_activityMetadata)
  {
    objc_msgSend(v6, "setActivityMetadata:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 104) = self->_isSystemActivity;
    *((unsigned char *)v4 + 108) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestampAsTimeIntervalSinceReferenceDate;
    *((unsigned char *)v4 + 108) |= 1u;
  }
  if (self->_fromHandle)
  {
    objc_msgSend(v6, "setFromHandle:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_identifierUUIDString copyWithZone:a3];
  int64_t v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = [(NSData *)self->_applicationContext copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v11 = (void *)v5[7];
  v5[7] = v10;

  id v12 = [(NSString *)self->_activityIdentifier copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(NSData *)self->_metadata copyWithZone:a3];
  id v15 = (void *)v5[11];
  v5[11] = v14;

  id v16 = [(CSDMessagingConversationActivityContext *)self->_activityContext copyWithZone:a3];
  v17 = (void *)v5[3];
  v5[3] = v16;

  id v18 = [(CSDMessagingHandle *)self->_originatorHandle copyWithZone:a3];
  v19 = (void *)v5[12];
  v5[12] = v18;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[2] = *(void *)&self->_updatedDateEpochTime;
    *((unsigned char *)v5 + 108) |= 2u;
  }
  id v20 = [(NSString *)self->_fallbackApplicationName copyWithZone:a3];
  v21 = (void *)v5[8];
  v5[8] = v20;

  id v22 = [(CSDMessagingConversationActivityMetadata *)self->_activityMetadata copyWithZone:a3];
  v23 = (void *)v5[5];
  v5[5] = v22;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v5 + 104) = self->_isSystemActivity;
    *((unsigned char *)v5 + 108) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = *(void *)&self->_timestampAsTimeIntervalSinceReferenceDate;
    *((unsigned char *)v5 + 108) |= 1u;
  }
  id v25 = [(CSDMessagingHandle *)self->_fromHandle copyWithZone:a3];
  id v26 = (void *)v5[9];
  v5[9] = v25;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  identifierUUIDString = self->_identifierUUIDString;
  if ((unint64_t)identifierUUIDString | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](identifierUUIDString, "isEqual:")) {
      goto LABEL_40;
    }
  }
  applicationContext = self->_applicationContext;
  if ((unint64_t)applicationContext | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](applicationContext, "isEqual:")) {
      goto LABEL_40;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_40;
    }
  }
  activityIdentifier = self->_activityIdentifier;
  if ((unint64_t)activityIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](activityIdentifier, "isEqual:")) {
      goto LABEL_40;
    }
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](metadata, "isEqual:")) {
      goto LABEL_40;
    }
  }
  activityContext = self->_activityContext;
  if ((unint64_t)activityContext | *((void *)v4 + 3))
  {
    if (!-[CSDMessagingConversationActivityContext isEqual:](activityContext, "isEqual:")) {
      goto LABEL_40;
    }
  }
  originatorHandle = self->_originatorHandle;
  if ((unint64_t)originatorHandle | *((void *)v4 + 12))
  {
    if (!-[CSDMessagingHandle isEqual:](originatorHandle, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_updatedDateEpochTime != *((double *)v4 + 2)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_40;
  }
  fallbackApplicationName = self->_fallbackApplicationName;
  if ((unint64_t)fallbackApplicationName | *((void *)v4 + 8)
    && !-[NSString isEqual:](fallbackApplicationName, "isEqual:"))
  {
    goto LABEL_40;
  }
  activityMetadata = self->_activityMetadata;
  if ((unint64_t)activityMetadata | *((void *)v4 + 5))
  {
    if (!-[CSDMessagingConversationActivityMetadata isEqual:](activityMetadata, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 4) != 0)
    {
      if (self->_isSystemActivity)
      {
        if (!*((unsigned char *)v4 + 104)) {
          goto LABEL_40;
        }
        goto LABEL_33;
      }
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_33;
      }
    }
LABEL_40:
    unsigned __int8 v15 = 0;
    goto LABEL_41;
  }
  if ((*((unsigned char *)v4 + 108) & 4) != 0) {
    goto LABEL_40;
  }
LABEL_33:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_timestampAsTimeIntervalSinceReferenceDate != *((double *)v4 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
    goto LABEL_40;
  }
  fromHandle = self->_fromHandle;
  if ((unint64_t)fromHandle | *((void *)v4 + 9)) {
    unsigned __int8 v15 = -[CSDMessagingHandle isEqual:](fromHandle, "isEqual:");
  }
  else {
    unsigned __int8 v15 = 1;
  }
LABEL_41:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v23 = [(NSString *)self->_identifierUUIDString hash];
  unint64_t v22 = (unint64_t)[(NSData *)self->_applicationContext hash];
  NSUInteger v21 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v3 = [(NSString *)self->_activityIdentifier hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_metadata hash];
  unint64_t v5 = [(CSDMessagingConversationActivityContext *)self->_activityContext hash];
  unint64_t v6 = [(CSDMessagingHandle *)self->_originatorHandle hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double updatedDateEpochTime = self->_updatedDateEpochTime;
    double v9 = -updatedDateEpochTime;
    if (updatedDateEpochTime >= 0.0) {
      double v9 = self->_updatedDateEpochTime;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_fallbackApplicationName hash];
  unint64_t v13 = [(CSDMessagingConversationActivityMetadata *)self->_activityMetadata hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v14 = 2654435761 * self->_isSystemActivity;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v19 = 0;
    return v22 ^ v23 ^ v21 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14 ^ v19 ^ [(CSDMessagingHandle *)self->_fromHandle hash];
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double timestampAsTimeIntervalSinceReferenceDate = self->_timestampAsTimeIntervalSinceReferenceDate;
  double v16 = -timestampAsTimeIntervalSinceReferenceDate;
  if (timestampAsTimeIntervalSinceReferenceDate >= 0.0) {
    double v16 = self->_timestampAsTimeIntervalSinceReferenceDate;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
  return v22 ^ v23 ^ v21 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14 ^ v19 ^ [(CSDMessagingHandle *)self->_fromHandle hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (*((void *)v4 + 10))
  {
    -[CSDMessagingConversationActivity setIdentifierUUIDString:](self, "setIdentifierUUIDString:");
    id v4 = v14;
  }
  if (*((void *)v4 + 6))
  {
    -[CSDMessagingConversationActivity setApplicationContext:](self, "setApplicationContext:");
    id v4 = v14;
  }
  if (*((void *)v4 + 7))
  {
    -[CSDMessagingConversationActivity setBundleIdentifier:](self, "setBundleIdentifier:");
    id v4 = v14;
  }
  if (*((void *)v4 + 4))
  {
    -[CSDMessagingConversationActivity setActivityIdentifier:](self, "setActivityIdentifier:");
    id v4 = v14;
  }
  if (*((void *)v4 + 11))
  {
    -[CSDMessagingConversationActivity setMetadata:](self, "setMetadata:");
    id v4 = v14;
  }
  activityContext = self->_activityContext;
  uint64_t v6 = *((void *)v4 + 3);
  if (activityContext)
  {
    if (!v6) {
      goto LABEL_17;
    }
    -[CSDMessagingConversationActivityContext mergeFrom:](activityContext, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_17;
    }
    -[CSDMessagingConversationActivity setActivityContext:](self, "setActivityContext:");
  }
  id v4 = v14;
LABEL_17:
  originatorHandle = self->_originatorHandle;
  uint64_t v8 = *((void *)v4 + 12);
  if (originatorHandle)
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[CSDMessagingHandle mergeFrom:](originatorHandle, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[CSDMessagingConversationActivity setOriginatorHandle:](self, "setOriginatorHandle:");
  }
  id v4 = v14;
LABEL_23:
  if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    self->_double updatedDateEpochTime = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 8))
  {
    -[CSDMessagingConversationActivity setFallbackApplicationName:](self, "setFallbackApplicationName:");
    id v4 = v14;
  }
  activityMetadata = self->_activityMetadata;
  uint64_t v10 = *((void *)v4 + 5);
  if (activityMetadata)
  {
    if (!v10) {
      goto LABEL_33;
    }
    -[CSDMessagingConversationActivityMetadata mergeFrom:](activityMetadata, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_33;
    }
    -[CSDMessagingConversationActivity setActivityMetadata:](self, "setActivityMetadata:");
  }
  id v4 = v14;
LABEL_33:
  char v11 = *((unsigned char *)v4 + 108);
  if ((v11 & 4) != 0)
  {
    self->_isSystemActivity = *((unsigned char *)v4 + 104);
    *(unsigned char *)&self->_has |= 4u;
    char v11 = *((unsigned char *)v4 + 108);
  }
  if (v11)
  {
    self->_double timestampAsTimeIntervalSinceReferenceDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  fromHandle = self->_fromHandle;
  uint64_t v13 = *((void *)v4 + 9);
  if (fromHandle)
  {
    if (!v13) {
      goto LABEL_43;
    }
    -[CSDMessagingHandle mergeFrom:](fromHandle, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_43;
    }
    -[CSDMessagingConversationActivity setFromHandle:](self, "setFromHandle:");
  }
  id v4 = v14;
LABEL_43:
}

- (NSString)identifierUUIDString
{
  return self->_identifierUUIDString;
}

- (void)setIdentifierUUIDString:(id)a3
{
}

- (NSData)applicationContext
{
  return self->_applicationContext;
}

- (void)setApplicationContext:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (CSDMessagingConversationActivityContext)activityContext
{
  return self->_activityContext;
}

- (void)setActivityContext:(id)a3
{
}

- (CSDMessagingHandle)originatorHandle
{
  return self->_originatorHandle;
}

- (void)setOriginatorHandle:(id)a3
{
}

- (double)updatedDateEpochTime
{
  return self->_updatedDateEpochTime;
}

- (NSString)fallbackApplicationName
{
  return self->_fallbackApplicationName;
}

- (void)setFallbackApplicationName:(id)a3
{
}

- (CSDMessagingConversationActivityMetadata)activityMetadata
{
  return self->_activityMetadata;
}

- (void)setActivityMetadata:(id)a3
{
}

- (BOOL)isSystemActivity
{
  return self->_isSystemActivity;
}

- (double)timestampAsTimeIntervalSinceReferenceDate
{
  return self->_timestampAsTimeIntervalSinceReferenceDate;
}

- (CSDMessagingHandle)fromHandle
{
  return self->_fromHandle;
}

- (void)setFromHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorHandle, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifierUUIDString, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_fallbackApplicationName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_activityMetadata, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);

  objc_storeStrong((id *)&self->_activityContext, 0);
}

@end