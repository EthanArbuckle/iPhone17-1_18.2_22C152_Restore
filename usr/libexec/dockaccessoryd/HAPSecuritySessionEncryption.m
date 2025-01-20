@interface HAPSecuritySessionEncryption
- (BOOL)enhancedEncryption;
- (HAPSecuritySessionEncryption)init;
- (HAPSecuritySessionEncryption)initWithInputKey:(id)a3 outputKey:(id)a4 enhancedEncryption:(BOOL)a5;
- (NSData)inputKey;
- (NSData)outputKey;
- (NSMutableData)inputNonce;
- (NSMutableData)outputNonce;
- (id)decrypt:(const void *)a3 length:(unint64_t)a4 additionalAuthData:(const void *)a5 additionalAuthDataLength:(unint64_t)a6 authTagData:(const void *)a7 authTagDataLength:(unint64_t)a8 counterData:(const void *)a9 counterDataLength:(unint64_t)a10 error:(id *)a11;
- (id)decrypt:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 additionalAuthenticatedData:(id)a4;
- (void)setEnhancedEncryption:(BOOL)a3;
- (void)setInputKey:(id)a3;
- (void)setInputNonce:(id)a3;
- (void)setOutputKey:(id)a3;
- (void)setOutputNonce:(id)a3;
@end

@implementation HAPSecuritySessionEncryption

- (HAPSecuritySessionEncryption)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPSecuritySessionEncryption;
  return [(HAPSecuritySessionEncryption *)&v3 init];
}

- (HAPSecuritySessionEncryption)initWithInputKey:(id)a3 outputKey:(id)a4 enhancedEncryption:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HAPSecuritySessionEncryption;
  v11 = [(HAPSecuritySessionEncryption *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_enhancedEncryption = a5;
    objc_storeStrong((id *)&v11->_inputKey, a3);
    objc_storeStrong((id *)&v12->_outputKey, a4);
    memset_s(__s, 8uLL, 0, 8uLL);
    uint64_t v13 = +[NSMutableData dataWithBytes:__s length:8];
    inputNonce = v12->_inputNonce;
    v12->_inputNonce = (NSMutableData *)v13;

    uint64_t v15 = +[NSMutableData dataWithBytes:__s length:8];
    outputNonce = v12->_outputNonce;
    v12->_outputNonce = (NSMutableData *)v15;
  }
  return v12;
}

- (id)encrypt:(id)a3 additionalAuthenticatedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableData) initWithLength:[v6 length]];
  id v9 = [(HAPSecuritySessionEncryption *)self outputKey];
  [v9 bytes];
  id v10 = [(HAPSecuritySessionEncryption *)self outputNonce];
  [v10 bytes];
  id v11 = v7;
  [v11 bytes];
  [v11 length];
  id v12 = v6;
  [v12 bytes];
  [v12 length];
  id v13 = v8;
  [v13 mutableBytes];
  chacha20_poly1305_encrypt_all_64x64();

  [v13 appendBytes:v22 length:16];
  if (self->_enhancedEncryption) {
    [v13 appendData:self->_outputNonce];
  }
  id v14 = [(HAPSecuritySessionEncryption *)self outputNonce];
  uint64_t v15 = [v14 mutableBytes];
  v16 = [(HAPSecuritySessionEncryption *)self outputNonce];
  v17 = (char *)[v16 length];
  if (v17)
  {
    objc_super v18 = v17 - 1;
    do
    {
      if (++*v15++) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v18 == 0;
      }
      --v18;
    }
    while (!v20);
  }

  return v13;
}

- (id)decrypt:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  if (self->_enhancedEncryption) {
    uint64_t v10 = -8;
  }
  else {
    uint64_t v10 = 0;
  }
  [v8 subdataWithRange:((char *)[v8 length] + v10 - 16) + 16];
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v8 subdataWithRange:0, (char *)[v8 length] + v10 - 16];
  if (self->_enhancedEncryption)
  {
    [v8 subdataWithRange:NSMakeRange([v8 length] - 8, 8)];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v41 = 0;
    unint64_t v42 = 0;
    [v12 getBytes:&v42 length:8];
    [(NSMutableData *)self->_inputNonce getBytes:&v41 length:8];
    if (v42 < v41)
    {
      id v13 = self;
      id v14 = sub_100083F74();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = sub_100083FD0(v13);
        *(_DWORD *)buf = 138543618;
        v44 = v15;
        __int16 v45 = 2048;
        unint64_t v46 = v42;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@Ignoring out of sequence packet: %llu", buf, 0x16u);
      }
      v16 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6764 userInfo:0];
      v17 = v16;
      if (a5) {
        *a5 = v16;
      }
LABEL_12:

      objc_super v18 = 0;
      goto LABEL_30;
    }
    if (v42 > v41)
    {
      v19 = self;
      BOOL v20 = sub_100083F74();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = sub_100083FD0(v19);
        *(_DWORD *)buf = 138543874;
        v44 = v21;
        __int16 v45 = 2048;
        unint64_t v46 = v41;
        __int16 v47 = 2048;
        unint64_t v48 = v42;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@Detected potential packet drop while decrypting message: %llu != %llu", buf, 0x20u);
      }
      [(NSMutableData *)self->_inputNonce setData:v12];
    }
  }
  v37 = a5;
  id v39 = v8;
  id v22 = [objc_alloc((Class)NSMutableData) initWithLength:[v11 length]];
  id v23 = [(HAPSecuritySessionEncryption *)self inputKey];
  [v23 bytes];
  id v24 = [(HAPSecuritySessionEncryption *)self inputNonce];
  [v24 bytes];
  id v25 = v9;
  [v25 bytes];
  [v25 length];
  id v26 = v11;
  [v26 bytes];
  [v26 length];
  id v38 = v22;
  [v38 mutableBytes];
  [v40 bytes];
  int v27 = chacha20_poly1305_decrypt_all_64x64();

  id v28 = [(HAPSecuritySessionEncryption *)self inputNonce];
  v29 = [v28 mutableBytes];
  v30 = [(HAPSecuritySessionEncryption *)self inputNonce];
  v31 = (char *)[v30 length];
  if (v31)
  {
    v32 = v31 - 1;
    do
    {
      if (++*v29++) {
        BOOL v34 = 1;
      }
      else {
        BOOL v34 = v32 == 0;
      }
      --v32;
    }
    while (!v34);
  }

  if (v27)
  {
    v35 = +[NSError errorWithDomain:@"HAPErrorDomain" code:v27 userInfo:0];
    v17 = v35;
    id v8 = v39;
    id v12 = v38;
    if (v37) {
      id *v37 = v35;
    }
    goto LABEL_12;
  }
  id v12 = v38;
  objc_super v18 = v12;
  id v8 = v39;
LABEL_30:

  return v18;
}

- (id)decrypt:(const void *)a3 length:(unint64_t)a4 additionalAuthData:(const void *)a5 additionalAuthDataLength:(unint64_t)a6 authTagData:(const void *)a7 authTagDataLength:(unint64_t)a8 counterData:(const void *)a9 counterDataLength:(unint64_t)a10 error:(id *)a11
{
  if (a11)
  {
    *a11 = 0;
    if (a8 != 16 || a10 != 8)
    {
      +[NSError hmfErrorWithCode:userInfo:](NSError, "hmfErrorWithCode:userInfo:", 3, 0, a5);
      id v13 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
LABEL_7:
    unint64_t v36 = 0;
    unint64_t v14 = *(void *)a9;
    -[NSMutableData getBytes:length:](self->_inputNonce, "getBytes:length:", &v36, 8, a5);
    if (v14 >= v36)
    {
      objc_super v18 = &_sSayxGSEsSERzlMc_ptr;
      if (v14 > v36)
      {
        v19 = self;
        BOOL v20 = sub_100083F74();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = sub_100083FD0(v19);
          *(_DWORD *)buf = 138543874;
          id v38 = v21;
          __int16 v39 = 2048;
          unint64_t v40 = v36;
          __int16 v41 = 2048;
          unint64_t v42 = v14;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@Detected potential packet drop while decrypting message: %llu != %llu", buf, 0x20u);

          objc_super v18 = &_sSayxGSEsSERzlMc_ptr;
        }

        id v22 = [v18[149] dataWithBytes:a9 length:8];
        inputNonce = self->_inputNonce;
        self->_inputNonce = v22;
      }
      id v24 = [objc_alloc((Class)v18[149]) initWithLength:a4];
      id v25 = [(HAPSecuritySessionEncryption *)self inputKey];
      [v25 bytes];
      id v26 = [(HAPSecuritySessionEncryption *)self inputNonce];
      [v26 bytes];
      id v16 = v24;
      [v16 mutableBytes];
      uint64_t v27 = chacha20_poly1305_decrypt_all_64x64();

      id v28 = [(HAPSecuritySessionEncryption *)self inputNonce];
      v29 = [v28 mutableBytes];
      v30 = [(HAPSecuritySessionEncryption *)self inputNonce];
      v31 = (char *)[v30 length];
      if (v31)
      {
        v32 = v31 - 1;
        do
        {
          if (++*v29++) {
            BOOL v34 = 1;
          }
          else {
            BOOL v34 = v32 == 0;
          }
          --v32;
        }
        while (!v34);
      }

      if (!v27)
      {
        id v16 = v16;
        id v13 = v16;
        goto LABEL_27;
      }
      if (a11)
      {
        sub_100044EEC(v27);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v15 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6754 userInfo:0];
      id v16 = v15;
      if (a11)
      {
        id v17 = v15;
        id v16 = v17;
LABEL_24:
        id v13 = 0;
        *a11 = v17;
LABEL_27:

        goto LABEL_28;
      }
    }
    id v13 = 0;
    goto LABEL_27;
  }
  id v13 = 0;
  if (a8 == 16 && a10 == 8) {
    goto LABEL_7;
  }
LABEL_28:

  return v13;
}

- (NSData)inputKey
{
  return self->_inputKey;
}

- (void)setInputKey:(id)a3
{
}

- (NSMutableData)inputNonce
{
  return self->_inputNonce;
}

- (void)setInputNonce:(id)a3
{
}

- (NSData)outputKey
{
  return self->_outputKey;
}

- (void)setOutputKey:(id)a3
{
}

- (NSMutableData)outputNonce
{
  return self->_outputNonce;
}

- (void)setOutputNonce:(id)a3
{
}

- (BOOL)enhancedEncryption
{
  return self->_enhancedEncryption;
}

- (void)setEnhancedEncryption:(BOOL)a3
{
  self->_enhancedEncryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNonce, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong((id *)&self->_inputNonce, 0);

  objc_storeStrong((id *)&self->_inputKey, 0);
}

@end