@interface ICCipherV1Neo
+ (id)decryptData:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6;
+ (id)encryptData:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6;
+ (id)keyForPassphrase:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 error:(id *)a6;
+ (id)unwrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5;
+ (id)wrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5;
@end

@implementation ICCipherV1Neo

+ (id)keyForPassphrase:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 error:(id *)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v9 length])
  {
    if ([v10 length] == 32)
    {
      if (a5 - 0x100000000 > 0xFFFFFFFF00000000)
      {
        v18 = [v9 precomposedStringWithCanonicalMapping];
        v19 = [v18 dataUsingEncoding:4];

        v20 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
        id v12 = v19;
        password = (char *)[v12 bytes];
        size_t v21 = [v12 length];
        id v22 = v10;
        v23 = (const uint8_t *)[v22 bytes];
        size_t v24 = [v22 length];
        id v25 = v20;
        uint64_t v26 = CCKeyDerivationPBKDF(2u, password, v21, v23, v24, 3u, a5, (uint8_t *)[v25 mutableBytes], objc_msgSend(v25, "length"));
        if (v26)
        {
          if (a6)
          {
            v27 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v32 = *MEMORY[0x1E4F28568];
            v28 = objc_msgSend(NSString, "stringWithFormat:", @"CCKeyDerivationPBKDF() key derivation failed with status %d", v26);
            v33 = v28;
            v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
            *a6 = [v27 errorWithDomain:@"com.apple.notes.cipher" code:13 userInfo:v29];
          }
          id v15 = 0;
        }
        else
        {
          id v15 = v25;
        }

        goto LABEL_18;
      }
      if (a6)
      {
        v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        objc_msgSend(NSString, "stringWithFormat:", @"Iteration count is %lu", a5);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v35 = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        *a6 = [v11 errorWithDomain:@"com.apple.notes.cipher" code:19 userInfo:v13];

LABEL_10:
        id v15 = 0;
        goto LABEL_18;
      }
    }
    else if (a6)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      id v12 = [NSString stringWithFormat:@"Salt length is %lu, but should be %lu", objc_msgSend(v10, "length"), 32];
      id v37 = v12;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      *a6 = [v16 errorWithDomain:@"com.apple.notes.cipher" code:12 userInfo:v17];

      goto LABEL_10;
    }
LABEL_11:
    id v15 = 0;
    goto LABEL_19;
  }
  if (!a6) {
    goto LABEL_11;
  }
  v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  v39[0] = @"Passphrase is nil or zero length";
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  [v14 errorWithDomain:@"com.apple.notes.cipher" code:18 userInfo:v12];
  id v15 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_19:
  return v15;
}

+ (id)wrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5
{
  return +[ICCipherV2 wrapKey:a3 withWrapper:a4 error:a5];
}

+ (id)unwrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5
{
  return +[ICCipherV2 unwrapKey:a3 withWrapper:a4 error:a5];
}

+ (id)encryptData:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  return +[ICCipherV2 encryptData:a3 withKey:a4 additionalAuthenticatedData:a5 error:a6];
}

+ (id)decryptData:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  return +[ICCipherV2 decryptData:a3 withKey:a4 additionalAuthenticatedData:a5 error:a6];
}

@end