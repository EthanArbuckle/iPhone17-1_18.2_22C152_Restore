@interface NGMKeyValidator
+ (BOOL)isValidKeyValidator:(id)a3 receiversIdentity:(id)a4 sendersIdentity:(id)a5 error:(id *)a6;
+ (_NSRange)rangeOnPublicKey;
+ (id)keyValidatorWithReceiversIdentity:(id)a3 sendersIdentity:(id)a4;
+ (id)versionByte;
+ (unint64_t)validatorLength;
@end

@implementation NGMKeyValidator

+ (unint64_t)validatorLength
{
  [a1 rangeOnPublicKey];
  uint64_t v4 = 3 * v3;
  v5 = [a1 versionByte];
  unint64_t v6 = [v5 length] + v4;

  return v6;
}

+ (_NSRange)rangeOnPublicKey
{
  NSUInteger v2 = 0;
  NSUInteger v3 = 2;
  result.length = v3;
  result.location = v2;
  return result;
}

+ (id)versionByte
{
  char v4 = +[NGMProtocolVersion supportedVersion];
  NSUInteger v2 = [MEMORY[0x263EFF8F8] dataWithBytes:&v4 length:1];
  return v2;
}

+ (BOOL)isValidKeyValidator:(id)a3 receiversIdentity:(id)a4 sendersIdentity:(id)a5 error:(id *)a6
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v55 = a5;
  uint64_t v11 = [a1 rangeOnPublicKey];
  uint64_t v13 = v12;
  uint64_t v14 = [v9 length];
  uint64_t v15 = [a1 validatorLength];
  if (v14 == v15)
  {
    v16 = objc_msgSend(v9, "subdataWithRange:", 0, 2);
    v53 = objc_msgSend(v9, "subdataWithRange:", 2, 2);
    v52 = objc_msgSend(v9, "subdataWithRange:", 4, 2);
    objc_msgSend(v9, "subdataWithRange:", 6, 1);
    id v51 = objc_claimAutoreleasedReturnValue();
    if (!+[NGMProtocolVersion isVersionSupported:](NGMProtocolVersion, "isVersionSupported:", *(unsigned __int8 *)[v51 bytes]))
    {
      MPLogAndAssignError(900, a6, @"Discarding this payload because of bad NGM version.");
LABEL_44:

      goto LABEL_45;
    }
    v17 = [v55 signingKey];
    v18 = [v17 dataRepresentation];
    v50 = objc_msgSend(v18, "subdataWithRange:", v11, v13);

    int v48 = [v16 isEqualToData:v50];
    v19 = [v10 deviceSigningKey];
    v20 = [v19 publicKey];
    v21 = [v20 dataRepresentation];
    v49 = objc_msgSend(v21, "subdataWithRange:", v11, v13);

    int v47 = [v53 isEqualToData:v49];
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    char v68 = 0;
    v22 = [v10 devicePrekeys];
    LODWORD(v19) = [v22 count] == 0;

    if (v19)
    {
      v36 = MessageProtectionLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        if (v48)
        {
          v40 = &stru_26C705600;
        }
        else
        {
          v40 = [NSString stringWithFormat:@"❌ The sender signing key's was incorrect. Found bytes: %@, expected %@ . \n", v50, v16];
        }
        if (v47)
        {
          v43 = &stru_26C705600;
        }
        else
        {
          v43 = [NSString stringWithFormat:@"❌ The receiver's signing key was incorrect. Found bytes: %@, expected %@. \n", v49, v53];
        }
        *(_DWORD *)buf = 138412802;
        v70 = v40;
        __int16 v71 = 2112;
        v72 = v43;
        __int16 v73 = 2112;
        v74 = @"No prekeys were found on the device";
        _os_log_error_impl(&dword_2163F2000, v36, OS_LOG_TYPE_ERROR, "While checking the key validator, we found the following issues: \n %@%@%@", buf, 0x20u);
        if ((v47 & 1) == 0) {

        }
        if ((v48 & 1) == 0) {
      }
        }

      MPLogAndAssignError(807, a6, @"Sender and receiver's keys are incorrect.");
      goto LABEL_43;
    }
    v23 = [MEMORY[0x263EFF980] array];
    v24 = [v10 devicePrekeys];
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke;
    v59[3] = &unk_26427F568;
    uint64_t v63 = v11;
    uint64_t v64 = v13;
    id v25 = v23;
    id v60 = v25;
    id v26 = v52;
    id v61 = v26;
    v62 = &v65;
    [v24 enumerateObjectsUsingBlock:v59];

    v27 = [MEMORY[0x263F089D8] string];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke_21;
    v56[3] = &unk_26427F590;
    id v28 = v27;
    id v57 = v28;
    id v29 = v25;
    id v58 = v29;
    [v29 enumerateObjectsUsingBlock:v56];
    if ((v48 & v47) == 1 && *((unsigned char *)v66 + 24))
    {
      if (!a6 || !*a6) {
        goto LABEL_42;
      }
      uint64_t v30 = [*a6 code];
      v31 = [*a6 description];
      MPLogAndAssignError(v30 + 10000, a6, v31);
      goto LABEL_38;
    }
    v32 = MessageProtectionLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v46 = v28;
      if (v48)
      {
        v45 = &stru_26C705600;
      }
      else
      {
        v45 = [NSString stringWithFormat:@"❌ The sender signing key's was incorrect. Found bytes: %@, expected %@ . \n", v50, v16];
      }
      if (v47)
      {
        v44 = &stru_26C705600;
      }
      else
      {
        v44 = [NSString stringWithFormat:@"❌ The receiver's signing key was incorrect. Found bytes: %@, expected %@. \n", v49, v53];
      }
      int v41 = *((unsigned __int8 *)v66 + 24);
      if (*((unsigned char *)v66 + 24))
      {
        v42 = &stru_26C705600;
      }
      else
      {
        v42 = [NSString stringWithFormat:@"❌ No prekey was found that matches the one in the validator (%@). Was it already deleted? Prekeys on device are: %@. \n", v26, v46];
      }
      *(_DWORD *)buf = 138412802;
      v70 = v45;
      __int16 v71 = 2112;
      v72 = v44;
      __int16 v73 = 2112;
      v74 = v42;
      _os_log_error_impl(&dword_2163F2000, v32, OS_LOG_TYPE_ERROR, "While checking the key validator, we found the following issues: \n %@%@%@", buf, 0x20u);
      if (!v41) {

      }
      id v28 = v46;
      if ((v47 & 1) == 0) {

      }
      if ((v48 & 1) == 0) {
    }
      }

    if (((v48 | v47) & 1) != 0 || *((unsigned char *)v66 + 24))
    {
      if (v47)
      {
        char v33 = v48;
        if (*((unsigned char *)v66 + 24)) {
          char v33 = 1;
        }
        if (v33)
        {
          if (*((unsigned char *)v66 + 24))
          {
            if (v48) {
              uint64_t v34 = 806;
            }
            else {
              uint64_t v34 = 801;
            }
            if (v48) {
              v35 = @"Unhandled key validator case.";
            }
            else {
              v35 = @"The sender key is incorrect.";
            }
          }
          else
          {
            v35 = @"The receiver's encryption key is incorrect.";
            uint64_t v34 = 804;
          }
          goto LABEL_41;
        }
        v38 = @"encryption key";
      }
      else
      {
        char v37 = v48;
        if (*((unsigned char *)v66 + 24))
        {
          uint64_t v34 = 803;
        }
        else
        {
          char v37 = 1;
          uint64_t v34 = 802;
        }
        if (*((unsigned char *)v66 + 24)) {
          v35 = @"The receiver's signing key is incorrect.";
        }
        else {
          v35 = @"Receiver's keys are incorrect.";
        }
        if (v37) {
          goto LABEL_41;
        }
        v38 = @"signing key";
      }
      v31 = [NSString stringWithFormat:@"The receiver's %@ and sender's identity keys are incorrect.", v38];
      MPLogAndAssignError(805, a6, v31);
LABEL_38:

LABEL_42:
LABEL_43:
      _Block_object_dispose(&v65, 8);

      goto LABEL_44;
    }
    v35 = @"Sender and receiver's keys are incorrect.";
    uint64_t v34 = 800;
LABEL_41:
    MPLogAndAssignError(v34, a6, v35);
    goto LABEL_42;
  }
  v16 = MessageProtectionLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    +[NGMKeyValidator isValidKeyValidator:receiversIdentity:sendersIdentity:error:](v16);
  }
LABEL_45:

  return v14 == v15;
}

void __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v6 = [a2 dhKey];
  v7 = [v6 publicKey];
  v8 = [v7 dataRepresentation];
  id v9 = objc_msgSend(v8, "subdataWithRange:", *(void *)(a1 + 56), *(void *)(a1 + 64));

  if (v9)
  {
    [*(id *)(a1 + 32) addObject:v9];
    if ([*(id *)(a1 + 40) isEqualToData:v9])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    id v10 = MessageProtectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke_cold_1(v10);
    }
  }
}

void __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke_21(uint64_t a1, void *a2, uint64_t a3)
{
  char v4 = NSString;
  v5 = *(void **)(a1 + 32);
  unint64_t v6 = *(void **)(a1 + 40);
  id v7 = a2;
  if ([v6 count] - 1 == a3) {
    v8 = &stru_26C705600;
  }
  else {
    v8 = @",";
  }
  id v9 = [v4 stringWithFormat:@"%@%@", v7, v8];

  [v5 appendString:v9];
}

+ (id)keyValidatorWithReceiversIdentity:(id)a3 sendersIdentity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 rangeOnPublicKey];
  uint64_t v10 = v9;
  uint64_t v11 = [a1 validatorLength];
  uint64_t v12 = [MEMORY[0x263EFF990] dataWithCapacity:v11];
  uint64_t v13 = [v6 deviceSigningKey];

  uint64_t v14 = [v13 publicKey];
  uint64_t v15 = [v14 dataRepresentation];
  v16 = objc_msgSend(v15, "subdataWithRange:", v8, v10);

  v17 = [v7 signingKey];
  v18 = [v17 dataRepresentation];
  v19 = objc_msgSend(v18, "subdataWithRange:", v8, v10);

  v20 = [v7 echnidaRegistration];

  v21 = [v20 dhKey];
  v22 = [v21 dataRepresentation];
  v23 = objc_msgSend(v22, "subdataWithRange:", v8, v10);

  [v12 appendData:v16];
  [v12 appendData:v19];
  [v12 appendData:v23];
  v24 = [a1 versionByte];
  [v12 appendData:v24];

  if ([v12 length] == v11) {
    id v25 = v12;
  }
  else {
    id v25 = 0;
  }

  return v25;
}

+ (void)isValidKeyValidator:(os_log_t)log receiversIdentity:sendersIdentity:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2163F2000, log, OS_LOG_TYPE_ERROR, "No key validator was found.", v1, 2u);
}

void __79__NGMKeyValidator_isValidKeyValidator_receiversIdentity_sendersIdentity_error___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2163F2000, log, OS_LOG_TYPE_ERROR, "Failed to get public key of a prekey while checking the key validator.", v1, 2u);
}

@end