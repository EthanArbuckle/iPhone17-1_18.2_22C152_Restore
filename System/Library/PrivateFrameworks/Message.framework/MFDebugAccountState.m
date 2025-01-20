@interface MFDebugAccountState
- (MFDebugAccountState)initWithStateEventDictionary:(id)a3 identifier:(id)a4 lastKnownCapabilities:(id)a5;
- (MailAccount)mailAccount;
- (NSArray)lastKnownCapabilities;
- (NSString)identifier;
- (id)dictionaryRepresentation;
- (void)setIdentifier:(id)a3;
- (void)setLastKnownCapabilities:(id)a3;
- (void)setMailAccount:(id)a3;
@end

@implementation MFDebugAccountState

- (MFDebugAccountState)initWithStateEventDictionary:(id)a3 identifier:(id)a4 lastKnownCapabilities:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFDebugAccountState;
  v12 = [(MFDebugAccountState *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a4);
    objc_storeStrong((id *)&v13->_mailAccount, a3);
    objc_storeStrong((id *)&v13->_lastKnownCapabilities, a5);
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(MFDebugAccountState *)self identifier];

  if (v4)
  {
    v5 = [(MFDebugAccountState *)self identifier];
    [v3 setObject:v5 forKeyedSubscript:@"identifier"];
  }
  v6 = [(MFDebugAccountState *)self mailAccount];

  if (v6)
  {
    id v7 = [NSString alloc];
    v8 = [(MFDebugAccountState *)self mailAccount];
    id v9 = (void *)[v7 initWithFormat:@"%@", v8];
    [v3 setObject:v9 forKeyedSubscript:@"account"];
  }
  id v10 = [(MFDebugAccountState *)self lastKnownCapabilities];

  if (v10)
  {
    id v11 = [(MFDebugAccountState *)self lastKnownCapabilities];
    [v3 setObject:v11 forKeyedSubscript:@"last capabilities"];
  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)lastKnownCapabilities
{
  return self->_lastKnownCapabilities;
}

- (void)setLastKnownCapabilities:(id)a3
{
}

- (MailAccount)mailAccount
{
  return self->_mailAccount;
}

- (void)setMailAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailAccount, 0);
  objc_storeStrong((id *)&self->_lastKnownCapabilities, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end