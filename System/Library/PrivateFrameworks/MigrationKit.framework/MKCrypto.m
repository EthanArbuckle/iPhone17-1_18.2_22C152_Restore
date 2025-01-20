@interface MKCrypto
- (BOOL)useCFB8Mode;
- (MKCrypto)initWithKey:(id)a3;
- (NSData)key;
- (id)bytes:(unint64_t)a3;
- (id)decryptData:(id)a3;
- (id)encrypt:(BOOL)a3 data:(id)a4 withKey:(id)a5 iv:(id)a6;
- (id)encryptData:(id)a3;
- (void)setKey:(id)a3;
- (void)setUseCFB8Mode:(BOOL)a3;
@end

@implementation MKCrypto

- (MKCrypto)initWithKey:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MKCrypto;
  v5 = [(MKCrypto *)&v25 init];
  if (!v5)
  {
LABEL_18:
    v13 = v5;
    goto LABEL_19;
  }
  if ((unint64_t)[v4 length] > 0xF)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v14 = [&unk_26DF7B0B8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(&unk_26DF7B0B8);
          }
          unint64_t v18 = [*(id *)(*((void *)&v21 + 1) + 8 * i) unsignedIntegerValue];
          if ([v4 length] > v18)
          {
            uint64_t v19 = objc_msgSend(v4, "subdataWithRange:", 0, v18);

            id v4 = (id)v19;
            goto LABEL_17;
          }
          if ([v4 length] == v18) {
            goto LABEL_17;
          }
        }
        uint64_t v15 = [&unk_26DF7B0B8 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_17:
    [(MKCrypto *)v5 setKey:v4];
    goto LABEL_18;
  }
  v6 = +[MKLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MKCrypto initWithKey:]((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = 0;
LABEL_19:

  return v13;
}

- (id)encryptData:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(MKCrypto *)self bytes:16];
    v6 = [(MKCrypto *)self encrypt:1 data:v4 withKey:self->_key iv:v5];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:", objc_msgSend(v6, "length") + objc_msgSend(v5, "length"));
      [v7 appendData:v5];
      [v7 appendData:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v8 = +[MKLog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MKCrypto encryptData:]((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)decryptData:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] > 0x10)
  {
    uint64_t v13 = objc_msgSend(v4, "subdataWithRange:", 0, 16);
    uint64_t v14 = objc_msgSend(v4, "subdataWithRange:", objc_msgSend(v13, "length"), objc_msgSend(v4, "length") - objc_msgSend(v13, "length"));
    uint64_t v12 = [(MKCrypto *)self encrypt:0 data:v14 withKey:self->_key iv:v13];
  }
  else
  {
    v5 = +[MKLog log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MKCrypto decryptData:]((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = 0;
  }

  return v12;
}

- (id)encrypt:(BOOL)a3 data:(id)a4 withKey:(id)a5 iv:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  CCCryptorRef cryptorRef = 0;
  unint64_t v13 = [v11 length];
  if (v13 > 0x20 || ((1 << v13) & 0x101010000) == 0)
  {
    uint64_t v19 = [MKError alloc];
    v20 = @"did receive an invalid key.";
    uint64_t v21 = 0;
    goto LABEL_13;
  }
  if ([v12 length] != 16)
  {
    uint64_t v19 = [MKError alloc];
    v20 = @"did receive an invalid iv.";
    uint64_t v21 = 1;
    goto LABEL_13;
  }
  CCOperation v15 = !v8;
  if ([(MKCrypto *)self useCFB8Mode]) {
    CCMode v16 = 10;
  }
  else {
    CCMode v16 = 3;
  }
  v17 = (const void *)[v12 bytes];
  id v18 = v11;
  if (CCCryptorCreateWithMode(v15, v16, 0, 0, v17, (const void *)[v18 bytes], objc_msgSend(v18, "length"), 0, 0, 0, 0, &cryptorRef))
  {
    uint64_t v19 = [MKError alloc];
    v20 = @"could not create a cryptor.";
    uint64_t v21 = 3;
LABEL_13:
    long long v22 = [(MKError *)v19 initWithDomain:0x26DF6D230 code:v21 message:v20];
    id v23 = 0;
    goto LABEL_14;
  }
  size_t dataOutMoved = 0;
  v26 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(v10, "length") + 16);
  uint64_t v27 = cryptorRef;
  id v28 = v10;
  v29 = (const void *)[v28 bytes];
  size_t v30 = [v28 length];
  id v31 = v26;
  if (CCCryptorUpdate(v27, v29, v30, (void *)[v31 mutableBytes], objc_msgSend(v31, "length"), &dataOutMoved))
  {
    v32 = [MKError alloc];
    v33 = @"could not update the cryptor.";
  }
  else
  {
    [v31 setLength:dataOutMoved];
    v34 = cryptorRef;
    id v35 = v31;
    if (!CCCryptorFinal(v34, (void *)[v35 mutableBytes], objc_msgSend(v35, "length"), &dataOutMoved))
    {
      id v23 = v35;
      long long v22 = 0;
      goto LABEL_28;
    }
    v32 = [MKError alloc];
    v33 = @"could not finalize the cryptor.";
  }
  long long v22 = [(MKError *)v32 initWithDomain:0x26DF6D230 code:3 message:v33];
  id v23 = 0;
LABEL_28:

LABEL_14:
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }
  if (v22)
  {
    long long v24 = +[MKLog log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MKSRPClient computeSharedKey:clientPublicKey:proofOfMatch:FromSalt:serverPublicKey:]((uint64_t)self, v22, v24);
    }
  }
  return v23;
}

- (id)bytes:(unint64_t)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:a3];
  if (a3 >= 4)
  {
    unint64_t v5 = a3 >> 2;
    do
    {
      uint32_t v7 = 0;
      uint32_t v7 = arc4random();
      [v4 appendBytes:&v7 length:4];
      --v5;
    }
    while (v5);
  }
  return v4;
}

- (BOOL)useCFB8Mode
{
  return self->_useCFB8Mode;
}

- (void)setUseCFB8Mode:(BOOL)a3
{
  self->_useCFB8Mode = a3;
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encryptData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decryptData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end