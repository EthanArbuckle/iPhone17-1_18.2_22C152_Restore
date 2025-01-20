@interface _ICLLQueryMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)clearOneofValuesForQuery;
- (void)setPlaybackSyncState:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLQueryMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_playbackSyncState, 0);
  objc_storeStrong((id *)&self->_playbackControlSettings, 0);

  objc_storeStrong((id *)&self->_participant, 0);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_query;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_ICLLQueueQuery *)self->_queue hash] ^ v3;
  unint64_t v5 = [(_ICLLPlaybackSyncStateQuery *)self->_playbackSyncState hash];
  unint64_t v6 = v4 ^ v5 ^ [(_ICLLPlaybackControlSettingsQuery *)self->_playbackControlSettings hash];
  return v6 ^ [(_ICLLParticipantQuery *)self->_participant hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_query != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  queue = self->_queue;
  if ((unint64_t)queue | *((void *)v4 + 5) && !-[_ICLLQueueQuery isEqual:](queue, "isEqual:")) {
    goto LABEL_15;
  }
  playbackSyncState = self->_playbackSyncState;
  if ((unint64_t)playbackSyncState | *((void *)v4 + 3))
  {
    if (!-[_ICLLPlaybackSyncStateQuery isEqual:](playbackSyncState, "isEqual:")) {
      goto LABEL_15;
    }
  }
  playbackControlSettings = self->_playbackControlSettings;
  if ((unint64_t)playbackControlSettings | *((void *)v4 + 2))
  {
    if (!-[_ICLLPlaybackControlSettingsQuery isEqual:](playbackControlSettings, "isEqual:")) {
      goto LABEL_15;
    }
  }
  participant = self->_participant;
  if ((unint64_t)participant | *((void *)v4 + 1)) {
    char v9 = -[_ICLLParticipantQuery isEqual:](participant, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_query;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v7 = [(_ICLLQueueQuery *)self->_queue copyWithZone:a3];
  v8 = (void *)v6[5];
  v6[5] = v7;

  id v9 = [(_ICLLPlaybackSyncStateQuery *)self->_playbackSyncState copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = [(_ICLLPlaybackControlSettingsQuery *)self->_playbackControlSettings copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  id v13 = [(_ICLLParticipantQuery *)self->_participant copyWithZone:a3];
  v14 = (void *)v6[1];
  v6[1] = v13;

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_queue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playbackSyncState)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playbackControlSettings)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_participant)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLQueryMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)clearOneofValuesForQuery
{
  if (a1)
  {
    *(unsigned char *)(a1 + 48) &= ~1u;
    *(_DWORD *)(a1 + 32) = 0;
    v2 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    uint64_t v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    id v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    id v5 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  queue = self->_queue;
  if (queue)
  {
    id v5 = [(_ICLLQueueQuery *)queue dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"queue"];
  }
  playbackSyncState = self->_playbackSyncState;
  if (playbackSyncState)
  {
    id v7 = [(_ICLLPlaybackSyncStateQuery *)playbackSyncState dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"playbackSyncState"];
  }
  playbackControlSettings = self->_playbackControlSettings;
  if (playbackControlSettings)
  {
    id v9 = [(_ICLLPlaybackControlSettingsQuery *)playbackControlSettings dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"playbackControlSettings"];
  }
  participant = self->_participant;
  if (participant)
  {
    id v11 = [(_ICLLParticipantQuery *)participant dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"participant"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithInt:self->_query];
    [v3 setObject:v12 forKey:@"query"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLQueryMessage;
  id v4 = [(_ICLLQueryMessage *)&v8 description];
  id v5 = [(_ICLLQueryMessage *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setPlaybackSyncState:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    -[_ICLLQueryMessage clearOneofValuesForQuery](a1);
    *(unsigned char *)(a1 + 48) |= 1u;
    *(_DWORD *)(a1 + 32) = 2;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

@end