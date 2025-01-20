@interface RMManagedTrustStoreController
+ (id)newManagedTrustStoreControllerProtocolForScope:(int64_t)a3 personaID:(id)a4;
- (BOOL)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 error:(id *)a6;
- (BOOL)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 error:(id *)a6;
- (NSString)personaID;
- (RMManagedTrustStoreController)initWithScope:(int64_t)a3 personaID:(id)a4;
- (int64_t)scope;
- (void)setPersonaID:(id)a3;
- (void)setScope:(int64_t)a3;
@end

@implementation RMManagedTrustStoreController

+ (id)newManagedTrustStoreControllerProtocolForScope:(int64_t)a3 personaID:(id)a4
{
  id v5 = a4;
  v6 = [[RMManagedTrustStoreController alloc] initWithScope:a3 personaID:v5];

  return v6;
}

- (RMManagedTrustStoreController)initWithScope:(int64_t)a3 personaID:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMManagedTrustStoreController;
  v8 = [(RMManagedTrustStoreController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_scope = a3 == 1;
    objc_storeStrong((id *)&v8->_personaID, a4);
    v10 = +[RMLog managedTrustStoreController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[RMManagedTrustStoreController initWithScope:personaID:]((uint64_t)v7, a3, v10);
    }
  }
  return v9;
}

- (BOOL)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  objc_super v12 = +[RMManagedTrustStore sharedInstance];
  int64_t v13 = [(RMManagedTrustStoreController *)self scope];
  v14 = [(RMManagedTrustStoreController *)self personaID];
  LOBYTE(a6) = [v12 setTrustForCertificateRef:v11 configurationKey:v10 fullTrust:v7 scope:v13 persona:v14 error:a6];

  return (char)a6;
}

- (BOOL)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  objc_super v12 = +[RMManagedTrustStore sharedInstance];
  int64_t v13 = [(RMManagedTrustStoreController *)self scope];
  v14 = [(RMManagedTrustStoreController *)self personaID];
  LOBYTE(a6) = [v12 removeTrustForCertificateRef:v11 configurationKey:v10 fullTrust:v7 scope:v13 persona:v14 error:a6];

  return (char)a6;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithScope:(os_log_t)log personaID:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_224784000, log, OS_LOG_TYPE_DEBUG, "Created with scope: %ld personaID: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end