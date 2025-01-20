@interface ICCryptoConvergenceControllerConfiguration
- (BOOL)includeAllAuthenticatedObjects;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserInitiated;
- (BOOL)shouldConvergeObject:(id)a3;
- (ICEncryptionKey)divergedV1MainKey;
- (ICEncryptionKey)divergedV1NeoMainKey;
- (ICEncryptionKey)v1MainKey;
- (ICEncryptionKey)v1NeoMainKey;
- (NSString)divergedPassphrase;
- (NSString)passphrase;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setDivergedPassphrase:(id)a3;
- (void)setDivergedV1MainKey:(id)a3;
- (void)setDivergedV1NeoMainKey:(id)a3;
- (void)setIncludeAllAuthenticatedObjects:(BOOL)a3;
- (void)setPassphrase:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)setV1MainKey:(id)a3;
- (void)setV1NeoMainKey:(id)a3;
@end

@implementation ICCryptoConvergenceControllerConfiguration

- (id)description
{
  v23 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v3);
  v4 = (void *)MEMORY[0x1E4F28ED0];
  v24 = [(ICCryptoConvergenceControllerConfiguration *)self passphrase];
  v5 = [v4 numberWithInt:v24 != 0];
  v6 = (void *)MEMORY[0x1E4F28ED0];
  v7 = [(ICCryptoConvergenceControllerConfiguration *)self v1MainKey];
  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    v22 = [(ICCryptoConvergenceControllerConfiguration *)self v1NeoMainKey];
    BOOL v8 = v22 != 0;
  }
  v9 = [v6 numberWithInt:v8];
  v10 = (void *)MEMORY[0x1E4F28ED0];
  v11 = [(ICCryptoConvergenceControllerConfiguration *)self divergedPassphrase];
  v12 = [v10 numberWithInt:v11 != 0];
  v13 = (void *)MEMORY[0x1E4F28ED0];
  v14 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1MainKey];
  if (v14)
  {
    BOOL v15 = 1;
  }
  else
  {
    v21 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1NeoMainKey];
    BOOL v15 = v21 != 0;
  }
  v16 = [v13 numberWithInt:v15];
  v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICCryptoConvergenceControllerConfiguration includeAllAuthenticatedObjects](self, "includeAllAuthenticatedObjects"));
  v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICCryptoConvergenceControllerConfiguration isUserInitiated](self, "isUserInitiated"));
  v19 = [v23 stringWithFormat:@"<%@: %p, hasPassphrase: %@, hasKeys: %@, hasDivergedKey: %@, hasDivergedKeys: %@, includeAllAuthenticatedObjects: %@, isUserInitiated: %@>", v25, self, v5, v9, v12, v16, v17, v18];

  if (!v14) {
  if (!v7)
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = ICDynamicCast();

    v6 = [(ICCryptoConvergenceControllerConfiguration *)self passphrase];
    v7 = [v5 passphrase];
    BOOL v8 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v6) {
      v9 = 0;
    }
    else {
      v9 = v6;
    }
    uint64_t v10 = v9;
    if (v8 == v7) {
      v11 = 0;
    }
    else {
      v11 = v7;
    }
    unint64_t v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        LOBYTE(v15) = 0;
        goto LABEL_87;
      }
      int v16 = [(id)v10 isEqual:v12];

      if (!v16)
      {
        LOBYTE(v15) = 0;
LABEL_88:

        return v15;
      }
    }
    uint64_t v10 = [(ICCryptoConvergenceControllerConfiguration *)self v1MainKey];
    v13 = [v5 v1MainKey];
    if (v8 == (void *)v10) {
      v17 = 0;
    }
    else {
      v17 = (void *)v10;
    }
    uint64_t v18 = v17;
    if (v8 == v13) {
      v19 = 0;
    }
    else {
      v19 = v13;
    }
    unint64_t v20 = v19;
    if (!(v18 | v20)) {
      goto LABEL_29;
    }
    v21 = (void *)v20;
    if (v18) {
      BOOL v22 = v20 == 0;
    }
    else {
      BOOL v22 = 1;
    }
    if (v22) {
      goto LABEL_71;
    }
    LODWORD(v15) = [(id)v18 isEqual:v20];

    if (v15)
    {
LABEL_29:
      uint64_t v18 = [(ICCryptoConvergenceControllerConfiguration *)self v1NeoMainKey];
      v21 = [v5 v1NeoMainKey];
      if (v8 == (void *)v18) {
        v23 = 0;
      }
      else {
        v23 = (void *)v18;
      }
      unint64_t v15 = v23;
      if (v8 == v21) {
        v24 = 0;
      }
      else {
        v24 = v21;
      }
      unint64_t v25 = v24;
      if (!(v15 | v25)) {
        goto LABEL_39;
      }
      v26 = (void *)v25;
      v27 = (void *)v15;
      LOBYTE(v15) = 0;
      if (!v27 || !v25)
      {
        v69 = v27;
        goto LABEL_85;
      }
      v28 = v27;
      v66 = v6;
      v29 = (void *)v25;
      int v68 = [v27 isEqual:v25];

      v6 = v66;
      if (v68)
      {
LABEL_39:
        v67 = v6;
        uint64_t v30 = [(ICCryptoConvergenceControllerConfiguration *)self divergedPassphrase];
        uint64_t v31 = [v5 divergedPassphrase];
        v69 = (void *)v30;
        if (v8 == (void *)v30) {
          v32 = 0;
        }
        else {
          v32 = (void *)v30;
        }
        id v33 = v32;
        v65 = (void *)v31;
        if (v8 == (void *)v31) {
          v34 = 0;
        }
        else {
          v34 = (void *)v31;
        }
        unint64_t v35 = (unint64_t)v33;
        unint64_t v36 = v34;
        if (!(v35 | v36)) {
          goto LABEL_49;
        }
        v37 = (void *)v36;
        LOBYTE(v15) = 0;
        if (!v35 || !v36)
        {
          v55 = (void *)v35;
          v6 = v67;
LABEL_84:

          v26 = v65;
          goto LABEL_85;
        }
        v38 = (void *)v36;
        int v63 = [(id)v35 isEqual:v36];

        if (v63)
        {
LABEL_49:
          uint64_t v39 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1MainKey];
          uint64_t v40 = [v5 divergedV1MainKey];
          v62 = (void *)v39;
          if (v8 == (void *)v39) {
            v41 = 0;
          }
          else {
            v41 = (void *)v39;
          }
          unint64_t v42 = v41;
          v64 = (void *)v40;
          if (v8 == (void *)v40) {
            v43 = 0;
          }
          else {
            v43 = (void *)v40;
          }
          unint64_t v44 = v43;
          if (v42 | v44)
          {
            v45 = (void *)v44;
            LOBYTE(v15) = 0;
            if (!v42 || !v44)
            {
              v61 = (void *)v42;
              v55 = v62;
              v6 = v67;
LABEL_82:

              goto LABEL_83;
            }
            v46 = (void *)v44;
            int v60 = [(id)v42 isEqual:v44];

            if (!v60)
            {
              v55 = v62;
              LOBYTE(v15) = 0;
              v6 = v67;
LABEL_83:
              v37 = v64;
              goto LABEL_84;
            }
          }
          uint64_t v47 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1NeoMainKey];
          uint64_t v48 = [v5 divergedV1NeoMainKey];
          v61 = (void *)v47;
          if (v8 == (void *)v47) {
            v49 = 0;
          }
          else {
            v49 = (void *)v47;
          }
          unint64_t v50 = v49;
          v59 = (void *)v48;
          if (v8 == (void *)v48) {
            v51 = 0;
          }
          else {
            v51 = (void *)v48;
          }
          unint64_t v52 = v51;
          if (v50 | v52)
          {
            v53 = (void *)v52;
            if (!v50 || !v52)
            {
              v55 = v62;

              goto LABEL_80;
            }
            int v54 = [(id)v50 isEqual:v52];

            if (!v54)
            {
              v55 = v62;
              goto LABEL_80;
            }
          }
          v55 = v62;
          int v56 = [(ICCryptoConvergenceControllerConfiguration *)self includeAllAuthenticatedObjects];
          if (v56 == [v5 includeAllAuthenticatedObjects])
          {
            BOOL v57 = [(ICCryptoConvergenceControllerConfiguration *)self isUserInitiated];
            LODWORD(v15) = v57 ^ [v5 isUserInitiated] ^ 1;
LABEL_81:
            v6 = v67;
            v45 = v59;
            goto LABEL_82;
          }
LABEL_80:
          LOBYTE(v15) = 0;
          goto LABEL_81;
        }
        LOBYTE(v15) = 0;
        v26 = v65;
        v6 = v67;
LABEL_85:

        goto LABEL_86;
      }
LABEL_71:
      LOBYTE(v15) = 0;
LABEL_86:
    }
LABEL_87:

    goto LABEL_88;
  }
  LOBYTE(v15) = 1;
  return v15;
}

- (unint64_t)hash
{
  v3 = [(ICCryptoConvergenceControllerConfiguration *)self passphrase];
  uint64_t v4 = [v3 hash];
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v4 = [v5 hash];
  }
  v6 = [(ICCryptoConvergenceControllerConfiguration *)self v1MainKey];
  uint64_t v7 = [v6 hash];
  if (!v7)
  {
    BOOL v8 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v7 = [v8 hash];
  }
  v9 = [(ICCryptoConvergenceControllerConfiguration *)self v1NeoMainKey];
  if (![v9 hash])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
    [v10 hash];
  }
  char v30 = v7;
  v29 = [(ICCryptoConvergenceControllerConfiguration *)self divergedPassphrase];
  if (![v29 hash])
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
    [v11 hash];
  }
  unint64_t v12 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1MainKey];
  if (![v12 hash])
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
    [v13 hash];
  }
  BOOL v14 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1NeoMainKey];
  if (![v14 hash])
  {
    [MEMORY[0x1E4F1CA98] null];
    v28 = v9;
    uint64_t v22 = v4;
    v23 = v6;
    unint64_t v25 = v24 = v3;
    [v25 hash];

    v3 = v24;
    v6 = v23;
    uint64_t v4 = v22;
    v9 = v28;
  }
  unint64_t v26 = ICHashWithHashKeys(v4, v15, v16, v17, v18, v19, v20, v21, v30);

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[ICCryptoConvergenceControllerConfiguration allocWithZone:a3] init];
  v5 = [(ICCryptoConvergenceControllerConfiguration *)self passphrase];
  [(ICCryptoConvergenceControllerConfiguration *)v4 setPassphrase:v5];

  v6 = [(ICCryptoConvergenceControllerConfiguration *)self v1MainKey];
  [(ICCryptoConvergenceControllerConfiguration *)v4 setV1MainKey:v6];

  uint64_t v7 = [(ICCryptoConvergenceControllerConfiguration *)self v1NeoMainKey];
  [(ICCryptoConvergenceControllerConfiguration *)v4 setV1NeoMainKey:v7];

  BOOL v8 = [(ICCryptoConvergenceControllerConfiguration *)self divergedPassphrase];
  [(ICCryptoConvergenceControllerConfiguration *)v4 setDivergedPassphrase:v8];

  v9 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1MainKey];
  [(ICCryptoConvergenceControllerConfiguration *)v4 setDivergedV1MainKey:v9];

  uint64_t v10 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1NeoMainKey];
  [(ICCryptoConvergenceControllerConfiguration *)v4 setDivergedV1NeoMainKey:v10];

  [(ICCryptoConvergenceControllerConfiguration *)v4 setIncludeAllAuthenticatedObjects:[(ICCryptoConvergenceControllerConfiguration *)self includeAllAuthenticatedObjects]];
  [(ICCryptoConvergenceControllerConfiguration *)v4 setUserInitiated:[(ICCryptoConvergenceControllerConfiguration *)self isUserInitiated]];
  return v4;
}

- (BOOL)shouldConvergeObject:(id)a3
{
  id v4 = a3;
  if (!-[ICCryptoConvergenceControllerConfiguration includeAllAuthenticatedObjects](self, "includeAllAuthenticatedObjects")|| ([v4 isAuthenticated] & 1) == 0)
  {
    v5 = [(ICCryptoConvergenceControllerConfiguration *)self passphrase];
    if ([v5 length])
    {
      v6 = [(ICCryptoConvergenceControllerConfiguration *)self passphrase];
      int v7 = [v4 isPassphraseCorrect:v6];

      if (v7)
      {
        if (([v4 isAuthenticated] & 1) == 0)
        {
          BOOL v8 = [v4 cryptoStrategy];
          uint64_t v9 = [(ICCryptoConvergenceControllerConfiguration *)self passphrase];
LABEL_28:
          unint64_t v35 = (void *)v9;
          char v36 = [v8 authenticateWithPassphrase:v9];
          goto LABEL_29;
        }
        goto LABEL_17;
      }
    }
    else
    {
    }
    uint64_t v10 = [(ICCryptoConvergenceControllerConfiguration *)self v1MainKey];
    if (!v10) {
      goto LABEL_11;
    }
    v11 = (void *)v10;
    unint64_t v12 = [v4 cryptoStrategy];
    v13 = [(ICCryptoConvergenceControllerConfiguration *)self v1MainKey];
    int v14 = [v12 mainKeyDecryptsPrimaryData:v13];

    if (v14)
    {
      BOOL v8 = +[ICAuthenticationState sharedState];
      uint64_t v15 = [(ICCryptoConvergenceControllerConfiguration *)self v1MainKey];
    }
    else
    {
LABEL_11:
      uint64_t v16 = [(ICCryptoConvergenceControllerConfiguration *)self v1NeoMainKey];
      if (!v16) {
        goto LABEL_14;
      }
      uint64_t v17 = (void *)v16;
      uint64_t v18 = [v4 cryptoStrategy];
      uint64_t v19 = [(ICCryptoConvergenceControllerConfiguration *)self v1NeoMainKey];
      int v20 = [v18 mainKeyDecryptsPrimaryData:v19];

      if (v20)
      {
        BOOL v8 = +[ICAuthenticationState sharedState];
        uint64_t v15 = [(ICCryptoConvergenceControllerConfiguration *)self v1NeoMainKey];
      }
      else
      {
LABEL_14:
        uint64_t v21 = [(ICCryptoConvergenceControllerConfiguration *)self divergedPassphrase];
        if ([v21 length])
        {
          uint64_t v22 = [(ICCryptoConvergenceControllerConfiguration *)self divergedPassphrase];
          int v23 = [v4 isPassphraseCorrect:v22];

          if (v23)
          {
            if (([v4 isAuthenticated] & 1) == 0)
            {
              BOOL v8 = [v4 cryptoStrategy];
              uint64_t v9 = [(ICCryptoConvergenceControllerConfiguration *)self divergedPassphrase];
              goto LABEL_28;
            }
            goto LABEL_17;
          }
        }
        else
        {
        }
        uint64_t v25 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1MainKey];
        if (!v25) {
          goto LABEL_22;
        }
        unint64_t v26 = (void *)v25;
        v27 = [v4 cryptoStrategy];
        v28 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1MainKey];
        int v29 = [v27 mainKeyDecryptsPrimaryData:v28];

        if (v29)
        {
          BOOL v8 = +[ICAuthenticationState sharedState];
          uint64_t v15 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1MainKey];
        }
        else
        {
LABEL_22:
          uint64_t v30 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1NeoMainKey];
          if (!v30) {
            goto LABEL_26;
          }
          uint64_t v31 = (void *)v30;
          v32 = [v4 cryptoStrategy];
          id v33 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1NeoMainKey];
          int v34 = [v32 mainKeyDecryptsPrimaryData:v33];

          if (!v34)
          {
LABEL_26:
            BOOL v24 = 0;
            goto LABEL_30;
          }
          BOOL v8 = +[ICAuthenticationState sharedState];
          uint64_t v15 = [(ICCryptoConvergenceControllerConfiguration *)self divergedV1NeoMainKey];
        }
      }
    }
    unint64_t v35 = (void *)v15;
    char v36 = [v8 setCachedMainKey:v15 forObject:v4];
LABEL_29:
    BOOL v24 = v36;

    goto LABEL_30;
  }
LABEL_17:
  BOOL v24 = 1;
LABEL_30:

  return v24;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
}

- (ICEncryptionKey)v1MainKey
{
  return self->_v1MainKey;
}

- (void)setV1MainKey:(id)a3
{
}

- (ICEncryptionKey)v1NeoMainKey
{
  return self->_v1NeoMainKey;
}

- (void)setV1NeoMainKey:(id)a3
{
}

- (NSString)divergedPassphrase
{
  return self->_divergedPassphrase;
}

- (void)setDivergedPassphrase:(id)a3
{
}

- (ICEncryptionKey)divergedV1MainKey
{
  return self->_divergedV1MainKey;
}

- (void)setDivergedV1MainKey:(id)a3
{
}

- (ICEncryptionKey)divergedV1NeoMainKey
{
  return self->_divergedV1NeoMainKey;
}

- (void)setDivergedV1NeoMainKey:(id)a3
{
}

- (BOOL)includeAllAuthenticatedObjects
{
  return self->_includeAllAuthenticatedObjects;
}

- (void)setIncludeAllAuthenticatedObjects:(BOOL)a3
{
  self->_includeAllAuthenticatedObjects = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divergedV1NeoMainKey, 0);
  objc_storeStrong((id *)&self->_divergedV1MainKey, 0);
  objc_storeStrong((id *)&self->_divergedPassphrase, 0);
  objc_storeStrong((id *)&self->_v1NeoMainKey, 0);
  objc_storeStrong((id *)&self->_v1MainKey, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
}

@end