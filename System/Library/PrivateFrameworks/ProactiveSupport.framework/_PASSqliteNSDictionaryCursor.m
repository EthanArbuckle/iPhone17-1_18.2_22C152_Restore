@interface _PASSqliteNSDictionaryCursor
+ (const)sqliteMethodName;
+ (id)planningInfoForKeyConstraint:(int)a3;
- (BOOL)currentIndexedRowSatisfiesConstraints;
- (id)currentIndexedKey;
- (id)currentIndexedValue;
- (void)applyKeyConstraint:(int)a3 withArgument:(id)a4;
- (void)finalizeConstraints;
- (void)setCollection:(id)a3;
- (void)stepIndexedRow;
@end

@implementation _PASSqliteNSDictionaryCursor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueEqualTo, 0);
  objc_storeStrong(&self->_currentValue, 0);
  objc_storeStrong(&self->_currentKey, 0);
  objc_storeStrong((id *)&self->_keysEnumerator, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (void)stepIndexedRow
{
  v3 = [(NSEnumerator *)self->_keysEnumerator nextObject];
  id currentKey = self->_currentKey;
  self->_id currentKey = v3;

  if (self->_currentKey)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:");
    self->_currentValue = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self->_currentValue = 0;
  }

  MEMORY[0x1F41817F8]();
}

- (BOOL)currentIndexedRowSatisfiesConstraints
{
  v4 = [(_PASSqliteNSDictionaryCursor *)self currentIndexedKey];
  v5 = [MEMORY[0x1E4F1CA98] null];

  if (v4 == v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_PASSqliteCollections.m", 1255, @"Invalid parameter not satisfying: %@", @"[self currentIndexedKey] != [NSNull null]" object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)_PASSqliteNSDictionaryCursor;
  return [(_PASSqliteCollectionsCursor *)&v8 currentIndexedRowSatisfiesConstraints];
}

- (id)currentIndexedValue
{
  return self->_currentValue;
}

- (id)currentIndexedKey
{
  return self->_currentKey;
}

- (void)finalizeConstraints
{
  dictionary = self->_dictionary;
  if (dictionary && [(NSDictionary *)dictionary count])
  {
    if ([(NSDictionary *)self->_dictionary count] == 1)
    {
      v4 = [(NSDictionary *)self->_dictionary allKeys];
      v5 = [v4 firstObject];
      id currentKey = self->_currentKey;
      self->_id currentKey = v5;

      self->_currentValue = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:self->_currentKey];
      MEMORY[0x1F41817F8]();
    }
    else
    {
      v7 = (void *)MEMORY[0x1A62450A0]();
      objc_super v8 = [(NSDictionary *)self->_dictionary keyEnumerator];
      keysEnumerator = self->_keysEnumerator;
      self->_keysEnumerator = v8;

      [(_PASSqliteNSDictionaryCursor *)self stepIndexedRow];
    }
  }
}

- (void)applyKeyConstraint:(int)a3 withArgument:(id)a4
{
  id v7 = a4;
  if (a3 != 72)
  {
    if (a3 == 71)
    {
      id currentKey = self->_currentKey;
      self->_id currentKey = 0;

      id currentValue = self->_currentValue;
      self->_id currentValue = 0;

      uint64_t v11 = 24;
      goto LABEL_8;
    }
    if (a3 != 2) {
      goto LABEL_16;
    }
  }
  p_id currentKey = &self->_currentKey;
  id v9 = self->_currentKey;
  if (!v9)
  {
    p_dictionary = &self->_dictionary;
    dictionary = self->_dictionary;
    if (dictionary)
    {
      v16 = [(NSDictionary *)dictionary objectForKeyedSubscript:v7];
      id v17 = self->_currentValue;
      self->_id currentValue = v16;

      if (v16)
      {
        objc_storeStrong(&self->_currentKey, a4);
        goto LABEL_15;
      }
      id v18 = *p_currentKey;
    }
    else
    {
      id v18 = 0;
    }
    *p_id currentKey = 0;

    id v19 = self->_currentValue;
    self->_id currentValue = 0;

    goto LABEL_15;
  }
  if ([v9 isEqual:v7]) {
    goto LABEL_16;
  }
  id v10 = *p_currentKey;
  *p_id currentKey = 0;

  uint64_t v11 = 48;
LABEL_8:
  p_dictionary = (NSDictionary **)((char *)self + v11);
LABEL_15:
  v20 = *p_dictionary;
  *p_dictionary = 0;

LABEL_16:

  MEMORY[0x1F41817F8]();
}

- (void)setCollection:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    v6 = (void *)MEMORY[0x1A62450A0]();
    objc_storeStrong((id *)&self->_dictionary, a3);
  }
  v7.receiver = self;
  v7.super_class = (Class)_PASSqliteNSDictionaryCursor;
  [(_PASSqliteCollectionsCursor *)&v7 setCollection:v5];
}

+ (id)planningInfoForKeyConstraint:(int)a3
{
  return +[_PASSqliteNSSetCursor planningInfoForValueConstraint:*(void *)&a3];
}

+ (const)sqliteMethodName
{
  return "_pas_nsdictionary";
}

@end