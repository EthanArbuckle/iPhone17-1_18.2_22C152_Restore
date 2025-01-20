@interface FCReferenceToMembership
- (FCReferenceToMembership)initWithIdentifier:(id)a3;
- (FCReferenceToMembership)initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4;
- (FCReferenceToMembership)initWithRecord:(id)a3;
- (NSString)identifier;
- (NSString)membershipID;
- (id)dictionaryRepresentation;
@end

@implementation FCReferenceToMembership

- (FCReferenceToMembership)initWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier != nil");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCReferenceToMembership initWithIdentifier:]";
    __int16 v13 = 2080;
    v14 = "FCReferenceToMembership.m";
    __int16 v15 = 1024;
    int v16 = 16;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCReferenceToMembership;
  v6 = [(FCReferenceToMembership *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_identifier, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (FCReferenceToMembership)initWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordID];
  v6 = [v5 recordName];
  v7 = [(FCReferenceToMembership *)self initWithIdentifier:v6];

  if (v7)
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:@"membershipID"];
    membershipID = v7->_membershipID;
    v7->_membershipID = (NSString *)v8;
  }
  return v7;
}

- (FCReferenceToMembership)initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  id v6 = a4;
  v7 = [(FCReferenceToMembership *)self initWithIdentifier:a3];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"membershipID"];
    membershipID = v7->_membershipID;
    v7->_membershipID = (NSString *)v8;
  }
  return v7;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(FCReferenceToMembership *)self membershipID];

  if (v4)
  {
    id v5 = [(FCReferenceToMembership *)self membershipID];
    [v3 setObject:v5 forKey:@"membershipID"];
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)membershipID
{
  return self->_membershipID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_membershipID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end