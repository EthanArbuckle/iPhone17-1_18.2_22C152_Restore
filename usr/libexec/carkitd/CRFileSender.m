@interface CRFileSender
- (BOOL)_chunkQueue_blockingSendChannelMessage:(id)a3;
- (BOOL)channelIsOpen;
- (BOOL)isPriority;
- (CARSessionChannelProviding)channel;
- (CRFileSender)initWithChannel:(id)a3 isPriority:(BOOL)a4;
- (OS_dispatch_queue)chunkQueue;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_semaphore)chunkQueueSendSlots;
- (id)_sendFileURL:(id)a3 withMetadata:(id)a4 completion:(id)a5;
- (id)currentAcceptCompletion;
- (id)sendLogArchive:(id)a3 completion:(id)a4;
- (id)sendThemeAsset:(id)a3 completion:(id)a4;
- (unint64_t)_internalQueue_chunkSizeForTransferWithPriority:(BOOL)a3;
- (unint64_t)internalQueueOutstandingSendCount;
- (void)_internalQueue_handleFileAcceptMessage:(id)a3;
- (void)_internalQueue_signalChunkQueue;
- (void)channel:(id)a3 didReceiveMessage:(id)a4;
- (void)didCloseChannel:(id)a3;
- (void)didSendMessageForChannel:(id)a3;
- (void)invalidate;
- (void)setChannelIsOpen:(BOOL)a3;
- (void)setCurrentAcceptCompletion:(id)a3;
- (void)setInternalQueueOutstandingSendCount:(unint64_t)a3;
- (void)setPriority:(BOOL)a3;
@end

@implementation CRFileSender

- (CRFileSender)initWithChannel:(id)a3 isPriority:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRFileSender;
  v8 = [(CRFileSender *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_channel, a3);
    v9->_priority = v4;
    if (v4) {
      dispatch_qos_class_t v10 = QOS_CLASS_USER_INITIATED;
    }
    else {
      dispatch_qos_class_t v10 = QOS_CLASS_BACKGROUND;
    }
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, v10, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.carkit.file_sending", v12);
    internalQueue = v9->_internalQueue;
    v9->_internalQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, v10, 0);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.carkit.file_sending_chunk", v16);
    chunkQueue = v9->_chunkQueue;
    v9->_chunkQueue = (OS_dispatch_queue *)v17;

    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    chunkQueueSendSlots = v9->_chunkQueueSendSlots;
    v9->_chunkQueueSendSlots = (OS_dispatch_semaphore *)v19;

    v9->_internalQueueOutstandingSendCount = 0;
    [v7 setChannelDelegate:v9];
    [v7 openChannel];
    v9->_channelIsOpen = 1;
  }

  return v9;
}

- (void)invalidate
{
  v3 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100070584();
  }

  BOOL v4 = [(CRFileSender *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015BC8;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (id)sendThemeAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 assetsArchiveURL];
  v9 = [v7 signatureData];
  dispatch_qos_class_t v10 = [v7 certificateData];
  v11 = [v7 accessoryAdditionsData];
  v12 = [v7 version];

  dispatch_queue_t v13 = [v12 accessoryContentVersion];

  if (v8 && v13)
  {
    v24[0] = @"payloadType";
    v24[1] = @"version";
    v25[0] = &off_1000C6040;
    v25[1] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    id v15 = [v14 mutableCopy];

    if (v10) {
      [v15 setObject:v10 forKey:@"certificate"];
    }
    if (v9) {
      [v15 setObject:v9 forKey:@"signature"];
    }
    if (v11) {
      [v15 setObject:v11 forKey:@"additions"];
    }
    v16 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "starting file transfer for cluster theme version %@", buf, 0xCu);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100015F24;
    v19[3] = &unk_1000BD5F0;
    v19[4] = self;
    id v20 = v13;
    id v21 = v6;
    dispatch_queue_t v17 = [(CRFileSender *)self _sendFileURL:v8 withMetadata:v15 completion:v19];
  }
  else
  {
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
    dispatch_queue_t v17 = 0;
  }

  return v17;
}

- (id)sendLogArchive:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v19 = @"payloadType";
  id v20 = &off_1000C6058;
  v8 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v9 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "starting file transfer for log archive %@", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000161DC;
  v14[3] = &unk_1000BD5F0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  v12 = [(CRFileSender *)self _sendFileURL:v11 withMetadata:v8 completion:v14];

  return v12;
}

- (unint64_t)_internalQueue_chunkSizeForTransferWithPriority:(BOOL)a3
{
  BOOL v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"TransferChunkSize", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  uint64_t v5 = 102400;
  if (v3) {
    uint64_t v5 = 204800;
  }
  if (AppIntegerValue <= 0 || keyExistsAndHasValidFormat == 0) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = AppIntegerValue;
  }
  v8 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "using chunk size of %lu", buf, 0xCu);
  }

  return v7;
}

- (id)_sendFileURL:(id)a3 withMetadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
  [v11 setTotalUnitCount:2];
  [v11 setCompletedUnitCount:0];
  unint64_t v12 = [(CRFileSender *)self internalQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100016540;
  v21[3] = &unk_1000BD6E0;
  id v22 = v8;
  id v27 = v10;
  id v13 = v11;
  id v23 = v13;
  v24 = self;
  id v25 = v12;
  id v26 = v9;
  id v14 = v9;
  id v15 = v12;
  id v16 = v10;
  id v17 = v8;
  dispatch_async(v15, v21);
  id v18 = v26;
  id v19 = v13;

  return v19;
}

- (BOOL)_chunkQueue_blockingSendChannelMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRFileSender *)self chunkQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v6 = [(CRFileSender *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000179EC;
  block[3] = &unk_1000BD708;
  block[4] = self;
  id v20 = &v26;
  id v7 = v4;
  id v19 = v7;
  id v21 = &v22;
  dispatch_sync(v6, block);

  if (*((unsigned char *)v23 + 24))
  {
    id v8 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "waiting on chunk to send", buf, 2u);
    }

    id v9 = [(CRFileSender *)self chunkQueueSendSlots];
    dispatch_time_t v10 = dispatch_time(0, 60000000000);
    intptr_t v11 = dispatch_semaphore_wait(v9, v10);

    if (v11)
    {
      unint64_t v12 = [(CRFileSender *)self internalQueue];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100017AF0;
      v16[3] = &unk_1000BD1B0;
      v16[4] = self;
      dispatch_sync(v12, v16);

      id v13 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100070850();
      }

      *((unsigned char *)v27 + 24) = 0;
    }
  }
  char v14 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (void)_internalQueue_signalChunkQueue
{
  BOOL v3 = [(CRFileSender *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(CRFileSender *)self internalQueueOutstandingSendCount];
  if ([(CRFileSender *)self internalQueueOutstandingSendCount]) {
    [(CRFileSender *)self setInternalQueueOutstandingSendCount:(char *)[(CRFileSender *)self internalQueueOutstandingSendCount] - 1];
  }
  if (v4 >= 3)
  {
    uint64_t v5 = [(CRFileSender *)self chunkQueueSendSlots];
    dispatch_semaphore_signal(v5);
  }
}

- (void)_internalQueue_handleFileAcceptMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRFileSender *)self internalQueue];
  dispatch_assert_queue_V2(v5);

  objc_opt_class();
  id v6 = [v4 objectForKey:@"accepted"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7)
  {
    id v8 = [v7 unsignedIntegerValue];
    id v9 = sub_10005C6FC(4uLL);
    dispatch_time_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100070958((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "file transfer was accepted", v25, 2u);
    }

    uint64_t v24 = [(CRFileSender *)self currentAcceptCompletion];
    id v17 = v24;
    if (v24) {
      (*(void (**)(uint64_t, BOOL))(v24 + 16))(v24, v8 == 0);
    }
  }
  else
  {
    id v17 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000708EC((uint64_t)v4, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (void)didSendMessageForChannel:(id)a3
{
  id v4 = [(CRFileSender *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017DF0;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)channel:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  id v6 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100070A04((uint64_t)v5, v6);
  }

  id v7 = [(CRFileSender *)self internalQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100017F28;
  v9[3] = &unk_1000BD3A8;
  id v10 = v5;
  uint64_t v11 = self;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)didCloseChannel:(id)a3
{
  id v4 = [(CRFileSender *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018210;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (CARSessionChannelProviding)channel
{
  return self->_channel;
}

- (BOOL)isPriority
{
  return self->_priority;
}

- (void)setPriority:(BOOL)a3
{
  self->_priority = a3;
}

- (BOOL)channelIsOpen
{
  return self->_channelIsOpen;
}

- (void)setChannelIsOpen:(BOOL)a3
{
  self->_channelIsOpen = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)chunkQueue
{
  return self->_chunkQueue;
}

- (OS_dispatch_semaphore)chunkQueueSendSlots
{
  return self->_chunkQueueSendSlots;
}

- (unint64_t)internalQueueOutstandingSendCount
{
  return self->_internalQueueOutstandingSendCount;
}

- (void)setInternalQueueOutstandingSendCount:(unint64_t)a3
{
  self->_internalQueueOutstandingSendCount = a3;
}

- (id)currentAcceptCompletion
{
  return self->_currentAcceptCompletion;
}

- (void)setCurrentAcceptCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentAcceptCompletion, 0);
  objc_storeStrong((id *)&self->_chunkQueueSendSlots, 0);
  objc_storeStrong((id *)&self->_chunkQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_channel, 0);
}

@end