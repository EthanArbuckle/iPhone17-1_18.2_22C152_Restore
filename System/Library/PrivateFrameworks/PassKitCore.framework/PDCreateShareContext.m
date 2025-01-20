@interface PDCreateShareContext
- (NSString)expectedPairedReaderIdentifier;
- (NSString)expectedProvisioningCredentialHash;
- (PDCreateShareContext)init;
- (id)primaryInvite;
- (id)secondaryInvites;
- (void)_addInvite:(id)a3 forCredentialShare:(id)a4 primary:(BOOL)a5;
- (void)addInvite:(id)a3 forCredentialShare:(id)a4 primary:(BOOL)a5;
- (void)addInvite:(id)a3 primary:(BOOL)a4;
- (void)enumerateAllInvites:(id)a3;
- (void)enumerateSecondaryInvites:(id)a3;
- (void)setExpectedPairedReaderIdentifier:(id)a3;
- (void)setExpectedProvisioningCredentialHash:(id)a3;
- (void)setHandle:(id)a3 forInvite:(id)a4;
- (void)setShareURL:(id)a3 forInvite:(id)a4;
- (void)setTransportIdentifier:(id)a3 forInvite:(id)a4;
@end

@implementation PDCreateShareContext

- (PDCreateShareContext)init
{
  v14.receiver = self;
  v14.super_class = (Class)PDCreateShareContext;
  v2 = [(PDCreateShareContext *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    invites = v2->_invites;
    v2->_invites = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    credentialShareForInviteIdentifier = v2->_credentialShareForInviteIdentifier;
    v2->_credentialShareForInviteIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    handleForInviteIdentifier = v2->_handleForInviteIdentifier;
    v2->_handleForInviteIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transportIdentifierForInviteIdentifier = v2->_transportIdentifierForInviteIdentifier;
    v2->_transportIdentifierForInviteIdentifier = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    shareURLForInviteIdentifier = v2->_shareURLForInviteIdentifier;
    v2->_shareURLForInviteIdentifier = v11;
  }
  return v2;
}

- (void)addInvite:(id)a3 primary:(BOOL)a4
{
}

- (void)addInvite:(id)a3 forCredentialShare:(id)a4 primary:(BOOL)a5
{
}

- (void)_addInvite:(id)a3 forCredentialShare:(id)a4 primary:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  if (v5)
  {
    v9 = [v13 identifier];
    primaryInviteIdentifier = self->_primaryInviteIdentifier;
    self->_primaryInviteIdentifier = v9;
  }
  [(NSMutableArray *)self->_invites addObject:v13];
  if (v8)
  {
    credentialShareForInviteIdentifier = self->_credentialShareForInviteIdentifier;
    v12 = [v13 identifier];
    [(NSMutableDictionary *)credentialShareForInviteIdentifier setObject:v8 forKeyedSubscript:v12];
  }
}

- (void)setHandle:(id)a3 forInvite:(id)a4
{
  handleForInviteIdentifier = self->_handleForInviteIdentifier;
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 identifier];
  [(NSMutableDictionary *)handleForInviteIdentifier setObject:v8 forKeyedSubscript:v9];

  id v12 = [v8 transportIdentifier];

  transportIdentifierForInviteIdentifier = self->_transportIdentifierForInviteIdentifier;
  v11 = [v7 identifier];

  [(NSMutableDictionary *)transportIdentifierForInviteIdentifier setObject:v12 forKeyedSubscript:v11];
}

- (void)setTransportIdentifier:(id)a3 forInvite:(id)a4
{
  transportIdentifierForInviteIdentifier = self->_transportIdentifierForInviteIdentifier;
  id v6 = a3;
  id v7 = [a4 identifier];
  [(NSMutableDictionary *)transportIdentifierForInviteIdentifier setObject:v6 forKeyedSubscript:v7];
}

- (void)setShareURL:(id)a3 forInvite:(id)a4
{
  shareURLForInviteIdentifier = self->_shareURLForInviteIdentifier;
  id v6 = a3;
  id v7 = [a4 identifier];
  [(NSMutableDictionary *)shareURLForInviteIdentifier setObject:v6 forKeyedSubscript:v7];
}

- (id)primaryInvite
{
  if (self->_primaryInviteIdentifier)
  {
    invites = self->_invites;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1002A462C;
    v5[3] = &unk_100744CA8;
    v5[4] = self;
    v3 = [(NSMutableArray *)invites pk_firstObjectPassingTest:v5];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)secondaryInvites
{
  invites = self->_invites;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002A473C;
  v5[3] = &unk_100744CD0;
  v5[4] = self;
  v3 = [(NSMutableArray *)invites pk_objectsPassingTest:v5];
  return v3;
}

- (void)enumerateSecondaryInvites:(id)a3
{
  v4 = (void (**)(id, void *, void *, void *))a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_invites;
  id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    v19 = (char *)(v4 + 2);
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", v19);
        primaryInviteIdentifier = self->_primaryInviteIdentifier;
        id v12 = v10;
        id v13 = primaryInviteIdentifier;
        objc_super v14 = v12;
        v15 = v12;
        if (v12 == v13) {
          goto LABEL_15;
        }
        v16 = v13;
        if (v12) {
          BOOL v17 = v13 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {

LABEL_14:
          v15 = [(NSMutableDictionary *)self->_credentialShareForInviteIdentifier objectForKeyedSubscript:v12];
          objc_super v14 = [(NSMutableDictionary *)self->_shareURLForInviteIdentifier objectForKeyedSubscript:v12];
          v4[2](v4, v9, v15, v14);
LABEL_15:

          goto LABEL_16;
        }
        unsigned __int8 v18 = [(NSString *)v12 isEqualToString:v13];

        if ((v18 & 1) == 0) {
          goto LABEL_14;
        }
LABEL_16:
      }
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
}

- (void)enumerateAllInvites:(id)a3
{
  v4 = (void (**)(id, void *, void *, void *))a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_invites;
  id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 identifier];
        v11 = [(NSMutableDictionary *)self->_credentialShareForInviteIdentifier objectForKeyedSubscript:v10];
        id v12 = [(NSMutableDictionary *)self->_transportIdentifierForInviteIdentifier objectForKeyedSubscript:v10];
        v4[2](v4, v9, v11, v12);
      }
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (NSString)expectedPairedReaderIdentifier
{
  return self->_expectedPairedReaderIdentifier;
}

- (void)setExpectedPairedReaderIdentifier:(id)a3
{
}

- (NSString)expectedProvisioningCredentialHash
{
  return self->_expectedProvisioningCredentialHash;
}

- (void)setExpectedProvisioningCredentialHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedProvisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_expectedPairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_shareURLForInviteIdentifier, 0);
  objc_storeStrong((id *)&self->_transportIdentifierForInviteIdentifier, 0);
  objc_storeStrong((id *)&self->_handleForInviteIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialShareForInviteIdentifier, 0);
  objc_storeStrong((id *)&self->_invites, 0);
  objc_storeStrong((id *)&self->_primaryInviteIdentifier, 0);
}

@end