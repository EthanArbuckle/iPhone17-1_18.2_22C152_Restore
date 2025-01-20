@interface PKPassShare
+ (BOOL)supportsSecureCoding;
+ (id)createTaggedShare;
- (BOOL)appendCredentialShareDictionary:(id)a3 entitlements:(id)a4;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalShare;
- (BOOL)isRevokable;
- (BOOL)isSameUnderlyingShareAs:(id)a3;
- (BOOL)mostRestrictiveIntraAccountSharingEnabled;
- (NSArray)credentialShares;
- (NSArray)displayableSharedEntitlements;
- (NSArray)sharedEntitlements;
- (NSDate)creationDate;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)recipientHandle;
- (NSString)recipientNickname;
- (NSString)senderShareIdentifier;
- (NSString)subcredentialIdentifier;
- (NSUUID)uuidIdentifier;
- (PKPassShare)init;
- (PKPassShare)initWithCoder:(id)a3;
- (PKPassShare)initWithDictionary:(id)a3;
- (PKPassShare)initWithSubcredentialDictionary:(id)a3;
- (PKPassShareActivationOptions)activationOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)manageability;
- (unint64_t)mostRestrictiveShareability;
- (unint64_t)status;
- (void)addCredentialShare:(id)a3;
- (void)addCredentialShares:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationOptions:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCredentialShares:(id)a3;
- (void)setDisplayableSharedEntitlements:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setManageability:(unint64_t)a3;
- (void)setRecipientHandle:(id)a3;
- (void)setRecipientNickname:(id)a3;
- (void)setSenderShareIdentifier:(id)a3;
- (void)setSharedEntitlements:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setSubcredentialIdentifier:(id)a3;
- (void)updateDisplayableSharedEntitlementsFromDisplayableEntitlements:(id)a3;
@end

@implementation PKPassShare

+ (id)createTaggedShare
{
  v2 = objc_alloc_init(PKPassShare);
  id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
  v4 = [v3 UUIDString];
  [(PKPassShare *)v2 setIdentifier:v4];

  [(PKPassShare *)v2 setStatus:3];
  return v2;
}

- (PKPassShare)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassShare;
  return [(PKPassShare *)&v3 init];
}

- (PKPassShare)initWithDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_20;
  }
  v35.receiver = self;
  v35.super_class = (Class)PKPassShare;
  self = [(PKPassShare *)&v35 init];
  if (self)
  {
    v5 = [v4 PKStringForKey:@"shareIdentifier"];
    identifier = self->_identifier;
    self->_identifier = v5;

    if (self->_identifier)
    {
      v7 = [v4 PKStringForKey:@"recipient"];
      recipientNickname = self->_recipientNickname;
      self->_recipientNickname = v7;

      v9 = [v4 PKStringForKey:@"sender"];
      senderShareIdentifier = self->_senderShareIdentifier;
      self->_senderShareIdentifier = v9;

      v11 = [v4 PKStringForKey:@"status"];
      self->_status = PKShareStatusFromString(v11);

      v12 = [v4 PKDateForKey:@"creationDate"];
      creationDate = self->_creationDate;
      self->_creationDate = v12;

      int v14 = [v4 PKBoolForKey:@"managementEnabled"];
      unint64_t v15 = 2;
      if (!v14) {
        unint64_t v15 = 0;
      }
      self->_manageability = v15;
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v30 = v4;
      v17 = [v4 PKArrayContaining:objc_opt_class() forKey:@"sharedEntitlements"];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            v23 = [[PKPassSharedEntitlement alloc] initWithDictionary:v22];
            if (v23)
            {
              [v16 addObject:v23];
            }
            else
            {
              v24 = PKLogFacilityTypeGetObject(0x21uLL);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                uint64_t v37 = v22;
                _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "PKPassShare: Unable to create shared entitlement from %{private}@", buf, 0xCu);
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v38 count:16];
        }
        while (v19);
      }
      uint64_t v25 = objc_msgSend(v16, "copy", self);
      self = v29;
      sharedEntitlements = v29->_sharedEntitlements;
      v29->_sharedEntitlements = (NSArray *)v25;

      id v4 = v30;
      goto LABEL_19;
    }
LABEL_20:
    v27 = 0;
    goto LABEL_21;
  }
LABEL_19:
  self = self;
  v27 = self;
LABEL_21:

  return v27;
}

- (PKPassShare)initWithSubcredentialDictionary:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v31.receiver = self;
    v31.super_class = (Class)PKPassShare;
    self = [(PKPassShare *)&v31 init];
    if (!self)
    {
LABEL_26:
      self = self;
      int v14 = self;
      goto LABEL_27;
    }
    v5 = [v4 PKStringForKey:@"groupIdentifier"];
    groupIdentifier = self->_groupIdentifier;
    self->_groupIdentifier = v5;

    objc_storeStrong((id *)&self->_identifier, self->_groupIdentifier);
    if (self->_identifier)
    {
      v7 = [v4 PKStringForKey:@"sharerGroupIdentifier"];
      senderShareIdentifier = self->_senderShareIdentifier;
      self->_senderShareIdentifier = v7;

      v9 = self->_groupIdentifier;
      v10 = self->_senderShareIdentifier;
      v11 = v9;
      if (v10 == v11)
      {
      }
      else
      {
        v12 = v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (v13)
        {

LABEL_15:
LABEL_16:
          id v16 = [v4 PKStringForKey:@"friendlyName"];
          recipientNickname = self->_recipientNickname;
          self->_recipientNickname = v16;

          self->_manageability = [v4 PKBoolForKey:@"managementEnabled"];
          uint64_t v18 = [v4 PKDictionaryForKey:@"entitlement"];
          uint64_t v19 = [[PKPassSharedEntitlement alloc] initWithSubcredentialDictionary:v18];
          uint64_t v20 = v19;
          if (v19)
          {
            v34[0] = v19;
            v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
            p_super = &self->_sharedEntitlements->super;
            self->_sharedEntitlements = v21;
          }
          else
          {
            p_super = PKLogFacilityTypeGetObject(0x21uLL);
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              long long v33 = v18;
              _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "PKPassShare: Unable to create shared entitlement from %{private}@", buf, 0xCu);
            }
          }

          v23 = [v4 PKArrayContaining:objc_opt_class() forKey:@"sharedKeysData"];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __47__PKPassShare_initWithSubcredentialDictionary___block_invoke;
          v29[3] = &unk_1E56DF920;
          self = self;
          id v30 = self;
          objc_msgSend(v23, "pk_arrayBySafelyApplyingBlock:", v29);
          v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
          credentialShares = self->_credentialShares;
          self->_credentialShares = v24;

          v26 = self->_credentialShares;
          if (!v26 || ![(NSArray *)v26 count])
          {

            v27 = PKLogFacilityTypeGetObject(0x21uLL);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              long long v33 = v18;
              _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "PKPassShare: Discarding subcredential share because missing shared key data from %{private}@", buf, 0xCu);
            }

            self = 0;
          }

          goto LABEL_26;
        }
        BOOL v15 = [(NSString *)v10 isEqualToString:v11];

        if (!v15) {
          goto LABEL_16;
        }
      }
      v10 = self->_senderShareIdentifier;
      self->_senderShareIdentifier = (NSString *)@"owner";
      goto LABEL_15;
    }
  }
  int v14 = 0;
LABEL_27:

  return v14;
}

PKPassCredentialShare *__47__PKPassShare_initWithSubcredentialDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  if (v4)
  {
    id v5 = v4;
    v6 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v5;
    id v7 = a2;
  }
  else
  {
    uint64_t v9 = [a2 PKStringForKey:@"sharerKeyID"];
    uint64_t v10 = *(void *)(a1 + 32);
    v6 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = v9;
  }

  v11 = [[PKPassCredentialShare alloc] initWithSubcredentialDictionary:a2];
  return v11;
}

- (BOOL)appendCredentialShareDictionary:(id)a3 entitlements:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  BOOL v9 = 0;
  if (!v6) {
    goto LABEL_31;
  }
  if (!v7) {
    goto LABEL_31;
  }
  char v56 = 0;
  uint64_t v10 = PKShareStatusFromCarKeyIntStatus([v6 PKIntegerForKey:@"status"], &v56);
  BOOL v9 = v56 == 0;
  if (v56) {
    goto LABEL_31;
  }
  uint64_t v47 = v10;
  v11 = [v6 PKDictionaryForKey:@"keyConfiguration"];
  v12 = [v11 PKStringForKey:@"friendlyName"];
  v48 = self;
  [(PKPassShare *)self setRecipientNickname:v12];

  v49 = v11;
  uint64_t v13 = [v11 PKIntegerForKey:@"rights"];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (!v15) {
    goto LABEL_25;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v53;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v53 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      uint64_t v20 = [v19 value];
      uint64_t v21 = [v20 integerValue];

      if (v21 == v13)
      {
        uint64_t v22 = objc_alloc_init(PKPassSharedEntitlement);
        v23 = [v19 identifier];
        [(PKPassSharedEntitlement *)v22 setEntitlementIdentifier:v23];

        v24 = [v49 PKDateForKey:@"keyValidFrom"];
        uint64_t v25 = [v49 PKDateForKey:@"keyValidTo"];
        v26 = (void *)v25;
        if (v24)
        {
          v27 = [MEMORY[0x1E4F1C9C8] now];
          BOOL v28 = [v24 compare:v27] == 1;

          if (v26)
          {
LABEL_15:
            v29 = [MEMORY[0x1E4F1C9C8] distantFuture];
            BOOL v30 = [v26 compare:v29] == -1;

LABEL_18:
            if (v28 || v30)
            {
              objc_super v31 = objc_alloc_init(PKPassShareTimeConfiguration);
              long long v32 = v31;
              if (v28) {
                [(PKPassShareTimeConfiguration *)v31 setStartDate:v24];
              }
              if (v30) {
                [(PKPassShareTimeConfiguration *)v32 setExpirationDate:v26];
              }
              [(PKPassSharedEntitlement *)v22 setTimeConfiguration:v32];
            }
            v57 = v22;
            uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
            sharedEntitlements = v48->_sharedEntitlements;
            v48->_sharedEntitlements = (NSArray *)v33;

            goto LABEL_25;
          }
        }
        else
        {
          BOOL v28 = 0;
          if (v25) {
            goto LABEL_15;
          }
        }
        BOOL v30 = 0;
        goto LABEL_18;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_25:

  objc_super v35 = [v6 PKStringForKey:@"keyID"];
  credentialShares = v48->_credentialShares;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __60__PKPassShare_appendCredentialShareDictionary_entitlements___block_invoke;
  v50[3] = &unk_1E56F4588;
  id v37 = v35;
  id v51 = v37;
  v38 = [(NSArray *)credentialShares pk_firstObjectPassingTest:v50];
  BOOL v9 = 1;
  if (!v38)
  {
    v38 = objc_alloc_init(PKPassCredentialShare);
    [(PKPassCredentialShare *)v38 setIdentifier:v37];
    uint64_t v39 = (void *)[(NSArray *)v48->_credentialShares mutableCopy];
    v40 = v39;
    if (v39) {
      id v41 = v39;
    }
    else {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    v42 = v41;

    [v42 addObject:v38];
    uint64_t v43 = [v42 copy];
    v44 = v48->_credentialShares;
    v48->_credentialShares = (NSArray *)v43;
  }
  v45 = [v6 PKStringForKey:@"deviceType"];
  [(PKPassCredentialShare *)v38 setTargetDevice:PKPassCredentialShareTargetDeviceFromString(v45)];

  [(PKPassCredentialShare *)v38 setStatus:v47];
LABEL_31:

  return v9;
}

uint64_t __60__PKPassShare_appendCredentialShareDictionary_entitlements___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  id v4 = v2;
  id v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {
    uint64_t v8 = 1;
  }
  else
  {
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v4 isEqualToString:v5];
    }
  }

  return v8;
}

- (NSUUID)uuidIdentifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_identifier];
  return (NSUUID *)v2;
}

- (void)addCredentialShare:(id)a3
{
  credentialShares = self->_credentialShares;
  id v5 = a3;
  id v6 = (void *)[(NSArray *)credentialShares mutableCopy];
  BOOL v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v11 = v8;

  [v11 addObject:v5];
  BOOL v9 = (NSArray *)[v11 copy];
  uint64_t v10 = self->_credentialShares;
  self->_credentialShares = v9;
}

- (void)addCredentialShares:(id)a3
{
  credentialShares = self->_credentialShares;
  id v5 = a3;
  id v6 = (void *)[(NSArray *)credentialShares mutableCopy];
  BOOL v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v11 = v8;

  [v11 addObjectsFromArray:v5];
  BOOL v9 = (NSArray *)[v11 copy];
  uint64_t v10 = self->_credentialShares;
  self->_credentialShares = v9;
}

- (void)setStatus:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    self->_status = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_credentialShares;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setStatus:", a3, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (unint64_t)status
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_credentialShares count]) {
    return self->_status;
  }
  uint64_t v3 = [(NSArray *)self->_credentialShares firstObject];
  unint64_t v4 = [v3 status];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_credentialShares;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    if (v4 > 9) {
      uint64_t v8 = 1000;
    }
    else {
      uint64_t v8 = qword_191675738[v4];
    }
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "status", (void)v14);
        if (v11 != v4)
        {
          if (v11 > 9) {
            uint64_t v12 = 1000;
          }
          else {
            uint64_t v12 = qword_191675738[v11];
          }
          if (v12 < v8)
          {
            unint64_t v4 = v11;
            uint64_t v8 = v12;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isSameUnderlyingShareAs:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    identifier = self->_identifier;
    if (identifier)
    {
      uint64_t v7 = [v4 identifier];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        char v9 = [(NSString *)identifier isEqual:v7];

        if (v9) {
          goto LABEL_13;
        }
      }
    }
    if ((recipientHandle = self->_recipientHandle) != 0
      && v5[7]
      && (-[NSString isEqual:](recipientHandle, "isEqual:") & 1) != 0
      || (groupIdentifier = self->_groupIdentifier) != 0
      && ([v5 groupIdentifier], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0)
      && (long long v14 = (void *)v13,
          char v15 = [(NSString *)groupIdentifier isEqual:v13],
          v14,
          (v15 & 1) != 0))
    {
LABEL_13:
      BOOL v10 = 1;
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v16 = self->_credentialShares;
      uint64_t v33 = [(NSArray *)v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v33)
      {
        uint64_t v17 = *(void *)v40;
        long long v34 = v16;
        uint64_t v32 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v40 != v17) {
              objc_enumerationMutation(v16);
            }
            uint64_t v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            uint64_t v20 = [v5 credentialShares];
            uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v36;
              do
              {
                for (uint64_t j = 0; j != v22; ++j)
                {
                  if (*(void *)v36 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                  uint64_t v26 = [v19 identifier];
                  if (v26)
                  {
                    v27 = (void *)v26;
                    uint64_t v28 = [v25 identifier];
                    if (v28)
                    {
                      v29 = (void *)v28;
                      char v30 = [v27 isEqual:v28];

                      if (v30)
                      {

                        BOOL v10 = 1;
                        long long v16 = v34;
                        goto LABEL_35;
                      }
                    }
                    else
                    {
                    }
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v22);
            }

            long long v16 = v34;
            uint64_t v17 = v32;
          }
          BOOL v10 = 0;
          uint64_t v33 = [(NSArray *)v34 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v33);
      }
      else
      {
        BOOL v10 = 0;
      }
LABEL_35:
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)mostRestrictiveShareability
{
  return PKSharedEntitlementsMostRestrictiveShareabilityForEntitlements(self->_sharedEntitlements);
}

- (BOOL)mostRestrictiveIntraAccountSharingEnabled
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_sharedEntitlements;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "intraAccountSharingEnabled", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isLocalShare
{
  return [(NSArray *)self->_credentialShares pk_containsObjectPassingTest:&__block_literal_global_82_0];
}

BOOL __27__PKPassShare_isLocalShare__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)([a2 targetDevice] - 3) < 3;
}

- (BOOL)isRevokable
{
  unint64_t status = self->_status;
  BOOL v3 = status > 9;
  uint64_t v4 = (1 << status) & 0x340;
  return (v3 || v4 == 0) && self->_manageability != 0;
}

- (BOOL)isEditable
{
  unint64_t status = self->_status;
  BOOL v3 = status > 9;
  uint64_t v4 = (1 << status) & 0x340;
  return (v3 || v4 == 0) && self->_manageability > 1;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Cannot set nil identifier on share"];
  }
  identifier = self->_identifier;
  self->_identifier = v4;
}

- (void)updateDisplayableSharedEntitlementsFromDisplayableEntitlements:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = objc_msgSend(a3, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_89_0);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v18 = self;
    uint64_t v6 = self->_sharedEntitlements;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          unint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v12 = [v11 entitlementIdentifier];
          uint64_t v13 = [v4 objectForKeyedSubscript:v12];
          long long v14 = (void *)[v13 copy];

          [v14 replaceEntitlementWithSharedEntitlement:v11];
          [v5 safelyAddObject:v14];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    uint64_t v15 = [v5 copy];
    displayableSharedEntitlements = v18->_displayableSharedEntitlements;
    v18->_displayableSharedEntitlements = (NSArray *)v15;
  }
  else
  {
    uint64_t v17 = self->_displayableSharedEntitlements;
    self->_displayableSharedEntitlements = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

uint64_t __78__PKPassShare_updateDisplayableSharedEntitlementsFromDisplayableEntitlements___block_invoke(uint64_t a1, void *a2)
{
  return [a2 entitlementIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassShare)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PKPassShare;
  id v5 = [(PKPassShare *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    v5->_unint64_t status = [v8 unsignedIntegerValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientNickname"];
    recipientNickname = v5->_recipientNickname;
    v5->_recipientNickname = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderShareIdentifier"];
    senderShareIdentifier = v5->_senderShareIdentifier;
    v5->_senderShareIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manageability"];
    v5->_manageability = [v15 unsignedIntegerValue];

    long long v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"sharedEntitlement"];
    sharedEntitlements = v5->_sharedEntitlements;
    v5->_sharedEntitlements = (NSArray *)v19;

    long long v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"displayableSharedEntitlements"];
    displayableSharedEntitlements = v5->_displayableSharedEntitlements;
    v5->_displayableSharedEntitlements = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v26;

    uint64_t v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    char v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"credentialShares"];
    credentialShares = v5->_credentialShares;
    v5->_credentialShares = (NSArray *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subcredentialIdentifier"];
    subcredentialIdentifier = v5->_subcredentialIdentifier;
    v5->_subcredentialIdentifier = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientHandle"];
    recipientHandle = v5->_recipientHandle;
    v5->_recipientHandle = (NSString *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activationOptions"];
    activationOptions = v5->_activationOptions;
    v5->_activationOptions = (PKPassShareActivationOptions *)v37;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v7 = a3;
  [v7 encodeObject:identifier forKey:@"identifier"];
  id v5 = [NSNumber numberWithUnsignedInteger:self->_status];
  [v7 encodeObject:v5 forKey:@"status"];

  [v7 encodeObject:self->_recipientNickname forKey:@"recipientNickname"];
  [v7 encodeObject:self->_senderShareIdentifier forKey:@"senderShareIdentifier"];
  [v7 encodeObject:self->_creationDate forKey:@"creationDate"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_manageability];
  [v7 encodeObject:v6 forKey:@"manageability"];

  [v7 encodeObject:self->_sharedEntitlements forKey:@"sharedEntitlement"];
  [v7 encodeObject:self->_groupIdentifier forKey:@"groupIdentifier"];
  [v7 encodeObject:self->_displayableSharedEntitlements forKey:@"displayableSharedEntitlements"];
  [v7 encodeObject:self->_credentialShares forKey:@"credentialShares"];
  [v7 encodeObject:self->_subcredentialIdentifier forKey:@"subcredentialIdentifier"];
  [v7 encodeObject:self->_recipientHandle forKey:@"recipientHandle"];
  [v7 encodeObject:self->_activationOptions forKey:@"activationOptions"];
}

- (id)description
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"identifier: '%@'; ", self->_identifier];
  id v7 = PKShareStatusToString([(PKPassShare *)self status]);
  [v6 appendFormat:@"status: '%@'; ", v7];

  [v6 appendFormat:@"recipientNickname: '%@'; ", self->_recipientNickname];
  [v6 appendFormat:@"recipientHandle: '%@'; ", self->_recipientHandle];
  [v6 appendFormat:@"senderShareIdentifier: '%@'; ", self->_senderShareIdentifier];
  [v6 appendFormat:@"creationDate: '%@'; ", self->_creationDate];
  uint64_t v8 = PKPassShareManageabilityToString(self->_manageability);
  [v6 appendFormat:@"manageability: '%@'; ", v8];

  [v6 appendFormat:@"groupIdentifier: '%@'; ", self->_groupIdentifier];
  [v6 appendFormat:@"credentialShares: '%@'; ", self->_credentialShares];
  [v6 appendFormat:@"subcredentialIdentifier: '%@'; ", self->_subcredentialIdentifier];
  [v6 appendFormat:@"activationOptions: '%@'; ", self->_activationOptions];
  [v6 appendFormat:@"\nsharedEntitlement: '%@'\n; ", self->_sharedEntitlements];
  [v6 appendFormat:@">"];
  uint64_t v9 = [NSString stringWithString:v6];

  return v9;
}

- (unint64_t)hash
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_identifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_recipientNickname) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_senderShareIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_creationDate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_sharedEntitlements) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_groupIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_credentialShares) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_subcredentialIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_recipientHandle) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_activationOptions) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_status - v5 + 32 * v5;
  unint64_t v7 = self->_manageability - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassShare *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v6 = v5;
        if (!self)
        {
LABEL_57:

          goto LABEL_58;
        }
        identifier = self->_identifier;
        uint64_t v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
            goto LABEL_56;
          }
        }
        else if (identifier != v8)
        {
          goto LABEL_56;
        }
        unint64_t v9 = [(PKPassShare *)self status];
        if (v9 == [(PKPassShare *)v6 status])
        {
          recipientNickname = self->_recipientNickname;
          uint64_t v11 = v6->_recipientNickname;
          if (recipientNickname && v11)
          {
            if ((-[NSString isEqual:](recipientNickname, "isEqual:") & 1) == 0) {
              goto LABEL_56;
            }
          }
          else if (recipientNickname != v11)
          {
            goto LABEL_56;
          }
          senderShareIdentifier = self->_senderShareIdentifier;
          uint64_t v13 = v6->_senderShareIdentifier;
          if (senderShareIdentifier && v13)
          {
            if ((-[NSString isEqual:](senderShareIdentifier, "isEqual:") & 1) == 0) {
              goto LABEL_56;
            }
          }
          else if (senderShareIdentifier != v13)
          {
            goto LABEL_56;
          }
          creationDate = self->_creationDate;
          uint64_t v15 = v6->_creationDate;
          if (creationDate && v15)
          {
            if ((-[NSDate isEqual:](creationDate, "isEqual:") & 1) == 0) {
              goto LABEL_56;
            }
          }
          else if (creationDate != v15)
          {
            goto LABEL_56;
          }
          if (self->_manageability == v6->_manageability)
          {
            sharedEntitlements = self->_sharedEntitlements;
            uint64_t v17 = v6->_sharedEntitlements;
            if (sharedEntitlements && v17)
            {
              if ((-[NSArray isEqual:](sharedEntitlements, "isEqual:") & 1) == 0) {
                goto LABEL_56;
              }
            }
            else if (sharedEntitlements != v17)
            {
              goto LABEL_56;
            }
            groupIdentifier = self->_groupIdentifier;
            uint64_t v19 = v6->_groupIdentifier;
            if (groupIdentifier && v19)
            {
              if ((-[NSString isEqual:](groupIdentifier, "isEqual:") & 1) == 0) {
                goto LABEL_56;
              }
            }
            else if (groupIdentifier != v19)
            {
              goto LABEL_56;
            }
            credentialShares = self->_credentialShares;
            long long v21 = v6->_credentialShares;
            if (credentialShares && v21)
            {
              if ((-[NSArray isEqual:](credentialShares, "isEqual:") & 1) == 0) {
                goto LABEL_56;
              }
            }
            else if (credentialShares != v21)
            {
              goto LABEL_56;
            }
            subcredentialIdentifier = self->_subcredentialIdentifier;
            uint64_t v23 = v6->_subcredentialIdentifier;
            if (subcredentialIdentifier && v23)
            {
              if ((-[NSString isEqual:](subcredentialIdentifier, "isEqual:") & 1) == 0) {
                goto LABEL_56;
              }
            }
            else if (subcredentialIdentifier != v23)
            {
              goto LABEL_56;
            }
            recipientHandle = self->_recipientHandle;
            uint64_t v25 = v6->_recipientHandle;
            if (recipientHandle && v25)
            {
              if (-[NSString isEqual:](recipientHandle, "isEqual:"))
              {
LABEL_52:
                activationOptions = self->_activationOptions;
                v27 = v6->_activationOptions;
                if (activationOptions && v27) {
                  LOBYTE(self) = -[PKPassShareActivationOptions isEqual:](activationOptions, "isEqual:");
                }
                else {
                  LOBYTE(self) = activationOptions == v27;
                }
                goto LABEL_57;
              }
            }
            else if (recipientHandle == v25)
            {
              goto LABEL_52;
            }
          }
        }
LABEL_56:
        LOBYTE(self) = 0;
        goto LABEL_57;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_58:

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PKPassShare allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_identifier copy];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_recipientNickname copy];
  recipientNickname = v4->_recipientNickname;
  v4->_recipientNickname = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_senderShareIdentifier copy];
  senderShareIdentifier = v4->_senderShareIdentifier;
  v4->_senderShareIdentifier = (NSString *)v9;

  uint64_t v11 = [(NSDate *)self->_creationDate copy];
  creationDate = v4->_creationDate;
  v4->_creationDate = (NSDate *)v11;

  uint64_t v13 = [(NSArray *)self->_sharedEntitlements copy];
  sharedEntitlements = v4->_sharedEntitlements;
  v4->_sharedEntitlements = (NSArray *)v13;

  uint64_t v15 = [(NSString *)self->_groupIdentifier copy];
  groupIdentifier = v4->_groupIdentifier;
  v4->_groupIdentifier = (NSString *)v15;

  v4->_unint64_t status = self->_status;
  v4->_manageability = self->_manageability;
  uint64_t v17 = [(NSArray *)self->_credentialShares copy];
  credentialShares = v4->_credentialShares;
  v4->_credentialShares = (NSArray *)v17;

  uint64_t v19 = [(NSString *)self->_subcredentialIdentifier copy];
  subcredentialIdentifier = v4->_subcredentialIdentifier;
  v4->_subcredentialIdentifier = (NSString *)v19;

  uint64_t v21 = [(NSString *)self->_recipientHandle copy];
  recipientHandle = v4->_recipientHandle;
  v4->_recipientHandle = (NSString *)v21;

  uint64_t v23 = [(PKPassShareActivationOptions *)self->_activationOptions copy];
  activationOptions = v4->_activationOptions;
  v4->_activationOptions = (PKPassShareActivationOptions *)v23;

  uint64_t v25 = [(NSArray *)self->_displayableSharedEntitlements copy];
  displayableSharedEntitlements = v4->_displayableSharedEntitlements;
  v4->_displayableSharedEntitlements = (NSArray *)v25;

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)senderShareIdentifier
{
  return self->_senderShareIdentifier;
}

- (void)setSenderShareIdentifier:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (unint64_t)manageability
{
  return self->_manageability;
}

- (void)setManageability:(unint64_t)a3
{
  self->_manageability = a3;
}

- (NSString)recipientNickname
{
  return self->_recipientNickname;
}

- (void)setRecipientNickname:(id)a3
{
}

- (NSString)recipientHandle
{
  return self->_recipientHandle;
}

- (void)setRecipientHandle:(id)a3
{
}

- (NSArray)sharedEntitlements
{
  return self->_sharedEntitlements;
}

- (void)setSharedEntitlements:(id)a3
{
}

- (NSArray)displayableSharedEntitlements
{
  return self->_displayableSharedEntitlements;
}

- (void)setDisplayableSharedEntitlements:(id)a3
{
}

- (NSArray)credentialShares
{
  return self->_credentialShares;
}

- (void)setCredentialShares:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSString)subcredentialIdentifier
{
  return self->_subcredentialIdentifier;
}

- (void)setSubcredentialIdentifier:(id)a3
{
}

- (PKPassShareActivationOptions)activationOptions
{
  return self->_activationOptions;
}

- (void)setActivationOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationOptions, 0);
  objc_storeStrong((id *)&self->_subcredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialShares, 0);
  objc_storeStrong((id *)&self->_displayableSharedEntitlements, 0);
  objc_storeStrong((id *)&self->_sharedEntitlements, 0);
  objc_storeStrong((id *)&self->_recipientHandle, 0);
  objc_storeStrong((id *)&self->_recipientNickname, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_senderShareIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end