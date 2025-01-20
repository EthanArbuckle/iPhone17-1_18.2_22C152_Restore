@interface SFNotificationProxy
- (OS_dispatch_queue)dispatchQueue;
- (SFNotificationProxy)init;
- (id)dismissedHandler;
- (id)externalID;
- (id)tappedHandler;
- (void)_requestPostOrUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5 canPost:(BOOL)a6;
- (void)handleNotificationWasDismissed:(id)a3 reason:(int64_t)a4;
- (void)handleNotificationWasTapped:(id)a3;
- (void)requestPostOrUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5;
- (void)requestRemove:(id)a3 withReason:(int64_t)a4;
- (void)requestRemoveAll;
- (void)requestUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5 canPostNotification:(BOOL)a6;
- (void)reset;
- (void)setDismissedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setTappedHandler:(id)a3;
@end

@implementation SFNotificationProxy

- (SFNotificationProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFNotificationProxy;
  v2 = [(SFNotificationProxy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_requestPostOrUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5 canPost:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v25 = a3;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  externalID = self->_externalID;
  if (externalID) {
    BOOL v13 = !v7;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (externalID)
    {
      internalIDs = self->_internalIDs;
      if (!internalIDs)
      {
        v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v16 = self->_internalIDs;
        self->_internalIDs = v15;

        internalIDs = self->_internalIDs;
      }
      if (([(NSMutableArray *)internalIDs containsObject:v25] & 1) == 0) {
        [(NSMutableArray *)self->_internalIDs addObject:v25];
      }
      uint64_t v17 = [(SFNotificationProxy *)self externalID];
      if (!v17) {
        goto LABEL_37;
      }
      v18 = (void *)v17;
      if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        v24 = v18;
        LogPrintF();
      }
      v23 = +[SDNotificationManager sharedManager];
      [v23 homePodHandoffUpdateIfNeeded:v18 info:v11];
    }
    else
    {
      if (!v6)
      {
        if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
          goto LABEL_17;
        }
        goto LABEL_37;
      }
      v19 = self->_internalIDs;
      if (!v19)
      {
        v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v21 = self->_internalIDs;
        self->_internalIDs = v20;

        v19 = self->_internalIDs;
      }
      [(NSMutableArray *)v19 addObject:v25];
      uint64_t v22 = [(SFNotificationProxy *)self externalID];
      if (!v22) {
        goto LABEL_37;
      }
      v18 = (void *)v22;
      if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
      {
        v24 = v18;
        LogPrintF();
      }
      v23 = +[SDNotificationManager sharedManager];
      [v23 homePodHandoffPostIfNeeded:v18 info:v11];
    }

    self->_showingMedium = v7;
    objc_storeStrong((id *)&self->_triggeredID, a3);

    goto LABEL_37;
  }
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
LABEL_17:
  }
    LogPrintF();
LABEL_37:
}

- (void)requestPostOrUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5
{
}

- (void)requestRemove:(id)a3 withReason:(int64_t)a4
{
  id v25 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(NSMutableArray *)self->_internalIDs containsObject:v25])
  {
    BOOL v6 = self->_externalID;
    if (!v6)
    {
      if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_44;
    }
    if (self->_showingMedium) {
      goto LABEL_4;
    }
    triggeredID = self->_triggeredID;
    BOOL v13 = (NSString *)v25;
    v14 = triggeredID;
    if (v14 == v13)
    {
    }
    else
    {
      v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        goto LABEL_33;
      }
      unsigned __int8 v16 = [(NSString *)v13 isEqual:v14];

      if ((v16 & 1) == 0)
      {
LABEL_33:
        if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize()))
        {
          v24 = v13;
          LogPrintF();
        }
        -[NSMutableArray removeObject:](self->_internalIDs, "removeObject:", v13, v24);
        id v23 = objc_retainBlock(self->_dismissedHandler);
        uint64_t v22 = v23;
        if (v23) {
          (*((void (**)(id, NSString *, int64_t))v23 + 2))(v23, v13, a4);
        }
        goto LABEL_43;
      }
    }
    if (self->_showingMedium) {
      goto LABEL_4;
    }
    uint64_t v17 = self->_triggeredID;
    v18 = v13;
    v19 = v17;
    if (v19 == v18)
    {
    }
    else
    {
      v20 = v19;
      if ((v18 == 0) == (v19 != 0))
      {

        goto LABEL_50;
      }
      unsigned int v21 = [(NSString *)v18 isEqual:v19];

      if (!v21)
      {
LABEL_50:
        if (!self->_showingMedium) {
          goto LABEL_44;
        }
LABEL_4:
        BOOL v7 = self->_triggeredID;
        v8 = (NSString *)v25;
        v9 = v7;
        if (v9 == v8)
        {
        }
        else
        {
          v10 = v9;
          if ((v8 == 0) == (v9 != 0))
          {

            goto LABEL_44;
          }
          unsigned int v11 = [(NSString *)v8 isEqual:v9];

          if (!v11) {
            goto LABEL_44;
          }
        }
        if ([(NSMutableArray *)self->_internalIDs count] == (id)1) {
          goto LABEL_22;
        }
LABEL_44:

        goto LABEL_45;
      }
    }
LABEL_22:
    if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v22 = +[SDNotificationManager sharedManager];
    [v22 homePodHandoffRemove:v6 reason:a4];
LABEL_43:

    goto LABEL_44;
  }
  if (dword_100966E40 <= 90 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_45:
}

- (void)requestRemoveAll
{
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v3 = +[SDNotificationManager sharedManager];
  [v3 homePodHandoffRemoveAll];

  [(SFNotificationProxy *)self reset];
}

- (void)requestUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5 canPostNotification:(BOOL)a6
{
}

- (void)handleNotificationWasTapped:(id)a3
{
  id v4 = a3;
  v5 = v4;
  externalID = self->_externalID;
  id v14 = v4;
  if (externalID)
  {
    BOOL v7 = (NSString *)v4;
    v8 = externalID;
    if (v8 == v7)
    {

      goto LABEL_7;
    }
    v9 = v8;
    if (v7)
    {
      unsigned __int8 v10 = [(NSString *)v7 isEqual:v8];

      v5 = v14;
      if ((v10 & 1) == 0) {
        goto LABEL_11;
      }
LABEL_7:
      if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v12 = (void (**)(id, id))objc_retainBlock(self->_tappedHandler);
      if (v12)
      {
        id v13 = [(NSMutableArray *)self->_internalIDs copy];
        v12[2](v12, v13);
      }
      [(SFNotificationProxy *)self reset];
      goto LABEL_20;
    }

    v5 = v14;
  }
LABEL_11:
  if (dword_100966E40 <= 90)
  {
    if (dword_100966E40 != -1 || (int v11 = _LogCategory_Initialize(), v5 = v14, v11))
    {
      LogPrintF();
LABEL_20:
      v5 = v14;
    }
  }
}

- (void)handleNotificationWasDismissed:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v7 = (void (**)(id, void, int64_t))objc_retainBlock(self->_dismissedHandler);
  if (v7)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = self->_internalIDs;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          v7[2](v7, *(void *)(*((void *)&v13 + 1) + 8 * i), a4);
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
  [(SFNotificationProxy *)self reset];
}

- (id)externalID
{
  externalID = self->_externalID;
  if (!externalID)
  {
    id v4 = +[NSUUID UUID];
    v5 = [v4 UUIDString];
    id v6 = self->_externalID;
    self->_externalID = v5;

    externalID = self->_externalID;
  }

  return externalID;
}

- (void)reset
{
  if (dword_100966E40 <= 30 && (dword_100966E40 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(NSMutableArray *)self->_internalIDs removeAllObjects];
  internalIDs = self->_internalIDs;
  self->_internalIDs = 0;

  externalID = self->_externalID;
  self->_externalID = 0;

  self->_showingMedium = 0;
  triggeredID = self->_triggeredID;
  self->_triggeredID = 0;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)dismissedHandler
{
  return self->_dismissedHandler;
}

- (void)setDismissedHandler:(id)a3
{
}

- (id)tappedHandler
{
  return self->_tappedHandler;
}

- (void)setTappedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tappedHandler, 0);
  objc_storeStrong(&self->_dismissedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_triggeredID, 0);
  objc_storeStrong((id *)&self->_internalIDs, 0);

  objc_storeStrong((id *)&self->_externalID, 0);
}

@end