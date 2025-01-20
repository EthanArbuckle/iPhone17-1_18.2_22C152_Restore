@interface TRIClientBMLTCatalogArtifact
+ (BOOL)_hasStructurallyValidBMLTs:(id)a3 population:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)allReferencedCKRecordKeys;
+ (id)artifactFromCKRecord:(id)a3 error:(id *)a4;
+ (id)artifactWithBmltCatalog:(id)a3 population:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToArtifact:(id)a3;
- (NSNumber)population;
- (TRIClientBMLTCatalogArtifact)initWithBmltCatalog:(id)a3 population:(id)a4;
- (TRIClientBMLTCatalogArtifact)initWithCoder:(id)a3;
- (TRIClientBmltCatalog)bmltCatalog;
- (id)copyWithReplacementBmltCatalog:(id)a3;
- (id)copyWithReplacementPopulation:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIClientBMLTCatalogArtifact

- (TRIClientBMLTCatalogArtifact)initWithBmltCatalog:(id)a3 population:(id)a4
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
    [v14 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2386, @"Invalid parameter not satisfying: %@", @"bmltCatalog != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2387, @"Invalid parameter not satisfying: %@", @"population != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIClientBMLTCatalogArtifact;
  v11 = [(TRIClientBMLTCatalogArtifact *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bmltCatalog, a3);
    objc_storeStrong((id *)&v12->_population, a4);
  }

  return v12;
}

+ (id)artifactWithBmltCatalog:(id)a3 population:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithBmltCatalog:v7 population:v6];

  return v8;
}

- (id)copyWithReplacementBmltCatalog:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltCatalog:v4 population:self->_population];

  return v5;
}

- (id)copyWithReplacementPopulation:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBmltCatalog:self->_bmltCatalog population:v4];

  return v5;
}

- (BOOL)isEqualToArtifact:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_bmltCatalog != 0;
  id v7 = [v4 bmltCatalog];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  bmltCatalog = self->_bmltCatalog;
  if (bmltCatalog)
  {
    v10 = [v5 bmltCatalog];
    int v11 = [(TRIClientBmltCatalog *)bmltCatalog isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_population != 0;
  v13 = [v5 population];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    population = self->_population;
    if (population)
    {
      objc_super v16 = [v5 population];
      char v17 = [(NSNumber *)population isEqual:v16];
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
  id v4 = (TRIClientBMLTCatalogArtifact *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIClientBMLTCatalogArtifact *)self isEqualToArtifact:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIClientBmltCatalog *)self->_bmltCatalog hash];
  return [(NSNumber *)self->_population hash] - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIClientBMLTCatalogArtifact)initWithCoder:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bmltCatalog"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"population"];
    if (!v6)
    {
      v10 = [v4 error];

      if (!v10)
      {
        uint64_t v23 = *MEMORY[0x1E4F28568];
        v24 = @"Retrieved nil serialized value for nonnull TRIClientBMLTCatalogArtifact.population";
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTCatalogArtifactOCNTErrorDomain" code:2 userInfo:v11];
        [v4 failWithError:v12];
      }
      id v7 = 0;
      goto LABEL_13;
    }
    id v7 = (void *)v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self = [(TRIClientBMLTCatalogArtifact *)self initWithBmltCatalog:v5 population:v7];
      int v8 = self;
LABEL_14:

      goto LABEL_15;
    }
    v13 = (objc_class *)objc_opt_class();
    int v14 = NSStringFromClass(v13);
    v15 = (objc_class *)objc_opt_class();
    objc_super v16 = NSStringFromClass(v15);
    char v17 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIClientBMLTCatalogArtifact key \"population\" (expected %@, decoded %@)", v14, v16, 0];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22 = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTCatalogArtifactOCNTErrorDomain" code:3 userInfo:v18];
    [v4 failWithError:v19];

LABEL_12:
LABEL_13:
    int v8 = 0;
    goto LABEL_14;
  }
  id v9 = [v4 error];

  if (!v9)
  {
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"Retrieved nil serialized value for nonnull TRIClientBMLTCatalogArtifact.bmltCatalog";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    int v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIClientBMLTCatalogArtifactOCNTErrorDomain" code:2 userInfo:v7];
    [v4 failWithError:v14];
    goto LABEL_12;
  }
  int v8 = 0;
LABEL_15:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  bmltCatalog = self->_bmltCatalog;
  id v7 = v4;
  if (bmltCatalog)
  {
    [v4 encodeObject:bmltCatalog forKey:@"bmltCatalog"];
    id v4 = v7;
  }
  population = self->_population;
  if (population)
  {
    [v7 encodeObject:population forKey:@"population"];
    id v4 = v7;
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIClientBMLTCatalogArtifact | bmltCatalog:%@ population:%@>", self->_bmltCatalog, self->_population];
  return v2;
}

- (TRIClientBmltCatalog)bmltCatalog
{
  return self->_bmltCatalog;
}

- (NSNumber)population
{
  return self->_population;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_population, 0);
  objc_storeStrong((id *)&self->_bmltCatalog, 0);
}

+ (id)allReferencedCKRecordKeys
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB0318];
  v6[0] = *MEMORY[0x1E4FB0328];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB0330];
  v6[2] = *MEMORY[0x1E4FB0320];
  v6[3] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  return v4;
}

+ (id)artifactFromCKRecord:(id)a3 error:(id *)a4
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 values];
  int v8 = v7;
  if (!v7)
  {
    v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v51 = [v6 recordID];
      *(_DWORD *)buf = 138412290;
      v72 = v51;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Could not create BMLT catalog artifact from CloudKit record %@.", buf, 0xCu);
    }
    if (!a4)
    {
      char v17 = 0;
      goto LABEL_56;
    }
    v19 = NSString;
    v20 = [v6 recordID];
    id v9 = [v19 stringWithFormat:@"Could not create BMLT catalog artifact from CloudKit record %@.", v20];

    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v85 = *MEMORY[0x1E4F28568];
    v86[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1];
    v22 = (void *)[v21 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v10];
    char v17 = 0;
    int v11 = *a4;
    *a4 = v22;
    goto LABEL_53;
  }
  id v9 = [v7 triNumberValueForField:*MEMORY[0x1E4FB0328] isNestedValue:0];
  if (v9)
  {
    v10 = [v8 triDataForField:*MEMORY[0x1E4FB0318]];
    if (!v10)
    {
      v28 = TRILogCategory_Server();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v61 = [v6 recordID];
        *(_DWORD *)buf = 138412290;
        v72 = v61;
        _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog has missing or corrupt encoded catalog definition.", buf, 0xCu);
      }
      if (!a4)
      {
        v10 = 0;
        char v17 = 0;
LABEL_54:

        goto LABEL_55;
      }
      v29 = NSString;
      v30 = [v6 recordID];
      int v11 = [v29 stringWithFormat:@"CloudKit record %@ for BMLT catalog has missing or corrupt encoded catalog definition.", v30];

      id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v81 = *MEMORY[0x1E4F28568];
      v82 = v11;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      v32 = (void *)[v31 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v12];
      char v17 = 0;
      int v14 = *a4;
      *a4 = v32;
      goto LABEL_51;
    }
    int v11 = [v8 triStringValueForField:*MEMORY[0x1E4FB0320] isNestedValue:0];
    if (!v11)
    {
      v33 = TRILogCategory_Server();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v62 = [v6 recordID];
        *(_DWORD *)buf = 138412290;
        v72 = v62;
        _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog has missing or corrupt encoded catalog definition signature.", buf, 0xCu);
      }
      if (!a4)
      {
        int v11 = 0;
        char v17 = 0;
LABEL_53:

        goto LABEL_54;
      }
      v34 = NSString;
      v35 = [v6 recordID];
      int v12 = [v34 stringWithFormat:@"CloudKit record %@ for BMLT catalog has missing or corrupt encoded catalog definition signature.", v35];

      id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v79 = *MEMORY[0x1E4F28568];
      v80 = v12;
      int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      v37 = (void *)[v36 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v14];
      char v17 = 0;
      id v38 = *a4;
      *a4 = v37;
      goto LABEL_50;
    }
    int v12 = [v8 triDataForField:*MEMORY[0x1E4FB0330]];
    if (v12)
    {
      v13 = +[TRISignatureKey keyFromData:v12];
      int v14 = v13;
      if (v13 && ([v13 validateBase64Signature:v11 data:v10] & 1) != 0)
      {
        id v68 = 0;
        v15 = [MEMORY[0x1E4FB0520] parseFromData:v10 error:&v68];
        id v67 = v68;
        if (v15)
        {
          if ([a1 _hasStructurallyValidBMLTs:v15 population:v9])
          {
            objc_super v16 = TRILogCategory_Server();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEBUG, "Decoded valid and device-compatible BMLT catalog notification. This means we are ack’ing the CK notification, not acting on it.", buf, 2u);
            }

            char v17 = [[TRIClientBMLTCatalogArtifact alloc] initWithBmltCatalog:v15 population:v9];
            goto LABEL_49;
          }
        }
        else
        {
          v53 = TRILogCategory_Server();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v65 = [v6 recordID];
            *(_DWORD *)buf = 138412546;
            v72 = v65;
            __int16 v73 = 2114;
            id v74 = v67;
            _os_log_error_impl(&dword_1DA291000, v53, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog has unparseable BMLT catalog definition: %{public}@", buf, 0x16u);
          }
          if (a4)
          {
            v54 = NSString;
            v55 = [v6 recordID];
            v66 = [v54 stringWithFormat:@"CloudKit record %@ for BMLT catalog has unparseable BMLT catalog definition: %@", v55, v67];

            id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v69 = *MEMORY[0x1E4F28568];
            v70 = v66;
            v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
            v58 = (void *)[v56 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v57];
            id v59 = *a4;
            *a4 = v58;
          }
          v15 = 0;
        }
      }
      else
      {
        v39 = TRILogCategory_Server();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v63 = [v6 recordID];
          *(_DWORD *)buf = 138412290;
          v72 = v63;
          _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog does not have a valid signature.", buf, 0xCu);
        }
        if (!a4)
        {
          char v17 = 0;
LABEL_51:

          goto LABEL_52;
        }
        v40 = NSString;
        v41 = [v6 recordID];
        uint64_t v42 = [v40 stringWithFormat:@"CloudKit record %@ for BMLT catalog does not have a valid signature.", v41];

        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v75 = *MEMORY[0x1E4F28568];
        uint64_t v76 = v42;
        id v67 = (id)v42;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        v44 = (void *)[v43 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v15];
        id v45 = *a4;
        *a4 = v44;
      }
      char v17 = 0;
LABEL_49:

      id v38 = v67;
LABEL_50:

      goto LABEL_51;
    }
    v46 = TRILogCategory_Server();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v64 = [v6 recordID];
      *(_DWORD *)buf = 138412290;
      v72 = v64;
      _os_log_error_impl(&dword_1DA291000, v46, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog has missing or corrupt public certificate.", buf, 0xCu);
    }
    if (a4)
    {
      v47 = NSString;
      v48 = [v6 recordID];
      int v14 = [v47 stringWithFormat:@"CloudKit record %@ for BMLT catalog has missing or corrupt public certificate.", v48];

      id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v77 = *MEMORY[0x1E4F28568];
      v78 = v14;
      id v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      v50 = objc_msgSend(v49, "initWithDomain:code:userInfo:", @"TRIGeneralErrorDomain", 1);
      char v17 = 0;
      v15 = *a4;
      *a4 = v50;
      goto LABEL_49;
    }
    int v12 = 0;
    char v17 = 0;
LABEL_52:

    goto LABEL_53;
  }
  uint64_t v23 = TRILogCategory_Server();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v52 = [v6 recordID];
    *(_DWORD *)buf = 138412290;
    v72 = v52;
    _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog has missing or corrupt population value.", buf, 0xCu);
  }
  if (a4)
  {
    v24 = NSString;
    uint64_t v25 = [v6 recordID];
    v10 = [v24 stringWithFormat:@"CloudKit record %@ for BMLT catalog has missing or corrupt population value.", v25];

    id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v83 = *MEMORY[0x1E4F28568];
    v84 = v10;
    int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
    v27 = (void *)[v26 initWithDomain:@"TRIGeneralErrorDomain" code:1 userInfo:v11];
    char v17 = 0;
    int v12 = *a4;
    *a4 = v27;
    goto LABEL_52;
  }
  id v9 = 0;
  char v17 = 0;
LABEL_55:

LABEL_56:
  return v17;
}

+ (BOOL)_hasStructurallyValidBMLTs:(id)a3 population:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 bmltDeploymentIdArray];
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__TRIClientBMLTCatalogArtifact_CloudKit___hasStructurallyValidBMLTs_population___block_invoke;
  v10[3] = &unk_1E6BBDBB0;
  v10[4] = &v11;
  [v7 enumerateObjectsUsingBlock:v10];
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __80__TRIClientBMLTCatalogArtifact_CloudKit___hasStructurallyValidBMLTs_population___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 taskId];
  char v8 = [v7 triIsPathSafePlausibleUniqueId];

  if ((v8 & 1) == 0)
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [v6 taskId];
      int v11 = 138543618;
      int v12 = v10;
      __int16 v13 = 1024;
      int v14 = objc_msgSend(v6, "id_p");
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "BMLT catalog artifact has backgroundMLTaskId %{public}@.%d which is not a plausible uniqueId.", (uint8_t *)&v11, 0x12u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

@end