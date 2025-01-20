@interface CRLReadChannelInputStreamAdapter
- (BOOL)canSeek;
- (CRLReadChannelInputStreamAdapter)initWithReadChannel:(id)a3 length:(unint64_t)a4;
- (CRLReadChannelInputStreamAdapter)initWithReadChannel:(id)a3 length:(unint64_t)a4 closeChannelOnClose:(BOOL)a5;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation CRLReadChannelInputStreamAdapter

- (CRLReadChannelInputStreamAdapter)initWithReadChannel:(id)a3 length:(unint64_t)a4
{
  return [(CRLReadChannelInputStreamAdapter *)self initWithReadChannel:a3 length:a4 closeChannelOnClose:1];
}

- (CRLReadChannelInputStreamAdapter)initWithReadChannel:(id)a3 length:(unint64_t)a4 closeChannelOnClose:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLReadChannelInputStreamAdapter;
  v10 = [(CRLReadChannelInputStreamAdapter *)&v13 init];
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
  [(CRLReadChannelInputStreamAdapter *)self close];
  v3.receiver = self;
  v3.super_class = (Class)CRLReadChannelInputStreamAdapter;
  [(CRLReadChannelInputStreamAdapter *)&v3 dealloc];
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
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    size_t v47 = v9;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v43[3] = a3;
    leftoverData = self->_leftoverData;
    if (dispatch_data_get_size((dispatch_data_t)leftoverData))
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_1001224B8;
      applier[3] = &unk_1014D79B8;
      applier[5] = &v44;
      applier[6] = v43;
      applier[4] = self;
      dispatch_data_apply((dispatch_data_t)leftoverData, applier);
      if (v45[3])
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

      size_t v14 = v45[3];
      if (!v14) {
        goto LABEL_28;
      }
    }
    else
    {
      size_t v14 = v9;
      if (!v9) {
        goto LABEL_28;
      }
    }
    if (self->_readChannel)
    {
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x3032000000;
      v39 = sub_10012254C;
      v40 = sub_10012255C;
      id v41 = 0;
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      char v35 = 0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100122564;
      v28[3] = &unk_1014D7A08;
      v30 = &v44;
      v31 = v43;
      v28[4] = self;
      v32 = &v36;
      v33 = v34;
      v18 = dispatch_semaphore_create(0);
      v29 = v18;
      v19 = objc_retainBlock(v28);
      readChannel = self->_readChannel;
      if (readChannel)
      {
        [(CRLReadChannel *)readChannel readFromOffset:self->_offset length:v45[3] handler:v19];
      }
      else
      {
        int v21 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D7A28);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107B808();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D7A48);
        }
        v22 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
        {
          v23 = +[CRLAssertionHandler packedBacktraceString];
          sub_10106CDAC(v23, buf, v21, (os_log_t)v22);
        }

        v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLReadChannelInputStreamAdapter readToBuffer:size:]");
        v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLReadChannelInputStreamAdapter.m"];
        +[CRLAssertionHandler handleFailureInFunction:v24 file:v25 lineNumber:116 isFatal:0 description:"nil read channels"];

        dispatch_semaphore_signal(v18);
      }
      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v26 = v37[5] == 0;

      _Block_object_dispose(v34, 8);
      _Block_object_dispose(&v36, 8);

      if (!v26)
      {
        unint64_t v13 = 0;
LABEL_29:
        _Block_object_dispose(v43, 8);
        _Block_object_dispose(&v44, 8);
        return v13;
      }
      size_t v14 = v45[3];
    }
LABEL_28:
    unint64_t v13 = v9 - v14;
    goto LABEL_29;
  }
  return 0;
}

- (void)close
{
  if (self->_closeChannelOnClose) {
    [(CRLReadChannel *)self->_readChannel close];
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
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7A68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107B89C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7A88);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v8, v7);
    }
    size_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLReadChannelInputStreamAdapter seekToOffset:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLReadChannelInputStreamAdapter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:155 isFatal:0 description:"Not a seekable stream"];
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