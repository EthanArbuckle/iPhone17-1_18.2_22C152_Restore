@interface _ICLLActionMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)clearOneofValuesForAction;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLActionMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverNotice, 0);
  objc_storeStrong((id *)&self->_replaceQueueItems, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_queueSync, 0);
  objc_storeStrong((id *)&self->_playbackSync, 0);
  objc_storeStrong((id *)&self->_playNowQueueItems, 0);
  objc_storeStrong((id *)&self->_participantChange, 0);
  objc_storeStrong((id *)&self->_originatorUUID, 0);
  objc_storeStrong((id *)&self->_moveItem, 0);
  objc_storeStrong((id *)&self->_displayMessage, 0);
  objc_storeStrong((id *)&self->_currentItemTransition, 0);
  objc_storeStrong((id *)&self->_currentItemChange, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);

  objc_storeStrong((id *)&self->_addItems, 0);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v20 = 2654435761 * self->_action;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v19 = 2654435761 * self->_originatorId;
      goto LABEL_6;
    }
  }
  uint64_t v19 = 0;
LABEL_6:
  unint64_t v18 = [(_ICLLPlaybackSyncAction *)self->_playbackSync hash];
  unint64_t v17 = [(_ICLLAddQueueItemsAction *)self->_addItems hash];
  unint64_t v16 = [(_ICLLRemoveQueueItemAction *)self->_removeItem hash];
  unint64_t v15 = [(_ICLLMoveQueueItemAction *)self->_moveItem hash];
  unint64_t v14 = [(_ICLLCurrentItemChangeAction *)self->_currentItemChange hash];
  unint64_t v3 = [(_ICLLReactionAction *)self->_reaction hash];
  unint64_t v4 = [(_ICLLParticipantChangeAction *)self->_participantChange hash];
  unint64_t v5 = [(_ICLLServerNoticeAction *)self->_serverNotice hash];
  unint64_t v6 = [(_ICLLClientInfoAction *)self->_clientInfo hash];
  unint64_t v7 = [(_ICLLReplaceQueueItemsAction *)self->_replaceQueueItems hash];
  NSUInteger v8 = [(NSString *)self->_originatorUUID hash];
  unint64_t v9 = [(_ICLLPlayNowQueueItemsAction *)self->_playNowQueueItems hash];
  unint64_t v10 = [(_ICLLCurrentItemTransitionAction *)self->_currentItemTransition hash];
  unint64_t v11 = [(_ICLLQueueSyncAction *)self->_queueSync hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_displayNotice;
  }
  else {
    uint64_t v12 = 0;
  }
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(_ICLLDisplayMessage *)self->_displayMessage hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 2) == 0 || self->_action != *((_DWORD *)v4 + 4)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 2) != 0)
  {
    goto LABEL_44;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 148) & 1) == 0 || self->_originatorId != *((void *)v4 + 1)) {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)v4 + 148))
  {
    goto LABEL_44;
  }
  playbackSync = self->_playbackSync;
  if ((unint64_t)playbackSync | *((void *)v4 + 12)
    && !-[_ICLLPlaybackSyncAction isEqual:](playbackSync, "isEqual:"))
  {
    goto LABEL_44;
  }
  addItems = self->_addItems;
  if ((unint64_t)addItems | *((void *)v4 + 3))
  {
    if (!-[_ICLLAddQueueItemsAction isEqual:](addItems, "isEqual:")) {
      goto LABEL_44;
    }
  }
  removeItem = self->_removeItem;
  if ((unint64_t)removeItem | *((void *)v4 + 15))
  {
    if (!-[_ICLLRemoveQueueItemAction isEqual:](removeItem, "isEqual:")) {
      goto LABEL_44;
    }
  }
  moveItem = self->_moveItem;
  if ((unint64_t)moveItem | *((void *)v4 + 8))
  {
    if (!-[_ICLLMoveQueueItemAction isEqual:](moveItem, "isEqual:")) {
      goto LABEL_44;
    }
  }
  currentItemChange = self->_currentItemChange;
  if ((unint64_t)currentItemChange | *((void *)v4 + 5))
  {
    if (!-[_ICLLCurrentItemChangeAction isEqual:](currentItemChange, "isEqual:")) {
      goto LABEL_44;
    }
  }
  reaction = self->_reaction;
  if ((unint64_t)reaction | *((void *)v4 + 14))
  {
    if (!-[_ICLLReactionAction isEqual:](reaction, "isEqual:")) {
      goto LABEL_44;
    }
  }
  participantChange = self->_participantChange;
  if ((unint64_t)participantChange | *((void *)v4 + 10))
  {
    if (!-[_ICLLParticipantChangeAction isEqual:](participantChange, "isEqual:")) {
      goto LABEL_44;
    }
  }
  serverNotice = self->_serverNotice;
  if ((unint64_t)serverNotice | *((void *)v4 + 17))
  {
    if (!-[_ICLLServerNoticeAction isEqual:](serverNotice, "isEqual:")) {
      goto LABEL_44;
    }
  }
  clientInfo = self->_clientInfo;
  if ((unint64_t)clientInfo | *((void *)v4 + 4))
  {
    if (!-[_ICLLClientInfoAction isEqual:](clientInfo, "isEqual:")) {
      goto LABEL_44;
    }
  }
  replaceQueueItems = self->_replaceQueueItems;
  if ((unint64_t)replaceQueueItems | *((void *)v4 + 16))
  {
    if (!-[_ICLLReplaceQueueItemsAction isEqual:](replaceQueueItems, "isEqual:")) {
      goto LABEL_44;
    }
  }
  originatorUUID = self->_originatorUUID;
  if ((unint64_t)originatorUUID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](originatorUUID, "isEqual:")) {
      goto LABEL_44;
    }
  }
  playNowQueueItems = self->_playNowQueueItems;
  if ((unint64_t)playNowQueueItems | *((void *)v4 + 11))
  {
    if (!-[_ICLLPlayNowQueueItemsAction isEqual:](playNowQueueItems, "isEqual:")) {
      goto LABEL_44;
    }
  }
  currentItemTransition = self->_currentItemTransition;
  if ((unint64_t)currentItemTransition | *((void *)v4 + 6))
  {
    if (!-[_ICLLCurrentItemTransitionAction isEqual:](currentItemTransition, "isEqual:")) {
      goto LABEL_44;
    }
  }
  queueSync = self->_queueSync;
  if ((unint64_t)queueSync | *((void *)v4 + 13))
  {
    if (!-[_ICLLQueueSyncAction isEqual:](queueSync, "isEqual:")) {
      goto LABEL_44;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 148) & 4) == 0) {
      goto LABEL_50;
    }
LABEL_44:
    char v19 = 0;
    goto LABEL_45;
  }
  if ((*((unsigned char *)v4 + 148) & 4) == 0) {
    goto LABEL_44;
  }
  if (!self->_displayNotice)
  {
    if (!*((unsigned char *)v4 + 144)) {
      goto LABEL_50;
    }
    goto LABEL_44;
  }
  if (!*((unsigned char *)v4 + 144)) {
    goto LABEL_44;
  }
LABEL_50:
  displayMessage = self->_displayMessage;
  if ((unint64_t)displayMessage | *((void *)v4 + 7)) {
    char v19 = -[_ICLLDisplayMessage isEqual:](displayMessage, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_45:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_action;
    *(unsigned char *)(v5 + 148) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_originatorId;
    *(unsigned char *)(v5 + 148) |= 1u;
  }
  id v8 = [(_ICLLPlaybackSyncAction *)self->_playbackSync copyWithZone:a3];
  unint64_t v9 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v8;

  id v10 = [(_ICLLAddQueueItemsAction *)self->_addItems copyWithZone:a3];
  unint64_t v11 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v10;

  id v12 = [(_ICLLRemoveQueueItemAction *)self->_removeItem copyWithZone:a3];
  v13 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v12;

  id v14 = [(_ICLLMoveQueueItemAction *)self->_moveItem copyWithZone:a3];
  unint64_t v15 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v14;

  id v16 = [(_ICLLCurrentItemChangeAction *)self->_currentItemChange copyWithZone:a3];
  unint64_t v17 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v16;

  id v18 = [(_ICLLReactionAction *)self->_reaction copyWithZone:a3];
  char v19 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v18;

  id v20 = [(_ICLLParticipantChangeAction *)self->_participantChange copyWithZone:a3];
  v21 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v20;

  id v22 = [(_ICLLServerNoticeAction *)self->_serverNotice copyWithZone:a3];
  v23 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v22;

  id v24 = [(_ICLLClientInfoAction *)self->_clientInfo copyWithZone:a3];
  v25 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v24;

  id v26 = [(_ICLLReplaceQueueItemsAction *)self->_replaceQueueItems copyWithZone:a3];
  v27 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v26;

  uint64_t v28 = [(NSString *)self->_originatorUUID copyWithZone:a3];
  v29 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v28;

  id v30 = [(_ICLLPlayNowQueueItemsAction *)self->_playNowQueueItems copyWithZone:a3];
  v31 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v30;

  id v32 = [(_ICLLCurrentItemTransitionAction *)self->_currentItemTransition copyWithZone:a3];
  v33 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v32;

  id v34 = [(_ICLLQueueSyncAction *)self->_queueSync copyWithZone:a3];
  v35 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v34;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 144) = self->_displayNotice;
    *(unsigned char *)(v6 + 148) |= 4u;
  }
  id v36 = [(_ICLLDisplayMessage *)self->_displayMessage copyWithZone:a3];
  v37 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v36;

  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
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
  if (self->_reaction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_participantChange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_serverNotice)
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
  if (self->_originatorUUID)
  {
    PBDataWriterWriteStringField();
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
  if (self->_queueSync)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_displayMessage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLActionMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)clearOneofValuesForAction
{
  if (a1)
  {
    *(unsigned char *)(a1 + 148) &= ~2u;
    *(_DWORD *)(a1 + 16) = 0;
    v2 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    unint64_t v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    id v4 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = 0;

    id v5 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    uint64_t v6 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    unint64_t v7 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = 0;

    id v8 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    unint64_t v9 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = 0;

    id v10 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    unint64_t v11 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = 0;

    id v12 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;

    v13 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    id v14 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = 0;
  }
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_originatorId];
    [v3 setObject:v4 forKey:@"originatorId"];
  }
  playbackSync = self->_playbackSync;
  if (playbackSync)
  {
    uint64_t v6 = [(_ICLLPlaybackSyncAction *)playbackSync dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"playbackSync"];
  }
  addItems = self->_addItems;
  if (addItems)
  {
    id v8 = [(_ICLLAddQueueItemsAction *)addItems dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"addItems"];
  }
  removeItem = self->_removeItem;
  if (removeItem)
  {
    id v10 = [(_ICLLRemoveQueueItemAction *)removeItem dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"removeItem"];
  }
  moveItem = self->_moveItem;
  if (moveItem)
  {
    id v12 = [(_ICLLMoveQueueItemAction *)moveItem dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"moveItem"];
  }
  currentItemChange = self->_currentItemChange;
  if (currentItemChange)
  {
    id v14 = [(_ICLLCurrentItemChangeAction *)currentItemChange dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"currentItemChange"];
  }
  reaction = self->_reaction;
  if (reaction)
  {
    id v16 = [(_ICLLReactionAction *)reaction dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"reaction"];
  }
  participantChange = self->_participantChange;
  if (participantChange)
  {
    id v18 = [(_ICLLParticipantChangeAction *)participantChange dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"participantChange"];
  }
  serverNotice = self->_serverNotice;
  if (serverNotice)
  {
    id v20 = [(_ICLLServerNoticeAction *)serverNotice dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"serverNotice"];
  }
  clientInfo = self->_clientInfo;
  if (clientInfo)
  {
    id v22 = [(_ICLLClientInfoAction *)clientInfo dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"clientInfo"];
  }
  replaceQueueItems = self->_replaceQueueItems;
  if (replaceQueueItems)
  {
    id v24 = [(_ICLLReplaceQueueItemsAction *)replaceQueueItems dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"replaceQueueItems"];
  }
  playNowQueueItems = self->_playNowQueueItems;
  if (playNowQueueItems)
  {
    id v26 = [(_ICLLPlayNowQueueItemsAction *)playNowQueueItems dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"playNowQueueItems"];
  }
  currentItemTransition = self->_currentItemTransition;
  if (currentItemTransition)
  {
    uint64_t v28 = [(_ICLLCurrentItemTransitionAction *)currentItemTransition dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"currentItemTransition"];
  }
  queueSync = self->_queueSync;
  if (queueSync)
  {
    id v30 = [(_ICLLQueueSyncAction *)queueSync dictionaryRepresentation];
    [v3 setObject:v30 forKey:@"queueSync"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v31 = [NSNumber numberWithInt:self->_action];
    [v3 setObject:v31 forKey:@"action"];
  }
  originatorUUID = self->_originatorUUID;
  if (originatorUUID) {
    [v3 setObject:originatorUUID forKey:@"originatorUUID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v33 = [NSNumber numberWithBool:self->_displayNotice];
    [v3 setObject:v33 forKey:@"displayNotice"];
  }
  displayMessage = self->_displayMessage;
  if (displayMessage)
  {
    v35 = [(_ICLLDisplayMessage *)displayMessage dictionaryRepresentation];
    [v3 setObject:v35 forKey:@"displayMessage"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLActionMessage;
  id v4 = [(_ICLLActionMessage *)&v8 description];
  id v5 = [(_ICLLActionMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end