@interface PPContactQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)hasNoConstraints;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContactQuery:(id)a3;
- (BOOL)onlyQueryMostRelevantContacts;
- (NSArray)matchingIdentifiers;
- (NSString)context;
- (NSString)matchingEmail;
- (NSString)matchingName;
- (NSString)matchingPhone;
- (NSString)matchingPostalAddress;
- (NSString)targetBundleIdentifier;
- (PPContactQuery)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)domain;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setDomain:(unsigned __int8)a3;
- (void)setMatchingEmail:(id)a3;
- (void)setMatchingIdentifiers:(id)a3;
- (void)setMatchingName:(id)a3;
- (void)setMatchingPhone:(id)a3;
- (void)setMatchingPostalAddress:(id)a3;
- (void)setOnlyQueryMostRelevantContacts:(BOOL)a3;
- (void)setTargetBundleIdentifier:(id)a3;
@end

@implementation PPContactQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_targetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_matchingPostalAddress, 0);
  objc_storeStrong((id *)&self->_matchingPhone, 0);
  objc_storeStrong((id *)&self->_matchingEmail, 0);
  objc_storeStrong((id *)&self->_matchingName, 0);
  objc_storeStrong((id *)&self->_matchingIdentifiers, 0);
}

- (void)setOnlyQueryMostRelevantContacts:(BOOL)a3
{
  self->_onlyQueryMostRelevantContacts = a3;
}

- (BOOL)onlyQueryMostRelevantContacts
{
  return self->_onlyQueryMostRelevantContacts;
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setTargetBundleIdentifier:(id)a3
{
}

- (NSString)targetBundleIdentifier
{
  return self->_targetBundleIdentifier;
}

- (void)setDomain:(unsigned __int8)a3
{
  self->_domain = a3;
}

- (unsigned)domain
{
  return self->_domain;
}

- (void)setMatchingPostalAddress:(id)a3
{
}

- (NSString)matchingPostalAddress
{
  return self->_matchingPostalAddress;
}

- (void)setMatchingPhone:(id)a3
{
}

- (NSString)matchingPhone
{
  return self->_matchingPhone;
}

- (void)setMatchingEmail:(id)a3
{
}

- (NSString)matchingEmail
{
  return self->_matchingEmail;
}

- (void)setMatchingName:(id)a3
{
}

- (NSString)matchingName
{
  return self->_matchingName;
}

- (void)setMatchingIdentifiers:(id)a3
{
}

- (NSArray)matchingIdentifiers
{
  return self->_matchingIdentifiers;
}

- (BOOL)isEqualToContactQuery:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_29;
  }
  matchingIdentifiers = self->_matchingIdentifiers;
  v7 = (NSArray *)v4[2];
  if (matchingIdentifiers == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = matchingIdentifiers;
    char v10 = [(NSArray *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_29;
    }
  }
  matchingName = self->_matchingName;
  v12 = (NSString *)v5[3];
  if (matchingName == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = matchingName;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_29;
    }
  }
  matchingEmail = self->_matchingEmail;
  v17 = (NSString *)v5[4];
  if (matchingEmail == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = matchingEmail;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_29;
    }
  }
  matchingPhone = self->_matchingPhone;
  v22 = (NSString *)v5[5];
  if (matchingPhone == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = matchingPhone;
    char v25 = [(NSString *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_29;
    }
  }
  matchingPostalAddress = self->_matchingPostalAddress;
  v27 = (NSString *)v5[6];
  if (matchingPostalAddress == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = matchingPostalAddress;
    char v30 = [(NSString *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_29;
    }
  }
  if (self->_domain == *((unsigned __int8 *)v5 + 8))
  {
    targetBundleIdentifier = self->_targetBundleIdentifier;
    v32 = (NSString *)v5[7];
    if (targetBundleIdentifier == v32)
    {
    }
    else
    {
      v33 = v32;
      v34 = targetBundleIdentifier;
      char v35 = [(NSString *)v34 isEqual:v33];

      if ((v35 & 1) == 0) {
        goto LABEL_29;
      }
    }
    context = self->_context;
    v37 = (NSString *)v5[8];
    if (context == v37)
    {
    }
    else
    {
      v38 = v37;
      v39 = context;
      char v40 = [(NSString *)v39 isEqual:v38];

      if ((v40 & 1) == 0) {
        goto LABEL_29;
      }
    }
    BOOL v41 = self->_onlyQueryMostRelevantContacts == *((unsigned __int8 *)v5 + 9);
    goto LABEL_30;
  }
LABEL_29:
  BOOL v41 = 0;
LABEL_30:

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPContactQuery *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPContactQuery *)self isEqualToContactQuery:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new();
  BOOL v6 = (void *)[(NSArray *)self->_matchingIdentifiers copyWithZone:a3];
  [v5 setMatchingIdentifiers:v6];

  v7 = (void *)[(NSString *)self->_matchingName copyWithZone:a3];
  [v5 setMatchingName:v7];

  v8 = (void *)[(NSString *)self->_matchingEmail copyWithZone:a3];
  [v5 setMatchingEmail:v8];

  v9 = (void *)[(NSString *)self->_matchingPhone copyWithZone:a3];
  [v5 setMatchingPhone:v9];

  char v10 = (void *)[(NSString *)self->_matchingPostalAddress copyWithZone:a3];
  [v5 setMatchingPostalAddress:v10];

  [v5 setDomain:self->_domain];
  v11 = (void *)[(NSString *)self->_targetBundleIdentifier copyWithZone:a3];
  [v5 setTargetBundleIdentifier:v11];

  v12 = (void *)[(NSString *)self->_context copyWithZone:a3];
  [v5 setContext:v12];

  [v5 setOnlyQueryMostRelevantContacts:self->_onlyQueryMostRelevantContacts];
  return v5;
}

- (unint64_t)hash
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = self->_matchingIdentifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "hash", (void)v21) - v6 + 32 * v6;
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
    uint64_t v9 = 31 * v6;
  }
  else
  {
    uint64_t v9 = 0;
  }

  NSUInteger v10 = [(NSString *)self->_matchingName hash];
  NSUInteger v11 = [(NSString *)self->_matchingEmail hash];
  NSUInteger v12 = [(NSString *)self->_matchingPhone hash];
  NSUInteger v13 = [(NSString *)self->_matchingPostalAddress hash];
  uint64_t domain = self->_domain;
  NSUInteger v15 = [(NSString *)self->_targetBundleIdentifier hash];
  NSUInteger v16 = [(NSString *)self->_context hash];
  uint64_t v17 = v11 - (v10 + v9) + 32 * (v10 + v9);
  uint64_t v18 = v13 - (v12 - v17 + 32 * v17) + 32 * (v12 - v17 + 32 * v17);
  uint64_t v19 = v15 - (domain - v18 + 32 * v18) + 32 * (domain - v18 + 32 * v18);
  return self->_onlyQueryMostRelevantContacts - (v16 - v19 + 32 * v19) + 32 * (v16 - v19 + 32 * v19);
}

- (void)encodeWithCoder:(id)a3
{
  matchingIdentifiers = self->_matchingIdentifiers;
  id v5 = a3;
  [v5 encodeObject:matchingIdentifiers forKey:@"mid"];
  [v5 encodeObject:self->_matchingName forKey:@"mnm"];
  [v5 encodeObject:self->_matchingEmail forKey:@"mem"];
  [v5 encodeObject:self->_matchingPhone forKey:@"mph"];
  [v5 encodeObject:self->_matchingPostalAddress forKey:@"mpo"];
  [v5 encodeInt32:self->_domain forKey:@"dom"];
  [v5 encodeObject:self->_targetBundleIdentifier forKey:@"tbi"];
  [v5 encodeObject:self->_context forKey:@"ctx"];
  [v5 encodeBool:self->_onlyQueryMostRelevantContacts forKey:@"onq"];
}

- (PPContactQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (PPContactQuery *)objc_opt_new();
  uint64_t v6 = (void *)MEMORY[0x192F97350]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  NSUInteger v10 = [v4 decodeObjectOfClasses:v9 forKey:@"mid"];
  [(PPContactQuery *)v5 setMatchingIdentifiers:v10];

  NSUInteger v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mnm"];
  [(PPContactQuery *)v5 setMatchingName:v11];

  NSUInteger v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mem"];
  [(PPContactQuery *)v5 setMatchingEmail:v12];

  NSUInteger v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mph"];
  [(PPContactQuery *)v5 setMatchingPhone:v13];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mpo"];
  [(PPContactQuery *)v5 setMatchingPostalAddress:v14];

  -[PPContactQuery setDomain:](v5, "setDomain:", [v4 decodeInt32ForKey:@"dom"]);
  NSUInteger v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tbi"];
  [(PPContactQuery *)v5 setTargetBundleIdentifier:v15];

  NSUInteger v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ctx"];
  [(PPContactQuery *)v5 setContext:v16];

  -[PPContactQuery setOnlyQueryMostRelevantContacts:](v5, "setOnlyQueryMostRelevantContacts:", [v4 decodeBoolForKey:@"onq"]);
  return v5;
}

- (BOOL)hasNoConstraints
{
  return ![(NSArray *)self->_matchingIdentifiers count]
      && ![(NSString *)self->_matchingName length]
      && ![(NSString *)self->_matchingEmail length]
      && ![(NSString *)self->_matchingPhone length]
      && [(NSString *)self->_matchingPostalAddress length] == 0;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPContactQuery i:'%@' n:'%@' e:'%@' ph:'%@' po:'%@' d:%d tbi:%@ c.len:%tu o:%d>", self->_matchingIdentifiers, self->_matchingName, self->_matchingEmail, self->_matchingPhone, self->_matchingPostalAddress, self->_domain, self->_targetBundleIdentifier, -[NSString length](self->_context, "length"), self->_onlyQueryMostRelevantContacts];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end