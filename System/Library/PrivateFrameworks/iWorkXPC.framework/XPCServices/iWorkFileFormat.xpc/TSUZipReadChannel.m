@interface TSUZipReadChannel
- (BOOL)isValid;
- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 handler:(id)a6;
- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4 error:(id *)a5;
- (TSUZipReadChannel)initWithEntry:(id)a3 archive:(id)a4 validateCRC:(BOOL)a5;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)dealloc;
- (void)handleFailureWithHandler:(id)a3 error:(id)a4;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readWithFileHeaderLength:(unint64_t)a3 handler:(id)a4;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
- (void)setLowWater:(unint64_t)a3;
@end

@implementation TSUZipReadChannel

- (TSUZipReadChannel)initWithEntry:(id)a3 archive:(id)a4 validateCRC:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TSUZipReadChannel;
  v11 = [(TSUZipReadChannel *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entry, a3);
    objc_storeStrong((id *)&v12->_archive, a4);
    v12->_validateCRC = a5;
    v13 = (TSUReadChannel *)[v10 newArchiveReadChannel];
    archiveReadChannel = v12->_archiveReadChannel;
    v12->_archiveReadChannel = v13;

    if (!v12->_archiveReadChannel)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CD750);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100167828();
      }
      v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipReadChannel initWithEntry:archive:validateCRC:]");
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipReadChannel.m"];
      +[TSUAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:38 isFatal:0 description:"Archive is closed"];

      +[TSUAssertionHandler logBacktraceThrottled];
      v12 = 0;
    }
  }

  return v12;
}

- (void)dealloc
{
  [(TSUZipReadChannel *)self close];
  v3.receiver = self;
  v3.super_class = (Class)TSUZipReadChannel;
  [(TSUZipReadChannel *)&v3 dealloc];
}

- (void)readWithHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TSUZipEntry *)self->_entry compressedSize];
  unint64_t v6 = [(TSUZipEntry *)self->_entry fileHeaderLength];
  if (v6)
  {
    [(TSUZipReadChannel *)self readWithFileHeaderLength:v6 handler:v4];
  }
  else
  {
    unsigned int v7 = [(TSUZipEntry *)self->_entry nameLength];
    unsigned int v8 = [(TSUZipEntry *)self->_entry extraFieldsLength];
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = sub_10009C5E8;
    v25[4] = sub_10009C5F8;
    id v9 = &_dispatch_data_empty;
    id v26 = &_dispatch_data_empty;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    char v24 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 1;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    int v20 = 0;
    int v20 = crc32(0, 0, 0);
    archiveReadChannel = self->_archiveReadChannel;
    unint64_t v11 = [(TSUZipEntry *)self->_entry offset];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009C600;
    v12[3] = &unk_1001CD798;
    v14 = v21;
    v12[4] = self;
    id v13 = v4;
    v15 = v25;
    v16 = v23;
    v17 = v19;
    unint64_t v18 = v7 + (unint64_t)v8 + 30;
    [(TSUReadChannel *)archiveReadChannel readFromOffset:v11 length:v18 + v5 handler:v12];

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
  }
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  unsigned int v8 = (void (**)(id, uint64_t, void *, void))a5;
  unint64_t v9 = [(TSUZipEntry *)self->_entry compressedSize];
  unint64_t v10 = v9;
  if (a3 < 0 || v9 < a3)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CD7B8);
    }
    unint64_t v11 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
    {
      entry = self->_entry;
      v16 = v11;
      v17 = [(TSUZipEntry *)entry name];
      *(_DWORD *)buf = 138412802;
      v23 = v17;
      __int16 v24 = 2048;
      unint64_t v25 = v10;
      __int16 v26 = 2048;
      int64_t v27 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Requested range is not within the entry: %@. Size: %llu. Requested offset: %llu", buf, 0x20u);
    }
    v8[2](v8, 1, &_dispatch_data_empty, 0);
  }
  else
  {
    if (v9 - a3 < a4) {
      a4 = v9 - a3;
    }
    if (a3 || a4 != v9)
    {
      unint64_t v12 = [(TSUZipEntry *)self->_entry fileHeaderLength];
      if (v12)
      {
        [(TSUReadChannel *)self->_archiveReadChannel readFromOffset:(char *)[(TSUZipEntry *)self->_entry offset] + v12 + a3 length:a4 handler:v8];
      }
      else
      {
        archiveReadChannel = self->_archiveReadChannel;
        unint64_t v14 = [(TSUZipEntry *)self->_entry offset];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10009CCB8;
        v18[3] = &unk_1001CD7E0;
        v18[4] = self;
        int64_t v20 = a3;
        unint64_t v21 = a4;
        v19 = v8;
        +[TSUIOUtils readAllFromChannel:archiveReadChannel offset:v14 length:30 completion:v18];
      }
    }
    else
    {
      [(TSUZipReadChannel *)self readWithHandler:v8];
    }
  }
}

- (void)readFromOffsetAndWait:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
}

- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4 error:(id *)a5
{
  unsigned int v8 = a3;
  size_t size = dispatch_data_get_size(v8);
  if (size == 30)
  {
    subrange = v8;
    goto LABEL_5;
  }
  uint64_t v11 = size;
  if (size < 0x1F)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CD800);
    }
    v29 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
    {
      sub_1001679F8((uint64_t)self, v29, v11);
      if (a5) {
        goto LABEL_33;
      }
    }
    else if (a5)
    {
LABEL_33:
      v41[0] = @"Read was less than record size";
      v40[0] = @"TSUZipArchiveErrorDescription";
      v40[1] = @"TSUZipArchiveErrorEntryName";
      uint64_t v30 = [(TSUZipEntry *)self->_entry name];
      unint64_t v12 = (void *)v30;
      CFStringRef v31 = &stru_1001D3790;
      if (v30) {
        CFStringRef v31 = (const __CFString *)v30;
      }
      v41[1] = v31;
      v32 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
      *a5 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v32];

      BOOL v18 = 0;
      goto LABEL_38;
    }
    BOOL v18 = 0;
    goto LABEL_39;
  }
  subrange = dispatch_data_create_subrange(v8, 0, 0x1EuLL);
LABEL_5:
  unint64_t v12 = subrange;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v13 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &size_ptr);
  unint64_t v14 = (unsigned __int16 *)buffer_ptr;
  if (*(_DWORD *)buffer_ptr != 67324752)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CD820);
    }
    v19 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100167954((uint64_t)self, v19);
    }
    v39[0] = @"Local file header has bad signature";
    v38[0] = @"TSUZipArchiveErrorDescription";
    v38[1] = @"TSUZipArchiveErrorEntryName";
    uint64_t v20 = [(TSUZipEntry *)self->_entry name];
    unint64_t v21 = (void *)v20;
    CFStringRef v22 = &stru_1001D3790;
    if (v20) {
      CFStringRef v22 = (const __CFString *)v20;
    }
    v39[1] = v22;
    v23 = v39;
    __int16 v24 = v38;
    goto LABEL_27;
  }
  int v15 = *((unsigned __int16 *)buffer_ptr + 4);
  if (*((_WORD *)buffer_ptr + 4)) {
    BOOL v16 = v15 == (unsigned __int16)TSUZipDeflateCompressionMethod;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16
    || (((v15 != (unsigned __int16)TSUZipDeflateCompressionMethod) ^ [(TSUZipEntry *)self->_entry isCompressed]) & 1) == 0)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CD840);
    }
    unint64_t v25 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001678B0((uint64_t)self, v25);
    }
    v37[0] = @"Local file header doesn't match compression method from central directory file header";
    v36[0] = @"TSUZipArchiveErrorDescription";
    v36[1] = @"TSUZipArchiveErrorEntryName";
    uint64_t v26 = [(TSUZipEntry *)self->_entry name];
    unint64_t v21 = (void *)v26;
    CFStringRef v27 = &stru_1001D3790;
    if (v26) {
      CFStringRef v27 = (const __CFString *)v26;
    }
    v37[1] = v27;
    v23 = v37;
    __int16 v24 = v36;
LABEL_27:
    v28 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:2];
    id v17 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v28];

    if (a5)
    {
      id v17 = v17;
      BOOL v18 = 0;
      *a5 = v17;
    }
    else
    {
      BOOL v18 = 0;
    }
    goto LABEL_37;
  }
  *a4 = v14[13] + (unint64_t)v14[14] + 30;
  -[TSUZipEntry setFileHeaderLength:](self->_entry, "setFileHeaderLength:");
  id v17 = 0;
  BOOL v18 = 1;
LABEL_37:

LABEL_38:
LABEL_39:

  return v18;
}

- (void)readWithFileHeaderLength:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 1;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 0;
  int v16 = crc32(0, 0, 0);
  archiveReadChannel = self->_archiveReadChannel;
  unint64_t v8 = [(TSUZipEntry *)self->_entry offset];
  unint64_t v9 = [(TSUZipEntry *)self->_entry compressedSize];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009D3F4;
  v11[3] = &unk_1001CD868;
  dispatch_data_t v13 = v17;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  unint64_t v14 = v15;
  [(TSUReadChannel *)archiveReadChannel readFromOffset:v8 + a3 length:v9 handler:v11];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 handler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = (void (**)(id, BOOL, NSObject *, void))a6;
  if (a4
    && self->_validateCRC
    && (v20[0] = _NSConcreteStackBlock,
        v20[1] = 3221225472,
        v20[2] = sub_10009D6DC,
        v20[3] = &unk_1001CD8A8,
        v20[4] = a4,
        dispatch_data_apply(v10, v20),
        v7)
    && [(TSUZipEntry *)self->_entry CRC] != *a4)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CD8C8);
    }
    unint64_t v14 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100167AC4((void **)&self->_entry, v14);
    }
    v22[0] = @"CRC does not match";
    v21[0] = @"TSUZipArchiveErrorDescription";
    v21[1] = @"TSUZipArchiveErrorEntryName";
    uint64_t v15 = [(TSUZipEntry *)self->_entry name];
    int v16 = (void *)v15;
    CFStringRef v17 = &stru_1001D3790;
    if (v15) {
      CFStringRef v17 = (const __CFString *)v15;
    }
    v22[1] = v17;
    char v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    v19 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v18];

    [(TSUZipReadChannel *)self handleFailureWithHandler:v11 error:v19];
    BOOL v12 = 0;
  }
  else
  {
    v11[2](v11, v7, v10, 0);
    BOOL v12 = 1;
  }

  return v12;
}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void, void *))a3;
  id v7 = a4;
  if (!v7)
  {
    CFStringRef v21 = @"TSUZipArchiveErrorEntryName";
    uint64_t v17 = [(TSUZipEntry *)self->_entry name];
    id v10 = (void *)v17;
    CFStringRef v18 = &stru_1001D3790;
    if (v17) {
      CFStringRef v18 = (const __CFString *)v17;
    }
    CFStringRef v22 = v18;
    dispatch_data_t v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    unint64_t v8 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v13];
    goto LABEL_9;
  }
  unint64_t v8 = v7;
  unint64_t v9 = objc_msgSend(v7, "tsu_zipArchiveErrorEntryName");

  if (!v9)
  {
    id v10 = [v8 domain];
    id v11 = [v8 code];
    v20[0] = v8;
    v19[0] = NSUnderlyingErrorKey;
    v19[1] = @"TSUZipArchiveErrorEntryName";
    uint64_t v12 = [(TSUZipEntry *)self->_entry name];
    dispatch_data_t v13 = (void *)v12;
    CFStringRef v14 = &stru_1001D3790;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    v20[1] = v14;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    uint64_t v16 = +[NSError errorWithDomain:v10 code:v11 userInfo:v15];

    unint64_t v8 = (void *)v16;
LABEL_9:
  }
  v6[2](v6, 1, 0, v8);
}

- (void)close
{
  [(TSUReadChannel *)self->_archiveReadChannel close];
  archiveReadChannel = self->_archiveReadChannel;
  self->_archiveReadChannel = 0;

  entry = self->_entry;
  self->_entry = 0;

  archive = self->_archive;
  self->_archive = 0;
}

- (void)readWithHandlerAndWait:(id)a3
{
}

- (void)setLowWater:(unint64_t)a3
{
  if (!self->_archiveReadChannel)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD8E8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100167C7C();
    }
    unint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipReadChannel setLowWater:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipReadChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:308 isFatal:0 description:"Already closed"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (a3 <= 0x1D)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD908);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100167BF4();
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipReadChannel setLowWater:]");
    unint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipReadChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:309 isFatal:0 description:"Low water is too small"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  [(TSUReadChannel *)self->_archiveReadChannel setLowWater:a3];
}

- (void)addBarrier:(id)a3
{
  id v4 = a3;
  archiveReadChannel = self->_archiveReadChannel;
  if (!archiveReadChannel)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD928);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100167D04();
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipReadChannel addBarrier:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipReadChannel.m"];
    +[TSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:315 isFatal:0 description:"Already closed"];

    +[TSUAssertionHandler logBacktraceThrottled];
    archiveReadChannel = self->_archiveReadChannel;
  }
  [(TSUReadChannel *)archiveReadChannel addBarrier:v4];
}

- (BOOL)isValid
{
  return [(TSUReadChannel *)self->_archiveReadChannel isValid];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveReadChannel, 0);
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end