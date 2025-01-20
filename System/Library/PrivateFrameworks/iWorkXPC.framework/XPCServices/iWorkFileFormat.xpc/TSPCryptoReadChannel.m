@interface TSPCryptoReadChannel
- (TSPCryptoReadChannel)init;
- (TSPCryptoReadChannel)initWithReadChannel:(id)a3 decryptionKey:(id)a4 blockInfos:(id)a5;
- (void)_readBlocksWithHandler:(id)a3;
- (void)_resetCryptor;
- (void)close;
- (void)dealloc;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
@end

@implementation TSPCryptoReadChannel

- (TSPCryptoReadChannel)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C5D50);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPCryptoReadChannel init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoReadChannel.mm";
    __int16 v14 = 1024;
    int v15 = 37;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoReadChannel init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoReadChannel.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:37 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPCryptoReadChannel init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPCryptoReadChannel)initWithReadChannel:(id)a3 decryptionKey:(id)a4 blockInfos:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)TSPCryptoReadChannel;
  __int16 v12 = [(TSPCryptoReadChannel *)&v26 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_27;
  }
  if (!v9)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5D70);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001607B8();
    }
    __int16 v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:blockInfos:]");
    int v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoReadChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 43, 0, "invalid nil value for '%{public}s'", "readChannel");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  objc_storeStrong((id *)&v12->_readChannel, a3);
  if (!v10)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5D90);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016071C();
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:blockInfos:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoReadChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 46, 0, "invalid nil value for '%{public}s'", "decryptionKey");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  p_decryptionKey = (id *)&v12->_decryptionKey;
  objc_storeStrong(p_decryptionKey, a4);
  v19 = (NSArray *)[v11 copy];
  blockInfos = v13->_blockInfos;
  v13->_blockInfos = v19;

  if (!v13->_readChannel || !*p_decryptionKey)
  {
LABEL_24:

    v13 = 0;
    goto LABEL_27;
  }
  v21 = (char *)malloc_type_malloc(0x10uLL, 0xFDD4414DuLL);
  v13->_iv = v21;
  if (!v21)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5DB0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100160694();
    }
    v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:blockInfos:]");
    v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoReadChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:62 isFatal:0 description:"Failed to allocate space for IV"];

    +[TSUAssertionHandler logBacktraceThrottled];
    goto LABEL_24;
  }
  if ([(NSArray *)v13->_blockInfos count])
  {
    v22 = [(NSArray *)v13->_blockInfos objectAtIndexedSubscript:0];
    v13->_remainingBlockSize = (unint64_t)[v22 encodedLength];
  }
  else
  {
    v13->_remainingBlockSize = -1;
  }
  v13->_nextBlockIndex = 0;
LABEL_27:

  return v13;
}

- (void)dealloc
{
  [(TSPCryptoReadChannel *)self close];
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  iv = self->_iv;
  if (iv)
  {
    free(iv);
    self->_iv = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSPCryptoReadChannel;
  [(TSPCryptoReadChannel *)&v5 dealloc];
}

- (void)close
{
  [(TSUStreamReadChannel *)self->_readChannel close];
  readChannel = self->_readChannel;
  self->_readChannel = 0;
}

- (void)readWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000153C0;
  v4[3] = &unk_1001C5F40;
  objc_super v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(TSPCryptoReadChannel *)v5 _readBlocksWithHandler:v4];
}

- (void)readWithHandlerAndWait:(id)a3
{
}

- (void)_readBlocksWithHandler:(id)a3
{
  id v4 = a3;
  readChannel = self->_readChannel;
  if (!readChannel)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C5F60);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100160C6C();
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPCryptoReadChannel _readBlocksWithHandler:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPCryptoReadChannel.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:277 isFatal:0 description:"Read channel is already closed"];

    +[TSUAssertionHandler logBacktraceThrottled];
    readChannel = self->_readChannel;
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100016AB8;
  v9[3] = &unk_1001C5F88;
  id v11 = v12;
  id v8 = v4;
  v9[4] = self;
  id v10 = v8;
  [(TSUStreamReadChannel *)readChannel readWithHandler:v9];

  _Block_object_dispose(v12, 8);
}

- (void)_resetCryptor
{
  holdData = self->_holdData;
  self->_holdData = 0;

  self->_ivRead = 0;
  self->_initialBytesIgnored = 0;
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdData, 0);
  objc_storeStrong((id *)&self->_blockInfos, 0);
  objc_storeStrong((id *)&self->_decryptionKey, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end