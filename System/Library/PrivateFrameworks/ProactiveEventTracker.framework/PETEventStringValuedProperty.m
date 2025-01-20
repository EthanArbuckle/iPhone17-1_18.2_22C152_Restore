@interface PETEventStringValuedProperty
- (BOOL)isValidValue:(id)a3;
- (PETEventStringValuedProperty)initWithName:(id)a3 possibleValues:(id)a4 autoSanitizeValues:(BOOL)a5;
- (id)_loggingKeyStringRepresentationForValue:(id)a3;
- (id)description;
- (id)longestValueString;
- (id)possibleValues;
- (unint64_t)cardinality;
@end

@implementation PETEventStringValuedProperty

- (id)_loggingKeyStringRepresentationForValue:(id)a3
{
  id v4 = a3;
  if ([(PETEventStringValuedProperty *)self isValidValue:v4])
  {
    if (self->_autoSanitizeValues)
    {
      id v5 = +[PETEventStringValidator sanitizedString:v4];
    }
    else
    {
      id v5 = v4;
    }
    v6 = v5;
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
    BOOL autoSanitizeValues = self->_autoSanitizeValues;
    possibleValues = self->_possibleValues;
    if (autoSanitizeValues)
    {
      v7 = +[PETEventStringValidator sanitizedString:v4];
      BOOL v8 = [(NSSet *)possibleValues containsObject:v7];
    }
    else
    {
      BOOL v8 = [(NSSet *)possibleValues containsObject:v4];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
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
  v2 = self->_possibleValues;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    v6 = &stru_1EE08A1D0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v9 = objc_msgSend(v8, "length", (void)v12);
        if (v9 > [(__CFString *)v6 length])
        {
          v10 = v8;

          v6 = v10;
        }
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    v6 = &stru_1EE08A1D0;
  }

  return v6;
}

- (id)possibleValues
{
  return self->_possibleValues;
}

- (unint64_t)cardinality
{
  return [(NSSet *)self->_possibleValues count];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(PETEventProperty *)self name];
  uint64_t v5 = [v3 stringWithFormat:@"StringValued: Name=%@ Values=%@", v4, self->_possibleValues];

  return v5;
}

- (PETEventStringValuedProperty)initWithName:(id)a3 possibleValues:(id)a4 autoSanitizeValues:(BOOL)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PETEventStringValuedProperty;
  unint64_t v9 = [(PETEventProperty *)&v16 initWithName:a3];
  if (v9)
  {
    if (a5)
    {
      uint64_t v10 = +[PETEventStringValidator sanitizedSet:v8];
    }
    else
    {
      if (!+[PETEventStringValidator setContainsValidStrings:v8])
      {
        v11 = (void *)MEMORY[0x1E4F1CA00];
        long long v12 = [NSString stringWithFormat:@"possibleValues may only contain [a-zA-Z0-9_] and may not be prefixed with _ -- possibleValues was: %@", v8];
        long long v13 = [v11 exceptionWithName:@"PETEventTrackingException" reason:v12 userInfo:0];

        [v13 raise];
      }
      uint64_t v10 = [v8 copy];
    }
    possibleValues = v9->_possibleValues;
    v9->_possibleValues = (NSSet *)v10;

    v9->_BOOL autoSanitizeValues = a5;
  }

  return v9;
}

@end