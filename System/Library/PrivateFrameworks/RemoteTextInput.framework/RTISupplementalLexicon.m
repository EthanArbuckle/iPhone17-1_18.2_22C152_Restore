@interface RTISupplementalLexicon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)iconForIdentifier;
- (RTISupplementalLexicon)initWithCoder:(id)a3;
- (RTISupplementalLexicon)initWithTISupplementalLexicon:(id)a3 iconForIdentifier:(id)a4;
- (RTISupplementalLexicon)initWithTISupplementalLexicon:(id)a3 iconProvider:(id)a4;
- (TISupplementalLexicon)lexicon;
- (id)description;
- (id)iconForIdentifier:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateSupplementalItems:(id)a3;
- (void)setIconForIdentifier:(id)a3;
@end

@implementation RTISupplementalLexicon

- (RTISupplementalLexicon)initWithTISupplementalLexicon:(id)a3 iconForIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTISupplementalLexicon;
  v8 = [(RTISupplementalLexicon *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    lexicon = v8->_lexicon;
    v8->_lexicon = (TISupplementalLexicon *)v9;

    uint64_t v11 = [v7 copy];
    iconForIdentifier = v8->_iconForIdentifier;
    v8->_iconForIdentifier = (NSDictionary *)v11;
  }
  return v8;
}

- (RTISupplementalLexicon)initWithTISupplementalLexicon:(id)a3 iconProvider:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = [v6 items];
  v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  if (v7)
  {
    id v21 = v6;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [v6 items];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v17 = v7[2](v7, [v16 identifier]);
          if (v17)
          {
            v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v16, "identifier"));
            [v10 setObject:v17 forKey:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    id v6 = v21;
  }
  v19 = [(RTISupplementalLexicon *)self initWithTISupplementalLexicon:v6 iconForIdentifier:v10];

  return v19;
}

- (void)enumerateSupplementalItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = [(RTISupplementalLexicon *)self lexicon];
    id v6 = [v5 items];

    id obj = v6;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = [v11 identifier];
          uint64_t v13 = [(RTISupplementalLexicon *)self iconForIdentifier];
          uint64_t v14 = [NSNumber numberWithUnsignedLongLong:v12];
          v15 = [v13 objectForKey:v14];

          v4[2](v4, v11, v15);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

- (id)iconForIdentifier:(unint64_t)a3
{
  v4 = [(RTISupplementalLexicon *)self iconForIdentifier];
  v5 = [NSNumber numberWithUnsignedLongLong:a3];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (unint64_t)identifier
{
  return [(TISupplementalLexicon *)self->_lexicon identifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeObject:self->_lexicon forKey:@"suppLex"];
  [v4 encodeObject:self->_iconForIdentifier forKey:@"iconForId"];
}

- (RTISupplementalLexicon)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  if (self)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:3];
    uint64_t v7 = objc_msgSend(v5, "setWithArray:", v6, v11, v12);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"iconForId"];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suppLex"];
    self = [(RTISupplementalLexicon *)self initWithTISupplementalLexicon:v9 iconForIdentifier:v8];
  }
  return self;
}

- (unint64_t)hash
{
  return [(TISupplementalLexicon *)self->_lexicon identifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTISupplementalLexicon *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(RTISupplementalLexicon *)self lexicon];
      id v6 = [(RTISupplementalLexicon *)v4 lexicon];
      if ([v5 isEqualToSupplementalLexicon:v6])
      {
        uint64_t v7 = [(RTISupplementalLexicon *)self iconForIdentifier];
        uint64_t v8 = [(RTISupplementalLexicon *)v4 iconForIdentifier];
        char v9 = [v7 isEqualToDictionary:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; identifier=%llu",
    objc_opt_class(),
    self,
  v3 = [(RTISupplementalLexicon *)self identifier]);
  id v4 = [(RTISupplementalLexicon *)self lexicon];
  [v3 appendFormat:@", lexicon=%@", v4];

  v5 = [(RTISupplementalLexicon *)self iconForIdentifier];
  [v3 appendFormat:@", iconForIdentifier=%@>", v5];

  return v3;
}

- (TISupplementalLexicon)lexicon
{
  return self->_lexicon;
}

- (NSDictionary)iconForIdentifier
{
  return self->_iconForIdentifier;
}

- (void)setIconForIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconForIdentifier, 0);
  objc_storeStrong((id *)&self->_lexicon, 0);
}

@end