@interface ICUserIdentityStoreTestingBackend
+ (BOOL)supportsSecureCoding;
+ (NSNumber)defaultActiveAccountDSID;
+ (NSNumber)defaultActiveLockerAccountDSID;
+ (NSString)defaultStorefrontIdentifier;
+ (void)setDefaultActiveAccountDSID:(id)a3;
+ (void)setDefaultActiveLockerAccountDSID:(id)a3;
+ (void)setDefaultStorefrontIdentifier:(id)a3;
- (BOOL)disableLockerAccountDSID:(id)a3 error:(id *)a4;
- (BOOL)replaceIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5;
- (BOOL)setIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5;
- (BOOL)setLocalStoreAccountProperties:(id)a3 error:(id *)a4;
- (BOOL)updateActiveAccountDSID:(id)a3 error:(id *)a4;
- (BOOL)updateActiveLockerAccountDSID:(id)a3 error:(id *)a4;
- (ICUserIdentityStoreBackendDelegate)delegate;
- (ICUserIdentityStoreTestingBackend)init;
- (ICUserIdentityStoreTestingBackend)initWithCoder:(id)a3;
- (id)_propertiesToSaveForProperties:(id)a3;
- (id)accountDSIDForAltDSID:(id)a3 error:(id *)a4;
- (id)activeAccountDSIDWithError:(id *)a3;
- (id)activeLockerAccountDSIDWithError:(id *)a3;
- (id)allStoreAccountDSIDsWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identityPropertiesForDSID:(id)a3 error:(id *)a4;
- (id)identityPropertiesForPrimaryICloudAccountWithError:(id *)a3;
- (id)localStoreAccountPropertiesWithError:(id *)a3;
- (id)verificationContextForAccountEstablishmentWithError:(id *)a3;
- (id)verificationContextForDSID:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)removeIdentityForDSID:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ICUserIdentityStoreTestingBackend

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localStoreAccountProperties, 0);
  objc_storeStrong((id *)&self->_identityProperties, 0);
  objc_storeStrong((id *)&self->_activeLockerAccountDSID, 0);

  objc_storeStrong((id *)&self->_activeAccountDSID, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ICUserIdentityStoreBackendDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICUserIdentityStoreBackendDelegate *)WeakRetained;
}

- (id)_propertiesToSaveForProperties:(id)a3
{
  v3 = (void *)[a3 mutableCopy];
  [v3 setDelegated:0];
  [v3 setDelegateToken:0];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  activeAccountDSID = self->_activeAccountDSID;
  id v5 = a3;
  [v5 encodeObject:activeAccountDSID forKey:@"activeDSID"];
  [v5 encodeObject:self->_activeLockerAccountDSID forKey:@"lockerDSID"];
  [v5 encodeObject:self->_identityProperties forKey:@"ids"];
  [v5 encodeObject:self->_localStoreAccountProperties forKey:@"localStoreAccountProperties"];
}

- (ICUserIdentityStoreTestingBackend)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICUserIdentityStoreTestingBackend;
  id v5 = [(ICUserIdentityStoreTestingBackend *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeDSID"];
    activeAccountDSID = v5->_activeAccountDSID;
    v5->_activeAccountDSID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lockerDSID"];
    activeLockerAccountDSID = v5->_activeLockerAccountDSID;
    v5->_activeLockerAccountDSID = (NSNumber *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v10, "initWithObjects:", v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"ids"];
    identityProperties = v5->_identityProperties;
    v5->_identityProperties = (NSMutableDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localStoreAccountProperties"];
    localStoreAccountProperties = v5->_localStoreAccountProperties;
    v5->_localStoreAccountProperties = (ICLocalStoreAccountProperties *)v16;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSNumber *)self->_activeAccountDSID copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSNumber *)self->_activeLockerAccountDSID copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSMutableDictionary *)self->_identityProperties mutableCopyWithZone:a3];
    uint64_t v11 = (void *)v5[3];
    v5[3] = v10;

    id v12 = [(ICLocalStoreAccountProperties *)self->_localStoreAccountProperties copyWithZone:a3];
    v13 = (void *)v5[4];
    v5[4] = v12;
  }
  return v5;
}

- (id)allStoreAccountDSIDsWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  if ([(NSNumber *)self->_activeAccountDSID unsignedLongLongValue]) {
    [v5 addObject:self->_activeAccountDSID];
  }
  if (a3) {
    *a3 = 0;
  }
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

- (BOOL)setLocalStoreAccountProperties:(id)a3 error:(id *)a4
{
  uint64_t v6 = (ICLocalStoreAccountProperties *)[a3 copy];
  localStoreAccountProperties = self->_localStoreAccountProperties;
  self->_localStoreAccountProperties = v6;

  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (id)localStoreAccountPropertiesWithError:(id *)a3
{
  return self->_localStoreAccountProperties;
}

- (id)verificationContextForDSID:(id)a3 error:(id *)a4
{
  id v10 = 0;
  id v5 = [(ICUserIdentityStoreTestingBackend *)self identityPropertiesForDSID:a3 error:&v10];
  id v6 = v10;
  v7 = 0;
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v5 == 0;
  }
  if (!v8)
  {
    v7 = objc_alloc_init(ICUserVerificationContext);
    [(ICUserVerificationContext *)v7 setIdentityProperties:v5];
  }
  if (a4) {
    *a4 = v6;
  }

  return v7;
}

- (id)verificationContextForAccountEstablishmentWithError:(id *)a3
{
  id v4 = objc_alloc_init(ICUserVerificationContext);
  id v5 = objc_alloc_init(ICUserIdentityProperties);
  [(ICUserVerificationContext *)v4 setIdentityProperties:v5];
  if (a3) {
    *a3 = 0;
  }

  return v4;
}

- (BOOL)replaceIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSMutableDictionary *)self->_identityProperties objectForKey:v9];

  if (v10)
  {
    uint64_t v11 = [(ICUserIdentityStoreTestingBackend *)self _propertiesToSaveForProperties:v8];
    [(NSMutableDictionary *)self->_identityProperties setObject:v11 forKey:v9];
  }
  if (a5) {
    *a5 = 0;
  }

  return v10 != 0;
}

- (void)removeIdentityForDSID:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, BOOL, void))a4;
  v7 = [(NSMutableDictionary *)self->_identityProperties objectForKey:v8];

  if (v7) {
    [(NSMutableDictionary *)self->_identityProperties removeObjectForKey:v8];
  }
  if (v6) {
    v6[2](v6, v7 != 0, 0);
  }
}

- (id)identityPropertiesForPrimaryICloudAccountWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return 0;
}

- (BOOL)setIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self->_identityProperties)
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identityProperties = self->_identityProperties;
    self->_identityProperties = v10;
  }
  id v12 = [(ICUserIdentityStoreTestingBackend *)self _propertiesToSaveForProperties:v8];
  [(NSMutableDictionary *)self->_identityProperties setObject:v12 forKey:v9];
  if (a5) {
    *a5 = 0;
  }

  return 1;
}

- (id)identityPropertiesForDSID:(id)a3 error:(id *)a4
{
  id result = (id)[(NSMutableDictionary *)self->_identityProperties objectForKey:a3];
  if (a4) {
    *a4 = 0;
  }
  return result;
}

- (BOOL)disableLockerAccountDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(NSNumber *)self->_activeLockerAccountDSID isEqualToNumber:v6])
  {
    activeLockerAccountDSID = self->_activeLockerAccountDSID;
    self->_activeLockerAccountDSID = 0;
  }
  id v14 = 0;
  id v8 = [(ICUserIdentityStoreTestingBackend *)self identityPropertiesForDSID:v6 error:&v14];
  id v9 = v14;
  id v10 = (void *)[v8 mutableCopy];

  if (v10)
  {
    [v10 setActiveLocker:0];
    id v13 = v9;
    [(ICUserIdentityStoreTestingBackend *)self setIdentityProperties:v10 forDSID:v6 error:&v13];
    id v11 = v13;

    id v9 = v11;
  }
  if (a4) {
    *a4 = v9;
  }

  return 1;
}

- (BOOL)updateActiveLockerAccountDSID:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (id)accountDSIDForAltDSID:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return self->_activeLockerAccountDSID;
}

- (id)activeLockerAccountDSIDWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return self->_activeLockerAccountDSID;
}

- (BOOL)updateActiveAccountDSID:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (id)activeAccountDSIDWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return self->_activeAccountDSID;
}

- (ICUserIdentityStoreTestingBackend)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICUserIdentityStoreTestingBackend;
  v2 = [(ICUserIdentityStoreTestingBackend *)&v8 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_activeAccountDSID, (id)sDefaultActiveAccountDSID);
    objc_storeStrong((id *)&v3->_activeLockerAccountDSID, (id)sDefaultActiveLockerAccountDSID);
    id v4 = objc_alloc_init(ICMutableLocalStoreAccountProperties);
    [(ICMutableLocalStoreAccountProperties *)v4 setStorefrontIdentifier:sDefaultStorefrontIdentifier];
    uint64_t v5 = [(ICMutableLocalStoreAccountProperties *)v4 copy];
    localStoreAccountProperties = v3->_localStoreAccountProperties;
    v3->_localStoreAccountProperties = (ICLocalStoreAccountProperties *)v5;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)setDefaultStorefrontIdentifier:(id)a3
{
  if ((id)sDefaultStorefrontIdentifier != a3)
  {
    uint64_t v3 = [a3 copy];
    uint64_t v4 = sDefaultStorefrontIdentifier;
    sDefaultStorefrontIdentifier = v3;
    MEMORY[0x1F41817F8](v3, v4);
  }
}

+ (NSString)defaultStorefrontIdentifier
{
  return (NSString *)(id)sDefaultStorefrontIdentifier;
}

+ (void)setDefaultActiveLockerAccountDSID:(id)a3
{
  if ((id)sDefaultActiveLockerAccountDSID != a3)
  {
    uint64_t v3 = [a3 copy];
    uint64_t v4 = sDefaultActiveLockerAccountDSID;
    sDefaultActiveLockerAccountDSID = v3;
    MEMORY[0x1F41817F8](v3, v4);
  }
}

+ (NSNumber)defaultActiveLockerAccountDSID
{
  return (NSNumber *)(id)sDefaultActiveLockerAccountDSID;
}

+ (void)setDefaultActiveAccountDSID:(id)a3
{
  if ((id)sDefaultActiveAccountDSID != a3)
  {
    uint64_t v3 = [a3 copy];
    uint64_t v4 = sDefaultActiveAccountDSID;
    sDefaultActiveAccountDSID = v3;
    MEMORY[0x1F41817F8](v3, v4);
  }
}

+ (NSNumber)defaultActiveAccountDSID
{
  return (NSNumber *)(id)sDefaultActiveAccountDSID;
}

@end