@interface SBFCredentialSet
+ (BOOL)supportsSecureCoding;
- (SBFCredentialSet)init;
- (SBFCredentialSet)initWithCoder:(id)a3;
- (SBFCredentialSet)initWithSerializedCredentialSet:(id)a3;
- (id)serializedCredentialSet;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBFCredentialSet

- (SBFCredentialSet)init
{
  return [(SBFCredentialSet *)self initWithSerializedCredentialSet:0];
}

- (SBFCredentialSet)initWithSerializedCredentialSet:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBFCredentialSet;
  id v6 = [(SBFCredentialSet *)&v16 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  if (v5)
  {
    *((unsigned char *)v6 + 16) = 0;
    objc_storeStrong((id *)v6 + 3, a3);
    id v8 = v5;
    v9 = ACMContextCreateWithExternalForm((_OWORD *)[v8 bytes], objc_msgSend(v8, "length"));
    v7[1] = v9;
    if (!v9)
    {
      v10 = SBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SBFCredentialSet initWithSerializedCredentialSet:](v10);
      }

      v11 = 0;
      goto LABEL_12;
    }
LABEL_11:
    v11 = v7;
    goto LABEL_12;
  }
  *((unsigned char *)v6 + 16) = 1;
  int v12 = ACMContextCreate((uint64_t *)v6 + 1);
  if (!v12) {
    goto LABEL_11;
  }
  int v13 = v12;
  v14 = SBLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SBFCredentialSet initWithSerializedCredentialSet:](v13, v14);
  }

  v11 = 0;
  v7[1] = 0;
LABEL_12:

  return v11;
}

- (void)dealloc
{
  acmContext = self->_acmContext;
  if (acmContext)
  {
    ACMContextDelete(acmContext, self->_ownsContext);
    self->_acmContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFCredentialSet;
  [(SBFCredentialSet *)&v4 dealloc];
}

- (id)serializedCredentialSet
{
  cachedCredentials = self->_cachedCredentials;
  if (!cachedCredentials)
  {
    acmContext = self->_acmContext;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__SBFCredentialSet_serializedCredentialSet__block_invoke;
    v7[3] = &unk_1E548DAD0;
    v7[4] = self;
    ACMContextGetExternalForm(acmContext, (uint64_t)v7);
    cachedCredentials = self->_cachedCredentials;
  }
  id v5 = cachedCredentials;
  return v5;
}

uint64_t __43__SBFCredentialSet_serializedCredentialSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a2 length:a3];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v4;
  return MEMORY[0x1F41817F8](v4, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFCredentialSet *)self serializedCredentialSet];
  [v4 encodeDataObject:v5];
}

- (SBFCredentialSet)initWithCoder:(id)a3
{
  id v4 = [a3 decodeDataObject];
  if (v4)
  {
    self = [(SBFCredentialSet *)self initWithSerializedCredentialSet:v4];
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)initWithSerializedCredentialSet:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18B52E000, a2, OS_LOG_TYPE_ERROR, "ACMContextCreate failed: %d", (uint8_t *)v2, 8u);
}

- (void)initWithSerializedCredentialSet:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18B52E000, log, OS_LOG_TYPE_ERROR, "ACMContextCreate failed from credential set.", v1, 2u);
}

@end