@interface REMTextMemberships
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastResetDate;
- (NSDictionary)memberships;
- (REMTextMemberships)initWithCoder:(id)a3;
- (REMTextMemberships)initWithMemberships:(id)a3;
- (REMTextMemberships)initWithMemberships:(id)a3 lastResetDate:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)groupIdentifierOfMemberWithIdentifier:(id)a3;
- (id)mergingWith:(id)a3;
- (id)removing:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
@end

@implementation REMTextMemberships

- (REMTextMemberships)initWithMemberships:(id)a3 lastResetDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMTextMemberships;
  v9 = [(REMTextMemberships *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memberships, a3);
    objc_storeStrong((id *)&v10->_lastResetDate, a4);
  }

  return v10;
}

- (REMTextMemberships)initWithMemberships:(id)a3
{
  return [(REMTextMemberships *)self initWithMemberships:a3 lastResetDate:0];
}

- (id)groupIdentifierOfMemberWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(REMTextMemberships *)self memberships];
  v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 identifier];

  return v7;
}

- (id)mergingWith:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(REMTextMemberships *)self lastResetDate];

  v6 = [v4 lastResetDate];
  id v7 = v6;
  v54 = v4;
  if (v5)
  {

    if (v7)
    {
      id v8 = [v4 lastResetDate];
      v9 = [(REMTextMemberships *)self lastResetDate];
      uint64_t v10 = [v9 compare:v8];

      if (v10 == -1)
      {
        id v11 = v8;
      }
      else
      {
        id v11 = [(REMTextMemberships *)self lastResetDate];
      }
      id v7 = v11;
    }
    else
    {
      id v7 = [(REMTextMemberships *)self lastResetDate];
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = (void *)v12;
  v58 = self;
  if (v7)
  {
    v56 = (void *)v12;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v14 = [(REMTextMemberships *)self memberships];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v64 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          v20 = [(REMTextMemberships *)v58 memberships];
          v21 = [v20 objectForKeyedSubscript:v19];
          v22 = [v21 modifiedOn];
          uint64_t v23 = [v22 compare:v7];

          if (v23 == 1)
          {
            v24 = [(REMTextMemberships *)v58 memberships];
            v25 = [v24 objectForKeyedSubscript:v19];
            [v56 setObject:v25 forKeyedSubscript:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v63 objects:v68 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v26 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v27 = [(REMTextMemberships *)self memberships];
    uint64_t v28 = [v26 initWithDictionary:v27];

    v56 = (void *)v28;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v29 = v54;
  obuint64_t j = [v54 memberships];
  uint64_t v30 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
  v31 = v58;
  if (v30)
  {
    uint64_t v32 = v30;
    uint64_t v57 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v60 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void *)(*((void *)&v59 + 1) + 8 * j);
        if (!v7) {
          goto LABEL_27;
        }
        v35 = [v29 memberships];
        v36 = [v35 objectForKeyedSubscript:v34];
        v37 = [v36 modifiedOn];
        uint64_t v38 = [v37 compare:v7];

        if (v38 == 1)
        {
LABEL_27:
          v39 = [v29 memberships];
          v40 = [v39 objectForKeyedSubscript:v34];

          v41 = [(REMTextMemberships *)v31 memberships];
          v42 = [v41 objectForKeyedSubscript:v34];

          if (!v42) {
            goto LABEL_33;
          }
          v43 = [v42 modifiedOn];
          v44 = [v40 modifiedOn];
          uint64_t v45 = [v43 compare:v44];

          v31 = v58;
          if (v45 == -1) {
            goto LABEL_33;
          }
          if (!v45)
          {
            uint64_t v46 = [v42 identifier];
            if (!v46) {
              goto LABEL_33;
            }
            v47 = (void *)v46;
            v48 = [v40 identifier];
            v49 = [v42 identifier];
            uint64_t v50 = [v48 compare:v49];

            v31 = v58;
            BOOL v51 = v50 == 1;
            v29 = v54;
            if (v51) {
LABEL_33:
            }
              [v56 setObject:v40 forKeyedSubscript:v34];
          }
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v32);
  }

  v52 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMemberships:v56 lastResetDate:v7];

  return v52;
}

- (id)removing:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(REMTextMemberships *)self memberships];
  id v8 = (void *)[v6 initWithDictionary:v7];

  [v8 removeObjectsForKeys:v5];
  id v9 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = [(REMTextMemberships *)self lastResetDate];
  id v11 = (void *)[v9 initWithMemberships:v8 lastResetDate:v10];

  return v11;
}

- (void)reset
{
  v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  memberships = self->_memberships;
  self->_memberships = v3;

  self->_lastResetDate = [MEMORY[0x1E4F1C9C8] date];

  MEMORY[0x1F41817F8]();
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(REMTextMemberships *)self memberships];
  id v6 = [(REMTextMemberships *)self lastResetDate];
  id v7 = [v3 stringWithFormat:@"<%@: %p memberships: %@, lastResetDate: %@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v5 = [(REMTextMemberships *)self memberships];
  uint64_t v6 = [v4 memberships];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMTextMemberships *)self memberships];
    id v9 = [v4 memberships];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v12 = [(REMTextMemberships *)self lastResetDate];
  uint64_t v13 = [v4 lastResetDate];
  if (v12 == (void *)v13)
  {
    char v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    uint64_t v15 = [(REMTextMemberships *)self lastResetDate];
    uint64_t v16 = [v4 lastResetDate];
    char v11 = [v15 isEqual:v16];
  }
LABEL_10:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(REMTextMemberships *)self memberships];
  uint64_t v6 = [(REMTextMemberships *)self lastResetDate];
  id v7 = (void *)[v4 initWithMemberships:v5 lastResetDate:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTextMemberships)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  id v9 = [v5 decodeObjectOfClasses:v8 forKey:@"memberships"];

  int v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"lastResetDate"];

  char v11 = [(REMTextMemberships *)self initWithMemberships:v9 lastResetDate:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMTextMemberships *)self memberships];
  [v4 encodeObject:v5 forKey:@"memberships"];

  id v6 = [(REMTextMemberships *)self lastResetDate];
  [v4 encodeObject:v6 forKey:@"lastResetDate"];
}

- (NSDictionary)memberships
{
  return self->_memberships;
}

- (NSDate)lastResetDate
{
  return self->_lastResetDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResetDate, 0);

  objc_storeStrong((id *)&self->_memberships, 0);
}

@end