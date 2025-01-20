@interface PKAppleAccountState
+ (BOOL)supportsSecureCoding;
- (BOOL)isManaged;
- (BOOL)isPrimary;
- (BOOL)isUbiquityDataclassEnabled;
- (BOOL)isWalletDataclassEnabled;
- (NSString)identifier;
- (PKAppleAccountState)initWithAccount:(id)a3;
- (PKAppleAccountState)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAppleAccountState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleAccountState)initWithAccount:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAppleAccountState;
  v5 = [(PKAppleAccountState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_isWalletDataclassEnabled = [v4 isEnabledForDataclass:*MEMORY[0x1E4F17628]];
    v5->_isUbiquityDataclassEnabled = [v4 isEnabledForDataclass:*MEMORY[0x1E4F17640]];
    v5->_isManaged = objc_msgSend(v4, "aa_isManagedAppleID");
    v5->_isPrimary = objc_msgSend(v4, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeBool:self->_isWalletDataclassEnabled forKey:@"isWalletDataclassEnabled"];
  [v5 encodeBool:self->_isUbiquityDataclassEnabled forKey:@"isUbiquityDataclassEnabled"];
  [v5 encodeBool:self->_isManaged forKey:@"isManaged"];
  [v5 encodeBool:self->_isPrimary forKey:@"isPrimary"];
}

- (PKAppleAccountState)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAppleAccountState;
  id v5 = [(PKAppleAccountState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_isWalletDataclassEnabled = [v4 decodeBoolForKey:@"isWalletDataclassEnabled"];
    v5->_isUbiquityDataclassEnabled = [v4 decodeBoolForKey:@"isUbiquityDataclassEnabled"];
    v5->_isManaged = [v4 decodeBoolForKey:@"isManaged"];
    v5->_isPrimary = [v4 decodeBoolForKey:@"isPrimary"];
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"identifier: %@, walletEnabled: %i, ubiquityEnabled: %i, isManaged: %i, isPrimary: %i", self->_identifier, self->_isWalletDataclassEnabled, self->_isUbiquityDataclassEnabled, self->_isManaged, self->_isPrimary];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isWalletDataclassEnabled
{
  return self->_isWalletDataclassEnabled;
}

- (BOOL)isUbiquityDataclassEnabled
{
  return self->_isUbiquityDataclassEnabled;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void).cxx_destruct
{
}

@end