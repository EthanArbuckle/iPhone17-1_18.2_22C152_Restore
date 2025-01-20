@interface CSDMessagingConversationLink
+ (Class)invitedHandlesType;
+ (id)linkWithTUConversationLink:(id)a3 includeGroupUUID:(BOOL)a4;
- (BOOL)hasCreationDateEpochTime;
- (BOOL)hasGeneratorDescriptor;
- (BOOL)hasGroupUUIDString;
- (BOOL)hasIsActivated;
- (BOOL)hasLinkLifetimeScope;
- (BOOL)hasLinkName;
- (BOOL)hasOriginatorHandle;
- (BOOL)hasPrivateKey;
- (BOOL)hasPseudonym;
- (BOOL)hasPseudonymExpirationDateEpochTime;
- (BOOL)hasPublicKey;
- (BOOL)isActivated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationLinkGeneratorDescriptor)generatorDescriptor;
- (CSDMessagingHandle)originatorHandle;
- (NSData)privateKey;
- (NSData)publicKey;
- (NSMutableArray)invitedHandles;
- (NSString)groupUUIDString;
- (NSString)linkName;
- (NSString)pseudonym;
- (NSUUID)groupUUID;
- (TUConversationLink)tuConversationLink;
- (TUConversationLinkDescriptor)tuConversationLinkDescriptor;
- (TUHandle)originatorTUHandle;
- (double)creationDateEpochTime;
- (double)pseudonymExpirationDateEpochTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)invitedHandlesAtIndex:(unint64_t)a3;
- (id)linkLifetimeScopeAsString:(int)a3;
- (int)StringAsLinkLifetimeScope:(id)a3;
- (int)linkLifetimeScope;
- (unint64_t)hash;
- (unint64_t)invitedHandlesCount;
- (void)addInvitedHandles:(id)a3;
- (void)clearInvitedHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreationDateEpochTime:(double)a3;
- (void)setGeneratorDescriptor:(id)a3;
- (void)setGroupUUIDString:(id)a3;
- (void)setHasCreationDateEpochTime:(BOOL)a3;
- (void)setHasIsActivated:(BOOL)a3;
- (void)setHasLinkLifetimeScope:(BOOL)a3;
- (void)setHasPseudonymExpirationDateEpochTime:(BOOL)a3;
- (void)setInvitedHandles:(id)a3;
- (void)setIsActivated:(BOOL)a3;
- (void)setLinkLifetimeScope:(int)a3;
- (void)setLinkName:(id)a3;
- (void)setOriginatorHandle:(id)a3;
- (void)setPrivateKey:(id)a3;
- (void)setPseudonym:(id)a3;
- (void)setPseudonymExpirationDateEpochTime:(double)a3;
- (void)setPublicKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationLink

- (TUConversationLink)tuConversationLink
{
  if ([(CSDMessagingConversationLink *)self hasCreationDateEpochTime])
  {
    [(CSDMessagingConversationLink *)self creationDateEpochTime];
    v3 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    v3 = 0;
  }
  if ([(CSDMessagingConversationLink *)self hasPseudonymExpirationDateEpochTime])
  {
    [(CSDMessagingConversationLink *)self pseudonymExpirationDateEpochTime];
    v4 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    v4 = 0;
  }
  v5 = +[NSMutableSet set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v6 = [(CSDMessagingConversationLink *)self invitedHandles];
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v21 + 1) + 8 * i) tuHandle];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  id v12 = objc_alloc((Class)TUConversationLink);
  v13 = [(CSDMessagingConversationLink *)self pseudonym];
  v14 = [(CSDMessagingConversationLink *)self publicKey];
  v15 = [(CSDMessagingConversationLink *)self groupUUID];
  v16 = [(CSDMessagingConversationLink *)self originatorTUHandle];
  v17 = [(CSDMessagingConversationLink *)self linkName];
  LOBYTE(v20) = 0;
  id v18 = objc_msgSend(v12, "initWithPseudonym:publicKey:groupUUID:originatorHandle:creationDate:deletionDate:expirationDate:invitedMemberHandles:locallyCreated:linkName:linkLifetimeScope:deleteReason:", v13, v14, v15, v16, v3, 0, v4, v5, v20, v17, -[CSDMessagingConversationLink linkLifetimeScope](self, "linkLifetimeScope"), 0);

  return (TUConversationLink *)v18;
}

- (TUConversationLinkDescriptor)tuConversationLinkDescriptor
{
  if (![(CSDMessagingConversationLink *)self hasGeneratorDescriptor]) {
    goto LABEL_9;
  }
  v3 = [(CSDMessagingConversationLink *)self generatorDescriptor];
  if (([v3 hasGeneratorID] & 1) == 0) {
    goto LABEL_8;
  }
  v4 = [(CSDMessagingConversationLink *)self generatorDescriptor];
  if (([v4 hasGeneratorVersion] & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  v5 = [(CSDMessagingConversationLink *)self originatorTUHandle];

  if (!v5)
  {
LABEL_9:
    id v19 = 0;
    goto LABEL_10;
  }
  id v6 = objc_alloc((Class)TUConversationLinkOriginator);
  id v7 = [(CSDMessagingConversationLink *)self generatorDescriptor];
  id v8 = [v7 generatorID];
  uint64_t v9 = [(CSDMessagingConversationLink *)self generatorDescriptor];
  uint64_t v10 = [v9 generatorVersion];
  v11 = [(CSDMessagingConversationLink *)self originatorTUHandle];
  id v12 = [v6 initWithIdentifier:v8 revision:v10 handle:v11];

  id v13 = objc_alloc((Class)TUMutableConversationLinkDescriptor);
  v14 = [(CSDMessagingConversationLink *)self groupUUID];
  v15 = [(CSDMessagingConversationLink *)self pseudonym];
  v16 = [(CSDMessagingConversationLink *)self publicKey];
  id v17 = [v13 initWithGroupUUID:v14 originator:v12 pseudonym:v15 publicKey:v16];

  if ([(CSDMessagingConversationLink *)self hasIsActivated]) {
    BOOL v18 = [(CSDMessagingConversationLink *)self isActivated];
  }
  else {
    BOOL v18 = 1;
  }
  [v17 setActivated:v18];
  objc_msgSend(v17, "setLinkLifetimeScope:", -[CSDMessagingConversationLink linkLifetimeScope](self, "linkLifetimeScope"));
  if ([(CSDMessagingConversationLink *)self hasCreationDateEpochTime])
  {
    [(CSDMessagingConversationLink *)self creationDateEpochTime];
    long long v21 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
    [v17 setCreationDate:v21];
  }
  if ([(CSDMessagingConversationLink *)self hasPseudonymExpirationDateEpochTime])
  {
    [(CSDMessagingConversationLink *)self pseudonymExpirationDateEpochTime];
    long long v22 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
    [v17 setExpirationDate:v22];
  }
  long long v23 = +[NSMutableSet set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v24 = [(CSDMessagingConversationLink *)self invitedHandles];
  id v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [*(id *)(*((void *)&v32 + 1) + 8 * i) tuHandle];
        [v23 addObject:v29];
      }
      id v26 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v26);
  }

  [v17 setInvitedHandles:v23];
  if ([(CSDMessagingConversationLink *)self hasPrivateKey])
  {
    v30 = [(CSDMessagingConversationLink *)self privateKey];
    [v17 setPrivateKey:v30];
  }
  if ([(CSDMessagingConversationLink *)self hasLinkName])
  {
    v31 = [(CSDMessagingConversationLink *)self linkName];
    [v17 setName:v31];
  }
  id v19 = [v17 copy];

LABEL_10:

  return (TUConversationLinkDescriptor *)v19;
}

- (NSUUID)groupUUID
{
  if ([(CSDMessagingConversationLink *)self hasGroupUUIDString])
  {
    id v3 = objc_alloc((Class)NSUUID);
    v4 = [(CSDMessagingConversationLink *)self groupUUIDString];
    id v5 = [v3 initWithUUIDString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSUUID *)v5;
}

- (TUHandle)originatorTUHandle
{
  if ([(CSDMessagingConversationLink *)self hasOriginatorHandle])
  {
    id v3 = [(CSDMessagingConversationLink *)self originatorHandle];
    v4 = [v3 tuHandle];
  }
  else
  {
    v4 = 0;
  }

  return (TUHandle *)v4;
}

+ (id)linkWithTUConversationLink:(id)a3 includeGroupUUID:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init(CSDMessagingConversationLink);
  id v7 = [v5 pseudonym];
  [(CSDMessagingConversationLink *)v6 setPseudonym:v7];

  id v8 = [v5 publicKey];
  [(CSDMessagingConversationLink *)v6 setPublicKey:v8];

  uint64_t v9 = [v5 linkName];
  [(CSDMessagingConversationLink *)v6 setLinkName:v9];

  -[CSDMessagingConversationLink setLinkLifetimeScope:](v6, "setLinkLifetimeScope:", [v5 linkLifetimeScope]);
  if (v4)
  {
    uint64_t v10 = [v5 groupUUID];

    if (v10)
    {
      v11 = [v5 groupUUID];
      id v12 = [v11 UUIDString];
      [(CSDMessagingConversationLink *)v6 setGroupUUIDString:v12];

      id v13 = [v5 originatorHandle];
      v14 = +[CSDMessagingHandle handleWithTUHandle:v13];
      [(CSDMessagingConversationLink *)v6 setOriginatorHandle:v14];

      v15 = [v5 invitedMemberHandles];
      v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v17 = objc_msgSend(v5, "invitedMemberHandles", 0);
      id v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v22 = +[CSDMessagingHandle handleWithTUHandle:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            [v16 addObject:v22];
          }
          id v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v19);
      }

      [(CSDMessagingConversationLink *)v6 setInvitedHandles:v16];
    }
  }

  return v6;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CSDMessagingConversationLink;
  id v3 = [(CSDMessagingConversationLink *)&v8 description];
  BOOL v4 = [(CSDMessagingConversationLink *)self dictionaryRepresentation];
  id v5 = TULoggableStringForObject();
  id v6 = +[NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (BOOL)hasPseudonym
{
  return self->_pseudonym != 0;
}

- (BOOL)hasPublicKey
{
  return self->_publicKey != 0;
}

- (BOOL)hasPrivateKey
{
  return self->_privateKey != 0;
}

- (void)clearInvitedHandles
{
}

- (void)addInvitedHandles:(id)a3
{
  id v4 = a3;
  invitedHandles = self->_invitedHandles;
  id v8 = v4;
  if (!invitedHandles)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_invitedHandles;
    self->_invitedHandles = v6;

    id v4 = v8;
    invitedHandles = self->_invitedHandles;
  }
  [(NSMutableArray *)invitedHandles addObject:v4];
}

- (unint64_t)invitedHandlesCount
{
  return (unint64_t)[(NSMutableArray *)self->_invitedHandles count];
}

- (id)invitedHandlesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_invitedHandles objectAtIndex:a3];
}

+ (Class)invitedHandlesType
{
  return (Class)objc_opt_class();
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

- (BOOL)hasGroupUUIDString
{
  return self->_groupUUIDString != 0;
}

- (BOOL)hasOriginatorHandle
{
  return self->_originatorHandle != 0;
}

- (void)setPseudonymExpirationDateEpochTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_pseudonymExpirationDateEpochTime = a3;
}

- (void)setHasPseudonymExpirationDateEpochTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPseudonymExpirationDateEpochTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsActivated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isActivated = a3;
}

- (void)setHasIsActivated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsActivated
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasGeneratorDescriptor
{
  return self->_generatorDescriptor != 0;
}

- (BOOL)hasLinkName
{
  return self->_linkName != 0;
}

- (int)linkLifetimeScope
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_linkLifetimeScope;
  }
  else {
    return 0;
  }
}

- (void)setLinkLifetimeScope:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_linkLifetimeScope = a3;
}

- (void)setHasLinkLifetimeScope:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLinkLifetimeScope
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)linkLifetimeScopeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"CallDuration";
    }
    else
    {
      id v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    id v4 = @"Indefinite";
  }
  return v4;
}

- (int)StringAsLinkLifetimeScope:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Indefinite"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"CallDuration"];
  }

  return v4;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  pseudonym = self->_pseudonym;
  if (pseudonym) {
    [v3 setObject:pseudonym forKey:@"pseudonym"];
  }
  publicKey = self->_publicKey;
  if (publicKey) {
    [v4 setObject:publicKey forKey:@"publicKey"];
  }
  privateKey = self->_privateKey;
  if (privateKey) {
    [v4 setObject:privateKey forKey:@"privateKey"];
  }
  if ([(NSMutableArray *)self->_invitedHandles count])
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_invitedHandles, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v9 = self->_invitedHandles;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"invitedHandles"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v15 = +[NSNumber numberWithDouble:self->_creationDateEpochTime];
    [v4 setObject:v15 forKey:@"creationDateEpochTime"];
  }
  groupUUIDString = self->_groupUUIDString;
  if (groupUUIDString) {
    [v4 setObject:groupUUIDString forKey:@"groupUUIDString"];
  }
  originatorHandle = self->_originatorHandle;
  if (originatorHandle)
  {
    id v18 = [(CSDMessagingHandle *)originatorHandle dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"originatorHandle"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v20 = +[NSNumber numberWithDouble:self->_pseudonymExpirationDateEpochTime];
    [v4 setObject:v20 forKey:@"pseudonymExpirationDateEpochTime"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    long long v21 = +[NSNumber numberWithBool:self->_isActivated];
    [v4 setObject:v21 forKey:@"isActivated"];
  }
  generatorDescriptor = self->_generatorDescriptor;
  if (generatorDescriptor)
  {
    long long v23 = [(CSDMessagingConversationLinkGeneratorDescriptor *)generatorDescriptor dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"generatorDescriptor"];
  }
  linkName = self->_linkName;
  if (linkName) {
    [v4 setObject:linkName forKey:@"linkName"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int linkLifetimeScope = self->_linkLifetimeScope;
    if (linkLifetimeScope)
    {
      if (linkLifetimeScope == 1)
      {
        long long v26 = @"CallDuration";
      }
      else
      {
        long long v26 = +[NSString stringWithFormat:@"(unknown: %i)", self->_linkLifetimeScope];
      }
    }
    else
    {
      long long v26 = @"Indefinite";
    }
    [v4 setObject:v26 forKey:@"linkLifetimeScope"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000D6F0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_pseudonym) {
    PBDataWriterWriteStringField();
  }
  if (self->_publicKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_privateKey) {
    PBDataWriterWriteDataField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_invitedHandles;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_groupUUIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_originatorHandle) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_generatorDescriptor) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  if (self->_pseudonym) {
    objc_msgSend(v10, "setPseudonym:");
  }
  if (self->_publicKey) {
    objc_msgSend(v10, "setPublicKey:");
  }
  if (self->_privateKey) {
    objc_msgSend(v10, "setPrivateKey:");
  }
  if ([(CSDMessagingConversationLink *)self invitedHandlesCount])
  {
    [v10 clearInvitedHandles];
    unint64_t v4 = [(CSDMessagingConversationLink *)self invitedHandlesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(CSDMessagingConversationLink *)self invitedHandlesAtIndex:i];
        [v10 addInvitedHandles:v7];
      }
    }
  }
  uint64_t v8 = v10;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v10 + 1) = *(void *)&self->_creationDateEpochTime;
    *((unsigned char *)v10 + 100) |= 1u;
  }
  if (self->_groupUUIDString)
  {
    objc_msgSend(v10, "setGroupUUIDString:");
    uint64_t v8 = v10;
  }
  if (self->_originatorHandle)
  {
    objc_msgSend(v10, "setOriginatorHandle:");
    uint64_t v8 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8[2] = *(void *)&self->_pseudonymExpirationDateEpochTime;
    *((unsigned char *)v8 + 100) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((unsigned char *)v8 + 96) = self->_isActivated;
    *((unsigned char *)v8 + 100) |= 8u;
  }
  if (self->_generatorDescriptor)
  {
    objc_msgSend(v10, "setGeneratorDescriptor:");
    uint64_t v8 = v10;
  }
  if (self->_linkName)
  {
    objc_msgSend(v10, "setLinkName:");
    uint64_t v8 = v10;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v8 + 12) = self->_linkLifetimeScope;
    *((unsigned char *)v8 + 100) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_pseudonym copyWithZone:a3];
  id v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = [(NSData *)self->_publicKey copyWithZone:a3];
  uint64_t v9 = (void *)v5[11];
  v5[11] = v8;

  id v10 = [(NSData *)self->_privateKey copyWithZone:a3];
  long long v11 = (void *)v5[9];
  v5[9] = v10;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v12 = self->_invitedHandles;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (void)v28);
        [v5 addInvitedHandles:v17];
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_creationDateEpochTime;
    *((unsigned char *)v5 + 100) |= 1u;
  }
  id v18 = -[NSString copyWithZone:](self->_groupUUIDString, "copyWithZone:", a3, (void)v28);
  id v19 = (void *)v5[4];
  v5[4] = v18;

  id v20 = [(CSDMessagingHandle *)self->_originatorHandle copyWithZone:a3];
  long long v21 = (void *)v5[8];
  v5[8] = v20;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(void *)&self->_pseudonymExpirationDateEpochTime;
    *((unsigned char *)v5 + 100) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((unsigned char *)v5 + 96) = self->_isActivated;
    *((unsigned char *)v5 + 100) |= 8u;
  }
  id v23 = [(CSDMessagingConversationLinkGeneratorDescriptor *)self->_generatorDescriptor copyWithZone:a3];
  long long v24 = (void *)v5[3];
  v5[3] = v23;

  id v25 = [(NSString *)self->_linkName copyWithZone:a3];
  long long v26 = (void *)v5[7];
  v5[7] = v25;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 12) = self->_linkLifetimeScope;
    *((unsigned char *)v5 + 100) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  pseudonym = self->_pseudonym;
  if ((unint64_t)pseudonym | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](pseudonym, "isEqual:")) {
      goto LABEL_40;
    }
  }
  publicKey = self->_publicKey;
  if ((unint64_t)publicKey | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](publicKey, "isEqual:")) {
      goto LABEL_40;
    }
  }
  privateKey = self->_privateKey;
  if ((unint64_t)privateKey | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](privateKey, "isEqual:")) {
      goto LABEL_40;
    }
  }
  invitedHandles = self->_invitedHandles;
  if ((unint64_t)invitedHandles | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](invitedHandles, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_creationDateEpochTime != *((double *)v4 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
    goto LABEL_40;
  }
  groupUUIDString = self->_groupUUIDString;
  if ((unint64_t)groupUUIDString | *((void *)v4 + 4)
    && !-[NSString isEqual:](groupUUIDString, "isEqual:"))
  {
    goto LABEL_40;
  }
  originatorHandle = self->_originatorHandle;
  if ((unint64_t)originatorHandle | *((void *)v4 + 8))
  {
    if (!-[CSDMessagingHandle isEqual:](originatorHandle, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 2) == 0 || self->_pseudonymExpirationDateEpochTime != *((double *)v4 + 2)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 8) != 0)
    {
      if (self->_isActivated)
      {
        if (!*((unsigned char *)v4 + 96)) {
          goto LABEL_40;
        }
        goto LABEL_32;
      }
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_32;
      }
    }
LABEL_40:
    BOOL v13 = 0;
    goto LABEL_41;
  }
  if ((*((unsigned char *)v4 + 100) & 8) != 0) {
    goto LABEL_40;
  }
LABEL_32:
  generatorDescriptor = self->_generatorDescriptor;
  if ((unint64_t)generatorDescriptor | *((void *)v4 + 3)
    && !-[CSDMessagingConversationLinkGeneratorDescriptor isEqual:](generatorDescriptor, "isEqual:"))
  {
    goto LABEL_40;
  }
  linkName = self->_linkName;
  if ((unint64_t)linkName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](linkName, "isEqual:")) {
      goto LABEL_40;
    }
  }
  BOOL v13 = (*((unsigned char *)v4 + 100) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 4) == 0 || self->_linkLifetimeScope != *((_DWORD *)v4 + 12)) {
      goto LABEL_40;
    }
    BOOL v13 = 1;
  }
LABEL_41:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v24 = [(NSString *)self->_pseudonym hash];
  unint64_t v23 = (unint64_t)[(NSData *)self->_publicKey hash];
  unint64_t v22 = (unint64_t)[(NSData *)self->_privateKey hash];
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_invitedHandles hash];
  if (*(unsigned char *)&self->_has)
  {
    double creationDateEpochTime = self->_creationDateEpochTime;
    double v6 = -creationDateEpochTime;
    if (creationDateEpochTime >= 0.0) {
      double v6 = self->_creationDateEpochTime;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_groupUUIDString hash];
  unint64_t v10 = [(CSDMessagingHandle *)self->_originatorHandle hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double pseudonymExpirationDateEpochTime = self->_pseudonymExpirationDateEpochTime;
    double v14 = -pseudonymExpirationDateEpochTime;
    if (pseudonymExpirationDateEpochTime >= 0.0) {
      double v14 = self->_pseudonymExpirationDateEpochTime;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ((has & 8) != 0) {
    uint64_t v17 = 2654435761 * self->_isActivated;
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v18 = [(CSDMessagingConversationLinkGeneratorDescriptor *)self->_generatorDescriptor hash];
  NSUInteger v19 = [(NSString *)self->_linkName hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v20 = 2654435761 * self->_linkLifetimeScope;
  }
  else {
    uint64_t v20 = 0;
  }
  return v23 ^ v24 ^ v22 ^ v3 ^ v4 ^ v9 ^ v10 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[CSDMessagingConversationLink setPseudonym:](self, "setPseudonym:");
  }
  if (*((void *)v4 + 11)) {
    -[CSDMessagingConversationLink setPublicKey:](self, "setPublicKey:");
  }
  if (*((void *)v4 + 9)) {
    -[CSDMessagingConversationLink setPrivateKey:](self, "setPrivateKey:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *((id *)v4 + 5);
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CSDMessagingConversationLink addInvitedHandles:](self, "addInvitedHandles:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 100))
  {
    self->_double creationDateEpochTime = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[CSDMessagingConversationLink setGroupUUIDString:](self, "setGroupUUIDString:");
  }
  originatorHandle = self->_originatorHandle;
  uint64_t v11 = *((void *)v4 + 8);
  if (originatorHandle)
  {
    if (v11) {
      -[CSDMessagingHandle mergeFrom:](originatorHandle, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[CSDMessagingConversationLink setOriginatorHandle:](self, "setOriginatorHandle:");
  }
  char v12 = *((unsigned char *)v4 + 100);
  if ((v12 & 2) != 0)
  {
    self->_double pseudonymExpirationDateEpochTime = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v12 = *((unsigned char *)v4 + 100);
  }
  if ((v12 & 8) != 0)
  {
    self->_isActivated = *((unsigned char *)v4 + 96);
    *(unsigned char *)&self->_has |= 8u;
  }
  generatorDescriptor = self->_generatorDescriptor;
  uint64_t v14 = *((void *)v4 + 3);
  if (generatorDescriptor)
  {
    if (v14) {
      -[CSDMessagingConversationLinkGeneratorDescriptor mergeFrom:](generatorDescriptor, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[CSDMessagingConversationLink setGeneratorDescriptor:](self, "setGeneratorDescriptor:");
  }
  if (*((void *)v4 + 7)) {
    -[CSDMessagingConversationLink setLinkName:](self, "setLinkName:");
  }
  if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    self->_int linkLifetimeScope = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(id)a3
{
}

- (NSMutableArray)invitedHandles
{
  return self->_invitedHandles;
}

- (void)setInvitedHandles:(id)a3
{
}

- (double)creationDateEpochTime
{
  return self->_creationDateEpochTime;
}

- (NSString)groupUUIDString
{
  return self->_groupUUIDString;
}

- (void)setGroupUUIDString:(id)a3
{
}

- (CSDMessagingHandle)originatorHandle
{
  return self->_originatorHandle;
}

- (void)setOriginatorHandle:(id)a3
{
}

- (double)pseudonymExpirationDateEpochTime
{
  return self->_pseudonymExpirationDateEpochTime;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (CSDMessagingConversationLinkGeneratorDescriptor)generatorDescriptor
{
  return self->_generatorDescriptor;
}

- (void)setGeneratorDescriptor:(id)a3
{
}

- (NSString)linkName
{
  return self->_linkName;
}

- (void)setLinkName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_pseudonym, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_originatorHandle, 0);
  objc_storeStrong((id *)&self->_linkName, 0);
  objc_storeStrong((id *)&self->_invitedHandles, 0);
  objc_storeStrong((id *)&self->_groupUUIDString, 0);

  objc_storeStrong((id *)&self->_generatorDescriptor, 0);
}

@end