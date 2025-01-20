@interface ICMusicUserState
+ (BOOL)supportsSecureCoding;
+ (int64_t)groupSessionCapableStatus;
- (BOOL)isDelegated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFrozen;
- (BOOL)usesListeningHistory;
- (ICDelegateToken)delegateToken;
- (ICLightweightMusicSubscriptionStatus)lightweightSubscriptionStatus;
- (ICMusicLibraryAuthTokenStatus)libraryAuthTokenStatus;
- (ICMusicSubscriptionStatus)subscriptionStatus;
- (ICMusicUserProfile)userProfile;
- (ICMusicUserState)initWithBlock:(id)a3;
- (ICMusicUserState)initWithCoder:(id)a3;
- (ICMusicUserStateCookies)cookies;
- (NSString)carrierBundleDeviceID;
- (NSString)description;
- (id)copyWithBlock:(id)a3;
- (int64_t)cloudLibrarySyncStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setCarrierBundleDeviceID:(id)a3;
- (void)setCloudLibrarySyncStatus:(int64_t)a3;
- (void)setCookies:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setLibraryAuthTokenStatus:(id)a3;
- (void)setLightweightSubscriptionStatus:(id)a3;
- (void)setSubscriptionStatus:(id)a3;
- (void)setUserProfile:(id)a3;
- (void)setUsesListeningHistory:(BOOL)a3;
@end

@implementation ICMusicUserState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfile, 0);
  objc_storeStrong((id *)&self->_cookies, 0);
  objc_storeStrong((id *)&self->_lightweightSubscriptionStatus, 0);
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
  objc_storeStrong((id *)&self->_libraryAuthTokenStatus, 0);
  objc_storeStrong((id *)&self->_carrierBundleDeviceID, 0);

  objc_storeStrong((id *)&self->_delegateToken, 0);
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (ICMusicUserProfile)userProfile
{
  return self->_userProfile;
}

- (ICMusicUserStateCookies)cookies
{
  return self->_cookies;
}

- (BOOL)usesListeningHistory
{
  return self->_usesListeningHistory;
}

- (int64_t)cloudLibrarySyncStatus
{
  return self->_cloudLibrarySyncStatus;
}

- (ICLightweightMusicSubscriptionStatus)lightweightSubscriptionStatus
{
  return self->_lightweightSubscriptionStatus;
}

- (ICMusicSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (ICMusicLibraryAuthTokenStatus)libraryAuthTokenStatus
{
  return self->_libraryAuthTokenStatus;
}

- (NSString)carrierBundleDeviceID
{
  return self->_carrierBundleDeviceID;
}

- (BOOL)isDelegated
{
  return self->_isDelegated;
}

- (ICDelegateToken)delegateToken
{
  return self->_delegateToken;
}

- (void)setUserProfile:(id)a3
{
  v5 = (ICMusicUserProfile *)a3;
  if (self->_frozen)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICMusicUserState.m" lineNumber:180 description:@"Attempt to mutate after being initialized."];
  }
  userProfile = self->_userProfile;
  self->_userProfile = v5;
}

- (void)setLightweightSubscriptionStatus:(id)a3
{
  v5 = (ICLightweightMusicSubscriptionStatus *)a3;
  if (self->_frozen)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICMusicUserState.m" lineNumber:175 description:@"Attempt to mutate after being initialized."];
  }
  lightweightSubscriptionStatus = self->_lightweightSubscriptionStatus;
  self->_lightweightSubscriptionStatus = v5;
}

- (void)setCookies:(id)a3
{
  v5 = (ICMusicUserStateCookies *)a3;
  if (self->_frozen)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICMusicUserState.m" lineNumber:170 description:@"Attempt to mutate after being initialized."];
  }
  cookies = self->_cookies;
  self->_cookies = v5;
}

- (void)setUsesListeningHistory:(BOOL)a3
{
  if (self->_frozen)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ICMusicUserState.m" lineNumber:165 description:@"Attempt to mutate after being initialized."];
  }
  self->_usesListeningHistory = a3;
}

- (void)setCloudLibrarySyncStatus:(int64_t)a3
{
  if (self->_frozen)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ICMusicUserState.m" lineNumber:160 description:@"Attempt to mutate after being initialized."];
  }
  self->_cloudLibrarySyncStatus = a3;
}

- (void)setSubscriptionStatus:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMusicUserState.m" lineNumber:155 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (ICMusicSubscriptionStatus *)[v5 copy];
  subscriptionStatus = self->_subscriptionStatus;
  self->_subscriptionStatus = v6;
}

- (void)setLibraryAuthTokenStatus:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMusicUserState.m" lineNumber:150 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (ICMusicLibraryAuthTokenStatus *)[v5 copy];
  libraryAuthTokenStatus = self->_libraryAuthTokenStatus;
  self->_libraryAuthTokenStatus = v6;
}

- (void)setCarrierBundleDeviceID:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMusicUserState.m" lineNumber:145 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  carrierBundleDeviceID = self->_carrierBundleDeviceID;
  self->_carrierBundleDeviceID = v6;
}

- (ICMusicUserState)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICMusicUserState;
  id v5 = [(ICMusicUserState *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierBundleDeviceID"];
    carrierBundleDeviceID = v5->_carrierBundleDeviceID;
    v5->_carrierBundleDeviceID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryAuthTokenStatus"];
    libraryAuthTokenStatus = v5->_libraryAuthTokenStatus;
    v5->_libraryAuthTokenStatus = (ICMusicLibraryAuthTokenStatus *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionStatus"];
    subscriptionStatus = v5->_subscriptionStatus;
    v5->_subscriptionStatus = (ICMusicSubscriptionStatus *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lightweightSubscriptionStatus"];
    lightweightSubscriptionStatus = v5->_lightweightSubscriptionStatus;
    v5->_lightweightSubscriptionStatus = (ICLightweightMusicSubscriptionStatus *)v12;

    v5->_cloudLibrarySyncStatus = [v4 decodeIntegerForKey:@"cloudLibrarySyncStatus"];
    v5->_usesListeningHistory = [v4 decodeBoolForKey:@"usesListeningHistory"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cookies"];
    cookies = v5->_cookies;
    v5->_cookies = (ICMusicUserStateCookies *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userProfile"];
    userProfile = v5->_userProfile;
    v5->_userProfile = (ICMusicUserProfile *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  carrierBundleDeviceID = self->_carrierBundleDeviceID;
  id v5 = a3;
  [v5 encodeObject:carrierBundleDeviceID forKey:@"carrierBundleDeviceID"];
  [v5 encodeObject:self->_libraryAuthTokenStatus forKey:@"libraryAuthTokenStatus"];
  [v5 encodeObject:self->_subscriptionStatus forKey:@"subscriptionStatus"];
  [v5 encodeObject:self->_lightweightSubscriptionStatus forKey:@"lightweightSubscriptionStatus"];
  [v5 encodeInteger:self->_cloudLibrarySyncStatus forKey:@"cloudLibrarySyncStatus"];
  [v5 encodeBool:self->_usesListeningHistory forKey:@"usesListeningHistory"];
  [v5 encodeObject:self->_cookies forKey:@"cookies"];
  [v5 encodeObject:self->_userProfile forKey:@"userProfile"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICMusicUserState *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(ICMusicUserState *)self carrierBundleDeviceID];
      id v7 = [(ICMusicUserState *)v5 carrierBundleDeviceID];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          LOBYTE(v9) = 0;
LABEL_42:

          goto LABEL_43;
        }
      }
      uint64_t v10 = [(ICMusicUserState *)self libraryAuthTokenStatus];
      v11 = [v10 token];
      id v12 = [v11 token];
      v55 = [(ICMusicUserState *)v5 libraryAuthTokenStatus];
      v54 = [v55 token];
      id v13 = [v54 token];
      if (v12 == v13)
      {
      }
      else
      {
        int v14 = [v12 isEqual:v13];

        if (!v14)
        {
          LOBYTE(v9) = 0;
LABEL_41:

          goto LABEL_42;
        }
      }
      v53 = v11;
      id v15 = [(ICMusicUserState *)self subscriptionStatus];
      id v16 = [(ICMusicUserState *)v5 subscriptionStatus];
      v56 = v15;
      v52 = v10;
      if (v15 == v16)
      {
      }
      else
      {
        int v17 = [v15 isEqual:v16];

        if (!v17)
        {
          LOBYTE(v9) = 0;
          uint64_t v10 = v52;
LABEL_40:

          v11 = v53;
          goto LABEL_41;
        }
      }
      id v18 = [(ICMusicUserState *)self lightweightSubscriptionStatus];
      id v19 = [(ICMusicUserState *)v5 lightweightSubscriptionStatus];
      v50 = v19;
      v51 = v18;
      if (v18 == v19)
      {
      }
      else
      {
        v20 = v19;
        int v21 = [v18 isEqual:v19];

        if (!v21)
        {
          LOBYTE(v9) = 0;
          uint64_t v10 = v52;
LABEL_39:

          goto LABEL_40;
        }
      }
      v22 = [(ICMusicUserState *)self cookies];
      id v23 = [v22 xpab];
      v48 = [(ICMusicUserState *)v5 cookies];
      id v24 = [v48 xpab];
      v49 = v22;
      v46 = v24;
      v47 = v23;
      if (v23 == v24)
      {
      }
      else
      {
        id v25 = v24;
        v26 = v23;
        v27 = v25;
        int v28 = [v26 isEqual:v25];

        if (!v28)
        {
          LOBYTE(v9) = 0;
          uint64_t v10 = v52;
LABEL_38:

          goto LABEL_39;
        }
      }
      v43 = [(ICMusicUserState *)self cookies];
      id v29 = [v43 itfe];
      v44 = [(ICMusicUserState *)v5 cookies];
      id v30 = [v44 itfe];
      v45 = v29;
      v42 = v30;
      if (v29 == v30)
      {
      }
      else
      {
        v31 = v30;
        int v32 = [v29 isEqual:v30];

        if (!v32)
        {
          LOBYTE(v9) = 0;
          uint64_t v10 = v52;
LABEL_37:

          goto LABEL_38;
        }
      }
      id v33 = [(ICMusicUserState *)self userProfile];
      id v34 = [(ICMusicUserState *)v5 userProfile];
      v40 = v34;
      v41 = v33;
      if (v33 == v34)
      {
      }
      else
      {
        v35 = v34;
        int v36 = [v33 isEqual:v34];

        if (!v36) {
          goto LABEL_35;
        }
      }
      int64_t v37 = [(ICMusicUserState *)self cloudLibrarySyncStatus];
      if (v37 == [(ICMusicUserState *)v5 cloudLibrarySyncStatus])
      {
        BOOL v38 = [(ICMusicUserState *)self usesListeningHistory];
        BOOL v9 = v38 ^ [(ICMusicUserState *)v5 usesListeningHistory] ^ 1;
LABEL_36:
        uint64_t v10 = v52;

        goto LABEL_37;
      }
LABEL_35:
      LOBYTE(v9) = 0;
      goto LABEL_36;
    }
    LOBYTE(v9) = 0;
  }
LABEL_43:

  return v9;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(ICMusicUserState *)self carrierBundleDeviceID];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"nil";
  }
  [v3 setObject:v6 forKeyedSubscript:@"carrierBundleDeviceID"];

  uint64_t v7 = [(ICMusicUserState *)self libraryAuthTokenStatus];
  int v8 = (void *)v7;
  if (v7) {
    BOOL v9 = (__CFString *)v7;
  }
  else {
    BOOL v9 = @"nil";
  }
  [v3 setObject:v9 forKeyedSubscript:@"libraryAuthTokenStatus"];

  uint64_t v10 = [(ICMusicUserState *)self subscriptionStatus];
  v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = @"nil";
  }
  [v3 setObject:v12 forKeyedSubscript:@"subscriptionStatus"];

  uint64_t v13 = [(ICMusicUserState *)self lightweightSubscriptionStatus];
  int v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = @"nil";
  }
  [v3 setObject:v15 forKeyedSubscript:@"lightweightSubscriptionStatus"];

  id v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICMusicUserState cloudLibrarySyncStatus](self, "cloudLibrarySyncStatus"));
  [v3 setObject:v16 forKeyedSubscript:@"cloudLibrarySyncStatus"];

  if ([(ICMusicUserState *)self usesListeningHistory]) {
    uint64_t v17 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v17 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v17 forKeyedSubscript:@"usesListeningHistory"];
  uint64_t v18 = [(ICMusicUserState *)self userProfile];
  id v19 = (void *)v18;
  if (v18) {
    v20 = (__CFString *)v18;
  }
  else {
    v20 = @"nil";
  }
  [v3 setObject:v20 forKeyedSubscript:@"userProfile"];

  int v21 = [NSString stringWithFormat:@"<%@: %p [%@]>", objc_opt_class(), self, v3];

  return (NSString *)v21;
}

- (id)copyWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [ICMusicUserState alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__ICMusicUserState_copyWithBlock___block_invoke;
  v9[3] = &unk_1E5AC9C90;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(ICMusicUserState *)v5 initWithBlock:v9];

  return v7;
}

void __34__ICMusicUserState_copyWithBlock___block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 3, *(id *)(*(void *)(a1 + 32) + 24));
  id v4 = a2;
  objc_storeStrong(v4 + 4, *(id *)(*(void *)(a1 + 32) + 32));
  objc_storeStrong(v4 + 5, *(id *)(*(void *)(a1 + 32) + 40));
  objc_storeStrong(v4 + 6, *(id *)(*(void *)(a1 + 32) + 48));
  v4[7] = *(id *)(*(void *)(a1 + 32) + 56);
  *((unsigned char *)v4 + 9) = *(unsigned char *)(*(void *)(a1 + 32) + 9);
  objc_storeStrong(v4 + 8, *(id *)(*(void *)(a1 + 32) + 64));
  objc_storeStrong(v4 + 9, *(id *)(*(void *)(a1 + 32) + 72));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (ICMusicUserState)initWithBlock:(id)a3
{
  id v4 = (void (**)(id, ICMusicUserState *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMusicUserState;
  id v5 = [(ICMusicUserState *)&v7 init];
  if (v5)
  {
    v4[2](v4, v5);
    v5->_frozen = 1;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)groupSessionCapableStatus
{
  v2 = +[ICDefaults standardDefaults];
  v3 = [v2 cachedSharedControlsCapability];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

@end