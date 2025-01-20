@interface SFRSA_OAEPEncryptionOperation
- (SFMaskGenerationFunction)maskGenerationFunction;
- (SFRSA_OAEPEncryptionOperation)initWithCoder:(id)a3;
- (SFRSA_OAEPEncryptionOperation)initWithKeySpecifier:(id)a3;
- (SFRSA_OAEPEncryptionOperation)initWithKeySpecifier:(id)a3 maskGenerationFunction:(id)a4;
- (void)setMaskGenerationFunction:(id)a3;
@end

@implementation SFRSA_OAEPEncryptionOperation

- (SFRSA_OAEPEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v4 = a3;
  v5 = _defaultMaskGenerationFunction();
  v6 = [(SFRSA_OAEPEncryptionOperation *)self initWithKeySpecifier:v4 maskGenerationFunction:v5];

  return v6;
}

- (SFRSA_OAEPEncryptionOperation)initWithKeySpecifier:(id)a3 maskGenerationFunction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 893, @"Invalid parameter not satisfying: %@", @"keySpecifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 894, @"Invalid parameter not satisfying: %@", @"maskGenerationFunction" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)SFRSA_OAEPEncryptionOperation;
  v10 = [(SFRSAEncryptionOperation *)&v15 initWithKeySpecifier:v7];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)v10->_oaepEncryptionOperationInternal + 1, a4);
  }

  return v11;
}

- (SFRSA_OAEPEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFRSA_OAEPEncryptionOperation;
  return [(SFRSAEncryptionOperation *)&v4 initWithCoder:a3];
}

- (SFMaskGenerationFunction)maskGenerationFunction
{
  v2 = (void *)[*((id *)self->_oaepEncryptionOperationInternal + 1) copyWithZone:0];
  return (SFMaskGenerationFunction *)v2;
}

- (void)setMaskGenerationFunction:(id)a3
{
  *((void *)self->_oaepEncryptionOperationInternal + 1) = [a3 copyWithZone:0];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end