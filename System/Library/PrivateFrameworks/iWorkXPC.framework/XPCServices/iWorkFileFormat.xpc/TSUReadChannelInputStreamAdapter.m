@interface TSUReadChannelInputStreamAdapter
- (BOOL)canSeek;
- (TSUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3 length:(unint64_t)a4;
- (TSUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3 length:(unint64_t)a4 closeChannelOnClose:(BOOL)a5;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation TSUReadChannelInputStreamAdapter

- (TSUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3 length:(unint64_t)a4
{
  return [(TSUReadChannelInputStreamAdapter *)self initWithReadChannel:a3 length:a4 closeChannelOnClose:1];
}

- (TSUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3 length:(unint64_t)a4 closeChannelOnClose:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSUReadChannelInputStreamAdapter;
  v10 = [(TSUReadChannelInputStreamAdapter *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_readChannel, a3);
    objc_storeStrong((id *)&v11->_leftoverData, &_dispatch_data_empty);
    v11->_length = a4;
    v11->_closeChannelOnClose = a5;
  }

  return v11;
}

- (void)dealloc
{
  [(TSUReadChannelInputStreamAdapter *)self close];
  v3.receiver = self;
  v3.super_class = (Class)TSUReadChannelInputStreamAdapter;
  [(TSUReadChannelInputStreamAdapter *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  int64_t offset = self->_offset;
  unint64_t length = self->_length;
  BOOL v6 = __OFSUB__(length, offset);
  int64_t v7 = length - offset;
  if (!((v7 < 0) ^ v6 | (v7 == 0)))
  {
    if (v7 >= a4) {
      size_t v9 = a4;
    }
    else {
      size_t v9 = v7;
    }
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    size_t v43 = v9;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = a3;
    leftoverData = self->_leftoverData;
    if (dispatch_data_get_size((dispatch_data_t)leftoverData))
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_1000B6AD8;
      applier[3] = &unk_1001CEBF8;
      applier[5] = &v40;
      applier[6] = v39;
      applier[4] = self;
      dispatch_data_apply((dispatch_data_t)leftoverData, applier);
      if (v41[3])
      {
        subrange = (OS_dispatch_data *)&_dispatch_data_empty;
        id v12 = &_dispatch_data_empty;
      }
      else
      {
        v15 = self->_leftoverData;
        size_t size = dispatch_data_get_size((dispatch_data_t)v15);
        subrange = (OS_dispatch_data *)dispatch_data_create_subrange((dispatch_data_t)v15, v9, size - v9);
      }
      v17 = self->_leftoverData;
      self->_leftoverData = subrange;

      size_t v14 = v41[3];
      if (v14)
      {
LABEL_13:
        if (self->_readChannel)
        {
          uint64_t v32 = 0;
          v33 = &v32;
          uint64_t v34 = 0x3032000000;
          v35 = sub_1000B6B6C;
          v36 = sub_1000B6B7C;
          id v37 = 0;
          v30[0] = 0;
          v30[1] = v30;
          v30[2] = 0x2020000000;
          char v31 = 0;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1000B6B84;
          v24[3] = &unk_1001CEC48;
          v26 = &v40;
          v27 = v39;
          v24[4] = self;
          v28 = &v32;
          v29 = v30;
          v18 = dispatch_semaphore_create(0);
          v25 = v18;
          v19 = objc_retainBlock(v24);
          readChannel = self->_readChannel;
          if (readChannel)
          {
            [(TSUReadChannel *)readChannel readFromOffset:self->_offset length:v41[3] handler:v19];
          }
          else
          {
            +[TSUAssertionHandler _atomicIncrementAssertCount];
            if (TSUAssertCat_init_token != -1) {
              dispatch_once(&TSUAssertCat_init_token, &stru_1001CEC68);
            }
            if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
              sub_10016AA74();
            }
            v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUReadChannelInputStreamAdapter readToBuffer:size:]");
            v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUReadChannelInputStreamAdapter.m"];
            +[TSUAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:118 isFatal:0 description:"nil read channels"];

            +[TSUAssertionHandler logBacktraceThrottled];
            dispatch_semaphore_signal(v18);
          }
          dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
          if (v33[5]) {
            +[NSException tsu_raiseWithError:](NSException, "tsu_raiseWithError:");
          }

          _Block_object_dispose(v30, 8);
          _Block_object_dispose(&v32, 8);

          size_t v14 = v41[3];
        }
      }
    }
    else
    {
      size_t v14 = v9;
      if (v9) {
        goto LABEL_13;
      }
    }
    unint64_t v13 = v9 - v14;
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(&v40, 8);
    return v13;
  }
  return 0;
}

- (void)close
{
  if (self->_closeChannelOnClose) {
    [(TSUReadChannel *)self->_readChannel close];
  }
  readChannel = self->_readChannel;
  self->_readChannel = 0;
}

- (BOOL)canSeek
{
  return self->_readChannel != 0;
}

- (void)seekToOffset:(int64_t)a3
{
  if (self->_readChannel)
  {
    int64_t length = self->_length;
    if (length >= a3) {
      unint64_t v4 = a3;
    }
    else {
      unint64_t v4 = self->_length;
    }
    if (length >= 0) {
      int64_t v5 = v4;
    }
    else {
      int64_t v5 = a3;
    }
    self->_int64_t offset = v5;
    p_leftoverData = &self->_leftoverData;
    objc_storeStrong((id *)p_leftoverData, &_dispatch_data_empty);
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CEC88);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016AB08();
    }
    int64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUReadChannelInputStreamAdapter seekToOffset:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUReadChannelInputStreamAdapter.m"];
    +[TSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:156 isFatal:0 description:"Not a seekable stream"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
}

- (id)closeLocalStream
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftoverData, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end