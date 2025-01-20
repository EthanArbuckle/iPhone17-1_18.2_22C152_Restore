@interface MailMessageChangeSet
- (BOOL)commit;
- (MCSMessageOperation)operation;
- (MailMessageChangeSet)initWithMessages:(id)a3 operation:(id)a4;
- (MailMessageChangeSet)initWithMessages:(id)a3 unreadMessages:(id)a4 readMessages:(id)a5 flaggedMessages:(id)a6 unflaggedMessages:(id)a7 operation:(id)a8;
- (id)accounts;
- (id)applyPendingChangeToObjects:(id)a3;
- (id)description;
- (id)localizedErrorDescription;
- (id)localizedErrorTitle;
- (id)messagesSet;
- (id)stores;
- (void)_populateMessageSets;
- (void)_setMessages:(id)a3;
@end

@implementation MailMessageChangeSet

- (MailMessageChangeSet)initWithMessages:(id)a3 operation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[MailMessageChangeSet initWithMessages:operation:]", "MailMessageChangeSet.m", 29, "[messages isKindOfClass:[NSSet class]]");
  }
  v11.receiver = self;
  v11.super_class = (Class)MailMessageChangeSet;
  v8 = [(MailMessageChangeSet *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MailMessageChangeSet *)v8 _setMessages:v6];
    objc_storeStrong((id *)&v9->_operation, a4);
    [(MailMessageChangeSet *)v9 _populateMessageSets];
    *((unsigned char *)&v9->super + 16) |= 1u;
  }

  return v9;
}

- (MailMessageChangeSet)initWithMessages:(id)a3 unreadMessages:(id)a4 readMessages:(id)a5 flaggedMessages:(id)a6 unflaggedMessages:(id)a7 operation:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[MailMessageChangeSet initWithMessages:unreadMessages:readMessages:flaggedMessages:unflaggedMessages:operation:]", "MailMessageChangeSet.m", 44, "[messages isKindOfClass:[NSSet class]]");
  }
  v31.receiver = self;
  v31.super_class = (Class)MailMessageChangeSet;
  v20 = [(MailMessageChangeSet *)&v31 init];
  v21 = v20;
  if (v20)
  {
    [(MailMessageChangeSet *)v20 _setMessages:v14];
    objc_storeStrong((id *)&v21->_operation, a8);
    v22 = (NSSet *)[v15 copy];
    messagesMarkedUnread = v21->_messagesMarkedUnread;
    v21->_messagesMarkedUnread = v22;

    v24 = (NSSet *)[v16 copy];
    messagesMarkedRead = v21->_messagesMarkedRead;
    v21->_messagesMarkedRead = v24;

    v26 = (NSSet *)[v17 copy];
    messagesFlagged = v21->_messagesFlagged;
    v21->_messagesFlagged = v26;

    v28 = (NSSet *)[v18 copy];
    messagesUnflagged = v21->_messagesUnflagged;
    v21->_messagesUnflagged = v28;

    *((unsigned char *)&v21->super + 16) |= 1u;
  }

  return v21;
}

- (void)_setMessages:(id)a3
{
  v4 = (NSSet *)a3;
  v5 = v4;
  if (self->_messagesSet != v4)
  {
    id v6 = (NSSet *)[(NSSet *)v4 copy];
    messagesSet = self->_messagesSet;
    self->_messagesSet = v6;

    v8 = objc_alloc_init(MessageToMailboxUidCache);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = v5;
    id v10 = [(NSSet *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "canBeTriaged", (void)v16))
          {
            id v14 = [(MessageToMailboxUidCache *)v8 mailboxForMessage:v13];
            id v15 = [v14 store];
            [v13 setMessageStore:v15];
          }
        }
        id v10 = [(NSSet *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (id)localizedErrorDescription
{
  operation = self->_operation;
  NSUInteger v3 = [(NSSet *)self->_messagesSet count];

  return [(MCSMessageOperation *)operation localizedErrorDescriptionForMessageCount:v3];
}

- (id)localizedErrorTitle
{
  operation = self->_operation;
  NSUInteger v3 = [(NSSet *)self->_messagesSet count];

  return [(MCSMessageOperation *)operation localizedErrorTitleForMessageCount:v3];
}

- (void)_populateMessageSets
{
  messagesMarkedRead = self->_messagesMarkedRead;
  self->_messagesMarkedRead = 0;

  messagesMarkedUnread = self->_messagesMarkedUnread;
  self->_messagesMarkedUnread = 0;

  if ([(MCSMessageOperation *)self->_operation willMarkRead])
  {
    v5 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v6 = self->_messagesSet;
    id v7 = [(NSSet *)v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v46;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (([v10 messageFlags] & 1) == 0) {
            [(NSSet *)v5 addObject:v10];
          }
        }
        id v7 = [(NSSet *)v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
      }
      while (v7);
    }

    uint64_t v11 = self->_messagesMarkedRead;
    self->_messagesMarkedRead = v5;
  }
  else
  {
    if (![(MCSMessageOperation *)self->_operation willMarkUnread]) {
      goto LABEL_24;
    }
    v12 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v13 = self->_messagesSet;
    id v14 = [(NSSet *)v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v42;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(v13);
          }
          long long v17 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
          if ([v17 messageFlags]) {
            [(NSSet *)v12 addObject:v17];
          }
        }
        id v14 = [(NSSet *)v13 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v14);
    }

    uint64_t v11 = self->_messagesMarkedUnread;
    self->_messagesMarkedUnread = v12;
  }

LABEL_24:
  messagesUnflagged = self->_messagesUnflagged;
  self->_messagesUnflagged = 0;

  messagesFlagged = self->_messagesFlagged;
  self->_messagesFlagged = 0;

  if ([(MCSMessageOperation *)self->_operation willUnflag])
  {
    v20 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v21 = self->_messagesSet;
    id v22 = [(NSSet *)v21 countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v38;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v37 + 1) + 8 * (void)k);
          if (([v25 messageFlags] & 0x10) != 0) {
            [(NSSet *)v20 addObject:v25];
          }
        }
        id v22 = [(NSSet *)v21 countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v22);
    }

    v26 = self->_messagesUnflagged;
    self->_messagesUnflagged = v20;
  }
  else
  {
    if (![(MCSMessageOperation *)self->_operation willFlag]) {
      return;
    }
    v27 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v28 = self->_messagesSet;
    id v29 = [(NSSet *)v28 countByEnumeratingWithState:&v33 objects:v49 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v34;
      do
      {
        for (m = 0; m != v29; m = (char *)m + 1)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = *(void **)(*((void *)&v33 + 1) + 8 * (void)m);
          if ((objc_msgSend(v32, "messageFlags", (void)v33) & 0x10) == 0) {
            [(NSSet *)v27 addObject:v32];
          }
        }
        id v29 = [(NSSet *)v28 countByEnumeratingWithState:&v33 objects:v49 count:16];
      }
      while (v29);
    }

    v26 = self->_messagesFlagged;
    self->_messagesFlagged = v27;
  }
}

- (id)messagesSet
{
  return self->_messagesSet;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  id v4 = a3;
  if (![(MCSChange *)self isFinalized]) {
    __assert_rtn("-[MailMessageChangeSet applyPendingChangeToObjects:]", "MailMessageChangeSet.m", 136, "[self isFinalized]");
  }
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[NSSet containsObject:](self->_messagesSet, "containsObject:", v10, (void)v13)) {
          [v5 addObject:v10];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [(MCSOperation *)self->_operation applyPendingChangeToObjects:v5];

  return v11;
}

- (BOOL)commit
{
  if (![(MCSChange *)self isFinalized]) {
    sub_10045ABEC();
  }
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v4 = objc_alloc_init((Class)NSMutableSet);
  BOOL v5 = [(MCSMessageOperation *)self->_operation commitToMessages:self->_messagesSet failures:v3 newMessages:v4];
  if ([v4 count]) {
    [(MailMessageChangeSet *)self _setMessages:v4];
  }
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412802;
    v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v5;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#ChangeSetActions Committed %@ with result %d (%@)", (uint8_t *)&v8, 0x1Cu);
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@ => %lu messages", self->_operation, [(NSSet *)self->_messagesSet count]];
}

- (id)stores
{
  if (![(MCSChange *)self isFinalized]) {
    sub_10045AC18();
  }
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_messagesSet;
  id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) messageStore:v10];
        if (v8) {
          [v3 addObject:v8];
        }
      }
      id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)accounts
{
  if (![(MCSChange *)self isFinalized]) {
    sub_10045AC44();
  }
  id v3 = +[NSMutableSet set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(MailMessageChangeSet *)self stores];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) account];
        if (v8) {
          [v3 addObject:v8];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (MCSMessageOperation)operation
{
  return (MCSMessageOperation *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_messagesFlagged, 0);
  objc_storeStrong((id *)&self->_messagesUnflagged, 0);
  objc_storeStrong((id *)&self->_messagesMarkedUnread, 0);
  objc_storeStrong((id *)&self->_messagesMarkedRead, 0);

  objc_storeStrong((id *)&self->_messagesSet, 0);
}

@end