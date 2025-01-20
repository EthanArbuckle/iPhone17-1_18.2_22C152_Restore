@interface OSAStreamDeflater
- (BOOL)capViolation;
- (OSAStreamDeflater)init;
- (id)copyDeflatedDataFromStream:(__sFILE *)a3 withCap:(unsigned int)a4;
- (void)dealloc;
- (void)setCapViolation:(BOOL)a3;
@end

@implementation OSAStreamDeflater

- (OSAStreamDeflater)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)OSAStreamDeflater;
  v2 = [(OSAStreamDeflater *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_strm.zalloc = 0;
    v2->_strm.zfree = 0;
    v2->_strm.opaque = 0;
    int v4 = deflateInit_(&v2->_strm, -1, "1.2.12", 112);
    if (v4)
    {
      int v5 = v4;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v11 = v5;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "OTALogArchive unable to initialize zlib (ret %d)", buf, 8u);
      }
    }
    else
    {
      v3->_in = (char *)malloc_type_malloc(0x10000uLL, 0x37335A5EuLL);
      v3->_out = (char *)malloc_type_malloc(0x10000uLL, 0x91BBC6BDuLL);
    }
    in = v3->_in;
    if (in)
    {
      if (v3->_out) {
        in = v3;
      }
      else {
        in = 0;
      }
    }
  }
  else
  {
    in = 0;
  }
  v7 = in;

  return v7;
}

- (void)dealloc
{
  out = self->_out;
  if (out) {
    free(out);
  }
  in = self->_in;
  if (in) {
    free(in);
  }
  deflateEnd(&self->_strm);
  v5.receiver = self;
  v5.super_class = (Class)OSAStreamDeflater;
  [(OSAStreamDeflater *)&v5 dealloc];
}

- (id)copyDeflatedDataFromStream:(__sFILE *)a3 withCap:(unsigned int)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  self->_capViolation = 0;
  while (1)
  {
    self->_strm.avail_in = fread(self->_in, 1uLL, 0x10000uLL, a3);
    if (ferror(a3)) {
      break;
    }
    int v8 = feof(a3);
    int v9 = 4 * (v8 != 0);
    self->_strm.next_in = (Bytef *)self->_in;
    do
    {
      self->_strm.uint64_t avail_out = 0x10000;
      self->_strm.next_out = (Bytef *)self->_out;
      deflate(&self->_strm, v9);
      uint64_t avail_out = self->_strm.avail_out;
      if (WORD1(avail_out)) {
        break;
      }
      [v7 appendBytes:self->_out length:0x10000 - avail_out];
    }
    while (!self->_strm.avail_out);
    if ([v7 length] >= (unint64_t)a4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 67109120;
        unsigned int v16 = a4;
        _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "deflateStream abort at cap limit %u", (uint8_t *)&v15, 8u);
      }

      id v7 = 0;
      self->_capViolation = 1;
      goto LABEL_15;
    }
    if (v8)
    {
      int v9 = 4;
      goto LABEL_15;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *__error();
    int v15 = 67109120;
    unsigned int v16 = v11;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "deflateStream error reading (errno %d)", (uint8_t *)&v15, 8u);
  }

  int v9 = 0;
  id v7 = 0;
LABEL_15:
  deflateReset(&self->_strm);
  if (![v7 length])
  {

    id v7 = 0;
  }
  if (v9) {
    uint64_t v12 = v7;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (BOOL)capViolation
{
  return self->_capViolation;
}

- (void)setCapViolation:(BOOL)a3
{
  self->_capViolation = a3;
}

@end