@interface ICSDigestPair
+ (id)digestPairWithSerializedData:(id)a3;
- (NSData)processedDigest;
- (NSData)unprocessedDigest;
- (id)serializedData;
- (void)setProcessedDigest:(id)a3;
- (void)setUnprocessedDigest:(id)a3;
@end

@implementation ICSDigestPair

+ (id)digestPairWithSerializedData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4 == 40)
  {
    uint64_t v8 = [v3 bytes];
    v5 = objc_opt_new();
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:20];
    v10 = (void *)v5[1];
    v5[1] = v9;

    v11 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v12 = v8 + 20;
    goto LABEL_9;
  }
  if (v4 == 21)
  {
    v13 = (unsigned char *)[v3 bytes];
    if (*v13) {
      goto LABEL_7;
    }
    v14 = v13;
    v5 = objc_opt_new();
    v11 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v12 = (uint64_t)(v14 + 1);
LABEL_9:
    uint64_t v15 = [v11 dataWithBytes:v12 length:20];
    v7 = (void *)v5[2];
    v5[2] = v15;
    goto LABEL_10;
  }
  if (v4 != 20)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_11;
  }
  v5 = objc_opt_new();
  id v6 = v3;
  v7 = (void *)v5[1];
  v5[1] = v6;
LABEL_10:

LABEL_11:
  return v5;
}

- (id)serializedData
{
  unprocessedDigest = self->_unprocessedDigest;
  if ((unprocessedDigest || self->_processedDigest)
    && (![(NSData *)unprocessedDigest length] || [(NSData *)self->_unprocessedDigest length] == 20)
    && (![(NSData *)self->_processedDigest length] || [(NSData *)self->_processedDigest length] == 20))
  {
    uint64_t v4 = self->_unprocessedDigest;
    if (self->_processedDigest)
    {
      if (v4)
      {
        v5 = [MEMORY[0x1E4F1CA58] dataWithCapacity:40];
        [(NSData *)v5 appendData:self->_unprocessedDigest];
      }
      else
      {
        v5 = [MEMORY[0x1E4F1CA58] dataWithCapacity:21];
        uint64_t v7 = 0;
        [(NSData *)v5 appendBytes:&v7 length:1];
      }
      [(NSData *)v5 appendData:self->_processedDigest];
    }
    else
    {
      v5 = v4;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSData)unprocessedDigest
{
  return self->_unprocessedDigest;
}

- (void)setUnprocessedDigest:(id)a3
{
}

- (NSData)processedDigest
{
  return self->_processedDigest;
}

- (void)setProcessedDigest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedDigest, 0);
  objc_storeStrong((id *)&self->_unprocessedDigest, 0);
}

@end