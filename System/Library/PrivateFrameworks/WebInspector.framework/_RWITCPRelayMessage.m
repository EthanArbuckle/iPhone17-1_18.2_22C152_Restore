@interface _RWITCPRelayMessage
+ (id)TCPRelayMessageFromDataStream:(id)a3 error:(id *)a4;
+ (id)TCPRelayMessageWithPayload:(id)a3;
- (NSData)payload;
- (_RWITCPRelayMessage)initWithPayload:(id)a3;
- (int64_t)write:(int)a3;
- (int64_t)writeInternal:(id)a3;
- (int64_t)writeLockdown:(_lockdown_connection *)a3;
- (unint64_t)length;
@end

@implementation _RWITCPRelayMessage

- (_RWITCPRelayMessage)initWithPayload:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_RWITCPRelayMessage;
  v5 = [(_RWITCPRelayMessage *)&v18 init];
  if (v5)
  {
    if ((unint64_t)[v4 length] < 0xFFFFFFFC)
    {
      uint64_t v15 = [v4 copy];
      payload = v5->_payload;
      v5->_payload = (NSData *)v15;

      v5->_writtenHeader = 0;
      v5->_writtenPayloadOffset = 0;
      v14 = v5;
      goto LABEL_8;
    }
    v6 = RWIDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_RWITCPRelayMessage initWithPayload:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v14 = 0;
LABEL_8:

  return v14;
}

+ (id)TCPRelayMessageFromDataStream:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (!a4)
  {
    v20 = RWIDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[_RWITCPRelayMessage TCPRelayMessageFromDataStream:error:](v20, v21, v22, v23, v24, v25, v26, v27);
    }

    goto LABEL_10;
  }
  unint64_t v7 = [v5 length];
  if (v7 < 4) {
    goto LABEL_10;
  }
  unint64_t v8 = v7;
  unsigned int v29 = 0;
  [v6 getBytes:&v29 length:4];
  uint64_t v9 = bswap32(v29);
  unsigned int v29 = v9;
  if (v9 >= 0xFFFFFFFB)
  {
    uint64_t v10 = RWIDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[_RWITCPRelayMessage TCPRelayMessageFromDataStream:error:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    objc_super v18 = [NSDictionary dictionaryWithObject:@"Cannot read _RWITCPRelayMessage from stream. Corrupt header." forKey:*MEMORY[0x263F08320]];
    v19 = 0;
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"_RWITCPRelayMessage" code:1 userInfo:v18];
    goto LABEL_13;
  }
  if (v8 < v9 + 4)
  {
LABEL_10:
    v19 = 0;
    goto LABEL_14;
  }
  objc_super v18 = [v6 subdataWithRange:4];
  v19 = +[_RWITCPRelayMessage TCPRelayMessageWithPayload:v18];
LABEL_13:

LABEL_14:
  return v19;
}

+ (id)TCPRelayMessageWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithPayload:v4];

  return v5;
}

- (unint64_t)length
{
  return [(NSData *)self->_payload length] + 4;
}

- (int64_t)write:(int)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29___RWITCPRelayMessage_write___block_invoke;
  v4[3] = &__block_descriptor_36_e12_q24__0r_8Q16l;
  int v5 = a3;
  return [(_RWITCPRelayMessage *)self writeInternal:v4];
}

- (int64_t)writeLockdown:(_lockdown_connection *)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37___RWITCPRelayMessage_writeLockdown___block_invoke;
  v4[3] = &__block_descriptor_40_e12_q24__0r_8Q16l;
  void v4[4] = a3;
  return [(_RWITCPRelayMessage *)self writeInternal:v4];
}

- (int64_t)writeInternal:(id)a3
{
  id v4 = (uint64_t (**)(id, uint64_t, uint64_t))a3;
  if (!self->_writtenHeader)
  {
    unsigned int v15 = bswap32([(NSData *)self->_payload length]);
    id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v15 length:4];
    if (v4[2](v4, [v5 bytes], objc_msgSend(v5, "length")) < 0)
    {
      if (*__error() == 35)
      {
        int64_t v8 = 2;
      }
      else
      {
        uint64_t v13 = RWIDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[_RWITCPRelayMessage writeInternal:]();
        }

        int64_t v8 = 3;
      }

      goto LABEL_19;
    }
    self->_writtenHeader = 1;
  }
  NSUInteger v6 = [(NSData *)self->_payload length];
  unint64_t writtenPayloadOffset = self->_writtenPayloadOffset;
  if (v6 != writtenPayloadOffset)
  {
    uint64_t v9 = v4[2](v4, (uint64_t)([(NSData *)self->_payload bytes] + self->_writtenPayloadOffset), v6 - writtenPayloadOffset);
    if ((v9 & 0x8000000000000000) == 0)
    {
      payload = self->_payload;
      unint64_t v11 = self->_writtenPayloadOffset + v9;
      self->_unint64_t writtenPayloadOffset = v11;
      int64_t v8 = v11 != [(NSData *)payload length];
      goto LABEL_19;
    }
    if (*__error() == 35)
    {
      int64_t v8 = 2;
      goto LABEL_19;
    }
    uint64_t v12 = RWIDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_RWITCPRelayMessage writeInternal:]();
    }
  }
  int64_t v8 = 3;
LABEL_19:

  return v8;
}

- (NSData)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
}

- (void)initWithPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)TCPRelayMessageFromDataStream:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)TCPRelayMessageFromDataStream:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeInternal:.cold.1()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_226FA0000, v1, v2, "_RWITCPRelayMessage payload write failure: %{public}d - %{public}s", v3, v4, v5, v6, v7);
}

- (void)writeInternal:.cold.2()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_226FA0000, v1, v2, "_RWITCPRelayMessage header write failure: %{public}d - %{public}s", v3, v4, v5, v6, v7);
}

@end