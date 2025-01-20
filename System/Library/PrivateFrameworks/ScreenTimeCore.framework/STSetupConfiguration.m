@interface STSetupConfiguration
+ (BOOL)_isContactManagementStateValid:(int64_t)a3 pairedWithUserHasContacts:(BOOL)a4;
+ (BOOL)_isScreenTimeStateValid:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSetupConfiguration:(id)a3;
- (BOOL)userHasContacts;
- (NSSet)availableContactManagementStates;
- (NSSet)availableScreenTimeStates;
- (STOpaquePasscode)passcode;
- (STSetupConfiguration)configurationWithUpdatedContactManagementState:(int64_t)a3 error:(id *)a4;
- (STSetupConfiguration)configurationWithUpdatedPasscode:(id)a3;
- (STSetupConfiguration)configurationWithUpdatedScreenTimeState:(int64_t)a3 error:(id *)a4;
- (STSetupConfiguration)initWithCoder:(id)a3;
- (STSetupConfiguration)initWithUser:(id)a3 screenTimeState:(int64_t)a4 passcode:(id)a5 contactManagementState:(int64_t)a6 userHasContacts:(BOOL)a7 error:(id *)a8;
- (STUserID)associatedUser;
- (id)_descriptionForContactManagementStates:(id)a3;
- (id)_descriptionForScreenTimeStates:(id)a3;
- (id)_initWithUser:(id)a3 screenTimeState:(int64_t)a4 passcode:(id)a5 contactManagementState:(int64_t)a6 userHasContacts:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)contactManagementState;
- (int64_t)screenTimeState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSetupConfiguration

- (STSetupConfiguration)initWithUser:(id)a3 screenTimeState:(int64_t)a4 passcode:(id)a5 contactManagementState:(int64_t)a6 userHasContacts:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  if (+[STSetupConfiguration _isContactManagementStateValid:a6 pairedWithUserHasContacts:v9])
  {
    self = (STSetupConfiguration *)[(STSetupConfiguration *)self _initWithUser:v14 screenTimeState:a4 passcode:v15 contactManagementState:a6 userHasContacts:v9];
    v16 = self;
  }
  else
  {
    v16 = 0;
    if (a8) {
      *a8 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:41 userInfo:0];
    }
  }

  return v16;
}

- (id)_initWithUser:(id)a3 screenTimeState:(int64_t)a4 passcode:(id)a5 contactManagementState:(int64_t)a6 userHasContacts:(BOOL)a7
{
  v19.receiver = self;
  v19.super_class = (Class)STSetupConfiguration;
  id v11 = a5;
  id v12 = a3;
  v13 = [(STSetupConfiguration *)&v19 init];
  uint64_t v14 = objc_msgSend(v12, "copy", v19.receiver, v19.super_class);

  associatedUser = v13->_associatedUser;
  v13->_associatedUser = (STUserID *)v14;

  v13->_screenTimeState = a4;
  uint64_t v16 = [v11 copy];

  passcode = v13->_passcode;
  v13->_passcode = (STOpaquePasscode *)v16;

  v13->_contactManagementState = a6;
  v13->_userHasContacts = a7;
  return v13;
}

+ (BOOL)_isScreenTimeStateValid:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

+ (BOOL)_isContactManagementStateValid:(int64_t)a3 pairedWithUserHasContacts:(BOOL)a4
{
  BOOL v4 = a3 == 1 && a4;
  if (a3 == 2) {
    BOOL v4 = 1;
  }
  return !a3 || v4;
}

- (id)description
{
  v21 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(STSetupConfiguration *)self associatedUser];
  unint64_t v6 = [(STSetupConfiguration *)self screenTimeState];
  unint64_t v7 = v6;
  if (v6 >= 3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v9 = [NSString stringWithUTF8String:"NSString * _Nonnull STGetDescriptionForSetupConfigurationScreenTimeState(STSetupConfigurationScreenTimeState)"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"STSetupConfiguration.h", 32, @"Unexpected Screen Time state %ld", v7);
  }
  else
  {
    v2 = off_1E6BC7F98[v6];
  }
  v10 = [(STSetupConfiguration *)self availableScreenTimeStates];
  id v11 = [(STSetupConfiguration *)self _descriptionForScreenTimeStates:v10];
  id v12 = [(STSetupConfiguration *)self passcode];
  unint64_t v13 = [(STSetupConfiguration *)self contactManagementState];
  unint64_t v14 = v13;
  if (v13 >= 3)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"NSString * _Nonnull STGetDescriptionForSetupConfigurationContactManagementState(STSetupConfigurationContactManagementState)"];
    [(__CFString *)v15 handleFailureInFunction:v16, @"STSetupConfiguration.h", 53, @"Unexpected contact management state %ld", v14 file lineNumber description];
  }
  else
  {
    id v15 = off_1E6BC7FB0[v13];
  }
  v17 = [(STSetupConfiguration *)self availableContactManagementStates];
  v18 = [(STSetupConfiguration *)self _descriptionForContactManagementStates:v17];
  objc_super v19 = [v21 stringWithFormat:@"<%@: { User: %@, ScreenTimeState: %@, AvailableScreenTimeStates: %@, Passcode: %d, ContactManagementState: %@, AvailableContactManagementStates: %@>", v4, v5, v2, v11, v12 != 0, v15, v18];

  return v19;
}

- (id)_descriptionForScreenTimeStates:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) integerValue];
        if (v10 >= 3)
        {
          unint64_t v13 = v10;
          unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          id v15 = [NSString stringWithUTF8String:"NSString * _Nonnull STGetDescriptionForSetupConfigurationScreenTimeState(STSetupConfigurationScreenTimeState)"];
          objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"STSetupConfiguration.h", 32, @"Unexpected Screen Time state %ld", v13);

          __break(1u);
          return result;
        }
        [v4 addObject:off_1E6BC7F98[v10]];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

- (id)_descriptionForContactManagementStates:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) integerValue];
        if (v10 >= 3)
        {
          unint64_t v13 = v10;
          unint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          id v15 = [NSString stringWithUTF8String:"NSString * _Nonnull STGetDescriptionForSetupConfigurationContactManagementState(STSetupConfigurationContactManagementState)"];
          objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"STSetupConfiguration.h", 53, @"Unexpected contact management state %ld", v13);

          __break(1u);
          return result;
        }
        [v4 addObject:off_1E6BC7FB0[v10]];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

- (NSSet)availableScreenTimeStates
{
  int64_t v4 = [(STSetupConfiguration *)self screenTimeState];
  if (v4 == 2)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = &unk_1F349EC98;
LABEL_7:
    uint64_t v6 = [v7 setWithObject:v8];
    goto LABEL_9;
  }
  int64_t v5 = v4;
  if (v4 == 1)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = &unk_1F349EC80;
    goto LABEL_7;
  }
  if (v4)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STSetupConfiguration.m", 111, @"Unexpected Screen Time state %ld", v5);
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F349EC80, &unk_1F349EC98, 0);
  }
LABEL_9:
  return (NSSet *)v6;
}

- (NSSet)availableContactManagementStates
{
  int64_t v4 = [(STSetupConfiguration *)self contactManagementState];
  if (v4 == 2 || (int64_t v5 = v4, v4 == 1))
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = &unk_1F349ECB0;
LABEL_7:
    BOOL v9 = [v7 setWithObject:v8];
    goto LABEL_9;
  }
  if (!v4)
  {
    BOOL v6 = [(STSetupConfiguration *)self userHasContacts];
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    if (v6) {
      uint64_t v8 = &unk_1F349EC98;
    }
    else {
      uint64_t v8 = &unk_1F349EC80;
    }
    goto LABEL_7;
  }
  unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STSetupConfiguration.m", 128, @"Unexpected contact management state %ld", v5);

LABEL_9:
  return (NSSet *)v9;
}

- (STSetupConfiguration)configurationWithUpdatedScreenTimeState:(int64_t)a3 error:(id *)a4
{
  uint64_t v7 = [(STSetupConfiguration *)self availableScreenTimeStates];
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  char v9 = [v7 containsObject:v8];

  if (v9)
  {
    unint64_t v10 = [STSetupConfiguration alloc];
    id v11 = [(STSetupConfiguration *)self associatedUser];
    id v12 = [(STSetupConfiguration *)self passcode];
    id v13 = [(STSetupConfiguration *)v10 _initWithUser:v11 screenTimeState:a3 passcode:v12 contactManagementState:[(STSetupConfiguration *)self contactManagementState] userHasContacts:[(STSetupConfiguration *)self userHasContacts]];
  }
  else
  {
    id v13 = 0;
    if (a4) {
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:42 userInfo:0];
    }
  }
  return (STSetupConfiguration *)v13;
}

- (STSetupConfiguration)configurationWithUpdatedContactManagementState:(int64_t)a3 error:(id *)a4
{
  uint64_t v7 = [(STSetupConfiguration *)self availableContactManagementStates];
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  char v9 = [v7 containsObject:v8];

  if (v9)
  {
    unint64_t v10 = [STSetupConfiguration alloc];
    id v11 = [(STSetupConfiguration *)self associatedUser];
    int64_t v12 = [(STSetupConfiguration *)self screenTimeState];
    id v13 = [(STSetupConfiguration *)self passcode];
    id v14 = [(STSetupConfiguration *)v10 _initWithUser:v11 screenTimeState:v12 passcode:v13 contactManagementState:a3 userHasContacts:[(STSetupConfiguration *)self userHasContacts]];
  }
  else
  {
    id v14 = 0;
    if (a4) {
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:43 userInfo:0];
    }
  }
  return (STSetupConfiguration *)v14;
}

- (STSetupConfiguration)configurationWithUpdatedPasscode:(id)a3
{
  id v4 = a3;
  int64_t v5 = [STSetupConfiguration alloc];
  BOOL v6 = [(STSetupConfiguration *)self associatedUser];
  id v7 = [(STSetupConfiguration *)v5 _initWithUser:v6 screenTimeState:[(STSetupConfiguration *)self screenTimeState] passcode:v4 contactManagementState:[(STSetupConfiguration *)self contactManagementState] userHasContacts:[(STSetupConfiguration *)self userHasContacts]];

  return (STSetupConfiguration *)v7;
}

- (STSetupConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedUser"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"screenTimeState"];
  if (!+[STSetupConfiguration _isScreenTimeStateValid:v6])
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:42 userInfo:0];
    [v4 failWithError:v7];
LABEL_6:
    unint64_t v10 = 0;
    goto LABEL_7;
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passcode"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"contactManagementState"];
  uint64_t v9 = [v4 decodeBoolForKey:@"userHasContacts"];
  if (!+[STSetupConfiguration _isContactManagementStateValid:v8 pairedWithUserHasContacts:v9])
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:43 userInfo:0];
    [v4 failWithError:v11];

    goto LABEL_6;
  }
  self = (STSetupConfiguration *)[(STSetupConfiguration *)self _initWithUser:v5 screenTimeState:v6 passcode:v7 contactManagementState:v8 userHasContacts:v9];
  unint64_t v10 = self;
LABEL_7:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  associatedUser = self->_associatedUser;
  id v5 = a3;
  [v5 encodeObject:associatedUser forKey:@"associatedUser"];
  [v5 encodeInteger:self->_screenTimeState forKey:@"screenTimeState"];
  [v5 encodeObject:self->_passcode forKey:@"passcode"];
  [v5 encodeInteger:self->_contactManagementState forKey:@"contactManagementState"];
  [v5 encodeBool:self->_userHasContacts forKey:@"userHasContacts"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  associatedUser = self->_associatedUser;
  int64_t screenTimeState = self->_screenTimeState;
  passcode = self->_passcode;
  int64_t contactManagementState = self->_contactManagementState;
  BOOL userHasContacts = self->_userHasContacts;
  return (id)[v4 _initWithUser:associatedUser screenTimeState:screenTimeState passcode:passcode contactManagementState:contactManagementState userHasContacts:userHasContacts];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STSetupConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(STSetupConfiguration *)self isEqualToSetupConfiguration:v4];
  }

  return v5;
}

- (BOOL)isEqualToSetupConfiguration:(id)a3
{
  uint64_t v6 = (STSetupConfiguration *)a3;
  if (v6 != self)
  {
    id v7 = [(STSetupConfiguration *)self associatedUser];
    uint64_t v8 = [(STSetupConfiguration *)v6 associatedUser];
    if (![v7 isEqualToUserID:v8]
      || (int64_t v9 = [(STSetupConfiguration *)self screenTimeState],
          v9 != [(STSetupConfiguration *)v6 screenTimeState]))
    {
      LOBYTE(v12) = 0;
LABEL_15:

      goto LABEL_16;
    }
    unint64_t v10 = [(STSetupConfiguration *)self passcode];
    id v11 = [(STSetupConfiguration *)v6 passcode];
    if (v10 == v11
      || ([(STSetupConfiguration *)self passcode],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [(STSetupConfiguration *)v6 passcode],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToOpaquePasscode:v4]))
    {
      int64_t v13 = [(STSetupConfiguration *)self contactManagementState];
      if (v13 == [(STSetupConfiguration *)v6 contactManagementState])
      {
        BOOL v14 = [(STSetupConfiguration *)self userHasContacts];
        BOOL v12 = v14 ^ [(STSetupConfiguration *)v6 userHasContacts] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
      if (v10 == v11) {
        goto LABEL_14;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }

LABEL_14:
    goto LABEL_15;
  }
  LOBYTE(v12) = 1;
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(STSetupConfiguration *)self associatedUser];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(STSetupConfiguration *)self screenTimeState] ^ v4;
  uint64_t v6 = [(STSetupConfiguration *)self passcode];
  uint64_t v7 = [v6 hash];
  int64_t v8 = v5 ^ v7 ^ [(STSetupConfiguration *)self contactManagementState];
  unint64_t v9 = v8 ^ [(STSetupConfiguration *)self userHasContacts];

  return v9;
}

- (STUserID)associatedUser
{
  return (STUserID *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)screenTimeState
{
  return self->_screenTimeState;
}

- (STOpaquePasscode)passcode
{
  return (STOpaquePasscode *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)contactManagementState
{
  return self->_contactManagementState;
}

- (BOOL)userHasContacts
{
  return self->_userHasContacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_associatedUser, 0);
}

@end