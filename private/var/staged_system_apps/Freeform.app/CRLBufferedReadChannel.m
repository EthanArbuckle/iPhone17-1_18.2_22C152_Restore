@interface CRLBufferedReadChannel
- (BOOL)isValid;
- (CRLBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5;
- (CRLBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6;
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

@implementation CRLBufferedReadChannel

- (CRLBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5
{
  return [(CRLBufferedReadChannel *)self initWithReadChannel:a3 sourceReadBufferSize:0x200000 blockInfos:a4 streamReadChannelBlock:a5];
}

- (CRLBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)CRLBufferedReadChannel;
  id v14 = [(CRLBufferedReadChannel *)&v32 init];
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
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3E58);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010758F8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3E78);
      }
      v22 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v22);
      }
      v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]");
      v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 68, 0, "invalid nil value for '%{public}s'", "sourceReadChannel");

      if (v13)
      {
LABEL_4:
        if (a4) {
          goto LABEL_5;
        }
        goto LABEL_26;
      }
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3E98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101075864();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3EB8);
    }
    v25 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v25);
    }
    v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]");
    v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 69, 0, "invalid nil value for '%{public}s'", "streamReadChannelBlock");

    if (a4)
    {
LABEL_5:
      if (v11 && v13)
      {
        v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v16 = dispatch_queue_create("CRLBufferedReadChannel.Read", v15);
        v17 = (void *)*((void *)v14 + 1);
        *((void *)v14 + 1) = v16;

        dispatch_queue_set_specific(*((dispatch_queue_t *)v14 + 1), off_10166B838, off_10166B838, 0);
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
        goto LABEL_36;
      }
LABEL_35:

      id v14 = 0;
      goto LABEL_36;
    }
LABEL_26:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3ED8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010757D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3EF8);
    }
    v28 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v28);
    }
    v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]");
    v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 70, 0, "Buffer size too small: %zu", 0);

    goto LABEL_35;
  }
LABEL_36:

  return (CRLBufferedReadChannel *)v14;
}

- (void)dealloc
{
  [(CRLBufferedReadChannel *)self _close];
  v3.receiver = self;
  v3.super_class = (Class)CRLBufferedReadChannel;
  [(CRLBufferedReadChannel *)&v3 dealloc];
}

- (void)close
{
  objc_super v3 = off_10166B838;
  if (dispatch_get_specific(off_10166B838) == v3) {
    goto LABEL_3;
  }
  uint64_t v4 = objc_opt_class();
  v5 = +[NSThread currentThread];
  v6 = [v5 threadDictionary];
  v7 = [v6 objectForKeyedSubscript:@"CRLBufferedReadChannelInvokingHandler"];
  v8 = sub_1002469D0(v4, v7);
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
LABEL_3:
    [(CRLBufferedReadChannel *)self _close];
  }
  else
  {
    readQueue = self->_readQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D2BA8;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    dispatch_sync(readQueue, block);
  }
}

- (void)_close
{
  [(CRLBufferedReadChannel *)self _closeStreamReadChannel];
  [(CRLReadChannel *)self->_sourceReadChannel close];
  sourceReadChannel = self->_sourceReadChannel;
  self->_sourceReadChannel = 0;

  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = 0;
}

- (void)_closeStreamReadChannel
{
  [(CRLStreamReadChannel *)self->_streamReadChannel close];
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
  [(CRLBufferedReadChannel *)self _closeStreamReadChannel];
  *(_OWORD *)&self->_sourceOffset = xmmword_101175370;
  *(_OWORD *)&self->_int64_t streamOutputOffset = xmmword_101175370;
  self->_streamOutputLength = 0;
  NSUInteger v11 = [(NSArray *)self->_blockInfos count];
  if (!v11)
  {
    v17 = 0;
    goto LABEL_37;
  }
  NSUInteger v12 = v11;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obj = self->_blockInfos;
  id v13 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (!v13)
  {
    v17 = 0;
    goto LABEL_36;
  }
  id v14 = v13;
  v15 = 0;
  int64_t v16 = 0;
  v17 = 0;
  uint64_t v40 = *(void *)v43;
  unint64_t v37 = a4;
  int64_t v38 = v5;
  do
  {
    id v18 = 0;
    do
    {
      if (*(void *)v43 != v40) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v18);
      v16 += (int64_t)[v19 decodedLength];
      if (v15)
      {
        [v17 addObject:v19];
        self->_sourceLength += (unint64_t)[v19 encodedLength];
        v15 = &v15[(void)[v19 decodedLength]];
        id v20 = (char *)[v19 decodedLength] + self->_streamOutputOutstandingLength;
      }
      else
      {
        if (v16 <= v5)
        {
          self->_sourceOffset += (int64_t)[v19 encodedLength];
          v15 = 0;
          self->_streamOutputOffset += (int64_t)[v19 decodedLength];
          goto LABEL_27;
        }
        if (v17)
        {
          unsigned int v21 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D3F18);
          }
          v22 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v47 = v21;
            __int16 v48 = 2082;
            v49 = "-[CRLBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:]";
            __int16 v50 = 2082;
            v51 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m";
            __int16 v52 = 1024;
            int v53 = 147;
            __int16 v54 = 2082;
            v55 = "blockInfos";
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D3F38);
          }
          v23 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v27 = v23;
            v28 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v47 = v21;
            __int16 v48 = 2114;
            v49 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:]");
          v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 147, 0, "expected nil value for '%{public}s'", "blockInfos");

          a4 = v37;
        }
        id v26 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v12];

        [v26 addObject:v19];
        self->_sourceLength = (unint64_t)[v19 encodedLength];
        v15 = (char *)[v19 decodedLength];
        id v20 = (char *)[v19 decodedLength];
        v17 = v26;
        int64_t v5 = v38;
      }
      self->_unint64_t streamOutputOutstandingLength = (unint64_t)v20;
      if ((unint64_t)v15 > a4) {
        goto LABEL_36;
      }
LABEL_27:
      if (!--v12)
      {
        self->_sourceLength = -1;
        self->_unint64_t streamOutputOutstandingLength = -1;
      }
      id v18 = (char *)v18 + 1;
    }
    while (v14 != v18);
    id v29 = [(NSArray *)obj countByEnumeratingWithState:&v42 objects:v56 count:16];
    id v14 = v29;
  }
  while (v29);
LABEL_36:

LABEL_37:
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  self->_isStreamOutputDone = 0;
  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = 0;

  streamReadChannelBlock = (void (**)(id, CRLBufferedReadChannelHelper *, void *))self->_streamReadChannelBlock;
  v33 = [[CRLBufferedReadChannelHelper alloc] initWithBufferedReadChannel:self];
  streamReadChannelBlock[2](streamReadChannelBlock, v33, v17);
  v34 = (CRLStreamReadChannel *)objc_claimAutoreleasedReturnValue();
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = v34;

  v36 = self->_streamReadChannel;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000D3204;
  v41[3] = &unk_1014D3FA0;
  v41[4] = self;
  [(CRLStreamReadChannel *)v36 readWithHandler:v41];
}

- (void)setStreamReadChannelSourceHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = v4;
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  readQueue = self->_readQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D3594;
  v11[3] = &unk_1014D3FC8;
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
  [(CRLBufferedReadChannel *)self _resetStreamReadChannelIfNeededForOffset:v10 length:v9];
  unsigned __int8 v31 = 0;
  NSUInteger v11 = [(CRLBufferedReadChannel *)self _currentDataIntersectionWithOffset:v10 length:v9 isReadDone:&v31];
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
  v15 = [v14 threadDictionary];
  [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:@"CRLBufferedReadChannelInvokingHandler"];

  (*((void (**)(id, void, NSObject *, void))v8 + 2))(v8, v31, v12, 0);
  int64_t v16 = +[NSThread currentThread];
  v17 = [v16 threadDictionary];
  [v17 setObject:&__kCFBooleanFalse forKeyedSubscript:@"CRLBufferedReadChannelInvokingHandler"];

  if (v31)
  {
    dispatch_resume((dispatch_object_t)self->_readQueue);
    goto LABEL_12;
  }
LABEL_6:
  [(CRLBufferedReadChannel *)self _resetStreamReadChannelIfNeededForOffset:v10 length:v9];
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
  v24[2] = sub_1000D3950;
  v24[3] = &unk_1014D40F0;
  v24[4] = self;
  id v25 = v8;
  id v26 = v30;
  unint64_t v27 = sourceReadBufferSize;
  int64_t v28 = v10;
  unint64_t v29 = v9;
  [(CRLReadChannel *)sourceReadChannel readFromOffset:sourceOffset length:sourceReadBufferSize handler:v24];

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
    unsigned int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4110);
    }
    id v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      int64_t v23 = self->_streamOutputOffset;
      unint64_t v24 = self->_streamOutputLength;
      *(_DWORD *)buf = 67110402;
      unsigned int v26 = v11;
      __int16 v27 = 2082;
      int64_t v28 = "-[CRLBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:]";
      __int16 v29 = 2082;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m";
      __int16 v31 = 1024;
      int v32 = 336;
      __int16 v33 = 2048;
      int64_t v34 = v23;
      __int16 v35 = 2048;
      unint64_t v36 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Overflow in the output stream: data offset %lli data length %zu", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D4130);
    }
    int64_t v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    unint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:]");
    v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 336, 0, "Overflow in the output stream: data offset %lli data length %zu", self->_streamOutputOffset, self->_streamOutputLength);

    int64_t streamOutputOffset = self->_streamOutputOffset;
    unint64_t streamOutputLength = self->_streamOutputLength;
  }
  if (streamOutputOffset <= a3) {
    unint64_t v16 = a3;
  }
  else {
    unint64_t v16 = streamOutputOffset;
  }
  unint64_t v17 = streamOutputLength + streamOutputOffset;
  if (v8 >= streamOutputLength + streamOutputOffset) {
    unint64_t v18 = streamOutputLength + streamOutputOffset;
  }
  else {
    unint64_t v18 = v8;
  }
  if (v18 <= v16)
  {
    dispatch_data_t subrange = 0;
    if (!a5) {
      goto LABEL_31;
    }
LABEL_24:
    BOOL v21 = self->_isStreamOutputDone || v8 <= v17;
    *a5 = v21;
    goto LABEL_31;
  }
  dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)self->_currentStreamOutputData, v16 - streamOutputOffset, v18 - v16);
  if (a5) {
    goto LABEL_24;
  }
LABEL_31:

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
  return [(CRLReadChannel *)self->_sourceReadChannel isValid];
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