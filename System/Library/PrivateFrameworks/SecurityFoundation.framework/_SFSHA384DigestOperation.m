@interface _SFSHA384DigestOperation
+ (BOOL)supportsSecureCoding;
+ (id)digest:(id)a3;
+ (int64_t)blockSize;
+ (int64_t)outputSize;
- (NSData)hashValue;
- (_SFSHA384DigestOperation)init;
- (_SFSHA384DigestOperation)initWithCoder:(id)a3;
- (__CFString)_secKeyECDSAAlgorithm;
- (const)_ccDigestInfo;
- (void)addData:(id)a3;
@end

@implementation _SFSHA384DigestOperation

+ (id)digest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_SFSHA384DigestOperation);
  [(_SFSHA384DigestOperation *)v4 addData:v3];

  v5 = [(_SFSHA384DigestOperation *)v4 hashValue];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSHA384DigestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SFSHA384DigestOperation;
  v2 = [(_SFSHA384DigestOperation *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(SFSHA384DigestOperation_Ivars);
    sha384DigestOperationInternal = v2->_sha384DigestOperationInternal;
    v2->_sha384DigestOperationInternal = v3;

    CC_SHA384_Init((CC_SHA512_CTX *)((char *)v2->_sha384DigestOperationInternal + 8));
  }
  return v2;
}

- (_SFSHA384DigestOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFSHA384DigestOperation;
  return [(_SFSHA384DigestOperation *)&v4 init];
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
  sha384DigestOperationInternal = (char *)self->_sha384DigestOperationInternal;
  *(_OWORD *)v14.count = *(_OWORD *)(sha384DigestOperationInternal + 8);
  long long v3 = *(_OWORD *)(sha384DigestOperationInternal + 40);
  long long v4 = *(_OWORD *)(sha384DigestOperationInternal + 72);
  long long v5 = *(_OWORD *)(sha384DigestOperationInternal + 24);
  *(_OWORD *)&v14.hash[4] = *(_OWORD *)(sha384DigestOperationInternal + 56);
  *(_OWORD *)&v14.hash[6] = v4;
  *(_OWORD *)v14.hash = v5;
  *(_OWORD *)&v14.hash[2] = v3;
  long long v6 = *(_OWORD *)(sha384DigestOperationInternal + 104);
  long long v7 = *(_OWORD *)(sha384DigestOperationInternal + 136);
  long long v8 = *(_OWORD *)(sha384DigestOperationInternal + 88);
  *(_OWORD *)&v14.wbuf[4] = *(_OWORD *)(sha384DigestOperationInternal + 120);
  *(_OWORD *)&v14.wbuf[6] = v7;
  *(_OWORD *)v14.wbuf = v8;
  *(_OWORD *)&v14.wbuf[2] = v6;
  long long v9 = *(_OWORD *)(sha384DigestOperationInternal + 168);
  long long v10 = *(_OWORD *)(sha384DigestOperationInternal + 200);
  long long v11 = *(_OWORD *)(sha384DigestOperationInternal + 152);
  *(_OWORD *)&v14.wbuf[12] = *(_OWORD *)(sha384DigestOperationInternal + 184);
  *(_OWORD *)&v14.wbuf[14] = v10;
  *(_OWORD *)&v14.wbuf[8] = v11;
  *(_OWORD *)&v14.wbuf[10] = v9;
  CC_SHA384_Final(md, &v14);
  v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:48];
  return (NSData *)v12;
}

- (void)addData:(id)a3
{
  long long v3 = (CC_SHA512_CTX *)((char *)self->_sha384DigestOperationInternal + 8);
  id v4 = a3;
  long long v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA384_Update(v3, v5, v6);
}

- (__CFString)_secKeyECDSAAlgorithm
{
  return (__CFString *)*MEMORY[0x1E4F3BA40];
}

- (const)_ccDigestInfo
{
  return (const ccdigest_info *)MEMORY[0x1F40CB150](self, a2);
}

- (void).cxx_destruct
{
}

@end