@interface PETEventEnumMappedProperty
- (BOOL)isValidValue:(id)a3;
- (PETEventEnumMappedProperty)initWithName:(id)a3 enumMapping:(id)a4 autoSanitizeValues:(BOOL)a5;
- (_NSRange)validRange;
- (id)_loggingKeyStringRepresentationForValue:(id)a3;
- (id)description;
- (id)longestValueString;
- (id)possibleValues;
- (unint64_t)cardinality;
@end

@implementation PETEventEnumMappedProperty

- (id)_loggingKeyStringRepresentationForValue:(id)a3
{
  id v4 = a3;
  if ([(PETEventEnumMappedProperty *)self isValidValue:v4])
  {
    if (self->_autoSanitizeValues)
    {
      v5 = [(NSDictionary *)self->_enumMap objectForKeyedSubscript:v4];
      v6 = +[PETEventStringValidator sanitizedString:v5];
    }
    else
    {
      v6 = [(NSDictionary *)self->_enumMap objectForKeyedSubscript:v4];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isValidValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(NSDictionary *)self->_enumMap objectForKeyedSubscript:v4];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (id)longestValueString
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(NSDictionary *)self->_enumMap allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    BOOL v6 = &stru_1EE08A1D0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v9 = [v8 length];
        if (v9 > [(__CFString *)v6 length])
        {
          v10 = v8;

          BOOL v6 = v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    BOOL v6 = &stru_1EE08A1D0;
  }

  return v6;
}

- (unint64_t)cardinality
{
  return [(NSDictionary *)self->_enumMap count];
}

- (id)possibleValues
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = [(NSDictionary *)self->_enumMap allKeys];
  uint64_t v5 = (void *)[v3 initWithArray:v4];

  return v5;
}

- (_NSRange)validRange
{
  NSUInteger v2 = 0;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = [(PETEventProperty *)self name];
  uint64_t v5 = [v3 stringWithFormat:@"EnumMapped: Name=%@ Mapping=%@", v4, self->_enumMap];

  return v5;
}

- (PETEventEnumMappedProperty)initWithName:(id)a3 enumMapping:(id)a4 autoSanitizeValues:(BOOL)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PETEventEnumMappedProperty;
  unint64_t v9 = [(PETEventProperty *)&v16 initWithName:a3];
  if (v9)
  {
    if (!a5
      && !+[PETEventStringValidator dictionaryContainsValidStrings:v8])
    {
      v10 = (void *)MEMORY[0x1E4F1CA00];
      v11 = [NSString stringWithFormat:@"mapping keys/values may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@", v8];
      long long v12 = [v10 exceptionWithName:@"PETEventTrackingException" reason:v11 userInfo:0];

      [v12 raise];
    }
    uint64_t v13 = [v8 copy];
    enumMap = v9->_enumMap;
    v9->_enumMap = (NSDictionary *)v13;

    v9->_autoSanitizeValues = a5;
  }

  return v9;
}

@end