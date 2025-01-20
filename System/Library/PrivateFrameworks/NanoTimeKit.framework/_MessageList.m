@interface _MessageList
- (BOOL)hasMessages;
- (_MessageList)initWithPersistencePath:(id)a3;
- (id)_getClientID:(id)a3;
- (id)_getComplicationCollectionIdentifier:(id)a3;
- (id)_getComplicationDescriptor:(id)a3;
- (id)_getFaceUUID:(id)a3;
- (id)_getFamily:(id)a3;
- (id)_messageAtIndex:(unint64_t)a3;
- (id)firstMessage;
- (id)messageEnumerator;
- (int64_t)_getMessageType:(id)a3;
- (unint64_t)count;
- (void)_enqueueMessageDict:(id)a3;
- (void)_persistMessageDictionaries;
- (void)_pruneMessagesMadeObsoleteByNewMessageOfType:(int64_t)a3 withFaceUUID:(id)a4 clientID:(id)a5 family:(id)a6 complicationDescriptor:(id)a7 complicationCollectionIdentifier:(id)a8;
- (void)clearAllMessages;
- (void)clearMessageCount:(unint64_t)a3;
- (void)dequeueFirstMessage;
- (void)enqueueMessage:(id)a3;
- (void)resumeCoalescing;
- (void)suspendCoalescing;
@end

@implementation _MessageList

- (_MessageList)initWithPersistencePath:(id)a3
{
  id v14 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_MessageList;
  v15 = [(_MessageList *)&v20 init];
  if (v15)
  {
    objc_storeStrong((id *)&v15->_persistencePath, a3);
    v5 = +[NSArray arrayWithContentsOfFile:v15->_persistencePath];
    if (v5)
    {
      objc_opt_class();
      NTKValidateArray();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = v5;
    v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_opt_class();
          NTKValidateDictionaryValue();
          objc_opt_class();
          NTKValidateDictionaryValue();
          objc_opt_class();
          NTKValidateDictionaryValue();
          objc_opt_class();
          NTKValidateDictionaryValue();
          objc_opt_class();
          NTKValidateDictionaryValue();
          objc_opt_class();
          NTKValidateDictionaryValue();
        }
        v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v7);
    }

    if (v5)
    {
      v10 = (NSMutableArray *)[(NSMutableArray *)v6 mutableCopy];
      messageDictionaries = v15->_messageDictionaries;
      v15->_messageDictionaries = v10;
    }
    else
    {
      uint64_t v12 = +[NSMutableArray array];
      v6 = v15->_messageDictionaries;
      v15->_messageDictionaries = (NSMutableArray *)v12;
    }
  }
  return v15;
}

- (void)enqueueMessage:(id)a3
{
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "message list enqueue message %@", buf, 0xCu);
  }

  v6 = +[NSMutableDictionary dictionary];
  v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 messageType]);
  [v6 setObject:v7 forKey:@"message-type"];

  uint64_t v8 = [v4 faceUUID];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 UUIDString];
    [v6 setObject:v10 forKey:@"face-uuid"];
  }
  v11 = [v4 complicationClientID];
  if (v11) {
    [v6 setObject:v11 forKey:@"complicaiton-clientID"];
  }
  uint64_t v12 = [v4 complicationFamily];
  if (v12) {
    [v6 setObject:v12 forKey:@"complication-family"];
  }
  v13 = [v4 complicationDescriptor];
  id v14 = v13;
  if (v13)
  {
    v15 = [v13 JSONObjectRepresentation];
    [v6 setObject:v15 forKey:@"complication-descriptor"];
  }
  long long v16 = [v4 complicationCollectionIdentifier];
  if (v16) {
    [v6 setObject:v16 forKey:@"complication-collection-identifier"];
  }
  if ([v4 payloadSize])
  {
    v22 = self;
    long long v17 = +[NSUUID UUID];
    long long v18 = [v17 UUIDString];

    long long v19 = sub_100041220(v18);
    unsigned __int8 v20 = [v4 getPayloadDataIntoFile:v19];

    if ((v20 & 1) == 0)
    {
      v21 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        sub_100044FFC(v21);
      }
    }
    [v6 setObject:v18 forKey:@"payload-id"];

    self = v22;
  }
  [(_MessageList *)self _enqueueMessageDict:v6];
  [(_MessageList *)self _persistMessageDictionaries];
}

- (BOOL)hasMessages
{
  return [(NSMutableArray *)self->_messageDictionaries count] != 0;
}

- (void)clearAllMessages
{
  id v3 = [(NSMutableArray *)self->_messageDictionaries count];
  [(_MessageList *)self clearMessageCount:v3];
}

- (void)clearMessageCount:(unint64_t)a3
{
  messageDictionaries = self->_messageDictionaries;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000413CC;
  v6[3] = &unk_100062588;
  v6[4] = a3;
  [(NSMutableArray *)messageDictionaries enumerateObjectsUsingBlock:v6];
  -[NSMutableArray removeObjectsInRange:](self->_messageDictionaries, "removeObjectsInRange:", 0, a3);
  [(_MessageList *)self _persistMessageDictionaries];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_messageDictionaries count];
}

- (id)messageEnumerator
{
  [(_MessageList *)self _ensureCoalescingSuspended];
  id v3 = objc_alloc_init(_MessageListEnumerator);
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100041564;
  v5[3] = &unk_1000625B0;
  v5[4] = self;
  v5[5] = v6;
  [(_MessageListEnumerator *)v3 setNextObjectBlock:v5];
  _Block_object_dispose(v6, 8);
  return v3;
}

- (id)firstMessage
{
  id v3 = [(NSMutableArray *)self->_messageDictionaries count];
  if (v3)
  {
    id v3 = [(_MessageList *)self _messageAtIndex:0];
  }
  return v3;
}

- (void)dequeueFirstMessage
{
  if ([(NSMutableArray *)self->_messageDictionaries count])
  {
    id v3 = [(NSMutableArray *)self->_messageDictionaries objectAtIndex:0];
    id v4 = [v3 objectForKey:@"payload-id"];
    if (v4)
    {
      v5 = +[NSFileManager defaultManager];
      v6 = sub_100041220(v4);
      [v5 removeItemAtPath:v6 error:0];
    }
    [(NSMutableArray *)self->_messageDictionaries removeObjectAtIndex:0];
  }
  [(_MessageList *)self _persistMessageDictionaries];
}

- (void)suspendCoalescing
{
  self->_coalescingSuspended = 1;
}

- (void)resumeCoalescing
{
  self->_coalescingSuspended = 0;
  id v3 = [(NSMutableArray *)self->_messageDictionaries copy];
  [(NSMutableArray *)self->_messageDictionaries removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[_MessageList _enqueueMessageDict:](self, "_enqueueMessageDict:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(_MessageList *)self _persistMessageDictionaries];
}

- (id)_messageAtIndex:(unint64_t)a3
{
  id v4 = [(NSMutableArray *)self->_messageDictionaries objectAtIndex:a3];
  id v5 = objc_alloc_init((Class)NTKDSyncMessage);
  objc_msgSend(v5, "setMessageType:", -[_MessageList _getMessageType:](self, "_getMessageType:", v4));
  id v6 = [(_MessageList *)self _getFaceUUID:v4];
  [v5 setFaceUUID:v6];

  uint64_t v7 = [(_MessageList *)self _getClientID:v4];
  [v5 setComplicationClientID:v7];

  uint64_t v8 = [(_MessageList *)self _getFamily:v4];
  [v5 setComplicationFamily:v8];

  long long v9 = [(_MessageList *)self _getComplicationDescriptor:v4];
  [v5 setComplicationDescriptor:v9];

  long long v10 = [(_MessageList *)self _getComplicationCollectionIdentifier:v4];
  [v5 setComplicationCollectionIdentifier:v10];

  long long v11 = [v4 objectForKey:@"payload-id"];
  long long v12 = v11;
  if (v11)
  {
    v13 = sub_100041220(v11);
    [v5 setPayloadDataFromFile:v13];
  }
  return v5;
}

- (void)_enqueueMessageDict:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (!self->_coalescingSuspended)
  {
    int64_t v5 = [(_MessageList *)self _getMessageType:v4];
    id v6 = [(_MessageList *)self _getFaceUUID:v11];
    uint64_t v7 = [(_MessageList *)self _getClientID:v11];
    uint64_t v8 = [(_MessageList *)self _getFamily:v11];
    long long v9 = [(_MessageList *)self _getComplicationDescriptor:v11];
    long long v10 = [(_MessageList *)self _getComplicationCollectionIdentifier:v11];
    [(_MessageList *)self _pruneMessagesMadeObsoleteByNewMessageOfType:v5 withFaceUUID:v6 clientID:v7 family:v8 complicationDescriptor:v9 complicationCollectionIdentifier:v10];

    id v4 = v11;
  }
  [(NSMutableArray *)self->_messageDictionaries addObject:v4];
}

- (void)_persistMessageDictionaries
{
  if (self->_persistencePath)
  {
    id v3 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
    messageDictionaries = self->_messageDictionaries;
    id v8 = 0;
    unsigned __int8 v5 = [(NSMutableArray *)messageDictionaries writeToURL:v3 error:&v8];
    id v6 = v8;
    if ((v5 & 1) == 0)
    {
      uint64_t v7 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_100045040((uint64_t)v6, v7);
      }
    }
  }
}

- (void)_pruneMessagesMadeObsoleteByNewMessageOfType:(int64_t)a3 withFaceUUID:(id)a4 clientID:(id)a5 family:(id)a6 complicationDescriptor:(id)a7 complicationCollectionIdentifier:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100041D48;
  v35[3] = &unk_1000625D8;
  id v40 = a8;
  int64_t v41 = a3;
  v35[4] = self;
  id v36 = v14;
  id v37 = v15;
  id v38 = v16;
  id v39 = v17;
  id v18 = v40;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  v23 = objc_retainBlock(v35);
  id v24 = +[NSMutableIndexSet indexSet];
  messageDictionaries = self->_messageDictionaries;
  v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472;
  v30 = sub_100041F14;
  v31 = &unk_100062600;
  id v33 = v24;
  id v34 = v23;
  v32 = self;
  id v26 = v24;
  v27 = v23;
  [(NSMutableArray *)messageDictionaries enumerateObjectsUsingBlock:&v28];
  -[NSMutableArray removeObjectsAtIndexes:](self->_messageDictionaries, "removeObjectsAtIndexes:", v26, v28, v29, v30, v31, v32);
}

- (int64_t)_getMessageType:(id)a3
{
  id v3 = [a3 objectForKey:@"message-type"];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)_getFaceUUID:(id)a3
{
  id v3 = [a3 objectForKey:@"face-uuid"];
  if (v3) {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_getClientID:(id)a3
{
  return [a3 objectForKey:@"complicaiton-clientID"];
}

- (id)_getFamily:(id)a3
{
  return [a3 objectForKey:@"complication-family"];
}

- (id)_getComplicationDescriptor:(id)a3
{
  id v3 = [a3 objectForKey:@"complication-descriptor"];
  if (v3) {
    id v4 = [objc_alloc((Class)CLKComplicationDescriptor) initWithJSONObjectRepresentation:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_getComplicationCollectionIdentifier:(id)a3
{
  return [a3 objectForKey:@"complication-collection-identifier"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDictionaries, 0);
  objc_storeStrong((id *)&self->_persistencePath, 0);
}

@end