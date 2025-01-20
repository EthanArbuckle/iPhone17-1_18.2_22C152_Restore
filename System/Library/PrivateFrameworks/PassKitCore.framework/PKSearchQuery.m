@interface PKSearchQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSArray)tokens;
- (NSString)identifier;
- (NSString)keyboardLanguage;
- (NSString)text;
- (PKSearchQuery)initWithCoder:(id)a3;
- (PKSearchQuery)initWithIdentifier:(id)a3 keyboardLanguage:(id)a4;
- (id)_groupTokenOfType:(unint64_t)a3;
- (id)accountUserToken;
- (id)amountToken;
- (id)categoryToken;
- (id)dateToken;
- (id)description;
- (id)locationTokens;
- (id)merchantToken;
- (id)peerPaymentSubTypeToken;
- (id)peerPaymentToken;
- (id)rewardsToken;
- (id)tags;
- (id)transactionSources;
- (id)transactionStatuses;
- (id)transactionTypes;
- (unint64_t)domain;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyboardLanguage:(id)a3;
- (void)setText:(id)a3;
- (void)setTokens:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKSearchQuery

- (PKSearchQuery)initWithIdentifier:(id)a3 keyboardLanguage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSearchQuery;
  v9 = [(PKSearchQuery *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_keyboardLanguage, a4);
  }

  return v10;
}

- (unint64_t)domain
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_tokens forKey:@"tokens"];
  [v5 encodeObject:self->_text forKey:@"text"];
  [v5 encodeObject:self->_keyboardLanguage forKey:@"keyboardLanguage"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_domain forKey:@"domain"];
}

- (PKSearchQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKSearchQuery;
  id v5 = [(PKSearchQuery *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v26, "setWithObjects:", v25, v24, v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"tokens"];
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardLanguage"];
    keyboardLanguage = v5->_keyboardLanguage;
    v5->_keyboardLanguage = (NSString *)v21;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_domain = [v4 decodeIntegerForKey:@"domain"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"language '%@'; ", self->_keyboardLanguage];
  [v3 appendFormat:@"text: '%@'; ", self->_text];
  [v3 appendFormat:@"tokens: '%@'; ", self->_tokens];
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEmpty
{
  return ![(NSString *)self->_text length] && [(NSArray *)self->_tokens count] == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  tokens = self->_tokens;
  uint64_t v6 = (NSArray *)v4[6];
  if (tokens && v6)
  {
    if ((-[NSArray isEqual:](tokens, "isEqual:") & 1) == 0) {
      goto LABEL_12;
    }
  }
  else if (tokens != v6)
  {
    goto LABEL_12;
  }
  text = self->_text;
  uint64_t v8 = (NSString *)v4[5];
  if (!text || !v8)
  {
    if (text == v8) {
      goto LABEL_10;
    }
LABEL_12:
    BOOL v9 = 0;
    goto LABEL_13;
  }
  if ((-[NSString isEqual:](text, "isEqual:") & 1) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  BOOL v9 = self->_type == v4[4];
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_text];
  [v3 safelyAddObject:self->_tokens];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)_groupTokenOfType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = self->_tokens;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = objc_msgSend(v9, "group", (void)v14);
          uint64_t v11 = [v10 type];

          if (v11 == a3)
          {
            id v12 = v9;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (id)categoryToken
{
  v2 = PKSearchTokensOfGroupTypeFromTokens(0, self->_tokens);
  id v3 = [v2 firstObject];

  return v3;
}

- (id)merchantToken
{
  v2 = PKSearchTokensOfGroupTypeFromTokens(1, self->_tokens);
  id v3 = [v2 firstObject];

  return v3;
}

- (id)peerPaymentToken
{
  v2 = PKSearchTokensOfGroupTypeFromTokens(12, self->_tokens);
  id v3 = [v2 firstObject];

  return v3;
}

- (id)accountUserToken
{
  v2 = PKSearchTokensOfGroupTypeFromTokens(16, self->_tokens);
  id v3 = [v2 firstObject];

  return v3;
}

- (id)locationTokens
{
  return PKSearchTokensOfGroupTypeFromTokens(13, self->_tokens);
}

- (id)amountToken
{
  v2 = PKSearchTokensOfTypeFromTokens(2, self->_tokens);
  id v3 = [v2 firstObject];

  return v3;
}

- (id)dateToken
{
  v2 = PKSearchTokensOfTypeFromTokens(3, self->_tokens);
  id v3 = [v2 firstObject];

  return v3;
}

- (id)transactionTypes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = PKSearchTokensOfTypeFromTokens(4, self->_tokens);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "transactionType"));
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (id)transactionStatuses
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = PKSearchTokensOfTypeFromTokens(5, self->_tokens);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) transactionStatus];
        uint64_t v10 = [NSNumber numberWithInteger:v9];
        [v3 addObject:v10];

        if (!v9) {
          [v3 addObject:&unk_1EE22B9C0];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

- (id)transactionSources
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = PKSearchTokensOfTypeFromTokens(6, self->_tokens);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "transactionSource"));
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (id)peerPaymentSubTypeToken
{
  v2 = PKSearchTokensOfTypeFromTokens(7, self->_tokens);
  id v3 = [v2 firstObject];

  return v3;
}

- (id)rewardsToken
{
  v2 = PKSearchTokensOfTypeFromTokens(8, self->_tokens);
  id v3 = [v2 firstObject];

  return v3;
}

- (id)tags
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = PKSearchTokensOfTypeFromTokens(9, self->_tokens);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) tag];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (void)setKeyboardLanguage:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end