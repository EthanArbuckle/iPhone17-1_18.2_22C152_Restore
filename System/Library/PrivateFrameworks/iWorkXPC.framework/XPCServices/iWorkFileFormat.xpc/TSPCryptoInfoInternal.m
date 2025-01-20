@interface TSPCryptoInfoInternal
- (BOOL)hasDecodedLength;
- (NSArray)blockInfos;
- (SFUCryptoKey)cryptoKey;
- (TSPCryptoInfoInternal)initWithCryptoInfo:(id)a3;
- (TSPCryptoInfoInternal)initWithCryptoKey:(id)a3 preferredBlockSize:(unint64_t)a4 blockInfos:(id)a5 decodedLength:(unint64_t)a6;
- (id)mutableCryptoInfoCopy;
- (unint64_t)decodedLength;
- (unint64_t)preferredBlockSize;
- (void)setBlockInfos:(id)a3;
- (void)setDecodedLength:(unint64_t)a3;
@end

@implementation TSPCryptoInfoInternal

- (TSPCryptoInfoInternal)initWithCryptoKey:(id)a3 preferredBlockSize:(unint64_t)a4 blockInfos:(id)a5 decodedLength:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  if (v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)TSPCryptoInfoInternal;
    v13 = [(TSPCryptoInfoInternal *)&v19 init];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_cryptoKey, a3);
      v14->_preferredBlockSize = a4;
      v15 = (NSArray *)[v12 copy];
      blockInfos = v14->_blockInfos;
      v14->_blockInfos = v15;

      v14->_decodedLength = a6;
    }
    self = v14;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (TSPCryptoInfoInternal)initWithCryptoInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 cryptoKey];
  id v6 = [v4 preferredBlockSize];
  v7 = [v4 blockInfos];
  v8 = -[TSPCryptoInfoInternal initWithCryptoKey:preferredBlockSize:blockInfos:decodedLength:](self, "initWithCryptoKey:preferredBlockSize:blockInfos:decodedLength:", v5, v6, v7, [v4 decodedLength]);

  return v8;
}

- (id)mutableCryptoInfoCopy
{
  v3 = [TSPMutableCryptoInfoInternal alloc];
  return [(TSPCryptoInfoInternal *)v3 initWithCryptoInfo:self];
}

- (BOOL)hasDecodedLength
{
  return [(TSPCryptoInfoInternal *)self decodedLength]
      || [(TSPCryptoInfoInternal *)self preferredBlockSize] != -1;
}

- (SFUCryptoKey)cryptoKey
{
  return self->_cryptoKey;
}

- (unint64_t)preferredBlockSize
{
  return self->_preferredBlockSize;
}

- (NSArray)blockInfos
{
  return self->_blockInfos;
}

- (void)setBlockInfos:(id)a3
{
}

- (unint64_t)decodedLength
{
  return self->_decodedLength;
}

- (void)setDecodedLength:(unint64_t)a3
{
  self->_decodedLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockInfos, 0);
  objc_storeStrong((id *)&self->_cryptoKey, 0);
}

@end