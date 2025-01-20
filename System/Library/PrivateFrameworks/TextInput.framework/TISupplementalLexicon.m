@interface TISupplementalLexicon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSupplementalLexicon:(id)a3;
- (NSArray)items;
- (TISupplementalLexicon)initWithCoder:(id)a3;
- (TISupplementalLexicon)initWithItems:(id)a3;
- (TISupplementalLexicon)initWithItems:(id)a3 searchPrefixes:(unint64_t)a4;
- (id)description;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)searchPrefixes;
- (unsigned)searchPrefixCharacter;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setItems:(id)a3;
- (void)setSearchPrefixes:(unint64_t)a3;
@end

@implementation TISupplementalLexicon

- (void).cxx_destruct
{
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setSearchPrefixes:(unint64_t)a3
{
  self->_searchPrefixes = a3;
}

- (unint64_t)searchPrefixes
{
  return self->_searchPrefixes;
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; identifier=%llu",
    objc_opt_class(),
    self,
  v3 = self->_identifier);
  v4 = v3;
  if (self->_searchPrefixes)
  {
    [v3 appendString:@", searchPrefixesScanSet="];
    unint64_t searchPrefixes = self->_searchPrefixes;
    if (searchPrefixes)
    {
      [v4 appendString:@"@"];
      unint64_t searchPrefixes = self->_searchPrefixes;
    }
    if ((searchPrefixes & 2) != 0) {
      [v4 appendString:@"#"];
    }
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_items, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = self->_items;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) description];
        [v6 addObject:v12];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v13 = [v6 componentsJoinedByString:@", "];
  [v4 appendFormat:@", items={ %@ }>", v13];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TISupplementalLexicon *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TISupplementalLexicon *)self isEqualToSupplementalLexicon:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  items = self->_items;
  id v5 = a3;
  [v5 encodeObject:items forKey:@"items"];
  [v5 encodeInteger:self->_searchPrefixes forKey:@"searchPrefixes"];
  id v6 = [NSNumber numberWithUnsignedLongLong:self->_identifier];
  [v5 encodeObject:v6 forKey:@"identifier"];
}

- (TISupplementalLexicon)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TISupplementalLexicon *)self init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:3];
    uint64_t v8 = objc_msgSend(v6, "setWithArray:", v7, v14, v15);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v9;

    v5->_unint64_t searchPrefixes = [v4 decodeIntegerForKey:@"searchPrefixes"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    v5->_identifier = [v11 unsignedLongLongValue];

    v12 = v5;
  }

  return v5;
}

- (BOOL)isEqualToSupplementalLexicon:(id)a3
{
  return self->_identifier == *((void *)a3 + 3);
}

- (unsigned)searchPrefixCharacter
{
  unint64_t v2 = [(TISupplementalLexicon *)self searchPrefixes];
  if (v2 == 2) {
    return 35;
  }
  else {
    return (v2 == 1) << 6;
  }
}

- (TISupplementalLexicon)initWithItems:(id)a3
{
  return [(TISupplementalLexicon *)self initWithItems:a3 searchPrefixes:1];
}

- (TISupplementalLexicon)initWithItems:(id)a3 searchPrefixes:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TISupplementalLexicon;
  v7 = [(TISupplementalLexicon *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    items = v7->_items;
    v7->_items = (NSArray *)v8;

    uint64_t v10 = ++generateIdentifier_count_9515;
    v7->_unint64_t searchPrefixes = a4;
    v7->_identifier = v10;
    v11 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end