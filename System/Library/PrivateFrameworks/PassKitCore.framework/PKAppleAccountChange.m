@interface PKAppleAccountChange
+ (BOOL)supportsSecureCoding;
+ (int64_t)changeTypeToAccount:(id)a3 fromAccount:(id)a4;
- (BOOL)didAccountManagedStateChange;
- (BOOL)didAccountOrderChange;
- (BOOL)didEnablementOfRelevantDataclassesChange;
- (BOOL)didEnablementOfUbiquityDataclassChange;
- (BOOL)didEnablementOfWalletDataclassChange;
- (BOOL)shouldBeNotedByPassLibrary;
- (PKAppleAccountChange)initWithCoder:(id)a3;
- (PKAppleAccountChange)initWithEvent:(int64_t)a3 currentAccount:(id)a4 previousAccount:(id)a5;
- (PKAppleAccountState)currentState;
- (PKAppleAccountState)previousState;
- (id)description;
- (int64_t)event;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAppleAccountChange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleAccountChange)initWithEvent:(int64_t)a3 currentAccount:(id)a4 previousAccount:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v8) {
    id v9 = v8;
  }
  v11 = [v9 accountType];
  v12 = [v11 identifier];
  v13 = (void *)*MEMORY[0x1E4F17750];
  id v14 = v12;
  id v15 = v13;
  if (v14 != v15)
  {
    v16 = v15;
    if (v14) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {
    }
    else
    {
      char v18 = [v14 isEqualToString:v15];

      if (v18) {
        goto LABEL_12;
      }
    }
    v24 = 0;
    goto LABEL_16;
  }

LABEL_12:
  v26.receiver = self;
  v26.super_class = (Class)PKAppleAccountChange;
  v19 = [(PKAppleAccountChange *)&v26 init];
  if (v19)
  {
    v19->_type = [(id)objc_opt_class() changeTypeToAccount:v8 fromAccount:v10];
    v19->_event = a3;
    v20 = [[PKAppleAccountState alloc] initWithAccount:v8];
    currentState = v19->_currentState;
    v19->_currentState = v20;

    v22 = [[PKAppleAccountState alloc] initWithAccount:v10];
    previousState = v19->_previousState;
    v19->_previousState = v22;
  }
  self = v19;
  v24 = self;
LABEL_16:

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t type = self->_type;
  id v8 = a3;
  v6 = [v4 numberWithInteger:type];
  [v8 encodeObject:v6 forKey:@"type"];

  v7 = [NSNumber numberWithInteger:self->_event];
  [v8 encodeObject:v7 forKey:@"event"];

  [v8 encodeObject:self->_currentState forKey:@"currentState"];
  [v8 encodeObject:self->_previousState forKey:@"previousState"];
}

- (PKAppleAccountChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAppleAccountChange;
  v5 = [(PKAppleAccountChange *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_int64_t type = [v6 integerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event"];
    v5->_event = [v7 integerValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentState"];
    currentState = v5->_currentState;
    v5->_currentState = (PKAppleAccountState *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousState"];
    previousState = v5->_previousState;
    v5->_previousState = (PKAppleAccountState *)v10;
  }
  return v5;
}

- (BOOL)didEnablementOfRelevantDataclassesChange
{
  if ([(PKAppleAccountChange *)self didEnablementOfWalletDataclassChange]) {
    return 1;
  }
  return [(PKAppleAccountChange *)self didEnablementOfUbiquityDataclassChange];
}

- (BOOL)didEnablementOfWalletDataclassChange
{
  BOOL v3 = [(PKAppleAccountState *)self->_currentState isWalletDataclassEnabled];
  return v3 ^ [(PKAppleAccountState *)self->_previousState isWalletDataclassEnabled];
}

- (BOOL)didEnablementOfUbiquityDataclassChange
{
  BOOL v3 = [(PKAppleAccountState *)self->_currentState isUbiquityDataclassEnabled];
  return v3 ^ [(PKAppleAccountState *)self->_previousState isUbiquityDataclassEnabled];
}

- (BOOL)didAccountManagedStateChange
{
  BOOL v3 = [(PKAppleAccountState *)self->_currentState isManaged];
  return v3 ^ [(PKAppleAccountState *)self->_previousState isManaged];
}

- (BOOL)didAccountOrderChange
{
  BOOL v3 = [(PKAppleAccountState *)self->_currentState isPrimary];
  return v3 ^ [(PKAppleAccountState *)self->_previousState isPrimary];
}

- (BOOL)shouldBeNotedByPassLibrary
{
  int64_t type = self->_type;
  if (type == 3) {
    return [(PKAppleAccountChange *)self event] == 1;
  }
  if (type != 2)
  {
    if (type == 1) {
      return [(PKAppleAccountChange *)self event] == 2;
    }
    return 0;
  }
  if ([(PKAppleAccountChange *)self event] != 2) {
    return 0;
  }
  if ([(PKAppleAccountChange *)self didEnablementOfRelevantDataclassesChange]|| [(PKAppleAccountChange *)self didAccountManagedStateChange])
  {
    return 1;
  }
  return [(PKAppleAccountChange *)self didAccountOrderChange];
}

- (id)description
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 2) {
    BOOL v3 = @"unsupported";
  }
  else {
    BOOL v3 = off_1E56F5080[v2];
  }
  id v4 = @"unknown";
  int64_t event = self->_event;
  if (event == 1) {
    id v4 = @"will-change";
  }
  if (event == 2) {
    v6 = @"did-change";
  }
  else {
    v6 = v4;
  }
  return (id)[NSString stringWithFormat:@"changeType: %@, event: %@, \n before - \n  %@,\n after - \n  %@,\n (will notify library: %i)", v3, v6, self->_previousState, self->_currentState, -[PKAppleAccountChange shouldBeNotedByPassLibrary](self, "shouldBeNotedByPassLibrary")];
}

+ (int64_t)changeTypeToAccount:(id)a3 fromAccount:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F4BF38];
  id v6 = a4;
  int v7 = objc_msgSend(a3, "aa_isAccountClass:", v5);
  int v8 = objc_msgSend(v6, "aa_isAccountClass:", v5);

  int64_t v9 = 3;
  if (((v7 ^ 1) & v8) == 0) {
    int64_t v9 = 0;
  }
  if ((v7 & v8) != 0) {
    int64_t v9 = 2;
  }
  if (v7 ^ 1 | v8) {
    return v9;
  }
  else {
    return 1;
  }
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)event
{
  return self->_event;
}

- (PKAppleAccountState)currentState
{
  return self->_currentState;
}

- (PKAppleAccountState)previousState
{
  return self->_previousState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end