@interface WBSPasswordBreachTestCredentialSource
- (NSArray)credentials;
- (WBSPasswordBreachTestCredentialSource)initWithPasswords:(id)a3;
- (id)savedAccountsForPersistentIdentifiers:(id)a3;
@end

@implementation WBSPasswordBreachTestCredentialSource

- (WBSPasswordBreachTestCredentialSource)initWithPasswords:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordBreachTestCredentialSource;
  v5 = [(WBSPasswordBreachTestCredentialSource *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_42);
    credentials = v5->_credentials;
    v5->_credentials = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

WBSPasswordBreachCredential *__59__WBSPasswordBreachTestCredentialSource_initWithPasswords___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [WBSPasswordBreachCredential alloc];
  id v4 = [v2 dataUsingEncoding:4 allowLossyConversion:0];
  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:1000.0];
  uint64_t v6 = [(WBSPasswordBreachCredential *)v3 initWithPassword:v2 persistentIdentifier:v4 dateLastModified:v5];

  return v6;
}

- (NSArray)credentials
{
  return self->_credentials;
}

- (id)savedAccountsForPersistentIdentifiers:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void).cxx_destruct
{
}

@end