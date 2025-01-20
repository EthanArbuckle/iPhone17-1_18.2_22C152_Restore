@interface SFIncrementingIVGenerator
- (NSData)messageID;
- (SFIncrementingIVGenerator)initWithMessageID:(id)a3;
- (SFIncrementingIVGenerator)initWithRandomMessageID;
- (id)generateIVWithLength:(int64_t)a3 error:(id *)a4;
- (void)setMessageID:(id)a3;
@end

@implementation SFIncrementingIVGenerator

- (SFIncrementingIVGenerator)initWithRandomMessageID
{
  v3 = [MEMORY[0x1E4F1CA58] dataWithCapacity:32];
  [v3 setLength:32];
  v4 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  id v5 = v3;
  if (SecRandomCopyBytes(v4, 0x20uLL, (void *)[v5 mutableBytes]))
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"could not get a random initialization vector" userInfo:0];
    objc_exception_throw(v8);
  }
  v6 = [(SFIncrementingIVGenerator *)self initWithMessageID:v5];

  return v6;
}

- (SFIncrementingIVGenerator)initWithMessageID:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFIncrementingIVGenerator;
  id v5 = [(SFIncrementingIVGenerator *)&v12 init];
  if (v5)
  {
    v6 = objc_alloc_init(SFIncrementingIVGenerator_Ivars);
    id incrementingIVGeneratorInternal = v5->_incrementingIVGeneratorInternal;
    v5->_id incrementingIVGeneratorInternal = v6;

    uint64_t v8 = [v4 mutableCopy];
    v9 = v5->_incrementingIVGeneratorInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;
  }
  return v5;
}

- (id)generateIVWithLength:(int64_t)a3 error:(id *)a4
{
  id incrementingIVGeneratorInternal = self->_incrementingIVGeneratorInternal;
  if (*((void *)incrementingIVGeneratorInternal + 2) >= (unint64_t)a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:6 userInfo:0];
    id incrementingIVGeneratorInternal = self->_incrementingIVGeneratorInternal;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (a3 - 1 >= (unint64_t)[*((id *)incrementingIVGeneratorInternal + 1) length])
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SFCryptoServicesErrorDomain" code:7 userInfo:0];

    uint64_t v8 = (void *)v9;
  }
  if (a4 && v8)
  {
    v10 = 0;
    *a4 = v8;
  }
  else
  {
    v10 = objc_msgSend(*((id *)self->_incrementingIVGeneratorInternal + 1), "subdataWithRange:", objc_msgSend(*((id *)self->_incrementingIVGeneratorInternal + 1), "length") - a3, a3);
    uint64_t v11 = [*((id *)self->_incrementingIVGeneratorInternal + 1) length];
    uint64_t v12 = [*((id *)self->_incrementingIVGeneratorInternal + 1) mutableBytes];
    __int16 v13 = (*(unsigned char *)(v12 + v11 - 1))++ + 1;
    if ((v13 & 0x100) != 0 && v11 != 1)
    {
      uint64_t v14 = 1 - v11;
      v15 = (unsigned char *)(v11 + v12 - 2);
      do
      {
        unint64_t v16 = [*((id *)self->_incrementingIVGeneratorInternal + 1) length] + v14;
        v17 = self->_incrementingIVGeneratorInternal;
        if (v16 <= v17[2]) {
          unint64_t v16 = v17[2];
        }
        v17[2] = v16;
        __int16 v18 = (*v15--)++ + 1;
        if ((v18 & 0x100) == 0) {
          break;
        }
        ++v14;
      }
      while (v14);
    }
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (NSData)messageID
{
  v2 = (void *)[*((id *)self->_incrementingIVGeneratorInternal + 1) copy];
  return (NSData *)v2;
}

- (void)setMessageID:(id)a3
{
  *((void *)self->_incrementingIVGeneratorInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

@end