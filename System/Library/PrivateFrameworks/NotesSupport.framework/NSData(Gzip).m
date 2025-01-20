@interface NSData(Gzip)
- (id)ic_gzipDeflate;
- (id)ic_gzipInflate;
- (void)ic_gzipInflate;
@end

@implementation NSData(Gzip)

- (id)ic_gzipInflate
{
  if (![a1 length])
  {
    id v6 = a1;
    goto LABEL_19;
  }
  uint64_t v2 = [a1 length];
  unint64_t v3 = [a1 length];
  v4 = [MEMORY[0x263EFF990] dataWithLength:v2 + (v3 >> 1)];
  memset(&strm.avail_in, 0, 104);
  id v5 = a1;
  strm.next_in = (Bytef *)[v5 bytes];
  strm.avail_in = [v5 length];
  id v6 = 0;
  if (!inflateInit2_(&strm, 47, "1.2.12", 112))
  {
    unint64_t v7 = v3 >> 1;
    do
    {
      uLong total_out = strm.total_out;
      if (total_out >= [v4 length]) {
        [v4 increaseLengthBy:v7];
      }
      id v9 = v4;
      uint64_t v10 = [v9 mutableBytes];
      strm.next_out = (Bytef *)(v10 + strm.total_out);
      int v11 = [v9 length];
      strm.avail_out = v11 - LODWORD(strm.total_out);
      uint64_t v12 = inflate(&strm, 2);
    }
    while (!v12);
    int v13 = v12;
    if (v12 == 1)
    {
      if (!inflateEnd(&strm))
      {
        [v9 setLength:strm.total_out];
        id v6 = [MEMORY[0x263EFF8F8] dataWithData:v9];
        goto LABEL_18;
      }
    }
    else
    {
      NSLog(&cfstr_ErrorInflateFa.isa, v12);
      v14 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(NSData(Gzip) *)v13 ic_gzipInflate];
      }

      if (!inflateEnd(&strm)) {
        goto LABEL_17;
      }
    }
    NSLog(&cfstr_ErrorInflateen.isa);
    v15 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NSData(Gzip) ic_gzipInflate](v15);
    }

LABEL_17:
    id v6 = 0;
  }
LABEL_18:

LABEL_19:
  return v6;
}

- (id)ic_gzipDeflate
{
  if ([a1 length])
  {
    memset(&v10.total_out, 0, 72);
    id v2 = a1;
    v10.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
    id v3 = 0;
    if (!deflateInit2_(&v10, -1, 8, 31, 8, 0, "1.2.12", 112))
    {
      v4 = [MEMORY[0x263EFF990] dataWithLength:0x4000];
      do
      {
        uLong total_out = v10.total_out;
        if (total_out >= [v4 length]) {
          [v4 increaseLengthBy:0x4000];
        }
        id v6 = v4;
        uint64_t v7 = [v6 mutableBytes];
        v10.next_out = (Bytef *)(v7 + v10.total_out);
        int v8 = [v6 length];
        v10.avail_out = v8 - LODWORD(v10.total_out);
        deflate(&v10, 4);
      }
      while (!v10.avail_out);
      deflateEnd(&v10);
      [v6 setLength:v10.total_out];
      id v3 = [MEMORY[0x263EFF8F8] dataWithData:v6];
    }
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (void)ic_gzipInflate
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20C263000, a2, OS_LOG_TYPE_ERROR, "inflate failed returned %d", (uint8_t *)v2, 8u);
}

@end