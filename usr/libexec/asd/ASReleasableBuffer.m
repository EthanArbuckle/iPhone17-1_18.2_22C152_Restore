@interface ASReleasableBuffer
- (ASReleasableBuffer)initWithData:(id)a3;
- (char)data;
- (char)takeDataAndOwnership;
- (unint64_t)originalDataLength;
- (void)dealloc;
- (void)makeUnreleaseable;
- (void)releaseData;
@end

@implementation ASReleasableBuffer

- (ASReleasableBuffer)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASReleasableBuffer;
  v5 = [(ASReleasableBuffer *)&v9 init];
  if (!v5) {
    goto LABEL_6;
  }
  byte_1006AD190 = 1;
  id v6 = [v4 length];
  v5->_originalDataLength = (unint64_t)v6;
  if (!v6)
  {
    v5->_data = 0;
    goto LABEL_6;
  }
  v7 = (ASReleasableBuffer *)malloc_type_malloc((size_t)v6, 0x42C8BFC6uLL);
  v5->_data = (char *)v7;
  if (v7)
  {
    memcpy(v7, [v4 bytes], v5->_originalDataLength);
LABEL_6:
    v7 = v5;
  }

  return v7;
}

- (void)releaseData
{
  data = self->_data;
  if (data) {
    BOOL v4 = byte_1006AD190 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    free(data);
    self->_data = 0;
  }
}

- (void)makeUnreleaseable
{
  byte_1006AD190 = 0;
}

- (void)dealloc
{
  byte_1006AD190 = 1;
  [(ASReleasableBuffer *)self releaseData];
  v3.receiver = self;
  v3.super_class = (Class)ASReleasableBuffer;
  [(ASReleasableBuffer *)&v3 dealloc];
}

- (char)takeDataAndOwnership
{
  data = self->_data;
  if (!data)
  {
    BOOL v4 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
      sub_10055C3DC(v4);
    }
    return 0;
  }
  if (!byte_1006AD190)
  {
    v5 = (char *)malloc_type_malloc(self->_originalDataLength, 0xC9D5DE5BuLL);
    if (v5)
    {
      data = v5;
      memcpy(v5, self->_data, self->_originalDataLength);
      return data;
    }
    v7 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
      sub_10055C420(v7);
    }
    return 0;
  }
  self->_data = 0;
  return data;
}

- (unint64_t)originalDataLength
{
  return self->_originalDataLength;
}

- (char)data
{
  return self->_data;
}

@end