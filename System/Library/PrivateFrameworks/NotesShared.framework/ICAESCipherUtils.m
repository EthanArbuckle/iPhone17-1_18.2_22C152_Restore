@interface ICAESCipherUtils
+ (id)_ic_decrypt:(id)a3 withCipherKey:(id)a4 standardKeyLength:(unint64_t)a5 additionalAuthenticatedData:(id)a6 inputTag:(id)a7 standardTagLength:(unint64_t)a8 inputInitializationVector:(id)a9 standardInitializationVectorLength:(unint64_t)a10 error:(id *)a11;
+ (id)_ic_encrypt:(id)a3 withCipherKey:(id)a4 standardKeyLength:(unint64_t)a5 additionalAuthenticatedData:(id)a6 outputTag:(id *)a7 standardTagLength:(unint64_t)a8 outputInitializationVector:(id *)a9 standardInitializationVectorLength:(unint64_t)a10 error:(id *)a11;
+ (id)_ic_unwrap:(id)a3 withWrapper:(id)a4 standardKeyLength:(unint64_t)a5 standardWrappedKeyLength:(unint64_t)a6 error:(id *)a7;
+ (id)_ic_wrap:(id)a3 withWrapper:(id)a4 standardKeyLength:(unint64_t)a5 standardWrappedKeyLength:(unint64_t)a6 error:(id *)a7;
@end

@implementation ICAESCipherUtils

+ (id)_ic_encrypt:(id)a3 withCipherKey:(id)a4 standardKeyLength:(unint64_t)a5 additionalAuthenticatedData:(id)a6 outputTag:(id *)a7 standardTagLength:(unint64_t)a8 outputInitializationVector:(id *)a9 standardInitializationVectorLength:(unint64_t)a10 error:(id *)a11
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  if (a11)
  {
    *a11 = 0;
    if (!v16)
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      id v20 = [NSString stringWithFormat:@"plainData is nil"];
      v57[0] = v20;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
      v22 = v28;
      uint64_t v23 = 15;
      goto LABEL_12;
    }
    if ([v17 length] != a5)
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v54 = *MEMORY[0x1E4F28568];
      id v20 = [NSString stringWithFormat:@"Encrypting key length is %zu, but should be %ld.", objc_msgSend(v17, "length"), a5];
      id v55 = v20;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      v22 = v19;
      uint64_t v23 = 1;
LABEL_12:
      [v22 errorWithDomain:@"com.apple.notes.cipher" code:v23 userInfo:v21];
      v27 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      goto LABEL_26;
    }
  }
  else if (!v16 || [v17 length] != a5)
  {
    v27 = 0;
    goto LABEL_27;
  }
  id v47 = 0;
  v24 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_randomDataOfLength:error:", a10, &v47);
  id v20 = v47;
  *a9 = v24;
  if (!v20)
  {
    v45 = a7;
    v29 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v16, "length"));
    id v46 = [MEMORY[0x1E4F1CA58] dataWithLength:a8];
    if (v18)
    {
      id v30 = v18;
      [v30 bytes];
      [v30 length];
    }
    id v31 = v17;
    [v31 bytes];
    [v31 length];
    [*a9 bytes];
    [*a9 length];
    id v32 = v16;
    [v32 bytes];
    uint64_t v33 = [v32 length];
    id v21 = v29;
    uint64_t v34 = [v21 mutableBytes];
    id v26 = v46;
    uint64_t v43 = [v26 mutableBytes];
    unint64_t v44 = a8;
    uint64_t v35 = CCCryptorGCMOneshotEncrypt();
    if (v35)
    {
      if (a11)
      {
        v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v50 = *MEMORY[0x1E4F28568];
        v37 = objc_msgSend(NSString, "stringWithFormat:", @"CCCryptorGCM() encryption failed with status %d", v35, v34, v43, v44);
        v51 = v37;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        *a11 = [v36 errorWithDomain:@"com.apple.notes.cipher" code:3 userInfo:v38];
      }
    }
    else
    {
      if (objc_msgSend(v26, "length", v33, v34, v43, a8) == a8)
      {
        id v26 = v26;
        id *v45 = v26;
        v27 = (void *)[v21 copy];
        goto LABEL_24;
      }
      if (a11)
      {
        v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v48 = *MEMORY[0x1E4F28568];
        v40 = [NSString stringWithFormat:@"Tag length changed to %zu during encryption, but should remain %ld", a8, a8];
        v49 = v40;
        v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        *a11 = [v39 errorWithDomain:@"com.apple.notes.cipher" code:4 userInfo:v41];
      }
    }
    v27 = 0;
    goto LABEL_24;
  }
  if (a11)
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    v52[0] = *MEMORY[0x1E4F28568];
    id v21 = [NSString stringWithFormat:@"IV generation failed"];
    v52[1] = *MEMORY[0x1E4F28A50];
    v53[0] = v21;
    v53[1] = v20;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
    [v25 errorWithDomain:@"com.apple.notes.cipher" code:2 userInfo:v26];
    v27 = 0;
    *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  v27 = 0;
LABEL_26:

LABEL_27:
  return v27;
}

+ (id)_ic_decrypt:(id)a3 withCipherKey:(id)a4 standardKeyLength:(unint64_t)a5 additionalAuthenticatedData:(id)a6 inputTag:(id)a7 standardTagLength:(unint64_t)a8 inputInitializationVector:(id)a9 standardInitializationVectorLength:(unint64_t)a10 error:(id *)a11
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if (!a11)
  {
    if (!v16
      || [v17 length] != a5
      || [v20 length] != a10
      || [v19 length] != a8)
    {
      v27 = 0;
      goto LABEL_20;
    }
    goto LABEL_11;
  }
  *a11 = 0;
  if (!v16)
  {
    v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    id v22 = [NSString stringWithFormat:@"cipherData is nil"];
    v56[0] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    v24 = v28;
    uint64_t v25 = 16;
    goto LABEL_17;
  }
  if ([v17 length] == a5)
  {
    if ([v20 length] != a10)
    {
      id v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      id v22 = [NSString stringWithFormat:@"IV length is %zu, but should remain %ld", objc_msgSend(v19, "length"), a10];
      id v52 = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      v24 = v31;
      uint64_t v25 = 14;
      goto LABEL_17;
    }
    if ([v19 length] != a8)
    {
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      id v22 = [NSString stringWithFormat:@"Tag length is %zu, but should remain %ld", objc_msgSend(v19, "length"), a8];
      id v50 = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v24 = v21;
      uint64_t v25 = 4;
LABEL_17:
      *a11 = [v24 errorWithDomain:@"com.apple.notes.cipher" code:v25 userInfo:v23];

      goto LABEL_18;
    }
LABEL_11:
    id v46 = v18;
    if (v18)
    {
      id v26 = v18;
      [v26 bytes];
      [v26 length];
    }
    uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(v16, "length"));
    id v34 = v17;
    [v34 bytes];
    [v34 length];
    id v35 = v20;
    [v35 bytes];
    [v35 length];
    id v36 = v16;
    [v36 bytes];
    uint64_t v37 = [v36 length];
    id v22 = v33;
    uint64_t v38 = [v22 mutableBytes];
    id v39 = v19;
    uint64_t v44 = [v39 bytes];
    uint64_t v45 = [v39 length];
    uint64_t v40 = CCCryptorGCMOneshotDecrypt();
    if (v40)
    {
      if (a11)
      {
        v41 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v47 = *MEMORY[0x1E4F28568];
        v42 = objc_msgSend(NSString, "stringWithFormat:", @"CCCryptorGCM() decryption failed with status %d", v40, v38, v44, v45);
        uint64_t v48 = v42;
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        *a11 = [v41 errorWithDomain:@"com.apple.notes.cipher" code:6 userInfo:v43];
      }
      v27 = 0;
    }
    else
    {
      v27 = objc_msgSend(v22, "copy", v37, v38, v44, v45);
    }
    id v18 = v46;
    goto LABEL_19;
  }
  v29 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v53 = *MEMORY[0x1E4F28568];
  id v22 = [NSString stringWithFormat:@"Decrypting key length is %zu, but should be %ld.", objc_msgSend(v17, "length"), a5];
  id v54 = v22;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
  *a11 = [v29 errorWithDomain:@"com.apple.notes.cipher" code:5 userInfo:v30];

LABEL_18:
  v27 = 0;
LABEL_19:

LABEL_20:
  return v27;
}

+ (id)_ic_wrap:(id)a3 withWrapper:(id)a4 standardKeyLength:(unint64_t)a5 standardWrappedKeyLength:(unint64_t)a6 error:(id *)a7
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v13 = v12;
  if (!a7)
  {
    if ([v12 length] != a5 || objc_msgSend(v11, "length") != a5)
    {
      a7 = 0;
      goto LABEL_20;
    }
    goto LABEL_7;
  }
  *a7 = 0;
  if ([v12 length] != a5)
  {
    id v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    id v15 = [NSString stringWithFormat:@"Wrapper key length is %zu when wrapping, but should be %ld.", objc_msgSend(v13, "length"), a5];
    v46[0] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    id v17 = v34;
    uint64_t v18 = 9;
    goto LABEL_11;
  }
  if ([v11 length] == a5)
  {
LABEL_7:
    id v19 = [MEMORY[0x1E4F1CA58] dataWithLength:a6];
    size_t wrappedKeyLen = [v19 length];
    id v20 = (const uint8_t *)*MEMORY[0x1E4F14040];
    size_t v21 = *MEMORY[0x1E4F14048];
    id v22 = v13;
    uint64_t v23 = (const uint8_t *)[v22 bytes];
    size_t v24 = [v22 length];
    id v37 = v11;
    id v25 = v11;
    id v26 = (const uint8_t *)[v25 bytes];
    size_t v27 = [v25 length];
    id v15 = v19;
    uint64_t v28 = CCSymmetricKeyWrap(1u, v20, v21, v23, v24, v26, v27, (uint8_t *)[v15 mutableBytes], &wrappedKeyLen);
    if (v28)
    {
      if (a7)
      {
        v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        id v30 = objc_msgSend(NSString, "stringWithFormat:", @"CCSymmetricKeyWrap() wrapping failed with status %d", v28);
        v42 = v30;
        id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v32 = v29;
        uint64_t v33 = 8;
LABEL_17:
        *a7 = [v32 errorWithDomain:@"com.apple.notes.cipher" code:v33 userInfo:v31];

        a7 = 0;
      }
    }
    else if (wrappedKeyLen == a6)
    {
      a7 = (id *)[v15 copy];
    }
    else if (a7)
    {
      id v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      id v30 = [NSString stringWithFormat:@"Wrapped key length is %zu, but should be %ld", wrappedKeyLen, a6];
      uint64_t v40 = v30;
      id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      id v32 = v35;
      uint64_t v33 = 11;
      goto LABEL_17;
    }
    id v11 = v37;
    goto LABEL_19;
  }
  v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v43 = *MEMORY[0x1E4F28568];
  id v15 = [NSString stringWithFormat:@"Raw key length is %zu when wrapping, but should be %ld.", objc_msgSend(v11, "length"), a5];
  id v44 = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  id v17 = v14;
  uint64_t v18 = 10;
LABEL_11:
  *a7 = [v17 errorWithDomain:@"com.apple.notes.cipher" code:v18 userInfo:v16];

  a7 = 0;
LABEL_19:

LABEL_20:
  return a7;
}

+ (id)_ic_unwrap:(id)a3 withWrapper:(id)a4 standardKeyLength:(unint64_t)a5 standardWrappedKeyLength:(unint64_t)a6 error:(id *)a7
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v13 = v12;
  if (!a7)
  {
    if ([v12 length] != a5 || objc_msgSend(v11, "length") != a6)
    {
      a7 = 0;
      goto LABEL_20;
    }
    goto LABEL_7;
  }
  *a7 = 0;
  if ([v12 length] != a5)
  {
    id v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v44 = *MEMORY[0x1E4F28568];
    id v15 = [NSString stringWithFormat:@"Wrapper key length is %zu when unwrapping, but should be %ld.", objc_msgSend(v13, "length"), a5];
    v45[0] = v15;
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    *a7 = [v32 errorWithDomain:@"com.apple.notes.cipher" code:9 userInfo:v33];

    goto LABEL_11;
  }
  if ([v11 length] == a6)
  {
LABEL_7:
    id v17 = [MEMORY[0x1E4F1CA58] dataWithLength:a5];
    size_t rawKeyLen = [v17 length];
    uint64_t v18 = (const uint8_t *)*MEMORY[0x1E4F14040];
    size_t v19 = *MEMORY[0x1E4F14048];
    id v20 = v13;
    size_t v21 = (const uint8_t *)[v20 bytes];
    size_t v22 = [v20 length];
    id v36 = v11;
    id v23 = v11;
    size_t v24 = (const uint8_t *)[v23 bytes];
    size_t v25 = [v23 length];
    id v15 = v17;
    uint64_t v26 = CCSymmetricKeyUnwrap(1u, v18, v19, v21, v22, v24, v25, (uint8_t *)[v15 mutableBytes], &rawKeyLen);
    if (v26)
    {
      if (a7)
      {
        size_t v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"CCSymmetricKeyUnwrap() unwrapping failed with status %d", v26);
        uint64_t v41 = v28;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        id v30 = v27;
        uint64_t v31 = 8;
LABEL_17:
        *a7 = [v30 errorWithDomain:@"com.apple.notes.cipher" code:v31 userInfo:v29];

        a7 = 0;
      }
    }
    else if (rawKeyLen == a5)
    {
      a7 = (id *)[v15 copy];
    }
    else if (a7)
    {
      id v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      uint64_t v28 = [NSString stringWithFormat:@"Unwrapped key length is %zu, but should be %ld", rawKeyLen, a5];
      uint64_t v39 = v28;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id v30 = v34;
      uint64_t v31 = 10;
      goto LABEL_17;
    }
    id v11 = v36;
    goto LABEL_19;
  }
  v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v42 = *MEMORY[0x1E4F28568];
  id v15 = [NSString stringWithFormat:@"Wrapped key length is %zu when unwrapping, but should be %ld.", objc_msgSend(v11, "length"), a6];
  id v43 = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  *a7 = [v14 errorWithDomain:@"com.apple.notes.cipher" code:11 userInfo:v16];

LABEL_11:
  a7 = 0;
LABEL_19:

LABEL_20:
  return a7;
}

@end