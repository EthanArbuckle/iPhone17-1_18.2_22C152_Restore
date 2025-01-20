@interface _PushToPhoneHandlingTask
- (_PushToPhoneHandlingTask)initWithData:(id)a3 recordIdentifier:(id)a4;
- (void)performTask;
@end

@implementation _PushToPhoneHandlingTask

- (_PushToPhoneHandlingTask)initWithData:(id)a3 recordIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[SyncedBookmarkRepr alloc] initWithData:v6];
  if (v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)_PushToPhoneHandlingTask;
    v9 = [(NotificationHandlingTask *)&v14 initWithData:v6 recordIdentifier:v7];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_bookmark, v8);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = sub_1000A930C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "_PushToPhoneHandlingTask SyncedBookmarkRepr nil with data", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  [(NotificationHandlingTask *)self _clearBulletin];
  uint64_t v3 = [(SyncedBookmarkRepr *)self->_bookmark richMapsActivity];
  id v4 = (id)v3;
  if (v3) {
    [(RichMapsActivityCreatingTaskImpl *)self taskFinished:v3];
  }
  else {
    [(RichMapsActivityCreatingTaskImpl *)self taskFailed];
  }
}

- (void).cxx_destruct
{
}

@end