@interface PDSECredentialEntry
- (PDSECredentialEntry)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PDSECredentialEntry

- (PDSECredentialEntry)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[PDSECredentialEntry allocWithZone:](PDSECredentialEntry, "allocWithZone:");
  if (v5)
  {
    v16.receiver = v5;
    v16.super_class = (Class)PDSECredentialEntry;
    v6 = [(PDSECredentialEntry *)&v16 init];
  }
  else
  {
    v6 = 0;
  }
  v7 = (NSString *)[(NSString *)self->_passUniqueIdentifier copyWithZone:a3];
  passUniqueIdentifier = v6->_passUniqueIdentifier;
  v6->_passUniqueIdentifier = v7;

  v9 = (NSArray *)[(NSArray *)self->_automaticSelectionCriteria copyWithZone:a3];
  automaticSelectionCriteria = v6->_automaticSelectionCriteria;
  v6->_automaticSelectionCriteria = v9;

  v11 = (NSSet *)[(NSSet *)self->_aliroGroupResolvingKeys copyWithZone:a3];
  aliroGroupResolvingKeys = v6->_aliroGroupResolvingKeys;
  v6->_aliroGroupResolvingKeys = v11;

  v6->_nfcExpressEnabled = self->_nfcExpressEnabled;
  v6->_uwbExpressEnabled = self->_uwbExpressEnabled;
  v6->_expressSuspended = self->_expressSuspended;
  v6->_inSessionExpress = self->_inSessionExpress;
  v6->_supportsUWB = self->_supportsUWB;
  v6->_userChoice = self->_userChoice;
  v6->_supportsExpress = self->_supportsExpress;
  v6->_supportsInSessionExpress = self->_supportsInSessionExpress;
  v13 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_state mutableCopyWithZone:a3];
  state = v6->_state;
  v6->_state = v13;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliroGroupResolvingKeys, 0);
  objc_storeStrong((id *)&self->_automaticSelectionCriteria, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end