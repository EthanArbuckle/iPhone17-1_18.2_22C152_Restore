@interface _SFSHA256DigestOperation
+ (BOOL)supportsSecureCoding;
+ (id)digest:(id)a3;
+ (int64_t)blockSize;
+ (int64_t)outputSize;
- (NSData)hashValue;
- (_SFSHA256DigestOperation)init;
- (_SFSHA256DigestOperation)initWithCoder:(id)a3;
- (__CFString)_secKeyECDSAAlgorithm;
- (const)_ccDigestInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addData:(id)a3;
@end

@implementation _SFSHA256DigestOperation

+ (id)digest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_SFSHA256DigestOperation);
  [(_SFSHA256DigestOperation *)v4 addData:v3];

  v5 = [(_SFSHA256DigestOperation *)v4 hashValue];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA256DigestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SFSHA256DigestOperation;
  v2 = [(_SFSHA256DigestOperation *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(SFSHA256DigestOperation_Ivars);
    sha256DigestOperationInternal = v2->_sha256DigestOperationInternal;
    v2->_sha256DigestOperationInternal = v3;

    CC_SHA256_Init((CC_SHA256_CTX *)((char *)v2->_sha256DigestOperationInternal + 8));
  }
  return v2;
}

- (_SFSHA256DigestOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFSHA256DigestOperation;
  return [(_SFSHA256DigestOperation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
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
  sha256DigestOperationInternal = (char *)self->_sha256DigestOperationInternal;
  long long v3 = *(_OWORD *)(sha256DigestOperationInternal + 40);
  long long v4 = *(_OWORD *)(sha256DigestOperationInternal + 24);
  *(_OWORD *)v10.count = *(_OWORD *)(sha256DigestOperationInternal + 8);
  *(_OWORD *)&v10.hash[2] = v4;
  *(_OWORD *)&v10.hash[6] = v3;
  long long v5 = *(_OWORD *)(sha256DigestOperationInternal + 56);
  long long v6 = *(_OWORD *)(sha256DigestOperationInternal + 72);
  long long v7 = *(_OWORD *)(sha256DigestOperationInternal + 88);
  *(void *)&v10.wbuf[14] = *((void *)sha256DigestOperationInternal + 13);
  *(_OWORD *)&v10.wbuf[6] = v6;
  *(_OWORD *)&v10.wbuf[10] = v7;
  *(_OWORD *)&v10.wbuf[2] = v5;
  CC_SHA256_Final(md, &v10);
  v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
  return (NSData *)v8;
}

- (void)addData:(id)a3
{
  long long v3 = (CC_SHA256_CTX *)((char *)self->_sha256DigestOperationInternal + 8);
  id v4 = a3;
  long long v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA256_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x1E4F3BA38];
}

- (const)_ccDigestInfo
{
  return (const ccdigest_info *)MEMORY[0x1F40CB148](self, a2);
}

- (void).cxx_destruct
{
}

@end