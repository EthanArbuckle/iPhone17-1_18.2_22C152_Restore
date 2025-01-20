@interface TRIClientTreatmentArtifact
+ (id)artifactWithEncodedTreatmentDefinition:(id)a3 encodedTreatmentDefinitionSignature:(id)a4 publicCertificate:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToArtifact:(id)a3;
- (BOOL)isValidWithTreatmentId:(id)a3;
- (NSData)encodedTreatmentDefinition;
- (NSData)publicCertificate;
- (NSString)encodedTreatmentDefinitionSignature;
- (TRIClientTreatmentArtifact)initWithEncodedTreatmentDefinition:(id)a3 encodedTreatmentDefinitionSignature:(id)a4 publicCertificate:(id)a5;
- (id)copyWithReplacementEncodedTreatmentDefinition:(id)a3;
- (id)copyWithReplacementEncodedTreatmentDefinitionSignature:(id)a3;
- (id)copyWithReplacementPublicCertificate:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIClientTreatmentArtifact

- (TRIClientTreatmentArtifact)initWithEncodedTreatmentDefinition:(id)a3 encodedTreatmentDefinitionSignature:(id)a4 publicCertificate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1116, @"Invalid parameter not satisfying: %@", @"encodedTreatmentDefinitionSignature != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1115, @"Invalid parameter not satisfying: %@", @"encodedTreatmentDefinition != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 1117, @"Invalid parameter not satisfying: %@", @"publicCertificate != nil" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)TRIClientTreatmentArtifact;
  v13 = [(TRIClientTreatmentArtifact *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_encodedTreatmentDefinition, a3);
    objc_storeStrong((id *)&v14->_encodedTreatmentDefinitionSignature, a4);
    objc_storeStrong((id *)&v14->_publicCertificate, a5);
  }

  return v14;
}

+ (id)artifactWithEncodedTreatmentDefinition:(id)a3 encodedTreatmentDefinitionSignature:(id)a4 publicCertificate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithEncodedTreatmentDefinition:v10 encodedTreatmentDefinitionSignature:v9 publicCertificate:v8];

  return v11;
}

- (id)copyWithReplacementEncodedTreatmentDefinition:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEncodedTreatmentDefinition:v4 encodedTreatmentDefinitionSignature:self->_encodedTreatmentDefinitionSignature publicCertificate:self->_publicCertificate];

  return v5;
}

- (id)copyWithReplacementEncodedTreatmentDefinitionSignature:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEncodedTreatmentDefinition:self->_encodedTreatmentDefinition encodedTreatmentDefinitionSignature:v4 publicCertificate:self->_publicCertificate];

  return v5;
}

- (id)copyWithReplacementPublicCertificate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEncodedTreatmentDefinition:self->_encodedTreatmentDefinition encodedTreatmentDefinitionSignature:self->_encodedTreatmentDefinitionSignature publicCertificate:v4];

  return v5;
}

- (BOOL)isEqualToArtifact:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = self->_encodedTreatmentDefinition != 0;
  v7 = [v4 encodedTreatmentDefinition];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_11;
  }
  encodedTreatmentDefinition = self->_encodedTreatmentDefinition;
  if (encodedTreatmentDefinition)
  {
    id v10 = [v5 encodedTreatmentDefinition];
    int v11 = [(NSData *)encodedTreatmentDefinition isEqual:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  int v12 = self->_encodedTreatmentDefinitionSignature != 0;
  v13 = [v5 encodedTreatmentDefinitionSignature];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_11;
  }
  encodedTreatmentDefinitionSignature = self->_encodedTreatmentDefinitionSignature;
  if (encodedTreatmentDefinitionSignature)
  {
    v16 = [v5 encodedTreatmentDefinitionSignature];
    int v17 = [(NSString *)encodedTreatmentDefinitionSignature isEqual:v16];

    if (!v17) {
      goto LABEL_11;
    }
  }
  int v18 = self->_publicCertificate != 0;
  objc_super v19 = [v5 publicCertificate];
  int v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    char v23 = 0;
  }
  else
  {
    publicCertificate = self->_publicCertificate;
    if (publicCertificate)
    {
      v22 = [v5 publicCertificate];
      char v23 = [(NSData *)publicCertificate isEqual:v22];
    }
    else
    {
      char v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIClientTreatmentArtifact *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIClientTreatmentArtifact *)self isEqualToArtifact:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_encodedTreatmentDefinition hash];
  NSUInteger v4 = [(NSString *)self->_encodedTreatmentDefinitionSignature hash] - v3 + 32 * v3;
  return [(NSData *)self->_publicCertificate hash] - v4 + 32 * v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIClientTreatmentArtifact | encodedTreatmentDefinition:%@ encodedTreatmentDefinitionSignature:%@ publicCertificate:%@>", self->_encodedTreatmentDefinition, self->_encodedTreatmentDefinitionSignature, self->_publicCertificate];
  return v2;
}

- (NSData)encodedTreatmentDefinition
{
  return self->_encodedTreatmentDefinition;
}

- (NSString)encodedTreatmentDefinitionSignature
{
  return self->_encodedTreatmentDefinitionSignature;
}

- (NSData)publicCertificate
{
  return self->_publicCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicCertificate, 0);
  objc_storeStrong((id *)&self->_encodedTreatmentDefinitionSignature, 0);
  objc_storeStrong((id *)&self->_encodedTreatmentDefinition, 0);
}

- (BOOL)isValidWithTreatmentId:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (void *)MEMORY[0x1E016E7F0]();
  v7 = (void *)MEMORY[0x1E4FB0548];
  int v8 = [(TRIClientTreatmentArtifact *)self encodedTreatmentDefinition];
  id v25 = 0;
  id v9 = [v7 parseFromData:v8 error:&v25];
  id v10 = v25;

  if (v9)
  {
    if ([v9 hasTreatmentId])
    {
      int v11 = [v9 treatmentId];
      char v12 = [v5 isEqualToString:v11];

      if (v12)
      {
        v13 = [(TRIClientTreatmentArtifact *)self publicCertificate];
        if (!v13)
        {
          v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:a2, self, @"TRIClientTreatmentArtifact+Util.m", 38, @"Invalid parameter not satisfying: %@", @"pubCert" object file lineNumber description];
        }
        int v14 = +[TRISignatureKey keyFromData:v13];
        if (v14)
        {
          v15 = [(TRIClientTreatmentArtifact *)self encodedTreatmentDefinitionSignature];
          v16 = [(TRIClientTreatmentArtifact *)self encodedTreatmentDefinition];
          char v17 = [v14 validateBase64Signature:v15 data:v16];

          if (v17)
          {
            BOOL v18 = 1;
LABEL_18:

            goto LABEL_13;
          }
          char v23 = TRILogCategory_Server();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v5;
            _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "Invalid treatment record signature with id %@", buf, 0xCu);
          }
        }
        BOOL v18 = 0;
        goto LABEL_18;
      }
    }
    v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      objc_super v19 = "TRIClientTreatment has nil or mismatched treatmentId";
      int v20 = v13;
      uint32_t v21 = 2;
LABEL_20:
      _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    }
  }
  else
  {
    v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v10;
      objc_super v19 = "Unable to parse TRIClientTreatment from encoded definition: %@";
      int v20 = v13;
      uint32_t v21 = 12;
      goto LABEL_20;
    }
  }
  BOOL v18 = 0;
LABEL_13:

  return v18;
}

@end