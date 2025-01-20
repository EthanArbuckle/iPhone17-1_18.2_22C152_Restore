@interface _ICLLPlaybackSyncStateQuery
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addParticipantStates:(uint64_t)a1;
- (uint64_t)addTransportControlStates:(uint64_t)a1;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLPlaybackSyncStateQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportControlStates, 0);
  objc_storeStrong((id *)&self->_participantStates, 0);
  objc_storeStrong((id *)&self->_initialAVSyncStartItemId, 0);

  objc_storeStrong((id *)&self->_currentItemId, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_participantStates hash];
  uint64_t v4 = [(NSMutableArray *)self->_transportControlStates hash];
  NSUInteger v5 = [(NSString *)self->_currentItemId hash];
  NSUInteger v6 = [(NSString *)self->_initialAVSyncStartItemId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_initialAVSyncInitiator;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  participantStates = self->_participantStates;
  if ((unint64_t)participantStates | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](participantStates, "isEqual:")) {
      goto LABEL_12;
    }
  }
  transportControlStates = self->_transportControlStates;
  if ((unint64_t)transportControlStates | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](transportControlStates, "isEqual:")) {
      goto LABEL_12;
    }
  }
  currentItemId = self->_currentItemId;
  if ((unint64_t)currentItemId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](currentItemId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  initialAVSyncStartItemId = self->_initialAVSyncStartItemId;
  if ((unint64_t)initialAVSyncStartItemId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](initialAVSyncStartItemId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0)
    {
LABEL_12:
      BOOL v9 = 0;
      goto LABEL_13;
    }
    if (self->_initialAVSyncInitiator)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_12;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_12;
    }
    BOOL v9 = 1;
  }
LABEL_13:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  NSUInteger v6 = self->_participantStates;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * v10) copyWithZone:a3];
        -[_ICLLPlaybackSyncStateQuery addParticipantStates:](v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v12 = self->_transportControlStates;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v16), "copyWithZone:", a3, (void)v23);
        -[_ICLLPlaybackSyncStateQuery addTransportControlStates:](v5, v17);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_currentItemId copyWithZone:a3];
  v19 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v18;

  uint64_t v20 = [(NSString *)self->_initialAVSyncStartItemId copyWithZone:a3];
  v21 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v20;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_initialAVSyncInitiator;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (uint64_t)addParticipantStates:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      uint64_t v5 = *(void **)(a1 + 24);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)addTransportControlStates:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      uint64_t v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_participantStates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_transportControlStates;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_currentItemId) {
    PBDataWriterWriteStringField();
  }
  if (self->_initialAVSyncStartItemId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackSyncStateQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  participantStates = self->_participantStates;
  if (participantStates) {
    [v3 setObject:participantStates forKey:@"participantStates"];
  }
  transportControlStates = self->_transportControlStates;
  if (transportControlStates) {
    [v4 setObject:transportControlStates forKey:@"transportControlStates"];
  }
  currentItemId = self->_currentItemId;
  if (currentItemId) {
    [v4 setObject:currentItemId forKey:@"currentItemId"];
  }
  initialAVSyncStartItemId = self->_initialAVSyncStartItemId;
  if (initialAVSyncStartItemId) {
    [v4 setObject:initialAVSyncStartItemId forKey:@"initialAVSyncStartItemId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v9 = [NSNumber numberWithBool:self->_initialAVSyncInitiator];
    [v4 setObject:v9 forKey:@"initialAVSyncInitiator"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackSyncStateQuery;
  id v4 = [(_ICLLPlaybackSyncStateQuery *)&v8 description];
  uint64_t v5 = [(_ICLLPlaybackSyncStateQuery *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end