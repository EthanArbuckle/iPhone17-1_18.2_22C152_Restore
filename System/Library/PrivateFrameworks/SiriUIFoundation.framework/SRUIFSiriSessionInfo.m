@interface SRUIFSiriSessionInfo
+ (BOOL)supportsSecureCoding;
- (AFAccount)activeAccount;
- (BOOL)applyInfo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)userAccountCount;
- (NSString)assistantVersion;
- (NSString)identifier;
- (SRUIFSiriSessionInfo)init;
- (SRUIFSiriSessionInfo)initWithCoder:(id)a3;
- (id)_initWithIdentifier:(id)a3;
- (id)_setPropertyValue:(id)a3 withSelector:(SEL)a4;
- (id)_strippedInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)setActiveAccountAndGenerateLightweightInfo:(id)a3;
- (id)setAssistantVersionAndGenerateLightweightInfo:(id)a3;
- (id)setUserAccountCountGenerateLightweightInfo:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setAssistantVersion:(id)a3;
- (void)setUserAccountCount:(id)a3;
@end

@implementation SRUIFSiriSessionInfo

- (id)setAssistantVersionAndGenerateLightweightInfo:(id)a3
{
  return [(SRUIFSiriSessionInfo *)self _setPropertyValue:a3 withSelector:sel_setAssistantVersion_];
}

- (id)setActiveAccountAndGenerateLightweightInfo:(id)a3
{
  return [(SRUIFSiriSessionInfo *)self _setPropertyValue:a3 withSelector:sel_setActiveAccount_];
}

- (id)setUserAccountCountGenerateLightweightInfo:(int64_t)a3
{
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(SRUIFSiriSessionInfo *)self _setPropertyValue:v4 withSelector:sel_setUserAccountCount_];

  return v5;
}

- (id)_setPropertyValue:(id)a3 withSelector:(SEL)a4
{
  id v6 = a3;
  v7 = [(SRUIFSiriSessionInfo *)self _strippedInfo];
  [v7 performSelector:a4 withObject:v6];

  if (![(SRUIFSiriSessionInfo *)self applyInfo:v7])
  {

    v7 = 0;
  }
  return v7;
}

- (BOOL)applyInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  id v6 = [(SRUIFSiriSessionInfo *)self identifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = [v4 assistantVersion];
    if (v8) {
      objc_storeStrong((id *)&self->_assistantVersion, v8);
    }
    v9 = [v4 activeAccount];
    if (v9) {
      objc_storeStrong((id *)&self->_activeAccount, v9);
    }
    v10 = [v4 userAccountCount];
    userAccountCount = self->_userAccountCount;
    self->_userAccountCount = v10;
  }
  return v7;
}

- (id)_strippedInfo
{
  id v2 = [[SRUIFSiriSessionInfo alloc] _initWithIdentifier:self->_identifier];
  return v2;
}

- (SRUIFSiriSessionInfo)init
{
  v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = [v3 UUIDString];
  v5 = [(SRUIFSiriSessionInfo *)self _initWithIdentifier:v4];

  return v5;
}

- (id)_initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRUIFSiriSessionInfo;
  id v6 = [(SRUIFSiriSessionInfo *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 identifier];
    if (v8)
    {
      v3 = [(SRUIFSiriSessionInfo *)self identifier];
      id v4 = [v7 identifier];
      if (![v3 isEqual:v4])
      {
        char v9 = 0;
        goto LABEL_16;
      }
    }
    v10 = [v7 assistantVersion];
    if (v10)
    {
      v11 = [(SRUIFSiriSessionInfo *)self assistantVersion];
      id v5 = [v7 assistantVersion];
      if (![v11 isEqual:v5])
      {
        char v9 = 0;
        goto LABEL_14;
      }
      v19 = v11;
    }
    uint64_t v12 = [v7 activeAccount];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [(SRUIFSiriSessionInfo *)self activeAccount];
      [v7 activeAccount];
      v15 = v4;
      v17 = v16 = v3;
      char v9 = [v14 isEqual:v17];

      v3 = v16;
      id v4 = v15;
    }
    else
    {
      char v9 = 1;
    }
    v11 = v19;
    if (!v10)
    {
LABEL_15:
      if (!v8)
      {
LABEL_17:

        goto LABEL_18;
      }
LABEL_16:

      goto LABEL_17;
    }
LABEL_14:

    goto LABEL_15;
  }
  char v9 = 0;
LABEL_18:

  return v9;
}

- (id)description
{
  v11[4] = *MEMORY[0x263EF8340];
  v3 = NSStringFromSelector(sel_identifier);
  v10[0] = v3;
  v11[0] = self->_identifier;
  id v4 = NSStringFromSelector(sel_assistantVersion);
  v10[1] = v4;
  v11[1] = self->_assistantVersion;
  id v5 = NSStringFromSelector(sel_activeAccount);
  v10[2] = v5;
  v11[2] = self->_activeAccount;
  id v6 = NSStringFromSelector(sel_userAccountCount);
  v10[3] = v6;
  v11[3] = self->_userAccountCount;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  v8 = [v7 description];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [SRUIFSiriSessionInfo alloc];
  id v6 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  id v7 = [(SRUIFSiriSessionInfo *)v5 _initWithIdentifier:v6];

  v8 = (void *)[(NSString *)self->_assistantVersion copyWithZone:a3];
  [v7 setAssistantVersion:v8];

  char v9 = (void *)[(AFAccount *)self->_activeAccount copy];
  [v7 setActiveAccount:v9];

  [v7 setUserAccountCount:self->_userAccountCount];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRUIFSiriSessionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SRUIFSiriSessionInfo;
  id v5 = [(SRUIFSiriSessionInfo *)&v23 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_identifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_assistantVersion);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    assistantVersion = v5->_assistantVersion;
    v5->_assistantVersion = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_activeAccount);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    activeAccount = v5->_activeAccount;
    v5->_activeAccount = (AFAccount *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_userAccountCount);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    userAccountCount = v5->_userAccountCount;
    v5->_userAccountCount = (NSNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_identifier);
  [v5 encodeObject:identifier forKey:v6];

  assistantVersion = self->_assistantVersion;
  uint64_t v8 = NSStringFromSelector(sel_assistantVersion);
  [v5 encodeObject:assistantVersion forKey:v8];

  activeAccount = self->_activeAccount;
  uint64_t v10 = NSStringFromSelector(sel_activeAccount);
  [v5 encodeObject:activeAccount forKey:v10];

  userAccountCount = self->_userAccountCount;
  NSStringFromSelector(sel_userAccountCount);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:userAccountCount forKey:v12];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)assistantVersion
{
  return self->_assistantVersion;
}

- (void)setAssistantVersion:(id)a3
{
}

- (AFAccount)activeAccount
{
  return self->_activeAccount;
}

- (void)setActiveAccount:(id)a3
{
}

- (NSNumber)userAccountCount
{
  return self->_userAccountCount;
}

- (void)setUserAccountCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAccountCount, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_assistantVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end