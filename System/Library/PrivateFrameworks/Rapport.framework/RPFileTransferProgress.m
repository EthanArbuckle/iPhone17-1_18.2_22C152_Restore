@interface RPFileTransferProgress
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (NSString)currentFilename;
- (RPFileTransferProgress)init;
- (RPFileTransferProgress)initWithCoder:(id)a3;
- (double)bytesPerSecond;
- (double)compressionRate;
- (double)remainingSeconds;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)linkType;
- (int)type;
- (int64_t)totalByteCount;
- (int64_t)totalFileCount;
- (int64_t)transferredByteCount;
- (int64_t)transferredFileCount;
- (void)setBytesPerSecond:(double)a3;
- (void)setCompressionRate:(double)a3;
- (void)setCurrentFilename:(id)a3;
- (void)setError:(id)a3;
- (void)setLinkType:(int)a3;
- (void)setRemainingSeconds:(double)a3;
- (void)setTotalByteCount:(int64_t)a3;
- (void)setTotalFileCount:(int64_t)a3;
- (void)setTransferredByteCount:(int64_t)a3;
- (void)setTransferredFileCount:(int64_t)a3;
- (void)setType:(int)a3;
@end

@implementation RPFileTransferProgress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPFileTransferProgress)init
{
  v11.receiver = self;
  v11.super_class = (Class)RPFileTransferProgress;
  v2 = [(RPFileTransferProgress *)&v11 init];
  v3 = v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v2->_bytesPerSecond = _Q0;
    v2->_compressionRate = -1.0;
    v9 = v2;
  }

  return v3;
}

- (RPFileTransferProgress)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RPFileTransferProgress;
  v3 = [(RPFileTransferProgress *)&v7 init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  return [(RPFileTransferProgress *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  v14[1] = 0;
  NSAppendPrintF();
  id v4 = 0;
  v5 = v4;
  if (self->_transferredFileCount < 0 || self->_totalFileCount < 1)
  {
    id v13 = v4;
    v6 = &v13;
  }
  else
  {
    v14[0] = v4;
    v6 = (id *)v14;
  }
  NSAppendPrintF();
  id v7 = *v6;

  if (self->_totalByteCount >= 1)
  {
    NSAppendPrintF();
    id v8 = v7;

    id v7 = v8;
  }
  if (self->_bytesPerSecond > 0.0)
  {
    NSAppendPrintF();
    id v9 = v7;

    id v7 = v9;
  }
  if (self->_compressionRate >= 0.0)
  {
    NSAppendPrintF();
    id v10 = v7;

    id v7 = v10;
  }
  if (self->_linkType)
  {
    NSAppendPrintF();
    id v11 = v7;

    id v7 = v11;
  }
  return v7;
}

- (double)bytesPerSecond
{
  return self->_bytesPerSecond;
}

- (void)setBytesPerSecond:(double)a3
{
  self->_bytesPerSecond = a3;
}

- (double)remainingSeconds
{
  return self->_remainingSeconds;
}

- (void)setRemainingSeconds:(double)a3
{
  self->_remainingSeconds = a3;
}

- (double)compressionRate
{
  return self->_compressionRate;
}

- (void)setCompressionRate:(double)a3
{
  self->_compressionRate = a3;
}

- (NSString)currentFilename
{
  return self->_currentFilename;
}

- (void)setCurrentFilename:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int)a3
{
  self->_linkType = a3;
}

- (int64_t)transferredByteCount
{
  return self->_transferredByteCount;
}

- (void)setTransferredByteCount:(int64_t)a3
{
  self->_transferredByteCount = a3;
}

- (int64_t)totalByteCount
{
  return self->_totalByteCount;
}

- (void)setTotalByteCount:(int64_t)a3
{
  self->_totalByteCount = a3;
}

- (int64_t)transferredFileCount
{
  return self->_transferredFileCount;
}

- (void)setTransferredFileCount:(int64_t)a3
{
  self->_transferredFileCount = a3;
}

- (int64_t)totalFileCount
{
  return self->_totalFileCount;
}

- (void)setTotalFileCount:(int64_t)a3
{
  self->_totalFileCount = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_currentFilename, 0);
}

@end