@interface FedStatsCombinationType
+ (id)createFromDict:(id)a3 possibleError:(id *)a4;
+ (id)kAvailableTypes;
- (FedStatsCombinationType)initWithCombinationSpec:(id)a3;
- (NSArray)orderedKeys;
- (NSDictionary)combinationSpec;
- (NSDictionary)strides;
- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4;
- (id)encodeToIndex:(id)a3 possibleError:(id *)a4;
- (id)sampleForIndex:(unint64_t)a3;
- (int64_t)dataType;
- (unint64_t)classCount;
- (void)setCombinationSpec:(id)a3;
- (void)setOrderedKeys:(id)a3;
- (void)setStrides:(id)a3;
@end

@implementation FedStatsCombinationType

- (FedStatsCombinationType)initWithCombinationSpec:(id)a3
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FedStatsCombinationType;
  v6 = [(FedStatsCombinationType *)&v40 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_combinationSpec, a3);
    v8 = [v5 allKeys];
    uint64_t v9 = [v8 sortedArrayUsingComparator:&stru_1000306F0];
    orderedKeys = v7->_orderedKeys;
    v7->_orderedKeys = (NSArray *)v9;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v11 = [(FedStatsCombinationType *)v7 orderedKeys];
    id v12 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v37;
      unint64_t v15 = 1;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          v17 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          v15 *= (void)[v17 classCount];
        }
        id v13 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v13);
    }
    else
    {
      unint64_t v15 = 1;
    }

    v35.receiver = v7;
    v35.super_class = (Class)FedStatsCombinationType;
    [(FedStatsBoundedULongType *)&v35 setBound:v15 - 1];
    v7->_classCount = v15;
    v18 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v30 = v7;
    v19 = [(FedStatsCombinationType *)v7 orderedKeys];
    id v20 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
          v25 = [v5 objectForKeyedSubscript:v24];
          v15 /= (unint64_t)[v25 classCount];

          v26 = +[NSNumber numberWithUnsignedLong:v15];
          [v18 setObject:v26 forKeyedSubscript:v24];
        }
        id v21 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v21);
    }

    uint64_t v27 = +[NSDictionary dictionaryWithDictionary:v18];
    v7 = v30;
    strides = v30->_strides;
    v30->_strides = (NSDictionary *)v27;
  }
  return v7;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  v7 = [v6 objectForKey:@"structure"];
  if (!v7)
  {
    if (a4)
    {
      v8 = +[NSString stringWithFormat:@"Missing key \"%@\", @"structure""];
      uint64_t v9 = 300;
LABEL_11:
      *a4 = +[FedStatsError errorWithCode:v9 description:v8];

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      +[NSString stringWithFormat:@"The value of the key \"%@\" must be an array", @"structure"];
      goto LABEL_10;
    }
LABEL_12:
    id v10 = 0;
    goto LABEL_13;
  }
  if ((unint64_t)[v7 count] <= 1)
  {
    if (a4)
    {
      +[NSString stringWithFormat:@"The value of the key \"%@\" must have at least 2 elements", @"structure"];
      v8 = LABEL_10:;
      uint64_t v9 = 302;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  long long v36 = (objc_class *)a1;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v12 = v7;
  id v13 = (char *)[v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            long long v31 = +[NSString stringWithFormat:@"Every entry in the value of the key \"%@\" must be a string", @"structure"];
            *a4 = +[FedStatsError errorWithCode:302 description:v31];
          }
          goto LABEL_12;
        }
      }
      uint64_t v14 = (char *)[v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  v17 = [v6 objectForKey:@"availableTypes"];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v18 = [v17 allValues];
      id v19 = [v18 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v42;
        while (2)
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v42 != v21) {
              objc_enumerationMutation(v18);
            }
            if (([*(id *)(*((void *)&v41 + 1) + 8 * (void)j) conformsToProtocol:&OBJC_PROTOCOL___FedStatsDataTypeProtocol] & 1) == 0)
            {
              v30 = v17;
              if (a4)
              {
                long long v33 = +[NSString stringWithFormat:@"Every value in the \"%@\" dictionary must be a class conforming to %@", @"availableTypes", @"FedStatsDataTypeProtocol"];
                *a4 = +[FedStatsError errorWithCode:302 description:v33];
              }
LABEL_57:
              id v10 = 0;
              goto LABEL_58;
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      v18 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v12 count]);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = v12;
      id v23 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v38;
        while (2)
        {
          for (k = 0; k != v24; k = (char *)k + 1)
          {
            if (*(void *)v38 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * (void)k);
            v28 = [v17 objectForKey:v27];
            [v18 setObject:v28 forKeyedSubscript:v27];

            v29 = [v18 objectForKeyedSubscript:v27];

            if (!v29)
            {
              v30 = v17;
              if (a4)
              {
                long long v34 = +[NSString stringWithFormat:@"There is no type defined for \"%@\"", v27];
                *a4 = +[FedStatsError errorWithCode:302 description:v34];
              }
              goto LABEL_57;
            }
          }
          id v24 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }
      v30 = v17;

      id v10 = [[v36 alloc] initWithCombinationSpec:v18];
      goto LABEL_58;
    }
    v30 = v17;
    if (a4)
    {
      v18 = +[NSString stringWithFormat:@"The value of the key \"%@\" must be a dictionary", @"availableTypes"];
      uint64_t v32 = 302;
      goto LABEL_50;
    }
  }
  else
  {
    v30 = 0;
    if (a4)
    {
      v18 = +[NSString stringWithFormat:@"Missing key \"%@\", @"availableTypes""];
      uint64_t v32 = 300;
LABEL_50:
      +[FedStatsError errorWithCode:v32 description:v18];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

      goto LABEL_59;
    }
  }
  id v10 = 0;
LABEL_59:

LABEL_13:
  return v10;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v7 = [(FedStatsCombinationType *)self orderedKeys];
    id v8 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v40;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          id v13 = [v6 objectForKey:v12];

          if (!v13)
          {
            if (a4)
            {
              v26 = +[NSString stringWithFormat:@"The combination type requires the key \"%@\" to be in the value dictionary", v12];
              *a4 = +[FedStatsError errorWithCode:401 description:v26];
            }
            goto LABEL_27;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [(FedStatsCombinationType *)self orderedKeys];
    id v33 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v33)
    {
      v30 = a4;
      uint64_t v14 = 0;
      uint64_t v32 = *(void *)v36;
      while (2)
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * (void)j);
          v17 = [(FedStatsCombinationType *)self combinationSpec];
          v18 = [v17 objectForKey:v16];

          id v19 = [v6 objectForKeyedSubscript:v16];
          id v34 = 0;
          id v20 = [v18 encodeToIndex:v19 possibleError:&v34];
          id v21 = v34;

          if (!v20)
          {
            if (v30)
            {
              id v27 = [*v30 code];
              v28 = +[NSString stringWithFormat:@"Error with \"%@\" value in the encoder.", v16];
              id *v30 = +[FedStatsError errorWithCode:v27 underlyingError:v21 description:v28];
            }
            goto LABEL_27;
          }
          uint64_t v22 = [(FedStatsCombinationType *)self strides];
          id v23 = [v22 objectForKey:v16];
          id v24 = [v23 unsignedLongValue];
          v14 += (void)[v20 unsignedLongValue] * (void)v24;
        }
        id v33 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }

    uint64_t v25 = +[NSNumber numberWithUnsignedInteger:v14];
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:401 description:@"The combination type encoder requires a dictionary to process."];
    uint64_t v25 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_27:
    uint64_t v25 = 0;
  }

  return v25;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      CFStringRef v26 = @"The decoder can only work with a valid number type";
LABEL_16:
      +[FedStatsError errorWithCode:500 description:v26];
      uint64_t v25 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_17:
    uint64_t v25 = 0;
    goto LABEL_22;
  }
  id v8 = [v6 unsignedLongValue];
  if (v8 >= (id)[(FedStatsCombinationType *)self classCount])
  {
    if (a4)
    {
      CFStringRef v26 = @"The decoder requires a number less than the class count";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  long long v31 = v7;
  unint64_t v9 = (unint64_t)[v7 unsignedLongValue];
  uint64_t v10 = [(FedStatsCombinationType *)self orderedKeys];
  long long v36 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v10 count]);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(FedStatsCombinationType *)self orderedKeys];
  id v35 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v35)
  {
    id v33 = self;
    uint64_t v34 = *(void *)v39;
    while (2)
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v13 = [(FedStatsCombinationType *)self strides];
        uint64_t v14 = [v13 objectForKey:v12];
        unint64_t v15 = (unint64_t)[v14 unsignedLongValue];

        unint64_t v37 = v15;
        unint64_t v16 = v9 / v15;
        v17 = +[NSNumber numberWithUnsignedLong:v9 / v15];
        v18 = [(FedStatsCombinationType *)self combinationSpec];
        [v18 objectForKey:v12];
        id v20 = v19 = v9;
        id v21 = a4;
        uint64_t v22 = [v20 decodeFromIndex:v17 possibleError:a4];
        [v36 setValue:v22 forKey:v12];

        id v23 = [v36 objectForKey:v12];

        if (!v23)
        {
          if (v21)
          {
            id v27 = v21;
            v28 = [*v21 localizedDescription];
            v29 = +[NSString stringWithFormat:@"Could not decode \"%@\" value in the combination: %@", v12, v28];
            *id v27 = +[FedStatsError errorWithCode:500 description:v29];
          }
          uint64_t v25 = 0;
          v7 = v31;
          id v24 = v36;
          goto LABEL_21;
        }
        unint64_t v9 = v19 - v16 * v37;

        a4 = v21;
        self = v33;
      }
      id v35 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }

  id v24 = v36;
  uint64_t v25 = +[NSDictionary dictionaryWithDictionary:v36];
  v7 = v31;
LABEL_21:

LABEL_22:
  return v25;
}

+ (id)kAvailableTypes
{
  return @"availableTypes";
}

- (int64_t)dataType
{
  return 99;
}

- (unint64_t)classCount
{
  return self->_classCount;
}

- (id)sampleForIndex:(unint64_t)a3
{
  id v5 = [(FedStatsCombinationType *)self orderedKeys];
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(FedStatsCombinationType *)self orderedKeys];
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = [(FedStatsCombinationType *)self strides];
        v11 = [v10 objectForKey:v9];
        unint64_t v12 = (unint64_t)[v11 unsignedLongValue];

        id v13 = [(FedStatsCombinationType *)self combinationSpec];
        uint64_t v14 = [v13 objectForKey:v9];
        unint64_t v15 = [v14 sampleForIndex:a3 / v12];
        [v19 setObject:v15 forKey:v9];

        a3 %= v12;
      }
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return v19;
}

- (NSDictionary)combinationSpec
{
  return self->_combinationSpec;
}

- (void)setCombinationSpec:(id)a3
{
}

- (NSDictionary)strides
{
  return self->_strides;
}

- (void)setStrides:(id)a3
{
}

- (NSArray)orderedKeys
{
  return self->_orderedKeys;
}

- (void)setOrderedKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_combinationSpec, 0);
}

@end