@interface NSData
- (id)NEKFluff;
- (id)NEKSqueeze;
@end

@implementation NSData

- (id)NEKSqueeze
{
  id v3 = objc_alloc_init((Class)NSMutableData);
  memset(&v11, 0, sizeof(v11));
  if (compression_stream_init(&v11, COMPRESSION_STREAM_ENCODE, COMPRESSION_LZFSE))
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006EE38();
    }
LABEL_19:
    id v9 = 0;
  }
  else
  {
    v4 = self;
    v11.src_ptr = (const uint8_t *)[(NSData *)v4 bytes];
    v11.src_size = [(NSData *)v4 length];
    while (1)
    {
      v11.dst_ptr = v18;
      v11.dst_size = 4096;
      compression_status v5 = compression_stream_process(&v11, 1);
      if (v5) {
        break;
      }
      if (v11.dst_size)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        goto LABEL_18;
      }
      [v3 appendBytes:v18 length:4096];
    }
    if (v5 != COMPRESSION_STATUS_END)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
LABEL_17:
      }
        sub_10006EE04();
LABEL_18:
      compression_stream_destroy(&v11);
      goto LABEL_19;
    }
    if (v11.dst_ptr > v18) {
      [v3 appendBytes:v18 length:v11.dst_ptr - v18];
    }
    NSUInteger v6 = [(NSData *)v4 length];
    id v7 = [v3 length];
    v8 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      int v13 = v6;
      __int16 v14 = 1024;
      int v15 = (int)v7;
      __int16 v16 = 2048;
      double v17 = ((double)v6 - (double)(unint64_t)v7) / (double)v6 * 100.0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Compressed ICS %d->%d %.01f%%", buf, 0x18u);
    }
    compression_stream_destroy(&v11);
    id v9 = v3;
  }

  return v9;
}

- (id)NEKFluff
{
  id v3 = [objc_alloc((Class)NSMutableData) initWithCapacity:4096];
  memset(&v8, 0, sizeof(v8));
  if (compression_stream_init(&v8, COMPRESSION_STREAM_DECODE, COMPRESSION_LZFSE))
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006EEA0();
    }
LABEL_17:
    id v6 = 0;
  }
  else
  {
    v4 = self;
    v8.src_ptr = (const uint8_t *)[(NSData *)v4 bytes];
    v8.src_size = [(NSData *)v4 length];
    while (1)
    {
      v8.dst_ptr = v9;
      v8.dst_size = 4096;
      compression_status v5 = compression_stream_process(&v8, 0);
      if (v5) {
        break;
      }
      if (v8.dst_size)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        goto LABEL_16;
      }
      [v3 appendBytes:v9 length:4096];
    }
    if (v5 != COMPRESSION_STATUS_END)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
LABEL_15:
      }
        sub_10006EE6C();
LABEL_16:
      compression_stream_destroy(&v8);
      goto LABEL_17;
    }
    if (v8.dst_ptr > v9) {
      [v3 appendBytes:v9 length:v8.dst_ptr - v9];
    }
    compression_stream_destroy(&v8);
    id v6 = v3;
  }

  return v6;
}

@end