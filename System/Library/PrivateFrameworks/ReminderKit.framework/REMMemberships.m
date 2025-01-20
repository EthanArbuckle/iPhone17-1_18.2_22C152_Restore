@interface REMMemberships
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)membershipByMemberIdentifier;
- (REMMemberships)initWithCoder:(id)a3;
- (REMMemberships)initWithMembershipByMemberIdentifier:(id)a3;
- (REMMemberships)initWithMemberships:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)excludingObsoleteAndModifiedEarlierThan:(id)a3;
- (id)groupIdentifierOfMemberWithIdentifier:(id)a3;
- (id)mergingWith:(id)a3 mergePolicy:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMMemberships

- (REMMemberships)initWithMembershipByMemberIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMMemberships;
  v6 = [(REMMemberships *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_membershipByMemberIdentifier, a3);
  }

  return v7;
}

- (REMMemberships)initWithMemberships:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "memberIdentifier", (void)v15);
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = [(REMMemberships *)self initWithMembershipByMemberIdentifier:v5];
  return v13;
}

- (id)groupIdentifierOfMemberWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(REMMemberships *)self membershipByMemberIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 groupIdentifier];

  return v7;
}

- (id)mergingWith:(id)a3 mergePolicy:(unint64_t)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v33 = self;
  uint64_t v7 = [(REMMemberships *)self membershipByMemberIdentifier];
  v32 = (void *)[v6 initWithDictionary:v7];

  if (a4 == 1)
  {
    v27 = [v30 membershipByMemberIdentifier];
    [v32 addEntriesFromDictionary:v27];

    uint64_t v8 = v30;
  }
  else
  {
    uint64_t v8 = v30;
    if (!a4)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = [v30 membershipByMemberIdentifier];
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v35 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v14 = objc_msgSend(v8, "membershipByMemberIdentifier", v30);
            long long v15 = [v14 objectForKeyedSubscript:v13];

            long long v16 = [(REMMemberships *)v33 membershipByMemberIdentifier];
            long long v17 = [v16 objectForKeyedSubscript:v13];

            if (!v17) {
              goto LABEL_14;
            }
            long long v18 = [v17 modifiedOn];
            v19 = [v15 modifiedOn];
            uint64_t v20 = [v18 compare:v19];

            if (v20 == -1) {
              goto LABEL_14;
            }
            if (!v20)
            {
              uint64_t v21 = [v17 groupIdentifier];
              if (!v21) {
                goto LABEL_14;
              }
              v22 = (void *)v21;
              v23 = [v15 groupIdentifier];
              v24 = [v17 groupIdentifier];
              uint64_t v25 = [v23 compare:v24];

              BOOL v26 = v25 == 1;
              uint64_t v8 = v30;
              if (v26) {
LABEL_14:
              }
                [v32 setObject:v15 forKeyedSubscript:v13];
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v10);
      }
    }
  }
  v28 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMembershipByMemberIdentifier:v32];

  return v28;
}

- (id)excludingObsoleteAndModifiedEarlierThan:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v6 = [(REMMemberships *)self membershipByMemberIdentifier];
  uint64_t v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [(REMMemberships *)self membershipByMemberIdentifier];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v14 = [(REMMemberships *)self membershipByMemberIdentifier];
        long long v15 = [v14 objectForKeyedSubscript:v13];

        if (v15)
        {
          if (![v15 isObsolete]
            || ([v15 modifiedOn],
                long long v16 = objc_claimAutoreleasedReturnValue(),
                uint64_t v17 = [v16 compare:v4],
                v16,
                v17 != -1))
          {
            [v7 addObject:v15];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  long long v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMemberships:v7];

  return v18;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(REMMemberships *)self membershipByMemberIdentifier];
  id v6 = [v3 stringWithFormat:@"<%@: %p membershipByMemberIdentifier: %@>", v4, self, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMMemberships *)self membershipByMemberIdentifier];
    uint64_t v6 = [v4 membershipByMemberIdentifier];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      uint64_t v7 = v5;
    }
    else
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = [(REMMemberships *)self membershipByMemberIdentifier];
      uint64_t v9 = [v4 membershipByMemberIdentifier];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(REMMemberships *)self membershipByMemberIdentifier];
  uint64_t v6 = (void *)[v4 initWithMembershipByMemberIdentifier:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMMemberships)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  uint64_t v9 = [v5 decodeObjectOfClasses:v8 forKey:@"membershipByMemberIdentifier"];

  char v10 = [(REMMemberships *)self initWithMembershipByMemberIdentifier:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMMemberships *)self membershipByMemberIdentifier];
  [v4 encodeObject:v5 forKey:@"membershipByMemberIdentifier"];
}

- (NSDictionary)membershipByMemberIdentifier
{
  return self->_membershipByMemberIdentifier;
}

- (void).cxx_destruct
{
}

@end