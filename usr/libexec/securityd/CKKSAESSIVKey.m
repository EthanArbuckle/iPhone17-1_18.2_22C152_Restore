@interface CKKSAESSIVKey
+ (id)randomKey:(id *)a3;
- (BOOL)doSIV:(const ccmode_siv *)a3 nonce:(id)a4 text:(id)a5 buffer:(char *)a6 bufferLength:(unint64_t)a7 authenticatedData:(id)a8 error:(id *)a9;
- (CKKSAESSIVKey)init;
- (CKKSAESSIVKey)initWithBase64:(id)a3;
- (CKKSAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4;
- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)keyMaterial;
- (id)unwrapAESKey:(id)a3 error:(id *)a4;
- (id)wrapAESKey:(id)a3 error:(id *)a4;
@end

@implementation CKKSAESSIVKey

- (id)keyMaterial
{
  id v2 = +[NSData _newZeroingDataWithBytes:self->super.key length:self->super.size];

  return v2;
}

- (BOOL)doSIV:(const ccmode_siv *)a3 nonce:(id)a4 text:(id)a5 buffer:(char *)a6 bufferLength:(unint64_t)a7 authenticatedData:(id)a8 error:(id *)a9
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  unint64_t v16 = a3->var0 + 15;
  unint64_t v17 = v16 & 0xFFFFFFFFFFFFFFF0;
  if (v16 >= 0x10)
  {
    v18 = (void *)((char *)v42 - (v16 & 0xFFFFFFFFFFFFFFF0));
    do
    {
      void *v18 = 0xAAAAAAAAAAAAAAAALL;
      v18[1] = 0xAAAAAAAAAAAAAAAALL;
      v18 += 2;
      v17 -= 16;
    }
    while (v17);
  }
  int v19 = ccsiv_init();
  v45 = v42;
  v46 = a9;
  if (v19)
  {
    uint64_t v38 = v19;
    NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
    CFStringRef v59 = @"could not ccsiv_init";
    v39 = &v59;
    v40 = &v58;
LABEL_25:
    v35 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v40 count:1];
    v32 = +[NSError errorWithDomain:@"corecrypto" code:v38 userInfo:v35];
    id v23 = 0;
    goto LABEL_18;
  }
  if (v13)
  {
    [v13 length];
    [v13 bytes];
    int v20 = ccsiv_set_nonce();
    if (v20)
    {
      uint64_t v38 = v20;
      NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
      CFStringRef v57 = @"could not ccsiv_set_nonce";
      v39 = &v57;
      v40 = &v56;
      goto LABEL_25;
    }
  }
  v42[1] = a6;
  id v43 = v14;
  id v44 = v13;
  v21 = [v15 allKeys];
  v22 = [v21 sortedArrayUsingSelector:"compare:"];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v23 = v22;
  id v24 = [v23 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v48;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v48 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [v15 objectForKey:*(void *)(*((void *)&v47 + 1) + 8 * i)];
        [v28 length];
        id v29 = v28;
        [v29 bytes];
        int v30 = ccsiv_aad();
        if (v30)
        {
          uint64_t v33 = v30;
          NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
          CFStringRef v54 = @"could not ccsiv_aad";
          v34 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          v32 = +[NSError errorWithDomain:@"corecrypto" code:v33 userInfo:v34];

          v35 = v23;
          id v14 = v43;
          id v13 = v44;
          goto LABEL_18;
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  id v14 = v43;
  [v43 length];
  [v14 bytes];
  int v31 = ccsiv_crypt();
  if (!v31)
  {
    v32 = 0;
    id v13 = v44;
    goto LABEL_19;
  }
  uint64_t v41 = v31;
  NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
  CFStringRef v52 = @"could not ccsiv_crypt";
  v35 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  v32 = +[NSError errorWithDomain:@"corecrypto" code:v41 userInfo:v35];
  id v13 = v44;
LABEL_18:

LABEL_19:
  cc_clear();
  v36 = v46;
  if (v46) {
    id *v36 = v32;
  }

  return v32 == 0;
}

- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ccaes_siv_decrypt_mode();
  if ((unint64_t)[v8 length] > 0x10)
  {
    id v15 = (char *)[v8 length] - 16;
    id v16 = objc_alloc((Class)NSData);
    id v17 = v8;
    id v13 = [v16 initWithBytesNoCopy:[v17 bytes] length:16 freeWhenDone:0];
    id v14 = [objc_alloc((Class)NSData) initWithBytesNoCopy:(char *)[v17 bytes] + 16 length:v15 freeWhenDone:0];
    v12 = (id *)[objc_alloc((Class)NSMutableData) initWithLength:ccsiv_plaintext_size()];
    if (-[CKKSAESSIVKey doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:](self, "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:", v10, v13, v14, [v12 mutableBytes], objc_msgSend(v12, "length"), v9, a5))
    {
      a5 = v12;
      v12 = a5;
    }
    else
    {
      a5 = 0;
    }
  }
  else
  {
    if (a5)
    {
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      CFStringRef v20 = @"ciphertext too short";
      v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      *a5 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:4 userInfo:v11];

      a5 = 0;
    }
    v12 = 0;
    id v13 = 0;
    id v14 = 0;
  }

  return a5;
}

- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ccaes_siv_encrypt_mode();
  id v11 = [objc_alloc((Class)NSMutableData) initWithLength:16];
  CCRNGStatus Bytes = CCRandomGenerateBytes([v11 mutableBytes], (size_t)[v11 length]);
  if (!Bytes)
  {
    [v8 length];
    id v15 = [objc_alloc((Class)NSMutableData) initWithLength:ccsiv_ciphertext_size()];
    if (-[CKKSAESSIVKey doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:](self, "doSIV:nonce:text:buffer:bufferLength:authenticatedData:error:", v10, v11, v8, [v15 mutableBytes], objc_msgSend(v15, "length"), v9, a5))
    {
      a5 = (id *)objc_alloc_init((Class)NSMutableData);
      [a5 appendData:v11];
      [a5 appendData:v15];
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (a5)
  {
    uint64_t v13 = Bytes;
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    CFStringRef v18 = @"IV generation failed";
    id v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    *a5 = +[NSError errorWithDomain:@"CommonCrypto" code:v13 userInfo:v14];

    id v15 = 0;
LABEL_6:
    a5 = 0;
    goto LABEL_8;
  }
  id v15 = 0;
LABEL_8:

  return a5;
}

- (id)unwrapAESKey:(id)a3 error:(id *)a4
{
  v6 = a3;
  memset(__s, 0, sizeof(__s));
  ccaes_siv_decrypt_mode();
  if (ccsiv_plaintext_size() == 64)
  {
    uint64_t v7 = ccaes_siv_decrypt_mode();
    id v8 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v6 + 1 length:v6[11] freeWhenDone:0];
    unsigned int v9 = [(CKKSAESSIVKey *)self doSIV:v7 nonce:0 text:v8 buffer:__s bufferLength:64 authenticatedData:0 error:a4];

    if (v9) {
      uint64_t v10 = [[CKKSAESSIVKey alloc] initWithBytes:__s len:64];
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = 0;
  }
  else
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"unwrapped key size does not match key size";
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v13];

    uint64_t v10 = 0;
  }
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  if (a4 && v11) {
    *a4 = v11;
  }

  return v10;
}

- (id)wrapAESKey:(id)a3 error:(id *)a4
{
  v6 = a3;
  if (v6)
  {
    memset(__s, 0, sizeof(__s));
    ccaes_siv_encrypt_mode();
    if (ccsiv_ciphertext_size() == 80)
    {
      uint64_t v7 = ccaes_siv_encrypt_mode();
      id v8 = +[NSData _newZeroingDataWithBytes:v6 + 1 length:v6[11]];
      unsigned int v9 = [(CKKSAESSIVKey *)self doSIV:v7 nonce:0 text:v8 buffer:__s bufferLength:80 authenticatedData:0 error:a4];

      if (v9)
      {
        uint64_t v10 = [[CKKSWrappedAESSIVKey alloc] initWithBytes:__s len:80];
        id v11 = 0;
LABEL_5:
        memset_s(__s, 0x50uLL, 0, 0x40uLL);
        if (a4 && v11)
        {
          id v12 = v11;
LABEL_10:
          *a4 = v12;
          goto LABEL_12;
        }
        goto LABEL_12;
      }
      id v11 = 0;
    }
    else
    {
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      CFStringRef v17 = @"wrapped key size does not match key size";
      CFStringRef v15 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v11 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v15];
    }
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  uint64_t v13 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 description:@"No key given"];
  id v11 = v13;
  if (a4)
  {
    id v12 = v13;
    id v11 = v12;
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = 0;
LABEL_12:

  return v10;
}

- (CKKSAESSIVKey)initWithBase64:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKKSAESSIVKey;
  v5 = [(CKKSBaseAESSIVKey *)&v10 initWithBase64:v4];
  v6 = v5;
  if (v5 && v5->super.size != 64)
  {
    id v8 = +[NSString stringWithFormat:@"length (%lu) was not %d", v5->super.size, 64];
    id v9 = +[NSException exceptionWithName:@"WrongKeySizeException" reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }

  return v6;
}

- (CKKSAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4
{
  if (a4 != 64)
  {
    v5 = +[NSString stringWithFormat:@"length (%lu) was not %d", a4, 64];
    id v6 = +[NSException exceptionWithName:@"WrongKeySizeException" reason:v5 userInfo:0];

    objc_exception_throw(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)CKKSAESSIVKey;
  return -[CKKSBaseAESSIVKey initWithBytes:len:](&v7, "initWithBytes:len:", a3);
}

- (CKKSAESSIVKey)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKKSAESSIVKey;
  result = [(CKKSBaseAESSIVKey *)&v3 init];
  if (result) {
    result->super.size = 64;
  }
  return result;
}

+ (id)randomKey:(id *)a3
{
  id v4 = objc_alloc_init(CKKSAESSIVKey);
  uint64_t Bytes = CCRandomGenerateBytes(v4->super.key, v4->super.size);
  if (Bytes)
  {
    if (a3)
    {
      uint64_t v6 = (int)Bytes;
      objc_super v7 = +[NSString stringWithFormat:@"CCRandomGenerateBytes failed with %d", Bytes];
      *a3 = +[NSError errorWithDomain:@"corecrypto" code:v6 description:v7];

      a3 = 0;
    }
  }
  else
  {
    a3 = v4;
  }

  return a3;
}

@end