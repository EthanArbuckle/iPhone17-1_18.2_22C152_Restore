@interface CSDMessagingConversationActivitySession
+ (CSDMessagingConversationActivitySession)activitySessionWithCSDConversationActivitySession:(id)a3 fromConversation:(id)a4;
+ (CSDMessagingConversationActivitySession)activitySessionWithCSDConversationActivitySession:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5;
+ (CSDMessagingConversationActivitySession)activitySessionWithTUConversationActivitySession:(id)a3 fromConversation:(id)a4;
+ (CSDMessagingConversationActivitySession)activitySessionWithTUConversationActivitySession:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5;
- (BOOL)hasActivity;
- (BOOL)hasCreationDateEpochTime;
- (BOOL)hasIdentifierUUIDString;
- (BOOL)hasLocallyPersistedMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationActivity)activity;
- (CSDMessagingConversationActivitySessionLocallyPersistedMetadata)locallyPersistedMetadata;
- (NSString)identifierUUIDString;
- (TUConversationActivitySession)tuConversationActivitySession;
- (double)creationDateEpochTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createActivitySessionOnConversation:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivity:(id)a3;
- (void)setCreationDateEpochTime:(double)a3;
- (void)setHasCreationDateEpochTime:(BOOL)a3;
- (void)setIdentifierUUIDString:(id)a3;
- (void)setLocallyPersistedMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivitySession

- (BOOL)hasIdentifierUUIDString
{
  return self->_identifierUUIDString != 0;
}

- (BOOL)hasActivity
{
  return self->_activity != 0;
}

- (void)setCreationDateEpochTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationDateEpochTime = a3;
}

- (void)setHasCreationDateEpochTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDateEpochTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLocallyPersistedMetadata
{
  return self->_locallyPersistedMetadata != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationActivitySession;
  v3 = [(CSDMessagingConversationActivitySession *)&v7 description];
  v4 = [(CSDMessagingConversationActivitySession *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  identifierUUIDString = self->_identifierUUIDString;
  if (identifierUUIDString) {
    [v3 setObject:identifierUUIDString forKey:@"identifierUUIDString"];
  }
  activity = self->_activity;
  if (activity)
  {
    objc_super v7 = [(CSDMessagingConversationActivity *)activity dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"activity"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = +[NSNumber numberWithDouble:self->_creationDateEpochTime];
    [v4 setObject:v8 forKey:@"creationDateEpochTime"];
  }
  locallyPersistedMetadata = self->_locallyPersistedMetadata;
  if (locallyPersistedMetadata)
  {
    v10 = [(CSDMessagingConversationActivitySessionLocallyPersistedMetadata *)locallyPersistedMetadata dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"locallyPersistedMetadata"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D204C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifierUUIDString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_activity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_locallyPersistedMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifierUUIDString)
  {
    objc_msgSend(v4, "setIdentifierUUIDString:");
    id v4 = v5;
  }
  if (self->_activity)
  {
    objc_msgSend(v5, "setActivity:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_creationDateEpochTime;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_locallyPersistedMetadata)
  {
    objc_msgSend(v5, "setLocallyPersistedMetadata:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_identifierUUIDString copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(CSDMessagingConversationActivity *)self->_activity copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_creationDateEpochTime;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v10 = [(CSDMessagingConversationActivitySessionLocallyPersistedMetadata *)self->_locallyPersistedMetadata copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  identifierUUIDString = self->_identifierUUIDString;
  if ((unint64_t)identifierUUIDString | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifierUUIDString, "isEqual:")) {
      goto LABEL_13;
    }
  }
  activity = self->_activity;
  if ((unint64_t)activity | *((void *)v4 + 2))
  {
    if (!-[CSDMessagingConversationActivity isEqual:](activity, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_creationDateEpochTime != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }
  locallyPersistedMetadata = self->_locallyPersistedMetadata;
  if ((unint64_t)locallyPersistedMetadata | *((void *)v4 + 4)) {
    unsigned __int8 v8 = -[CSDMessagingConversationActivitySessionLocallyPersistedMetadata isEqual:](locallyPersistedMetadata, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifierUUIDString hash];
  unint64_t v4 = [(CSDMessagingConversationActivity *)self->_activity hash];
  if (*(unsigned char *)&self->_has)
  {
    double creationDateEpochTime = self->_creationDateEpochTime;
    double v7 = -creationDateEpochTime;
    if (creationDateEpochTime >= 0.0) {
      double v7 = self->_creationDateEpochTime;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(CSDMessagingConversationActivitySessionLocallyPersistedMetadata *)self->_locallyPersistedMetadata hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  double v9 = v4;
  if (*((void *)v4 + 3))
  {
    -[CSDMessagingConversationActivitySession setIdentifierUUIDString:](self, "setIdentifierUUIDString:");
    unint64_t v4 = v9;
  }
  activity = self->_activity;
  uint64_t v6 = *((void *)v4 + 2);
  if (activity)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[CSDMessagingConversationActivity mergeFrom:](activity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[CSDMessagingConversationActivitySession setActivity:](self, "setActivity:");
  }
  unint64_t v4 = v9;
LABEL_9:
  if ((_BYTE)v4[5])
  {
    self->_double creationDateEpochTime = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  locallyPersistedMetadata = self->_locallyPersistedMetadata;
  uint64_t v8 = *((void *)v4 + 4);
  if (locallyPersistedMetadata)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[CSDMessagingConversationActivitySessionLocallyPersistedMetadata mergeFrom:](locallyPersistedMetadata, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[CSDMessagingConversationActivitySession setLocallyPersistedMetadata:](self, "setLocallyPersistedMetadata:");
  }
  unint64_t v4 = v9;
LABEL_17:
}

- (NSString)identifierUUIDString
{
  return self->_identifierUUIDString;
}

- (void)setIdentifierUUIDString:(id)a3
{
}

- (CSDMessagingConversationActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (double)creationDateEpochTime
{
  return self->_creationDateEpochTime;
}

- (CSDMessagingConversationActivitySessionLocallyPersistedMetadata)locallyPersistedMetadata
{
  return self->_locallyPersistedMetadata;
}

- (void)setLocallyPersistedMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locallyPersistedMetadata, 0);
  objc_storeStrong((id *)&self->_identifierUUIDString, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

+ (CSDMessagingConversationActivitySession)activitySessionWithTUConversationActivitySession:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5
    || ([v7 activity],
        double v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 isPlaceholderActivity],
        v9,
        (v10 & 1) == 0))
  {
    v11 = +[CSDMessagingConversationActivitySession activitySessionWithTUConversationActivitySession:v7 fromConversation:v8];
  }
  else
  {
    v11 = 0;
  }

  return (CSDMessagingConversationActivitySession *)v11;
}

+ (CSDMessagingConversationActivitySession)activitySessionWithTUConversationActivitySession:(id)a3 fromConversation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(CSDMessagingConversationActivitySession);
  id v8 = [v6 UUID];
  double v9 = [v8 UUIDString];
  [(CSDMessagingConversationActivitySession *)v7 setIdentifierUUIDString:v9];

  unsigned __int8 v10 = [v6 activity];
  v11 = +[CSDMessagingConversationActivity activityWithCSDConversationActivity:v10 fromConversation:v5 forStorage:0];

  [(CSDMessagingConversationActivitySession *)v7 setActivity:v11];
  v12 = [v6 timestamp];

  [v12 timeIntervalSince1970];
  -[CSDMessagingConversationActivitySession setCreationDateEpochTime:](v7, "setCreationDateEpochTime:");

  return v7;
}

- (TUConversationActivitySession)tuConversationActivitySession
{
  id v3 = objc_alloc((Class)NSUUID);
  unint64_t v4 = [(CSDMessagingConversationActivitySession *)self identifierUUIDString];
  id v5 = [v3 initWithUUIDString:v4];

  id v6 = [(CSDMessagingConversationActivitySession *)self activity];
  id v7 = [v6 tuConversationActivity];

  id v8 = [(CSDMessagingConversationActivitySession *)self locallyPersistedMetadata];
  id v9 = [v8 locallyInitiated];

  id v10 = objc_alloc((Class)TUConversationActivitySession);
  [(CSDMessagingConversationActivitySession *)self creationDateEpochTime];
  v11 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  id v12 = [v10 initWithActivity:v7 uuid:v5 locallyInitiated:v9 timestamp:v11 isFirstJoin:1];

  return (TUConversationActivitySession *)v12;
}

+ (CSDMessagingConversationActivitySession)activitySessionWithCSDConversationActivitySession:(id)a3 fromConversation:(id)a4 forStorage:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(CSDMessagingConversationActivitySession);
  id v10 = [v7 identifier];
  v11 = [v10 UUIDString];
  [(CSDMessagingConversationActivitySession *)v9 setIdentifierUUIDString:v11];

  id v12 = [v7 tuConversationActivitySession];
  v13 = [v12 activity];
  v14 = +[CSDMessagingConversationActivity activityWithCSDConversationActivity:v13 fromConversation:v8 forStorage:v5];

  [(CSDMessagingConversationActivitySession *)v9 setActivity:v14];
  v15 = [v7 tuConversationActivitySession];
  v16 = [v15 timestamp];
  [v16 timeIntervalSince1970];
  -[CSDMessagingConversationActivitySession setCreationDateEpochTime:](v9, "setCreationDateEpochTime:");

  if (v5)
  {
    v17 = objc_alloc_init(CSDMessagingConversationActivitySessionLocallyPersistedMetadata);
    [(CSDMessagingConversationActivitySession *)v9 setLocallyPersistedMetadata:v17];

    v18 = [v7 tuConversationActivitySession];
    id v19 = [v18 isLocallyInitiated];
    v20 = [(CSDMessagingConversationActivitySession *)v9 locallyPersistedMetadata];
    [v20 setLocallyInitiated:v19];
  }

  return v9;
}

+ (CSDMessagingConversationActivitySession)activitySessionWithCSDConversationActivitySession:(id)a3 fromConversation:(id)a4
{
  id v5 = a4;
  id v6 = [a3 tuConversationActivitySession];
  id v7 = +[CSDMessagingConversationActivitySession activitySessionWithTUConversationActivitySession:v6 fromConversation:v5];

  return (CSDMessagingConversationActivitySession *)v7;
}

- (id)createActivitySessionOnConversation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSUUID);
  id v6 = [(CSDMessagingConversationActivitySession *)self identifierUUIDString];
  id v7 = [v5 initWithUUIDString:v6];

  id v8 = [(CSDMessagingConversationActivitySession *)self activity];
  id v9 = [v8 tuConversationActivity];

  id v10 = [v9 metadata];
  if ([v10 supportsContinuationOnTV])
  {

LABEL_7:
    id v15 = objc_alloc((Class)TUConversationActivitySession);
    [(CSDMessagingConversationActivitySession *)self creationDateEpochTime];
    v16 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
    id v17 = [v15 initWithActivity:v9 uuid:v7 locallyInitiated:0 timestamp:v16 isFirstJoin:1];

    v14 = [v4 createActivitySession:v17];

    goto LABEL_8;
  }
  v11 = [v4 localMember];
  unsigned int v12 = [v11 isLightweightMember];

  if (!v12) {
    goto LABEL_7;
  }
  v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not allowing creation since activitySession doesn't support aTV handoff. session: %@", (uint8_t *)&v19, 0xCu);
  }

  v14 = 0;
LABEL_8:

  return v14;
}

@end