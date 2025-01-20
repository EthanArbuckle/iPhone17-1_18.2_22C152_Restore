@interface _PSFeatureDictionary
+ (id)_toPlistValue:(uint64_t)a1;
+ (uint64_t)_fromPlistValue:(uint64_t)a3 timeBucket:;
- (_PSFeatureDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)_removeObjectForKey:(uint64_t)a1;
- (void)_setPlistValue:(uint64_t)a3 inTimeBucket:(void *)a4 forKey:;
- (void)_timeBucketsCreateIfNeeded;
- (void)_unoptimizedValuesCreateIfNeeded;
- (void)addEntriesFromDictionary:(id)a3;
- (void)addEntriesFromDictionary:(id)a3 overwrite:(BOOL)a4;
- (void)addFeatureWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucket:(int)a7 forKey:(id)a8;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _PSFeatureDictionary

- (_PSFeatureDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v8 = [(_PSFeatureDictionary *)self init];
  if (v8 && a5)
  {
    do
    {
      uint64_t v10 = (uint64_t)*a3++;
      uint64_t v9 = v10;
      uint64_t v11 = (uint64_t)*a4++;
      [(_PSFeatureDictionary *)v8 setObject:v9 forKeyedSubscript:v11];
      --a5;
    }
    while (a5);
  }
  return v8;
}

- (void)_timeBucketsCreateIfNeeded
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[1];
    if (!v3)
    {
      uint64_t v4 = objc_opt_new();
      v5 = (void *)v2[1];
      v2[1] = v4;

      v3 = (void *)v2[1];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_unoptimizedValuesCreateIfNeeded
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[2];
    if (!v3)
    {
      uint64_t v4 = objc_opt_new();
      v5 = (void *)v2[2];
      v2[2] = v4;

      v3 = (void *)v2[2];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (unint64_t)count
{
  return self->_count;
}

+ (id)_toPlistValue:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (![v2 hasBoolValue])
  {
    if ([v2 hasIntValue])
    {
      v6 = (void *)MEMORY[0x1A6243860]();
      objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v2, "intValue"));
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (![v2 hasDoubleValue])
      {
        uint64_t v11 = [v2 stringValue];
        v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [MEMORY[0x1E4F1CA98] null];
        }
        id v5 = v13;

        goto LABEL_18;
      }
      v6 = (void *)MEMORY[0x1A6243860]();
      [v2 doubleValue];
      double v8 = v7;
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v7];
      if (malloc_size(v9) || ([v9 timeIntervalSinceReferenceDate], v14 != v8))
      {
        id v10 = [NSNumber numberWithDouble:v8];
      }
      else
      {
        id v10 = v9;
      }
      id v5 = v10;
    }
    goto LABEL_18;
  }
  int v3 = [v2 BOOLValue];
  uint64_t v4 = &unk_1EF676840;
  if (v3) {
    uint64_t v4 = &unk_1EF676818;
  }
  id v5 = v4;
LABEL_18:

  return v5;
}

+ (uint64_t)_fromPlistValue:(uint64_t)a3 timeBucket:
{
  id v4 = a2;
  self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (CFNumberIsFloatType((CFNumberRef)v4))
      {
        if (a3 || ([v4 doubleValue], v11 != 0.0))
        {
          id v12 = objc_alloc(MEMORY[0x1E4F4FEE8]);
          id v13 = 0;
          id v14 = v4;
LABEL_30:
          id v15 = 0;
          goto LABEL_31;
        }
        if (internedValues_onceToken == -1)
        {
LABEL_42:
          v21 = (void *)internedValues_values_4;
LABEL_43:
          id v22 = v21;
          goto LABEL_44;
        }
LABEL_49:
        dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
        goto LABEL_42;
      }
      if (!a3)
      {
        uint64_t v23 = [v4 unsignedIntegerValue];
        if (v23 == 1)
        {
          if (internedValues_onceToken != -1) {
            dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
          }
          v21 = (void *)internedValues_values_3;
          goto LABEL_43;
        }
        if (!v23)
        {
          if (internedValues_onceToken != -1) {
            dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
          }
          v21 = (void *)internedValues_values_2;
          goto LABEL_43;
        }
      }
      id v12 = objc_alloc(MEMORY[0x1E4F4FEE8]);
      id v13 = v4;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = objc_alloc(MEMORY[0x1E4F4FEE8]);
        id v13 = 0;
        id v14 = 0;
        id v15 = v4;
LABEL_31:
        id v22 = (id)[v12 initWithIntValue:v13 doubleValue:v14 stringValue:v15 BOOLValue:0 timeBucketValue:a3];
LABEL_44:
        uint64_t v10 = (uint64_t)v22;
        goto LABEL_45;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 timeIntervalSinceReferenceDate];
        double v20 = v19;
        if (a3 || v19 != 0.0)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F4FEE8]);
          v6 = [NSNumber numberWithDouble:v20];
          double v7 = v24;
          double v8 = v6;
          uint64_t v9 = 0;
          goto LABEL_4;
        }
        if (internedValues_onceToken == -1) {
          goto LABEL_42;
        }
        goto LABEL_49;
      }
      if (!a3)
      {
        if (internedValues_onceToken != -1) {
          dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
        }
        v21 = (void *)internedValues_values_5;
        goto LABEL_43;
      }
      id v12 = objc_alloc(MEMORY[0x1E4F4FEE8]);
      id v13 = 0;
    }
    id v14 = 0;
    goto LABEL_30;
  }
  if (!a3)
  {
    v16 = [v4 objectForKeyedSubscript:@"BOOL"];
    int v17 = [v16 BOOLValue];

    if (v17)
    {
      if (internedValues_onceToken != -1) {
        dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
      }
      v18 = &internedValues_values_0;
    }
    else
    {
      if (internedValues_onceToken != -1) {
        dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
      }
      v18 = &internedValues_values_1;
    }
    v21 = (void *)*v18;
    goto LABEL_43;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F4FEE8]);
  v6 = [v4 objectForKeyedSubscript:@"BOOL"];
  double v7 = v5;
  double v8 = 0;
  uint64_t v9 = v6;
LABEL_4:
  uint64_t v10 = [v7 initWithIntValue:0 doubleValue:v8 stringValue:0 BOOLValue:v9 timeBucketValue:a3];

LABEL_45:
  return v10;
}

- (id)objectForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_timeBuckets;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_timeBuckets, "objectForKeyedSubscript:", v10, (void)v16);
        id v12 = [v11 objectForKeyedSubscript:v4];
        if (v12)
        {
          id v14 = v12;
          id v13 = (void *)+[_PSFeatureDictionary _fromPlistValue:timeBucket:]((uint64_t)_PSFeatureDictionary, v12, [v10 integerValue]);

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = [(NSMutableDictionary *)self->_unoptimizedValues objectForKeyedSubscript:v4];
LABEL_11:

  return v13;
}

- (id)keyEnumerator
{
  uint64_t v3 = [(NSMutableDictionary *)self->_timeBuckets count];
  if (v3 != 1)
  {
    if (!v3)
    {
      if (self->_unoptimizedValues) {
        unoptimizedValues = self->_unoptimizedValues;
      }
      else {
        unoptimizedValues = (NSMutableDictionary *)MEMORY[0x1E4F1CC08];
      }
      uint64_t v5 = [(NSMutableDictionary *)unoptimizedValues keyEnumerator];
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v5 = -[_PSFeatureDictionaryEnumerator initWithCollection:]((uint64_t)[_PSFeatureDictionaryEnumerator alloc], self);
LABEL_9:
    uint64_t v6 = (void *)v5;
    goto LABEL_10;
  }
  if ([(NSMutableDictionary *)self->_unoptimizedValues count]) {
    goto LABEL_8;
  }
  uint64_t v8 = (void *)MEMORY[0x1A6243860]();
  uint64_t v9 = [(NSMutableDictionary *)self->_timeBuckets objectEnumerator];
  uint64_t v10 = [v9 nextObject];
  uint64_t v6 = [v10 keyEnumerator];

LABEL_10:

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v11;
    id v8 = +[_PSFeatureDictionary _toPlistValue:]((uint64_t)_PSFeatureDictionary, v7);
    uint64_t v9 = [v7 timeBucketValue];

    -[_PSFeatureDictionary _setPlistValue:inTimeBucket:forKey:](self, v8, v9, v6);
  }
  else
  {
    -[_PSFeatureDictionary _removeObjectForKey:]((uint64_t)self, v6);
    uint64_t v10 = -[_PSFeatureDictionary _unoptimizedValuesCreateIfNeeded](self);
    [v10 setObject:v11 forKeyedSubscript:v6];

    ++self->_count;
  }
}

- (void)_setPlistValue:(uint64_t)a3 inTimeBucket:(void *)a4 forKey:
{
  id v13 = a2;
  id v7 = a4;
  if (a1)
  {
    -[_PSFeatureDictionary _removeObjectForKey:]((uint64_t)a1, v7);
    id v8 = (void *)a1[1];
    uint64_t v9 = [NSNumber numberWithInt:a3];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];

    if (!v10)
    {
      uint64_t v10 = objc_opt_new();
      id v11 = -[_PSFeatureDictionary _timeBucketsCreateIfNeeded](a1);
      id v12 = [NSNumber numberWithInt:a3];
      [v11 setObject:v10 forKeyedSubscript:v12];
    }
    [v10 setObject:v13 forKeyedSubscript:v7];
    ++a1[3];
  }
}

- (void)_removeObjectForKey:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x3032000000;
    long long v19 = __Block_byref_object_copy__11;
    double v20 = __Block_byref_object_dispose__11;
    id v21 = 0;
    uint64_t v5 = *(void **)(a1 + 8);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __44___PSFeatureDictionary__removeObjectForKey___block_invoke;
    id v11 = &unk_1E5AE0920;
    id v6 = v3;
    id v14 = &v22;
    id v15 = &v16;
    id v12 = v6;
    uint64_t v13 = a1;
    [v5 enumerateKeysAndObjectsUsingBlock:&v8];
    if (*((unsigned char *)v23 + 24))
    {
      if (v17[5]) {
        objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", 0, v8, v9, v10, v11);
      }
    }
    else
    {
      id v7 = objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v6, v8, v9, v10, v11);

      if (v7)
      {
        [*(id *)(a1 + 16) setObject:0 forKeyedSubscript:v6];
        --*(void *)(a1 + 24);
      }
    }

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
}

- (void)addFeatureWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucket:(int)a7 forKey:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (v14)
  {
    if (CFNumberIsFloatType((CFNumberRef)v14))
    {
      long long v19 = (void *)MEMORY[0x1A6243860]();
      uint64_t v20 = [v14 unsignedIntValue];
      uint64_t v21 = [NSNumber numberWithUnsignedInt:v20];

      id v14 = (id)v21;
    }
    id v22 = v14;
    id v34 = v22;
  }
  else
  {
    if (v15)
    {
      [v15 doubleValue];
      double v24 = v23;
      char v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v23];
      if (!malloc_size(v25)
        && ([v25 timeIntervalSinceReferenceDate], v30 == v24)
        && (id v31 = v25) != 0)
      {
        id v22 = v31;
      }
      else
      {
        if (!CFNumberIsFloatType((CFNumberRef)v15))
        {
          v26 = (void *)MEMORY[0x1A6243860]();
          v27 = NSNumber;
          [v15 doubleValue];
          uint64_t v28 = objc_msgSend(v27, "numberWithDouble:");

          id v15 = (id)v28;
        }
        id v22 = v15;
        id v15 = v22;
      }
    }
    else
    {
      if (v16)
      {
        id v29 = (id)[v16 copy];
      }
      else if (v17)
      {
        int v32 = [v17 BOOLValue];
        v33 = &unk_1EF676890;
        if (v32) {
          v33 = &unk_1EF676868;
        }
        id v29 = v33;
      }
      else
      {
        id v29 = [MEMORY[0x1E4F1CA98] null];
      }
      id v22 = v29;
      id v15 = 0;
    }
    id v34 = 0;
  }
  -[_PSFeatureDictionary _setPlistValue:inTimeBucket:forKey:](self, v22, v9, v18);
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  v4[3] = self->_count;
  timeBuckets = self->_timeBuckets;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44___PSFeatureDictionary_mutableCopyWithZone___block_invoke;
  v10[3] = &unk_1E5AE0948;
  id v6 = v4;
  id v11 = v6;
  [(NSMutableDictionary *)timeBuckets enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v7 = [(NSMutableDictionary *)self->_unoptimizedValues mutableCopy];
  uint64_t v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (void)addEntriesFromDictionary:(id)a3
{
}

- (void)addEntriesFromDictionary:(id)a3 overwrite:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v56 = v6;
    unint64_t v7 = 0x1E95A8000;
    if (v4 && self->_count)
    {
      id v48 = v6;
      uint64_t v8 = v56[3];
      context = (void *)MEMORY[0x1A6243860]();
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      obuint64_t j = [(NSMutableDictionary *)self->_timeBuckets objectEnumerator];
      uint64_t v53 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
      uint64_t v9 = 0;
      if (v53)
      {
        uint64_t v51 = *(void *)v72;
        uint64_t v52 = v8;
        while (2)
        {
          for (uint64_t i = 0; i != v53; ++i)
          {
            if (*(void *)v72 != v51) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            uint64_t v54 = [v11 count];
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            id v12 = v56;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v67 objects:v82 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v68;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v68 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  [v11 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v67 + 1) + 8 * j)];
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v67 objects:v82 count:16];
              }
              while (v14);
            }

            v9 += v54 - [v11 count];
            uint64_t v8 = v52;
            if (v9 == v52)
            {

              goto LABEL_42;
            }
          }
          uint64_t v53 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
          if (v53) {
            continue;
          }
          break;
        }
      }

      id v6 = v48;
      unint64_t v7 = 0x1E95A8000uLL;
      if (v9 != v8)
      {
        unoptimizedValues = self->_unoptimizedValues;
        if (unoptimizedValues)
        {
          uint64_t v18 = [(NSMutableDictionary *)unoptimizedValues count];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v19 = v56;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v63 objects:v81 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v64;
            do
            {
              for (uint64_t k = 0; k != v21; ++k)
              {
                if (*(void *)v64 != v22) {
                  objc_enumerationMutation(v19);
                }
                [(NSMutableDictionary *)self->_unoptimizedValues setObject:0 forKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * k)];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v63 objects:v81 count:16];
            }
            while (v21);
          }

          uint64_t v8 = v18 + v9 - [(NSMutableDictionary *)self->_unoptimizedValues count];
LABEL_42:
          id v6 = v48;
          unint64_t v7 = 0x1E95A8000uLL;
        }
        else
        {
          uint64_t v8 = v9;
        }
      }
      self->_count -= v8;
    }
    v33 = (void *)MEMORY[0x1A6243860]();
    id v34 = (void *)v56[1];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __59___PSFeatureDictionary_addEntriesFromDictionary_overwrite___block_invoke;
    v61[3] = &unk_1E5AE0970;
    v61[4] = self;
    BOOL v62 = v4;
    [v34 enumerateKeysAndObjectsUsingBlock:v61];
    uint64_t v35 = *(int *)(v7 + 3852);
    uint64_t v36 = [*(id *)((char *)&self->super.super.super.isa + v35) count];
    v37 = *(void **)((char *)v56 + v35);
    if (v36)
    {
      if (![v37 count])
      {
LABEL_59:

        goto LABEL_60;
      }
      id v49 = v6;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v38 = *(id *)((char *)v56 + v35);
      uint64_t v39 = [v38 countByEnumeratingWithState:&v57 objects:v80 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        v55 = v33;
        uint64_t v41 = *(void *)v58;
        do
        {
          for (uint64_t m = 0; m != v40; ++m)
          {
            if (*(void *)v58 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v57 + 1) + 8 * m);
            if (!v4)
            {
              v44 = [(_PSFeatureDictionary *)self objectForKeyedSubscript:*(void *)(*((void *)&v57 + 1) + 8 * m)];

              if (v44) {
                continue;
              }
            }
            ++self->_count;
            v45 = [*(id *)((char *)v56 + v35) objectForKeyedSubscript:v43];
            [*(id *)((char *)&self->super.super.super.isa + v35) setObject:v45 forKeyedSubscript:v43];
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v57 objects:v80 count:16];
        }
        while (v40);
        id v6 = v49;
        v33 = v55;
      }
    }
    else
    {
      v46 = (objc_class *)[v37 mutableCopy];
      id v38 = *(Class *)((char *)&self->super.super.super.isa + v35);
      *(Class *)((char *)&self->super.super.super.isa + v35) = v46;
    }

    goto LABEL_59;
  }
  if (v4)
  {
    v79.receiver = self;
    v79.super_class = (Class)_PSFeatureDictionary;
    [(_PSFeatureDictionary *)&v79 addEntriesFromDictionary:v6];
  }
  else
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v24 = v6;
    id v25 = v6;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v76;
      do
      {
        for (uint64_t n = 0; n != v27; ++n)
        {
          if (*(void *)v76 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v75 + 1) + 8 * n);
          id v31 = [(_PSFeatureDictionary *)self objectForKeyedSubscript:v30];

          if (!v31)
          {
            int v32 = [v25 objectForKeyedSubscript:v30];
            [(_PSFeatureDictionary *)self setObject:v32 forKeyedSubscript:v30];

            ++self->_count;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v75 objects:v84 count:16];
      }
      while (v27);
    }

    id v6 = v24;
  }
LABEL_60:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unoptimizedValues, 0);

  objc_storeStrong((id *)&self->_timeBuckets, 0);
}

@end