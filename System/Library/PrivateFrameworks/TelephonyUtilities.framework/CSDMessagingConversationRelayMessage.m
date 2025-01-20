@interface CSDMessagingConversationRelayMessage
+ (Class)activeParticipantsType;
+ (Class)remoteMembersType;
- (BOOL)hasAvMode;
- (BOOL)hasGroupUUIDString;
- (BOOL)hasInitiator;
- (BOOL)hasLocalMember;
- (BOOL)hasLocallyCreated;
- (BOOL)hasMessagesGroupUUIDString;
- (BOOL)hasReportData;
- (BOOL)hasState;
- (BOOL)hasType;
- (BOOL)hasUUIDString;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)locallyCreated;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationMember)localMember;
- (CSDMessagingConversationRelayMessage)initWithConversation:(id)a3;
- (CSDMessagingConversationRelayMessage)initWithRemoteMembers:(id)a3;
- (CSDMessagingConversationReport)reportData;
- (CSDMessagingHandle)initiator;
- (NSMutableArray)activeParticipants;
- (NSMutableArray)remoteMembers;
- (NSSet)tuConversationMembers;
- (NSSet)tuConversationParticipants;
- (NSString)groupUUIDString;
- (NSString)messagesGroupUUIDString;
- (NSString)uUIDString;
- (id)activeParticipantsAtIndex:(unint64_t)a3;
- (id)avModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)remoteMembersAtIndex:(unint64_t)a3;
- (id)stateAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsAvMode:(id)a3;
- (int)StringAsState:(id)a3;
- (int)StringAsType:(id)a3;
- (int)avMode;
- (int)state;
- (int)type;
- (int64_t)relayType;
- (int64_t)tuState;
- (unint64_t)activeParticipantsCount;
- (unint64_t)hash;
- (unint64_t)remoteMembersCount;
- (unint64_t)tuAVMode;
- (unsigned)version;
- (void)addActiveParticipants:(id)a3;
- (void)addRemoteMembers:(id)a3;
- (void)clearActiveParticipants;
- (void)clearRemoteMembers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveParticipants:(id)a3;
- (void)setAvMode:(int)a3;
- (void)setConversationMembers:(id)a3;
- (void)setGroupUUIDString:(id)a3;
- (void)setHasAvMode:(BOOL)a3;
- (void)setHasLocallyCreated:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setInitiator:(id)a3;
- (void)setLocalMember:(id)a3;
- (void)setLocallyCreated:(BOOL)a3;
- (void)setMessagesGroupUUIDString:(id)a3;
- (void)setRemoteMembers:(id)a3;
- (void)setReportData:(id)a3;
- (void)setState:(int)a3;
- (void)setStateforTUState:(int64_t)a3;
- (void)setType:(int)a3;
- (void)setUUIDString:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationRelayMessage

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100507250[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ConversationCreated"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ConversationChanged"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ConversationRemoved"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)state
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100507268[a3];
  }

  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ConversationStateWaiting"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ConversationStatePreparing"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ConversationStateJoining"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ConversationStateJoined"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ConversationStateLeaving"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasUUIDString
{
  return self->_uUIDString != 0;
}

- (BOOL)hasGroupUUIDString
{
  return self->_groupUUIDString != 0;
}

- (BOOL)hasMessagesGroupUUIDString
{
  return self->_messagesGroupUUIDString != 0;
}

- (void)setLocallyCreated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_locallyCreated = a3;
}

- (void)setHasLocallyCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocallyCreated
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasInitiator
{
  return self->_initiator != 0;
}

- (BOOL)hasLocalMember
{
  return self->_localMember != 0;
}

- (void)clearRemoteMembers
{
}

- (void)addRemoteMembers:(id)a3
{
  id v4 = a3;
  remoteMembers = self->_remoteMembers;
  id v8 = v4;
  if (!remoteMembers)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_remoteMembers;
    self->_remoteMembers = v6;

    id v4 = v8;
    remoteMembers = self->_remoteMembers;
  }
  [(NSMutableArray *)remoteMembers addObject:v4];
}

- (unint64_t)remoteMembersCount
{
  return (unint64_t)[(NSMutableArray *)self->_remoteMembers count];
}

- (id)remoteMembersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_remoteMembers objectAtIndex:a3];
}

+ (Class)remoteMembersType
{
  return (Class)objc_opt_class();
}

- (void)clearActiveParticipants
{
}

- (void)addActiveParticipants:(id)a3
{
  id v4 = a3;
  activeParticipants = self->_activeParticipants;
  id v8 = v4;
  if (!activeParticipants)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_activeParticipants;
    self->_activeParticipants = v6;

    id v4 = v8;
    activeParticipants = self->_activeParticipants;
  }
  [(NSMutableArray *)activeParticipants addObject:v4];
}

- (unint64_t)activeParticipantsCount
{
  return (unint64_t)[(NSMutableArray *)self->_activeParticipants count];
}

- (id)activeParticipantsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_activeParticipants objectAtIndex:a3];
}

+ (Class)activeParticipantsType
{
  return (Class)objc_opt_class();
}

- (int)avMode
{
  if (*(unsigned char *)&self->_has) {
    return self->_avMode;
  }
  else {
    return 0;
  }
}

- (void)setAvMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_avMode = a3;
}

- (void)setHasAvMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)avModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100507290[a3];
  }

  return v3;
}

- (int)StringAsAvMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Audio"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasReportData
{
  return self->_reportData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationRelayMessage;
  id v3 = [(CSDMessagingConversationRelayMessage *)&v7 description];
  int v4 = [(CSDMessagingConversationRelayMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t type = self->_type;
  if (type >= 3)
  {
    objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
  }
  else
  {
    objc_super v7 = off_100507250[type];
  }
  [v3 setObject:v7 forKey:@"type"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    uint64_t state = self->_state;
    if (state >= 5)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_state];
    }
    else
    {
      v9 = off_100507268[state];
    }
    [v3 setObject:v9 forKey:@"state"];
  }
LABEL_14:
  uUIDString = self->_uUIDString;
  if (uUIDString) {
    [v3 setObject:uUIDString forKey:@"UUIDString"];
  }
  groupUUIDString = self->_groupUUIDString;
  if (groupUUIDString) {
    [v3 setObject:groupUUIDString forKey:@"groupUUIDString"];
  }
  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if (messagesGroupUUIDString) {
    [v3 setObject:messagesGroupUUIDString forKey:@"messagesGroupUUIDString"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v13 = +[NSNumber numberWithBool:self->_locallyCreated];
    [v3 setObject:v13 forKey:@"locallyCreated"];
  }
  initiator = self->_initiator;
  if (initiator)
  {
    v15 = [(CSDMessagingHandle *)initiator dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"initiator"];
  }
  localMember = self->_localMember;
  if (localMember)
  {
    v17 = [(CSDMessagingConversationMember *)localMember dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"localMember"];
  }
  if ([(NSMutableArray *)self->_remoteMembers count])
  {
    id v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_remoteMembers, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v19 = self->_remoteMembers;
    id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v42;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v41 + 1) + 8 * i) dictionaryRepresentation];
          [v18 addObject:v24];
        }
        id v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"remoteMembers"];
  }
  if ([(NSMutableArray *)self->_activeParticipants count])
  {
    id v25 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_activeParticipants, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v26 = self->_activeParticipants;
    id v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v38;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v25 addObject:v31];
        }
        id v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKey:@"activeParticipants"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t avMode = self->_avMode;
    if (avMode >= 3)
    {
      v33 = +[NSString stringWithFormat:@"(unknown: %i)", self->_avMode];
    }
    else
    {
      v33 = off_100507290[avMode];
    }
    [v3 setObject:v33 forKey:@"avMode"];
  }
  reportData = self->_reportData;
  if (reportData)
  {
    v35 = [(CSDMessagingConversationReport *)reportData dictionaryRepresentation];
    [v3 setObject:v35 forKey:@"reportData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000DCD18((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_uUIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupUUIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_messagesGroupUUIDString) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_initiator) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_localMember) {
    PBDataWriterWriteSubmessage();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_remoteMembers;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_activeParticipants;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_reportData) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[22] = self->_version;
    *((unsigned char *)v4 + 96) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[19] = self->_type;
  *((unsigned char *)v4 + 96) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[18] = self->_state;
    *((unsigned char *)v4 + 96) |= 2u;
  }
LABEL_5:
  v15 = v4;
  if (self->_uUIDString)
  {
    objc_msgSend(v4, "setUUIDString:");
    id v4 = v15;
  }
  if (self->_groupUUIDString)
  {
    objc_msgSend(v15, "setGroupUUIDString:");
    id v4 = v15;
  }
  if (self->_messagesGroupUUIDString)
  {
    objc_msgSend(v15, "setMessagesGroupUUIDString:");
    id v4 = v15;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 92) = self->_locallyCreated;
    *((unsigned char *)v4 + 96) |= 0x10u;
  }
  if (self->_initiator) {
    objc_msgSend(v15, "setInitiator:");
  }
  if (self->_localMember) {
    objc_msgSend(v15, "setLocalMember:");
  }
  if ([(CSDMessagingConversationRelayMessage *)self remoteMembersCount])
  {
    [v15 clearRemoteMembers];
    unint64_t v6 = [(CSDMessagingConversationRelayMessage *)self remoteMembersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CSDMessagingConversationRelayMessage *)self remoteMembersAtIndex:i];
        [v15 addRemoteMembers:v9];
      }
    }
  }
  if ([(CSDMessagingConversationRelayMessage *)self activeParticipantsCount])
  {
    [v15 clearActiveParticipants];
    unint64_t v10 = [(CSDMessagingConversationRelayMessage *)self activeParticipantsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        v13 = [(CSDMessagingConversationRelayMessage *)self activeParticipantsAtIndex:j];
        [v15 addActiveParticipants:v13];
      }
    }
  }
  uint64_t v14 = v15;
  if (*(unsigned char *)&self->_has)
  {
    v15[4] = self->_avMode;
    *((unsigned char *)v15 + 96) |= 1u;
  }
  if (self->_reportData)
  {
    objc_msgSend(v15, "setReportData:");
    uint64_t v14 = v15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[22] = self->_version;
    *((unsigned char *)v5 + 96) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[19] = self->_type;
  *((unsigned char *)v5 + 96) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5[18] = self->_state;
    *((unsigned char *)v5 + 96) |= 2u;
  }
LABEL_5:
  id v8 = [(NSString *)self->_uUIDString copyWithZone:a3];
  uint64_t v9 = (void *)v6[10];
  v6[10] = v8;

  id v10 = [(NSString *)self->_groupUUIDString copyWithZone:a3];
  unint64_t v11 = (void *)v6[3];
  v6[3] = v10;

  id v12 = [(NSString *)self->_messagesGroupUUIDString copyWithZone:a3];
  v13 = (void *)v6[6];
  v6[6] = v12;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v6 + 92) = self->_locallyCreated;
    *((unsigned char *)v6 + 96) |= 0x10u;
  }
  id v14 = [(CSDMessagingHandle *)self->_initiator copyWithZone:a3];
  v15 = (void *)v6[4];
  v6[4] = v14;

  id v16 = [(CSDMessagingConversationMember *)self->_localMember copyWithZone:a3];
  long long v17 = (void *)v6[5];
  v6[5] = v16;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v18 = self->_remoteMembers;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v37 + 1) + 8 * i) copyWithZone:a3];
        [v6 addRemoteMembers:v23];
      }
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v20);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v24 = self->_activeParticipants;
  id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v26; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v33);
        [v6 addActiveParticipants:v29];
      }
      id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v26);
  }

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 4) = self->_avMode;
    *((unsigned char *)v6 + 96) |= 1u;
  }
  id v30 = -[CSDMessagingConversationReport copyWithZone:](self->_reportData, "copyWithZone:", a3, (void)v33);
  v31 = (void *)v6[8];
  v6[8] = v30;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 8) == 0 || self->_version != *((_DWORD *)v4 + 22)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_type != *((_DWORD *)v4 + 19)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_state != *((_DWORD *)v4 + 18)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_46;
  }
  uUIDString = self->_uUIDString;
  if ((unint64_t)uUIDString | *((void *)v4 + 10)
    && !-[NSString isEqual:](uUIDString, "isEqual:"))
  {
    goto LABEL_46;
  }
  groupUUIDString = self->_groupUUIDString;
  if ((unint64_t)groupUUIDString | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](groupUUIDString, "isEqual:")) {
      goto LABEL_46;
    }
  }
  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if ((unint64_t)messagesGroupUUIDString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](messagesGroupUUIDString, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 0x10) != 0)
    {
      if (self->_locallyCreated)
      {
        if (!*((unsigned char *)v4 + 92)) {
          goto LABEL_46;
        }
        goto LABEL_31;
      }
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_31;
      }
    }
LABEL_46:
    unsigned __int8 v13 = 0;
    goto LABEL_47;
  }
  if ((*((unsigned char *)v4 + 96) & 0x10) != 0) {
    goto LABEL_46;
  }
LABEL_31:
  initiator = self->_initiator;
  if ((unint64_t)initiator | *((void *)v4 + 4) && !-[CSDMessagingHandle isEqual:](initiator, "isEqual:")) {
    goto LABEL_46;
  }
  localMember = self->_localMember;
  if ((unint64_t)localMember | *((void *)v4 + 5))
  {
    if (!-[CSDMessagingConversationMember isEqual:](localMember, "isEqual:")) {
      goto LABEL_46;
    }
  }
  remoteMembers = self->_remoteMembers;
  if ((unint64_t)remoteMembers | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](remoteMembers, "isEqual:")) {
      goto LABEL_46;
    }
  }
  activeParticipants = self->_activeParticipants;
  if ((unint64_t)activeParticipants | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](activeParticipants, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_avMode != *((_DWORD *)v4 + 4)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_46;
  }
  reportData = self->_reportData;
  if ((unint64_t)reportData | *((void *)v4 + 8)) {
    unsigned __int8 v13 = -[CSDMessagingConversationReport isEqual:](reportData, "isEqual:");
  }
  else {
    unsigned __int8 v13 = 1;
  }
LABEL_47:

  return v13;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v15 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v14 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v13 = 2654435761 * self->_state;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v13 = 0;
LABEL_8:
  NSUInteger v3 = [(NSString *)self->_uUIDString hash];
  NSUInteger v4 = [(NSString *)self->_groupUUIDString hash];
  NSUInteger v5 = [(NSString *)self->_messagesGroupUUIDString hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v6 = 2654435761 * self->_locallyCreated;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(CSDMessagingHandle *)self->_initiator hash];
  unint64_t v8 = [(CSDMessagingConversationMember *)self->_localMember hash];
  unint64_t v9 = (unint64_t)[(NSMutableArray *)self->_remoteMembers hash];
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_activeParticipants hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_avMode;
  }
  else {
    uint64_t v11 = 0;
  }
  return v14 ^ v15 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(CSDMessagingConversationReport *)self->_reportData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 96);
  if ((v6 & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 22);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 96);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t type = *((_DWORD *)v4 + 19);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
LABEL_4:
    self->_uint64_t state = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((void *)v4 + 10)) {
    -[CSDMessagingConversationRelayMessage setUUIDString:](self, "setUUIDString:");
  }
  if (*((void *)v5 + 3)) {
    -[CSDMessagingConversationRelayMessage setGroupUUIDString:](self, "setGroupUUIDString:");
  }
  if (*((void *)v5 + 6)) {
    -[CSDMessagingConversationRelayMessage setMessagesGroupUUIDString:](self, "setMessagesGroupUUIDString:");
  }
  if ((*((unsigned char *)v5 + 96) & 0x10) != 0)
  {
    self->_locallyCreated = *((unsigned char *)v5 + 92);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  initiator = self->_initiator;
  uint64_t v8 = *((void *)v5 + 4);
  if (initiator)
  {
    if (v8) {
      -[CSDMessagingHandle mergeFrom:](initiator, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CSDMessagingConversationRelayMessage setInitiator:](self, "setInitiator:");
  }
  localMember = self->_localMember;
  uint64_t v10 = *((void *)v5 + 5);
  if (localMember)
  {
    if (v10) {
      -[CSDMessagingConversationMember mergeFrom:](localMember, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[CSDMessagingConversationRelayMessage setLocalMember:](self, "setLocalMember:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = *((id *)v5 + 7);
  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        [(CSDMessagingConversationRelayMessage *)self addRemoteMembers:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      id v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v13);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = *((id *)v5 + 1);
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        -[CSDMessagingConversationRelayMessage addActiveParticipants:](self, "addActiveParticipants:", *(void *)(*((void *)&v23 + 1) + 8 * (void)j), (void)v23);
      }
      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  if (*((unsigned char *)v5 + 96))
  {
    self->_uint64_t avMode = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  reportData = self->_reportData;
  uint64_t v22 = *((void *)v5 + 8);
  if (reportData)
  {
    if (v22) {
      -[CSDMessagingConversationReport mergeFrom:](reportData, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[CSDMessagingConversationRelayMessage setReportData:](self, "setReportData:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)uUIDString
{
  return self->_uUIDString;
}

- (void)setUUIDString:(id)a3
{
}

- (NSString)groupUUIDString
{
  return self->_groupUUIDString;
}

- (void)setGroupUUIDString:(id)a3
{
}

- (NSString)messagesGroupUUIDString
{
  return self->_messagesGroupUUIDString;
}

- (void)setMessagesGroupUUIDString:(id)a3
{
}

- (BOOL)locallyCreated
{
  return self->_locallyCreated;
}

- (CSDMessagingHandle)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (CSDMessagingConversationMember)localMember
{
  return self->_localMember;
}

- (void)setLocalMember:(id)a3
{
}

- (NSMutableArray)remoteMembers
{
  return self->_remoteMembers;
}

- (void)setRemoteMembers:(id)a3
{
}

- (NSMutableArray)activeParticipants
{
  return self->_activeParticipants;
}

- (void)setActiveParticipants:(id)a3
{
}

- (CSDMessagingConversationReport)reportData
{
  return self->_reportData;
}

- (void)setReportData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uUIDString, 0);
  objc_storeStrong((id *)&self->_reportData, 0);
  objc_storeStrong((id *)&self->_remoteMembers, 0);
  objc_storeStrong((id *)&self->_messagesGroupUUIDString, 0);
  objc_storeStrong((id *)&self->_localMember, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_groupUUIDString, 0);

  objc_storeStrong((id *)&self->_activeParticipants, 0);
}

- (CSDMessagingConversationRelayMessage)initWithConversation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 remoteMembers];
  char v6 = [(CSDMessagingConversationRelayMessage *)self initWithRemoteMembers:v5];

  -[CSDMessagingConversationRelayMessage setState:](v6, "setState:", [v4 state]);
  unint64_t v7 = [v4 UUID];
  uint64_t v8 = [v7 UUIDString];
  [(CSDMessagingConversationRelayMessage *)v6 setUUIDString:v8];

  unint64_t v9 = [v4 groupUUID];
  uint64_t v10 = [v9 UUIDString];
  [(CSDMessagingConversationRelayMessage *)v6 setGroupUUIDString:v10];

  id v11 = [v4 messagesGroupUUID];
  id v12 = [v11 UUIDString];
  [(CSDMessagingConversationRelayMessage *)v6 setMessagesGroupUUIDString:v12];

  -[CSDMessagingConversationRelayMessage setLocallyCreated:](v6, "setLocallyCreated:", [v4 isLocallyCreated]);
  id v13 = [v4 initiator];
  uint64_t v14 = +[CSDMessagingHandle handleWithTUHandle:v13];
  [(CSDMessagingConversationRelayMessage *)v6 setInitiator:v14];

  uint64_t v15 = [CSDMessagingConversationReport alloc];
  id v16 = [v4 report];
  id v17 = [(CSDMessagingConversationReport *)v15 initWithTUConversationReport:v16];
  [(CSDMessagingConversationRelayMessage *)v6 setReportData:v17];

  id v18 = [v4 localMember];
  uint64_t v19 = +[CSDMessagingConversationMember memberWithTUConversationMember:v18];
  [(CSDMessagingConversationRelayMessage *)v6 setLocalMember:v19];

  id v20 = objc_alloc_init((Class)NSMutableArray);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v21 = [v4 remoteMembers];
  id v22 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v40;
    do
    {
      long long v25 = 0;
      do
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = +[CSDMessagingConversationMember memberWithTUConversationMember:*(void *)(*((void *)&v39 + 1) + 8 * (void)v25)];
        [v20 addObject:v26];

        long long v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v23);
  }

  [(CSDMessagingConversationRelayMessage *)v6 setRemoteMembers:v20];
  id v27 = objc_alloc_init((Class)NSMutableArray);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v28 = objc_msgSend(v4, "activeRemoteParticipants", 0);
  id v29 = [v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = +[CSDMessagingConversationParticipant participantWithTUConversationParticipant:*(void *)(*((void *)&v35 + 1) + 8 * (void)v32)];
        [v27 addObject:v33];

        v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      id v30 = [v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v30);
  }

  [(CSDMessagingConversationRelayMessage *)v6 setActiveParticipants:v27];
  -[CSDMessagingConversationRelayMessage setAvMode:](v6, "setAvMode:", [v4 avMode]);

  return v6;
}

- (CSDMessagingConversationRelayMessage)initWithRemoteMembers:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSDMessagingConversationRelayMessage;
  id v5 = [(CSDMessagingConversationRelayMessage *)&v8 init];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    [(CSDMessagingConversationRelayMessage *)v5 setRemoteMembers:v6];

    [(CSDMessagingConversationRelayMessage *)v5 setConversationMembers:v4];
  }

  return v5;
}

- (NSSet)tuConversationMembers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CSDMessagingConversationRelayMessage *)self remoteMembers];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) tuConversationMember];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = +[NSSet setWithArray:v3];

  return (NSSet *)v10;
}

- (NSSet)tuConversationParticipants
{
  id v3 = +[NSMutableSet set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(CSDMessagingConversationRelayMessage *)self activeParticipants];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) csdConversationParticipant];
        uint64_t v10 = [v9 tuConversationParticipant];

        [v3 addObject:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = [v3 copy];

  return (NSSet *)v11;
}

- (void)setConversationMembers:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDMessagingConversationRelayMessage *)self remoteMembers];

  if (v5)
  {
    id v6 = [(CSDMessagingConversationRelayMessage *)self remoteMembers];
    [v6 removeAllObjects];
  }
  else
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    [(CSDMessagingConversationRelayMessage *)self setRemoteMembers:v6];
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
        long long v13 = [(CSDMessagingConversationRelayMessage *)self remoteMembers];
        long long v14 = +[CSDMessagingConversationMember memberWithTUConversationMember:v12];
        [v13 addObject:v14];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)setStateforTUState:(int64_t)a3
{
  [(CSDMessagingConversationRelayMessage *)self setState:1];
}

- (int64_t)tuState
{
  uint64_t v2 = [(CSDMessagingConversationRelayMessage *)self state] - 1;
  if (v2 < 4) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)tuAVMode
{
  unsigned int v2 = [(CSDMessagingConversationRelayMessage *)self avMode];
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (int64_t)relayType
{
  unsigned int v2 = [(CSDMessagingConversationRelayMessage *)self type];
  if (v2 == 1) {
    return 2;
  }
  else {
    return v2 == 2;
  }
}

@end