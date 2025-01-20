@interface _SFSHA224DigestOperation
+ (BOOL)supportsSecureCoding;
+ (id)digest:(id)a3;
+ (int64_t)blockSize;
+ (int64_t)outputSize;
- (NSData)hashValue;
- (_SFSHA224DigestOperation)init;
- (_SFSHA224DigestOperation)initWithCoder:(id)a3;
- (__CFString)_secKeyECDSAAlgorithm;
- (const)_ccDigestInfo;
- (void)addData:(id)a3;
@end

@implementation _SFSHA224DigestOperation

+ (id)digest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_SFSHA224DigestOperation);
  [(_SFSHA224DigestOperation *)v4 addData:v3];

  v5 = [(_SFSHA224DigestOperation *)v4 hashValue];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA224DigestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SFSHA224DigestOperation;
  v2 = [(_SFSHA224DigestOperation *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(SFSHA224DigestOperation_Ivars);
    sha224DigestOperationInternal = v2->_sha224DigestOperationInternal;
    v2->_sha224DigestOperationInternal = v3;

    CC_SHA224_Init((CC_SHA256_CTX *)((char *)v2->_sha224DigestOperationInternal + 8));
  }
  return v2;
}

- (_SFSHA224DigestOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFSHA224DigestOperation;
  return [(_SFSHA224DigestOperation *)&v4 init];
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
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  sha224DigestOperationInternal = (char *)self->_sha224DigestOperationInternal;
  long long v3 = *(_OWORD *)(sha224DigestOperationInternal + 40);
  long long v4 = *(_OWORD *)(sha224DigestOperationInternal + 24);
  *(_OWORD *)v10.count = *(_OWORD *)(sha224DigestOperationInternal + 8);
  *(_OWORD *)&v10.hash[2] = v4;
  *(_OWORD *)&v10.hash[6] = v3;
  long long v5 = *(_OWORD *)(sha224DigestOperationInternal + 56);
  long long v6 = *(_OWORD *)(sha224DigestOperationInternal + 72);
  long long v7 = *(_OWORD *)(sha224DigestOperationInternal + 88);
  *(void *)&v10.wbuf[14] = *((void *)sha224DigestOperationInternal + 13);
  *(_OWORD *)&v10.wbuf[6] = v6;
  *(_OWORD *)&v10.wbuf[10] = v7;
  *(_OWORD *)&v10.wbuf[2] = v5;
  CC_SHA224_Final(md, &v10);
  v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:28];
  return (NSData *)v8;
}

- (void)addData:(id)a3
{
  long long v3 = (CC_SHA256_CTX *)((char *)self->_sha224DigestOperationInternal + 8);
  id v4 = a3;
  long long v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA224_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x1E4F3BA30];
}

- (const)_ccDigestInfo
{
  return (const ccdigest_info *)MEMORY[0x1F40CB140](self, a2);
}

- (void).cxx_destruct
{
}

@end