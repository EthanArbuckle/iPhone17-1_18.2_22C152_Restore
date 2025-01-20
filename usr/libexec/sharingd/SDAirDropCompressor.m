@interface SDAirDropCompressor
- (BOOL)readData:(char *)a3 length:(int64_t)a4 fromStream:(__CFReadStream *)a5;
- (BOOL)readIncomingChunk;
- (BOOL)writeData:(char *)a3 length:(int64_t)a4 toStream:(__CFWriteStream *)a5;
- (SDAirDropCompressor)initWithReadStream:(__CFReadStream *)a3 writeStream:(__CFWriteStream *)a4;
- (__CFReadStream)copyReadStream;
- (void)dealloc;
- (void)executeReadWithAdaptiveCompression;
- (void)executeWriteWithAdaptiveCompression;
- (void)fileComplete;
- (void)openStreams;
- (void)processCompressibilityStatistics;
- (void)processNetworkStatistics:(double)a3;
- (void)sendOutgoingChunk:(char *)a3 length:(int64_t)a4 compressed:(BOOL)a5;
@end

@implementation SDAirDropCompressor

- (SDAirDropCompressor)initWithReadStream:(__CFReadStream *)a3 writeStream:(__CFWriteStream *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SDAirDropCompressor;
  v6 = [(SDAirDropCompressor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_compressible = 1;
    v6->_totalBytesSent = 0;
    v6->_totalNetworkDelay = 0.0;
    v6->_numBlocksProcessed = 0;
    v6->_totalBytesProcessed = 0;
    v6->_lastCompressionRatio = 0.0;
    v6->_totalCompressionTime = 0.0;
    v6->_numBlocksCompressed = 0;
    v6->_totalCompressedOutput = 0;
    v6->_keepingUpWithNetwork = 1;
    v6->_readStream = (__CFReadStream *)CFRetain(a3);
    v7->_writeStream = (__CFWriteStream *)CFRetain(a4);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.sharingd.adjustment-queue", 0);
    adjustmentQueue = v7->_adjustmentQueue;
    v7->_adjustmentQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)dealloc
{
  readStream = self->_readStream;
  if (readStream) {
    CFRelease(readStream);
  }
  writeStream = self->_writeStream;
  if (writeStream) {
    CFRelease(writeStream);
  }
  v5.receiver = self;
  v5.super_class = (Class)SDAirDropCompressor;
  [(SDAirDropCompressor *)&v5 dealloc];
}

- (__CFReadStream)copyReadStream
{
  result = self->_readStream;
  if (result) {
    return (__CFReadStream *)CFRetain(result);
  }
  return result;
}

- (BOOL)writeData:(char *)a3 length:(int64_t)a4 toStream:(__CFWriteStream *)a5
{
  if (a4 < 1) {
    return 1;
  }
  int64_t v9 = 0;
  while (1)
  {
    CFIndex v10 = CFWriteStreamWrite(a5, (const UInt8 *)&a3[v9], a4 - v9);
    if (v10 < 0) {
      break;
    }
    v9 += v10;
    if (v9 >= a4) {
      return 1;
    }
  }
  v12 = airdrop_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10010FF54();
  }

  CFReadStreamClose(self->_readStream);
  return 0;
}

- (BOOL)readData:(char *)a3 length:(int64_t)a4 fromStream:(__CFReadStream *)a5
{
  if (a4 < 1) {
    return 1;
  }
  int64_t v9 = 0;
  while (1)
  {
    if (CFReadStreamGetStatus(a5) > kCFStreamStatusWriting) {
      return 1;
    }
    CFIndex v10 = CFReadStreamRead(a5, (UInt8 *)&a3[v9], a4 - v9);
    if (v10 < 0) {
      break;
    }
    v9 += v10;
    if (v9 >= a4) {
      return 1;
    }
  }
  v12 = airdrop_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10010FFBC();
  }

  CFWriteStreamClose(self->_writeStream);
  return 0;
}

- (BOOL)readIncomingChunk
{
  unsigned int v9 = 0;
  LODWORD(v3) = [(SDAirDropCompressor *)self readData:&v9 length:4 fromStream:self->_readStream];
  if (CFReadStreamGetStatus(self->_readStream) <= kCFStreamStatusWriting && v3 != 0)
  {
    unsigned int v9 = bswap32(v9);
    size_t v3 = v9 & 0x7FFFFFFF;
    objc_super v5 = (Bytef *)malloc_type_malloc(v3, 0x9B146ABEuLL);
    if ([(SDAirDropCompressor *)self readData:v5 length:v3 fromStream:self->_readStream])
    {
      if ((v9 & 0x80000000) != 0)
      {
        LOBYTE(v3) = [(SDAirDropCompressor *)self writeData:v5 length:v3 toStream:self->_writeStream];
      }
      else
      {
        uLongf v8 = 0x20000;
        v6 = (Bytef *)malloc_type_malloc(0x20000uLL, 0xEDEC9D1CuLL);
        uncompress(v6, &v8, v5, v3);
        LOBYTE(v3) = [(SDAirDropCompressor *)self writeData:v6 length:v8 toStream:self->_writeStream];
        if (v6 != v5)
        {
          free(v5);
          objc_super v5 = v6;
        }
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
    free(v5);
  }
  return v3;
}

- (void)sendOutgoingChunk:(char *)a3 length:(int64_t)a4 compressed:(BOOL)a5
{
  unsigned int v8 = a4 | 0x80000000;
  if (a5) {
    unsigned int v8 = a4;
  }
  unsigned int v9 = bswap32(v8);
  [(SDAirDropCompressor *)self writeData:&v9 length:4 toStream:self->_writeStream];
  [(SDAirDropCompressor *)self writeData:a3 length:a4 toStream:self->_writeStream];
}

- (void)openStreams
{
  if (CFReadStreamOpen(self->_readStream))
  {
    if (CFWriteStreamOpen(self->_writeStream)) {
      return;
    }
    CFErrorRef v3 = CFWriteStreamCopyError(self->_writeStream);
    v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10011008C();
    }

    CFReadStreamClose(self->_readStream);
  }
  else
  {
    CFErrorRef v3 = CFReadStreamCopyError(self->_readStream);
    objc_super v5 = airdrop_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100110024();
    }
  }
}

- (void)processNetworkStatistics:(double)a3
{
  if (a3 > 1.0 && !self->_keepingUpWithNetwork)
  {
    objc_super v11 = airdrop_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1001100F4(v11, a3);
    }

    self->_keepingUpWithNetwork = 1;
    self->_int64_t numBlocksProcessed = 0;
    self->_totalBytesSent = 0;
    double lastCompressionRatio = 0.0;
    uint64_t v12 = 16;
    goto LABEL_24;
  }
  int64_t numBlocksProcessed = self->_numBlocksProcessed;
  if (numBlocksProcessed < 21) {
    return;
  }
  unsigned int totalBytesProcessed = self->_totalBytesProcessed;
  double v9 = (double)totalBytesProcessed;
  if (totalBytesProcessed)
  {
    LODWORD(v3) = self->_totalCompressedOutput;
    double lastCompressionRatio = (double)v3 / v9;
  }
  else
  {
    double lastCompressionRatio = self->_lastCompressionRatio;
  }
  LODWORD(v9) = self->_totalBytesSent;
  double v13 = (double)*(unint64_t *)&v9 / self->_totalNetworkDelay;
  double v14 = self->_totalCompressionTime * 128.0 * 1024.0 / (double)totalBytesProcessed
      + lastCompressionRatio * 131072.0 / v13;
  double v15 = 131072.0 / v13;
  if (self->_keepingUpWithNetwork && v14 > v15 + v15)
  {
    v16 = airdrop_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100110170();
    }
    BOOL v17 = 0;
LABEL_22:

    self->_keepingUpWithNetwork = v17;
    goto LABEL_23;
  }
  if (!self->_keepingUpWithNetwork && v15 > v14)
  {
    v16 = airdrop_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1001101E8();
    }
    BOOL v17 = 1;
    goto LABEL_22;
  }
  if ((unint64_t)numBlocksProcessed <= 0x1F4)
  {
    uint64_t v12 = 56;
    goto LABEL_24;
  }
LABEL_23:
  self->_int64_t numBlocksProcessed = 0;
  self->_totalBytesSent = 0;
  uint64_t v12 = 56;
  self->_totalNetworkDelay = 0.0;
LABEL_24:
  *(double *)((char *)&self->super.isa + v12) = lastCompressionRatio;
}

- (void)processCompressibilityStatistics
{
  if (self->_compressible && self->_numBlocksCompressed >= 11)
  {
    LODWORD(v2) = self->_totalCompressedOutput;
    LODWORD(v3) = self->_totalBytesProcessed;
    double v4 = (double)v2 / (double)v3;
    if (v4 > 0.8)
    {
      self->_compressible = 0;
      objc_super v5 = airdrop_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100110260(v5, v4);
      }
    }
  }
}

- (void)fileComplete
{
  adjustmentQueue = self->_adjustmentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010F978;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_sync(adjustmentQueue, block);
}

- (void)executeReadWithAdaptiveCompression
{
  [(SDAirDropCompressor *)self openStreams];
  CFStreamStatus Status = CFReadStreamGetStatus(self->_readStream);
  if (Status < kCFStreamStatusAtEnd)
  {
    do
    {
      unsigned __int8 v4 = [(SDAirDropCompressor *)self readIncomingChunk];
      CFStreamStatus Status = CFReadStreamGetStatus(self->_readStream);
    }
    while (Status < kCFStreamStatusAtEnd && (v4 & 1) != 0);
  }
  if (Status <= kCFStreamStatusAtEnd)
  {
    CFReadStreamClose(self->_readStream);
LABEL_10:
    CFErrorRef v5 = 0;
    goto LABEL_11;
  }
  if (Status != kCFStreamStatusError) {
    goto LABEL_10;
  }
  CFErrorRef v5 = CFReadStreamCopyError(self->_readStream);
  v6 = airdrop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1001102DC();
  }

LABEL_11:
  CFWriteStreamClose(self->_writeStream);
}

- (void)executeWriteWithAdaptiveCompression
{
  [(SDAirDropCompressor *)self openStreams];
  unint64_t v3 = dispatch_semaphore_create(2);
  unsigned __int8 v4 = dispatch_queue_create("com.apple.sharingd.compression-queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  CFStreamStatus Status = CFReadStreamGetStatus(self->_readStream);
  if (Status >= kCFStreamStatusAtEnd)
  {
    dispatch_semaphore_t v6 = 0;
    v7 = 0;
    goto LABEL_15;
  }
  dispatch_semaphore_t v6 = 0;
  v7 = 0;
  while (1)
  {
    dispatch_semaphore_t v8 = v6;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);

    double v9 = (UInt8 *)malloc_type_malloc(0x20000uLL, 0xF11B11ECuLL);
    CFIndex v10 = CFReadStreamRead(self->_readStream, v9, 0x20000);
    if (!v10)
    {
      free(v9);
      goto LABEL_7;
    }
    CFIndex v11 = v10;
    if (v10 < 0) {
      break;
    }
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10010FCE8;
    v17[3] = &unk_1008CD970;
    CFIndex v21 = v11;
    v22 = v9;
    v17[4] = self;
    v18 = v7;
    uint64_t v12 = v6;
    v19 = v12;
    v20 = v3;
    double v13 = v7;
    dispatch_async(v4, v17);
    v7 = v12;

LABEL_7:
    CFStreamStatus Status = CFReadStreamGetStatus(self->_readStream);
    if (Status >= kCFStreamStatusAtEnd)
    {
      if (!v7) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  double v14 = airdrop_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10010FFBC();
  }

  free(v9);
  if (v7) {
LABEL_14:
  }
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
LABEL_15:
  if (Status <= kCFStreamStatusAtEnd)
  {
    CFReadStreamClose(self->_readStream);
    goto LABEL_21;
  }
  if (Status == kCFStreamStatusError)
  {
    CFErrorRef v15 = CFReadStreamCopyError(self->_readStream);
    v16 = airdrop_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100110344();
    }
  }
  else
  {
LABEL_21:
    CFErrorRef v15 = 0;
  }
  CFWriteStreamClose(self->_writeStream);
}

- (void).cxx_destruct
{
}

@end