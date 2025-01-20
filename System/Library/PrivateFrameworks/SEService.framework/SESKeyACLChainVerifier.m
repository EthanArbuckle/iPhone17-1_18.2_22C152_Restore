@interface SESKeyACLChainVerifier
+ (id)findDesignatedKey:(void *)a3 error:;
+ (id)performChainAuthIfNeededForACL:(id)a3 operation:(id)a4 auth:(id)a5 seHandle:(id)a6 seid:(id)a7 error:(id *)a8;
- (NSData)resolvedAuthorization;
- (void)dealloc;
@end

@implementation SESKeyACLChainVerifier

+ (id)performChainAuthIfNeededForACL:(id)a3 operation:(id)a4 auth:(id)a5 seHandle:(id)a6 seid:(id)a7 error:(id *)a8
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v56 = a6;
  id v16 = a7;
  v17 = [MEMORY[0x263F048C8] recordFromData:v13];
  v18 = [v17 propertyList];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [v18 objectForKeyedSubscript:v14];
    v20 = [v19 objectForKeyedSubscript:@"ckref"];

    if (!v20)
    {
      v23 = SESDefaultLogObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v40 = [v13 base64];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v14;
        __int16 v61 = 2112;
        v62 = v40;
        _os_log_impl(&dword_2146ED000, v23, OS_LOG_TYPE_DEBUG, "Constraints for operation %@ doesn't require ckref in ACL %@", buf, 0x16u);
      }
      v36 = 0;
      goto LABEL_41;
    }
    id v59 = 0;
    uint64_t v21 = +[SESKeyACLChainVerifier findDesignatedKey:error:]((uint64_t)SESKeyACLChainVerifier, v20, &v59);
    v22 = v59;
    v23 = v22;
    v55 = (void *)v21;
    if (!v21 || v22)
    {
      v41 = SESDefaultLogObject();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        [v13 base64];
        v43 = id v42 = v15;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v43;
        _os_log_impl(&dword_2146ED000, v41, OS_LOG_TYPE_ERROR, "ACL was %@", buf, 0xCu);

        id v15 = v42;
      }

      if (a8)
      {
        SESEnsureError();
        v36 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = 0;
      }
      goto LABEL_40;
    }
    uint64_t v24 = objc_opt_new();
    v54 = (void *)v24;
    if (!v24)
    {
      if (a8)
      {
        SESDefaultLogObject();
        v45 = id v44 = v15;
        SESCreateAndLogError();
        *a8 = (id)objc_claimAutoreleasedReturnValue();

        id v15 = v44;
      }
      v23 = 0;
      v36 = 0;
      goto LABEL_39;
    }
    v25 = (void *)v24;
    *(void *)buf = 0;
    v26 = (void *)SecAccessControlCreate();
    v23 = *(NSObject **)buf;
    if (!v26 || *(void *)buf)
    {
      if (!a8)
      {
        v36 = 0;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
      id v53 = v26;
      v30 = SESDefaultLogObject();
      SESCreateAndLogError();
      v36 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v52 = v15;
      v27 = v26;
      SecAccessControlSetConstraints();
      id v58 = 0;
      id v53 = v27;
      id v28 = (id)[v25 evaluateAccessControl:v27 aksOperation:v14 options:0 error:&v58];
      v23 = v58;
      v29 = [v23 userInfo];
      v30 = [v29 objectForKeyedSubscript:*MEMORY[0x263F10448]];

      v51 = v30;
      if ([v23 code] == -1026)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          id v57 = 0;
          id v15 = v52;
          uint64_t v31 = +[PTClassicMicro sign:v30 designatedKey:v55 extAuth:v52 seHandle:v56 seid:v16 error:&v57];
          v32 = v57;
          v33 = (void *)v31;
          v23 = v32;
          if (!v33 || v32)
          {
            if (!a8)
            {
              v36 = 0;
              goto LABEL_36;
            }
            v50 = v33;
            v38 = SESDefaultLogObject();
            SESCreateAndLogError();
            v36 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v50 = v33;
            objc_msgSend(v25, "setCredential:type:");
            uint64_t v34 = objc_opt_new();
            v35 = v25;
            v36 = (void *)v34;
            id v37 = v35;
            v38 = (void *)v36[1];
            v36[1] = v37;
          }

          v33 = v50;
          v30 = v51;
LABEL_36:

          goto LABEL_37;
        }
      }
      id v15 = v52;
      if (a8)
      {
        uint64_t v46 = SESDefaultLogObject();
        SESCreateAndLogError();
        id v47 = (id)objc_claimAutoreleasedReturnValue();
        v33 = (void *)v46;
        v36 = 0;
        *a8 = v47;
        goto LABEL_36;
      }
      v36 = 0;
    }
LABEL_37:

    v26 = v53;
    goto LABEL_38;
  }
  if (a8)
  {
    v39 = SESDefaultLogObject();
    v49 = [v13 asHexString];
    SESCreateAndLogError();
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v36 = 0;
LABEL_42:

  return v36;
}

+ (id)findDesignatedKey:(void *)a3 error:
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a2;
  self;
  v5 = objc_msgSend(v4, "ses_sha256");
  v6 = objc_msgSend(v5, "subdataWithRange:", 0, 16);

  uint64_t v33 = 0;
  v7 = SESKeyGetDesignatedKeys();
  id v8 = 0;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a3) {
      *a3 = v8;
    }
  }
  else
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __50__SESKeyACLChainVerifier_findDesignatedKey_error___block_invoke;
    v31[3] = &unk_264219720;
    id v11 = v6;
    id v32 = v11;
    v10 = [v7 find:v31];
    if (!v10)
    {
      v22 = v11;
      v23 = v7;
      uint64_t v24 = a3;
      v25 = v6;
      id v26 = v4;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            v18 = SESDefaultLogObject();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v35 = v17;
              _os_log_impl(&dword_2146ED000, v18, OS_LOG_TYPE_ERROR, "   eligible key %@", buf, 0xCu);
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
        }
        while (v14);
      }

      v6 = v25;
      id v4 = v26;
      v7 = v23;
      if (v24)
      {
        v19 = SESDefaultLogObject();
        uint64_t v21 = [v22 asHexString];
        SESCreateAndLogError();
        *uint64_t v24 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v10;
}

uint64_t __50__SESKeyACLChainVerifier_findDesignatedKey_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 keyIdentifier];
  uint64_t v4 = [v3 isEqualToData:*(void *)(a1 + 32)];

  return v4;
}

- (NSData)resolvedAuthorization
{
  return (NSData *)[(LAContext *)self->_laContext externalizedContext];
}

- (void)dealloc
{
  [(LAContext *)self->_laContext invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SESKeyACLChainVerifier;
  [(SESKeyACLChainVerifier *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end