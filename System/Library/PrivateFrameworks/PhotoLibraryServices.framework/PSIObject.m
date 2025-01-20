@interface PSIObject
- (BOOL)isUpdate;
- (NSArray)tokens;
- (NSString)description;
- (NSString)uuid;
- (PSIObject)initWithUUID:(id)a3;
- (id)_initForCopy:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForReverse;
- (unint64_t)objectType;
- (void)addContentString:(id)a3 category:(signed __int16)a4 owningCategory:(signed __int16)a5;
- (void)addContentString:(id)a3 identifier:(id)a4 category:(signed __int16)a5 owningCategory:(signed __int16)a6;
- (void)addIdentifier:(id)a3 category:(signed __int16)a4 owningCategory:(signed __int16)a5;
- (void)addSynonym:(id)a3 category:(signed __int16)a4 originalContentString:(id)a5;
- (void)addSynonym:(id)a3 lookupIdentifier:(id)a4 category:(signed __int16)a5 originalContentString:(id)a6;
- (void)clear;
- (void)enumerateSynonymsForOriginalContentString:(id)a3 orOriginalLookupIdentifier:(id)a4 handler:(id)a5;
- (void)reverse;
- (void)setUUID:(id)a3;
@end

@implementation PSIObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_synonymsByOriginalLookupIdentifier, 0);
  objc_storeStrong((id *)&self->_synonymsByOriginalWord, 0);
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setUUID:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unint64_t)objectType
{
  v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)isUpdate
{
  return 0;
}

- (void)clear
{
  [(PSIObject *)self setUUID:0];
  [(NSArray *)self->_tokens removeAllObjects];
  synonymsByOriginalWord = self->_synonymsByOriginalWord;
  [(NSMutableDictionary *)synonymsByOriginalWord removeAllObjects];
}

- (void)reverse
{
  uint64_t v3 = [(NSArray *)self->_tokens count];
  if (v3 >= 2)
  {
    CFIndex v4 = v3 - 1;
    uint64_t v5 = 1;
    do
      CFArrayExchangeValuesAtIndices((CFMutableArrayRef)self->_tokens, v5 - 1, v4--);
    while (v5++ < v4);
  }
}

- (void)enumerateSynonymsForOriginalContentString:(id)a3 orOriginalLookupIdentifier:(id)a4 handler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v28 = a4;
  v8 = (void (**)(id, void *, uint64_t, void *))a5;
  v9 = [(NSMutableDictionary *)self->_synonymsByOriginalWord objectForKey:a3];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v15 = [v14 synonym];
        uint64_t v16 = [v14 category];
        v17 = [v14 identifier];
        v8[2](v8, v15, v16, v17);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }
  v18 = v28;
  if ([v28 length])
  {
    v19 = [(NSMutableDictionary *)self->_synonymsByOriginalLookupIdentifier objectForKey:v28];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          v25 = [v24 synonym];
          uint64_t v26 = [v24 category];
          v27 = [v24 identifier];
          v8[2](v8, v25, v26, v27);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v21);
    }

    v18 = v28;
  }
}

- (void)addSynonym:(id)a3 lookupIdentifier:(id)a4 category:(signed __int16)a5 originalContentString:(id)a6
{
  uint64_t v7 = a5;
  id v17 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v17 length] && objc_msgSend(v11, "length"))
  {
    id v12 = [(NSMutableDictionary *)self->_synonymsByOriginalWord objectForKey:v11];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      synonymsByOriginalWord = self->_synonymsByOriginalWord;
      id v14 = v12;
      id v15 = v11;
LABEL_9:
      [(NSMutableDictionary *)synonymsByOriginalWord setObject:v14 forKey:v15];
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if ([v17 length] && objc_msgSend(v10, "length"))
  {
    id v12 = [(NSMutableDictionary *)self->_synonymsByOriginalLookupIdentifier objectForKey:v10];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      synonymsByOriginalWord = self->_synonymsByOriginalLookupIdentifier;
      id v14 = v12;
      id v15 = v10;
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v16 = [[PSISynonymRecord alloc] initWithSynonym:v17 category:v7 identifier:v10];
    [v12 addObject:v16];
  }
}

- (void)addSynonym:(id)a3 category:(signed __int16)a4 originalContentString:(id)a5
{
}

- (void)addContentString:(id)a3 identifier:(id)a4 category:(signed __int16)a5 owningCategory:(signed __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  id v12 = a3;
  id v10 = a4;
  if ([v12 length] || objc_msgSend(v10, "length"))
  {
    id v11 = [[PSIIndexToken alloc] initWithText:v12 identifier:v10 category:v7 owningCategory:v6];
    [(NSArray *)self->_tokens addObject:v11];
  }
}

- (void)addIdentifier:(id)a3 category:(signed __int16)a4 owningCategory:(signed __int16)a5
{
}

- (void)addContentString:(id)a3 category:(signed __int16)a4 owningCategory:(signed __int16)a5
{
}

- (NSString)description
{
  uint64_t v3 = [[PSIGroupResult alloc] initWithQueue:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSArray *)self->_tokens count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [(NSArray *)self->_tokens objectAtIndexedSubscript:v5];
      uint64_t v7 = [PSIGroupResultGroupSnapshot alloc];
      v8 = [v6 text];
      v9 = [v6 identifier];
      id v10 = -[PSIGroupResultGroupSnapshot initWithContentString:lookupIdentifier:category:](v7, "initWithContentString:lookupIdentifier:category:", v8, v9, [v6 category]);

      [v4 addObject:v10];
      ++v5;
    }
    while (v5 < [(NSArray *)self->_tokens count]);
  }
  [(PSIGroupResult *)v3 setGroups:v4];
  v15.receiver = self;
  v15.super_class = (Class)PSIObject;
  id v11 = [(PSIObject *)&v15 description];
  id v12 = [(PSIGroupResult *)v3 unitTestDescription];
  v13 = [v11 stringByAppendingFormat:@" %@", v12];

  return (NSString *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initForCopy:1];
  uint64_t v5 = [(NSString *)self->_uuid copy];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(NSArray *)self->_tokens mutableCopy];
  v8 = (void *)v4[4];
  v4[4] = v7;

  uint64_t v9 = [(NSMutableDictionary *)self->_synonymsByOriginalWord mutableCopy];
  id v10 = (void *)v4[1];
  v4[1] = v9;

  uint64_t v11 = [(NSMutableDictionary *)self->_synonymsByOriginalLookupIdentifier mutableCopy];
  id v12 = (void *)v4[2];
  v4[2] = v11;

  return v4;
}

- (id)initForReverse
{
  return [(PSIObject *)self _initForCopy:0];
}

- (PSIObject)initWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSIObject *)self _initForCopy:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;
  }
  return v5;
}

- (id)_initForCopy:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PSIObject;
  id v4 = [(PSIObject *)&v12 init];
  if (v4 && !a3)
  {
    uint64_t v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tokens = v4->_tokens;
    v4->_tokens = v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    synonymsByOriginalWord = v4->_synonymsByOriginalWord;
    v4->_synonymsByOriginalWord = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    synonymsByOriginalLookupIdentifier = v4->_synonymsByOriginalLookupIdentifier;
    v4->_synonymsByOriginalLookupIdentifier = v9;
  }
  return v4;
}

@end