@interface TPSPairedWatchValidation
- (NSUUID)capability;
- (TPSPairedWatchValidation)initWithCapability:(id)a3;
- (void)setCapability:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSPairedWatchValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F79EF0];
  v5 = (void (**)(id, void *, void))a3;
  v6 = [v4 sharedInstance];
  v7 = [v6 getActivePairedDevice];

  if (v7)
  {
    v8 = [(TPSPairedWatchValidation *)self capability];

    if (v8)
    {
      v9 = [(TPSPairedWatchValidation *)self capability];
      v8 = (void *)[v7 supportsCapability:v9];
    }
  }
  else
  {
    v8 = 0;
  }
  v10 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(TPSPairedWatchValidation *)self validateWithCompletion:v10];
  }

  v5[2](v5, v8, 0);
}

- (TPSPairedWatchValidation)initWithCapability:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSPairedWatchValidation;
  v6 = [(TPSPairedWatchValidation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_capability, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (NSUUID)capability
{
  return self->_capability;
}

- (void)setCapability:(id)a3
{
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = [a1 name];
  v7 = [a1 capability];
  int v8 = 138412802;
  objc_super v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - capability: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);
}

@end