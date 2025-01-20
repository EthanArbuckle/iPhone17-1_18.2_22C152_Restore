@interface SFIESOperation
@end

@implementation SFIESOperation

_SFIESCiphertext *__41___SFIESOperation_encrypt_withKey_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    v6 = 0;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v8 + 40);
    v6 = (_SFIESCiphertext *)[v7 _ccDigestInfoWithError:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    if (v6)
    {
      ccaes_gcm_encrypt_mode();
      ccecies_encrypt_gcm_setup();
      [*(id *)(a1 + 40) length];
      size_t v9 = ccecies_encrypt_gcm_ciphertext_size();
      v10 = malloc_type_malloc(v9, 0xF235518AuLL);
      v11 = malloc_type_malloc(0, 0xFD778C36uLL);
      size_t v12 = ccecies_pub_key_size();
      v13 = malloc_type_malloc(v12, 0xA97080A9uLL);
      [*(id *)(a1 + 40) bytes];
      if (ccecies_encrypt_gcm_composite())
      {
        free(v10);
        free(v11);
        free(v13);
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"SFCryptoServicesErrorDomain", 2, 0, 0, 0, 0);
        v6 = 0;
        uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
        v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;
      }
      else
      {
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", v10, v9, 0, 0, 0);
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v11 length:0];
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v13 length:v12];
        free(v10);
        free(v11);
        free(v13);
        v19 = [_SFIESCiphertext alloc];
        v20 = [_SFECPublicKey alloc];
        v21 = [*(id *)(a1 + 48) keySpecifier];
        v22 = [(_SFPublicKey *)v20 initWithData:v18 specifier:v21 error:0];
        v6 = [(_SFIESCiphertext *)v19 initWithCiphertext:v16 ephemeralSenderPublicKey:v22 authenticationCode:v17];
      }
    }
  }

  return v6;
}

id __41___SFIESOperation_decrypt_withKey_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v8 + 40);
    uint64_t v9 = [v7 _ccDigestInfoWithError:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    if (v9)
    {
      v10 = [*(id *)(a1 + 40) ciphertext];
      v11 = [*(id *)(a1 + 40) authenticationCode];
      size_t v12 = [*(id *)(a1 + 40) ephemeralSenderPublicKey];
      v13 = [v12 keyData];

      size_t v14 = [v10 length];
      ccaes_gcm_decrypt_mode();
      [v11 length];
      ccecies_decrypt_gcm_setup();
      uint64_t v15 = ccecies_decrypt_gcm_plaintext_size();
      v16 = malloc_type_malloc(v14, 0x230DB9D6uLL);
      id v17 = v10;
      uint64_t v18 = [v17 bytes];
      id v19 = v13;
      uint64_t v20 = [v19 bytes];
      id v21 = v11;
      uint64_t v26 = [v21 bytes];
      if (ccecies_decrypt_gcm_composite())
      {
        free(v16);
        uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"SFCryptoServicesErrorDomain", 3, 0, v18, v20, v26);
        uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
        v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;

        v6 = 0;
      }
      else
      {
        v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v16, v15, v18, v20, v26);
        free(v16);
      }

      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:

  return v6;
}

@end