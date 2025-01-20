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
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FedStatsCombinationType;
  v6 = [(FedStatsCombinationType *)&v40 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_combinationSpec, a3);
    v8 = [v5 allKeys];
    uint64_t v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_1];
    orderedKeys = v7->_orderedKeys;
    v7->_orderedKeys = (NSArray *)v9;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v11 = [(FedStatsCombinationType *)v7 orderedKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      unint64_t v15 = 1;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          v17 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          v15 *= [v17 classCount];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
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
    v18 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v30 = v7;
    v19 = [(FedStatsCombinationType *)v7 orderedKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          v25 = [v5 objectForKeyedSubscript:v24];
          v15 /= (unint64_t)[v25 classCount];

          v26 = [NSNumber numberWithUnsignedLong:v15];
          [v18 setObject:v26 forKeyedSubscript:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v21);
    }

    uint64_t v27 = [NSDictionary dictionaryWithDictionary:v18];
    v7 = v30;
    strides = v30->_strides;
    v30->_strides = (NSDictionary *)v27;
  }
  return v7;
}

uint64_t __51__FedStatsCombinationType_initWithCombinationSpec___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 objectForKey:@"structure"];
  if (!v7)
  {
    if (a4)
    {
      v8 = [NSString stringWithFormat:@"Missing key \"%@\", @"structure""];
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
      [NSString stringWithFormat:@"The value of the key \"%@\" must be an array", @"structure"];
      goto LABEL_10;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  if ((unint64_t)[v7 count] <= 1)
  {
    if (a4)
    {
      [NSString stringWithFormat:@"The value of the key \"%@\" must have at least 2 elements", @"structure"];
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
  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            long long v31 = [NSString stringWithFormat:@"Every entry in the value of the key \"%@\" must be a string", @"structure"];
            *a4 = +[FedStatsError errorWithCode:302 description:v31];
          }
          goto LABEL_12;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
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
      uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v42;
        while (2)
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v42 != v21) {
              objc_enumerationMutation(v18);
            }
            if (([*(id *)(*((void *)&v41 + 1) + 8 * j) conformsToProtocol:&unk_26D0B7088] & 1) == 0)
            {
              v30 = v17;
              if (a4)
              {
                long long v33 = [NSString stringWithFormat:@"Every value in the \"%@\" dictionary must be a class conforming to %@", @"availableTypes", @"FedStatsDataTypeProtocol"];
                *a4 = +[FedStatsError errorWithCode:302 description:v33];
              }
LABEL_57:
              v10 = 0;
              goto LABEL_58;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      v18 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      obuint64_t j = v12;
      uint64_t v23 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v38;
        while (2)
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v38 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v37 + 1) + 8 * k);
            v28 = [v17 objectForKey:v27];
            [v18 setObject:v28 forKeyedSubscript:v27];

            v29 = [v18 objectForKeyedSubscript:v27];

            if (!v29)
            {
              v30 = v17;
              if (a4)
              {
                long long v34 = [NSString stringWithFormat:@"There is no type defined for \"%@\"", v27];
                *a4 = +[FedStatsError errorWithCode:302 description:v34];
              }
              goto LABEL_57;
            }
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }
      v30 = v17;

      v10 = (void *)[[v36 alloc] initWithCombinationSpec:v18];
      goto LABEL_58;
    }
    v30 = v17;
    if (a4)
    {
      v18 = [NSString stringWithFormat:@"The value of the key \"%@\" must be a dictionary", @"availableTypes"];
      uint64_t v32 = 302;
      goto LABEL_50;
    }
  }
  else
  {
    v30 = 0;
    if (a4)
    {
      v18 = [NSString stringWithFormat:@"Missing key \"%@\", @"availableTypes""];
      uint64_t v32 = 300;
LABEL_50:
      +[FedStatsError errorWithCode:v32 description:v18];
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

      goto LABEL_59;
    }
  }
  v10 = 0;
LABEL_59:

LABEL_13:
  return v10;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v7 = [(FedStatsCombinationType *)self orderedKeys];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v13 = [v6 objectForKey:v12];

          if (!v13)
          {
            if (a4)
            {
              v26 = [NSString stringWithFormat:@"The combination type requires the key \"%@\" to be in the value dictionary", v12];
              *a4 = +[FedStatsError errorWithCode:401 description:v26];
            }
            goto LABEL_27;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
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
    obuint64_t j = [(FedStatsCombinationType *)self orderedKeys];
    uint64_t v33 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v33)
    {
      v30 = a4;
      uint64_t v14 = 0;
      uint64_t v32 = *(void *)v36;
      while (2)
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * j);
          v17 = [(FedStatsCombinationType *)self combinationSpec];
          v18 = [v17 objectForKey:v16];

          uint64_t v19 = [v6 objectForKeyedSubscript:v16];
          id v34 = 0;
          uint64_t v20 = [v18 encodeToIndex:v19 possibleError:&v34];
          id v21 = v34;

          if (!v20)
          {
            if (v30)
            {
              uint64_t v27 = [*v30 code];
              v28 = [NSString stringWithFormat:@"Error with \"%@\" value in the encoder.", v16];
              id *v30 = +[FedStatsError errorWithCode:v27 underlyingError:v21 description:v28];
            }
            goto LABEL_27;
          }
          uint64_t v22 = [(FedStatsCombinationType *)self strides];
          uint64_t v23 = [v22 objectForKey:v16];
          uint64_t v24 = [v23 unsignedLongValue];
          v14 += [v20 unsignedLongValue] * v24;
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
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

    uint64_t v25 = [NSNumber numberWithUnsignedInteger:v14];
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
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      uint64_t v27 = @"The decoder can only work with a valid number type";
LABEL_16:
      +[FedStatsError errorWithCode:500 description:v27];
      v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_17:
    v26 = 0;
    goto LABEL_22;
  }
  unint64_t v8 = [v6 unsignedLongValue];
  if (v8 >= [(FedStatsCombinationType *)self classCount])
  {
    if (a4)
    {
      uint64_t v27 = @"The decoder requires a number less than the class count";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  uint64_t v33 = v7;
  unint64_t v9 = [v7 unsignedLongValue];
  uint64_t v10 = (void *)MEMORY[0x263EFF9A0];
  v11 = [(FedStatsCombinationType *)self orderedKeys];
  long long v38 = objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = [(FedStatsCombinationType *)self orderedKeys];
  uint64_t v37 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v37)
  {
    long long v35 = self;
    uint64_t v36 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v14 = [(FedStatsCombinationType *)self strides];
        uint64_t v15 = [v14 objectForKey:v13];
        unint64_t v16 = [v15 unsignedLongValue];

        unint64_t v39 = v16;
        unint64_t v17 = v9 / v16;
        v18 = [NSNumber numberWithUnsignedLong:v9 / v16];
        uint64_t v19 = [(FedStatsCombinationType *)self combinationSpec];
        [v19 objectForKey:v13];
        v21 = unint64_t v20 = v9;
        uint64_t v22 = a4;
        uint64_t v23 = [v21 decodeFromIndex:v18 possibleError:a4];
        [v38 setValue:v23 forKey:v13];

        uint64_t v24 = [v38 objectForKey:v13];

        if (!v24)
        {
          if (v22)
          {
            v28 = v22;
            v29 = NSString;
            v30 = [*v22 localizedDescription];
            long long v31 = [v29 stringWithFormat:@"Could not decode \"%@\" value in the combination: %@", v13, v30];
            id *v28 = +[FedStatsError errorWithCode:500 description:v31];
          }
          v26 = 0;
          v7 = v33;
          uint64_t v25 = v38;
          goto LABEL_21;
        }
        unint64_t v9 = v20 - v17 * v39;

        a4 = v22;
        self = v35;
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }

  uint64_t v25 = v38;
  v26 = [NSDictionary dictionaryWithDictionary:v38];
  v7 = v33;
LABEL_21:

LABEL_22:
  return v26;
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
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = [(FedStatsCombinationType *)self orderedKeys];
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = [(FedStatsCombinationType *)self orderedKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v11 = [(FedStatsCombinationType *)self strides];
        uint64_t v12 = [v11 objectForKey:v10];
        unint64_t v13 = [v12 unsignedLongValue];

        uint64_t v14 = [(FedStatsCombinationType *)self combinationSpec];
        uint64_t v15 = [v14 objectForKey:v10];
        unint64_t v16 = [v15 sampleForIndex:a3 / v13];
        [v20 setObject:v16 forKey:v10];

        a3 %= v13;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return v20;
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