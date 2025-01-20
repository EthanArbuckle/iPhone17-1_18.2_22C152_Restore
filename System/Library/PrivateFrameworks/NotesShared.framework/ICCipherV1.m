@interface ICCipherV1
+ (id)decryptData:(id)a3 withKey:(id)a4 tag:(id)a5 initializationVector:(id)a6 error:(id *)a7;
+ (id)encryptData:(id)a3 withKey:(id)a4 tag:(id *)a5 initializationVector:(id *)a6 error:(id *)a7;
+ (id)keyForPassphrase:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 error:(id *)a6;
+ (id)unwrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5;
+ (id)wrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5;
@end

@implementation ICCipherV1

+ (id)keyForPassphrase:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 error:(id *)a6
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v9 length])
  {
    if ([v10 length] == 16)
    {
      v31 = a6;
      if (a5 - 0x100000000 <= 0xFFFFFFFF00000000)
      {
        v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          +[ICCipherV1 keyForPassphrase:salt:iterationCount:error:](v11);
        }

        LODWORD(a5) = 20000;
      }
      v12 = [v9 precomposedStringWithCanonicalMapping];
      v13 = [v12 dataUsingEncoding:4];

      v14 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
      id v15 = v13;
      v16 = (const char *)[v15 bytes];
      size_t v17 = [v15 length];
      id v18 = v10;
      v19 = (const uint8_t *)[v18 bytes];
      size_t v20 = [v18 length];
      id v21 = v14;
      uint64_t v22 = CCKeyDerivationPBKDF(2u, v16, v17, v19, v20, 3u, a5, (uint8_t *)[v21 mutableBytes], objc_msgSend(v21, "length"));
      if (v22)
      {
        if (v31)
        {
          v23 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v24 = objc_msgSend(NSString, "stringWithFormat:", @"CCKeyDerivationPBKDF() key derivation failed with status %d", v22);
          v33 = v24;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          id *v31 = [v23 errorWithDomain:@"com.apple.notes.cipher" code:13 userInfo:v25];
        }
        id v26 = 0;
      }
      else
      {
        id v26 = v21;
      }

      goto LABEL_18;
    }
    if (a6)
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      id v15 = [NSString stringWithFormat:@"Salt length is %lu, but should be %lu", objc_msgSend(v10, "length"), 16];
      id v35 = v15;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      *a6 = [v28 errorWithDomain:@"com.apple.notes.cipher" code:12 userInfo:v29];

      id v26 = 0;
      goto LABEL_18;
    }
LABEL_15:
    id v26 = 0;
    goto LABEL_19;
  }
  if (!a6) {
    goto LABEL_15;
  }
  v27 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v36 = *MEMORY[0x1E4F28568];
  v37[0] = @"Passphrase is nil or zero length";
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  [v27 errorWithDomain:@"com.apple.notes.cipher" code:18 userInfo:v15];
  id v26 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_19:
  return v26;
}

+ (id)wrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5
{
  return +[ICAESCipherUtils _ic_wrap:a3 withWrapper:a4 standardKeyLength:16 standardWrappedKeyLength:24 error:a5];
}

+ (id)unwrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5
{
  return +[ICAESCipherUtils _ic_unwrap:a3 withWrapper:a4 standardKeyLength:16 standardWrappedKeyLength:24 error:a5];
}

+ (id)encryptData:(id)a3 withKey:(id)a4 tag:(id *)a5 initializationVector:(id *)a6 error:(id *)a7
{
  return +[ICAESCipherUtils _ic_encrypt:a3 withCipherKey:a4 standardKeyLength:16 additionalAuthenticatedData:0 outputTag:a5 standardTagLength:16 outputInitializationVector:a6 standardInitializationVectorLength:16 error:a7];
}

+ (id)decryptData:(id)a3 withKey:(id)a4 tag:(id)a5 initializationVector:(id)a6 error:(id *)a7
{
  return +[ICAESCipherUtils _ic_decrypt:a3 withCipherKey:a4 standardKeyLength:16 additionalAuthenticatedData:0 inputTag:a5 standardTagLength:16 inputInitializationVector:a6 standardInitializationVectorLength:16 error:a7];
}

+ (void)keyForPassphrase:(os_log_t)log salt:iterationCount:error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 20000;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Attempting to derive key with an invalid iteration count, using default v1 iteration count %lu", (uint8_t *)&v1, 0xCu);
}

@end