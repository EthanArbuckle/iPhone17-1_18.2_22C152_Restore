@interface TSPCryptoTranscodeReadChannel
- (TSPCryptoTranscodeReadChannel)init;
- (TSPCryptoTranscodeReadChannel)initWithReadChannel:(id)a3 decryptionInfo:(id)a4 encryptionInfo:(id)a5;
- (void)close;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
@end

@implementation TSPCryptoTranscodeReadChannel

- (TSPCryptoTranscodeReadChannel)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C7358);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPCryptoTranscodeReadChannel init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoTranscodeReadChannel.mm";
    __int16 v14 = 1024;
    int v15 = 33;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoTranscodeReadChannel init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoTranscodeReadChannel.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:33 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPCryptoTranscodeReadChannel init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPCryptoTranscodeReadChannel)initWithReadChannel:(id)a3 decryptionInfo:(id)a4 encryptionInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TSPCryptoTranscodeReadChannel;
  v11 = [(TSPCryptoTranscodeReadChannel *)&v19 init];
  if (v11)
  {
    if (v9)
    {
      __int16 v12 = [TSPCryptoReadChannel alloc];
      v13 = [v9 cryptoKey];
      __int16 v14 = [v9 blockInfos];
      int v15 = [(TSPCryptoReadChannel *)v12 initWithReadChannel:v8 decryptionKey:v13 blockInfos:v14];
      readChannel = v11->_readChannel;
      v11->_readChannel = (TSUStreamReadChannel *)v15;
    }
    else
    {
      v17 = (TSUStreamReadChannel *)v8;
      v13 = v11->_readChannel;
      v11->_readChannel = v17;
    }

    objc_storeStrong((id *)&v11->_encryptionInfo, a5);
    if (!v11->_readChannel)
    {

      v11 = 0;
    }
  }

  return v11;
}

- (void)readWithHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_encryptionInfo)
  {
    v6 = [[TSPIOHandlerWriteChannelAdapter alloc] initWithHandler:v4];
    id v7 = [[TSPCryptoComponentWriteChannel alloc] initWithWriteChannel:v6 encryptionInfo:self->_encryptionInfo];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    char v19 = 0;
    readChannel = self->_readChannel;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002F31C;
    v14[3] = &unk_1001C7380;
    v17 = v18;
    id v9 = v6;
    int v15 = v9;
    v16 = v7;
    id v10 = v7;
    [(TSUStreamReadChannel *)readChannel readWithHandler:v14];

    _Block_object_dispose(v18, 8);
  }
  else
  {
    v11 = self->_readChannel;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002F3F4;
    v12[3] = &unk_1001C73A8;
    v13 = (TSPIOHandlerWriteChannelAdapter *)v4;
    [(TSUStreamReadChannel *)v11 readWithHandler:v12];
    id v9 = v13;
  }
}

- (void)close
{
  [(TSUStreamReadChannel *)self->_readChannel close];
  readChannel = self->_readChannel;
  self->_readChannel = 0;
}

- (void)readWithHandlerAndWait:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionInfo, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end