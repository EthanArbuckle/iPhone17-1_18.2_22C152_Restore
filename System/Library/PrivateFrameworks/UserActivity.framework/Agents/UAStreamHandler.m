@interface UAStreamHandler
- (BOOL)dataHasMessage:(id)a3;
- (BOOL)shouldStop;
- (BOOL)shouldTryWrite;
- (BOOL)writeMessage:(id)a3 tag:(int64_t)a4;
- (BOOL)writeRawData:(id)a3;
- (NSData)inMessage;
- (NSError)streamError;
- (NSInputStream)inStream;
- (NSMutableArray)messageQueue;
- (NSMutableData)inData;
- (NSMutableData)outMessage;
- (NSMutableData)outputStreamData;
- (NSOutputStream)outStream;
- (UAStreamHandler)initWithInputStream:(id)a3 outputStream:(id)a4 delegate:(id)a5;
- (UAStreamHandlerDelegate)delegate;
- (UATimedPowerAssertions)assertionForRead;
- (UATimedPowerAssertions)assertionForWrite;
- (id)trimFirstBytes:(unint64_t)a3 ofData:(id)a4;
- (int64_t)byteIndex;
- (int64_t)bytesRead;
- (int64_t)handleSpaceAvailable;
- (int64_t)inMessageTag;
- (int64_t)outMessageTag;
- (int64_t)queueCount;
- (int64_t)totalBytesReceived;
- (int64_t)totalBytesSent;
- (int64_t)tryWriteMessage;
- (int64_t)tryWriteRawData;
- (unint64_t)inputState;
- (unint64_t)outputMode;
- (unsigned)inMessageLength;
- (void)_stop;
- (void)handleBytesAvailable;
- (void)handleMessageRead;
- (void)handleOpenCompleted;
- (void)processHeader;
- (void)setAssertionForRead:(id)a3;
- (void)setAssertionForWrite:(id)a3;
- (void)setByteIndex:(int64_t)a3;
- (void)setBytesRead:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInData:(id)a3;
- (void)setInMessage:(id)a3;
- (void)setInMessageLength:(unsigned int)a3;
- (void)setInMessageTag:(int64_t)a3;
- (void)setInStream:(id)a3;
- (void)setInputState:(unint64_t)a3;
- (void)setMessageQueue:(id)a3;
- (void)setOutMessage:(id)a3;
- (void)setOutMessageTag:(int64_t)a3;
- (void)setOutStream:(id)a3;
- (void)setOutputMode:(unint64_t)a3;
- (void)setOutputStreamData:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setShouldTryWrite:(BOOL)a3;
- (void)setStreamError:(id)a3;
- (void)setTotalBytesReceived:(int64_t)a3;
- (void)setTotalBytesSent:(int64_t)a3;
- (void)start;
- (void)stop;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)tryStop;
@end

@implementation UAStreamHandler

- (UAStreamHandler)initWithInputStream:(id)a3 outputStream:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UAStreamHandler;
  v11 = [(UAStreamHandler *)&v17 init];
  v12 = v11;
  if (v11)
  {
    [(UAStreamHandler *)v11 setDelegate:v10];
    [(UAStreamHandler *)v12 setInStream:v8];
    [(UAStreamHandler *)v12 setOutStream:v9];
    [(UAStreamHandler *)v12 setInputState:0];
    [(UAStreamHandler *)v12 setOutputMode:0];
    id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    [(UAStreamHandler *)v12 setMessageQueue:v13];

    id v14 = objc_alloc_init((Class)NSMutableData);
    [(UAStreamHandler *)v12 setInData:v14];

    id v15 = objc_alloc_init((Class)NSMutableData);
    [(UAStreamHandler *)v12 setOutputStreamData:v15];

    [(UAStreamHandler *)v12 setByteIndex:0];
    [(UAStreamHandler *)v12 setBytesRead:0];
    [(UAStreamHandler *)v12 setTotalBytesSent:0];
    [(UAStreamHandler *)v12 setTotalBytesReceived:0];
    [(UAStreamHandler *)v12 setInMessage:0];
    [(UAStreamHandler *)v12 setOutMessage:0];
    [(UAStreamHandler *)v12 setStreamError:0];
    [(UAStreamHandler *)v12 setShouldStop:0];
  }

  return v12;
}

- (int64_t)queueCount
{
  v3 = [(UAStreamHandler *)self messageQueue];
  id v4 = [v3 count];

  v5 = [(UAStreamHandler *)self outMessage];

  if (v5) {
    return (int64_t)v4 + 1;
  }
  else {
    return (int64_t)v4;
  }
}

- (void)start
{
  v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20.version) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[STREAM HAND] Starting Streams", (uint8_t *)&v20, 2u);
  }

  id v4 = [(UAStreamHandler *)self inStream];
  id v5 = [v4 streamStatus];

  if (!v5)
  {
    v6 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[STREAM HAND] Starting Input Stream", (uint8_t *)&v20, 2u);
    }

    v7 = [(UAStreamHandler *)self inStream];
    id v8 = +[NSRunLoop mainRunLoop];
    [v7 scheduleInRunLoop:v8 forMode:NSDefaultRunLoopMode];

    id v9 = [(UAStreamHandler *)self inStream];
    CFReadStreamSetClient(v9, 0x1BuLL, (CFReadStreamClientCallBack)sub_1000394D0, &v20);

    id v10 = [(UAStreamHandler *)self inStream];
    [v10 open];
  }
  v11 = [(UAStreamHandler *)self outStream];
  id v12 = [v11 streamStatus];

  if (!v12)
  {
    id v13 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[STREAM HAND] Starting Output Stream", (uint8_t *)&v20, 2u);
    }

    id v14 = [(UAStreamHandler *)self outStream];
    id v15 = +[NSRunLoop mainRunLoop];
    [v14 scheduleInRunLoop:v15 forMode:NSDefaultRunLoopMode];

    v16 = [(UAStreamHandler *)self outStream];
    [v16 setDelegate:self];

    objc_super v17 = [(UAStreamHandler *)self outStream];
    [v17 open];
  }
  v18 = [[UATimedPowerAssertions alloc] initWithName:@"clipboardReadStream" delta:&_dispatch_main_q queue:60.0];
  [(UAStreamHandler *)self setAssertionForRead:v18];

  v19 = [[UATimedPowerAssertions alloc] initWithName:@"clipboardWriteStream" delta:&_dispatch_main_q queue:60.0];
  [(UAStreamHandler *)self setAssertionForWrite:v19];
}

- (void)stop
{
  v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[STREAM HAND] Call to stop streams", v6, 2u);
  }

  id v4 = [(UAStreamHandler *)self assertionForRead];
  [v4 releaseAssertion];

  [(UAStreamHandler *)self setAssertionForWrite:0];
  id v5 = [(UAStreamHandler *)self assertionForWrite];
  [v5 releaseAssertion];

  [(UAStreamHandler *)self setAssertionForWrite:0];
  [(UAStreamHandler *)self setShouldStop:1];
  [(UAStreamHandler *)self tryStop];
}

- (void)tryStop
{
  v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[STREAM HAND] Trying to stop streams", v8, 2u);
  }

  if ([(UAStreamHandler *)self shouldStop])
  {
    id v4 = [(UAStreamHandler *)self outputStreamData];
    if ([v4 length])
    {
LABEL_7:

      return;
    }
    id v5 = [(UAStreamHandler *)self outMessage];
    if (v5)
    {

      goto LABEL_7;
    }
    v6 = [(UAStreamHandler *)self messageQueue];
    id v7 = [v6 count];

    if (!v7) {
      [(UAStreamHandler *)self _stop];
    }
  }
}

- (void)_stop
{
  v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[STREAM HAND] Stoping streams", v14, 2u);
  }

  id v4 = [(UAStreamHandler *)self inStream];

  if (v4)
  {
    id v5 = [(UAStreamHandler *)self inStream];
    [v5 close];

    v6 = [(UAStreamHandler *)self inStream];
    [v6 setDelegate:0];

    [(UAStreamHandler *)self setInStream:0];
  }
  id v7 = [(UAStreamHandler *)self outStream];

  if (v7)
  {
    id v8 = [(UAStreamHandler *)self outStream];
    [v8 close];

    id v9 = [(UAStreamHandler *)self outStream];
    [v9 setDelegate:0];

    [(UAStreamHandler *)self setOutStream:0];
  }
  id v10 = [(UAStreamHandler *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(UAStreamHandler *)self delegate];
    id v13 = [(UAStreamHandler *)self streamError];
    [v12 streamsDidClose:self withError:v13];
  }
}

- (BOOL)writeRawData:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    id v13 = [v4 length];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[STREAM HAND] Write raw data of length: %ld", (uint8_t *)&v12, 0xCu);
  }

  unint64_t v6 = [(UAStreamHandler *)self outputMode];
  if (v6 == 1)
  {
    id v10 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[STREAM HAND] Cannot write raw data, in message mode", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    if (![(UAStreamHandler *)self outputMode]) {
      [(UAStreamHandler *)self setOutputMode:2];
    }
    id v7 = [(UAStreamHandler *)self outputStreamData];
    [v7 appendData:v4];

    id v8 = [(UAStreamHandler *)self outStream];
    unsigned int v9 = [v8 hasSpaceAvailable];

    if (v9) {
      [(UAStreamHandler *)self tryWriteRawData];
    }
  }

  return v6 != 1;
}

- (BOOL)writeMessage:(id)a3 tag:(int64_t)a4
{
  id v6 = a3;
  id v7 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v20 = a4;
    __int16 v21 = 2048;
    id v22 = [v6 length];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[STREAM HAND] Write message tagged %ld of length: %ld", buf, 0x16u);
  }

  unint64_t v8 = [(UAStreamHandler *)self outputMode];
  if (v8 != 2)
  {
    if (![(UAStreamHandler *)self outputMode]) {
      [(UAStreamHandler *)self setOutputMode:1];
    }
    char v18 = 67;
    id v9 = [objc_alloc((Class)NSMutableData) initWithBytes:&v18 length:1];
    char v17 = 1;
    [v9 appendBytes:&v17 length:1];
    *(_DWORD *)buf = bswap32(a4);
    [v9 appendBytes:buf length:4];
    unsigned int v16 = bswap32([v6 length]);
    [v9 appendBytes:&v16 length:4];
    [v9 appendData:v6];
    id v10 = [(UAStreamHandler *)self messageQueue];
    objc_sync_enter(v10);
    char v11 = [(UAStreamHandler *)self messageQueue];
    [v11 addObject:v9];

    objc_sync_exit(v10);
    int v12 = [(UAStreamHandler *)self outStream];
    if ([v12 hasSpaceAvailable])
    {
    }
    else
    {
      unsigned __int8 v14 = [(UAStreamHandler *)self shouldTryWrite];

      if ((v14 & 1) == 0)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    [(UAStreamHandler *)self tryWriteMessage];
    goto LABEL_13;
  }
  id v13 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[STREAM HAND] Cannot write message, in raw data mode", buf, 2u);
  }

LABEL_14:
  return v8 != 2;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  unint64_t v8 = v7;
  switch(a4)
  {
    case 1uLL:
      [(UAStreamHandler *)v7 handleOpenCompleted];
      break;
    case 2uLL:
      [(UAStreamHandler *)v7 handleBytesAvailable];
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      if ([(UAStreamHandler *)v7 handleSpaceAvailable])
      {
        id v9 = v8;
        uint64_t v10 = 0;
      }
      else
      {
        unsigned __int8 v14 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          LOWORD(v15) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[STREAM HAND] Did not write anything, setting flag", (uint8_t *)&v15, 2u);
        }

        id v9 = v8;
        uint64_t v10 = 1;
      }
      [(UAStreamHandler *)v9 setShouldTryWrite:v10];
      break;
    case 8uLL:
      char v11 = [v6 streamError];
      [(UAStreamHandler *)v8 setStreamError:v11];

      int v12 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [(UAStreamHandler *)v8 streamError];
        int v15 = 138543618;
        id v16 = v6;
        __int16 v17 = 2114;
        char v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[STREAM HAND] Received error on stream %{public}@: %{public}@", (uint8_t *)&v15, 0x16u);
      }
      goto LABEL_11;
    default:
      if (a4 == 16) {
LABEL_11:
      }
        [(UAStreamHandler *)v8 _stop];
      break;
  }
}

- (void)handleOpenCompleted
{
  id v6 = [(UAStreamHandler *)self inStream];
  if ((unint64_t)[v6 streamStatus] <= 1)
  {
  }
  else
  {
    v3 = [(UAStreamHandler *)self outStream];
    id v4 = [v3 streamStatus];

    if ((unint64_t)v4 >= 2)
    {
      id v5 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[STREAM HAND] Both Streams opened", buf, 2u);
      }
    }
  }
}

- (void)handleBytesAvailable
{
  if (![(UAStreamHandler *)self inputState])
  {
    uint64_t v3 = 10 - [(UAStreamHandler *)self bytesRead];
    goto LABEL_5;
  }
  if ((id)[(UAStreamHandler *)self inputState] != (id)2)
  {
    if ((id)[(UAStreamHandler *)self inputState] != (id)1) {
      return;
    }
    uint64_t v4 = [(UAStreamHandler *)self inMessageLength];
    int64_t v5 = [(UAStreamHandler *)self bytesRead];
    uint64_t v6 = v4 - v5;
    uint64_t v3 = 0x10000;
    if ((unint64_t)(v4 - v5) >= 0x10000) {
      uint64_t v6 = 0x10000;
    }
    if (v4 == v5) {
      goto LABEL_11;
    }
    uint64_t v3 = v6;
LABEL_5:
    if (v3 < 1) {
      return;
    }
    goto LABEL_11;
  }
  uint64_t v3 = 0x10000;
LABEL_11:
  id v7 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = [(UAStreamHandler *)self inStream];
  uint64_t v9 = (uint64_t)[v8 read:v7 maxLength:v3];

  if (v9 >= 1)
  {
    uint64_t v10 = [(UAStreamHandler *)self inData];
    [v10 appendBytes:v7 length:v9];

    [(UAStreamHandler *)self setBytesRead:(char *)[(UAStreamHandler *)self bytesRead] + v9];
    [(UAStreamHandler *)self setTotalBytesReceived:(char *)[(UAStreamHandler *)self totalBytesReceived] + v9];
    if ([(UAStreamHandler *)self inputState])
    {
      if ((id)[(UAStreamHandler *)self inputState] == (id)1)
      {
        int64_t v11 = [(UAStreamHandler *)self bytesRead];
        if (v11 == [(UAStreamHandler *)self inMessageLength])
        {
          [(UAStreamHandler *)self handleMessageRead];
        }
        else if (self->_bytesRead > self->_inMessageLength)
        {
          [(UAStreamHandler *)self _stop];
        }
      }
    }
    else if ((id)[(UAStreamHandler *)self bytesRead] == (id)10)
    {
      int v12 = [(UAStreamHandler *)self inData];
      unsigned int v13 = [(UAStreamHandler *)self dataHasMessage:v12];

      if (v13) {
        [(UAStreamHandler *)self processHeader];
      }
      else {
        [(UAStreamHandler *)self setInputState:2];
      }
    }
    if ((id)[(UAStreamHandler *)self inputState] == (id)2)
    {
      unsigned __int8 v14 = [(UAStreamHandler *)self inData];
      id v15 = [v14 copy];

      id v16 = [(UAStreamHandler *)self inData];
      [v16 setLength:0];

      __int16 v17 = [(UAStreamHandler *)self delegate];
      char v18 = objc_opt_respondsToSelector();

      if (v18)
      {
        v19 = [(UAStreamHandler *)self delegate];
        [v19 streams:self didReadRawData:v15];
      }
    }
    int64_t v20 = [(UAStreamHandler *)self assertionForRead];
    [v20 updateTimeUntilAssertionRelease:60.0];
  }
}

- (void)processHeader
{
  id v3 = [(UAStreamHandler *)self inData];
  -[UAStreamHandler setInMessageTag:](self, "setInMessageTag:", bswap32(*(_DWORD *)((char *)[v3 bytes] + 2)));

  id v4 = [(UAStreamHandler *)self inData];
  -[UAStreamHandler setInMessageLength:](self, "setInMessageLength:", bswap32(*(_DWORD *)((char *)[v4 bytes] + 6)));

  [(UAStreamHandler *)self setBytesRead:(char *)[(UAStreamHandler *)self bytesRead] - 10];
  [(UAStreamHandler *)self setInputState:1];
  id v5 = [(UAStreamHandler *)self inData];
  [v5 setLength:0];
}

- (BOOL)dataHasMessage:(id)a3
{
  id v3 = a3;
  int v4 = *(unsigned __int8 *)[v3 bytes];
  id v5 = v3;
  uint64_t v6 = [v5 bytes];

  return v4 == 67 && v6[1] == 1;
}

- (void)handleMessageRead
{
  id v3 = [(UAStreamHandler *)self inData];
  id v4 = [v3 copy];
  [(UAStreamHandler *)self setInMessage:v4];

  id v5 = [(UAStreamHandler *)self delegate];
  uint64_t v6 = [(UAStreamHandler *)self inMessage];
  objc_msgSend(v5, "streams:didReadMessage:withTag:", self, v6, -[UAStreamHandler inMessageTag](self, "inMessageTag"));

  [(UAStreamHandler *)self setBytesRead:0];
  [(UAStreamHandler *)self setInMessageTag:0];
  [(UAStreamHandler *)self setInMessageLength:0];
  id v7 = [(UAStreamHandler *)self inData];
  [v7 setLength:0];

  [(UAStreamHandler *)self setInputState:0];
}

- (int64_t)handleSpaceAvailable
{
  if ((id)[(UAStreamHandler *)self outputMode] == (id)1)
  {
    return [(UAStreamHandler *)self tryWriteMessage];
  }
  else if ((id)[(UAStreamHandler *)self outputMode] == (id)2)
  {
    return [(UAStreamHandler *)self tryWriteRawData];
  }
  else
  {
    return 0;
  }
}

- (int64_t)tryWriteRawData
{
  id v3 = [(UAStreamHandler *)self outputStreamData];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = [(UAStreamHandler *)self outStream];
    id v6 = [(UAStreamHandler *)self outputStreamData];
    id v7 = [v6 bytes];
    unint64_t v8 = [(UAStreamHandler *)self outputStreamData];
    int64_t v9 = (int64_t)objc_msgSend(v5, "write:maxLength:", v7, objc_msgSend(v8, "length"));

    uint64_t v10 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 134217984;
      int64_t v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[STREAM HAND] Wrote %ld raw bytes to output stream", (uint8_t *)&v20, 0xCu);
    }

    if (v9 >= 1)
    {
      [(UAStreamHandler *)self setTotalBytesSent:(char *)[(UAStreamHandler *)self totalBytesSent] + v9];
      int64_t v11 = [(UAStreamHandler *)self outputStreamData];
      int v12 = [(UAStreamHandler *)self trimFirstBytes:v9 ofData:v11];
      [(UAStreamHandler *)self setOutputStreamData:v12];

      unsigned int v13 = [(UAStreamHandler *)self outputStreamData];
      id v14 = [v13 length];

      if (!v14)
      {
        id v15 = [(UAStreamHandler *)self delegate];
        uint64_t v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          __int16 v17 = [(UAStreamHandler *)self delegate];
          [v17 streamsDidWriteRawDataBuffer:self];
        }
      }
      char v18 = [(UAStreamHandler *)self assertionForWrite];
      [v18 updateTimeUntilAssertionRelease:60.0];
    }
  }
  else
  {
    int64_t v9 = 0;
  }
  [(UAStreamHandler *)self tryStop];
  return v9;
}

- (int64_t)tryWriteMessage
{
  id v3 = [(UAStreamHandler *)self outStream];
  objc_sync_enter(v3);
  id v4 = [(UAStreamHandler *)self outMessage];
  if (v4)
  {
  }
  else
  {
    id v5 = [(UAStreamHandler *)self messageQueue];
    id v6 = [v5 count];

    if (!v6) {
      goto LABEL_17;
    }
  }
  id v7 = [(UAStreamHandler *)self outMessage];

  if (!v7)
  {
    unint64_t v8 = [(UAStreamHandler *)self messageQueue];
    objc_sync_enter(v8);
    int64_t v9 = [(UAStreamHandler *)self messageQueue];
    uint64_t v10 = [v9 firstObject];
    [(UAStreamHandler *)self setOutMessage:v10];

    int64_t v11 = [(UAStreamHandler *)self messageQueue];
    [v11 removeObjectAtIndex:0];

    id v12 = [(UAStreamHandler *)self outMessage];
    -[UAStreamHandler setOutMessageTag:](self, "setOutMessageTag:", bswap32(*(_DWORD *)((char *)[v12 bytes] + 2)));

    [(UAStreamHandler *)self setByteIndex:0];
    objc_sync_exit(v8);
  }
  id v13 = [(UAStreamHandler *)self outMessage];
  id v14 = (char *)[v13 bytes];

  int64_t v15 = [(UAStreamHandler *)self byteIndex];
  uint64_t v16 = [(UAStreamHandler *)self outMessage];
  __int16 v17 = (char *)[v16 length];
  int64_t v18 = [(UAStreamHandler *)self byteIndex];

  v19 = [(UAStreamHandler *)self outStream];
  int v20 = v19;
  if ((unint64_t)&v17[-v18] >= 0x10000) {
    uint64_t v21 = 0x10000;
  }
  else {
    uint64_t v21 = (uint64_t)&v17[-v18];
  }
  int64_t v22 = (int64_t)[v19 write:&v14[v15] maxLength:v21];

  if (v22 < 1)
  {
    if (v22 < 0)
    {
      v33 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = [(UAStreamHandler *)self outStream];
        v35 = [v34 streamError];
        int v37 = 138543362;
        v38 = v35;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[STREAM HAND] Error writing message: %{public}@", (uint8_t *)&v37, 0xCu);
      }
      goto LABEL_24;
    }
    v29 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v37) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[STREAM HAND] Should not be writting 0 data to stream", (uint8_t *)&v37, 2u);
    }

LABEL_17:
    int64_t v22 = 0;
    goto LABEL_25;
  }
  [(UAStreamHandler *)self setByteIndex:(char *)[(UAStreamHandler *)self byteIndex] + v22];
  [(UAStreamHandler *)self setTotalBytesSent:(char *)[(UAStreamHandler *)self totalBytesSent] + v22];
  int64_t v23 = [(UAStreamHandler *)self byteIndex];
  v24 = [(UAStreamHandler *)self outMessage];
  id v25 = [v24 length];

  if ((id)v23 != v25)
  {
    unint64_t v30 = [(UAStreamHandler *)self byteIndex];
    v31 = [(UAStreamHandler *)self outMessage];
    id v32 = [v31 length];

    if (v30 <= (unint64_t)v32) {
      goto LABEL_25;
    }
    v33 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v37) = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[STREAM HAND] We should not be writting more data than we have!", (uint8_t *)&v37, 2u);
    }
LABEL_24:

    goto LABEL_25;
  }
  [(UAStreamHandler *)self setOutMessage:0];
  [(UAStreamHandler *)self setByteIndex:0];
  v26 = [(UAStreamHandler *)self delegate];
  char v27 = objc_opt_respondsToSelector();

  if (v27)
  {
    v28 = [(UAStreamHandler *)self delegate];
    objc_msgSend(v28, "streams:didWriteMessageWithTag:", self, -[UAStreamHandler outMessageTag](self, "outMessageTag"));
  }
LABEL_25:
  objc_sync_exit(v3);

  [(UAStreamHandler *)self tryStop];
  return v22;
}

- (id)trimFirstBytes:(unint64_t)a3 ofData:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(v5, "subdataWithRange:", a3, (char *)objc_msgSend(v5, "length") - a3);

  id v7 = +[NSMutableData dataWithData:v6];

  return v7;
}

- (NSInputStream)inStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInStream:(id)a3
{
}

- (NSOutputStream)outStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutStream:(id)a3
{
}

- (NSError)streamError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStreamError:(id)a3
{
}

- (UAStreamHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UAStreamHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableData)outputStreamData
{
  return (NSMutableData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutputStreamData:(id)a3
{
}

- (int64_t)byteIndex
{
  return self->_byteIndex;
}

- (void)setByteIndex:(int64_t)a3
{
  self->_byteIndex = a3;
}

- (int64_t)outMessageTag
{
  return self->_outMessageTag;
}

- (void)setOutMessageTag:(int64_t)a3
{
  self->_outMessageTag = a3;
}

- (NSMutableData)outMessage
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOutMessage:(id)a3
{
}

- (NSMutableArray)messageQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMessageQueue:(id)a3
{
}

- (int64_t)bytesRead
{
  return self->_bytesRead;
}

- (void)setBytesRead:(int64_t)a3
{
  self->_bytesRead = a3;
}

- (int64_t)inMessageTag
{
  return self->_inMessageTag;
}

- (void)setInMessageTag:(int64_t)a3
{
  self->_inMessageTag = a3;
}

- (unsigned)inMessageLength
{
  return self->_inMessageLength;
}

- (void)setInMessageLength:(unsigned int)a3
{
  self->_inMessageLength = a3;
}

- (NSData)inMessage
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInMessage:(id)a3
{
}

- (NSMutableData)inData
{
  return (NSMutableData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInData:(id)a3
{
}

- (unint64_t)inputState
{
  return self->_inputState;
}

- (void)setInputState:(unint64_t)a3
{
  self->_inputState = a3;
}

- (unint64_t)outputMode
{
  return self->_outputMode;
}

- (void)setOutputMode:(unint64_t)a3
{
  self->_outputMode = a3;
}

- (int64_t)totalBytesSent
{
  return self->_totalBytesSent;
}

- (void)setTotalBytesSent:(int64_t)a3
{
  self->_totalBytesSent = a3;
}

- (int64_t)totalBytesReceived
{
  return self->_totalBytesReceived;
}

- (void)setTotalBytesReceived:(int64_t)a3
{
  self->_totalBytesReceived = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)shouldTryWrite
{
  return self->_shouldTryWrite;
}

- (void)setShouldTryWrite:(BOOL)a3
{
  self->_shouldTryWrite = a3;
}

- (UATimedPowerAssertions)assertionForRead
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAssertionForRead:(id)a3
{
}

- (UATimedPowerAssertions)assertionForWrite
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAssertionForWrite:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionForWrite, 0);
  objc_storeStrong((id *)&self->_assertionForRead, 0);
  objc_storeStrong((id *)&self->_inData, 0);
  objc_storeStrong((id *)&self->_inMessage, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_outMessage, 0);
  objc_storeStrong((id *)&self->_outputStreamData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_storeStrong((id *)&self->_outStream, 0);

  objc_storeStrong((id *)&self->_inStream, 0);
}

@end