@interface ICAgeVerificationState
+ (id)_stateFromDictionaryRepresentation:(id)a3 DSID:(id)a4;
+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3;
+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3 withError:(id)a4;
+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3 withTreatment:(int64_t)a4;
+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3 withTreatment:(int64_t)a4 verificationURL:(id)a5;
+ (id)cachedStateForDSID:(id)a3;
- (BOOL)isDynamic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContentAllowed;
- (ICAgeVerificationState)initWithUserIdentity:(id)a3 ageVerifier:(id)a4 treatment:(int64_t)a5 verificationURL:(id)a6;
- (ICAgeVerifier)ageVerifier;
- (ICUserIdentity)userIdentity;
- (NSError)error;
- (NSURL)verificationURL;
- (id)_dictionaryRepresentationWithDSID:(id)a3;
- (id)_initWithUserIdentity:(id)a3 status:(int64_t)a4 treatment:(int64_t)a5 verificationURL:(id)a6 error:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)status;
- (int64_t)treatment;
- (void)saveToUserDefaults;
@end

@implementation ICAgeVerificationState

+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() ageVerificationStateNotRequiredForUserIdentity:v3 withTreatment:0];

  return v4;
}

+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3 withTreatment:(int64_t)a4
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() ageVerificationStateNotRequiredForUserIdentity:v5 withTreatment:a4 verificationURL:0];

  return v6;
}

+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3 withTreatment:(int64_t)a4 verificationURL:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [[ICAgeVerificationState alloc] _initWithUserIdentity:v8 status:1 treatment:a4 verificationURL:v7 error:0];

  return v9;
}

- (id)_initWithUserIdentity:(id)a3 status:(int64_t)a4 treatment:(int64_t)a5 verificationURL:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ICAgeVerificationState;
  v15 = [(ICAgeVerificationState *)&v24 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    userIdentity = v15->_userIdentity;
    v15->_userIdentity = (ICUserIdentity *)v16;

    v15->_status = a4;
    ageVerifier = v15->_ageVerifier;
    v15->_ageVerifier = 0;

    v15->_treatment = a5;
    uint64_t v19 = [v13 copy];
    verificationURL = v15->_verificationURL;
    v15->_verificationURL = (NSURL *)v19;

    uint64_t v21 = [v14 copy];
    error = v15->_error;
    v15->_error = (NSError *)v21;
  }
  return v15;
}

- (void)saveToUserDefaults
{
  id v3 = [(ICAgeVerificationState *)self userIdentity];
  v4 = [v3 DSID];
  id v20 = [v4 stringValue];

  if (!v20)
  {
    id v5 = +[ICUserIdentityStore defaultIdentityStore];
    v6 = [(ICAgeVerificationState *)self userIdentity];
    id v7 = [v5 DSIDForUserIdentity:v6 outError:0];
    id v8 = [v7 stringValue];
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)[@"NoDSID" copy];
    }
    id v20 = v10;
  }
  v11 = +[ICDefaults standardDefaults];
  id v12 = [v11 lastKnownUserAgeVerificationState];
  id v13 = (void *)[v12 mutableCopy];
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v16 = v15;

  v17 = [(ICAgeVerificationState *)self _dictionaryRepresentationWithDSID:v20];
  [v16 setObject:v17 forKeyedSubscript:v20];

  v18 = (void *)[v16 copy];
  uint64_t v19 = +[ICDefaults standardDefaults];
  [v19 setLastKnownUserAgeVerificationState:v18];
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (ICAgeVerificationState *)a3;
  if (v5 == self)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      uint64_t v7 = [(ICAgeVerificationState *)v6 ageVerifier];
      if (v7
        && (id v8 = (void *)v7,
            [(ICAgeVerificationState *)self ageVerifier],
            id v9 = objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9))
      {
        uint64_t v10 = [(ICAgeVerificationState *)v6 treatment];
        if (v10 == [(ICAgeVerificationState *)self treatment])
        {
          v11 = [(ICAgeVerificationState *)v6 ageVerifier];
          id v12 = [(ICAgeVerificationState *)self ageVerifier];
          if (![v11 isEqual:v12])
          {
            char v16 = 0;
LABEL_29:

            goto LABEL_30;
          }
          id v13 = [(ICAgeVerificationState *)v6 verificationURL];
          id v3 = [(ICAgeVerificationState *)self verificationURL];
          if (v13 != v3)
          {
            id v14 = [(ICAgeVerificationState *)v6 verificationURL];
            id v15 = [(ICAgeVerificationState *)self verificationURL];
            if (![v14 isEqual:v15])
            {
              char v16 = 0;
LABEL_27:

LABEL_28:
              goto LABEL_29;
            }
            v36 = v15;
            v37 = v14;
          }
          uint64_t v21 = [(ICAgeVerificationState *)v6 error];
          uint64_t v22 = [(ICAgeVerificationState *)self error];
          if (v21 == (void *)v22)
          {

            char v16 = 1;
            BOOL v27 = v13 == v3;
          }
          else
          {
            v23 = (void *)v22;
            [(ICAgeVerificationState *)v6 error];
            objc_super v24 = v35 = v3;
            [(ICAgeVerificationState *)self error];
            v26 = v25 = v13;
            char v16 = [v24 isEqual:v26];

            id v13 = v25;
            id v3 = v35;

            BOOL v27 = v25 == v35;
          }
          id v15 = v36;
          id v14 = v37;
          if (v27) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v17 = [(ICAgeVerificationState *)v6 ageVerifier];
        if (v17)
        {
          v11 = (void *)v17;
          char v16 = 0;
LABEL_30:

          goto LABEL_31;
        }
        v18 = [(ICAgeVerificationState *)self ageVerifier];

        if (!v18)
        {
          uint64_t v19 = [(ICAgeVerificationState *)v6 status];
          if (v19 == [(ICAgeVerificationState *)self status])
          {
            uint64_t v20 = [(ICAgeVerificationState *)v6 treatment];
            if (v20 == [(ICAgeVerificationState *)self treatment])
            {
              v11 = [(ICAgeVerificationState *)v6 verificationURL];
              id v12 = [(ICAgeVerificationState *)self verificationURL];
              if (v11 != v12)
              {
                id v13 = [(ICAgeVerificationState *)v6 verificationURL];
                id v3 = [(ICAgeVerificationState *)self verificationURL];
                if (![v13 isEqual:v3])
                {
                  char v16 = 0;
                  goto LABEL_28;
                }
                v37 = v13;
              }
              v29 = [(ICAgeVerificationState *)v6 error];
              uint64_t v30 = [(ICAgeVerificationState *)self error];
              if (v29 == (void *)v30)
              {

                char v16 = 1;
              }
              else
              {
                v31 = (void *)v30;
                [(ICAgeVerificationState *)v6 error];
                v33 = v32 = v3;
                v34 = [(ICAgeVerificationState *)self error];
                char v16 = [v33 isEqual:v34];

                id v3 = v32;
              }
              id v13 = v37;
              if (v11 == v12) {
                goto LABEL_29;
              }
              goto LABEL_28;
            }
          }
        }
      }
      char v16 = 0;
LABEL_31:

      goto LABEL_32;
    }
    char v16 = 0;
  }
LABEL_32:

  return v16;
}

- (id)_dictionaryRepresentationWithDSID:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:v5 forKeyedSubscript:@"ICAgeVerificationStateKeyDSID"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICAgeVerificationState status](self, "status"));
  [v6 setObject:v7 forKeyedSubscript:@"ICAgeVerificationStateKeyStatus"];

  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICAgeVerificationState treatment](self, "treatment"));
  [v6 setObject:v8 forKeyedSubscript:@"ICAgeVerificationStateKeyTreatment"];

  id v9 = [(ICAgeVerificationState *)self verificationURL];
  uint64_t v10 = [v9 absoluteString];

  if (v10)
  {
    v11 = [(ICAgeVerificationState *)self verificationURL];
    id v12 = [v11 absoluteString];
    [v6 setObject:v12 forKeyedSubscript:@"ICAgeVerificationStateKeyVerificationURL"];
  }
  id v13 = [(ICAgeVerificationState *)self ageVerifier];
  id v14 = [v13 verificationExpirationDate];

  if (v14)
  {
    id v15 = [(ICAgeVerificationState *)self ageVerifier];
    char v16 = [v15 verificationExpirationDate];
    [v6 setObject:v16 forKeyedSubscript:@"ICAgeVerificationStateKeyAgeVerifierExpirationDate"];
  }
  uint64_t v17 = (void *)[v6 copy];

  return v17;
}

- (id)description
{
  id v3 = NSString;
  BOOL v4 = [(ICAgeVerificationState *)self isExplicitContentAllowed];
  unint64_t v5 = [(ICAgeVerificationState *)self status] - 1;
  if (v5 > 2) {
    id v6 = @"Age verification status unknown";
  }
  else {
    id v6 = off_1E5AC9210[v5];
  }
  int64_t v7 = [(ICAgeVerificationState *)self treatment];
  id v8 = [(ICAgeVerificationState *)self verificationURL];
  id v9 = [(ICAgeVerificationState *)self ageVerifier];
  uint64_t v10 = [(ICAgeVerificationState *)self error];
  v11 = [v3 stringWithFormat:@"ICAgeVerificationState %p - explicit content allowed: %u - status: %@ - treatment: %ld - url: %@ - verifier: %@ - error: %@", self, v4, v6, v7, v8, v9, v10];

  return v11;
}

- (int64_t)status
{
  id v3 = [(ICAgeVerificationState *)self ageVerifier];

  if (v3)
  {
    BOOL v4 = [(ICAgeVerificationState *)self ageVerifier];
    [v4 runAgeVerification];

    unint64_t v5 = [(ICAgeVerificationState *)self ageVerifier];
    self->_status = [v5 status];
    p_status = &self->_status;
  }
  else
  {
    p_status = &self->_status;
  }
  return *p_status;
}

- (ICAgeVerifier)ageVerifier
{
  return self->_ageVerifier;
}

- (int64_t)treatment
{
  return self->_treatment;
}

- (NSURL)verificationURL
{
  return self->_verificationURL;
}

- (BOOL)isExplicitContentAllowed
{
  return ([(ICAgeVerificationState *)self status] & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageVerifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_verificationURL, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v5[3] = [(ICAgeVerificationState *)self treatment];
    id v6 = [(ICAgeVerificationState *)self verificationURL];
    uint64_t v7 = [v6 copyWithZone:a3];
    id v8 = (void *)v5[4];
    v5[4] = v7;

    id v9 = [(ICAgeVerificationState *)self error];
    uint64_t v10 = [v9 copyWithZone:a3];
    v11 = (void *)v5[5];
    v5[5] = v10;

    id v12 = [(ICAgeVerificationState *)self ageVerifier];
    uint64_t v13 = [v12 copyWithZone:a3];
    id v14 = (void *)v5[6];
    v5[6] = v13;

    id v15 = [(ICAgeVerificationState *)self ageVerifier];

    if (!v15) {
      v5[1] = [(ICAgeVerificationState *)self status];
    }
  }
  return v5;
}

- (BOOL)isDynamic
{
  v2 = [(ICAgeVerificationState *)self ageVerifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (ICAgeVerificationState)initWithUserIdentity:(id)a3 ageVerifier:(id)a4 treatment:(int64_t)a5 verificationURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICAgeVerificationState;
  uint64_t v13 = [(ICAgeVerificationState *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    userIdentity = v13->_userIdentity;
    v13->_userIdentity = (ICUserIdentity *)v14;

    v13->_status = 0;
    objc_storeStrong((id *)&v13->_ageVerifier, a4);
    v13->_treatment = a5;
    uint64_t v16 = [v12 copy];
    verificationURL = v13->_verificationURL;
    v13->_verificationURL = (NSURL *)v16;
  }
  return v13;
}

+ (id)_stateFromDictionaryRepresentation:(id)a3 DSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyDSID"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, a1, @"ICAgeVerificationState.m", 198, @"Invalid parameter not satisfying: %@", @"[dictionaryRepresentation[ICAgeVerificationStateKeyDSID] isKindOfClass:[NSString class]]" object file lineNumber description];
  }
  id v11 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyStatus"];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) == 0)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, a1, @"ICAgeVerificationState.m", 199, @"Invalid parameter not satisfying: %@", @"[dictionaryRepresentation[ICAgeVerificationStateKeyStatus] isKindOfClass:[NSNumber class]]" object file lineNumber description];
  }
  uint64_t v13 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyTreatment"];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) == 0)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, a1, @"ICAgeVerificationState.m", 200, @"Invalid parameter not satisfying: %@", @"[dictionaryRepresentation[ICAgeVerificationStateKeyTreatment] isKindOfClass:[NSNumber class]]" object file lineNumber description];
  }
  id v15 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyVerificationURL"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyVerificationURL"];

    if (!v16) {
      goto LABEL_11;
    }
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"ICAgeVerificationState.m", 201, @"Invalid parameter not satisfying: %@", @"[dictionaryRepresentation[ICAgeVerificationStateKeyVerificationURL] isKindOfClass:[NSString class]] || !dictionaryRepresentation[ICAgeVerificationStateKeyVerificationURL]" object file lineNumber description];
  }

LABEL_11:
  uint64_t v17 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyAgeVerifierExpirationDate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyAgeVerifierExpirationDate"];

    if (!v18) {
      goto LABEL_15;
    }
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"ICAgeVerificationState.m", 202, @"Invalid parameter not satisfying: %@", @"[dictionaryRepresentation[ICAgeVerificationStateKeyAgeVerifierExpirationDate] isKindOfClass:[NSDate class]] || !dictionaryRepresentation[ICAgeVerificationStateKeyAgeVerifierExpirationDate]" object file lineNumber description];
  }

LABEL_15:
  objc_super v19 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyTreatment"];
  uint64_t v20 = [v19 integerValue];

  uint64_t v21 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyVerificationURL"];
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if (v22)
  {
    v23 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyVerificationURL"];
    objc_super v24 = [MEMORY[0x1E4F1CB10] URLWithString:v23];
  }
  else
  {
    objc_super v24 = 0;
  }
  v25 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyAgeVerifierExpirationDate"];
  objc_opt_class();
  char v26 = objc_opt_isKindOfClass();

  if (v26)
  {
    BOOL v27 = [ICAgeVerifier alloc];
    v28 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyAgeVerifierExpirationDate"];
    v29 = [(ICAgeVerifier *)v27 initWithExpirationDate:v28];
  }
  else
  {
    v29 = 0;
  }
  uint64_t v30 = (void *)[@"NoDSID" copy];
  if ([v8 isEqualToString:v30])
  {
    v31 = 0;
  }
  else
  {
    v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
    v31 = +[ICUserIdentity specificAccountWithDSID:v32];
  }
  if (v29)
  {
    uint64_t v33 = [objc_alloc((Class)a1) initWithUserIdentity:v31 ageVerifier:v29 treatment:v20 verificationURL:v24];
  }
  else
  {
    v34 = [v7 objectForKeyedSubscript:@"ICAgeVerificationStateKeyStatus"];
    uint64_t v35 = [v34 integerValue];

    uint64_t v33 = [objc_alloc((Class)a1) _initWithUserIdentity:v31 status:v35 treatment:v20 verificationURL:v24 error:0];
  }
  v36 = (void *)v33;

  return v36;
}

+ (id)cachedStateForDSID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (__CFString *)a3;
  unint64_t v5 = +[ICDefaults standardDefaults];
  id v6 = [v5 lastKnownUserAgeVerificationState];
  id v7 = v6;
  if (v4) {
    id v8 = v4;
  }
  else {
    id v8 = @"NoDSID";
  }
  id v9 = [v6 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationState - cachedStateForDSID: - Reading state from disk - DSID=%@", (uint8_t *)&v17, 0xCu);
    }

    id v11 = [a1 _stateFromDictionaryRepresentation:v9 DSID:v4];
  }
  else if (v4 && [(__CFString *)v4 integerValue] >= 1)
  {
    char v12 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationState - cachedStateForDSID: - Creating default state [No cache found] - DSID=%@", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[__CFString integerValue](v4, "integerValue"));
    char v14 = +[ICUserIdentity specificAccountWithDSID:v13];
    id v11 = [a1 ageVerificationStateNotRequiredForUserIdentity:v14];
  }
  else
  {
    id v15 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationState - cachedStateForDSID: - No cached state [Unactionable DSID] - DSID=%@", (uint8_t *)&v17, 0xCu);
    }

    id v11 = 0;
  }

  return v11;
}

+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3 withError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ICAgeVerificationState alloc] _initWithUserIdentity:v6 status:1 treatment:0 verificationURL:0 error:v5];

  return v7;
}

@end