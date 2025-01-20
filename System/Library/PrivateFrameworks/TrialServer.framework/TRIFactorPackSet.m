@interface TRIFactorPackSet
+ (BOOL)_signatures:(id)a3 onItems:(id)a4 areValidUsingPublicCertificate:(id)a5;
+ (id)allReferencedCKRecordKeys;
+ (id)artifactFromCKRecord:(id)a3;
+ (id)setWithIdent:(id)a3 packs:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSet:(id)a3;
- (BOOL)isStructurallyValid;
- (NSArray)packs;
- (TRIFactorPackSet)initWithIdent:(id)a3 packs:(id)a4;
- (TRIFactorPackSetId)ident;
- (id)copyWithReplacementIdent:(id)a3;
- (id)copyWithReplacementPacks:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIFactorPackSet

- (TRIFactorPackSet)initWithIdent:(id)a3 packs:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1554, @"Invalid parameter not satisfying: %@", @"ident != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1555, @"Invalid parameter not satisfying: %@", @"packs != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIFactorPackSet;
  v11 = [(TRIFactorPackSet *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ident, a3);
    objc_storeStrong((id *)&v12->_packs, a4);
  }

  return v12;
}

+ (id)setWithIdent:(id)a3 packs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithIdent:v7 packs:v6];

  return v8;
}

- (id)copyWithReplacementIdent:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdent:v4 packs:self->_packs];

  return v5;
}

- (id)copyWithReplacementPacks:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdent:self->_ident packs:v4];

  return v5;
}

- (BOOL)isEqualToSet:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_ident != 0;
  id v7 = [v4 ident];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  ident = self->_ident;
  if (ident)
  {
    v10 = [v5 ident];
    int v11 = [(TRIFactorPackSetId *)ident isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_packs != 0;
  v13 = [v5 packs];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    packs = self->_packs;
    if (packs)
    {
      objc_super v16 = [v5 packs];
      char v17 = [(NSArray *)packs isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIFactorPackSet *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIFactorPackSet *)self isEqualToSet:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIFactorPackSetId *)self->_ident hash];
  return [(NSArray *)self->_packs hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIFactorPackSet | ident:%@ packs:%@>", self->_ident, self->_packs];
  return v2;
}

- (TRIFactorPackSetId)ident
{
  return self->_ident;
}

- (NSArray)packs
{
  return self->_packs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packs, 0);
  objc_storeStrong((id *)&self->_ident, 0);
}

+ (id)allReferencedCKRecordKeys
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB0430];
  v6[0] = *MEMORY[0x1E4FB0438];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB0440];
  v6[2] = *MEMORY[0x1E4FB0428];
  v6[3] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  return v4;
}

+ (id)artifactFromCKRecord:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 values];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = [v5 triArrayValueForField:*MEMORY[0x1E4FB0430] isNestedValue:0];
    int v8 = v7;
    if (!v7
      || [v7 count]
      && ([v8 objectAtIndexedSubscript:0],
          id v9 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          (isKindOfClass & 1) == 0))
    {
      int v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v29 = [v4 recordID];
        *(_DWORD *)buf = 138412290;
        v48 = v29;
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "FactorPackSet in CloudKit record %@ has missing or corrupt factor pack definitions.", buf, 0xCu);
      }
      v27 = 0;
      goto LABEL_50;
    }
    int v11 = [v6 triArrayValueForField:*MEMORY[0x1E4FB0428] isNestedValue:0];
    int v12 = v11;
    if (!v11
      || [v11 count]
      && ([v12 objectAtIndexedSubscript:0],
          v13 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v14 = objc_opt_isKindOfClass(),
          v13,
          (v14 & 1) == 0))
    {
      v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v32 = [v4 recordID];
        *(_DWORD *)buf = 138412290;
        v48 = v32;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "FactorPackSet in CloudKit record %@ has missing or corrupt factor pack definition signatures.", buf, 0xCu);
      }
      v27 = 0;
      goto LABEL_49;
    }
    v15 = [v6 triDataForField:*MEMORY[0x1E4FB0440]];
    if (!v15)
    {
      objc_super v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v35 = [v4 recordID];
        *(_DWORD *)buf = 138412290;
        v48 = v35;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "FactorPackSet in CloudKit record %@ has missing or corrupt public certificate.", buf, 0xCu);
      }
      v27 = 0;
      goto LABEL_48;
    }
    objc_super v16 = [v6 triStringValueForField:*MEMORY[0x1E4FB0438] isNestedValue:0];
    if (!v16)
    {
      char v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v36 = [v4 recordID];
        *(_DWORD *)buf = 138412290;
        v48 = v36;
        _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "FactorPackSet in CloudKit record %@ has missing or corrupt factor pack set id.", buf, 0xCu);
      }
      v27 = 0;
      goto LABEL_47;
    }
    char v17 = TRIValidateFactorPackSetId();
    if (v17)
    {
      if ([a1 _signatures:v12 onItems:v8 areValidUsingPublicCertificate:v15])
      {
        v37 = v16;
        v38 = v17;
        os_log_t log = (os_log_t)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSObject count](v8, "count"));
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        obj = v8;
        uint64_t v18 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v43;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v43 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              v41 = 0;
              uint64_t v23 = [objc_alloc(MEMORY[0x1E4FB00A8]) initWithData:v22 error:&v41];
              if (!v23)
              {
                v33 = TRILogCategory_Server();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v48 = v38;
                  __int16 v49 = 2114;
                  v50 = v41;
                  _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Failed to parse factor pack contained in factor pack set %{public}@: %{public}@", buf, 0x16u);
                }

                v27 = 0;
                objc_super v16 = v37;
                char v17 = v38;
                goto LABEL_46;
              }
              v24 = (void *)v23;
              [log addObject:v23];
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        char v17 = v38;
        v25 = [[TRIFactorPackSet alloc] initWithIdent:v38 packs:log];
        if ([(TRIFactorPackSet *)v25 isStructurallyValid]) {
          v26 = v25;
        }
        else {
          v26 = 0;
        }
        v27 = v26;

        objc_super v16 = v37;
        goto LABEL_46;
      }
      TRILogCategory_Server();
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
LABEL_42:
        v27 = 0;
LABEL_46:

LABEL_47:
LABEL_48:

LABEL_49:
LABEL_50:

        goto LABEL_51;
      }
      v30 = [v4 recordID];
      *(_DWORD *)buf = 138412546;
      v48 = v30;
      __int16 v49 = 2114;
      v50 = v17;
      v31 = "CloudKit record %@ with factor pack set id %{public}@ does not have valid signatures.";
    }
    else
    {
      TRILogCategory_Server();
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      v30 = [v4 recordID];
      *(_DWORD *)buf = 138412546;
      v48 = v30;
      __int16 v49 = 2114;
      v50 = v16;
      v31 = "CloudKit record %@ has factor pack set id which was rejected as unsuitable: %{public}@";
    }
    _os_log_error_impl(&dword_1DA291000, log, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);

    goto LABEL_42;
  }
  int v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v28 = [v4 recordID];
    *(_DWORD *)buf = 138412290;
    v48 = v28;
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Could not create FactorPackSet artifact from CloudKit record %@.", buf, 0xCu);
  }
  v27 = 0;
LABEL_51:

  return v27;
}

+ (BOOL)_signatures:(id)a3 onItems:(id)a4 areValidUsingPublicCertificate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 count];
  if (v10 == [v8 count])
  {
    int v11 = +[TRISignatureKey keyFromData:v9];
    if (v11)
    {
      if ([v7 count])
      {
        unint64_t v12 = 0;
        do
        {
          v13 = [v7 objectAtIndexedSubscript:v12];
          char v14 = [v8 objectAtIndexedSubscript:v12];
          char v15 = [v11 validateBase64Signature:v13 data:v14];

          if ((v15 & 1) == 0) {
            break;
          }
          ++v12;
        }
        while (v12 < [v7 count]);
      }
      else
      {
        char v15 = 1;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)isStructurallyValid
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v34 = self;
  id v4 = [(TRIFactorPackSet *)self packs];
  v35 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = [(TRIFactorPackSet *)v34 packs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v52;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v52 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v51 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1E016E7F0]();
        if (([v8 hasFactorPackId] & 1) == 0)
        {
          v31 = TRILogCategory_Server();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v33 = [(TRIFactorPackSet *)v34 ident];
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v33;
            _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Factor pack set %{public}@ contains factor pack with missing id", buf, 0xCu);
          }
LABEL_34:
LABEL_35:
          BOOL v30 = 0;
          goto LABEL_36;
        }
        uint64_t v10 = [v8 factorPackId];
        int v11 = TRIValidateFactorPackId();

        if (!v11) {
          goto LABEL_34;
        }
        unint64_t v12 = [v8 selectedNamespace];
        if ([v8 hasSelectedNamespace]
          && [v12 hasName]
          && ([v12 name],
              v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v13 triIsPathSafe],
              v13,
              (v14 & 1) != 0))
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          char v60 = 0;
          char v15 = [v12 name];
          objc_super v16 = [v35 objectForKeyedSubscript:v15];

          if (!v16)
          {
            objc_super v16 = objc_opt_new();
            char v17 = [v12 name];
            [v35 setObject:v16 forKeyedSubscript:v17];
          }
          uint64_t v18 = objc_opt_new();
          uint64_t v19 = [v12 compatibilityVersionArray];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke;
          v49[3] = &unk_1E6BB8EF0;
          id v20 = v18;
          id v50 = v20;
          [v19 enumerateValuesWithBlock:v49];

          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke_2;
          v44[3] = &unk_1E6BBBB28;
          id v21 = v16;
          id v45 = v21;
          v46 = v34;
          id v22 = v12;
          id v47 = v22;
          v48 = buf;
          [v20 enumerateObjectsUsingBlock:v44];
          if (*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            int v23 = 1;
          }
          else
          {
            uint64_t v40 = 0;
            v41 = &v40;
            uint64_t v42 = 0x2020000000;
            char v43 = 0;
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke_8;
            v37[3] = &unk_1E6BB9720;
            id v26 = v22;
            id v38 = v26;
            v39 = &v40;
            [v8 enumerateFactorLevelsWithBlock:v37];
            if (*((unsigned char *)v41 + 24))
            {
              v27 = TRILogCategory_Server();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v28 = [v26 name];
                *(_DWORD *)v55 = 138543618;
                v56 = v11;
                __int16 v57 = 2114;
                v58 = v28;
                _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "FactorPack %{public}@ has selectedNamespace %{public}@ which does not match all contained factors.", v55, 0x16u);
              }
              int v23 = 1;
            }
            else
            {
              int v23 = 0;
            }

            _Block_object_dispose(&v40, 8);
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          v24 = TRILogCategory_Server();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = [v12 name];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v25;
            _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "FactorPack %{public}@ has invalid selectedNamespace.name: \"%{public}@\"", buf, 0x16u);
          }
          int v23 = 1;
        }

        if (v23) {
          goto LABEL_35;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v29 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      uint64_t v5 = v29;
      BOOL v30 = 1;
    }
    while (v29);
  }
  else
  {
    BOOL v30 = 1;
  }
LABEL_36:

  return v30;
}

void __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

void __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    uint64_t v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 40) ident];
      id v8 = [*(id *)(a1 + 48) name];
      id v9 = [*(id *)(a1 + 48) name];
      uint64_t v10 = [*(id *)(a1 + 48) compatibilityVersionArray];
      int v11 = 138544386;
      unint64_t v12 = v7;
      __int16 v13 = 2114;
      char v14 = v8;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Factor pack set %{public}@ contains multiple factor packs with NCV (%{public}@, %@). Selected namespace %{public}@ -> %{public}@", (uint8_t *)&v11, 0x34u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke_8(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  if (![v10 hasFactor]) {
    goto LABEL_6;
  }
  id v5 = [v10 factor];
  if (([v5 hasNamespaceName] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v6 = [v10 factor];
  uint64_t v7 = [v6 namespaceName];
  id v8 = [*(id *)(a1 + 32) name];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

@end