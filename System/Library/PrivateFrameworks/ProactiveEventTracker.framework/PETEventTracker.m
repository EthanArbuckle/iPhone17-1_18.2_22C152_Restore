@interface PETEventTracker
- (BOOL)_validatePropertyValues:(id)a3;
- (BOOL)testingMode;
- (NSArray)propertySubsets;
- (NSArray)registeredProperties;
- (NSString)featureId;
- (PETEventTracker)initWithFeatureId:(id)a3 registerProperties:(id)a4 propertySubsets:(id)a5;
- (PETLoggingOutlet)loggingOutlet;
- (id)_defaultLoggingOutlet;
- (id)_keyMetadataForEvent:(id)a3;
- (id)_stringifiedPropertiesForEvent:(id)a3 propertyValueArray:(id)a4;
- (id)getKeyValueDict;
- (id)getValueForKey:(id)a3;
- (void)_checkCardinalityForEvent:(id)a3;
- (void)_checkInTestingMode;
- (void)_checkKeyLengthForEvent:(id)a3 metaData:(id)a4;
- (void)_checkPropertySubsets:(id)a3;
- (void)_logValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6;
- (void)_setLoggingOutlet:(id)a3;
- (void)_setValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6;
- (void)_trackEvent:(id)a3 withPropertyValues:(id)a4 value:(id)a5;
- (void)_trackEvent:(id)a3 withPropertyValues:(id)a4 value:(id)a5 overwrite:(BOOL)a6;
- (void)disableTestingMode;
- (void)enableTestingMode;
@end

@implementation PETEventTracker

- (void)_trackEvent:(id)a3 withPropertyValues:(id)a4 value:(id)a5 overwrite:(BOOL)a6
{
  BOOL v28 = a6;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v29 = a5;
  v11 = (void *)MEMORY[0x192FD4890]();
  if (![v9 length])
  {
    v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PETEventTrackingException" reason:@"Parameter 'event' must have a valid non-zero length value" userInfo:0];
    [v12 raise];
  }
  if ([(PETEventTracker *)self _validatePropertyValues:v10])
  {
    v13 = [(PETEventTracker *)self _stringifiedPropertiesForEvent:v9 propertyValueArray:v10];
    v14 = [(PETEventTracker *)self _keyMetadataForEvent:v9];
    id v26 = v10;
    id v15 = v9;
    if (v28) {
      [(PETEventTracker *)self _setValue:v29 forEvent:v9 stringifiedProperties:v13 metaData:v14];
    }
    else {
      [(PETEventTracker *)self _logValue:v29 forEvent:v9 stringifiedProperties:v13 metaData:v14];
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v17 = self;
    obj = self->_propertySubsets;
    uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x192FD4890]();
          v24 = [v13 subsetForKeys:v22];
          v25 = [[PETStringPairs alloc] initWithKeys:&unk_1EE090B00 values:&unk_1EE090B18];
          if (v28) {
            [(PETEventTracker *)v17 _setValue:v29 forEvent:v15 stringifiedProperties:v24 metaData:v25];
          }
          else {
            [(PETEventTracker *)v17 _logValue:v29 forEvent:v15 stringifiedProperties:v24 metaData:v25];
          }
        }
        uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v19);
    }

    id v9 = v15;
    id v10 = v26;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      registeredProperties = self->_registeredProperties;
      *(_DWORD *)buf = 138412802;
      id v36 = v9;
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2112;
      v40 = registeredProperties;
      _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalid property values passed in for event: %@, values: %@, registeredProperties: %@", buf, 0x20u);
    }
    [(PETLoggingOutlet *)self->_loggingOutlet logErrorForEvent:v9 featureId:self->_featureId reason:@"bad_prop"];
  }
}

- (void)_trackEvent:(id)a3 withPropertyValues:(id)a4 value:(id)a5
{
}

- (PETLoggingOutlet)loggingOutlet
{
  return self->_loggingOutlet;
}

- (NSString)featureId
{
  return self->_featureId;
}

- (id)_keyMetadataForEvent:(id)a3
{
  return 0;
}

- (id)_stringifiedPropertiesForEvent:(id)a3 propertyValueArray:(id)a4
{
  id v5 = a4;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_registeredProperties, "count"));
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_registeredProperties, "count"));
  v8 = [(PETEventTracker *)self registeredProperties];
  if ([v5 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [v5 objectAtIndexedSubscript:v9];
      v11 = [v8 objectAtIndexedSubscript:v9];
      v12 = [v11 name];
      [v6 addObject:v12];

      v13 = [v8 objectAtIndexedSubscript:v9];
      v14 = [v13 _loggingKeyStringRepresentationForValue:v10];
      [v7 addObject:v14];

      ++v9;
    }
    while (v9 < [v5 count]);
  }
  id v15 = [[PETStringPairs alloc] initWithKeys:v6 values:v7];

  return v15;
}

- (NSArray)registeredProperties
{
  return self->_registeredProperties;
}

- (BOOL)_validatePropertyValues:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5 != [(NSArray *)self->_registeredProperties count])
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"passed number of properties %tu is not equal to the defined number %tu", objc_msgSend(v4, "count"), -[NSArray count](self->_registeredProperties, "count"));
    v8 = [v6 exceptionWithName:@"PETEventTrackingException" reason:v7 userInfo:0];

    [v8 raise];
  }
  if ([v4 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [(NSArray *)self->_registeredProperties objectAtIndexedSubscript:v9];
      v11 = [v4 objectAtIndexedSubscript:v9];
      char v12 = [v10 isValidValue:v11];

      if ((v12 & 1) == 0) {
        break;
      }
      ++v9;
    }
    while ([v4 count] > v9);
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingOutlet, 0);
  objc_storeStrong((id *)&self->_propertySubsets, 0);
  objc_storeStrong((id *)&self->_registeredProperties, 0);

  objc_storeStrong((id *)&self->_featureId, 0);
}

- (BOOL)testingMode
{
  return self->_testingMode;
}

- (NSArray)propertySubsets
{
  return self->_propertySubsets;
}

- (void)disableTestingMode
{
  self->_testingMode = 0;
  self->_loggingOutlet = [(PETEventTracker *)self _defaultLoggingOutlet];

  MEMORY[0x1F41817F8]();
}

- (id)getValueForKey:(id)a3
{
  id v4 = a3;
  [(PETEventTracker *)self _checkInTestingMode];
  uint64_t v5 = [(PETLoggingOutlet *)self->_loggingOutlet getValueForKey:v4];

  return v5;
}

- (id)getKeyValueDict
{
  [(PETEventTracker *)self _checkInTestingMode];
  loggingOutlet = self->_loggingOutlet;

  return (id)[(PETLoggingOutlet *)loggingOutlet keyValues];
}

- (void)_checkInTestingMode
{
  if (!self->_testingMode)
  {
    id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"PETEventTrackingException" reason:@"Testing mode is not enabled. Call enableTestingMode() first" userInfo:0];
    [v2 raise];
  }
}

- (void)enableTestingMode
{
  self->_testingMode = 1;
  self->_loggingOutlet = (PETLoggingOutlet *)objc_alloc_init(PETTestLoggingOutlet);

  MEMORY[0x1F41817F8]();
}

- (void)_setLoggingOutlet:(id)a3
{
}

- (void)_setValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Subclasses must implement setValueforEvent", v6, 2u);
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Subclasses must implement setValueforEvent"];
}

- (void)_logValue:(id)a3 forEvent:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Subclasses must implement logValueforEvent", v6, 2u);
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Subclasses must implement logValueforEvent"];
}

- (void)_checkPropertySubsets:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = a3;
  uint64_t v27 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v41;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v3;
        id v4 = *(void **)(*((void *)&v40 + 1) + 8 * v3);
        context = (void *)MEMORY[0x192FD4890]();
        uint64_t v5 = [v4 count];
        v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
        uint64_t v7 = [v6 count];

        if (v5 != v7)
        {
          v8 = (void *)MEMORY[0x1E4F1CA00];
          unint64_t v9 = [NSString stringWithFormat:@"Duplicate elements found in property subset array: %@", v4];
          id v10 = [v8 exceptionWithName:@"PETEventTrackingException" reason:v9 userInfo:0];

          [v10 raise];
        }
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v30 = v4;
        uint64_t v11 = [v30 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v37;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v37 != v13) {
                objc_enumerationMutation(v30);
              }
              id v15 = *(void **)(*((void *)&v36 + 1) + 8 * v14);
              long long v32 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              v16 = self->_registeredProperties;
              uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v32 objects:v44 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v33;
LABEL_15:
                uint64_t v20 = 0;
                while (1)
                {
                  if (*(void *)v33 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  v21 = [*(id *)(*((void *)&v32 + 1) + 8 * v20) name];
                  char v22 = [v15 isEqualToString:v21];

                  if (v22) {
                    break;
                  }
                  if (v18 == ++v20)
                  {
                    uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v32 objects:v44 count:16];
                    if (v18) {
                      goto LABEL_15;
                    }
                    goto LABEL_21;
                  }
                }
              }
              else
              {
LABEL_21:

                v23 = (void *)MEMORY[0x1E4F1CA00];
                v24 = [NSString stringWithFormat:@"Invalid property name found in subset array: %@", v15];
                v16 = [v23 exceptionWithName:@"PETEventTrackingException" reason:v24 userInfo:0];

                [(NSArray *)v16 raise];
              }

              ++v14;
            }
            while (v14 != v12);
            uint64_t v12 = [v30 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v12);
        }

        uint64_t v3 = v29 + 1;
      }
      while (v29 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v27);
  }
}

- (void)_checkKeyLengthForEvent:(id)a3 metaData:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    id v23 = v7;
    context = (void *)MEMORY[0x192FD4890]();
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_registeredProperties, "count"));
    unint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_registeredProperties, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = self->_registeredProperties;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "name", context);
          [v8 addObject:v16];

          uint64_t v17 = [v15 longestValueString];
          [v9 addObject:v17];
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v12);
    }

    uint64_t v18 = [[PETStringPairs alloc] initWithKeys:v8 values:v9];
    id v7 = v23;
    uint64_t v19 = +[PETLoggingUtils keyStringForEvent:v6 featureId:self->_featureId stringifiedProperties:v18 metaData:v23];
    if ((unint64_t)[v19 length] >= 0x100
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      featureId = self->_featureId;
      uint64_t v21 = [v19 length];
      *(_DWORD *)buf = 138413058;
      id v29 = v6;
      __int16 v30 = 2112;
      long long v31 = featureId;
      __int16 v32 = 2048;
      uint64_t v33 = v21;
      __int16 v34 = 1024;
      int v35 = 255;
      _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "aggd key length may exceed the limit - event: %@, featureId: %@, longestKeyLength: %lu, keyLengthLimit: %d. try to shorten the event/property names", buf, 0x26u);
    }
  }
}

- (void)_checkCardinalityForEvent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_registeredProperties;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      unint64_t v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v9 *= objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "cardinality", (void)v12);
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v22 count:16];
      }
      while (v7);

      if (v9 >= 0x65 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        featureId = self->_featureId;
        *(_DWORD *)buf = 138412802;
        id v17 = v4;
        __int16 v18 = 2112;
        uint64_t v19 = featureId;
        __int16 v20 = 2048;
        unint64_t v21 = v9;
        _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "high cardinality event found: %@, featureId: %@, cardinality: %lu. try to reduce the number of dimensions, or reduce the number of possbile values of properties", buf, 0x20u);
      }
    }
    else
    {
    }
  }
}

- (id)_defaultLoggingOutlet
{
  return +[PET2LoggingOutlet sharedInstance];
}

- (PETEventTracker)initWithFeatureId:(id)a3 registerProperties:(id)a4 propertySubsets:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PETEventTracker;
  uint64_t v11 = [(PETEventTracker *)&v24 init];
  if (v11)
  {
    if (!+[PETEventStringValidator stringIsValid:v8])
    {
      long long v12 = (void *)MEMORY[0x1E4F1CA00];
      long long v13 = [NSString stringWithFormat:@"featureId may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@", v8];
      long long v14 = [v12 exceptionWithName:@"PETEventTrackingException" reason:v13 userInfo:0];

      [v14 raise];
    }
    uint64_t v15 = [v8 copy];
    featureId = v11->_featureId;
    v11->_featureId = (NSString *)v15;

    uint64_t v17 = [v9 copy];
    registeredProperties = v11->_registeredProperties;
    v11->_registeredProperties = (NSArray *)v17;

    [(PETEventTracker *)v11 _checkPropertySubsets:v10];
    uint64_t v19 = [v10 copy];
    propertySubsets = v11->_propertySubsets;
    v11->_propertySubsets = (NSArray *)v19;

    uint64_t v21 = [(PETEventTracker *)v11 _defaultLoggingOutlet];
    loggingOutlet = v11->_loggingOutlet;
    v11->_loggingOutlet = (PETLoggingOutlet *)v21;

    v11->_testingMode = 0;
  }

  return v11;
}

@end