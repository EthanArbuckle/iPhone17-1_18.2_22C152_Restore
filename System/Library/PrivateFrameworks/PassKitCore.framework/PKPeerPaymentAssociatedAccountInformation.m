@interface PKPeerPaymentAssociatedAccountInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isAssociatedAccountStateDirty;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastUpdated;
- (NSSet)associatedAccountInvitations;
- (NSSet)associatedAccountRemovalRecords;
- (NSSet)associatedAccounts;
- (PKPeerPaymentAssociatedAccountInformation)initWithCoder:(id)a3;
- (PKPeerPaymentAssociatedAccountInformation)initWithDictionary:(id)a3 lastUpdated:(id)a4;
- (double)proactiveAssociatedAccountFetchPeriod;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAccountInvitationsUsingBlock:(id)a3;
- (void)enumerateAssociatedAccountsUsingBlock:(id)a3;
- (void)markAssociatedAccountActiveWithAltDSID:(id)a3 hasPresentedNotification:(BOOL)a4;
- (void)markAssociatedAccountRemovalRecordWithAltDSID:(id)a3 hasPresentedNotification:(BOOL)a4;
- (void)setAssociatedAccountInvitations:(id)a3;
- (void)setAssociatedAccountRemovalRecords:(id)a3;
- (void)setAssociatedAccountStateDirty:(BOOL)a3;
- (void)setAssociatedAccounts:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setProactiveAssociatedAccountFetchPeriod:(double)a3;
@end

@implementation PKPeerPaymentAssociatedAccountInformation

- (PKPeerPaymentAssociatedAccountInformation)initWithDictionary:(id)a3 lastUpdated:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)PKPeerPaymentAssociatedAccountInformation;
  v8 = [(PKPeerPaymentAssociatedAccountInformation *)&v53 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lastUpdated, a4);
    [v6 PKDoubleForKey:@"proactiveAssociatedAccountFetchPeriod"];
    v9->_proactiveAssociatedAccountFetchPeriod = v10;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v12 = [v6 PKArrayContaining:objc_opt_class() forKey:@"associatedAccounts"];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v50 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[PKPeerPaymentAccount alloc] initWithDictionary:*(void *)(*((void *)&v49 + 1) + 8 * i) lastUpdated:v7];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [v11 copy];
    associatedAccounts = v9->_associatedAccounts;
    v9->_associatedAccounts = (NSSet *)v18;

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v40 = v6;
    v21 = [v6 PKArrayContaining:objc_opt_class() forKey:@"associatedAccountInvitations"];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [[PKPeerPaymentAccountInvitation alloc] initWithDictionary:*(void *)(*((void *)&v45 + 1) + 8 * j)];
          if (v26) {
            [v20 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v23);
    }

    uint64_t v27 = [v20 copy];
    associatedAccountInvitations = v9->_associatedAccountInvitations;
    v39 = v9;
    v9->_associatedAccountInvitations = (NSSet *)v27;

    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v30 = [v6 PKArrayContaining:objc_opt_class() forKey:@"previousAssociatedAccounts"];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v42 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [[PKPeerPaymentAssociatedAccountRemovalRecord alloc] initWithDictionary:*(void *)(*((void *)&v41 + 1) + 8 * k)];
          if (v35) {
            [v29 addObject:v35];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v32);
    }

    uint64_t v36 = [v29 copy];
    v9 = v39;
    associatedAccountRemovalRecords = v39->_associatedAccountRemovalRecords;
    v39->_associatedAccountRemovalRecords = (NSSet *)v36;

    id v6 = v40;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAssociatedAccountInformation)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPeerPaymentAssociatedAccountInformation;
  v5 = [(PKPeerPaymentAssociatedAccountInformation *)&v25 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"associatedAccounts"];
    associatedAccounts = v5->_associatedAccounts;
    v5->_associatedAccounts = (NSSet *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    uint64_t v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"associatedAccountInvitations"];
    associatedAccountInvitations = v5->_associatedAccountInvitations;
    v5->_associatedAccountInvitations = (NSSet *)v14;

    [v4 decodeDoubleForKey:@"proactiveAssociatedAccountFetchPeriod"];
    v5->_proactiveAssociatedAccountFetchPeriod = v16;
    v17 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v19 = [v17 setWithArray:v18];
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"associatedAccountRemovalRecords"];
    associatedAccountRemovalRecords = v5->_associatedAccountRemovalRecords;
    v5->_associatedAccountRemovalRecords = (NSSet *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v22;

    v5->_associatedAccountStateDirty = [v4 decodeBoolForKey:@"associatedAccountStateDirty"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  associatedAccounts = self->_associatedAccounts;
  id v5 = a3;
  [v5 encodeObject:associatedAccounts forKey:@"associatedAccounts"];
  [v5 encodeObject:self->_associatedAccountInvitations forKey:@"associatedAccountInvitations"];
  [v5 encodeDouble:@"proactiveAssociatedAccountFetchPeriod" forKey:self->_proactiveAssociatedAccountFetchPeriod];
  [v5 encodeObject:self->_associatedAccountRemovalRecords forKey:@"associatedAccountRemovalRecords"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
  [v5 encodeBool:self->_associatedAccountStateDirty forKey:@"associatedAccountStateDirty"];
}

- (void)markAssociatedAccountRemovalRecordWithAltDSID:(id)a3 hasPresentedNotification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = self->_associatedAccountRemovalRecords;
  uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "altDSID", (void)v17);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v14 = v6;
        uint64_t v15 = v14;
        if (v13 == v14)
        {

LABEL_16:
          [v12 setHasPresentedNotification:v4];
          goto LABEL_17;
        }
        if (v6 && v13)
        {
          int v16 = [v13 isEqualToString:v14];

          if (v16) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (void)markAssociatedAccountActiveWithAltDSID:(id)a3 hasPresentedNotification:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_associatedAccounts;
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "altDSID", (void)v16);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v13 = v5;
        id v14 = v13;
        if (v12 == v13)
        {

LABEL_16:
          [v11 setHasDisplayedAssociatedAccountActiveNotification:1];
          goto LABEL_17;
        }
        if (v5 && v12)
        {
          int v15 = [v12 isEqualToString:v13];

          if (v15) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (void)enumerateAssociatedAccountsUsingBlock:(id)a3
{
}

- (void)enumerateAccountInvitationsUsingBlock:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (double *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_24;
  }
  associatedAccounts = self->_associatedAccounts;
  id v6 = (NSSet *)*((void *)v4 + 2);
  if (associatedAccounts && v6)
  {
    if ((-[NSSet isEqual:](associatedAccounts, "isEqual:") & 1) == 0) {
      goto LABEL_24;
    }
  }
  else if (associatedAccounts != v6)
  {
    goto LABEL_24;
  }
  associatedAccountInvitations = self->_associatedAccountInvitations;
  uint64_t v8 = (NSSet *)*((void *)v4 + 3);
  if (associatedAccountInvitations && v8)
  {
    if ((-[NSSet isEqual:](associatedAccountInvitations, "isEqual:") & 1) == 0) {
      goto LABEL_24;
    }
  }
  else if (associatedAccountInvitations != v8)
  {
    goto LABEL_24;
  }
  lastUpdated = self->_lastUpdated;
  uint64_t v10 = (NSDate *)*((void *)v4 + 6);
  if (lastUpdated && v10)
  {
    if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0) {
      goto LABEL_24;
    }
  }
  else if (lastUpdated != v10)
  {
    goto LABEL_24;
  }
  associatedAccountRemovalRecords = self->_associatedAccountRemovalRecords;
  id v12 = (NSSet *)*((void *)v4 + 4);
  if (!associatedAccountRemovalRecords || !v12)
  {
    if (associatedAccountRemovalRecords == v12) {
      goto LABEL_22;
    }
LABEL_24:
    BOOL v13 = 0;
    goto LABEL_25;
  }
  if ((-[NSSet isEqual:](associatedAccountRemovalRecords, "isEqual:") & 1) == 0) {
    goto LABEL_24;
  }
LABEL_22:
  if (self->_proactiveAssociatedAccountFetchPeriod != v4[5]) {
    goto LABEL_24;
  }
  BOOL v13 = self->_associatedAccountStateDirty == *((unsigned __int8 *)v4 + 8);
LABEL_25:

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_lastUpdated];
  [v3 safelyAddObject:self->_associatedAccounts];
  [v3 safelyAddObject:self->_associatedAccountInvitations];
  [v3 safelyAddObject:self->_associatedAccountRemovalRecords];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = (unint64_t)self->_proactiveAssociatedAccountFetchPeriod - v4 + 32 * v4;
  unint64_t v6 = self->_associatedAccountStateDirty - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"associatedAccounts: '%@'; ", self->_associatedAccounts];
  [v3 appendFormat:@"associatedAccountInvitations: '%@'; ", self->_associatedAccountInvitations];
  objc_msgSend(v3, "appendFormat:", @"associatedAccountRemovalRecords: '%@'; ",
    self->_associatedAccountRemovalRecords);
  [v3 appendFormat:@"lastAssociatedAccountUpdated: '%@'; ", self->_lastUpdated];
  if (self->_associatedAccountStateDirty) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  [v3 appendFormat:@"associatedAccountStateDirty: '%@'; ", v4];
  unint64_t v5 = (void *)[v3 copy];

  return v5;
}

- (NSSet)associatedAccounts
{
  return self->_associatedAccounts;
}

- (void)setAssociatedAccounts:(id)a3
{
}

- (NSSet)associatedAccountInvitations
{
  return self->_associatedAccountInvitations;
}

- (void)setAssociatedAccountInvitations:(id)a3
{
}

- (NSSet)associatedAccountRemovalRecords
{
  return self->_associatedAccountRemovalRecords;
}

- (void)setAssociatedAccountRemovalRecords:(id)a3
{
}

- (double)proactiveAssociatedAccountFetchPeriod
{
  return self->_proactiveAssociatedAccountFetchPeriod;
}

- (void)setProactiveAssociatedAccountFetchPeriod:(double)a3
{
  self->_proactiveAssociatedAccountFetchPeriod = a3;
}

- (BOOL)isAssociatedAccountStateDirty
{
  return self->_associatedAccountStateDirty;
}

- (void)setAssociatedAccountStateDirty:(BOOL)a3
{
  self->_associatedAccountStateDirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_associatedAccountRemovalRecords, 0);
  objc_storeStrong((id *)&self->_associatedAccountInvitations, 0);
  objc_storeStrong((id *)&self->_associatedAccounts, 0);
}

@end