@interface BRCChecksummingOutputStream
+ (id)checksummingOutputStreamWithTag:(unsigned __int8)a3;
- (BOOL)hasSpaceAvailable;
- (BRCChecksummingOutputStream)initWithTag:(unsigned __int8)a3;
- (NSData)signature;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
- (void)signature;
@end

@implementation BRCChecksummingOutputStream

- (NSData)signature
{
  if (self->_isOpen)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(BRCChecksummingOutputStream *)(uint64_t)v5 signature];
    }
  }
  v3 = [MEMORY[0x263EFF8F8] dataWithBytes:self->_sig length:21];
  return (NSData *)v3;
}

- (BRCChecksummingOutputStream)initWithTag:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCChecksummingOutputStream;
  result = [(BRCChecksummingOutputStream *)&v5 init];
  if (result) {
    result->_sig[0] = a3;
  }
  return result;
}

+ (id)checksummingOutputStreamWithTag:(unsigned __int8)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTag:a3];
  return v3;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (void)open
{
  if (self->_isOpen)
  {
    v3 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      [(BRCChecksummingOutputStream *)(uint64_t)v3 signature];
    }
  }
  self->_isOpen = 1;
  CC_SHA1_Init(&self->_ctx);
}

- (void)close
{
  if (self->_isOpen)
  {
    CC_SHA1_Final(&self->_sig[1], &self->_ctx);
    self->_isOpen = 0;
  }
}

- (unint64_t)streamStatus
{
  if (self->_isOpen) {
    return 2;
  }
  else {
    return 6;
  }
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  LODWORD(v7) = a4;
  if (HIDWORD(a4))
  {
    unint64_t v7 = a4;
    do
    {
      CC_SHA1_Update(&self->_ctx, a3, 0xFFFFFFFF);
      v7 -= 0xFFFFFFFFLL;
    }
    while (HIDWORD(v7));
  }
  CC_SHA1_Update(&self->_ctx, a3, v7);
  return a4;
}

- (void)signature
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !_isOpen%@", (uint8_t *)&v2, 0xCu);
}

@end