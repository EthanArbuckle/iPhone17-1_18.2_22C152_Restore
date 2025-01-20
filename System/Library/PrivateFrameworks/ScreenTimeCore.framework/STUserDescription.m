@interface STUserDescription
+ (id)currentUser;
+ (void)currentUserWithCompletion:(id)a3;
- (NSNumber)userDSID;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)userAltDSID;
- (STUserDescription)initWithGivenName:(id)a3 familyName:(id)a4 userDSID:(id)a5 userAltDSID:(id)a6;
@end

@implementation STUserDescription

- (STUserDescription)initWithGivenName:(id)a3 familyName:(id)a4 userDSID:(id)a5 userAltDSID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)STUserDescription;
  v14 = [(STUserDescription *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    givenName = v14->_givenName;
    v14->_givenName = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    familyName = v14->_familyName;
    v14->_familyName = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    userDSID = v14->_userDSID;
    v14->_userDSID = (NSNumber *)v19;

    uint64_t v21 = [v13 copy];
    userAltDSID = v14->_userAltDSID;
    v14->_userAltDSID = (NSString *)v21;
  }
  return v14;
}

+ (id)currentUser
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  v4 = v3;
  if (!v3)
  {
    id v12 = +[STLog utility];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1DA519000, v12, OS_LOG_TYPE_INFO, "No Apple Account", (uint8_t *)&v15, 2u);
    }

    v5 = 0;
    v6 = 0;
    id v10 = 0;
    goto LABEL_9;
  }
  v5 = objc_msgSend(v3, "aa_firstName");
  v6 = objc_msgSend(v4, "aa_lastName");
  v7 = NSNumber;
  v8 = objc_msgSend(v4, "aa_personID");
  v9 = objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "longLongValue"));

  id v10 = objc_msgSend(v4, "aa_altDSID");
  id v11 = +[STLog utility];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412802;
    v16 = v9;
    __int16 v17 = 2112;
    v18 = v5;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1DA519000, v11, OS_LOG_TYPE_INFO, "Account DSID %@: %@ %@", (uint8_t *)&v15, 0x20u);
  }

  if (!v9) {
LABEL_9:
  }
    v9 = &unk_1F349ECC8;
  id v13 = [[STUserDescription alloc] initWithGivenName:v5 familyName:v6 userDSID:v9 userAltDSID:v10];

  return v13;
}

+ (void)currentUserWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__STUserDescription_currentUserWithCompletion___block_invoke;
  v6[3] = &unk_1E6BC8188;
  id v7 = v3;
  id v5 = v3;
  objc_msgSend(v4, "aa_primaryAppleAccountWithCompletion:", v6);
}

void __47__STUserDescription_currentUserWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v14 = +[STLog utility];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1DA519000, v14, OS_LOG_TYPE_INFO, "No Apple Account", (uint8_t *)&v16, 2u);
    }

    id v7 = 0;
    v8 = 0;
    id v12 = 0;
    goto LABEL_9;
  }
  id v7 = objc_msgSend(v5, "aa_firstName");
  v8 = objc_msgSend(v5, "aa_lastName");
  v9 = NSNumber;
  id v10 = objc_msgSend(v5, "aa_personID");
  id v11 = objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));

  id v12 = objc_msgSend(v5, "aa_altDSID");
  id v13 = +[STLog utility];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412802;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    __int16 v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1DA519000, v13, OS_LOG_TYPE_INFO, "Account DSID %@: %@ %@", (uint8_t *)&v16, 0x20u);
  }

  if (!v11) {
LABEL_9:
  }
    id v11 = &unk_1F349ECC8;
  int v15 = [[STUserDescription alloc] initWithGivenName:v7 familyName:v8 userDSID:v11 userAltDSID:v12];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (NSString)userAltDSID
{
  return self->_userAltDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAltDSID, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

@end