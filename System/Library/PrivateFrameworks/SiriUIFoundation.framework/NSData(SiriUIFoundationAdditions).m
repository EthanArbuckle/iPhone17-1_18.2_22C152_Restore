@interface NSData(SiriUIFoundationAdditions)
- (id)sruif_dataByCompressingWithGzip;
- (void)sruif_dataByCompressingWithGzip;
@end

@implementation NSData(SiriUIFoundationAdditions)

- (id)sruif_dataByCompressingWithGzip
{
  memset(&v8.total_out, 0, 72);
  id v1 = a1;
  v8.avail_in = objc_msgSend(v1, "length", objc_msgSend(v1, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
  if (deflateInit2_(&v8, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[NSData(SiriUIFoundationAdditions) sruif_dataByCompressingWithGzip]();
    }
    id v2 = 0;
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", deflateBound(&v8, objc_msgSend(v1, "length")));
    do
    {
      id v2 = v3;
      uint64_t v4 = [v2 mutableBytes];
      v8.next_out = (Bytef *)(v4 + v8.total_out);
      int v5 = [v2 length];
      v8.avail_out = v5 - LODWORD(v8.total_out);
      int v6 = deflate(&v8, 4);
    }
    while (!v6);
    if (v6 != 1)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        -[NSData(SiriUIFoundationAdditions) sruif_dataByCompressingWithGzip]();
      }

      id v2 = 0;
    }
    deflateEnd(&v8);
    [v2 setLength:v8.total_out];
  }
  return v2;
}

- (void)sruif_dataByCompressingWithGzip
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_225FBA000, v0, v1, "%s Error initializing zlib for NSData deflation: %{public}s (zlib code=%{public}d)", v2);
}

@end