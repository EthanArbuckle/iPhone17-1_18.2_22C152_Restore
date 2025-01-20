@interface PLGenericLocationTuple
- (BOOL)isEqual:(id)a3;
- (NSString)lookupIdentifier;
- (NSString)text;
- (PLGenericLocationTuple)initWithText:(id)a3 lookupIdentifier:(id)a4 indexCategory:(unint64_t)a5;
- (id)description;
- (unint64_t)hash;
- (unint64_t)indexCategory;
@end

@implementation PLGenericLocationTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (unint64_t)indexCategory
{
  return self->_indexCategory;
}

- (NSString)lookupIdentifier
{
  return self->_lookupIdentifier;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLGenericLocationTuple *)self indexCategory];
  v4 = [(PLGenericLocationTuple *)self text];
  v5 = [v4 localizedLowercaseString];
  uint64_t v6 = [v5 hash];
  v7 = [(PLGenericLocationTuple *)self lookupIdentifier];
  unint64_t v8 = v6 ^ v3 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLGenericLocationTuple *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(PLGenericLocationTuple *)self text];
      if ([v6 length])
      {
        v7 = [(PLGenericLocationTuple *)v5 text];
        uint64_t v8 = [v7 length];

        if (!v8)
        {
          BOOL v10 = 0;
LABEL_11:
          v12 = [(PLGenericLocationTuple *)self lookupIdentifier];
          if ([v12 length])
          {
            v13 = [(PLGenericLocationTuple *)v5 lookupIdentifier];
            uint64_t v14 = [v13 length];

            if (v10) {
              goto LABEL_15;
            }
            if (v14)
            {
              v15 = [(PLGenericLocationTuple *)self lookupIdentifier];
              v16 = [(PLGenericLocationTuple *)v5 lookupIdentifier];
              int v17 = [v15 isEqualToString:v16];

              if (!v17) {
                goto LABEL_15;
              }
            }
          }
          else
          {

            if (v10)
            {
LABEL_15:
              BOOL v11 = 0;
LABEL_18:

              goto LABEL_19;
            }
          }
          unint64_t v18 = [(PLGenericLocationTuple *)self indexCategory];
          BOOL v11 = v18 == [(PLGenericLocationTuple *)v5 indexCategory];
          goto LABEL_18;
        }
        uint64_t v6 = [(PLGenericLocationTuple *)self text];
        v9 = [(PLGenericLocationTuple *)v5 text];
        BOOL v10 = [v6 localizedCaseInsensitiveCompare:v9] != 0;
      }
      else
      {
        BOOL v10 = 0;
      }

      goto LABEL_11;
    }
    BOOL v11 = 0;
  }
LABEL_19:

  return v11;
}

- (id)description
{
  v2 = NSString;
  text = self->_text;
  lookupIdentifier = self->_lookupIdentifier;
  v5 = PLDebugStringForSearchIndexCategory(self->_indexCategory);
  uint64_t v6 = [v2 stringWithFormat:@"Generic Location Tuple for text: %@, lookupIdentifier: %@, indexCategory: %@", text, lookupIdentifier, v5];

  return v6;
}

- (PLGenericLocationTuple)initWithText:(id)a3 lookupIdentifier:(id)a4 indexCategory:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (![v9 length])
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLGenericLocationTuple.m", 15, @"Invalid parameter not satisfying: %@", @"text.length > 0" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PLGenericLocationTuple;
  BOOL v11 = [(PLGenericLocationTuple *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    text = v11->_text;
    v11->_text = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    lookupIdentifier = v11->_lookupIdentifier;
    v11->_lookupIdentifier = (NSString *)v14;

    v11->_indexCategory = a5;
  }

  return v11;
}

@end