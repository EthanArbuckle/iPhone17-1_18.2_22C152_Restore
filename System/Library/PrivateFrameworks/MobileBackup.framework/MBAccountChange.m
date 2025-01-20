@interface MBAccountChange
+ (BOOL)supportsSecureCoding;
- (BOOL)isPrimaryAccount;
- (MBAccountChange)initWithAccountIdentifier:(id)a3 personaIdentifier:(id)a4 isPrimaryAccount:(BOOL)a5 changeType:(int64_t)a6;
- (MBAccountChange)initWithCoder:(id)a3;
- (NSString)accountIdentifier;
- (NSString)personaIdentifier;
- (id)description;
- (int64_t)changeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MBAccountChange

- (MBAccountChange)initWithAccountIdentifier:(id)a3 personaIdentifier:(id)a4 isPrimaryAccount:(BOOL)a5 changeType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MBAccountChange;
  v13 = [(MBAccountChange *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accountIdentifier, a3);
    objc_storeStrong((id *)&v14->_personaIdentifier, a4);
    v14->_isPrimaryAccount = a5;
    v14->_changeType = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  accountIdentifier = self->_accountIdentifier;
  id v5 = a3;
  [v5 encodeObject:accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_personaIdentifier forKey:@"personaIdentifier"];
  [v5 encodeBool:self->_isPrimaryAccount forKey:@"isPrimaryAccount"];
  [v5 encodeInteger:self->_changeType forKey:@"changeType"];
}

- (MBAccountChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBAccountChange;
  id v5 = [(MBAccountChange *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"personaIdentifier"];
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v8;

    v5->_isPrimaryAccount = [v4 decodeBoolForKey:@"isPrimaryAccount"];
    v5->_changeType = [v4 decodeIntegerForKey:@"changeType"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%s: %p; accountIdentifier=%@, personaIdentifier=%@, isPrimaryAccount=%d, changeType=%ld>",
               class_getName(v4),
               self,
               self->_accountIdentifier,
               self->_personaIdentifier,
               self->_isPrimaryAccount,
               self->_changeType);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BOOL)isPrimaryAccount
{
  return self->_isPrimaryAccount;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end