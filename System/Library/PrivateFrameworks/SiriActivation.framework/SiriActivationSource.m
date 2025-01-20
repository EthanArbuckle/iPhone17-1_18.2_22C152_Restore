@interface SiriActivationSource
- (BOOL)isActive;
- (BOOL)isEnabled;
- (NSString)identifier;
- (SiriActivationSource)init;
- (void)activeChangedTo:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setIdentifier:(id)a3;
@end

@implementation SiriActivationSource

- (NSString)identifier
{
  return self->_identifier;
}

- (SiriActivationSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)SiriActivationSource;
  v2 = [(SiriActivationSource *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)activeChangedTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E4F28ED0];
    BOOL active = self->_active;
    v8 = v5;
    v9 = [v6 numberWithBool:active];
    v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
    int v11 = 136315650;
    v12 = "-[SiriActivationSource activeChangedTo:]";
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation old availability: %@, new availability: %@", (uint8_t *)&v11, 0x20u);
  }
  self->_BOOL active = [v4 BOOLValue];
  self->_knowsIfActive = 1;
}

- (void)dealloc
{
  [(SiriActivationSource *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SiriActivationSource;
  [(SiriActivationSource *)&v3 dealloc];
}

- (BOOL)isEnabled
{
  int v2 = _AXSHomeButtonAssistant();
  objc_super v3 = +[SASSystemState sharedSystemState];
  if ([v3 siriIsSupported])
  {
    id v4 = +[SASSystemState sharedSystemState];
    char v5 = [v4 siriIsEnabled];
    if (v2) {
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isActive
{
  return !self->_knowsIfActive || self->_active;
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v6 = 136315394;
    objc_super v7 = "-[SiriActivationSource invalidate]";
    __int16 v8 = 2112;
    v9 = connection;
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation invalidating BSServiceConnection %@", (uint8_t *)&v6, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  [(BSServiceConnection *)self->_connection invalidate];
  char v5 = self->_connection;
  self->_connection = 0;

  *(_WORD *)&self->_BOOL active = 256;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end