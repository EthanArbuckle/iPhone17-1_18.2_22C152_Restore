@interface CRFileReceiver
- (BOOL)channelIsOpen;
- (CARSessionChannelProviding)channel;
- (CRFileReceiver)initWithChannel:(id)a3;
- (CRLogArchiveReceiving)logArchiveReceiver;
- (CRStatisticsStreamReceiving)statisticsReceiver;
- (CRThemeAssetReceiving)themeAssetReceiver;
- (NSMutableDictionary)logArchiveWritersForSessionIDs;
- (NSMutableDictionary)themeWritersForSessionIDs;
- (OS_dispatch_queue)fileQueue;
- (void)_fileQueue_handleFileHeaderMessage:(id)a3;
- (void)_fileQueue_handleFilePayloadMessage:(id)a3;
- (void)_fileQueue_handleStreamPayloadMessage:(id)a3;
- (void)_fileQueue_sendFileAcceptMessageWithStatus:(int)a3;
- (void)_fileQueue_setupLogArchiveWriterForSessionID:(id)a3 chunkCount:(id)a4 message:(id)a5;
- (void)_fileQueue_setupThemeWriterForSessionID:(id)a3 chunkCount:(id)a4 message:(id)a5;
- (void)channel:(id)a3 didReceiveMessage:(id)a4;
- (void)didCloseChannel:(id)a3;
- (void)invalidate;
- (void)requestLogArchive;
- (void)requestStartStatisticsOnInterval:(unint64_t)a3;
- (void)setChannelIsOpen:(BOOL)a3;
- (void)setLogArchiveReceiver:(id)a3;
- (void)setStatisticsReceiver:(id)a3;
- (void)setThemeAssetReceiver:(id)a3;
@end

@implementation CRFileReceiver

- (CRFileReceiver)initWithChannel:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRFileReceiver;
  v6 = [(CRFileReceiver *)&v17 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_channel, a3);
  v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.carkit.file_receiving", v8);
  fileQueue = v7->_fileQueue;
  v7->_fileQueue = (OS_dispatch_queue *)v9;

  [v5 setChannelDelegate:v7];
  v11 = 0;
  if ([v5 openChannel])
  {
    v7->_channelIsOpen = 1;
    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    themeWritersForSessionIDs = v7->_themeWritersForSessionIDs;
    v7->_themeWritersForSessionIDs = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    logArchiveWritersForSessionIDs = v7->_logArchiveWritersForSessionIDs;
    v7->_logArchiveWritersForSessionIDs = v14;

LABEL_4:
    v11 = v7;
  }

  return v11;
}

- (void)requestLogArchive
{
  v3 = [(CRFileReceiver *)self fileQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000692F0;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)requestStartStatisticsOnInterval:(unint64_t)a3
{
  id v5 = [(CRFileReceiver *)self fileQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006953C;
  v6[3] = &unk_1000BE388;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)invalidate
{
  v3 = [(CRFileReceiver *)self fileQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000697B0;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)channel:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  v6 = [(CRFileReceiver *)self fileQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000698EC;
  v8[3] = &unk_1000BD3A8;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)didCloseChannel:(id)a3
{
  v4 = [(CRFileReceiver *)self fileQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069BA4;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_fileQueue_handleFileHeaderMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CRFileReceiver *)self fileQueue];
  dispatch_assert_queue_V2(v5);

  objc_opt_class();
  id v6 = [v4 objectForKey:@"payloadType"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7)
  {
    objc_opt_class();
    id v8 = [v4 objectForKey:@"sessionID"];
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    if (v9)
    {
      objc_opt_class();
      id v10 = [v4 objectForKey:@"chunkCount"];
      if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }

      if (v11)
      {
        id v12 = [v7 unsignedIntegerValue];
        if (v12 == (id)2)
        {
          v15 = [(CRFileReceiver *)self logArchiveReceiver];

          if (v15) {
            [(CRFileReceiver *)self _fileQueue_setupLogArchiveWriterForSessionID:v9 chunkCount:v11 message:v4];
          }
        }
        else if (v12 == (id)1)
        {
          v13 = [(CRFileReceiver *)self themeAssetReceiver];

          if (v13) {
            [(CRFileReceiver *)self _fileQueue_setupThemeWriterForSessionID:v9 chunkCount:v11 message:v4];
          }
        }
      }
      else
      {
        v14 = sub_10005C6FC(4uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100076C7C();
        }
      }
    }
    else
    {
      v11 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100076C14();
      }
    }
  }
  else
  {
    id v9 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100076BAC();
    }
  }
}

- (void)_fileQueue_handleFilePayloadMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CRFileReceiver *)self fileQueue];
  dispatch_assert_queue_V2(v5);

  objc_opt_class();
  id v6 = [v4 objectForKey:@"sessionID"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7)
  {
    objc_opt_class();
    id v8 = [v4 objectForKey:@"data"];
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    objc_opt_class();
    id v10 = [v4 objectForKey:@"chunkIndex"];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (!v9 || !v11)
    {
      v14 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100076CE4();
      }
      goto LABEL_43;
    }
    id v12 = [(CRFileReceiver *)self themeAssetReceiver];

    if (!v12
      || ([(CRFileReceiver *)self themeWritersForSessionIDs],
          v13 = objc_claimAutoreleasedReturnValue(),
          [v13 objectForKey:v7],
          v14 = objc_claimAutoreleasedReturnValue(),
          v13,
          !v14))
    {
      v24 = [(CRFileReceiver *)self logArchiveReceiver];

      if (!v24) {
        goto LABEL_44;
      }
      v25 = [(CRFileReceiver *)self logArchiveWritersForSessionIDs];
      v14 = [v25 objectForKey:v7];

      if (!v14) {
        goto LABEL_44;
      }
      if ([v14 saveData:v9 forIndex:v11])
      {
        if (![v14 hasAllChunks])
        {
LABEL_43:

LABEL_44:
          goto LABEL_45;
        }
        v26 = sub_10005C6FC(4uLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v33 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "saved all log archive chunks!", v33, 2u);
        }

        v27 = [(CRFileReceiver *)self logArchiveReceiver];
        char v28 = objc_opt_respondsToSelector();

        if (v28)
        {
          v29 = [(CRFileReceiver *)self logArchiveReceiver];
          v30 = [v14 fileURL];
          [v29 fileReceiverSession:self didSaveLogsAtURL:v30];
        }
        v31 = self;
        uint64_t v32 = 0;
      }
      else
      {
        v31 = self;
        uint64_t v32 = 5;
      }
      [(CRFileReceiver *)v31 _fileQueue_sendFileAcceptMessageWithStatus:v32];
      goto LABEL_43;
    }
    v15 = [v14 assetArchiveWriter];
    if ([v15 saveData:v9 forIndex:v11])
    {
      if (![v15 hasAllChunks])
      {
LABEL_40:

        goto LABEL_43;
      }
      v16 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "saved all theme asset chunks!", buf, 2u);
      }

      objc_super v17 = [(CRFileReceiver *)self themeAssetReceiver];
      char v18 = objc_opt_respondsToSelector();

      if (v18)
      {
        v19 = [(CRFileReceiver *)self themeAssetReceiver];
        v20 = [v14 version];
        v21 = [v14 assetURL];
        [v19 fileReceiver:self didSaveThemeAssetOfVersion:v20 atURL:v21];
      }
      v22 = self;
      uint64_t v23 = 0;
    }
    else
    {
      v22 = self;
      uint64_t v23 = 5;
    }
    [(CRFileReceiver *)v22 _fileQueue_sendFileAcceptMessageWithStatus:v23];
    goto LABEL_40;
  }
  id v9 = sub_10005C6FC(4uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100076C14();
  }
LABEL_45:
}

- (void)_fileQueue_handleStreamPayloadMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CRFileReceiver *)self fileQueue];
  dispatch_assert_queue_V2(v5);

  objc_opt_class();
  id v6 = [v4 objectForKey:@"payloadType"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7)
  {
    if ([v7 unsignedIntegerValue] == (id)3)
    {
      objc_opt_class();
      id v8 = [v4 objectForKey:@"data"];
      if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      if (v9)
      {
        id v10 = [(CRFileReceiver *)self statisticsReceiver];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          id v12 = [(CRFileReceiver *)self statisticsReceiver];
          [v12 fileReceiver:self didReceiveStatistics:v9];
        }
      }
      else
      {
        v13 = sub_10005C6FC(4uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100076DB4();
        }
      }
    }
    else
    {
      id v9 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100076E1C();
      }
    }
  }
  else
  {
    id v9 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100076D4C();
    }
  }
}

- (void)_fileQueue_setupThemeWriterForSessionID:(id)a3 chunkCount:(id)a4 message:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(CRFileReceiver *)self fileQueue];
  dispatch_assert_queue_V2(v11);

  objc_opt_class();
  id v12 = [v10 objectForKey:@"version"];
  if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v13)
  {
    v14 = [(CRFileReceiver *)self themeAssetReceiver];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v16 = [(CRFileReceiver *)self themeAssetReceiver];
      objc_super v17 = [v16 fileReceiver:self urlForSavingThemeAssetOfVersion:v13];

      if (v17)
      {
        char v18 = [[CRThemeAssetDataWriter alloc] initWithAssetURL:v17 version:v13 chunkCount:v9];
        if (v18)
        {
          v19 = [(CRFileReceiver *)self themeWritersForSessionIDs];
          [v19 setObject:v18 forKey:v8];

          v20 = sub_10005C6FC(4uLL);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            int v29 = 138412546;
            id v30 = v13;
            __int16 v31 = 2112;
            uint64_t v32 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "ready to receive theme asset version %@ to %@", (uint8_t *)&v29, 0x16u);
          }

          objc_opt_class();
          id v21 = [v10 objectForKey:@"certificate"];
          if (v21 && (objc_opt_isKindOfClass() & 1) != 0) {
            v22 = v21;
          }
          else {
            v22 = 0;
          }

          objc_opt_class();
          id v23 = [v10 objectForKey:@"signature"];
          if (v23 && (objc_opt_isKindOfClass() & 1) != 0) {
            id v24 = v23;
          }
          else {
            id v24 = 0;
          }

          if (v22 && v24)
          {
            v25 = sub_10005C6FC(4uLL);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              LOWORD(v29) = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "code signing data is present in file transfer", (uint8_t *)&v29, 2u);
            }

            [(CRThemeAssetDataWriter *)v18 saveCertificateData:v22 signatureData:v24];
          }
          objc_opt_class();
          id v26 = [v10 objectForKey:@"additions"];
          if (v26 && (objc_opt_isKindOfClass() & 1) != 0) {
            id v27 = v26;
          }
          else {
            id v27 = 0;
          }

          if (v27)
          {
            char v28 = sub_10005C6FC(4uLL);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              LOWORD(v29) = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "accessory additions data are present in file transfer", (uint8_t *)&v29, 2u);
            }

            [(CRThemeAssetDataWriter *)v18 saveAdditionsData:v27];
          }
        }
        else
        {
          v22 = sub_10005C6FC(4uLL);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_100076EEC();
          }
        }
      }
      else
      {
        sub_10005C6FC(4uLL);
        char v18 = (CRThemeAssetDataWriter *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR)) {
          sub_100076EB8();
        }
      }
    }
    else
    {
      objc_super v17 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100076F54();
      }
    }
  }
  else
  {
    objc_super v17 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100076E84();
    }
  }
}

- (void)_fileQueue_setupLogArchiveWriterForSessionID:(id)a3 chunkCount:(id)a4 message:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CRFileReceiver *)self fileQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(CRFileReceiver *)self logArchiveReceiver];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(CRFileReceiver *)self logArchiveReceiver];
    id v13 = [v12 urlForSavingLogsForFileReceiverSession:self];

    if (v13)
    {
      v14 = [[CRFileTransferDataWriter alloc] initWithFileURL:v13 chunkCount:v8];
      char v15 = [(CRFileReceiver *)self logArchiveWritersForSessionIDs];
      [v15 setObject:v14 forKey:v7];

      v16 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        char v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "ready to receive log archive to %@", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      sub_10005C6FC(4uLL);
      v14 = (CRFileTransferDataWriter *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR)) {
        sub_100076F88();
      }
    }
  }
  else
  {
    id v13 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100076FBC();
    }
  }
}

- (void)_fileQueue_sendFileAcceptMessageWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CRFileReceiver *)self fileQueue];
  dispatch_assert_queue_V2(v5);

  v15[0] = @"messageType";
  v15[1] = @"accepted";
  v16[0] = &off_1000C6880;
  id v6 = +[NSNumber numberWithInt:v3];
  v16[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  Data = (void *)OPACKEncoderCreateData();
  if (Data)
  {
    if ([(CRFileReceiver *)self channelIsOpen])
    {
      id v9 = [(CRFileReceiver *)self channel];
      unsigned __int8 v10 = [v9 sendChannelMessage:Data];

      char v11 = sub_10005C6FC(4uLL);
      id v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v14 = v3;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "sent file accept message with status: %i", buf, 8u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        sub_1000769EC();
      }
    }
    else
    {
      id v12 = sub_10005C6FC(4uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10007705C();
      }
    }
  }
  else
  {
    id v12 = sub_10005C6FC(4uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100076FF0();
    }
  }
}

- (CRThemeAssetReceiving)themeAssetReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_themeAssetReceiver);

  return (CRThemeAssetReceiving *)WeakRetained;
}

- (void)setThemeAssetReceiver:(id)a3
{
}

- (CRLogArchiveReceiving)logArchiveReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logArchiveReceiver);

  return (CRLogArchiveReceiving *)WeakRetained;
}

- (void)setLogArchiveReceiver:(id)a3
{
}

- (CRStatisticsStreamReceiving)statisticsReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statisticsReceiver);

  return (CRStatisticsStreamReceiving *)WeakRetained;
}

- (void)setStatisticsReceiver:(id)a3
{
}

- (CARSessionChannelProviding)channel
{
  return self->_channel;
}

- (BOOL)channelIsOpen
{
  return self->_channelIsOpen;
}

- (void)setChannelIsOpen:(BOOL)a3
{
  self->_channelIsOpen = a3;
}

- (OS_dispatch_queue)fileQueue
{
  return self->_fileQueue;
}

- (NSMutableDictionary)themeWritersForSessionIDs
{
  return self->_themeWritersForSessionIDs;
}

- (NSMutableDictionary)logArchiveWritersForSessionIDs
{
  return self->_logArchiveWritersForSessionIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logArchiveWritersForSessionIDs, 0);
  objc_storeStrong((id *)&self->_themeWritersForSessionIDs, 0);
  objc_storeStrong((id *)&self->_fileQueue, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_destroyWeak((id *)&self->_statisticsReceiver);
  objc_destroyWeak((id *)&self->_logArchiveReceiver);

  objc_destroyWeak((id *)&self->_themeAssetReceiver);
}

@end