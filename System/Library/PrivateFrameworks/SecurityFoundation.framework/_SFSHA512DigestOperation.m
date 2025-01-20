@interface _SFSHA512DigestOperation
+ (BOOL)supportsSecureCoding;
+ (id)digest:(id)a3;
+ (int64_t)blockSize;
+ (int64_t)outputSize;
- (NSData)hashValue;
- (_SFSHA512DigestOperation)init;
- (_SFSHA512DigestOperation)initWithCoder:(id)a3;
- (__CFString)_secKeyECDSAAlgorithm;
- (const)_ccDigestInfo;
- (void)addData:(id)a3;
@end

@implementation _SFSHA512DigestOperation

+ (id)digest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_SFSHA512DigestOperation);
  [(_SFSHA512DigestOperation *)v4 addData:v3];

  v5 = [(_SFSHA512DigestOperation *)v4 hashValue];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA512DigestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SFSHA512DigestOperation;
  v2 = [(_SFSHA512DigestOperation *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(SFSHA512DigestOperation_Ivars);
    sha512DigestOperationInternal = v2->_sha512DigestOperationInternal;
    v2->_sha512DigestOperationInternal = v3;

    CC_SHA512_Init((CC_SHA512_CTX *)((char *)v2->_sha512DigestOperationInternal + 8));
  }
  return v2;
}

- (_SFSHA512DigestOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFSHA512DigestOperation;
  return [(_SFSHA512DigestOperation *)&v4 init];
}

+ (int64_t)outputSize
{
  return 0;
}

+ (int64_t)blockSize
{
  return 0;
}

- (NSData)hashValue
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  sha512DigestOperationInternal = (char *)self->_sha512DigestOperationInternal;
  *(_OWORD *)v14.count = *(_OWORD *)(sha512DigestOperationInternal + 8);
  long long v3 = *(_OWORD *)(sha512DigestOperationInternal + 40);
  long long v4 = *(_OWORD *)(sha512DigestOperationInternal + 72);
  long long v5 = *(_OWORD *)(sha512DigestOperationInternal + 24);
  *(_OWORD *)&v14.hash[4] = *(_OWORD *)(sha512DigestOperationInternal + 56);
  *(_OWORD *)&v14.hash[6] = v4;
  *(_OWORD *)v14.hash = v5;
  *(_OWORD *)&v14.hash[2] = v3;
  long long v6 = *(_OWORD *)(sha512DigestOperationInternal + 104);
  long long v7 = *(_OWORD *)(sha512DigestOperationInternal + 136);
  long long v8 = *(_OWORD *)(sha512DigestOperationInternal + 88);
  *(_OWORD *)&v14.wbuf[4] = *(_OWORD *)(sha512DigestOperationInternal + 120);
  *(_OWORD *)&v14.wbuf[6] = v7;
  *(_OWORD *)v14.wbuf = v8;
  *(_OWORD *)&v14.wbuf[2] = v6;
  long long v9 = *(_OWORD *)(sha512DigestOperationInternal + 168);
  long long v10 = *(_OWORD *)(sha512DigestOperationInternal + 200);
  long long v11 = *(_OWORD *)(sha512DigestOperationInternal + 152);
  *(_OWORD *)&v14.wbuf[12] = *(_OWORD *)(sha512DigestOperationInternal + 184);
  *(_OWORD *)&v14.wbuf[14] = v10;
  *(_OWORD *)&v14.wbuf[8] = v11;
  *(_OWORD *)&v14.wbuf[10] = v9;
  CC_SHA512_Final(md, &v14);
  v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:64];
  return (NSData *)v12;
}

- (void)addData:(id)a3
{
  long long v3 = (CC_SHA512_CTX *)((char *)self->_sha512DigestOperationInternal + 8);
  id v4 = a3;
  long long v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA512_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x1E4F3BA48];
}

- (const)_ccDigestInfo
{
  return (const ccdigest_info *)MEMORY[0x1F40CB148](self, a2);
}

- (void).cxx_destruct
{
}

@end