@interface POJWTEncryption
+ (BOOL)decodeAndDecryptJWT:(id)a3 encryptionAlgorithm:(id)a4 privateKey:(__SecKey *)a5 otherInfo:(id)a6 psk:(id)a7 psk_id:(id)a8 authPublicKey:(__SecKey *)a9 error:(id *)a10;
+ (id)algorithmWithAlg:(id)a3 enc:(id)a4;
+ (id)algorithmWithEncryptionAlgorithm:(id)a3;
+ (id)encodeAndEncryptJWT:(id)a3 encryptionAlgorithm:(id)a4 publicKey:(__SecKey *)a5 otherInfo:(id)a6 psk:(id)a7 psk_id:(id)a8 authPrivateKey:(__SecKey *)a9 auth_kid:(id)a10 error:(id *)a11;
- (POJWTEncryption)init;
@end

@implementation POJWTEncryption

+ (id)algorithmWithAlg:(id)a3 enc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"ECDH-ES"]
    && ([v6 isEqualToString:@"A256GCM"] & 1) != 0)
  {
    v7 = off_265463270;
LABEL_13:
    id v8 = objc_alloc_init(*v7);
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"dir"]
    && ([v5 isEqualToString:@"HPKE-P256-SHA256-A256GCM"] & 1) != 0)
  {
    v7 = off_265463588;
    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"dir"]
    && ([v5 isEqualToString:@"HPKE-P384-SHA384-A256GCM"] & 1) != 0)
  {
    v7 = off_265463590;
    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"dir"]
    && [v5 isEqualToString:@"HPKE-X25519-SHA256-ChaCha20Poly1305"])
  {
    v7 = &off_265463598;
    goto LABEL_13;
  }
  id v8 = 0;
LABEL_15:

  return v8;
}

+ (id)algorithmWithEncryptionAlgorithm:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToNumber:0x2707DBB50])
  {
    v4 = off_265463270;
LABEL_11:
    id v5 = objc_alloc_init(*v4);
    goto LABEL_12;
  }
  if ([v3 isEqualToNumber:0x2707DBB68])
  {
    v4 = off_265463588;
    goto LABEL_11;
  }
  if ([v3 isEqualToNumber:0x2707DBB80])
  {
    v4 = off_265463590;
    goto LABEL_11;
  }
  if ([v3 isEqualToNumber:0x2707DBB98])
  {
    v4 = &off_265463598;
    goto LABEL_11;
  }
  if ([v3 isEqualToNumber:0x2707DBBB0])
  {
    v4 = off_265463580;
    goto LABEL_11;
  }
  id v5 = 0;
LABEL_12:

  return v5;
}

- (POJWTEncryption)init
{
  v3.receiver = self;
  v3.super_class = (Class)POJWTEncryption;
  return [(POJWTEncryption *)&v3 init];
}

+ (id)encodeAndEncryptJWT:(id)a3 encryptionAlgorithm:(id)a4 publicKey:(__SecKey *)a5 otherInfo:(id)a6 psk:(id)a7 psk_id:(id)a8 authPrivateKey:(__SecKey *)a9 auth_kid:(id)a10 error:(id *)a11
{
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  v22 = [a1 algorithmWithEncryptionAlgorithm:a4];
  v23 = v22;
  if (v22)
  {
    v24 = objc_msgSend(v22, "encodeAndEncryptJWT:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:error:", v17, a5, v18, v19, v20, a9, v21, a11);
  }
  else
  {
    __120__POJWTEncryption_encodeAndEncryptJWT_encryptionAlgorithm_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke();
    v24 = 0;
    *a11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

id __120__POJWTEncryption_encodeAndEncryptJWT_encryptionAlgorithm_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Algorithm not found when encrypting JWT."];
  v1 = PO_LOG_POJWTEncryption();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

+ (BOOL)decodeAndDecryptJWT:(id)a3 encryptionAlgorithm:(id)a4 privateKey:(__SecKey *)a5 otherInfo:(id)a6 psk:(id)a7 psk_id:(id)a8 authPublicKey:(__SecKey *)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [a1 algorithmWithEncryptionAlgorithm:a4];
  id v21 = v20;
  if (v20)
  {
    char v22 = objc_msgSend(v20, "decodeAndDecryptJWT:privateKey:otherInfo:psk:psk_id:authPublicKey:error:", v16, a5, v17, v18, v19, a9, a10);
  }
  else
  {
    __111__POJWTEncryption_decodeAndDecryptJWT_encryptionAlgorithm_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke();
    char v22 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

id __111__POJWTEncryption_decodeAndDecryptJWT_encryptionAlgorithm_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Algorithm not found when decrypting JWT."];
  v1 = PO_LOG_POJWTEncryption();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

@end