@interface PTPDataPacket
- (BOOL)unlinkWhenDone;
- (NSString)filepath;
- (PTPDataPacket)initWithOperationCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 andData:(id)a5;
- (PTPDataPacket)initWithOperationCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 andDataSource:(id)a5;
- (PTPDataPacket)initWithOperationCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 andFilepath:(id)a5;
- (PTPDataPacket)initWithUSBBuffer:(void *)a3;
- (_PTPRange)range;
- (id)contentForUSB;
- (id)contentForUSBUsingBuffer:(void *)a3 capacity:(unsigned int)a4;
- (id)data;
- (id)dataSource;
- (id)description;
- (int)fd;
- (int)setRange:(_PTPRange)a3;
- (int64_t)bufferSize;
- (int64_t)bytesTransferred;
- (int64_t)copyDataToWrappedBytes:(id)a3 forTransport:(unsigned __int16)a4 fromOffset:(unint64_t)a5;
- (int64_t)copyFromBuffer:(void *)a3 numBytes:(int64_t)a4;
- (int64_t)copyHeaderToWrappedBytes:(id)a3 forTransport:(unsigned __int16)a4;
- (int64_t)copyToBuffer:(void *)a3 numBytes:(int64_t)a4;
- (int64_t)copyToWrappedBytes:(id)a3 forTransport:(unsigned __int16)a4;
- (int64_t)offsetInBuffer;
- (unsigned)operationCode;
- (unsigned)transactionID;
- (void)dealloc;
- (void)setBufferSize:(int64_t)a3;
- (void)setBytesTransferred:(int64_t)a3;
- (void)setData:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFd:(int)a3;
- (void)setFilepath:(id)a3;
- (void)setOffsetInBuffer:(int64_t)a3;
- (void)setOperationCode:(unsigned __int16)a3;
- (void)setTransactionID:(unsigned int)a3;
- (void)setUnlinkWhenDone:(BOOL)a3;
@end

@implementation PTPDataPacket

- (PTPDataPacket)initWithOperationCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 andData:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PTPDataPacket;
  v10 = [(PTPDataPacket *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_operationCode = a3;
    v10->_transactionID = a4;
    objc_storeStrong(&v10->_data, a5);
    id v12 = [v11->_data length];
    v11->_bufferSize = (int64_t)v12;
    v11->_offsetInBuffer = 0;
    v11->_range.location = 0;
    v11->_range.length = (unint64_t)v12;
  }

  return v11;
}

- (PTPDataPacket)initWithOperationCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 andDataSource:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PTPDataPacket;
  v10 = [(PTPDataPacket *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_operationCode = a3;
    v10->_transactionID = a4;
    objc_storeStrong(&v10->_dataSource, a5);
    id v12 = [v11->_dataSource length];
    v11->_bufferSize = (int64_t)v12;
    v11->_offsetInBuffer = 0;
    v11->_range.location = 0;
    v11->_range.length = (unint64_t)v12;
  }

  return v11;
}

- (PTPDataPacket)initWithOperationCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 andFilepath:(id)a5
{
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PTPDataPacket;
  v10 = [(PTPDataPacket *)&v26 init];
  v11 = v10;
  if (v10)
  {
    v10->_operationCode = a3;
    v10->_transactionID = a4;
    objc_storeStrong((id *)&v10->_filepath, a5);
    v11->_int fd = open([(NSString *)v11->_filepath fileSystemRepresentation], 0, 0);
    id v12 = __error();
    int fd = v11->_fd;
    if (fd < 1)
    {
      uint64_t v16 = *v12;
      __ICOSLogCreate();
      v17 = @"PTPDataPacket";
      if ((unint64_t)[@"PTPDataPacket" length] >= 0x15)
      {
        v18 = [@"PTPDataPacket" substringWithRange:0, 18];
        v17 = [v18 stringByAppendingString:@".."];
      }
      v19 = +[NSString stringWithFormat:@"Unable to open file %s with error %d\n", [(NSString *)v11->_filepath fileSystemRepresentation], v16];
      v20 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v17;
        v22 = v20;
        id v23 = [(__CFString *)v21 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v28 = v23;
        __int16 v29 = 2114;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    else
    {
      off_t v14 = lseek(fd, 0, 2);
      v11->_bufferSize = v14;
      if (v14 != -1)
      {
        v11->_range.length = v14;
        off_t v15 = lseek(v11->_fd, 0, 0);
        v11->_offsetInBuffer = v15;
        if (v15 != -1)
        {
          v11->_range.location = v15;
          goto LABEL_14;
        }
      }
    }
    int v24 = v11->_fd;
    if (v24 >= 1) {
      close(v24);
    }

    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (PTPDataPacket)initWithUSBBuffer:(void *)a3
{
  unint64_t v3 = (*(_DWORD *)a3 - 12);
  if (*(_DWORD *)a3 >= 0xCu && *((_WORD *)a3 + 2) == 2)
  {
    v13.receiver = self;
    v13.super_class = (Class)PTPDataPacket;
    v7 = [(PTPDataPacket *)&v13 init];
    if (v7)
    {
      id v12 = (char *)a3 + 6;
      v7->_operationCode = sub_10002A5D4(&v12);
      v7->_transactionID = sub_10002A650(&v12);
      id v8 = objc_alloc((Class)NSMutableData);
      id v9 = [v8 initWithBytes:v12 length:v3];
      id data = v7->_data;
      v7->_id data = v9;

      v7->_bufferSize = v3;
      v7->_offsetInBuffer = 0;
      v7->_range.location = 0;
      v7->_range.length = v3;
    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  int fd = self->_fd;
  if (fd >= 1) {
    close(fd);
  }
  if ([(PTPDataPacket *)self unlinkWhenDone])
  {
    __ICOSLogCreate();
    v4 = @"ptpDataPacket";
    if ((unint64_t)[@"ptpDataPacket" length] >= 0x15)
    {
      v5 = [@"ptpDataPacket" substringWithRange:0, 18];
      v4 = [v5 stringByAppendingString:@".."];
    }
    v6 = [(PTPDataPacket *)self filepath];
    v7 = +[NSString stringWithFormat:@"Unlinking file on completion: %@", v6];

    id v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v4;
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      id v14 = [(__CFString *)v9 UTF8String];
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    id v11 = [(PTPDataPacket *)self filepath];
    unlink((const char *)[v11 fileSystemRepresentation]);
  }
  v12.receiver = self;
  v12.super_class = (Class)PTPDataPacket;
  [(PTPDataPacket *)&v12 dealloc];
}

- (id)contentForUSB
{
  unint64_t v3 = self->_range.length + 12;
  v4 = +[PTPWrappedBytes wrappedBytesWithCapacity:v3];
  __buf = (char *)[v4 mutableBytes] + 4;
  sub_10002A5BC((_WORD **)&__buf, 2);
  sub_10002A5BC((_WORD **)&__buf, self->_operationCode);
  sub_10002A638((_DWORD **)&__buf, self->_transactionID);
  if (!self->_range.length)
  {
LABEL_11:
    __buf = [v4 mutableBytes];
    if (HIDWORD(v3)) {
      int v8 = -2;
    }
    else {
      int v8 = v3;
    }
    sub_10002A638((_DWORD **)&__buf, v8);
    [v4 setLength:v3];
    goto LABEL_15;
  }
  id data = self->_data;
  if (data)
  {
    memcpy(__buf, (char *)[data bytes] + self->_range.location, self->_range.length);
    v3 += self->_range.length;
    goto LABEL_11;
  }
  id dataSource = self->_dataSource;
  if (self->_fd <= 0)
  {
    if (!dataSource) {
      goto LABEL_11;
    }
  }
  else if (!dataSource)
  {
    ssize_t v7 = pread(self->_fd, __buf, self->_range.length, self->_range.location);
    goto LABEL_9;
  }
  ssize_t v7 = (ssize_t)[dataSource read:__buf length:__len offset:__off];
LABEL_9:
  if (v7 != -1)
  {
    v3 += v7;
    goto LABEL_11;
  }
  sub_10002C76C();

  v4 = 0;
LABEL_15:

  return v4;
}

- (id)contentForUSBUsingBuffer:(void *)a3 capacity:(unsigned int)a4
{
  if (self->_range.length + 12 > a4) {
    goto LABEL_2;
  }
  __buf = (char *)a3 + 4;
  sub_10002A5BC((_WORD **)&__buf, 2);
  sub_10002A5BC((_WORD **)&__buf, self->_operationCode);
  sub_10002A638((_DWORD **)&__buf, self->_transactionID);
  if (!self->_range.length) {
    goto LABEL_14;
  }
  id data = self->_data;
  if (data)
  {
    memcpy(__buf, (char *)[data bytes] + self->_range.location, self->_range.length);
    id length = self->_range.length;
    goto LABEL_12;
  }
  id dataSource = self->_dataSource;
  if (self->_fd <= 0)
  {
    if (dataSource) {
      goto LABEL_10;
    }
LABEL_14:
    __buf = a3;
    uint64_t v11 = 12;
    goto LABEL_15;
  }
  if (!dataSource)
  {
    id length = (id)pread(self->_fd, __buf, self->_range.length, self->_range.location);
    goto LABEL_11;
  }
LABEL_10:
  id length = [dataSource read:__buf length:__buf length:__buf offset:__buf];
LABEL_11:
  if (length == (id)-1)
  {
    sub_10002C76C();
LABEL_2:
    v4 = 0;
    goto LABEL_17;
  }
LABEL_12:
  uint64_t v11 = (uint64_t)length + 12;
  __buf = a3;
  if (!(((unint64_t)length + 12) >> 32))
  {
LABEL_15:
    int v12 = v11;
    goto LABEL_16;
  }
  int v12 = -2;
LABEL_16:
  sub_10002A638((_DWORD **)&__buf, v12);
  v4 = +[PTPWrappedBytes wrappedBytesWithBytes:a3 capacity:a4];
  [v4 setLength:v11];
LABEL_17:

  return v4;
}

- (id)description
{
  unint64_t v3 = sub_10002AC48(self->_operationCode);
  v4 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<PTPDataPacket %p>{\n  _operationCode:  %@\n  _transactionID:  %lu\n  _data:           <%lu bytes>\n  _filepath:       %@\n  _bufferSize:     %llu\n  _offsetInBuffer: %llu\n  _range.location: %llu\n  _range.length:   %llu\n}", self, v3, self->_transactionID, [self->_data length], self->_filepath, self->_bufferSize, self->_offsetInBuffer, self->_range.location, self->_range.length);

  return v4;
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  id v5 = a3;
  p_id data = &self->_data;
  if (self->_data != v5)
  {
    id v7 = v5;
    objc_storeStrong(p_data, a3);
    self->_offsetInBuffer = 0;
    p_id data = (id *)[self->_data length];
    id v5 = v7;
    self->_bufferSize = (int64_t)p_data;
    self->_range.location = self->_offsetInBuffer;
    self->_range.id length = (unint64_t)p_data;
  }

  _objc_release_x1(p_data, v5);
}

- (_PTPRange)range
{
  unint64_t length = self->_range.length;
  unint64_t location = self->_range.location;
  result.unint64_t length = length;
  result.unint64_t location = location;
  return result;
}

- (int)setRange:(_PTPRange)a3
{
  unint64_t bufferSize = self->_bufferSize;
  if (bufferSize < a3.location) {
    return -1;
  }
  if (!a3.length) {
    return -2;
  }
  int result = 0;
  if (a3.location + a3.length <= bufferSize) {
    unint64_t length = a3.length;
  }
  else {
    unint64_t length = bufferSize - a3.location;
  }
  self->_range.unint64_t location = a3.location;
  self->_range.unint64_t length = length;
  self->_offsetInBuffer = a3.location;
  return result;
}

- (int64_t)copyToBuffer:(void *)a3 numBytes:(int64_t)a4
{
  if (a4 < 1) {
    return 0;
  }
  unint64_t length = self->_range.length;
  off_t offsetInBuffer = self->_offsetInBuffer;
  if ((uint64_t)(length + self->_range.location - offsetInBuffer) >= a4) {
    int64_t v7 = a4;
  }
  else {
    int64_t v7 = length + self->_range.location - offsetInBuffer;
  }
  if (v7)
  {
    id data = self->_data;
    if (data)
    {
      memcpy(a3, (char *)[data bytes] + self->_offsetInBuffer, v7);
LABEL_14:
      self->_offsetInBuffer += v7;
      return v7;
    }
    int fd = self->_fd;
    id dataSource = self->_dataSource;
    if (fd <= 0)
    {
      if (!dataSource) {
        return 0;
      }
    }
    else if (!dataSource)
    {
      id v11 = (id)pread(fd, a3, v7, offsetInBuffer);
LABEL_13:
      int64_t v7 = (int64_t)v11;
      if (v11 != (id)-1) {
        goto LABEL_14;
      }
      sub_10002C76C();
      return 0;
    }
    id v11 = [self->_dataSource read:a3 length:v7 offset:x0];
    goto LABEL_13;
  }
  return v7;
}

- (int64_t)copyToWrappedBytes:(id)a3 forTransport:(unsigned __int16)a4
{
  int v4 = a4;
  id v6 = a3;
  int64_t v7 = (char *)[v6 capacity];
  int v8 = [v6 mutableBytes];
  id v28 = v8;
  if ((unint64_t)v7 < 0xC) {
    goto LABEL_31;
  }
  id v9 = v8;
  if ((v4 - 1) >= 2)
  {
    if (v4 == 3)
    {
      v10 = v7 - 12;
      if (v7 == (char *)12)
      {
        sub_10002A638((_DWORD **)&v28, 12);
        sub_10002A638((_DWORD **)&v28, 10);
        goto LABEL_8;
      }
      unint64_t v18 = self->_range.location - self->_offsetInBuffer;
      if (!v18)
      {
        unint64_t length = self->_range.length;
        unint64_t v20 = length - 4294967284u;
        int v21 = length + 12;
        if (v20 < 0xFFFFFFFF00000000) {
          int v22 = -1;
        }
        else {
          int v22 = v21;
        }
        sub_10002A638((_DWORD **)&v28, v22);
        v27 = v28;
        sub_10002A638((_DWORD **)&v28, 10);
        sub_10002A638((_DWORD **)&v28, self->_transactionID);
        v10 = -[PTPDataPacket copyToBuffer:numBytes:](self, "copyToBuffer:numBytes:", v28, v7 - 12, v27);
        if (v10 < v7 || self->_range.length + self->_range.location == self->_offsetInBuffer) {
          sub_10002A638(&v27, 12);
        }
        goto LABEL_24;
      }
      unint64_t v23 = v18 + self->_range.length;
      if (v23 > (unint64_t)v10)
      {
        if (v23 <= (unint64_t)v7)
        {
          v25 = v7 - 1;
          int v24 = self;
          goto LABEL_28;
        }
LABEL_27:
        int v24 = self;
        v25 = v7;
LABEL_28:
        v10 = [(PTPDataPacket *)v24 copyToBuffer:v9 numBytes:v25];
        id v11 = v6;
        uint64_t v12 = (uint64_t)v10;
        goto LABEL_29;
      }
      sub_10002A638((_DWORD **)&v28, 12);
      sub_10002A638((_DWORD **)&v28, 12);
      sub_10002A638((_DWORD **)&v28, self->_transactionID);
    }
LABEL_31:
    v10 = 0;
    goto LABEL_32;
  }
  v10 = v7 - 12;
  if (v7 != (char *)12)
  {
    if (self->_offsetInBuffer == self->_range.location)
    {
      unint64_t v13 = self->_range.length;
      unint64_t v14 = v13 - 4294967284u;
      int v15 = v13 + 12;
      if (v4 == 1) {
        int v16 = -2;
      }
      else {
        int v16 = -1;
      }
      if (v14 >= 0xFFFFFFFF00000000) {
        int v17 = v15;
      }
      else {
        int v17 = v16;
      }
      sub_10002A638((_DWORD **)&v28, v17);
      sub_10002A5BC(&v28, 2);
      sub_10002A5BC(&v28, self->_operationCode);
      sub_10002A638((_DWORD **)&v28, self->_transactionID);
      v10 = [(PTPDataPacket *)self copyToBuffer:v28 numBytes:v7 - 12];
LABEL_24:
      uint64_t v12 = (v10 + 12);
      id v11 = v6;
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  sub_10002A638((_DWORD **)&v28, 12);
  sub_10002A5BC(&v28, 2);
  sub_10002A5BC(&v28, self->_operationCode);
LABEL_8:
  sub_10002A638((_DWORD **)&v28, self->_transactionID);
  id v11 = v6;
  uint64_t v12 = 12;
LABEL_29:
  [v11 setLength:v12];
LABEL_32:

  return (int64_t)v10;
}

- (int64_t)copyDataToWrappedBytes:(id)a3 forTransport:(unsigned __int16)a4 fromOffset:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [v7 capacity];
  id v9 = [v7 mutableBytes];
  self->_off_t offsetInBuffer = a5;
  int64_t v10 = [(PTPDataPacket *)self copyToBuffer:v9 numBytes:v8];
  [v7 setLength:v10];

  return v10;
}

- (int64_t)copyHeaderToWrappedBytes:(id)a3 forTransport:(unsigned __int16)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = [v6 capacity];
  v19 = [v6 mutableBytes];
  if ((unint64_t)v7 < 0xC) {
    goto LABEL_16;
  }
  if ((v4 - 1) >= 2)
  {
    if (v4 == 3)
    {
      unint64_t v13 = self->_range.length + self->_range.location - self->_offsetInBuffer;
      unint64_t v14 = v13 - 4294967284u;
      int v15 = v13 + 12;
      if (v14 < 0xFFFFFFFF00000000) {
        int v16 = -1;
      }
      else {
        int v16 = v15;
      }
      sub_10002A638((_DWORD **)&v19, v16);
      sub_10002A638((_DWORD **)&v19, 10);
      goto LABEL_15;
    }
LABEL_16:
    int64_t v17 = 0;
    goto LABEL_17;
  }
  unint64_t v8 = self->_range.length + self->_range.location - self->_offsetInBuffer;
  unint64_t v9 = v8 - 4294967284u;
  int v10 = v8 + 12;
  if (v4 == 1) {
    int v11 = -2;
  }
  else {
    int v11 = -1;
  }
  if (v9 >= 0xFFFFFFFF00000000) {
    int v12 = v10;
  }
  else {
    int v12 = v11;
  }
  sub_10002A638((_DWORD **)&v19, v12);
  sub_10002A5BC(&v19, 2);
  sub_10002A5BC(&v19, self->_operationCode);
LABEL_15:
  sub_10002A638((_DWORD **)&v19, self->_transactionID);
  int64_t v17 = 12;
  [v6 setLength:12];
LABEL_17:

  return v17;
}

- (int64_t)copyFromBuffer:(void *)a3 numBytes:(int64_t)a4
{
  if (a4 < 1) {
    return 0;
  }
  int64_t v4 = a4;
  off_t offsetInBuffer = self->_offsetInBuffer;
  uint64_t v8 = offsetInBuffer - self->_bufferSize + v4;
  id data = self->_data;
  if (!data)
  {
    if (v8 >= 1) {
      self->_unint64_t bufferSize = offsetInBuffer + v4;
    }
    ssize_t v14 = pwrite(self->_fd, a3, v4, offsetInBuffer);
    if (v14 != -1)
    {
      int64_t v4 = v14;
      self->_offsetInBuffer += v14;
      if (!v14) {
        return v4;
      }
      goto LABEL_8;
    }
    sub_10002C76C();
    return 0;
  }
  if ([data isMemberOfClass:objc_opt_class()])
  {
    id v10 = self->_data;
    id v11 = [v10 mutableCopy];
    id v12 = self->_data;
    self->_id data = v11;
  }
  if (v8 >= 1)
  {
    [self->_data increaseLengthBy:v8];
    self->_bufferSize += v8;
  }
  memcpy((char *)[self->_data mutableBytes] + self->_offsetInBuffer, a3, v4);
  self->_offsetInBuffer += v4;
LABEL_8:
  unint64_t bufferSize = self->_bufferSize;
  self->_range.unint64_t location = 0;
  self->_range.unint64_t length = bufferSize;
  return v4;
}

- (unsigned)operationCode
{
  return self->_operationCode;
}

- (void)setOperationCode:(unsigned __int16)a3
{
  self->_operationCode = a3;
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_transactionID = a3;
}

- (int64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(int64_t)a3
{
  self->_unint64_t bufferSize = a3;
}

- (int64_t)offsetInBuffer
{
  return self->_offsetInBuffer;
}

- (void)setOffsetInBuffer:(int64_t)a3
{
  self->_off_t offsetInBuffer = a3;
}

- (int64_t)bytesTransferred
{
  return self->_bytesTransferred;
}

- (void)setBytesTransferred:(int64_t)a3
{
  self->_bytesTransferred = a3;
}

- (NSString)filepath
{
  return self->_filepath;
}

- (void)setFilepath:(id)a3
{
}

- (BOOL)unlinkWhenDone
{
  return self->_unlinkWhenDone;
}

- (void)setUnlinkWhenDone:(BOOL)a3
{
  self->_unlinkWhenDone = a3;
}

- (id)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_int fd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_filepath, 0);

  objc_storeStrong(&self->_data, 0);
}

@end