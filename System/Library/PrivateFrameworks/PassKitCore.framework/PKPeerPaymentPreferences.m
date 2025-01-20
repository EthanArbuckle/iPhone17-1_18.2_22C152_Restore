@interface PKPeerPaymentPreferences
+ (BOOL)supportsSecureCoding;
- (BOOL)canReceiveFormalPaymentRequests;
- (BOOL)isDirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPreferences:(id)a3;
- (BOOL)isOutOfDate;
- (BOOL)requiresConfirmation;
- (NSDate)lastUpdated;
- (NSSet)notifications;
- (NSSet)restrictions;
- (PKPeerPaymentPreferences)initWithCoder:(id)a3;
- (PKPeerPaymentPreferences)initWithDictionary:(id)a3;
- (PKPeerPaymentPreferences)initWithDictionary:(id)a3 lastUpdated:(id)a4;
- (PKPeerPaymentPreferencesProfileAppearance)profileAppearance;
- (double)proactiveFetchPeriod;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)notificationWithType:(unint64_t)a3 altDSID:(id)a4;
- (id)restrictionsForAltDSID:(id)a3;
- (id)sendRestrictionWithType:(unint64_t)a3 altDSID:(id)a4;
- (unint64_t)hash;
- (void)addReceiveRestrictionType:(unint64_t)a3 altDSID:(id)a4;
- (void)addSendRestrictionType:(unint64_t)a3 altDSID:(id)a4;
- (void)didUpdateNotification:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCanReceiveFormalPaymentRequests:(BOOL)a3;
- (void)setDirty:(BOOL)a3;
- (void)setLastUpdated:(id)a3;
- (void)setNotifications:(id)a3;
- (void)setProactiveFetchPeriod:(double)a3;
- (void)setProfileAppearance:(id)a3;
- (void)setRequiresConfirmation:(BOOL)a3;
- (void)setRestrictions:(id)a3;
@end

@implementation PKPeerPaymentPreferences

- (PKPeerPaymentPreferences)initWithDictionary:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  v7 = [(PKPeerPaymentPreferences *)self initWithDictionary:v5 lastUpdated:v6];

  return v7;
}

- (PKPeerPaymentPreferences)initWithDictionary:(id)a3 lastUpdated:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)PKPeerPaymentPreferences;
  v8 = [(PKPeerPaymentPreferences *)&v41 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lastUpdated, a4);
    v9->_requiresConfirmation = [v6 PKBoolForKey:@"requiresConfirmation"];
    v9->_canReceiveFormalPaymentRequests = [v6 PKBoolForKey:@"canReceiveFormalPaymentRequests"];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v11 = [v6 PKArrayContaining:objc_opt_class() forKey:@"notifications"];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [[PKPeerPaymentPreferencesNotification alloc] initWithDictionary:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          if (v16) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [v10 copy];
    notifications = v9->_notifications;
    v9->_notifications = (NSSet *)v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v20 = [v6 PKArrayContaining:objc_opt_class() forKey:@"restrictions"];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [[PKPeerPaymentPreferencesRestriction alloc] initWithDictionary:*(void *)(*((void *)&v33 + 1) + 8 * j)];
          if (v25) {
            [v19 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v22);
    }

    uint64_t v26 = [v19 copy];
    restrictions = v9->_restrictions;
    v9->_restrictions = (NSSet *)v26;

    v28 = [v6 PKDictionaryForKey:@"profileAppearance"];
    if (v28)
    {
      v29 = [[PKPeerPaymentPreferencesProfileAppearance alloc] initWithDictionary:v28];
      profileAppearance = v9->_profileAppearance;
      v9->_profileAppearance = v29;
    }
    [v6 PKDoubleForKey:@"proactivePreferencesFetchPeriod"];
    v9->_proactiveFetchPeriod = v31;
  }
  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithBool:self->_requiresConfirmation];
  [v3 setObject:v4 forKey:@"requiresConfirmation"];

  id v5 = [NSNumber numberWithBool:self->_canReceiveFormalPaymentRequests];
  [v3 setObject:v5 forKey:@"canReceiveFormalPaymentRequests"];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = self->_notifications;
  uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
        [v6 safelyAddObject:v12];
      }
      uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }

  [v3 setObject:v6 forKey:@"notifications"];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v14 = self->_restrictions;
  uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
        [v13 safelyAddObject:v19];
      }
      uint64_t v16 = [(NSSet *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }

  [v3 setObject:v13 forKey:@"restrictions"];
  v20 = [(PKPeerPaymentPreferencesProfileAppearance *)self->_profileAppearance dictionaryRepresentation];
  if (v20) {
    [v3 setObject:v20 forKey:@"profileAppearance"];
  }
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithDouble:", self->_proactiveFetchPeriod, (void)v24);
  [v3 setObject:v21 forKey:@"proactivePreferencesFetchPeriod"];

  uint64_t v22 = (void *)[v3 copy];
  return v22;
}

- (BOOL)isOutOfDate
{
  if (!self->_lastUpdated) {
    return 1;
  }
  if (self->_proactiveFetchPeriod <= 0.0) {
    double proactiveFetchPeriod = *(double *)&PKPeerPaymentPreferencesDefaultProactiveFetchPeriod;
  }
  else {
    double proactiveFetchPeriod = self->_proactiveFetchPeriod;
  }
  v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:self->_lastUpdated];
  BOOL v6 = v5 >= proactiveFetchPeriod;

  return v6;
}

- (id)sendRestrictionWithType:(unint64_t)a3 altDSID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = self->_restrictions;
  uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "sendRestrictionType", (void)v19) == a3)
        {
          id v13 = [v12 altDSID];
          id v14 = v6;
          uint64_t v15 = v14;
          if (v13 == v14)
          {

LABEL_17:
            id v17 = v12;
            goto LABEL_18;
          }
          if (v6 && v13)
          {
            int v16 = [v13 isEqualToString:v14];

            if (v16) {
              goto LABEL_17;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v17 = 0;
LABEL_18:

  return v17;
}

- (id)restrictionsForAltDSID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = self->_restrictions;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "altDSID", (void)v15);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = v4;
        uint64_t v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          int v13 = [v10 isEqualToString:v11];

          if (v13) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

- (id)notificationWithType:(unint64_t)a3 altDSID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_notifications;
  uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8)
  {
LABEL_15:

    goto LABEL_18;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v20;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v20 != v10) {
      objc_enumerationMutation(v7);
    }
    uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
    if (objc_msgSend(v12, "notificationType", (void)v19) != a3) {
      goto LABEL_13;
    }
    id v13 = [v12 altDSID];
    id v14 = v6;
    long long v15 = v14;
    if (v13 == v14) {
      break;
    }
    if (v6 && v13)
    {
      char v16 = [v13 isEqualToString:v14];

      if (v16) {
        goto LABEL_17;
      }
    }
    else
    {
    }
LABEL_13:
    if (v9 == ++v11)
    {
      uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        goto LABEL_3;
      }
      goto LABEL_15;
    }
  }

LABEL_17:
  long long v17 = v12;

  if (v17) {
    goto LABEL_19;
  }
LABEL_18:
  long long v17 = objc_alloc_init(PKPeerPaymentPreferencesNotification);
  [(PKPeerPaymentPreferencesNotification *)v17 setAltDSID:v6];
  [(PKPeerPaymentPreferencesNotification *)v17 setNotificationType:a3];
LABEL_19:

  return v17;
}

- (void)addSendRestrictionType:(unint64_t)a3 altDSID:(id)a4
{
  id v12 = a4;
  id v6 = -[PKPeerPaymentPreferences restrictionsForAltDSID:](self, "restrictionsForAltDSID:");
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 setSendRestrictionType:a3];
  }
  else
  {
    uint64_t v8 = objc_alloc_init(PKPeerPaymentPreferencesRestriction);
    [(PKPeerPaymentPreferencesRestriction *)v8 setSendRestrictionType:a3];
    [(PKPeerPaymentPreferencesRestriction *)v8 setAltDSID:v12];
    uint64_t v9 = (void *)[(NSSet *)self->_restrictions mutableCopy];
    [v9 addObject:v8];
    uint64_t v10 = (NSSet *)[v9 copy];
    restrictions = self->_restrictions;
    self->_restrictions = v10;
  }
}

- (void)addReceiveRestrictionType:(unint64_t)a3 altDSID:(id)a4
{
  id v12 = a4;
  id v6 = -[PKPeerPaymentPreferences restrictionsForAltDSID:](self, "restrictionsForAltDSID:");
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 setReceiveRestrictionType:a3];
  }
  else
  {
    uint64_t v8 = objc_alloc_init(PKPeerPaymentPreferencesRestriction);
    [(PKPeerPaymentPreferencesRestriction *)v8 setReceiveRestrictionType:a3];
    [(PKPeerPaymentPreferencesRestriction *)v8 setAltDSID:v12];
    uint64_t v9 = (void *)[(NSSet *)self->_restrictions mutableCopy];
    [v9 addObject:v8];
    uint64_t v10 = (NSSet *)[v9 copy];
    restrictions = self->_restrictions;
    self->_restrictions = v10;
  }
}

- (void)didUpdateNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    uint64_t v5 = [v4 notificationType];
    id v6 = [v12 altDSID];
    uint64_t v7 = [(PKPeerPaymentPreferences *)self notificationWithType:v5 altDSID:v6];

    uint64_t v8 = (void *)[(NSSet *)self->_notifications mutableCopy];
    uint64_t v9 = v8;
    if (v7) {
      [v8 removeObject:v7];
    }
    [v9 addObject:v12];
    uint64_t v10 = (NSSet *)[v9 copy];
    notifications = self->_notifications;
    self->_notifications = v10;

    id v4 = v12;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPreferences)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentPreferences;
  uint64_t v5 = [(PKPeerPaymentPreferences *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v6;

    v5->_dirty = [v4 decodeBoolForKey:@"dirty"];
    v5->_requiresConfirmation = [v4 decodeBoolForKey:@"requiresConfirmation"];
    v5->_canReceiveFormalPaymentRequests = [v4 decodeBoolForKey:@"canReceiveFormalPaymentRequests"];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"restrictions"];
    restrictions = v5->_restrictions;
    v5->_restrictions = (NSSet *)v11;

    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    long long v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"notifications"];
    notifications = v5->_notifications;
    v5->_notifications = (NSSet *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileAppearance"];
    profileAppearance = v5->_profileAppearance;
    v5->_profileAppearance = (PKPeerPaymentPreferencesProfileAppearance *)v18;

    [v4 decodeDoubleForKey:@"proactivePreferencesFetchPeriod"];
    v5->_double proactiveFetchPeriod = v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  lastUpdated = self->_lastUpdated;
  id v5 = a3;
  [v5 encodeObject:lastUpdated forKey:@"lastUpdated"];
  [v5 encodeBool:self->_dirty forKey:@"dirty"];
  [v5 encodeBool:self->_requiresConfirmation forKey:@"requiresConfirmation"];
  [v5 encodeBool:self->_canReceiveFormalPaymentRequests forKey:@"canReceiveFormalPaymentRequests"];
  [v5 encodeObject:self->_notifications forKey:@"notifications"];
  [v5 encodeObject:self->_restrictions forKey:@"restrictions"];
  [v5 encodeObject:self->_profileAppearance forKey:@"profileAppearance"];
  [v5 encodeDouble:@"proactivePreferencesFetchPeriod" forKey:self->_proactiveFetchPeriod];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPeerPaymentPreferences allocWithZone:](PKPeerPaymentPreferences, "allocWithZone:") init];
  uint64_t v6 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v6;

  v5->_dirty = self->_dirty;
  v5->_requiresConfirmation = self->_requiresConfirmation;
  v5->_canReceiveFormalPaymentRequests = self->_canReceiveFormalPaymentRequests;
  uint64_t v8 = [(NSSet *)self->_notifications copyWithZone:a3];
  notifications = v5->_notifications;
  v5->_notifications = (NSSet *)v8;

  uint64_t v10 = [(NSSet *)self->_restrictions copyWithZone:a3];
  restrictions = v5->_restrictions;
  v5->_restrictions = (NSSet *)v10;

  id v12 = [(PKPeerPaymentPreferencesProfileAppearance *)self->_profileAppearance copyWithZone:a3];
  profileAppearance = v5->_profileAppearance;
  v5->_profileAppearance = v12;

  v5->_double proactiveFetchPeriod = self->_proactiveFetchPeriod;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPeerPaymentPreferences *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPeerPaymentPreferences *)self isEqualToPreferences:v5];

  return v6;
}

- (BOOL)isEqualToPreferences:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || self->_requiresConfirmation != *((unsigned __int8 *)v4 + 8)
    || self->_canReceiveFormalPaymentRequests != *((unsigned __int8 *)v4 + 9)
    || self->_proactiveFetchPeriod != *((double *)v4 + 6))
  {
    goto LABEL_17;
  }
  notifications = self->_notifications;
  uint64_t v7 = (NSSet *)v5[2];
  if (notifications && v7)
  {
    if ((-[NSSet isEqual:](notifications, "isEqual:") & 1) == 0) {
      goto LABEL_17;
    }
  }
  else if (notifications != v7)
  {
    goto LABEL_17;
  }
  restrictions = self->_restrictions;
  uint64_t v9 = (NSSet *)v5[3];
  if (!restrictions || !v9)
  {
    if (restrictions == v9) {
      goto LABEL_13;
    }
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_18;
  }
  if ((-[NSSet isEqual:](restrictions, "isEqual:") & 1) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  profileAppearance = self->_profileAppearance;
  uint64_t v11 = (PKPeerPaymentPreferencesProfileAppearance *)v5[4];
  if (profileAppearance && v11) {
    BOOL v12 = -[PKPeerPaymentPreferencesProfileAppearance isEqual:](profileAppearance, "isEqual:");
  }
  else {
    BOOL v12 = profileAppearance == v11;
  }
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_notifications];
  [v3 safelyAddObject:self->_restrictions];
  [v3 safelyAddObject:self->_profileAppearance];
  [v3 safelyAddObject:self->_lastUpdated];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_dirty - v4 + 32 * v4;
  uint64_t v6 = self->_requiresConfirmation - v5 + 32 * v5;
  uint64_t v7 = self->_canReceiveFormalPaymentRequests - v6 + 32 * v6;
  unint64_t v8 = (unint64_t)self->_proactiveFetchPeriod - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"lastUpdated: '%@'; ", self->_lastUpdated];
  if (self->_dirty) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  [v3 appendFormat:@"dirty: '%@'; ", v4];
  if (self->_requiresConfirmation) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  [v3 appendFormat:@"requiresConfirmation: '%@'; ", v5];
  if (self->_canReceiveFormalPaymentRequests) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v3 appendFormat:@"canReceiveFormalPaymentRequests: '%@'; ", v6];
  [v3 appendFormat:@"notifications: '%@'; ", self->_notifications];
  [v3 appendFormat:@"restrictions: '%@'; ", self->_restrictions];
  [v3 appendFormat:@"profileAppearance: '%@'; ", self->_profileAppearance];
  objc_msgSend(v3, "appendFormat:", @"proactiveFetchPeriod: '%lf'; ", *(void *)&self->_proactiveFetchPeriod);
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)requiresConfirmation
{
  return self->_requiresConfirmation;
}

- (void)setRequiresConfirmation:(BOOL)a3
{
  self->_requiresConfirmation = a3;
}

- (BOOL)canReceiveFormalPaymentRequests
{
  return self->_canReceiveFormalPaymentRequests;
}

- (void)setCanReceiveFormalPaymentRequests:(BOOL)a3
{
  self->_canReceiveFormalPaymentRequests = a3;
}

- (NSSet)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
}

- (NSSet)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
}

- (PKPeerPaymentPreferencesProfileAppearance)profileAppearance
{
  return self->_profileAppearance;
}

- (void)setProfileAppearance:(id)a3
{
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (double)proactiveFetchPeriod
{
  return self->_proactiveFetchPeriod;
}

- (void)setProactiveFetchPeriod:(double)a3
{
  self->_double proactiveFetchPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_profileAppearance, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
}

@end