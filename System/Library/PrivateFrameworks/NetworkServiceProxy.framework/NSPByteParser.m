@interface NSPByteParser
- (BOOL)advanceBy:(unint64_t)a3 andCopyTo:(void *)a4;
- (NSData)data;
- (NSPByteParser)initWithData:(id)a3;
- (const)bytes;
- (const)cursor;
- (const)parseBytes:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parseAddressWithFamily:(unsigned __int8)a3;
- (id)parseDomainName;
- (unint64_t)offset;
- (unsigned)parse16Bits:(BOOL *)a3;
- (unsigned)parse32Bits:(BOOL *)a3;
- (unsigned)parse8Bits:(BOOL *)a3;
- (void)setCursor:(const char *)a3;
- (void)setOffset:(unint64_t)a3;
@end

@implementation NSPByteParser

- (NSPByteParser)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NSPByteParser;
  v6 = [(NSPByteParser *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    uint64_t v8 = [v5 bytes];
    v7->_cursor = (const char *)v8;
    v7->_offset = 0;
    v7->_bytes = (const char *)v8;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NSPByteParser allocWithZone:a3];
  id v5 = [(NSPByteParser *)self data];
  v6 = [(NSPByteParser *)v4 initWithData:v5];

  return v6;
}

- (BOOL)advanceBy:(unint64_t)a3 andCopyTo:(void *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v7 = [(NSPByteParser *)self cursor];
  unint64_t v8 = [(NSPByteParser *)self offset];
  unint64_t v9 = v8 + a3;
  objc_super v10 = [(NSPByteParser *)self data];
  unint64_t v11 = [v10 length];

  if (v8 + a3 > v11)
  {
    v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134218240;
      unint64_t v15 = a3;
      __int16 v16 = 2048;
      unint64_t v17 = v8;
      _os_log_error_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_ERROR, "Failed to advance by %lu bytes from offset %lu", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    if (a4) {
      memcpy(a4, v7, a3);
    }
    [(NSPByteParser *)self setOffset:v9];
    [(NSPByteParser *)self setCursor:&v7[a3]];
  }
  return v9 <= v11;
}

- (id)parseDomainName
{
  v4 = 0;
  *(void *)&v29[5] = *MEMORY[0x1E4F143B8];
  *(void *)&long long v2 = 67109376;
  long long v26 = v2;
  do
  {
    char v27 = 1;
    unsigned int v5 = -[NSPByteParser parse8Bits:](self, "parse8Bits:", &v27, v26);
    if (!v27)
    {
      v13 = nplog_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        unint64_t v14 = [(NSPByteParser *)self offset];
        *(_DWORD *)buf = 134217984;
        *(void *)v29 = v14;
        unint64_t v15 = v13;
        __int16 v16 = "Failed to parse 1st label length byte at offset %lu";
LABEL_17:
        _os_log_error_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
      }
LABEL_18:

      goto LABEL_19;
    }
    unsigned int v6 = v5;
    BOOL v7 = (v5 & 0xC0) == 192;
    if ((v5 & 0xC0) == 0xC0)
    {
      int v8 = [(NSPByteParser *)self parse8Bits:&v27];
      if (v27)
      {
        uint64_t v9 = v8 & 0xFFFFC0FF | ((v6 & 0x3F) << 8);
        objc_super v10 = (void *)[(NSPByteParser *)self copy];
        int v11 = [v10 advanceBy:v9 andCopyTo:0];
        char v27 = v11;
        if (v11)
        {
          uint64_t v12 = [v10 parseDomainName];
          goto LABEL_12;
        }
        v22 = nplog_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          unint64_t v24 = [(NSPByteParser *)self offset];
          *(_DWORD *)buf = v26;
          v29[0] = v9;
          LOWORD(v29[1]) = 2048;
          *(void *)((char *)&v29[1] + 2) = v24;
          _os_log_error_impl(&dword_1A0FEE000, v22, OS_LOG_TYPE_ERROR, "Failed to follow pointer %u bytes from offset %lu", buf, 0x12u);
        }

LABEL_19:
        BOOL v7 = 0;
        continue;
      }
      v13 = nplog_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        unint64_t v20 = [(NSPByteParser *)self offset];
        *(_DWORD *)buf = 134217984;
        *(void *)v29 = v20;
        unint64_t v15 = v13;
        __int16 v16 = "Failed to parse 2nd label length byte at offset %lu";
        goto LABEL_17;
      }
      goto LABEL_18;
    }
    if (!v5) {
      break;
    }
    unint64_t v17 = [(NSPByteParser *)self parseBytes:v5];
    if (v17)
    {
      objc_super v10 = (void *)[[NSString alloc] initWithBytes:v17 length:v6 encoding:4];
      uint64_t v12 = [v10 stringByAppendingString:@"."];
LABEL_12:
      uint64_t v18 = (void *)v12;

      if (v18)
      {
        if (v4)
        {
          uint64_t v19 = [v4 stringByAppendingString:v18];

          v4 = (void *)v19;
        }
        else
        {
          v4 = v18;
        }
      }
      continue;
    }
    v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      unint64_t v23 = [(NSPByteParser *)self offset];
      *(_DWORD *)buf = v26;
      v29[0] = v6;
      LOWORD(v29[1]) = 2048;
      *(void *)((char *)&v29[1] + 2) = v23;
      _os_log_error_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_ERROR, "Failed to parse %u label bytes at offset %lu", buf, 0x12u);
    }

    BOOL v7 = 0;
    char v27 = 0;
  }
  while (!v7 && v27);
  return v4;
}

- (unsigned)parse8Bits:(BOOL *)a3
{
  unsigned __int8 v4 = 0;
  *a3 = [(NSPByteParser *)self advanceBy:1 andCopyTo:&v4];
  return v4;
}

- (unsigned)parse16Bits:(BOOL *)a3
{
  unsigned __int16 v5 = 0;
  *a3 = [(NSPByteParser *)self advanceBy:2 andCopyTo:&v5];
  return bswap32(v5) >> 16;
}

- (unsigned)parse32Bits:(BOOL *)a3
{
  unsigned int v4 = 0;
  *a3 = [(NSPByteParser *)self advanceBy:4 andCopyTo:&v4];
  return bswap32(v4);
}

- (const)parseBytes:(unint64_t)a3
{
  unsigned __int16 v5 = [(NSPByteParser *)self cursor];
  if ([(NSPByteParser *)self advanceBy:a3 andCopyTo:0]) {
    return v5;
  }
  else {
    return 0;
  }
}

- (id)parseAddressWithFamily:(unsigned __int8)a3
{
  int v3 = a3;
  if (a3 == 2)
  {
    size_t v4 = 16;
    uint64_t v5 = 4;
  }
  else
  {
    if (a3 != 30) {
      goto LABEL_9;
    }
    size_t v4 = 46;
    uint64_t v5 = 16;
  }
  unsigned int v6 = [(NSPByteParser *)self parseBytes:v5];
  if (v6)
  {
    BOOL v7 = v6;
    int v8 = (char *)malloc_type_malloc(v4, 0x100004077774924uLL);
    if (v8)
    {
      uint64_t v9 = v8;
      if (inet_ntop(v3, v7, v8, v4)) {
        objc_super v10 = (void *)[[NSString alloc] initWithCString:v9 encoding:4];
      }
      else {
        objc_super v10 = 0;
      }
      free(v9);
      goto LABEL_12;
    }
  }
LABEL_9:
  objc_super v10 = 0;
LABEL_12:
  return v10;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (const)bytes
{
  return self->_bytes;
}

- (const)cursor
{
  return self->_cursor;
}

- (void)setCursor:(const char *)a3
{
  self->_cursor = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
}

@end