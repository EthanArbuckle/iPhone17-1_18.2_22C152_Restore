@interface NNMKSyncedAccount
- (BOOL)resendRequested;
- (BOOL)shouldArchive;
- (NNMKSyncedAccount)init;
- (NNMKSyncedAccount)initWithAccount:(id)a3;
- (NSArray)emailAddresses;
- (NSString)accountId;
- (NSString)defaultEmailAddress;
- (NSString)displayName;
- (NSString)emailAddressToken;
- (NSString)localId;
- (NSString)pccEmailAddress;
- (NSString)typeIdentifier;
- (NSString)username;
- (id)account;
- (unint64_t)resendInterval;
- (unint64_t)sourceType;
- (void)setAccountId:(id)a3;
- (void)setDefaultEmailAddress:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddressToken:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setLocalId:(id)a3;
- (void)setPccEmailAddress:(id)a3;
- (void)setResendInterval:(unint64_t)a3;
- (void)setResendRequested:(BOOL)a3;
- (void)setShouldArchive:(BOOL)a3;
- (void)setSourceType:(unint64_t)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation NNMKSyncedAccount

- (NNMKSyncedAccount)initWithAccount:(id)a3
{
  id v4 = a3;
  v5 = [(NNMKSyncedAccount *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 accountId];
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v6;

    uint64_t v8 = [v4 displayName];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    v5->_shouldArchive = [v4 shouldArchive];
    v10 = [v4 emailAddresses];
    uint64_t v11 = [v10 copy];
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSArray *)v11;

    uint64_t v13 = [v4 defaultEmailAddress];
    defaultEmailAddress = v5->_defaultEmailAddress;
    v5->_defaultEmailAddress = (NSString *)v13;

    uint64_t v15 = [v4 username];
    username = v5->_username;
    v5->_username = (NSString *)v15;

    uint64_t v17 = [v4 localId];
    localId = v5->_localId;
    v5->_localId = (NSString *)v17;

    uint64_t v19 = [v4 typeIdentifier];
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v19;

    uint64_t v21 = [v4 emailAddressToken];
    emailAddressToken = v5->_emailAddressToken;
    v5->_emailAddressToken = (NSString *)v21;

    uint64_t v23 = [v4 pccEmailAddress];
    pccEmailAddress = v5->_pccEmailAddress;
    v5->_pccEmailAddress = (NSString *)v23;
  }
  return v5;
}

- (NNMKSyncedAccount)init
{
  v8.receiver = self;
  v8.super_class = (Class)NNMKSyncedAccount;
  v2 = [(NNMKSyncedAccount *)&v8 init];
  v3 = v2;
  if (v2)
  {
    accountId = v2->_accountId;
    v2->_accountId = 0;

    displayName = v3->_displayName;
    v3->_displayName = 0;

    v3->_shouldArchive = 0;
    emailAddresses = v3->_emailAddresses;
    v3->_emailAddresses = 0;
  }
  return v3;
}

- (id)account
{
  v3 = objc_alloc_init(NNMKAccount);
  id v4 = [(NNMKSyncedAccount *)self accountId];
  [(NNMKAccount *)v3 setAccountId:v4];

  v5 = [(NNMKSyncedAccount *)self localId];
  [(NNMKAccount *)v3 setLocalId:v5];

  uint64_t v6 = [(NNMKSyncedAccount *)self displayName];
  [(NNMKAccount *)v3 setDisplayName:v6];

  [(NNMKAccount *)v3 setShouldArchive:[(NNMKSyncedAccount *)self shouldArchive]];
  v7 = [(NNMKSyncedAccount *)self emailAddresses];
  [(NNMKAccount *)v3 setEmailAddresses:v7];

  objc_super v8 = [(NNMKSyncedAccount *)self defaultEmailAddress];
  [(NNMKAccount *)v3 setDefaultEmailAddress:v8];

  [(NNMKAccount *)v3 setSourceType:[(NNMKSyncedAccount *)self sourceType]];
  v9 = [(NNMKSyncedAccount *)self username];
  [(NNMKAccount *)v3 setUsername:v9];

  v10 = [(NNMKSyncedAccount *)self typeIdentifier];
  [(NNMKAccount *)v3 setTypeIdentifier:v10];

  uint64_t v11 = [(NNMKSyncedAccount *)self emailAddressToken];
  [(NNMKAccount *)v3 setEmailAddressToken:v11];

  v12 = [(NNMKSyncedAccount *)self pccEmailAddress];
  [(NNMKAccount *)v3 setPccEmailAddress:v12];

  return v3;
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)shouldArchive
{
  return self->_shouldArchive;
}

- (void)setShouldArchive:(BOOL)a3
{
  self->_shouldArchive = a3;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (NSString)defaultEmailAddress
{
  return self->_defaultEmailAddress;
}

- (void)setDefaultEmailAddress:(id)a3
{
}

- (BOOL)resendRequested
{
  return self->_resendRequested;
}

- (void)setResendRequested:(BOOL)a3
{
  self->_resendRequested = a3;
}

- (unint64_t)resendInterval
{
  return self->_resendInterval;
}

- (void)setResendInterval:(unint64_t)a3
{
  self->_resendInterval = a3;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)localId
{
  return self->_localId;
}

- (void)setLocalId:(id)a3
{
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
}

- (NSString)emailAddressToken
{
  return self->_emailAddressToken;
}

- (void)setEmailAddressToken:(id)a3
{
}

- (NSString)pccEmailAddress
{
  return self->_pccEmailAddress;
}

- (void)setPccEmailAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pccEmailAddress, 0);
  objc_storeStrong((id *)&self->_emailAddressToken, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_localId, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_defaultEmailAddress, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end