@interface TCCDSyncSession
- (BOOL)didSendMessage;
- (OS_dispatch_semaphore)sentMessageSemaphore;
- (TCCDSyncController)syncController;
- (TCCDSyncRequestAccessAction)syncRequestAccessAction;
- (TCCDSyncSession)initWithSyncController:(id)a3;
- (unint64_t)performRequestAccessAction:(id)a3;
- (void)setDidSendMessage:(BOOL)a3;
- (void)setSentMessageSemaphore:(id)a3;
- (void)setSyncController:(id)a3;
- (void)setSyncRequestAccessAction:(id)a3;
@end

@implementation TCCDSyncSession

- (TCCDSyncSession)initWithSyncController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TCCDSyncSession;
  v5 = [(TCCDSyncSession *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_syncController, v4);
  }

  return v6;
}

- (unint64_t)performRequestAccessAction:(id)a3
{
  id v4 = a3;
  if ([(TCCDSyncSession *)self didSendMessage])
  {
    unint64_t v5 = 0;
  }
  else
  {
    v6 = [(TCCDSyncSession *)self syncController];
    v7 = [v6 messageController];

    if (v7)
    {
      objc_super v8 = [(TCCDSyncSession *)self syncRequestAccessAction];

      if (v8)
      {
        v9 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
          sub_1000594B8(v9);
        }
        unint64_t v5 = 1;
      }
      else
      {
        [(TCCDSyncSession *)self setSyncRequestAccessAction:v4];
        v11 = [(TCCDSyncSession *)self syncRequestAccessAction];
        v12 = [v11 idsMessageDictionary];

        uint64_t v21 = 0;
        v22 = &v21;
        uint64_t v23 = 0x2020000000;
        uint64_t v24 = 0;
        [(TCCDSyncSession *)self setDidSendMessage:1];
        dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
        [(TCCDSyncSession *)self setSentMessageSemaphore:v13];

        v14 = [(TCCDSyncSession *)self syncController];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100018758;
        v20[3] = &unk_100095278;
        v20[4] = self;
        v20[5] = &v21;
        [v14 setSyncSession:self accessDidUpdateHandler:v20];

        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10001883C;
        v19[3] = &unk_1000952A0;
        v19[4] = self;
        v19[5] = &v21;
        [v7 sendMessage:v12 ofType:@"TCCDSyncMessageTypeReplicaAccessRequestForService" handler:v19];
        v15 = [(TCCDSyncSession *)self sentMessageSemaphore];
        dispatch_time_t v16 = dispatch_time(0, 180000000000);
        dispatch_semaphore_wait(v15, v16);

        unint64_t v5 = v22[3];
        if (!v5)
        {
          v17 = [(TCCDSyncSession *)self syncController];
          [v17 removeAccessDidUpdateHandlerForSession:self];

          unint64_t v5 = 1;
          v22[3] = 1;
        }
        _Block_object_dispose(&v21, 8);
      }
    }
    else
    {
      v10 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_100059434(v10);
      }
      unint64_t v5 = 0;
    }
  }
  return v5;
}

- (TCCDSyncController)syncController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syncController);
  return (TCCDSyncController *)WeakRetained;
}

- (void)setSyncController:(id)a3
{
}

- (TCCDSyncRequestAccessAction)syncRequestAccessAction
{
  return (TCCDSyncRequestAccessAction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSyncRequestAccessAction:(id)a3
{
}

- (BOOL)didSendMessage
{
  return self->_didSendMessage;
}

- (void)setDidSendMessage:(BOOL)a3
{
  self->_didSendMessage = a3;
}

- (OS_dispatch_semaphore)sentMessageSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSentMessageSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentMessageSemaphore, 0);
  objc_storeStrong((id *)&self->_syncRequestAccessAction, 0);
  objc_destroyWeak((id *)&self->_syncController);
}

@end