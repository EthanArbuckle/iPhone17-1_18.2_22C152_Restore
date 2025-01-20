@interface _ICLLCommandMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)clearOneofValuesForCommand;
- (void)setClientInfo:(uint64_t)a1;
- (void)setMoveItem:(uint64_t)a1;
- (void)setRemoveItem:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLCommandMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceQueueItems, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_playbackSync, 0);
  objc_storeStrong((id *)&self->_playbackControlSettings, 0);
  objc_storeStrong((id *)&self->_playNowQueueItems, 0);
  objc_storeStrong((id *)&self->_moveItem, 0);
  objc_storeStrong((id *)&self->_currentItemTransition, 0);
  objc_storeStrong((id *)&self->_currentItemChange, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);

  objc_storeStrong((id *)&self->_addItems, 0);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_command;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_ICLLPlaybackSyncCommand *)self->_playbackSync hash] ^ v3;
  unint64_t v5 = [(_ICLLAddQueueItemsCommand *)self->_addItems hash];
  unint64_t v6 = v4 ^ v5 ^ [(_ICLLRemoveQueueItemCommand *)self->_removeItem hash];
  unint64_t v7 = [(_ICLLMoveQueueItemCommand *)self->_moveItem hash];
  unint64_t v8 = v7 ^ [(_ICLLCurrentItemChangeCommand *)self->_currentItemChange hash];
  unint64_t v9 = v6 ^ v8 ^ [(_ICLLPlaybackControlSettingsCommand *)self->_playbackControlSettings hash];
  unint64_t v10 = [(_ICLLReactionCommand *)self->_reaction hash];
  unint64_t v11 = v10 ^ [(_ICLLClientInfoCommand *)self->_clientInfo hash];
  unint64_t v12 = v11 ^ [(_ICLLReplaceQueueItemsCommand *)self->_replaceQueueItems hash];
  unint64_t v13 = v9 ^ v12 ^ [(_ICLLPlayNowQueueItemsCommand *)self->_playNowQueueItems hash];
  return v13 ^ [(_ICLLCurrentItemTransitionCommand *)self->_currentItemTransition hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 104) & 1) == 0 || self->_command != *((_DWORD *)v4 + 6)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 104))
  {
LABEL_29:
    char v16 = 0;
    goto LABEL_30;
  }
  playbackSync = self->_playbackSync;
  if ((unint64_t)playbackSync | *((void *)v4 + 9)
    && !-[_ICLLPlaybackSyncCommand isEqual:](playbackSync, "isEqual:"))
  {
    goto LABEL_29;
  }
  addItems = self->_addItems;
  if ((unint64_t)addItems | *((void *)v4 + 1))
  {
    if (!-[_ICLLAddQueueItemsCommand isEqual:](addItems, "isEqual:")) {
      goto LABEL_29;
    }
  }
  removeItem = self->_removeItem;
  if ((unint64_t)removeItem | *((void *)v4 + 11))
  {
    if (!-[_ICLLRemoveQueueItemCommand isEqual:](removeItem, "isEqual:")) {
      goto LABEL_29;
    }
  }
  moveItem = self->_moveItem;
  if ((unint64_t)moveItem | *((void *)v4 + 6))
  {
    if (!-[_ICLLMoveQueueItemCommand isEqual:](moveItem, "isEqual:")) {
      goto LABEL_29;
    }
  }
  currentItemChange = self->_currentItemChange;
  if ((unint64_t)currentItemChange | *((void *)v4 + 4))
  {
    if (!-[_ICLLCurrentItemChangeCommand isEqual:](currentItemChange, "isEqual:")) {
      goto LABEL_29;
    }
  }
  playbackControlSettings = self->_playbackControlSettings;
  if ((unint64_t)playbackControlSettings | *((void *)v4 + 8))
  {
    if (!-[_ICLLPlaybackControlSettingsCommand isEqual:](playbackControlSettings, "isEqual:")) {
      goto LABEL_29;
    }
  }
  reaction = self->_reaction;
  if ((unint64_t)reaction | *((void *)v4 + 10))
  {
    if (!-[_ICLLReactionCommand isEqual:](reaction, "isEqual:")) {
      goto LABEL_29;
    }
  }
  clientInfo = self->_clientInfo;
  if ((unint64_t)clientInfo | *((void *)v4 + 2))
  {
    if (!-[_ICLLClientInfoCommand isEqual:](clientInfo, "isEqual:")) {
      goto LABEL_29;
    }
  }
  replaceQueueItems = self->_replaceQueueItems;
  if ((unint64_t)replaceQueueItems | *((void *)v4 + 12))
  {
    if (!-[_ICLLReplaceQueueItemsCommand isEqual:](replaceQueueItems, "isEqual:")) {
      goto LABEL_29;
    }
  }
  playNowQueueItems = self->_playNowQueueItems;
  if ((unint64_t)playNowQueueItems | *((void *)v4 + 7))
  {
    if (!-[_ICLLPlayNowQueueItemsCommand isEqual:](playNowQueueItems, "isEqual:")) {
      goto LABEL_29;
    }
  }
  currentItemTransition = self->_currentItemTransition;
  if ((unint64_t)currentItemTransition | *((void *)v4 + 5)) {
    char v16 = -[_ICLLCurrentItemTransitionCommand isEqual:](currentItemTransition, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_30:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_command;
    *(unsigned char *)(v5 + 104) |= 1u;
  }
  id v7 = [(_ICLLPlaybackSyncCommand *)self->_playbackSync copyWithZone:a3];
  unint64_t v8 = (void *)v6[9];
  v6[9] = v7;

  id v9 = [(_ICLLAddQueueItemsCommand *)self->_addItems copyWithZone:a3];
  unint64_t v10 = (void *)v6[1];
  v6[1] = v9;

  id v11 = [(_ICLLRemoveQueueItemCommand *)self->_removeItem copyWithZone:a3];
  unint64_t v12 = (void *)v6[11];
  v6[11] = v11;

  id v13 = [(_ICLLMoveQueueItemCommand *)self->_moveItem copyWithZone:a3];
  v14 = (void *)v6[6];
  v6[6] = v13;

  id v15 = [(_ICLLCurrentItemChangeCommand *)self->_currentItemChange copyWithZone:a3];
  char v16 = (void *)v6[4];
  v6[4] = v15;

  id v17 = [(_ICLLPlaybackControlSettingsCommand *)self->_playbackControlSettings copyWithZone:a3];
  v18 = (void *)v6[8];
  v6[8] = v17;

  id v19 = [(_ICLLReactionCommand *)self->_reaction copyWithZone:a3];
  v20 = (void *)v6[10];
  v6[10] = v19;

  id v21 = [(_ICLLClientInfoCommand *)self->_clientInfo copyWithZone:a3];
  v22 = (void *)v6[2];
  v6[2] = v21;

  id v23 = [(_ICLLReplaceQueueItemsCommand *)self->_replaceQueueItems copyWithZone:a3];
  v24 = (void *)v6[12];
  v6[12] = v23;

  id v25 = [(_ICLLPlayNowQueueItemsCommand *)self->_playNowQueueItems copyWithZone:a3];
  v26 = (void *)v6[7];
  v6[7] = v25;

  id v27 = [(_ICLLCurrentItemTransitionCommand *)self->_currentItemTransition copyWithZone:a3];
  v28 = (void *)v6[5];
  v6[5] = v27;

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_playbackSync)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_addItems)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_removeItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_moveItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_currentItemChange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playbackControlSettings)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_reaction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_clientInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_replaceQueueItems)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playNowQueueItems)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_currentItemTransition)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLCommandMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)clearOneofValuesForCommand
{
  if (a1)
  {
    *(unsigned char *)(a1 + 104) &= ~1u;
    *(_DWORD *)(a1 + 24) = 0;
    v2 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;

    uint64_t v3 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    id v4 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;

    id v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    unint64_t v6 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    id v7 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    unint64_t v8 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    id v9 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    unint64_t v10 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    id v11 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    unint64_t v12 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  playbackSync = self->_playbackSync;
  if (playbackSync)
  {
    id v5 = [(_ICLLPlaybackSyncCommand *)playbackSync dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"playbackSync"];
  }
  addItems = self->_addItems;
  if (addItems)
  {
    id v7 = [(_ICLLAddQueueItemsCommand *)addItems dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"addItems"];
  }
  removeItem = self->_removeItem;
  if (removeItem)
  {
    id v9 = [(_ICLLRemoveQueueItemCommand *)removeItem dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"removeItem"];
  }
  moveItem = self->_moveItem;
  if (moveItem)
  {
    id v11 = [(_ICLLMoveQueueItemCommand *)moveItem dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"moveItem"];
  }
  currentItemChange = self->_currentItemChange;
  if (currentItemChange)
  {
    id v13 = [(_ICLLCurrentItemChangeCommand *)currentItemChange dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"currentItemChange"];
  }
  playbackControlSettings = self->_playbackControlSettings;
  if (playbackControlSettings)
  {
    id v15 = [(_ICLLPlaybackControlSettingsCommand *)playbackControlSettings dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"playbackControlSettings"];
  }
  reaction = self->_reaction;
  if (reaction)
  {
    id v17 = [(_ICLLReactionCommand *)reaction dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"reaction"];
  }
  clientInfo = self->_clientInfo;
  if (clientInfo)
  {
    id v19 = [(_ICLLClientInfoCommand *)clientInfo dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"clientInfo"];
  }
  replaceQueueItems = self->_replaceQueueItems;
  if (replaceQueueItems)
  {
    id v21 = [(_ICLLReplaceQueueItemsCommand *)replaceQueueItems dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"replaceQueueItems"];
  }
  playNowQueueItems = self->_playNowQueueItems;
  if (playNowQueueItems)
  {
    id v23 = [(_ICLLPlayNowQueueItemsCommand *)playNowQueueItems dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"playNowQueueItems"];
  }
  currentItemTransition = self->_currentItemTransition;
  if (currentItemTransition)
  {
    id v25 = [(_ICLLCurrentItemTransitionCommand *)currentItemTransition dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"currentItemTransition"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v26 = [NSNumber numberWithInt:self->_command];
    [v3 setObject:v26 forKey:@"command"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLCommandMessage;
  id v4 = [(_ICLLCommandMessage *)&v8 description];
  id v5 = [(_ICLLCommandMessage *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setRemoveItem:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
    *(unsigned char *)(a1 + 104) |= 1u;
    *(_DWORD *)(a1 + 24) = 3;
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)setMoveItem:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
    *(unsigned char *)(a1 + 104) |= 1u;
    *(_DWORD *)(a1 + 24) = 4;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setClientInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
    *(unsigned char *)(a1 + 104) |= 1u;
    *(_DWORD *)(a1 + 24) = 8;
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

@end