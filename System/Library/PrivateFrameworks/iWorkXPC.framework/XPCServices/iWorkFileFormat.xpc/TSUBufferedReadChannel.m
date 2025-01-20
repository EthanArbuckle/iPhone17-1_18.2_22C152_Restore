@interface TSUBufferedReadChannel
- (BOOL)isValid;
- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5;
- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6;
- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5;
- (void)_close;
- (void)_closeStreamReadChannel;
- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)_resetStreamReadChannelIfNeededForOffset:(int64_t)a3 length:(unint64_t)a4;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)dealloc;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
- (void)setLowWater:(unint64_t)a3;
- (void)setStreamReadChannelSourceHandler:(id)a3;
@end

@implementation TSUBufferedReadChannel

- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5
{
  return [(TSUBufferedReadChannel *)self initWithReadChannel:a3 sourceReadBufferSize:0x200000 blockInfos:a4 streamReadChannelBlock:a5];
}

- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)TSUBufferedReadChannel;
  id v14 = [(TSUBufferedReadChannel *)&v29 init];
  if (v14)
  {
    if (v11)
    {
      if (v13) {
        goto LABEL_4;
      }
    }
    else
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CD358);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100167060();
      }
      v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]");
      v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 70, 0, "invalid nil value for '%{public}s'", "sourceReadChannel");

      +[TSUAssertionHandler logBacktraceThrottled];
      if (v13)
      {
LABEL_4:
        if (a4) {
          goto LABEL_5;
        }
        goto LABEL_18;
      }
    }
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD378);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166FCC();
    }
    v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]");
    v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 71, 0, "invalid nil value for '%{public}s'", "streamReadChannelBlock");

    +[TSUAssertionHandler logBacktraceThrottled];
    if (a4)
    {
LABEL_5:
      if (v11 && v13)
      {
        v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v16 = dispatch_queue_create("TSUBufferedReadChannel.Read", v15);
        v17 = (void *)*((void *)v14 + 1);
        *((void *)v14 + 1) = v16;

        dispatch_queue_set_specific(*((dispatch_queue_t *)v14 + 1), off_1001EA508, off_1001EA508, 0);
        objc_storeStrong((id *)v14 + 2, a3);
        *((void *)v14 + 3) = a4;
        *((void *)v14 + 4) = 0x7FFFFFFFFFFFFFFFLL;
        id v18 = [v12 copy];
        v19 = (void *)*((void *)v14 + 7);
        *((void *)v14 + 7) = v18;

        id v20 = objc_retainBlock(v13);
        v21 = (void *)*((void *)v14 + 8);
        *((void *)v14 + 8) = v20;

        *((void *)v14 + 12) = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_24;
      }
LABEL_23:

      id v14 = 0;
      goto LABEL_24;
    }
LABEL_18:
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD398);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166F38();
    }
    v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]");
    v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 72, 0, "Buffer size too small: %zu", 0);

    +[TSUAssertionHandler logBacktraceThrottled];
    goto LABEL_23;
  }
LABEL_24:

  return (TSUBufferedReadChannel *)v14;
}

- (void)dealloc
{
  [(TSUBufferedReadChannel *)self _close];
  v3.receiver = self;
  v3.super_class = (Class)TSUBufferedReadChannel;
  [(TSUBufferedReadChannel *)&v3 dealloc];
}

- (void)close
{
  objc_super v3 = off_1001EA508;
  if (dispatch_get_specific(off_1001EA508) == v3) {
    goto LABEL_3;
  }
  uint64_t v4 = objc_opt_class();
  v5 = +[NSThread currentThread];
  v6 = [v5 threadDictionary];
  v7 = [v6 objectForKeyedSubscript:@"TSUBufferedReadChannelInvokingHandler"];
  v8 = TSUDynamicCast(v4, (uint64_t)v7);
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
LABEL_3:
    [(TSUBufferedReadChannel *)self _close];
  }
  else
  {
    readQueue = self->_readQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009760C;
    block[3] = &unk_1001C5A40;
    block[4] = self;
    dispatch_sync(readQueue, block);
  }
}

- (void)_close
{
  [(TSUBufferedReadChannel *)self _closeStreamReadChannel];
  [(TSUReadChannel *)self->_sourceReadChannel close];
  sourceReadChannel = self->_sourceReadChannel;
  self->_sourceReadChannel = 0;

  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = 0;
}

- (void)_closeStreamReadChannel
{
  [(TSUStreamReadChannel *)self->_streamReadChannel close];
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = 0;
}

- (void)_resetStreamReadChannelIfNeededForOffset:(int64_t)a3 length:(unint64_t)a4
{
  int64_t v5 = a3;
  int64_t streamOutputOffset = self->_streamOutputOffset;
  if (streamOutputOffset <= a3)
  {
    unint64_t streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
    unint64_t v9 = streamOutputOutstandingLength + streamOutputOffset;
    if (streamOutputOutstandingLength == -1 || v9 > a3) {
      return;
    }
  }
  [(TSUBufferedReadChannel *)self _closeStreamReadChannel];
  *(_OWORD *)&self->_sourceOffset = xmmword_10017F7E0;
  *(_OWORD *)&self->_int64_t streamOutputOffset = xmmword_10017F7E0;
  self->_streamOutputLength = 0;
  NSUInteger v11 = [(NSArray *)self->_blockInfos count];
  if (!v11)
  {
    v17 = 0;
    goto LABEL_33;
  }
  NSUInteger v12 = v11;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obj = self->_blockInfos;
  id v13 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (!v13)
  {
    v17 = 0;
    goto LABEL_32;
  }
  id v14 = v13;
  int64_t v15 = 0;
  dispatch_queue_t v16 = 0;
  v17 = 0;
  uint64_t v37 = *(void *)v40;
  unint64_t v34 = a4;
  int64_t v35 = v5;
  do
  {
    id v18 = 0;
    do
    {
      if (*(void *)v40 != v37) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v18);
      v15 += (int64_t)[v19 decodedLength];
      if (v16)
      {
        [v17 addObject:v19];
        self->_sourceLength += (unint64_t)[v19 encodedLength];
        dispatch_queue_t v16 = &v16[(void)[v19 decodedLength]];
        id v20 = (char *)[v19 decodedLength] + self->_streamOutputOutstandingLength;
      }
      else
      {
        if (v15 <= v5)
        {
          self->_sourceOffset += (int64_t)[v19 encodedLength];
          dispatch_queue_t v16 = 0;
          self->_streamOutputOffset += (int64_t)[v19 decodedLength];
          goto LABEL_23;
        }
        if (v17)
        {
          unsigned int v21 = +[TSUAssertionHandler _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001CD3B8);
          }
          v22 = TSUAssertCat_log_t;
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v44 = v21;
            __int16 v45 = 2082;
            v46 = "-[TSUBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:]";
            __int16 v47 = 2082;
            v48 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m";
            __int16 v49 = 1024;
            int v50 = 149;
            __int16 v51 = 2082;
            v52 = "blockInfos";
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected nil value for '%{public}s'", buf, 0x2Cu);
          }
          v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:]");
          v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m"];
          +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 149, 0, "expected nil value for '%{public}s'", "blockInfos");

          +[TSUAssertionHandler logBacktraceThrottled];
          a4 = v34;
        }
        id v25 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];

        [v25 addObject:v19];
        self->_sourceLength = (unint64_t)[v19 encodedLength];
        dispatch_queue_t v16 = (char *)[v19 decodedLength];
        id v20 = (char *)[v19 decodedLength];
        v17 = v25;
        int64_t v5 = v35;
      }
      self->_unint64_t streamOutputOutstandingLength = (unint64_t)v20;
      if ((unint64_t)v16 > a4) {
        goto LABEL_32;
      }
LABEL_23:
      if (!--v12)
      {
        self->_sourceLength = -1;
        self->_unint64_t streamOutputOutstandingLength = -1;
      }
      id v18 = (char *)v18 + 1;
    }
    while (v14 != v18);
    id v26 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v53 count:16];
    id v14 = v26;
  }
  while (v26);
LABEL_32:

LABEL_33:
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  self->_isStreamOutputDone = 0;
  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = 0;

  streamReadChannelBlock = (void (**)(id, TSUBufferedReadChannelHelper *, void *))self->_streamReadChannelBlock;
  v30 = [[TSUBufferedReadChannelHelper alloc] initWithBufferedReadChannel:self];
  streamReadChannelBlock[2](streamReadChannelBlock, v30, v17);
  v31 = (TSUStreamReadChannel *)objc_claimAutoreleasedReturnValue();
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = v31;

  v33 = self->_streamReadChannel;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100097B80;
  v38[3] = &unk_1001CD400;
  v38[4] = self;
  [(TSUStreamReadChannel *)v33 readWithHandler:v38];
}

- (void)setStreamReadChannelSourceHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = v4;
  _objc_release_x1(v4, streamReadChannelSourceHandler);
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  readQueue = self->_readQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100097E94;
  v11[3] = &unk_1001C59C8;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(readQueue, v11);
}

- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
}

- (void)readWithHandler:(id)a3
{
}

- (void)readWithHandlerAndWait:(id)a3
{
}

- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  unint64_t v9 = (a3 & (a3 >> 63)) + a4;
  int64_t v10 = a3 & ~(a3 >> 63);
  [(TSUBufferedReadChannel *)self _resetStreamReadChannelIfNeededForOffset:v10 length:v9];
  unsigned __int8 v31 = 0;
  NSUInteger v11 = [(TSUBufferedReadChannel *)self _currentDataIntersectionWithOffset:v10 length:v9 isReadDone:&v31];
  id v12 = v11;
  if (v11)
  {
    size_t size = dispatch_data_get_size(v11);
    v10 += size;
    v9 -= size;
  }
  else if (!v31)
  {
    goto LABEL_6;
  }
  unint64_t v14 = +[NSThread currentThread];
  int64_t v15 = [v14 threadDictionary];
  [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:@"TSUBufferedReadChannelInvokingHandler"];

  (*((void (**)(id, void, NSObject *, void))v8 + 2))(v8, v31, v12, 0);
  dispatch_queue_t v16 = +[NSThread currentThread];
  v17 = [v16 threadDictionary];
  [v17 setObject:&__kCFBooleanFalse forKeyedSubscript:@"TSUBufferedReadChannelInvokingHandler"];

  if (v31)
  {
    dispatch_resume((dispatch_object_t)self->_readQueue);
    goto LABEL_12;
  }
LABEL_6:
  [(TSUBufferedReadChannel *)self _resetStreamReadChannelIfNeededForOffset:v10 length:v9];
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  unint64_t streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
  unint64_t streamOutputLength = self->_streamOutputLength;
  self->_streamOutputOffset += streamOutputLength;
  if (streamOutputOutstandingLength != -1) {
    self->_unint64_t streamOutputOutstandingLength = streamOutputOutstandingLength - streamOutputLength;
  }
  self->_unint64_t streamOutputLength = 0;
  sourceReadChannel = self->_sourceReadChannel;
  int64_t sourceOffset = self->_sourceOffset;
  if (self->_sourceLength >= self->_sourceReadBufferSize) {
    unint64_t sourceReadBufferSize = self->_sourceReadBufferSize;
  }
  else {
    unint64_t sourceReadBufferSize = self->_sourceLength;
  }
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100098250;
  v24[3] = &unk_1001CD4A8;
  v24[4] = self;
  id v25 = v8;
  id v26 = v30;
  unint64_t v27 = sourceReadBufferSize;
  int64_t v28 = v10;
  unint64_t v29 = v9;
  [(TSUReadChannel *)sourceReadChannel readFromOffset:sourceOffset length:sourceReadBufferSize handler:v24];

  _Block_object_dispose(v30, 8);
LABEL_12:
}

- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5
{
  if (__CFADD__(a3, a4)) {
    unint64_t v8 = -1;
  }
  else {
    unint64_t v8 = a3 + a4;
  }
  int64_t streamOutputOffset = self->_streamOutputOffset;
  unint64_t streamOutputLength = self->_streamOutputLength;
  if (streamOutputLength >= ~streamOutputOffset)
  {
    unsigned int v11 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD4C8);
    }
    id v12 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
    {
      int64_t v22 = self->_streamOutputOffset;
      unint64_t v23 = self->_streamOutputLength;
      *(_DWORD *)buf = 67110402;
      unsigned int v25 = v11;
      __int16 v26 = 2082;
      unint64_t v27 = "-[TSUBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:]";
      __int16 v28 = 2082;
      unint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m";
      __int16 v30 = 1024;
      int v31 = 343;
      __int16 v32 = 2048;
      int64_t v33 = v22;
      __int16 v34 = 2048;
      unint64_t v35 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Overflow in the output stream: data offset %lli data length %zu", buf, 0x36u);
    }
    int64_t v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:]");
    unint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 343, 0, "Overflow in the output stream: data offset %lli data length %zu", self->_streamOutputOffset, self->_streamOutputLength);

    +[TSUAssertionHandler logBacktraceThrottled];
    int64_t streamOutputOffset = self->_streamOutputOffset;
    unint64_t streamOutputLength = self->_streamOutputLength;
  }
  if (streamOutputOffset <= a3) {
    unint64_t v15 = a3;
  }
  else {
    unint64_t v15 = streamOutputOffset;
  }
  unint64_t v16 = streamOutputLength + streamOutputOffset;
  if (v8 >= streamOutputLength + streamOutputOffset) {
    unint64_t v17 = streamOutputLength + streamOutputOffset;
  }
  else {
    unint64_t v17 = v8;
  }
  if (v17 <= v15)
  {
    dispatch_data_t subrange = 0;
    if (!a5) {
      goto LABEL_27;
    }
LABEL_20:
    BOOL v20 = self->_isStreamOutputDone || v8 <= v16;
    *a5 = v20;
    goto LABEL_27;
  }
  dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)self->_currentStreamOutputData, v15 - streamOutputOffset, v17 - v15);
  if (a5) {
    goto LABEL_20;
  }
LABEL_27:
  return subrange;
}

- (void)setLowWater:(unint64_t)a3
{
}

- (void)addBarrier:(id)a3
{
}

- (BOOL)isValid
{
  return [(TSUReadChannel *)self->_sourceReadChannel isValid];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStreamOutputData, 0);
  objc_storeStrong(&self->_streamReadChannelSourceHandler, 0);
  objc_storeStrong((id *)&self->_streamReadChannel, 0);
  objc_storeStrong(&self->_streamReadChannelBlock, 0);
  objc_storeStrong((id *)&self->_blockInfos, 0);
  objc_storeStrong((id *)&self->_sourceReadChannelError, 0);
  objc_storeStrong((id *)&self->_sourceReadChannel, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
}

@end