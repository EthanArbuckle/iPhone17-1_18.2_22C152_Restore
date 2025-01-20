@interface _MRPlaybackQueueProtobuf
+ (Class)contentItemType;
+ (Class)homeUserIdentifiersType;
+ (Class)participantsType;
- (BOOL)hasAuxiliaryNowPlayingInfo;
- (BOOL)hasContext;
- (BOOL)hasLocation;
- (BOOL)hasProperties;
- (BOOL)hasQueueIdentifier;
- (BOOL)hasRequestID;
- (BOOL)hasResolvedPlayerPath;
- (BOOL)hasSendingPlaybackQueueTransaction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)sendingPlaybackQueueTransaction;
- (NSMutableArray)contentItems;
- (NSMutableArray)homeUserIdentifiers;
- (NSMutableArray)participants;
- (NSString)queueIdentifier;
- (NSString)requestID;
- (_MRDictionaryProtobuf)auxiliaryNowPlayingInfo;
- (_MRDictionaryProtobuf)properties;
- (_MRNowPlayingPlayerPathProtobuf)resolvedPlayerPath;
- (_MRPlaybackQueueContextProtobuf)context;
- (id)contentItemAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)homeUserIdentifiersAtIndex:(unint64_t)a3;
- (id)participantsAtIndex:(unint64_t)a3;
- (int)location;
- (unint64_t)contentItemsCount;
- (unint64_t)hash;
- (unint64_t)homeUserIdentifiersCount;
- (unint64_t)participantsCount;
- (void)addContentItem:(id)a3;
- (void)addHomeUserIdentifiers:(id)a3;
- (void)addParticipants:(id)a3;
- (void)clearContentItems;
- (void)clearHomeUserIdentifiers;
- (void)clearParticipants;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuxiliaryNowPlayingInfo:(id)a3;
- (void)setContentItems:(id)a3;
- (void)setContext:(id)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setHasSendingPlaybackQueueTransaction:(BOOL)a3;
- (void)setHomeUserIdentifiers:(id)a3;
- (void)setLocation:(int)a3;
- (void)setParticipants:(id)a3;
- (void)setProperties:(id)a3;
- (void)setQueueIdentifier:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setResolvedPlayerPath:(id)a3;
- (void)setSendingPlaybackQueueTransaction:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackQueueProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackQueueProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)setResolvedPlayerPath:(id)a3
{
}

- (void)setRequestID:(id)a3
{
}

- (void)setQueueIdentifier:(id)a3
{
}

- (void)setProperties:(id)a3
{
}

- (void)setLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_location = a3;
}

- (void)setHomeUserIdentifiers:(id)a3
{
}

- (void)setHasLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setContext:(id)a3
{
}

- (void)setContentItems:(id)a3
{
}

- (void)setAuxiliaryNowPlayingInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_homeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);

  objc_storeStrong((id *)&self->_auxiliaryNowPlayingInfo, 0);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (_MRDictionaryProtobuf)properties
{
  return self->_properties;
}

- (int)location
{
  return self->_location;
}

- (NSMutableArray)homeUserIdentifiers
{
  return self->_homeUserIdentifiers;
}

- (BOOL)hasResolvedPlayerPath
{
  return self->_resolvedPlayerPath != 0;
}

- (BOOL)hasLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (_MRPlaybackQueueContextProtobuf)context
{
  return self->_context;
}

- (NSMutableArray)contentItems
{
  return self->_contentItems;
}

- (_MRDictionaryProtobuf)auxiliaryNowPlayingInfo
{
  return self->_auxiliaryNowPlayingInfo;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_contentItems;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  if (self->_context) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_requestID) {
    PBDataWriterWriteStringField();
  }
  if (self->_resolvedPlayerPath) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_queueIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_participants;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = self->_homeUserIdentifiers;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if (self->_properties) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_auxiliaryNowPlayingInfo) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)addContentItem:(id)a3
{
  id v4 = a3;
  contentItems = self->_contentItems;
  id v8 = v4;
  if (!contentItems)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_contentItems;
    self->_contentItems = v6;

    id v4 = v8;
    contentItems = self->_contentItems;
  }
  [(NSMutableArray *)contentItems addObject:v4];
}

- (void)clearContentItems
{
}

- (unint64_t)contentItemsCount
{
  return [(NSMutableArray *)self->_contentItems count];
}

- (id)contentItemAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contentItems objectAtIndex:a3];
}

+ (Class)contentItemType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)setSendingPlaybackQueueTransaction:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sendingPlaybackQueueTransaction = a3;
}

- (void)setHasSendingPlaybackQueueTransaction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSendingPlaybackQueueTransaction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasQueueIdentifier
{
  return self->_queueIdentifier != 0;
}

- (void)clearParticipants
{
}

- (void)addParticipants:(id)a3
{
  id v4 = a3;
  participants = self->_participants;
  id v8 = v4;
  if (!participants)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_participants;
    self->_participants = v6;

    id v4 = v8;
    participants = self->_participants;
  }
  [(NSMutableArray *)participants addObject:v4];
}

- (unint64_t)participantsCount
{
  return [(NSMutableArray *)self->_participants count];
}

- (id)participantsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_participants objectAtIndex:a3];
}

+ (Class)participantsType
{
  return (Class)objc_opt_class();
}

- (void)clearHomeUserIdentifiers
{
}

- (void)addHomeUserIdentifiers:(id)a3
{
  id v4 = a3;
  homeUserIdentifiers = self->_homeUserIdentifiers;
  id v8 = v4;
  if (!homeUserIdentifiers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_homeUserIdentifiers;
    self->_homeUserIdentifiers = v6;

    id v4 = v8;
    homeUserIdentifiers = self->_homeUserIdentifiers;
  }
  [(NSMutableArray *)homeUserIdentifiers addObject:v4];
}

- (unint64_t)homeUserIdentifiersCount
{
  return [(NSMutableArray *)self->_homeUserIdentifiers count];
}

- (id)homeUserIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_homeUserIdentifiers objectAtIndex:a3];
}

+ (Class)homeUserIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasProperties
{
  return self->_properties != 0;
}

- (BOOL)hasAuxiliaryNowPlayingInfo
{
  return self->_auxiliaryNowPlayingInfo != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackQueueProtobuf;
  id v4 = [(_MRPlaybackQueueProtobuf *)&v8 description];
  v5 = [(_MRPlaybackQueueProtobuf *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_location];
    [v3 setObject:v4 forKey:@"location"];
  }
  if ([(NSMutableArray *)self->_contentItems count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_contentItems, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v6 = self->_contentItems;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"contentItem"];
  }
  context = self->_context;
  if (context)
  {
    uint64_t v13 = [(_MRPlaybackQueueContextProtobuf *)context dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"context"];
  }
  requestID = self->_requestID;
  if (requestID) {
    [v3 setObject:requestID forKey:@"requestID"];
  }
  resolvedPlayerPath = self->_resolvedPlayerPath;
  if (resolvedPlayerPath)
  {
    uint64_t v16 = [(_MRNowPlayingPlayerPathProtobuf *)resolvedPlayerPath dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"resolvedPlayerPath"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v17 = [NSNumber numberWithBool:self->_sendingPlaybackQueueTransaction];
    [v3 setObject:v17 forKey:@"sendingPlaybackQueueTransaction"];
  }
  queueIdentifier = self->_queueIdentifier;
  if (queueIdentifier) {
    [v3 setObject:queueIdentifier forKey:@"queueIdentifier"];
  }
  if ([(NSMutableArray *)self->_participants count])
  {
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_participants, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v20 = self->_participants;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "dictionaryRepresentation", (void)v32);
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"participants"];
  }
  homeUserIdentifiers = self->_homeUserIdentifiers;
  if (homeUserIdentifiers) {
    [v3 setObject:homeUserIdentifiers forKey:@"homeUserIdentifiers"];
  }
  properties = self->_properties;
  if (properties)
  {
    long long v28 = [(_MRDictionaryProtobuf *)properties dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"properties"];
  }
  auxiliaryNowPlayingInfo = self->_auxiliaryNowPlayingInfo;
  if (auxiliaryNowPlayingInfo)
  {
    long long v30 = [(_MRDictionaryProtobuf *)auxiliaryNowPlayingInfo dictionaryRepresentation];
    [v3 setObject:v30 forKey:@"auxiliaryNowPlayingInfo"];
  }

  return v3;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_location;
    *((unsigned char *)v4 + 92) |= 1u;
  }
  uint64_t v18 = v4;
  if ([(_MRPlaybackQueueProtobuf *)self contentItemsCount])
  {
    [v18 clearContentItems];
    unint64_t v5 = [(_MRPlaybackQueueProtobuf *)self contentItemsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(_MRPlaybackQueueProtobuf *)self contentItemAtIndex:i];
        [v18 addContentItem:v8];
      }
    }
  }
  if (self->_context) {
    objc_msgSend(v18, "setContext:");
  }
  if (self->_requestID) {
    objc_msgSend(v18, "setRequestID:");
  }
  if (self->_resolvedPlayerPath) {
    objc_msgSend(v18, "setResolvedPlayerPath:");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v18[88] = self->_sendingPlaybackQueueTransaction;
    v18[92] |= 2u;
  }
  if (self->_queueIdentifier) {
    objc_msgSend(v18, "setQueueIdentifier:");
  }
  if ([(_MRPlaybackQueueProtobuf *)self participantsCount])
  {
    [v18 clearParticipants];
    unint64_t v9 = [(_MRPlaybackQueueProtobuf *)self participantsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(_MRPlaybackQueueProtobuf *)self participantsAtIndex:j];
        [v18 addParticipants:v12];
      }
    }
  }
  if ([(_MRPlaybackQueueProtobuf *)self homeUserIdentifiersCount])
  {
    [v18 clearHomeUserIdentifiers];
    unint64_t v13 = [(_MRPlaybackQueueProtobuf *)self homeUserIdentifiersCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(_MRPlaybackQueueProtobuf *)self homeUserIdentifiersAtIndex:k];
        [v18 addHomeUserIdentifiers:v16];
      }
    }
  }
  if (self->_properties) {
    objc_msgSend(v18, "setProperties:");
  }
  uint64_t v17 = v18;
  if (self->_auxiliaryNowPlayingInfo)
  {
    objc_msgSend(v18, "setAuxiliaryNowPlayingInfo:");
    uint64_t v17 = v18;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_location;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v7 = self->_contentItems;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v47;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * v11) copyWithZone:a3];
        [(id)v6 addContentItem:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v9);
  }

  id v13 = [(_MRPlaybackQueueContextProtobuf *)self->_context copyWithZone:a3];
  unint64_t v14 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_requestID copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v15;

  id v17 = [(_MRNowPlayingPlayerPathProtobuf *)self->_resolvedPlayerPath copyWithZone:a3];
  uint64_t v18 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v17;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 88) = self->_sendingPlaybackQueueTransaction;
    *(unsigned char *)(v6 + 92) |= 2u;
  }
  uint64_t v19 = [(NSString *)self->_queueIdentifier copyWithZone:a3];
  long long v20 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v19;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v21 = self->_participants;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v43;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * v25) copyWithZone:a3];
        [(id)v6 addParticipants:v26];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v23);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v27 = self->_homeUserIdentifiers;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v39;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * v31), "copyWithZone:", a3, (void)v38);
        [(id)v6 addHomeUserIdentifiers:v32];

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v29);
  }

  id v33 = [(_MRDictionaryProtobuf *)self->_properties copyWithZone:a3];
  long long v34 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v33;

  id v35 = [(_MRDictionaryProtobuf *)self->_auxiliaryNowPlayingInfo copyWithZone:a3];
  long long v36 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v35;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_location != *((_DWORD *)v4 + 10)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_33;
  }
  contentItems = self->_contentItems;
  if ((unint64_t)contentItems | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](contentItems, "isEqual:"))
  {
    goto LABEL_33;
  }
  context = self->_context;
  if ((unint64_t)context | *((void *)v4 + 3))
  {
    if (!-[_MRPlaybackQueueContextProtobuf isEqual:](context, "isEqual:")) {
      goto LABEL_33;
    }
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:")) {
      goto LABEL_33;
    }
  }
  resolvedPlayerPath = self->_resolvedPlayerPath;
  if ((unint64_t)resolvedPlayerPath | *((void *)v4 + 10))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](resolvedPlayerPath, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) != 0)
    {
      if (self->_sendingPlaybackQueueTransaction)
      {
        if (!*((unsigned char *)v4 + 88)) {
          goto LABEL_33;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_23;
      }
    }
LABEL_33:
    char v14 = 0;
    goto LABEL_34;
  }
  if ((*((unsigned char *)v4 + 92) & 2) != 0) {
    goto LABEL_33;
  }
LABEL_23:
  queueIdentifier = self->_queueIdentifier;
  if ((unint64_t)queueIdentifier | *((void *)v4 + 8)
    && !-[NSString isEqual:](queueIdentifier, "isEqual:"))
  {
    goto LABEL_33;
  }
  participants = self->_participants;
  if ((unint64_t)participants | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](participants, "isEqual:")) {
      goto LABEL_33;
    }
  }
  homeUserIdentifiers = self->_homeUserIdentifiers;
  if ((unint64_t)homeUserIdentifiers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](homeUserIdentifiers, "isEqual:")) {
      goto LABEL_33;
    }
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((void *)v4 + 7))
  {
    if (!-[_MRDictionaryProtobuf isEqual:](properties, "isEqual:")) {
      goto LABEL_33;
    }
  }
  auxiliaryNowPlayingInfo = self->_auxiliaryNowPlayingInfo;
  if ((unint64_t)auxiliaryNowPlayingInfo | *((void *)v4 + 1)) {
    char v14 = -[_MRDictionaryProtobuf isEqual:](auxiliaryNowPlayingInfo, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_34:

  return v14;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_location;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_contentItems hash];
  unint64_t v5 = [(_MRPlaybackQueueContextProtobuf *)self->_context hash];
  NSUInteger v6 = [(NSString *)self->_requestID hash];
  unint64_t v7 = [(_MRNowPlayingPlayerPathProtobuf *)self->_resolvedPlayerPath hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_sendingPlaybackQueueTransaction;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_queueIdentifier hash];
  uint64_t v10 = [(NSMutableArray *)self->_participants hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_homeUserIdentifiers hash];
  unint64_t v12 = v11 ^ [(_MRDictionaryProtobuf *)self->_properties hash];
  return v9 ^ v12 ^ [(_MRDictionaryProtobuf *)self->_auxiliaryNowPlayingInfo hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 92))
  {
    self->_location = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        [(_MRPlaybackQueueProtobuf *)self addContentItem:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v8);
  }

  context = self->_context;
  uint64_t v12 = *((void *)v5 + 3);
  if (context)
  {
    if (v12) {
      -[_MRPlaybackQueueContextProtobuf mergeFrom:](context, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[_MRPlaybackQueueProtobuf setContext:](self, "setContext:");
  }
  if (*((void *)v5 + 9)) {
    -[_MRPlaybackQueueProtobuf setRequestID:](self, "setRequestID:");
  }
  resolvedPlayerPath = self->_resolvedPlayerPath;
  uint64_t v14 = *((void *)v5 + 10);
  if (resolvedPlayerPath)
  {
    if (v14) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](resolvedPlayerPath, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[_MRPlaybackQueueProtobuf setResolvedPlayerPath:](self, "setResolvedPlayerPath:");
  }
  if ((*((unsigned char *)v5 + 92) & 2) != 0)
  {
    self->_sendingPlaybackQueueTransaction = *((unsigned char *)v5 + 88);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 8)) {
    -[_MRPlaybackQueueProtobuf setQueueIdentifier:](self, "setQueueIdentifier:");
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = *((id *)v5 + 6);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        [(_MRPlaybackQueueProtobuf *)self addParticipants:*(void *)(*((void *)&v33 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v17);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = *((id *)v5 + 4);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        -[_MRPlaybackQueueProtobuf addHomeUserIdentifiers:](self, "addHomeUserIdentifiers:", *(void *)(*((void *)&v29 + 1) + 8 * k), (void)v29);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v22);
  }

  properties = self->_properties;
  uint64_t v26 = *((void *)v5 + 7);
  if (properties)
  {
    if (v26) {
      -[_MRDictionaryProtobuf mergeFrom:](properties, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[_MRPlaybackQueueProtobuf setProperties:](self, "setProperties:");
  }
  auxiliaryNowPlayingInfo = self->_auxiliaryNowPlayingInfo;
  uint64_t v28 = *((void *)v5 + 1);
  if (auxiliaryNowPlayingInfo)
  {
    if (v28) {
      -[_MRDictionaryProtobuf mergeFrom:](auxiliaryNowPlayingInfo, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[_MRPlaybackQueueProtobuf setAuxiliaryNowPlayingInfo:](self, "setAuxiliaryNowPlayingInfo:");
  }
}

- (_MRNowPlayingPlayerPathProtobuf)resolvedPlayerPath
{
  return self->_resolvedPlayerPath;
}

- (BOOL)sendingPlaybackQueueTransaction
{
  return self->_sendingPlaybackQueueTransaction;
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

@end