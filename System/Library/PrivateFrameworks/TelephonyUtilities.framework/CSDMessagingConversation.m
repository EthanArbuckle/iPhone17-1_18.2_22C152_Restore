@interface CSDMessagingConversation
+ (Class)activeLightweightParticipantsType;
+ (Class)activeRemoteParticipantsType;
+ (Class)activitySessionsType;
+ (Class)lightweightMembersType;
+ (Class)otherInvitedHandlesType;
+ (Class)remoteMembersType;
- (BOOL)hasAvMode;
- (BOOL)hasConversationProviderIdentifier;
- (BOOL)hasGroupUUIDString;
- (BOOL)hasHighlightIdentifier;
- (BOOL)hasInitiator;
- (BOOL)hasLink;
- (BOOL)hasLocalMember;
- (BOOL)hasLocallyCreated;
- (BOOL)hasMessagesGroupUUIDString;
- (BOOL)hasReportData;
- (BOOL)hasStagedActivitySession;
- (BOOL)hasUUIDString;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)locallyCreated;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingConversationActivitySession)stagedActivitySession;
- (CSDMessagingConversationLink)link;
- (CSDMessagingConversationMember)localMember;
- (CSDMessagingConversationReport)reportData;
- (CSDMessagingHandle)initiator;
- (NSMutableArray)activeLightweightParticipants;
- (NSMutableArray)activeRemoteParticipants;
- (NSMutableArray)activitySessions;
- (NSMutableArray)lightweightMembers;
- (NSMutableArray)otherInvitedHandles;
- (NSMutableArray)remoteMembers;
- (NSString)conversationProviderIdentifier;
- (NSString)groupUUIDString;
- (NSString)highlightIdentifier;
- (NSString)messagesGroupUUIDString;
- (NSString)uUIDString;
- (TUConversationLink)tuConversationLink;
- (id)activeLightweightParticipantsAtIndex:(unint64_t)a3;
- (id)activeRemoteParticipantsAtIndex:(unint64_t)a3;
- (id)activitySessionsAtIndex:(unint64_t)a3;
- (id)avModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lightweightMembersAtIndex:(unint64_t)a3;
- (id)otherInvitedHandlesAtIndex:(unint64_t)a3;
- (id)remoteMembersAtIndex:(unint64_t)a3;
- (int)StringAsAvMode:(id)a3;
- (int)avMode;
- (unint64_t)activeLightweightParticipantsCount;
- (unint64_t)activeRemoteParticipantsCount;
- (unint64_t)activitySessionsCount;
- (unint64_t)hash;
- (unint64_t)lightweightMembersCount;
- (unint64_t)otherInvitedHandlesCount;
- (unint64_t)remoteMembersCount;
- (unsigned)version;
- (void)addActiveLightweightParticipants:(id)a3;
- (void)addActiveRemoteParticipants:(id)a3;
- (void)addActivitySessions:(id)a3;
- (void)addLightweightMembers:(id)a3;
- (void)addOtherInvitedHandles:(id)a3;
- (void)addRemoteMembers:(id)a3;
- (void)clearActiveLightweightParticipants;
- (void)clearActiveRemoteParticipants;
- (void)clearActivitySessions;
- (void)clearLightweightMembers;
- (void)clearOtherInvitedHandles;
- (void)clearRemoteMembers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveLightweightParticipants:(id)a3;
- (void)setActiveRemoteParticipants:(id)a3;
- (void)setActivitySessions:(id)a3;
- (void)setAvMode:(int)a3;
- (void)setConversationProviderIdentifier:(id)a3;
- (void)setGroupUUIDString:(id)a3;
- (void)setHasAvMode:(BOOL)a3;
- (void)setHasLocallyCreated:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHighlightIdentifier:(id)a3;
- (void)setInitiator:(id)a3;
- (void)setLightweightMembers:(id)a3;
- (void)setLink:(id)a3;
- (void)setLocalMember:(id)a3;
- (void)setLocallyCreated:(BOOL)a3;
- (void)setMessagesGroupUUIDString:(id)a3;
- (void)setOtherInvitedHandles:(id)a3;
- (void)setRemoteMembers:(id)a3;
- (void)setReportData:(id)a3;
- (void)setStagedActivitySession:(id)a3;
- (void)setUUIDString:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversation

- (TUConversationLink)tuConversationLink
{
  if ([(CSDMessagingConversation *)self hasLink])
  {
    v3 = [(CSDMessagingConversation *)self link];
    v4 = [v3 tuConversationLink];
  }
  else
  {
    v4 = 0;
  }

  return (TUConversationLink *)v4;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
  *(unsigned char *)&self->_has |= 4u;
  self->_locallyCreated = a3;
}

- (void)setHasLocallyCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLocallyCreated
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (void)clearActiveRemoteParticipants
{
}

- (void)addActiveRemoteParticipants:(id)a3
{
  id v4 = a3;
  activeRemoteParticipants = self->_activeRemoteParticipants;
  id v8 = v4;
  if (!activeRemoteParticipants)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_activeRemoteParticipants;
    self->_activeRemoteParticipants = v6;

    id v4 = v8;
    activeRemoteParticipants = self->_activeRemoteParticipants;
  }
  [(NSMutableArray *)activeRemoteParticipants addObject:v4];
}

- (unint64_t)activeRemoteParticipantsCount
{
  return (unint64_t)[(NSMutableArray *)self->_activeRemoteParticipants count];
}

- (id)activeRemoteParticipantsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_activeRemoteParticipants objectAtIndex:a3];
}

+ (Class)activeRemoteParticipantsType
{
  return (Class)objc_opt_class();
}

- (void)clearActivitySessions
{
}

- (void)addActivitySessions:(id)a3
{
  id v4 = a3;
  activitySessions = self->_activitySessions;
  id v8 = v4;
  if (!activitySessions)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_activitySessions;
    self->_activitySessions = v6;

    id v4 = v8;
    activitySessions = self->_activitySessions;
  }
  [(NSMutableArray *)activitySessions addObject:v4];
}

- (unint64_t)activitySessionsCount
{
  return (unint64_t)[(NSMutableArray *)self->_activitySessions count];
}

- (id)activitySessionsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_activitySessions objectAtIndex:a3];
}

+ (Class)activitySessionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLink
{
  return self->_link != 0;
}

- (BOOL)hasReportData
{
  return self->_reportData != 0;
}

- (BOOL)hasConversationProviderIdentifier
{
  return self->_conversationProviderIdentifier != 0;
}

- (void)clearOtherInvitedHandles
{
}

- (void)addOtherInvitedHandles:(id)a3
{
  id v4 = a3;
  otherInvitedHandles = self->_otherInvitedHandles;
  id v8 = v4;
  if (!otherInvitedHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_otherInvitedHandles;
    self->_otherInvitedHandles = v6;

    id v4 = v8;
    otherInvitedHandles = self->_otherInvitedHandles;
  }
  [(NSMutableArray *)otherInvitedHandles addObject:v4];
}

- (unint64_t)otherInvitedHandlesCount
{
  return (unint64_t)[(NSMutableArray *)self->_otherInvitedHandles count];
}

- (id)otherInvitedHandlesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_otherInvitedHandles objectAtIndex:a3];
}

+ (Class)otherInvitedHandlesType
{
  return (Class)objc_opt_class();
}

- (void)clearLightweightMembers
{
}

- (void)addLightweightMembers:(id)a3
{
  id v4 = a3;
  lightweightMembers = self->_lightweightMembers;
  id v8 = v4;
  if (!lightweightMembers)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_lightweightMembers;
    self->_lightweightMembers = v6;

    id v4 = v8;
    lightweightMembers = self->_lightweightMembers;
  }
  [(NSMutableArray *)lightweightMembers addObject:v4];
}

- (unint64_t)lightweightMembersCount
{
  return (unint64_t)[(NSMutableArray *)self->_lightweightMembers count];
}

- (id)lightweightMembersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_lightweightMembers objectAtIndex:a3];
}

+ (Class)lightweightMembersType
{
  return (Class)objc_opt_class();
}

- (void)clearActiveLightweightParticipants
{
}

- (void)addActiveLightweightParticipants:(id)a3
{
  id v4 = a3;
  activeLightweightParticipants = self->_activeLightweightParticipants;
  id v8 = v4;
  if (!activeLightweightParticipants)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_activeLightweightParticipants;
    self->_activeLightweightParticipants = v6;

    id v4 = v8;
    activeLightweightParticipants = self->_activeLightweightParticipants;
  }
  [(NSMutableArray *)activeLightweightParticipants addObject:v4];
}

- (unint64_t)activeLightweightParticipantsCount
{
  return (unint64_t)[(NSMutableArray *)self->_activeLightweightParticipants count];
}

- (id)activeLightweightParticipantsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_activeLightweightParticipants objectAtIndex:a3];
}

+ (Class)activeLightweightParticipantsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasHighlightIdentifier
{
  return self->_highlightIdentifier != 0;
}

- (BOOL)hasStagedActivitySession
{
  return self->_stagedActivitySession != 0;
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
    char v3 = *(&off_100507618 + a3);
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversation;
  id v3 = [(CSDMessagingConversation *)&v7 description];
  int v4 = [(CSDMessagingConversation *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    id v8 = +[NSNumber numberWithBool:self->_locallyCreated];
    [v3 setObject:v8 forKey:@"locallyCreated"];
  }
  initiator = self->_initiator;
  if (initiator)
  {
    v10 = [(CSDMessagingHandle *)initiator dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"initiator"];
  }
  localMember = self->_localMember;
  if (localMember)
  {
    v12 = [(CSDMessagingConversationMember *)localMember dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"localMember"];
  }
  if ([(NSMutableArray *)self->_remoteMembers count])
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_remoteMembers, "count"));
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v14 = self->_remoteMembers;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v86 objects:v95 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v87;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v87 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v86 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v86 objects:v95 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"remoteMembers"];
  }
  if ([(NSMutableArray *)self->_activeRemoteParticipants count])
  {
    id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_activeRemoteParticipants, "count"));
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v21 = self->_activeRemoteParticipants;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v82 objects:v94 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v83;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v83 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v82 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v82 objects:v94 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"activeRemoteParticipants"];
  }
  if ([(NSMutableArray *)self->_activitySessions count])
  {
    id v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_activitySessions, "count"));
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v28 = self->_activitySessions;
    id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v78 objects:v93 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v79;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v79 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v78 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v78 objects:v93 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"activitySessions"];
  }
  link = self->_link;
  if (link)
  {
    v35 = [(CSDMessagingConversationLink *)link dictionaryRepresentation];
    [v3 setObject:v35 forKey:@"link"];
  }
  reportData = self->_reportData;
  if (reportData)
  {
    v37 = [(CSDMessagingConversationReport *)reportData dictionaryRepresentation];
    [v3 setObject:v37 forKey:@"reportData"];
  }
  conversationProviderIdentifier = self->_conversationProviderIdentifier;
  if (conversationProviderIdentifier) {
    [v3 setObject:conversationProviderIdentifier forKey:@"conversationProviderIdentifier"];
  }
  if ([(NSMutableArray *)self->_otherInvitedHandles count])
  {
    id v39 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_otherInvitedHandles, "count"));
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v40 = self->_otherInvitedHandles;
    id v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v74 objects:v92 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v75;
      do
      {
        for (m = 0; m != v42; m = (char *)m + 1)
        {
          if (*(void *)v75 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v74 + 1) + 8 * (void)m) dictionaryRepresentation];
          [v39 addObject:v45];
        }
        id v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v74 objects:v92 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKey:@"otherInvitedHandles"];
  }
  if ([(NSMutableArray *)self->_lightweightMembers count])
  {
    id v46 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_lightweightMembers, "count"));
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v47 = self->_lightweightMembers;
    id v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v70 objects:v91 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v71;
      do
      {
        for (n = 0; n != v49; n = (char *)n + 1)
        {
          if (*(void *)v71 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = [*(id *)(*((void *)&v70 + 1) + 8 * (void)n) dictionaryRepresentation];
          [v46 addObject:v52];
        }
        id v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v70 objects:v91 count:16];
      }
      while (v49);
    }

    [v3 setObject:v46 forKey:@"lightweightMembers"];
  }
  if ([(NSMutableArray *)self->_activeLightweightParticipants count])
  {
    id v53 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_activeLightweightParticipants, "count"));
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v54 = self->_activeLightweightParticipants;
    id v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v66 objects:v90 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v67;
      do
      {
        for (ii = 0; ii != v56; ii = (char *)ii + 1)
        {
          if (*(void *)v67 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = [*(id *)(*((void *)&v66 + 1) + 8 * (void)ii) dictionaryRepresentation];
          [v53 addObject:v59];
        }
        id v56 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v66 objects:v90 count:16];
      }
      while (v56);
    }

    [v3 setObject:v53 forKey:@"activeLightweightParticipants"];
  }
  highlightIdentifier = self->_highlightIdentifier;
  if (highlightIdentifier) {
    [v3 setObject:highlightIdentifier forKey:@"highlightIdentifier"];
  }
  stagedActivitySession = self->_stagedActivitySession;
  if (stagedActivitySession)
  {
    v62 = [(CSDMessagingConversationActivitySession *)stagedActivitySession dictionaryRepresentation];
    [v3 setObject:v62 forKey:@"stagedActivitySession"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t avMode = self->_avMode;
    if (avMode >= 3)
    {
      v64 = +[NSString stringWithFormat:@"(unknown: %i)", self->_avMode];
    }
    else
    {
      v64 = *(&off_100507618 + avMode);
    }
    [v3 setObject:v64 forKey:@"avMode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F30E4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_uUIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupUUIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_messagesGroupUUIDString) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_initiator) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_localMember) {
    PBDataWriterWriteSubmessage();
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v5 = self->_remoteMembers;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v7);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v10 = self->_activeRemoteParticipants;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v12);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = self->_activitySessions;
  id v16 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
    }
    while (v17);
  }

  if (self->_link) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_reportData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_conversationProviderIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v20 = self->_otherInvitedHandles;
  v21 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      id v22 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
    }
    while (v22);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v25 = self->_lightweightMembers;
  v26 = (char *)[(NSMutableArray *)v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      id v29 = 0;
      do
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      id v27 = (char *)[(NSMutableArray *)v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
    }
    while (v27);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v30 = self->_activeLightweightParticipants;
  uint64_t v31 = (char *)[(NSMutableArray *)v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
  if (v31)
  {
    v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      v34 = 0;
      do
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      v32 = (char *)[(NSMutableArray *)v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
    }
    while (v32);
  }

  if (self->_highlightIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_stagedActivitySession) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[36] = self->_version;
    *((unsigned char *)v4 + 152) |= 2u;
  }
  id v30 = v4;
  if (self->_uUIDString)
  {
    objc_msgSend(v4, "setUUIDString:");
    id v4 = v30;
  }
  if (self->_groupUUIDString)
  {
    objc_msgSend(v30, "setGroupUUIDString:");
    id v4 = v30;
  }
  if (self->_messagesGroupUUIDString)
  {
    objc_msgSend(v30, "setMessagesGroupUUIDString:");
    id v4 = v30;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 148) = self->_locallyCreated;
    *((unsigned char *)v4 + 152) |= 4u;
  }
  if (self->_initiator) {
    objc_msgSend(v30, "setInitiator:");
  }
  if (self->_localMember) {
    objc_msgSend(v30, "setLocalMember:");
  }
  if ([(CSDMessagingConversation *)self remoteMembersCount])
  {
    [v30 clearRemoteMembers];
    unint64_t v5 = [(CSDMessagingConversation *)self remoteMembersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(CSDMessagingConversation *)self remoteMembersAtIndex:i];
        [v30 addRemoteMembers:v8];
      }
    }
  }
  if ([(CSDMessagingConversation *)self activeRemoteParticipantsCount])
  {
    [v30 clearActiveRemoteParticipants];
    unint64_t v9 = [(CSDMessagingConversation *)self activeRemoteParticipantsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(CSDMessagingConversation *)self activeRemoteParticipantsAtIndex:j];
        [v30 addActiveRemoteParticipants:v12];
      }
    }
  }
  if ([(CSDMessagingConversation *)self activitySessionsCount])
  {
    [v30 clearActivitySessions];
    unint64_t v13 = [(CSDMessagingConversation *)self activitySessionsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        id v16 = [(CSDMessagingConversation *)self activitySessionsAtIndex:k];
        [v30 addActivitySessions:v16];
      }
    }
  }
  if (self->_link) {
    objc_msgSend(v30, "setLink:");
  }
  if (self->_reportData) {
    objc_msgSend(v30, "setReportData:");
  }
  if (self->_conversationProviderIdentifier) {
    objc_msgSend(v30, "setConversationProviderIdentifier:");
  }
  if ([(CSDMessagingConversation *)self otherInvitedHandlesCount])
  {
    [v30 clearOtherInvitedHandles];
    unint64_t v17 = [(CSDMessagingConversation *)self otherInvitedHandlesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        id v20 = [(CSDMessagingConversation *)self otherInvitedHandlesAtIndex:m];
        [v30 addOtherInvitedHandles:v20];
      }
    }
  }
  if ([(CSDMessagingConversation *)self lightweightMembersCount])
  {
    [v30 clearLightweightMembers];
    unint64_t v21 = [(CSDMessagingConversation *)self lightweightMembersCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(CSDMessagingConversation *)self lightweightMembersAtIndex:n];
        [v30 addLightweightMembers:v24];
      }
    }
  }
  if ([(CSDMessagingConversation *)self activeLightweightParticipantsCount])
  {
    [v30 clearActiveLightweightParticipants];
    unint64_t v25 = [(CSDMessagingConversation *)self activeLightweightParticipantsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(CSDMessagingConversation *)self activeLightweightParticipantsAtIndex:ii];
        [v30 addActiveLightweightParticipants:v28];
      }
    }
  }
  if (self->_highlightIdentifier) {
    objc_msgSend(v30, "setHighlightIdentifier:");
  }
  id v29 = v30;
  if (self->_stagedActivitySession)
  {
    objc_msgSend(v30, "setStagedActivitySession:");
    id v29 = v30;
  }
  if (*(unsigned char *)&self->_has)
  {
    v29[8] = self->_avMode;
    *((unsigned char *)v29 + 152) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[36] = self->_version;
    *((unsigned char *)v5 + 152) |= 2u;
  }
  id v7 = [(NSString *)self->_uUIDString copyWithZone:a3];
  uint64_t v8 = (void *)v6[17];
  v6[17] = v7;

  id v9 = [(NSString *)self->_groupUUIDString copyWithZone:a3];
  unint64_t v10 = (void *)v6[6];
  v6[6] = v9;

  id v11 = [(NSString *)self->_messagesGroupUUIDString copyWithZone:a3];
  v12 = (void *)v6[12];
  v6[12] = v11;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v6 + 148) = self->_locallyCreated;
    *((unsigned char *)v6 + 152) |= 4u;
  }
  id v13 = [(CSDMessagingHandle *)self->_initiator copyWithZone:a3];
  unint64_t v14 = (void *)v6[8];
  v6[8] = v13;

  id v15 = [(CSDMessagingConversationMember *)self->_localMember copyWithZone:a3];
  id v16 = (void *)v6[11];
  v6[11] = v15;

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  unint64_t v17 = self->_remoteMembers;
  id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v84 objects:v93 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v85;
    do
    {
      unint64_t v21 = 0;
      do
      {
        if (*(void *)v85 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v84 + 1) + 8 * (void)v21) copyWithZone:a3];
        [v6 addRemoteMembers:v22];

        unint64_t v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v84 objects:v93 count:16];
    }
    while (v19);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v23 = self->_activeRemoteParticipants;
  id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v81;
    do
    {
      id v27 = 0;
      do
      {
        if (*(void *)v81 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = [*(id *)(*((void *)&v80 + 1) + 8 * (void)v27) copyWithZone:a3];
        [v6 addActiveRemoteParticipants:v28];

        id v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v80 objects:v92 count:16];
    }
    while (v25);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v29 = self->_activitySessions;
  id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v76 objects:v91 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v77;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v77 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = [*(id *)(*((void *)&v76 + 1) + 8 * (void)v33) copyWithZone:a3];
        [v6 addActivitySessions:v34];

        uint64_t v33 = (char *)v33 + 1;
      }
      while (v31 != v33);
      id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v76 objects:v91 count:16];
    }
    while (v31);
  }

  id v35 = [(CSDMessagingConversationLink *)self->_link copyWithZone:a3];
  long long v36 = (void *)v6[10];
  v6[10] = v35;

  id v37 = [(CSDMessagingConversationReport *)self->_reportData copyWithZone:a3];
  long long v38 = (void *)v6[15];
  v6[15] = v37;

  id v39 = [(NSString *)self->_conversationProviderIdentifier copyWithZone:a3];
  long long v40 = (void *)v6[5];
  v6[5] = v39;

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v41 = self->_otherInvitedHandles;
  id v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v72 objects:v90 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v73;
    do
    {
      long long v45 = 0;
      do
      {
        if (*(void *)v73 != v44) {
          objc_enumerationMutation(v41);
        }
        id v46 = [*(id *)(*((void *)&v72 + 1) + 8 * (void)v45) copyWithZone:a3];
        [v6 addOtherInvitedHandles:v46];

        long long v45 = (char *)v45 + 1;
      }
      while (v43 != v45);
      id v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v72 objects:v90 count:16];
    }
    while (v43);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v47 = self->_lightweightMembers;
  id v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v68 objects:v89 count:16];
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v69;
    do
    {
      long long v51 = 0;
      do
      {
        if (*(void *)v69 != v50) {
          objc_enumerationMutation(v47);
        }
        id v52 = [*(id *)(*((void *)&v68 + 1) + 8 * (void)v51) copyWithZone:a3];
        [v6 addLightweightMembers:v52];

        long long v51 = (char *)v51 + 1;
      }
      while (v49 != v51);
      id v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v68 objects:v89 count:16];
    }
    while (v49);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v53 = self->_activeLightweightParticipants;
  id v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v64 objects:v88 count:16];
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v65;
    do
    {
      long long v57 = 0;
      do
      {
        if (*(void *)v65 != v56) {
          objc_enumerationMutation(v53);
        }
        id v58 = objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * (void)v57), "copyWithZone:", a3, (void)v64);
        [v6 addActiveLightweightParticipants:v58];

        long long v57 = (char *)v57 + 1;
      }
      while (v55 != v57);
      id v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v64 objects:v88 count:16];
    }
    while (v55);
  }

  id v59 = [(NSString *)self->_highlightIdentifier copyWithZone:a3];
  v60 = (void *)v6[7];
  v6[7] = v59;

  id v61 = [(CSDMessagingConversationActivitySession *)self->_stagedActivitySession copyWithZone:a3];
  v62 = (void *)v6[16];
  v6[16] = v61;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 8) = self->_avMode;
    *((unsigned char *)v6 + 152) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 2) == 0 || self->_version != *((_DWORD *)v4 + 36)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 152) & 2) != 0)
  {
    goto LABEL_51;
  }
  uUIDString = self->_uUIDString;
  if ((unint64_t)uUIDString | *((void *)v4 + 17)
    && !-[NSString isEqual:](uUIDString, "isEqual:"))
  {
    goto LABEL_51;
  }
  groupUUIDString = self->_groupUUIDString;
  if ((unint64_t)groupUUIDString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](groupUUIDString, "isEqual:")) {
      goto LABEL_51;
    }
  }
  messagesGroupUUIDString = self->_messagesGroupUUIDString;
  if ((unint64_t)messagesGroupUUIDString | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](messagesGroupUUIDString, "isEqual:")) {
      goto LABEL_51;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 152) & 4) != 0)
    {
      if (self->_locallyCreated)
      {
        if (!*((unsigned char *)v4 + 148)) {
          goto LABEL_51;
        }
        goto LABEL_21;
      }
      if (!*((unsigned char *)v4 + 148)) {
        goto LABEL_21;
      }
    }
LABEL_51:
    BOOL v21 = 0;
    goto LABEL_52;
  }
  if ((*((unsigned char *)v4 + 152) & 4) != 0) {
    goto LABEL_51;
  }
LABEL_21:
  initiator = self->_initiator;
  if ((unint64_t)initiator | *((void *)v4 + 8) && !-[CSDMessagingHandle isEqual:](initiator, "isEqual:")) {
    goto LABEL_51;
  }
  localMember = self->_localMember;
  if ((unint64_t)localMember | *((void *)v4 + 11))
  {
    if (!-[CSDMessagingConversationMember isEqual:](localMember, "isEqual:")) {
      goto LABEL_51;
    }
  }
  remoteMembers = self->_remoteMembers;
  if ((unint64_t)remoteMembers | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](remoteMembers, "isEqual:")) {
      goto LABEL_51;
    }
  }
  activeRemoteParticipants = self->_activeRemoteParticipants;
  if ((unint64_t)activeRemoteParticipants | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](activeRemoteParticipants, "isEqual:")) {
      goto LABEL_51;
    }
  }
  activitySessions = self->_activitySessions;
  if ((unint64_t)activitySessions | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](activitySessions, "isEqual:")) {
      goto LABEL_51;
    }
  }
  linuint64_t k = self->_link;
  if ((unint64_t)link | *((void *)v4 + 10))
  {
    if (!-[CSDMessagingConversationLink isEqual:](link, "isEqual:")) {
      goto LABEL_51;
    }
  }
  reportData = self->_reportData;
  if ((unint64_t)reportData | *((void *)v4 + 15))
  {
    if (!-[CSDMessagingConversationReport isEqual:](reportData, "isEqual:")) {
      goto LABEL_51;
    }
  }
  conversationProviderIdentifier = self->_conversationProviderIdentifier;
  if ((unint64_t)conversationProviderIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](conversationProviderIdentifier, "isEqual:")) {
      goto LABEL_51;
    }
  }
  otherInvitedHandles = self->_otherInvitedHandles;
  if ((unint64_t)otherInvitedHandles | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](otherInvitedHandles, "isEqual:")) {
      goto LABEL_51;
    }
  }
  lightweightMembers = self->_lightweightMembers;
  if ((unint64_t)lightweightMembers | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](lightweightMembers, "isEqual:")) {
      goto LABEL_51;
    }
  }
  activeLightweightParticipants = self->_activeLightweightParticipants;
  if ((unint64_t)activeLightweightParticipants | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](activeLightweightParticipants, "isEqual:")) {
      goto LABEL_51;
    }
  }
  highlightIdentifier = self->_highlightIdentifier;
  if ((unint64_t)highlightIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](highlightIdentifier, "isEqual:")) {
      goto LABEL_51;
    }
  }
  stagedActivitySessiouint64_t n = self->_stagedActivitySession;
  if ((unint64_t)stagedActivitySession | *((void *)v4 + 16))
  {
    if (!-[CSDMessagingConversationActivitySession isEqual:](stagedActivitySession, "isEqual:")) {
      goto LABEL_51;
    }
  }
  BOOL v21 = (*((unsigned char *)v4 + 152) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 152) & 1) == 0 || self->_avMode != *((_DWORD *)v4 + 8)) {
      goto LABEL_51;
    }
    BOOL v21 = 1;
  }
LABEL_52:

  return v21;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v22 = 2654435761 * self->_version;
  }
  else {
    uint64_t v22 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_uUIDString hash];
  NSUInteger v20 = [(NSString *)self->_groupUUIDString hash];
  NSUInteger v19 = [(NSString *)self->_messagesGroupUUIDString hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v18 = 2654435761 * self->_locallyCreated;
  }
  else {
    uint64_t v18 = 0;
  }
  unint64_t v17 = [(CSDMessagingHandle *)self->_initiator hash];
  unint64_t v16 = [(CSDMessagingConversationMember *)self->_localMember hash];
  unint64_t v15 = (unint64_t)[(NSMutableArray *)self->_remoteMembers hash];
  unint64_t v14 = (unint64_t)[(NSMutableArray *)self->_activeRemoteParticipants hash];
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_activitySessions hash];
  unint64_t v4 = [(CSDMessagingConversationLink *)self->_link hash];
  unint64_t v5 = [(CSDMessagingConversationReport *)self->_reportData hash];
  NSUInteger v6 = [(NSString *)self->_conversationProviderIdentifier hash];
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_otherInvitedHandles hash];
  unint64_t v8 = (unint64_t)[(NSMutableArray *)self->_lightweightMembers hash];
  unint64_t v9 = (unint64_t)[(NSMutableArray *)self->_activeLightweightParticipants hash];
  NSUInteger v10 = [(NSString *)self->_highlightIdentifier hash];
  unint64_t v11 = [(CSDMessagingConversationActivitySession *)self->_stagedActivitySession hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v12 = 2654435761 * self->_avMode;
  }
  else {
    uint64_t v12 = 0;
  }
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if ((v4[38] & 2) != 0)
  {
    self->_versiouint64_t n = v4[36];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 17)) {
    -[CSDMessagingConversation setUUIDString:](self, "setUUIDString:");
  }
  if (*((void *)v5 + 6)) {
    -[CSDMessagingConversation setGroupUUIDString:](self, "setGroupUUIDString:");
  }
  if (*((void *)v5 + 12)) {
    -[CSDMessagingConversation setMessagesGroupUUIDString:](self, "setMessagesGroupUUIDString:");
  }
  if ((*((unsigned char *)v5 + 152) & 4) != 0)
  {
    self->_locallyCreated = *((unsigned char *)v5 + 148);
    *(unsigned char *)&self->_has |= 4u;
  }
  initiator = self->_initiator;
  uint64_t v7 = *((void *)v5 + 8);
  if (initiator)
  {
    if (v7) {
      -[CSDMessagingHandle mergeFrom:](initiator, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[CSDMessagingConversation setInitiator:](self, "setInitiator:");
  }
  localMember = self->_localMember;
  uint64_t v9 = *((void *)v5 + 11);
  if (localMember)
  {
    if (v9) {
      -[CSDMessagingConversationMember mergeFrom:](localMember, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[CSDMessagingConversation setLocalMember:](self, "setLocalMember:");
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v10 = *((id *)v5 + 14);
  id v11 = [v10 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v10);
        }
        [(CSDMessagingConversation *)self addRemoteMembers:*(void *)(*((void *)&v66 + 1) + 8 * i)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v12);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v15 = *((id *)v5 + 2);
  id v16 = [v15 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v17; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v63 != v18) {
          objc_enumerationMutation(v15);
        }
        [(CSDMessagingConversation *)self addActiveRemoteParticipants:*(void *)(*((void *)&v62 + 1) + 8 * (void)j)];
      }
      id v17 = [v15 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v17);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v20 = *((id *)v5 + 3);
  id v21 = [v20 countByEnumeratingWithState:&v58 objects:v73 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v22; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v59 != v23) {
          objc_enumerationMutation(v20);
        }
        [(CSDMessagingConversation *)self addActivitySessions:*(void *)(*((void *)&v58 + 1) + 8 * (void)k)];
      }
      id v22 = [v20 countByEnumeratingWithState:&v58 objects:v73 count:16];
    }
    while (v22);
  }

  linuint64_t k = self->_link;
  uint64_t v26 = *((void *)v5 + 10);
  if (link)
  {
    if (v26) {
      -[CSDMessagingConversationLink mergeFrom:](link, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[CSDMessagingConversation setLink:](self, "setLink:");
  }
  reportData = self->_reportData;
  uint64_t v28 = *((void *)v5 + 15);
  if (reportData)
  {
    if (v28) {
      -[CSDMessagingConversationReport mergeFrom:](reportData, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[CSDMessagingConversation setReportData:](self, "setReportData:");
  }
  if (*((void *)v5 + 5)) {
    -[CSDMessagingConversation setConversationProviderIdentifier:](self, "setConversationProviderIdentifier:");
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v29 = *((id *)v5 + 13);
  id v30 = [v29 countByEnumeratingWithState:&v54 objects:v72 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v55;
    do
    {
      for (uint64_t m = 0; m != v31; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v55 != v32) {
          objc_enumerationMutation(v29);
        }
        [(CSDMessagingConversation *)self addOtherInvitedHandles:*(void *)(*((void *)&v54 + 1) + 8 * (void)m)];
      }
      id v31 = [v29 countByEnumeratingWithState:&v54 objects:v72 count:16];
    }
    while (v31);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v34 = *((id *)v5 + 9);
  id v35 = [v34 countByEnumeratingWithState:&v50 objects:v71 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v51;
    do
    {
      for (uint64_t n = 0; n != v36; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v51 != v37) {
          objc_enumerationMutation(v34);
        }
        [(CSDMessagingConversation *)self addLightweightMembers:*(void *)(*((void *)&v50 + 1) + 8 * (void)n)];
      }
      id v36 = [v34 countByEnumeratingWithState:&v50 objects:v71 count:16];
    }
    while (v36);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v39 = *((id *)v5 + 1);
  id v40 = [v39 countByEnumeratingWithState:&v46 objects:v70 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v47;
    do
    {
      for (iuint64_t i = 0; ii != v41; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v47 != v42) {
          objc_enumerationMutation(v39);
        }
        -[CSDMessagingConversation addActiveLightweightParticipants:](self, "addActiveLightweightParticipants:", *(void *)(*((void *)&v46 + 1) + 8 * (void)ii), (void)v46);
      }
      id v41 = [v39 countByEnumeratingWithState:&v46 objects:v70 count:16];
    }
    while (v41);
  }

  if (*((void *)v5 + 7)) {
    -[CSDMessagingConversation setHighlightIdentifier:](self, "setHighlightIdentifier:");
  }
  stagedActivitySessiouint64_t n = self->_stagedActivitySession;
  uint64_t v45 = *((void *)v5 + 16);
  if (stagedActivitySession)
  {
    if (v45) {
      -[CSDMessagingConversationActivitySession mergeFrom:](stagedActivitySession, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[CSDMessagingConversation setStagedActivitySession:](self, "setStagedActivitySession:");
  }
  if (*((unsigned char *)v5 + 152))
  {
    self->_uint64_t avMode = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 1u;
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

- (NSMutableArray)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
}

- (NSMutableArray)activitySessions
{
  return self->_activitySessions;
}

- (void)setActivitySessions:(id)a3
{
}

- (CSDMessagingConversationLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (CSDMessagingConversationReport)reportData
{
  return self->_reportData;
}

- (void)setReportData:(id)a3
{
}

- (NSString)conversationProviderIdentifier
{
  return self->_conversationProviderIdentifier;
}

- (void)setConversationProviderIdentifier:(id)a3
{
}

- (NSMutableArray)otherInvitedHandles
{
  return self->_otherInvitedHandles;
}

- (void)setOtherInvitedHandles:(id)a3
{
}

- (NSMutableArray)lightweightMembers
{
  return self->_lightweightMembers;
}

- (void)setLightweightMembers:(id)a3
{
}

- (NSMutableArray)activeLightweightParticipants
{
  return self->_activeLightweightParticipants;
}

- (void)setActiveLightweightParticipants:(id)a3
{
}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (void)setHighlightIdentifier:(id)a3
{
}

- (CSDMessagingConversationActivitySession)stagedActivitySession
{
  return self->_stagedActivitySession;
}

- (void)setStagedActivitySession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uUIDString, 0);
  objc_storeStrong((id *)&self->_stagedActivitySession, 0);
  objc_storeStrong((id *)&self->_reportData, 0);
  objc_storeStrong((id *)&self->_remoteMembers, 0);
  objc_storeStrong((id *)&self->_otherInvitedHandles, 0);
  objc_storeStrong((id *)&self->_messagesGroupUUIDString, 0);
  objc_storeStrong((id *)&self->_localMember, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_lightweightMembers, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_highlightIdentifier, 0);
  objc_storeStrong((id *)&self->_groupUUIDString, 0);
  objc_storeStrong((id *)&self->_conversationProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_activitySessions, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipants, 0);

  objc_storeStrong((id *)&self->_activeLightweightParticipants, 0);
}

@end