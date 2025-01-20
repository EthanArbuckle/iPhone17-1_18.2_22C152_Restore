@interface MSDPairedWatchProxy
+ (id)sharedInstance;
- (BOOL)_sendIDSRequestMessageOfType:(unsigned __int16)a3 withPayload:(id)a4;
- (BOOL)canLockSnapshot;
- (BOOL)canRevertSnapshot;
- (BOOL)canUnenrollWithObliteration:(BOOL)a3;
- (BOOL)canUnlockSnapshot;
- (BOOL)canUpdateContent;
- (BOOL)cancelOperation;
- (BOOL)lockSnapshot;
- (BOOL)reboot;
- (BOOL)revertSnapshot;
- (BOOL)signalContentUpdateCompletion:(BOOL)a3 andError:(id)a4;
- (BOOL)unenrollWithObliteration:(BOOL)a3 callUnregister:(BOOL)a4;
- (BOOL)unlockSnapshot;
- (BOOL)updateContentWithDeadline:(int)a3;
- (MSDCompanionIDSHandler)idsHandler;
- (MSDPairedWatchProxy)init;
- (PSYSyncSessionObserver)syncSessionObserver;
- (unsigned)syncState;
- (void)_updateSyncStatusFromSyncSession:(id)a3;
- (void)bootstrap;
- (void)setIdsHandler:(id)a3;
- (void)setSyncSessionObserver:(id)a3;
- (void)setSyncState:(unsigned __int8)a3;
- (void)syncSessionObserver:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4;
- (void)syncSessionObserver:(id)a3 receivedSyncSession:(id)a4;
@end

@implementation MSDPairedWatchProxy

+ (id)sharedInstance
{
  if (qword_100189918 != -1) {
    dispatch_once(&qword_100189918, &stru_1001524B0);
  }
  v2 = (void *)qword_100189910;

  return v2;
}

- (MSDPairedWatchProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDPairedWatchProxy;
  v2 = [(MSDPairedDeviceProxy *)&v5 init];
  if (v2)
  {
    v3 = [(MSDIDSHandler *)[MSDCompanionIDSHandler alloc] initWithDelegate:v2];
    [(MSDPairedWatchProxy *)v2 setIdsHandler:v3];
  }
  return v2;
}

- (void)bootstrap
{
  v7.receiver = self;
  v7.super_class = (Class)MSDPairedWatchProxy;
  [(MSDPairedDeviceProxy *)&v7 bootstrap];
  v3 = [(MSDPairedWatchProxy *)self idsHandler];
  [v3 start];

  [(MSDPairedWatchProxy *)self setSyncState:0];
  id v4 = objc_alloc_init((Class)PSYSyncSessionObserver);
  [(MSDPairedWatchProxy *)self setSyncSessionObserver:v4];

  objc_super v5 = [(MSDPairedWatchProxy *)self syncSessionObserver];
  [v5 setDelegate:self];

  v6 = [(MSDPairedWatchProxy *)self syncSessionObserver];
  [v6 startObservingSyncSessionsWithCompletion:&stru_1001524F0];
}

- (BOOL)canUpdateContent
{
  CFStringRef v5 = @"ForDryRun";
  v6 = &__kCFBooleanTrue;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  LOBYTE(self) = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:0 withPayload:v3];

  return (char)self;
}

- (BOOL)canLockSnapshot
{
  v5[0] = @"SnapshotAction";
  v5[1] = @"ForDryRun";
  v6[0] = &off_100162030;
  v6[1] = &__kCFBooleanTrue;
  v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  LOBYTE(self) = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:1 withPayload:v3];

  return (char)self;
}

- (BOOL)canUnlockSnapshot
{
  v5[0] = @"SnapshotAction";
  v5[1] = @"ForDryRun";
  v6[0] = &off_100162048;
  v6[1] = &__kCFBooleanTrue;
  v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  LOBYTE(self) = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:1 withPayload:v3];

  return (char)self;
}

- (BOOL)canRevertSnapshot
{
  v5[0] = @"SnapshotAction";
  v5[1] = @"ForDryRun";
  v6[0] = &off_100162060;
  v6[1] = &__kCFBooleanTrue;
  v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  LOBYTE(self) = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:1 withPayload:v3];

  return (char)self;
}

- (BOOL)canUnenrollWithObliteration:(BOOL)a3
{
  v7[0] = @"ForDryRun";
  v7[1] = @"WithObliteration";
  v8[0] = &__kCFBooleanTrue;
  id v4 = +[NSNumber numberWithBool:a3];
  v8[1] = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  LOBYTE(self) = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:3 withPayload:v5];
  return (char)self;
}

- (BOOL)updateContentWithDeadline:(int)a3
{
  CFStringRef v7 = @"CompleteBy";
  id v4 = +[NSNumber numberWithInt:*(void *)&a3];
  v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  LOBYTE(self) = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:0 withPayload:v5];
  return (char)self;
}

- (BOOL)lockSnapshot
{
  CFStringRef v5 = @"SnapshotAction";
  v6 = &off_100162030;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  LOBYTE(self) = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:1 withPayload:v3];

  return (char)self;
}

- (BOOL)unlockSnapshot
{
  CFStringRef v5 = @"SnapshotAction";
  v6 = &off_100162048;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  LOBYTE(self) = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:1 withPayload:v3];

  return (char)self;
}

- (BOOL)revertSnapshot
{
  CFStringRef v5 = @"SnapshotAction";
  v6 = &off_100162060;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  LOBYTE(self) = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:1 withPayload:v3];

  return (char)self;
}

- (BOOL)reboot
{
  return [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:2 withPayload:0];
}

- (BOOL)unenrollWithObliteration:(BOOL)a3 callUnregister:(BOOL)a4
{
  BOOL v4 = a4;
  v10[0] = @"WithObliteration";
  v6 = +[NSNumber numberWithBool:a3];
  v11[0] = v6;
  v10[1] = @"CallUnregister";
  CFStringRef v7 = +[NSNumber numberWithBool:v4];
  v11[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  LOBYTE(v7) = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:3 withPayload:v8];
  return (char)v7;
}

- (BOOL)cancelOperation
{
  return [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:4 withPayload:0];
}

- (BOOL)signalContentUpdateCompletion:(BOOL)a3 andError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = +[NSNumber numberWithBool:v4];
  [v7 setObject:v8 forKey:@"ContentUpdateCompleted"];

  if (v6)
  {
    v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    [v7 setObject:v9 forKey:@"ErrorCode"];

    v10 = [v6 localizedDescription];
    [v7 setObject:v10 forKey:@"ErrorMessage"];
  }
  BOOL v11 = [(MSDPairedWatchProxy *)self _sendIDSRequestMessageOfType:0 withPayload:v7];

  return v11;
}

- (void)syncSessionObserver:(id)a3 receivedSyncSession:(id)a4
{
}

- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4
{
  [a4 updatedSession:a3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(MSDPairedWatchProxy *)self _updateSyncStatusFromSyncSession:v5];
}

- (void)syncSessionObserver:(id)a3 didInvalidateSyncSession:(id)a4
{
}

- (void)_updateSyncStatusFromSyncSession:(id)a3
{
  id v4 = a3;
  if ([v4 syncSessionType] != (id)1)
  {
    id v5 = [v4 syncSessionState];
    id v6 = [v4 syncSessionType];
    id v7 = NSStringfromPSYSyncSessionType();
    if (v5 == (id)2)
    {
      if ([(MSDPairedWatchProxy *)self syncState] == 2) {
        goto LABEL_18;
      }
      [(MSDPairedWatchProxy *)self setSyncState:2];
      v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Paired device sync just completed! Type: %{public}@", (uint8_t *)&v13, 0xCu);
      }

      v10 = +[MSDTargetDevice sharedInstance];
      [v10 setWaitingForCommand:1];

      if (v6) {
        goto LABEL_18;
      }
      BOOL v11 = +[MSDProgressUpdater sharedInstance];
      [v11 updateStage:100];

      v8 = +[MSDUIHelper sharedInstance];
      [v8 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];
    }
    else if (v5 == (id)1)
    {
      if ([(MSDPairedWatchProxy *)self syncState] == 1)
      {
LABEL_18:

        goto LABEL_19;
      }
      [(MSDPairedWatchProxy *)self setSyncState:1];
      v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Paired device sync has started! Type: %{public}@", (uint8_t *)&v13, 0xCu);
      }

      v8 = +[MSDProgressUpdater sharedInstance];
      [v8 updateStage:32];
    }
    else
    {
      if (v5 || ![(MSDPairedWatchProxy *)self syncState]) {
        goto LABEL_18;
      }
      [(MSDPairedWatchProxy *)self setSyncState:0];
      v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Paired device sync is inactive! Type: %{public}@", (uint8_t *)&v13, 0xCu);
      }
    }

    goto LABEL_18;
  }
LABEL_19:
}

- (BOOL)_sendIDSRequestMessageOfType:(unsigned __int16)a3 withPayload:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v8 = [(MSDPairedWatchProxy *)self idsHandler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003171C;
  v13[3] = &unk_100152518;
  v15 = &v16;
  v9 = v7;
  v14 = v9;
  LOBYTE(v4) = [v8 sendRequestMessageOfType:v4 withPayload:v6 andResponseHandler:v13];

  if ((v4 & 1) == 0)
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000CADDC(v12);
    }
    goto LABEL_9;
  }
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (!*((unsigned char *)v17 + 24))
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000CAD98(v12);
    }
LABEL_9:

    BOOL v10 = 0;
    goto LABEL_4;
  }
  BOOL v10 = 1;
LABEL_4:

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (MSDCompanionIDSHandler)idsHandler
{
  return self->_idsHandler;
}

- (void)setIdsHandler:(id)a3
{
}

- (unsigned)syncState
{
  return self->_syncState;
}

- (void)setSyncState:(unsigned __int8)a3
{
  self->_syncState = a3;
}

- (PSYSyncSessionObserver)syncSessionObserver
{
  return self->_syncSessionObserver;
}

- (void)setSyncSessionObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncSessionObserver, 0);

  objc_storeStrong((id *)&self->_idsHandler, 0);
}

@end