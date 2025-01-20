@interface TPTypedSignedData
- (BOOL)checkSignatureWithKey:(id)a3;
- (BOOL)lastSigValidationResult;
- (NSData)data;
- (NSData)sig;
- (NSString)sigTypeName;
- (OS_dispatch_queue)sigValidationQueue;
- (TPPublicKey)lastSigValidationPubkey;
- (TPTypedSignedData)initWithData:(id)a3 key:(id)a4 signatureTypeName:(id)a5 error:(id *)a6;
- (TPTypedSignedData)initWithData:(id)a3 sig:(id)a4 pubkey:(id)a5 sigTypeName:(id)a6;
- (TPTypedSignedData)initWithData:(id)a3 sig:(id)a4 signatureTypeName:(id)a5;
- (void)setLastSigValidationPubkey:(id)a3;
- (void)setLastSigValidationResult:(BOOL)a3;
@end

@implementation TPTypedSignedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigValidationQueue, 0);
  objc_storeStrong((id *)&self->_lastSigValidationPubkey, 0);
  objc_storeStrong((id *)&self->_sigTypeName, 0);
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (OS_dispatch_queue)sigValidationQueue
{
  return self->_sigValidationQueue;
}

- (void)setLastSigValidationResult:(BOOL)a3
{
  self->_lastSigValidationResult = a3;
}

- (BOOL)lastSigValidationResult
{
  return self->_lastSigValidationResult;
}

- (void)setLastSigValidationPubkey:(id)a3
{
}

- (TPPublicKey)lastSigValidationPubkey
{
  return self->_lastSigValidationPubkey;
}

- (NSString)sigTypeName
{
  return self->_sigTypeName;
}

- (NSData)sig
{
  return self->_sig;
}

- (NSData)data
{
  return self->_data;
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v5 = [(TPTypedSignedData *)self sigValidationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__TPTypedSignedData_checkSignatureWithKey___block_invoke;
  block[3] = &unk_2640EC900;
  block[4] = self;
  id v6 = v4;
  id v17 = v6;
  v18 = &v24;
  v19 = &v20;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v25 + 24))
  {
    char v7 = *((unsigned char *)v21 + 24) != 0;
  }
  else
  {
    v8 = [(TPTypedSignedData *)self sig];
    v9 = [(TPTypedSignedData *)self data];
    v10 = [(TPTypedSignedData *)self sigTypeName];
    char v7 = checkTypesafeSignature(v6, v8, v9, v10);

    v11 = [(TPTypedSignedData *)self sigValidationQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__TPTypedSignedData_checkSignatureWithKey___block_invoke_2;
    v13[3] = &unk_2640EC928;
    v13[4] = self;
    id v14 = v6;
    char v15 = v7;
    dispatch_sync(v11, v13);
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v7;
}

void __43__TPTypedSignedData_checkSignatureWithKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lastSigValidationPubkey];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) lastSigValidationResult];
  }
}

uint64_t __43__TPTypedSignedData_checkSignatureWithKey___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setLastSigValidationPubkey:*(void *)(a1 + 40)];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  int v3 = *(void **)(a1 + 32);
  return [v3 setLastSigValidationResult:v2];
}

- (TPTypedSignedData)initWithData:(id)a3 sig:(id)a4 signatureTypeName:(id)a5
{
  return [(TPTypedSignedData *)self initWithData:a3 sig:a4 pubkey:0 sigTypeName:a5];
}

- (TPTypedSignedData)initWithData:(id)a3 key:(id)a4 signatureTypeName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = typesafeSignature(v11, v10, v12, a6);
  if (v13)
  {
    id v14 = [v11 publicKey];
    self = [(TPTypedSignedData *)self initWithData:v10 sig:v13 pubkey:v14 sigTypeName:v12];

    char v15 = self;
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (TPTypedSignedData)initWithData:(id)a3 sig:(id)a4 pubkey:(id)a5 sigTypeName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TPTypedSignedData;
  char v15 = [(TPTypedSignedData *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_data, a3);
    objc_storeStrong((id *)&v16->_sig, a4);
    objc_storeStrong((id *)&v16->_sigTypeName, a6);
    objc_storeStrong((id *)&v16->_lastSigValidationPubkey, a5);
    v16->_lastSigValidationResult = v13 != 0;
    id v17 = (void *)MEMORY[0x210554CF0]();
    id v18 = [NSString stringWithFormat:@"com.apple.security.TPTypedSignedData_%@", v14];
    v19 = (const char *)[v18 UTF8String];
    uint64_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create(v19, v20);
    sigValidationQueue = v16->_sigValidationQueue;
    v16->_sigValidationQueue = (OS_dispatch_queue *)v21;
  }

  return v16;
}

@end