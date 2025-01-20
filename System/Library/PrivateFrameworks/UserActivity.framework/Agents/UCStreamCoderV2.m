@interface UCStreamCoderV2
- (BOOL)remoteHasFiles;
- (BOOL)returnInfoEarly;
- (NSDictionary)auxStateInfo;
- (NSFileHandle)receivingDataFile;
- (NSFileHandle)sendingDataFile;
- (NSMutableArray)archiveQueue;
- (NSMutableArray)objects;
- (NSMutableArray)requestedArchives;
- (NSMutableDictionary)archivePackagers;
- (NSMutableDictionary)uuidItemMap;
- (NSProgress)progress;
- (OS_dispatch_semaphore)itemsLockedSem;
- (OS_dispatch_source)heartBeatTrigger;
- (UADispatchWatchdog)watchdog;
- (UASharedPasteboardInfoWrapper)receivedInfo;
- (UASharedPasteboardInfoWrapper)sendingInfo;
- (UAStreamHandler)streamHandler;
- (UCFilePackager)filePackager;
- (UCStreamCoderV2)initWithInputStream:(id)a3 outputStream:(id)a4;
- (id)fetchDataForType:(id)a3;
- (id)fileRecvHandler;
- (id)infoRecvHandler;
- (id)packMessage:(id)a3;
- (id)sendErrorHandler;
- (id)unpackMessage:(id)a3;
- (int64_t)bytesReceived;
- (int64_t)expectedLength;
- (int64_t)state;
- (int64_t)totalSendSize;
- (unint64_t)streamStartTime;
- (void)calculateTimeRemaining;
- (void)cancelReceive;
- (void)completedReceivingPasteboardWithError:(id)a3;
- (void)dealloc;
- (void)filePackagerError:(id)a3;
- (void)handleHeartbeat:(id)a3;
- (void)handlePasteboardAuxInfoReceived:(id)a3;
- (void)handlePasteboardDataRequest:(id)a3;
- (void)handlePasteboardDataResponse:(id)a3;
- (void)handlePasteboardFileRequest:(id)a3;
- (void)handlePasteboardFileResponse:(id)a3;
- (void)handlePasteboardInfoRequest:(id)a3;
- (void)handlePasteboardInfoResponse:(id)a3;
- (void)packager:(id)a3 gotData:(id)a4 forPacket:(int64_t)a5;
- (void)processPasteboardInfo:(id)a3;
- (void)receivePasteboardToFile:(id)a3 withProgress:(id)a4 infoReceivedHandler:(id)a5 completionHandler:(id)a6 returnInfoEarly:(BOOL)a7;
- (void)receivedPasteboardInfo:(id)a3 withError:(id)a4;
- (void)recvStop:(id)a3;
- (void)removeObject:(id)a3;
- (void)removeReceivedItems:(id)a3;
- (void)sendCompletedWithError:(id)a3;
- (void)sendFileArchiveRequest;
- (void)sendHeartbeat;
- (void)sendPasteboard:(id)a3 withCompletion:(id)a4;
- (void)sendPasteboardDataRequest;
- (void)sendPasteboardDataResponse;
- (void)sendPasteboardInfoRequest;
- (void)sendPasteboardInfoResponse;
- (void)sendStopWithError:(int64_t)a3;
- (void)sendTotalSendSize;
- (void)setArchivePackagers:(id)a3;
- (void)setArchiveQueue:(id)a3;
- (void)setAuxStateInfo:(id)a3;
- (void)setBytesReceived:(int64_t)a3;
- (void)setExpectedLength:(int64_t)a3;
- (void)setFilePackager:(id)a3;
- (void)setFileRecvHandler:(id)a3;
- (void)setHeartBeatTrigger:(id)a3;
- (void)setInfoRecvHandler:(id)a3;
- (void)setItemsLockedSem:(id)a3;
- (void)setObjects:(id)a3;
- (void)setProgress:(id)a3;
- (void)setReceivedInfo:(id)a3;
- (void)setReceivingDataFile:(id)a3;
- (void)setRemoteHasFiles:(BOOL)a3;
- (void)setRequestedArchives:(id)a3;
- (void)setReturnInfoEarly:(BOOL)a3;
- (void)setSendErrorHandler:(id)a3;
- (void)setSendingDataFile:(id)a3;
- (void)setSendingInfo:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStreamHandler:(id)a3;
- (void)setStreamStartTime:(unint64_t)a3;
- (void)setTotalSendSize:(int64_t)a3;
- (void)setUuidItemMap:(id)a3;
- (void)setWatchdog:(id)a3;
- (void)storeObject:(id)a3;
- (void)streams:(id)a3 didReadMessage:(id)a4 withTag:(int64_t)a5;
- (void)streams:(id)a3 didWriteMessageWithTag:(int64_t)a4;
- (void)streamsDidClose:(id)a3 withError:(id)a4;
@end

@implementation UCStreamCoderV2

- (UCStreamCoderV2)initWithInputStream:(id)a3 outputStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)UCStreamCoderV2;
  v8 = [(UCStreamCoderV2 *)&v28 init];
  if (v8)
  {
    v9 = [[UAStreamHandler alloc] initWithInputStream:v6 outputStream:v7 delegate:v8];
    [(UCStreamCoderV2 *)v8 setStreamHandler:v9];

    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    [(UCStreamCoderV2 *)v8 setArchivePackagers:v10];

    id v11 = objc_alloc_init((Class)NSMutableArray);
    [(UCStreamCoderV2 *)v8 setArchiveQueue:v11];

    id v12 = objc_alloc_init((Class)NSMutableArray);
    [(UCStreamCoderV2 *)v8 setRequestedArchives:v12];

    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    [(UCStreamCoderV2 *)v8 setUuidItemMap:v13];

    id v14 = objc_alloc_init((Class)NSMutableArray);
    [(UCStreamCoderV2 *)v8 setObjects:v14];

    v15 = [(UCStreamCoderV2 *)v8 streamHandler];
    [v15 start];

    [(UCStreamCoderV2 *)v8 setState:0];
    v16 = +[UAUserActivityDefaults sharedDefaults];
    [v16 pasteboardStreamWatchdogTimeout];
    double v18 = v17;

    objc_initWeak(&location, v8);
    v19 = [UADispatchWatchdog alloc];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_10001DD08;
    v25 = &unk_1000C4EE8;
    objc_copyWeak(&v26, &location);
    v20 = [(UADispatchWatchdog *)v19 initWithName:@"UC Stream Watchdog" timeout:&v22 block:v18];
    -[UCStreamCoderV2 setWatchdog:](v8, "setWatchdog:", v20, v22, v23, v24, v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[CODERV2] dealloc", buf, 2u);
  }

  v4 = [(UCStreamCoderV2 *)self streamHandler];
  [v4 stop];

  v5.receiver = self;
  v5.super_class = (Class)UCStreamCoderV2;
  [(UCStreamCoderV2 *)&v5 dealloc];
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    objc_super v5 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = sub_10001DFE8(self->_state);
      id v7 = sub_10001DFE8(a3);
      int v8 = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CODERV2] State: %@ -> %@", (uint8_t *)&v8, 0x16u);
    }
    self->_state = a3;
  }
}

- (void)storeObject:(id)a3
{
  id v6 = a3;
  v4 = [(UCStreamCoderV2 *)self objects];
  objc_sync_enter(v4);
  objc_super v5 = [(UCStreamCoderV2 *)self objects];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)removeObject:(id)a3
{
  id v6 = a3;
  v4 = [(UCStreamCoderV2 *)self objects];
  objc_sync_enter(v4);
  objc_super v5 = [(UCStreamCoderV2 *)self objects];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)streamsDidClose:(id)a3 withError:(id)a4
{
  id v5 = a4;
  id v6 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CODERV2] Streams closed: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(UCStreamCoderV2 *)self receivedInfo];
  [(UCStreamCoderV2 *)self receivedPasteboardInfo:v7 withError:v5];

  [(UCStreamCoderV2 *)self completedReceivingPasteboardWithError:v5];
  [(UCStreamCoderV2 *)self sendCompletedWithError:v5];
}

- (void)streams:(id)a3 didReadMessage:(id)a4 withTag:(int64_t)a5
{
  id v7 = a4;
  int v8 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = sub_10001E430(a5);
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[CODERV2] Reveived message for tag %{public}@", (uint8_t *)&v11, 0xCu);
  }
  __int16 v10 = [(UCStreamCoderV2 *)self watchdog];
  [v10 poke];

  switch(a5)
  {
    case 3:
      [(UCStreamCoderV2 *)self handlePasteboardInfoRequest:v7];
      break;
    case 4:
      [(UCStreamCoderV2 *)self handlePasteboardInfoResponse:v7];
      break;
    case 5:
      [(UCStreamCoderV2 *)self handlePasteboardDataRequest:v7];
      break;
    case 6:
      [(UCStreamCoderV2 *)self handlePasteboardDataResponse:v7];
      break;
    case 7:
      [(UCStreamCoderV2 *)self handlePasteboardFileRequest:v7];
      break;
    case 8:
      [(UCStreamCoderV2 *)self handlePasteboardFileResponse:v7];
      break;
    case 9:
      [(UCStreamCoderV2 *)self handlePasteboardAuxInfoReceived:v7];
      break;
    case 10:
      [(UCStreamCoderV2 *)self handleHeartbeat:v7];
      break;
    default:
      break;
  }
}

- (void)streams:(id)a3 didWriteMessageWithTag:(int64_t)a4
{
  id v6 = a3;
  id v7 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = sub_10001E430(a4);
    int v26 = 138543362;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[CODERV2] Did write tag %{public}@", (uint8_t *)&v26, 0xCu);
  }
  id v9 = [(UCStreamCoderV2 *)self watchdog];
  [v9 poke];

  int64_t v10 = [(UCStreamCoderV2 *)self state];
  if (v10 == 2)
  {
    uint64_t v11 = 3;
  }
  else
  {
    if (v10 != 5) {
      goto LABEL_8;
    }
    uint64_t v11 = 1;
  }
  [(UCStreamCoderV2 *)self setState:v11];
LABEL_8:
  if (a4)
  {
    if (a4 == 8)
    {
      double v17 = [(UCStreamCoderV2 *)self archiveQueue];
      objc_sync_enter(v17);
      double v18 = [(UCStreamCoderV2 *)self archiveQueue];
      v19 = [v18 firstObject];

      if (v19)
      {
        v20 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          int v26 = 138543362;
          v27 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[CODERV2] Requesting delivery for %{public}@", (uint8_t *)&v26, 0xCu);
        }

        v21 = [(UCStreamCoderV2 *)self archivePackagers];
        v22 = [v21 objectForKeyedSubscript:v19];

        unsigned int v23 = [v22 deliverNextPacket];
        v24 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          int v26 = 67109120;
          LODWORD(v27) = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[CODERV2] Req result: %d", (uint8_t *)&v26, 8u);
        }
      }
      else
      {
        v25 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          LOWORD(v26) = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[CODERV2] Done sending archive chunks", (uint8_t *)&v26, 2u);
        }

        [(UCStreamCoderV2 *)self setState:1];
      }

      objc_sync_exit(v17);
    }
    else if (a4 == 6)
    {
      id v12 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[CODERV2] Did write data chunk", (uint8_t *)&v26, 2u);
      }

      id v13 = [(UCStreamCoderV2 *)self filePackager];
      unsigned __int8 v14 = [v13 deliverNextPacket];

      if ((v14 & 1) == 0)
      {
        v15 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v26) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[CODERV2] Done writting pasteboard data chunks", (uint8_t *)&v26, 2u);
        }

        [(UCStreamCoderV2 *)self setState:1];
      }
    }
  }
  else
  {
    v16 = [(UCStreamCoderV2 *)self streamHandler];
    [v16 stop];
  }
}

- (void)sendStopWithError:(int64_t)a3
{
  id v5 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[CODERV2] Stopping", v10, 2u);
  }

  [(UCStreamCoderV2 *)self setState:8];
  if (a3)
  {
    CFStringRef v11 = @"error";
    id v6 = +[NSNumber numberWithInteger:a3];
    id v12 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

    int v8 = [(UCStreamCoderV2 *)self packMessage:v7];
    id v9 = [(UCStreamCoderV2 *)self streamHandler];
    [v9 writeMessage:v8 tag:0];
  }
}

- (void)recvStop:(id)a3
{
  v4 = [(UCStreamCoderV2 *)self unpackMessage:a3];
  id v5 = [v4 objectForKeyedSubscript:@"error"];
  id v6 = [v5 integerValue];

  id v7 = objc_alloc((Class)NSError);
  id v8 = [v7 initWithDomain:UAContinuityErrorDomain code:v6 userInfo:0];
  id v9 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Received stop message with error: %@", (uint8_t *)&v11, 0xCu);
  }

  [(UCStreamCoderV2 *)self receivedPasteboardInfo:0 withError:v8];
  [(UCStreamCoderV2 *)self completedReceivingPasteboardWithError:v8];
  [(UCStreamCoderV2 *)self sendCompletedWithError:v8];
  int64_t v10 = [(UCStreamCoderV2 *)self streamHandler];
  [v10 stop];
}

- (void)handlePasteboardInfoRequest:(id)a3
{
  id v4 = a3;
  [(UCStreamCoderV2 *)self setState:4];
  id v5 = [(UCStreamCoderV2 *)self unpackMessage:v4];

  [(UCStreamCoderV2 *)self sendPasteboardInfoResponse];
}

- (void)handlePasteboardDataRequest:(id)a3
{
  id v4 = a3;
  [(UCStreamCoderV2 *)self setState:4];
  id v5 = [(UCStreamCoderV2 *)self unpackMessage:v4];

  [(UCStreamCoderV2 *)self sendPasteboardDataResponse];
}

- (void)handlePasteboardFileRequest:(id)a3
{
  id v4 = a3;
  [(UCStreamCoderV2 *)self setState:4];
  v35 = self;
  v33 = v4;
  v34 = [(UCStreamCoderV2 *)self unpackMessage:v4];
  v36 = [v34 objectForKeyedSubscript:@"uuid"];
  id v5 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v36;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[CODERV2] Archvie requested for UUID: %@", buf, 0xCu);
  }

  id v6 = [(UCStreamCoderV2 *)self archivePackagers];
  id v7 = [v6 allKeys];
  unsigned __int8 v8 = [v7 containsObject:v36];

  if (v8) {
    goto LABEL_15;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = [(UCStreamCoderV2 *)self sendingInfo];
  int64_t v10 = [v9 pbinfo];
  id obj = [v10 items];

  id v11 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v11)
  {
    char v12 = 0;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v16 = [v15 types];
        double v17 = [v16 allKeys];
        unsigned int v18 = [v17 containsObject:@"public.file-url"];

        if (v18)
        {
          v19 = [v15 types];
          v20 = [v19 objectForKeyedSubscript:@"public.file-url"];
          v21 = [v20 uuid];
          v22 = [v21 UUIDString];
          unsigned __int8 v23 = [v22 isEqualToString:v36];

          v12 |= v23;
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v11);

    if (v12)
    {
      v24 = [(UCStreamCoderV2 *)v35 requestedArchives];
      objc_sync_enter(v24);
      v25 = [(UCStreamCoderV2 *)v35 requestedArchives];
      [v25 addObject:v36];

      objc_sync_exit(v24);
LABEL_15:
      int v26 = [(UCStreamCoderV2 *)v35 archiveQueue];
      objc_sync_enter(v26);
      v27 = [(UCStreamCoderV2 *)v35 archiveQueue];
      [v27 addObject:v36];

      objc_super v28 = [(UCStreamCoderV2 *)v35 archiveQueue];
      v29 = [v28 firstObject];

      if ([v29 isEqualToString:v36])
      {
        v30 = [(UCStreamCoderV2 *)v35 archivePackagers];
        v31 = [v30 objectForKeyedSubscript:v36];
        [v31 deliverNextPacket];

        v32 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v36;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "[CODERV2] Delivering file packets for UUID: %@", buf, 0xCu);
        }
      }
      objc_sync_exit(v26);
      goto LABEL_23;
    }
  }
  else
  {
  }
  int v26 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v36;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[CODERV2] File requested with invalid UUID: %{public}@", buf, 0xCu);
  }
LABEL_23:
}

- (void)handlePasteboardInfoResponse:(id)a3
{
  id v4 = a3;
  [(UCStreamCoderV2 *)self setState:7];
  id v5 = [(UCStreamCoderV2 *)self unpackMessage:v4];

  id v6 = [v5 objectForKeyedSubscript:@"data"];
  if (v6)
  {
    id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:0];
    unsigned __int8 v8 = [v7 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
    [(UCStreamCoderV2 *)self setReceivedInfo:v8];

    id v9 = [(UCStreamCoderV2 *)self progress];
    [v9 setCompletedUnitCount:0];

    int64_t v10 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[CODERV2] Received pasteboard info, requesting data", (uint8_t *)&v15, 2u);
    }

    [(UCStreamCoderV2 *)self sendPasteboardDataRequest];
    id v11 = [(UCStreamCoderV2 *)self receivedInfo];
    [(UCStreamCoderV2 *)self processPasteboardInfo:v11];
  }
  else
  {
    uint64_t v12 = UAContinuityErrorDomain;
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    CFStringRef v18 = @"Invalid message header";
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v7 = +[NSError errorWithDomain:v12 code:-122 userInfo:v13];

    [(UCStreamCoderV2 *)self receivedPasteboardInfo:0 withError:v7];
    [(UCStreamCoderV2 *)self completedReceivingPasteboardWithError:v7];
    unsigned __int8 v14 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[CODERV2] Error receiving pasteboard info: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    [(UCStreamCoderV2 *)self sendStopWithError:0];
  }
}

- (void)handlePasteboardDataResponse:(id)a3
{
  id v4 = a3;
  [(UCStreamCoderV2 *)self setState:7];
  id v5 = [(UCStreamCoderV2 *)self unpackMessage:v4];

  id v6 = [v5 objectForKeyedSubscript:@"data"];
  id v7 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v8 = [v5 objectForKeyedSubscript:@"packetNum"];
    id v9 = [v5 objectForKeyedSubscript:@"totalNum"];
    *(_DWORD *)buf = 138543618;
    id v25 = v8;
    __int16 v26 = 2114;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CODERV2] Received pasteboard data response (%{public}@/%{public}@)", buf, 0x16u);
  }
  -[UCStreamCoderV2 setBytesReceived:](self, "setBytesReceived:", (char *)[v6 length] + -[UCStreamCoderV2 bytesReceived](self, "bytesReceived"));
  int64_t v10 = [(UCStreamCoderV2 *)self progress];
  objc_msgSend(v10, "setCompletedUnitCount:", -[UCStreamCoderV2 bytesReceived](self, "bytesReceived"));

  [(UCStreamCoderV2 *)self calculateTimeRemaining];
  id v11 = [(UCStreamCoderV2 *)self receivingDataFile];
  id v21 = 0;
  unsigned __int8 v12 = [v11 writeData:v6 error:&v21];
  id v13 = v21;

  if (v12)
  {
    unsigned __int8 v14 = [v5 objectForKeyedSubscript:@"packetNum"];
    int v15 = [v5 objectForKeyedSubscript:@"totalNum"];

    if (v14 == v15)
    {
      if ([(UCStreamCoderV2 *)self returnInfoEarly])
      {
        id v16 = [(UCStreamCoderV2 *)self receivedInfo];
        [(UCStreamCoderV2 *)self receivedPasteboardInfo:v16 withError:0];
      }
      if ([(UCStreamCoderV2 *)self remoteHasFiles]) {
        [(UCStreamCoderV2 *)self sendFileArchiveRequest];
      }
      else {
        [(UCStreamCoderV2 *)self completedReceivingPasteboardWithError:0];
      }
    }
  }
  else
  {
    NSErrorUserInfoKey v17 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[CODERV2] Error writing data to file: %{public}@", buf, 0xCu);
    }

    uint64_t v18 = UAContinuityErrorDomain;
    NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
    id v23 = v13;
    v19 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v20 = +[NSError errorWithDomain:v18 code:-128 userInfo:v19];

    [(UCStreamCoderV2 *)self completedReceivingPasteboardWithError:v20];
    [(UCStreamCoderV2 *)self sendStopWithError:0];
  }
}

- (void)handlePasteboardFileResponse:(id)a3
{
  id v4 = a3;
  [(UCStreamCoderV2 *)self setState:7];
  id v5 = [(UCStreamCoderV2 *)self unpackMessage:v4];

  id v6 = [v5 objectForKeyedSubscript:@"data"];
  id v7 = objc_alloc((Class)NSUUID);
  unsigned __int8 v8 = [v5 objectForKeyedSubscript:@"uuid"];
  id v9 = [v7 initWithUUIDString:v8];

  int64_t v10 = [v5 objectForKeyedSubscript:@"packetNum"];
  id v11 = [v5 objectForKeyedSubscript:@"totalNum"];
  if (sub_100045CA4((int)[v10 intValue], (int)objc_msgSend(v11, "intValue")))
  {
    [v10 floatValue];
    float v13 = v12;
    [v11 floatValue];
    float v15 = v14;
    id v16 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSErrorUserInfoKey v17 = [v5 objectForKeyedSubscript:@"uuid"];
      uint64_t v18 = [v5 objectForKeyedSubscript:@"packetNum"];
      v19 = [v5 objectForKeyedSubscript:@"totalNum"];
      *(_DWORD *)buf = 138413058;
      long long v38 = v17;
      __int16 v39 = 2048;
      uint64_t v40 = (uint64_t)((float)(v13 / v15) * 100.0);
      __int16 v41 = 2114;
      v42 = v18;
      __int16 v43 = 2114;
      v44 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[CODERV2] Received pasteboard file response %@ %ld%% (%{public}@/%{public}@)", buf, 0x2Au);
    }
  }
  -[UCStreamCoderV2 setBytesReceived:](self, "setBytesReceived:", (char *)[v6 length] + -[UCStreamCoderV2 bytesReceived](self, "bytesReceived"));
  v20 = [(UCStreamCoderV2 *)self progress];
  objc_msgSend(v20, "setCompletedUnitCount:", -[UCStreamCoderV2 bytesReceived](self, "bytesReceived"));

  [(UCStreamCoderV2 *)self calculateTimeRemaining];
  id v21 = +[UASharedPasteboardDataManager sharedInstance];
  [v21 writeArchiveData:v6 forItem:v9];

  NSErrorUserInfoKey v22 = [v5 objectForKeyedSubscript:@"packetNum"];
  id v23 = [v5 objectForKeyedSubscript:@"totalNum"];

  if (v22 == v23)
  {
    v24 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = [v9 UUIDString];
      *(_DWORD *)buf = 138412290;
      long long v38 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[CODERV2] Received all data for archive: %@", buf, 0xCu);
    }
    __int16 v26 = +[UASharedPasteboardDataManager sharedInstance];
    [v26 finishWritingArchiveForUUID:v9];

    v27 = +[UASharedPasteboardDataManager sharedInstance];
    objc_super v28 = [v27 fileURLForPasteboardItem:v9];

    v29 = [UCExtractor alloc];
    v30 = [v9 UUIDString];
    v31 = [(UCExtractor *)v29 initWithDestinationURL:v28 forArchiveUUID:v30];

    [(UCStreamCoderV2 *)self storeObject:v31];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001FAC0;
    v33[3] = &unk_1000C4F10;
    id v34 = v9;
    v35 = self;
    v36 = v31;
    v32 = v31;
    [(UCExtractor *)v32 extractArchiveWithCompletion:v33];
  }
}

- (void)handlePasteboardAuxInfoReceived:(id)a3
{
  id v4 = [(UCStreamCoderV2 *)self unpackMessage:a3];
  id v5 = [v4 objectForKeyedSubscript:@"totalSize"];
  if (v5)
  {
    id v6 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[CODERV2] Total expected data length: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[UCStreamCoderV2 setExpectedLength:](self, "setExpectedLength:", [v5 integerValue]);
    id v7 = [(UCStreamCoderV2 *)self progress];
    objc_msgSend(v7, "setTotalUnitCount:", objc_msgSend(v5, "integerValue"));
  }
}

- (void)handleHeartbeat:(id)a3
{
  id v4 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CODERV2] Sending heartbeat", v6, 2u);
  }

  id v5 = [(UCStreamCoderV2 *)self watchdog];
  [v5 poke];
}

- (void)sendPasteboardInfoRequest
{
  id v4 = [(UCStreamCoderV2 *)self packMessage:&off_1000CC810];
  [(UCStreamCoderV2 *)self setState:2];
  v3 = [(UCStreamCoderV2 *)self streamHandler];
  [v3 writeMessage:v4 tag:3];
}

- (void)sendPasteboardInfoResponse
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(UCStreamCoderV2 *)self sendingInfo];

  if (v4)
  {
    id v5 = [(UCStreamCoderV2 *)self sendingInfo];
    id v6 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];

    [v3 setObject:v6 forKeyedSubscript:@"data"];
  }
  id v7 = [(UCStreamCoderV2 *)self packMessage:v3];
  int v8 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CODERV2] Sending pasteboard info", v10, 2u);
  }

  [(UCStreamCoderV2 *)self setState:5];
  id v9 = [(UCStreamCoderV2 *)self streamHandler];
  [v9 writeMessage:v7 tag:4];
}

- (void)sendPasteboardDataRequest
{
  id v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CODERV2] Sending pasteboard data request", v6, 2u);
  }

  id v4 = [(UCStreamCoderV2 *)self packMessage:&off_1000CC838];
  [(UCStreamCoderV2 *)self setState:2];
  id v5 = [(UCStreamCoderV2 *)self streamHandler];
  [v5 writeMessage:v4 tag:5];
}

- (void)sendFileArchiveRequest
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = [(UCStreamCoderV2 *)self receivedInfo];
  id v4 = [v3 pbinfo];
  id v5 = [v4 items];

  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v27;
    *(void *)&long long v7 = 138543362;
    long long v25 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        float v12 = objc_msgSend(v11, "types", v25);
        float v13 = [v12 allKeys];
        unsigned int v14 = [v13 containsObject:@"public.file-url"];

        if (v14)
        {
          float v15 = [v11 types];
          id v16 = [v15 objectForKeyedSubscript:@"public.file-url"];
          NSErrorUserInfoKey v17 = [v16 uuid];
          uint64_t v18 = [v17 UUIDString];

          v19 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v25;
            v33 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[CODERV2] Requesting archive for UUID: %{public}@", buf, 0xCu);
          }

          v20 = +[UASharedPasteboardDataManager sharedInstance];
          id v21 = [objc_alloc((Class)NSUUID) initWithUUIDString:v18];
          [v20 createTmpArchiveFileWithUUID:v21];

          v30[0] = @"supportsCompression";
          v30[1] = @"uuid";
          v31[0] = &__kCFBooleanFalse;
          v31[1] = v18;
          NSErrorUserInfoKey v22 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
          id v23 = [(UCStreamCoderV2 *)self packMessage:v22];
          [(UCStreamCoderV2 *)self setState:2];
          v24 = [(UCStreamCoderV2 *)self streamHandler];
          [v24 writeMessage:v23 tag:7];
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v8);
  }
}

- (void)sendPasteboardDataResponse
{
  id v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CODERV2] Building file packager to send pasteboard data", v11, 2u);
  }

  id v4 = [UCFilePackager alloc];
  id v5 = [(UCStreamCoderV2 *)self sendingDataFile];
  id v6 = [(UCStreamCoderV2 *)self sendingInfo];
  long long v7 = [v6 pbinfo];
  id v8 = -[UCFilePackager initWithFile:fileSize:packetSize:options:receiver:](v4, "initWithFile:fileSize:packetSize:options:receiver:", v5, [v7 dataSize], 0x10000, 0, self);
  [(UCStreamCoderV2 *)self setFilePackager:v8];

  uint64_t v9 = [(UCStreamCoderV2 *)self filePackager];
  [v9 setTag:6];

  int64_t v10 = [(UCStreamCoderV2 *)self filePackager];
  [v10 deliverNextPacket];

  [(UCStreamCoderV2 *)self setState:6];
}

- (void)sendTotalSendSize
{
  CFStringRef v7 = @"totalSize";
  id v3 = +[NSNumber numberWithInteger:[(UCStreamCoderV2 *)self totalSendSize]];
  id v8 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  id v5 = [(UCStreamCoderV2 *)self packMessage:v4];
  id v6 = [(UCStreamCoderV2 *)self streamHandler];
  [v6 writeMessage:v5 tag:9];
}

- (void)sendHeartbeat
{
  id v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CODERV2] Sending heartbeat", v7, 2u);
  }

  id v4 = [(UCStreamCoderV2 *)self watchdog];
  [v4 poke];

  id v5 = [(UCStreamCoderV2 *)self streamHandler];
  id v6 = [@"UCHB" dataUsingEncoding:1];
  [v5 writeMessage:v6 tag:10];
}

- (void)receivePasteboardToFile:(id)a3 withProgress:(id)a4 infoReceivedHandler:(id)a5 completionHandler:(id)a6 returnInfoEarly:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  [(UCStreamCoderV2 *)self setRemoteHasFiles:0];
  [(UCStreamCoderV2 *)self setReturnInfoEarly:v7];
  [(UCStreamCoderV2 *)self setReceivingDataFile:v15];

  [(UCStreamCoderV2 *)self setProgress:v14];
  [(UCStreamCoderV2 *)self setInfoRecvHandler:v13];

  [(UCStreamCoderV2 *)self setFileRecvHandler:v12];
  [(UCStreamCoderV2 *)self setStreamStartTime:mach_absolute_time()];
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  [(UCStreamCoderV2 *)self setItemsLockedSem:v16];

  NSErrorUserInfoKey v17 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v18 = @"NO";
    if (v7) {
      CFStringRef v18 = @"YES";
    }
    int v20 = 138543362;
    CFStringRef v21 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[CODERV2] Requesting pasteboard info, will return info early: %{public}@", (uint8_t *)&v20, 0xCu);
  }

  v19 = [(UCStreamCoderV2 *)self watchdog];
  [v19 start];

  [(UCStreamCoderV2 *)self sendPasteboardInfoRequest];
}

- (void)cancelReceive
{
  [(UCStreamCoderV2 *)self sendStopWithError:-125];
  id v4 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-125 userInfo:0];
  [(UCStreamCoderV2 *)self receivedPasteboardInfo:0 withError:v4];
  [(UCStreamCoderV2 *)self completedReceivingPasteboardWithError:v4];
  id v3 = [(UCStreamCoderV2 *)self watchdog];
  [v3 cancel];
}

- (void)receivedPasteboardInfo:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UCStreamCoderV2 *)self itemsLockedSem];
  if (v8)
  {
    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      int64_t v10 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[CODERV2] Timout waiting for item lock sememphore", buf, 2u);
      }
    }
    [(UCStreamCoderV2 *)self setItemsLockedSem:0];
  }
  id v11 = self;
  objc_sync_enter(v11);
  id v12 = [(UCStreamCoderV2 *)v11 infoRecvHandler];

  if (v12)
  {
    if (v7)
    {
      id v13 = [(UCStreamCoderV2 *)v11 receivedInfo];
      [(UCStreamCoderV2 *)v11 removeReceivedItems:v13];
    }
    id v14 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFStringRef v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[CODERV2] Calling received info handler", v18, 2u);
    }

    id v15 = [(UCStreamCoderV2 *)v11 infoRecvHandler];
    ((void (**)(void, id, id))v15)[2](v15, v6, v7);

    [(UCStreamCoderV2 *)v11 setInfoRecvHandler:0];
  }
  else
  {
    dispatch_semaphore_t v16 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)NSErrorUserInfoKey v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[CODERV2] Skipping call to received info handler", v17, 2u);
    }
  }
  objc_sync_exit(v11);
}

- (void)completedReceivingPasteboardWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(UCStreamCoderV2 *)self receivedInfo];
  [(UCStreamCoderV2 *)self receivedPasteboardInfo:v5 withError:v4];

  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(UCStreamCoderV2 *)v6 fileRecvHandler];

  if (v7)
  {
    if (v4)
    {
      id v8 = [(UCStreamCoderV2 *)v6 receivedInfo];
      [(UCStreamCoderV2 *)v6 removeReceivedItems:v8];
    }
    dispatch_time_t v9 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[CODERV2] Calling pasteboard received handler", buf, 2u);
    }

    int64_t v10 = [(UCStreamCoderV2 *)v6 fileRecvHandler];
    id v11 = [(UCStreamCoderV2 *)v6 streamHandler];
    ((void (**)(void, UCStreamCoderV2 *, id, id))v10)[2](v10, v6, [v11 totalBytesReceived], v4);

    [(UCStreamCoderV2 *)v6 setFileRecvHandler:0];
    id v12 = +[UASharedPasteboardDataManager sharedInstance];
    [v12 cleanupArchiveDir];
  }
  else
  {
    id v12 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[CODERV2] Skipping call to pasteboard received handler", v14, 2u);
    }
  }

  objc_sync_exit(v6);
  id v13 = [(UCStreamCoderV2 *)v6 watchdog];
  [v13 cancel];
}

- (void)removeReceivedItems:(id)a3
{
  id v20 = a3;
  id v3 = [v20 pbinfo];
  id v4 = [v3 items];
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v20 pbinfo];
      id v8 = [v7 items];
      dispatch_time_t v9 = [v8 objectAtIndexedSubscript:v6];

      int64_t v10 = [v9 types];
      id v11 = [v10 allKeys];
      unsigned int v12 = [v11 containsObject:@"public.file-url"];

      if (v12)
      {
        id v13 = [v9 types];
        id v14 = [v13 objectForKeyedSubscript:@"public.file-url"];
        id v15 = [v14 uuid];

        dispatch_semaphore_t v16 = +[UASharedPasteboardDataManager sharedInstance];
        [v16 cleanupForItem:v15];
      }
      ++v6;
      NSErrorUserInfoKey v17 = [v20 pbinfo];
      CFStringRef v18 = [v17 items];
      id v19 = [v18 count];
    }
    while ((unint64_t)v19 > v6);
  }
}

- (void)processPasteboardInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pbinfo];
  unint64_t v6 = [v5 items];
  id v7 = [v6 count];

  if (v7)
  {
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    v35 = v37;
    *(void *)&long long v8 = 67109378;
    long long v34 = v8;
    do
    {
      id v11 = objc_msgSend(v4, "pbinfo", v34, v35);
      unsigned int v12 = [v11 items];
      id v13 = [v12 objectAtIndexedSubscript:v9];

      id v14 = [v13 types];
      id v15 = [v14 allKeys];
      unsigned int v16 = [v15 containsObject:@"public.file-url"];

      if (v16)
      {
        NSErrorUserInfoKey v17 = [v13 types];
        CFStringRef v18 = [v17 objectForKeyedSubscript:@"public.file-url"];
        id v19 = [v18 uuid];

        id v20 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          CFStringRef v21 = [v19 UUIDString];
          *(_DWORD *)buf = v34;
          int v40 = v9;
          __int16 v41 = 2112;
          v42 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[CODERV2] Item %d has public.file-url with uuid: %@", buf, 0x12u);
        }
        uint64_t v10 = (v10 + 1);

        NSErrorUserInfoKey v22 = +[UASharedPasteboardDataManager sharedInstance];
        [v22 createTmpArchiveFileWithUUID:v19];

        [(UCStreamCoderV2 *)self setRemoteHasFiles:1];
        id v23 = +[NSNumber numberWithInt:v9];
        v24 = [(UCStreamCoderV2 *)self uuidItemMap];
        long long v25 = [v19 UUIDString];
        [v24 setObject:v23 forKeyedSubscript:v25];

        long long v26 = +[UASharedPasteboardDataManager sharedInstance];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v37[0] = sub_1000210E4;
        v37[1] = &unk_1000C4F30;
        int v38 = v9;
        [v26 obtainLockForItem:v19 completion:v36];
      }
      ++v9;
      long long v27 = [v4 pbinfo];
      long long v28 = [v27 items];
      id v29 = [v28 count];
    }
    while ((unint64_t)v29 > v9);
  }
  else
  {
    uint64_t v10 = 0;
  }
  v30 = [(UCStreamCoderV2 *)self progress];
  v31 = +[NSNumber numberWithInt:v10];
  [v30 setUserInfoObject:v31 forKey:@"numFiles"];

  v32 = [(UCStreamCoderV2 *)self itemsLockedSem];
  v33 = v32;
  if (v32) {
    dispatch_semaphore_signal(v32);
  }
}

- (void)calculateTimeRemaining
{
  double v3 = (double)+[UADiagnosticUtils absoluteToNSec:mach_absolute_time() - [(UCStreamCoderV2 *)self streamStartTime]]/ 1000000000.0;
  double v4 = (double)[(UCStreamCoderV2 *)self bytesReceived] / v3;
  id v5 = [(UCStreamCoderV2 *)self progress];
  unint64_t v6 = +[NSNumber numberWithDouble:v4];
  [v5 setUserInfoObject:v6 forKey:NSProgressThroughputKey];

  int64_t v7 = [(UCStreamCoderV2 *)self expectedLength];
  double v8 = (double)(v7 - [(UCStreamCoderV2 *)self bytesReceived]) / v4;
  if (*(double *)&qword_1000E6718 != 0.0) {
    double v8 = v8 * 0.5 + *(double *)&qword_1000E6718 * 0.5;
  }
  qword_1000E6718 = *(void *)&v8;
  unint64_t v9 = +[UAUserActivityDefaults sharedDefaults];
  [v9 pasteboardUITimeRemainingDelay];
  double v11 = v10;

  if (v3 > v11)
  {
    id v13 = [(UCStreamCoderV2 *)self progress];
    unsigned int v12 = +[NSNumber numberWithDouble:*(double *)&qword_1000E6718];
    [v13 setUserInfoObject:v12 forKey:NSProgressEstimatedTimeRemainingKey];
  }
}

- (void)sendPasteboard:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v61 = a4;
  v67 = self;
  [(UCStreamCoderV2 *)self setSendingInfo:v6];
  v62 = v6;
  int64_t v7 = [v6 pbinfo];
  double v8 = [v7 dataFile];
  [(UCStreamCoderV2 *)self setSendingDataFile:v8];

  unint64_t v9 = [v62 pbinfo];
  -[UCStreamCoderV2 setTotalSendSize:](self, "setTotalSendSize:", (char *)[v9 dataSize] + -[UCStreamCoderV2 totalSendSize](self, "totalSendSize"));

  double v10 = [(UCStreamCoderV2 *)self sendingInfo];
  double v11 = [v10 pbinfo];
  [v11 setDataFile:0];

  [(UCStreamCoderV2 *)self setSendErrorHandler:v61];
  objc_initWeak(&location, self);
  id v12 = &_dispatch_main_q;
  dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  [(UCStreamCoderV2 *)self setHeartBeatTrigger:v13];

  id v14 = [(UCStreamCoderV2 *)self heartBeatTrigger];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100021D48;
  handler[3] = &unk_1000C4EE8;
  objc_copyWeak(&v78, &location);
  dispatch_source_set_event_handler(v14, handler);

  id v15 = [(UCStreamCoderV2 *)self heartBeatTrigger];
  dispatch_source_set_timer(v15, 0, 0x12A05F200uLL, 0x12A05F200uLL);

  unsigned int v16 = [(UCStreamCoderV2 *)self heartBeatTrigger];
  dispatch_activate(v16);

  NSErrorUserInfoKey v17 = [(UCStreamCoderV2 *)self watchdog];
  [v17 start];

  CFStringRef v18 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[CODERV2] Setup to send pasteboard, waiting", buf, 2u);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v19 = [(UCStreamCoderV2 *)self sendingInfo];
  id v20 = [v19 pbinfo];
  id obj = [v20 items];

  id v21 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v21)
  {
    uint64_t v64 = *(void *)v74;
    while (2)
    {
      id v65 = v21;
      for (i = 0; i != v65; i = (char *)i + 1)
      {
        if (*(void *)v74 != v64) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        v24 = [v23 types];
        long long v25 = [v24 allKeys];
        unsigned int v26 = [v25 containsObject:@"public.file-url"];

        if (v26)
        {
          long long v27 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[CODERV2] Sending pasteboard with files", buf, 2u);
          }

          long long v28 = [v23 types];
          id v29 = [v28 objectForKeyedSubscript:@"public.file-url"];
          v66 = [v29 uuid];

          v30 = [v23 types];
          v31 = [v30 objectForKeyedSubscript:@"public.file-url"];
          v32 = [(UCStreamCoderV2 *)v67 fetchDataForType:v31];

          v33 = [v23 types];
          long long v34 = [v33 objectForKeyedSubscript:@"com.apple.security.sandbox-extension-dict"];
          v35 = [(UCStreamCoderV2 *)v67 fetchDataForType:v34];

          v36 = +[NSURL URLWithDataRepresentation:v32 relativeToURL:0];
          v37 = +[NSPropertyListSerialization propertyListWithData:v35 options:0 format:0 error:0];
          if (v37)
          {
            int v38 = [v36 path];
            __int16 v39 = [v37 objectForKeyedSubscript:v38];
            int v40 = sub_10000BA18(@"pasteboard-server");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v81 = (uint64_t)v39;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "[CODERV2] Got extension data: %@", buf, 0xCu);
            }

            if (v39 && (id v41 = v39, [v41 bytes]))
            {
              [v41 bytes];
              uint64_t v42 = sandbox_extension_consume();
            }
            else
            {
              uint64_t v42 = -1;
            }
            __int16 v43 = sub_10000BA18(@"pasteboard-server");
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v81 = v42;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "[CODERV2] Got extension id: %lld", buf, 0xCu);
            }
          }
          else
          {
            v44 = [v36 path];
            v45 = +[UASharedPasteboardDataManager sharedInstance];
            v46 = [v45 fileURLForCloneItems];
            v47 = [v46 path];
            unsigned int v48 = [v44 hasPrefix:v47];

            if (!v48)
            {
              v60 = sub_10000BA18(@"pasteboard-server");
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "[CODERV2] Error getting sandbox info", buf, 2u);
              }

              [(UCStreamCoderV2 *)v67 sendStopWithError:-122];
              goto LABEL_38;
            }
            int v38 = sub_10000BA18(&stru_1000C6800);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[CODERV2] Archiving item in our clone dir, no need for sandbox ext", buf, 2u);
            }
            uint64_t v42 = -1;
          }

          v49 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v81 = (uint64_t)v36;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "[CODERV2] Starting to archive %@", buf, 0xCu);
          }

          v50 = [UCArchiver alloc];
          v51 = [v66 UUIDString];
          v52 = [(UCArchiver *)v50 initWithURL:v36 typeUUID:v51];

          [(UCStreamCoderV2 *)v67 storeObject:v52];
          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472;
          v68[2] = sub_100021D88;
          v68[3] = &unk_1000C4F58;
          v68[4] = v67;
          id v53 = v36;
          id v69 = v53;
          id v54 = v66;
          id v70 = v54;
          uint64_t v72 = v42;
          v55 = v52;
          v71 = v55;
          [(UCArchiver *)v55 archiveURLWithCompletion:v68];
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  v56 = [(UCStreamCoderV2 *)v67 objects];
  BOOL v57 = [v56 count] == 0;

  if (v57)
  {
    v58 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      v59 = +[NSNumber numberWithInteger:[(UCStreamCoderV2 *)v67 totalSendSize]];
      *(_DWORD *)buf = 138412290;
      uint64_t v81 = (uint64_t)v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "[CODERV2] No files to archive, total send size: %@", buf, 0xCu);
    }
    [(UCStreamCoderV2 *)v67 sendTotalSendSize];
  }
  [(UCStreamCoderV2 *)v67 setState:1];
LABEL_38:
  objc_destroyWeak(&v78);
  objc_destroyWeak(&location);
}

- (void)sendCompletedWithError:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(UCStreamCoderV2 *)v5 sendErrorHandler];

  if (v6)
  {
    int64_t v7 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[CODERV2] Calling pasteboard sent handler", buf, 2u);
    }

    double v8 = [(UCStreamCoderV2 *)v5 sendErrorHandler];
    unint64_t v9 = [(UCStreamCoderV2 *)v5 streamHandler];
    ((void (**)(void, UCStreamCoderV2 *, id, id))v8)[2](v8, v5, [v9 totalBytesSent], v4);

    [(UCStreamCoderV2 *)v5 setSendErrorHandler:0];
  }
  else
  {
    double v10 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[CODERV2] Skipping call to pasteboard sent handler", v14, 2u);
    }
  }
  objc_sync_exit(v5);

  double v11 = [(UCStreamCoderV2 *)v5 watchdog];
  [v11 cancel];

  id v12 = [(UCStreamCoderV2 *)v5 heartBeatTrigger];
  dispatch_source_t v13 = v12;
  if (v12)
  {
    dispatch_source_cancel(v12);
    [(UCStreamCoderV2 *)v5 setHeartBeatTrigger:0];
  }
  [(UCStreamCoderV2 *)v5 setState:8];
}

- (void)packager:(id)a3 gotData:(id)a4 forPacket:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 tag];
  double v11 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 67109376;
    *(_DWORD *)v30 = a5;
    *(_WORD *)&v30[4] = 2048;
    *(void *)&v30[6] = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[CODERV2] Got data from packager, packet #: %d, tag: %ld", (uint8_t *)&v29, 0x12u);
  }

  if ([v8 totalPacketCount] == (id)a5)
  {
    id v12 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_source_t v13 = [v8 uuid];
      int v29 = 134218242;
      *(void *)v30 = v10;
      *(_WORD *)&v30[8] = 2114;
      *(void *)&v30[10] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CODERV2] Finished sending packages: %ld / %{public}@", (uint8_t *)&v29, 0x16u);
    }
    id v14 = [(UCStreamCoderV2 *)self filePackager];
    BOOL v15 = v14 == v8;

    if (v15)
    {
      [(UCStreamCoderV2 *)self setFilePackager:0];
    }
    else
    {
      unsigned int v16 = [v8 uuid];

      if (v16)
      {
        NSErrorUserInfoKey v17 = [(UCStreamCoderV2 *)self archiveQueue];
        objc_sync_enter(v17);
        CFStringRef v18 = [(UCStreamCoderV2 *)self archivePackagers];
        id v19 = [v8 uuid];
        [v18 setObject:0 forKeyedSubscript:v19];

        id v20 = [(UCStreamCoderV2 *)self archiveQueue];
        id v21 = [v8 uuid];
        [v20 removeObject:v21];

        objc_sync_exit(v17);
      }
    }
  }
  if (v10)
  {
    id v22 = objc_alloc_init((Class)NSMutableDictionary);
    id v23 = +[NSNumber numberWithInteger:a5];
    [v22 setObject:v23 forKeyedSubscript:@"packetNum"];

    v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 totalPacketCount]);
    [v22 setObject:v24 forKeyedSubscript:@"totalNum"];

    [v22 setObject:v9 forKeyedSubscript:@"data"];
    long long v25 = [v8 uuid];

    if (v25)
    {
      unsigned int v26 = [v8 uuid];
      [v22 setObject:v26 forKeyedSubscript:@"uuid"];
    }
    long long v27 = [(UCStreamCoderV2 *)self packMessage:v22];
    long long v28 = [(UCStreamCoderV2 *)self streamHandler];
    [v28 writeMessage:v27 tag:v10];
  }
}

- (void)filePackagerError:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[CODERV2] Error from packager: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(UCStreamCoderV2 *)self sendStopWithError:-122];
  [(UCStreamCoderV2 *)self sendCompletedWithError:v4];
}

- (id)packMessage:(id)a3
{
  double v3 = (void *)_UACopyPackedDataForObject();

  return v3;
}

- (id)unpackMessage:(id)a3
{
  id v3 = a3;
  [v3 bytes];
  [v3 length];

  id v4 = (void *)_UACopyUnpackedObjectFromData();

  return v4;
}

- (id)fetchDataForType:(id)a3
{
  id v4 = a3;
  id v5 = [(UCStreamCoderV2 *)self sendingDataFile];
  objc_sync_enter(v5);
  int v6 = [(UCStreamCoderV2 *)self sendingDataFile];
  id v7 = [v4 offset];
  objc_msgSend(v6, "seekToFileOffset:", objc_msgSend(v7, "unsignedLongLongValue"));

  id v8 = [(UCStreamCoderV2 *)self sendingDataFile];
  id v9 = objc_msgSend(v8, "readDataOfLength:", objc_msgSend(v4, "size"));

  id v10 = [(UCStreamCoderV2 *)self sendingDataFile];
  [v10 seekToFileOffset:0];

  objc_sync_exit(v5);

  return v9;
}

- (UAStreamHandler)streamHandler
{
  return (UAStreamHandler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStreamHandler:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (NSDictionary)auxStateInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAuxStateInfo:(id)a3
{
}

- (NSMutableArray)objects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObjects:(id)a3
{
}

- (UADispatchWatchdog)watchdog
{
  return (UADispatchWatchdog *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWatchdog:(id)a3
{
}

- (OS_dispatch_source)heartBeatTrigger
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHeartBeatTrigger:(id)a3
{
}

- (id)infoRecvHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setInfoRecvHandler:(id)a3
{
}

- (id)fileRecvHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setFileRecvHandler:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)receivedInfo
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 80, 1);
}

- (void)setReceivedInfo:(id)a3
{
}

- (NSFileHandle)receivingDataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setReceivingDataFile:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 96, 1);
}

- (void)setProgress:(id)a3
{
}

- (int64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void)setBytesReceived:(int64_t)a3
{
  self->_bytesReceived = a3;
}

- (BOOL)remoteHasFiles
{
  return self->_remoteHasFiles;
}

- (void)setRemoteHasFiles:(BOOL)a3
{
  self->_remoteHasFiles = a3;
}

- (BOOL)returnInfoEarly
{
  return self->_returnInfoEarly;
}

- (void)setReturnInfoEarly:(BOOL)a3
{
  self->_returnInfoEarly = a3;
}

- (OS_dispatch_semaphore)itemsLockedSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 112, 1);
}

- (void)setItemsLockedSem:(id)a3
{
}

- (NSMutableDictionary)uuidItemMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUuidItemMap:(id)a3
{
}

- (unint64_t)streamStartTime
{
  return self->_streamStartTime;
}

- (void)setStreamStartTime:(unint64_t)a3
{
  self->_streamStartTime = a3;
}

- (int64_t)expectedLength
{
  return self->_expectedLength;
}

- (void)setExpectedLength:(int64_t)a3
{
  self->_expectedLength = a3;
}

- (id)sendErrorHandler
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setSendErrorHandler:(id)a3
{
}

- (UASharedPasteboardInfoWrapper)sendingInfo
{
  return (UASharedPasteboardInfoWrapper *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSendingInfo:(id)a3
{
}

- (NSFileHandle)sendingDataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSendingDataFile:(id)a3
{
}

- (UCFilePackager)filePackager
{
  return (UCFilePackager *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFilePackager:(id)a3
{
}

- (NSMutableDictionary)archivePackagers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setArchivePackagers:(id)a3
{
}

- (NSMutableArray)archiveQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setArchiveQueue:(id)a3
{
}

- (NSMutableArray)requestedArchives
{
  return (NSMutableArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setRequestedArchives:(id)a3
{
}

- (int64_t)totalSendSize
{
  return self->_totalSendSize;
}

- (void)setTotalSendSize:(int64_t)a3
{
  self->_totalSendSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedArchives, 0);
  objc_storeStrong((id *)&self->_archiveQueue, 0);
  objc_storeStrong((id *)&self->_archivePackagers, 0);
  objc_storeStrong((id *)&self->_filePackager, 0);
  objc_storeStrong((id *)&self->_sendingDataFile, 0);
  objc_storeStrong((id *)&self->_sendingInfo, 0);
  objc_storeStrong(&self->_sendErrorHandler, 0);
  objc_storeStrong((id *)&self->_uuidItemMap, 0);
  objc_storeStrong((id *)&self->_itemsLockedSem, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_receivingDataFile, 0);
  objc_storeStrong((id *)&self->_receivedInfo, 0);
  objc_storeStrong(&self->_fileRecvHandler, 0);
  objc_storeStrong(&self->_infoRecvHandler, 0);
  objc_storeStrong((id *)&self->_heartBeatTrigger, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_auxStateInfo, 0);

  objc_storeStrong((id *)&self->_streamHandler, 0);
}

@end