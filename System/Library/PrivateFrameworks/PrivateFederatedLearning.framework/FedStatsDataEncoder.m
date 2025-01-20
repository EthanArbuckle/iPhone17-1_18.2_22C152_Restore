@interface FedStatsDataEncoder
+ (BOOL)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6;
+ (BOOL)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7;
+ (BOOL)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6;
+ (BOOL)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7;
+ (BOOL)record:(id)a3 metadata:(id)a4 baseKey:(id)a5;
+ (id)createWithDataTypeContent:(id)a3 possibleError:(id *)a4;
+ (id)encodeDataArray:(id)a3 dataTypeContent:(id)a4 resultType:(unint64_t *)a5 errorOut:(id *)a6;
- (FedStatsDataEncoder)initWithDataTypes:(id)a3 combinationTypes:(id)a4;
- (NSArray)typeConfiguration;
- (NSDictionary)dataTypes;
- (id)decodeFromBitVector:(id)a3 possibleError:(id *)a4;
- (id)decodeFromBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5;
- (id)encodeToBitVector:(id)a3 possibleError:(id *)a4;
- (id)encodeToBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5;
- (id)encodeToIndex:(id)a3 error:(id *)a4;
- (id)encodeToIndex:(id)a3 withType:(id)a4 error:(id *)a5;
- (void)setDataTypes:(id)a3;
- (void)setTypeConfiguration:(id)a3;
@end

@implementation FedStatsDataEncoder

- (FedStatsDataEncoder)initWithDataTypes:(id)a3 combinationTypes:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)FedStatsDataEncoder;
  v9 = [(FedStatsDataEncoder *)&v43 init];
  v10 = v9;
  if (v9)
  {
    v32 = v9;
    objc_storeStrong((id *)&v9->_dataTypes, a3);
    v11 = [v8 allKeys];
    v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_0];

    v13 = (void *)MEMORY[0x263EFF9C0];
    id v33 = v7;
    v14 = [v7 allKeys];
    v15 = [v13 setWithArray:v14];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v12;
    uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * v19);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v21 = [v8 objectForKey:v20];
          v22 = [v21 typesInCombination];

          uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v36;
            do
            {
              uint64_t v26 = 0;
              do
              {
                if (*(void *)v36 != v25) {
                  objc_enumerationMutation(v22);
                }
                [v15 removeObject:*(void *)(*((void *)&v35 + 1) + 8 * v26++)];
              }
              while (v24 != v26);
              uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }
            while (v24);
          }

          [v15 removeObject:v20];
          ++v19;
        }
        while (v19 != v17);
        uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v17);
    }

    v27 = [v15 allObjects];
    v28 = [v27 sortedArrayUsingComparator:&__block_literal_global_0];
    uint64_t v29 = [obj arrayByAddingObjectsFromArray:v28];
    v10 = v32;
    typeConfiguration = v32->_typeConfiguration;
    v32->_typeConfiguration = (NSArray *)v29;

    id v7 = v33;
  }

  return v10;
}

uint64_t __58__FedStatsDataEncoder_initWithDataTypes_combinationTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)createWithDataTypeContent:(id)a3 possibleError:(id *)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (!v6 || ![v6 count])
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:100 description:@"Missing data type content"];
      v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    goto LABEL_42;
  }
  v47 = a4;
  v44 = [MEMORY[0x263EFF980] array];
  v48 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  objc_super v43 = v7;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v54;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v54 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v53 + 1) + 8 * i);
      id v14 = [v8 objectForKey:v13];
      v15 = [v14 objectForKey:@"dataType"];
      if (!v15)
      {
        v32 = v47;
        if (!v47) {
          goto LABEL_39;
        }
        id v33 = [NSString stringWithFormat:@"Missing data type specifier key \"%@\", @"dataType""];
        uint64_t v34 = 100;
        goto LABEL_35;
      }
      int64_t v16 = +[FedStatsDataTypeFactory dataTypeFromString:v15];
      if (v16 != 99)
      {
        if (v16 != -1)
        {
          uint64_t v17 = +[FedStatsDataTypeFactory createFedStatsDataType:v15 dataTypeParams:v14 possibleError:v47];
          if (v17)
          {
            uint64_t v18 = (void *)v17;
            [v48 setValue:v17 forKey:v13];

            goto LABEL_14;
          }
          if (v47)
          {
            uint64_t v39 = [*v47 code];
            long long v40 = NSString;
            id v33 = [*v47 localizedDescription];
            long long v41 = [v40 stringWithFormat:@"Could not create data type \"%@\": %@", v13, v33];
            id *v47 = +[FedStatsError errorWithCode:v39 description:v41];

            goto LABEL_38;
          }
LABEL_39:
          v31 = 0;
LABEL_40:
          id v7 = v43;
          v30 = v48;
          goto LABEL_41;
        }
        v32 = v47;
        if (!v47) {
          goto LABEL_39;
        }
        id v33 = [NSString stringWithFormat:@"The data type \"%@\" is not supported", v15];
        uint64_t v34 = 101;
LABEL_35:
        id *v32 = +[FedStatsError errorWithCode:v34 description:v33];
LABEL_38:
        id v7 = v43;
        v30 = v48;

        v31 = 0;
        goto LABEL_41;
      }
      [v44 addObject:v13];
LABEL_14:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_16:

  uint64_t v46 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v14 = v44;
  uint64_t v19 = [v14 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v45 = *(void *)v50;
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v50 != v45) {
          objc_enumerationMutation(v14);
        }
        uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        uint64_t v23 = (void *)MEMORY[0x263EFF9A0];
        uint64_t v24 = [v8 objectForKey:v22];
        v15 = [v23 dictionaryWithDictionary:v24];

        uint64_t v25 = +[FedStatsCombinationType kAvailableTypes];
        v57 = v25;
        v58 = v48;
        uint64_t v26 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        [v15 addEntriesFromDictionary:v26];

        uint64_t v27 = +[FedStatsCombinationType createFromDict:v15 possibleError:v47];
        if (!v27)
        {
          if (v47)
          {
            uint64_t v35 = [*v47 code];
            long long v36 = NSString;
            long long v37 = [*v47 localizedDescription];
            long long v38 = [v36 stringWithFormat:@"Could not create data type \"%@\": %@", v22, v37];
            id *v47 = +[FedStatsError errorWithCode:v35 description:v38];
          }
          v31 = 0;
          id v8 = v46;
          goto LABEL_40;
        }
        v28 = (void *)v27;
        [v46 setValue:v27 forKey:v22];
        [v48 setValue:v28 forKey:v22];
      }
      uint64_t v20 = [v14 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  id v29 = objc_alloc((Class)a1);
  v30 = v48;
  id v14 = [NSDictionary dictionaryWithDictionary:v48];
  id v8 = v46;
  v15 = [NSDictionary dictionaryWithDictionary:v46];
  v31 = (void *)[v29 initWithDataTypes:v14 combinationTypes:v15];
  id v7 = v43;
LABEL_41:

LABEL_42:
  return v31;
}

- (id)encodeToIndex:(id)a3 withType:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [(FedStatsDataEncoder *)self dataTypes];
    uint64_t v11 = [v10 objectForKey:v9];

    if (!v11)
    {
      if (a5)
      {
        uint64_t v26 = [NSString stringWithFormat:@"The data type \"%@\" is not valid", v9];
        *a5 = +[FedStatsError errorWithCode:200 description:v26];
      }
      uint64_t v25 = 0;
      goto LABEL_24;
    }
    if ([v11 dataType] == 99)
    {
      v30 = a5;
      id v29 = v11;
      v12 = [v29 typesInCombination];
      uint64_t v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v20 = [v8 objectForKey:v19];
            [v13 setValue:v20 forKey:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v16);
      }

      v21 = (void *)[v13 copy];
      id v32 = 0;
      uint64_t v22 = v29;
      uint64_t v23 = [v29 encodeToIndex:v21 possibleError:&v32];
      id v24 = v32;

      a5 = v30;
    }
    else
    {
      uint64_t v22 = [v8 objectForKey:v9];
      id v31 = 0;
      uint64_t v23 = [v11 encodeToIndex:v22 possibleError:&v31];
      id v24 = v31;
    }

    if (v23)
    {
      uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v11, "classCount"));
      uint64_t v25 = +[FedStatsDataEncoderDimensionalResult resultWithIndex:v23 dimensionality:v27];
    }
    else
    {
      if (!a5)
      {
        uint64_t v25 = 0;
        goto LABEL_23;
      }
      uint64_t v27 = [NSString stringWithFormat:@"Cannot encode data to \"%@\"", v9];
      +[FedStatsError errorWithCode:401 underlyingError:v24 description:v27];
      uint64_t v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_23:
LABEL_24:

    goto LABEL_25;
  }
  if (a5)
  {
    +[FedStatsError errorWithCode:401 description:@"Provided data is empty"];
    uint64_t v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v25 = 0;
  }
LABEL_25:

  return v25;
}

- (id)encodeToBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [(FedStatsDataEncoder *)self dataTypes];
    uint64_t v11 = [v10 objectForKey:v9];

    if (v11)
    {
      if ([v11 dataType] == 99)
      {
        uint64_t v27 = a5;
        id v26 = v11;
        v12 = [v26 typesInCombination];
        uint64_t v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v20 = [v8 objectForKey:v19];
              [v13 setValue:v20 forKey:v19];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v16);
        }

        v21 = [NSDictionary dictionaryWithDictionary:v13];
        uint64_t v22 = [v26 encodeToOneHotVector:v21 possibleError:v27];
      }
      else
      {
        id v24 = [v8 objectForKey:v9];
        uint64_t v22 = [v11 encodeToOneHotVector:v24 possibleError:a5];
      }
    }
    else
    {
      if (a5)
      {
        uint64_t v23 = [NSString stringWithFormat:@"The data type \"%@\" is not valid", v9];
        *a5 = +[FedStatsError errorWithCode:200 description:v23];
      }
      uint64_t v22 = 0;
    }
  }
  else if (a5)
  {
    +[FedStatsError errorWithCode:401 description:@"Provided data is empty"];
    uint64_t v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)decodeFromBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [(FedStatsDataEncoder *)self dataTypes];
    uint64_t v11 = [v10 objectForKey:v9];

    if (v11)
    {
      v12 = [v11 decodeFromOneHotVector:v8 possibleError:a5];
    }
    else
    {
      if (a5)
      {
        uint64_t v13 = [NSString stringWithFormat:@"The data type \"%@\" is not valid", v9];
        *a5 = +[FedStatsError errorWithCode:200 description:v13];
      }
      v12 = 0;
    }
  }
  else if (a5)
  {
    +[FedStatsError errorWithCode:401 description:@"Provided data is empty"];
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)encodeToBitVector:(id)a3 possibleError:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v31 = a3;
  if (!v31)
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:401 description:@"Provided data is empty"];
      id v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    goto LABEL_14;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v13 = [(FedStatsDataEncoder *)self dataTypes];
        id v14 = [v13 objectForKey:v12];
        v9 += [v14 classCount];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);

    if (v9 > 0x186A0)
    {
      if (a4)
      {
        uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Resulting dimensionality %lu is larger than max dimensionality %lu", v9, 100000);
        *a4 = +[FedStatsError errorWithCode:900 description:v15];
      }
LABEL_14:
      id v16 = 0;
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v17 = [MEMORY[0x263EFF990] data];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v18 = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    v21 = 0;
    uint64_t v22 = *(void *)v33;
    while (2)
    {
      uint64_t v23 = 0;
      id v24 = v21;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * v23);
        v21 = [(FedStatsDataEncoder *)self encodeToBitVector:v31 withType:v25 possibleError:a4];

        if (!v21)
        {
          if (a4)
          {
            uint64_t v26 = [*a4 code];
            uint64_t v27 = NSString;
            long long v28 = [*a4 localizedDescription];
            long long v29 = [v27 stringWithFormat:@"Error encoding \"%@\" type: %@", v25, v28];
            *a4 = +[FedStatsError errorWithCode:v26 description:v29];
          }
          id v16 = 0;
          goto LABEL_29;
        }
        [v17 appendData:v21];
        ++v23;
        id v24 = v21;
      }
      while (v20 != v23);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  id v16 = v17;
LABEL_29:

LABEL_30:
  return v16;
}

- (id)encodeToIndex:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v8 = [v7 count];

  if (v8 != 1)
  {
    if (a4)
    {
      uint64_t v23 = @"This API is only available for single type in encoding schema";
      uint64_t v24 = 900;
LABEL_19:
      +[FedStatsError errorWithCode:v24 description:v23];
      uint64_t v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_23:
    uint64_t v20 = 0;
    goto LABEL_27;
  }
  if (!v6)
  {
    if (a4)
    {
      uint64_t v23 = @"Provided data is empty";
      uint64_t v24 = 401;
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  id v31 = a4;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v9 = [(FedStatsDataEncoder *)self dataTypes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v15 = [(FedStatsDataEncoder *)self dataTypes];
        id v16 = [v15 objectForKey:v14];
        if ([v16 dataType] == 99)
        {
        }
        else
        {
          uint64_t v17 = [v6 objectForKey:v14];

          if (!v17)
          {
            if (v31)
            {
              uint64_t v25 = [NSString stringWithFormat:@"Provided data does not contain a value for \"%@\"", v14];
              id *v31 = +[FedStatsError errorWithCode:200 description:v25];
            }
            goto LABEL_23;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v18 = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v19 = [v18 firstObject];
  id v32 = 0;
  uint64_t v20 = [(FedStatsDataEncoder *)self encodeToIndex:v6 withType:v19 error:&v32];
  id v21 = v32;

  if (v20)
  {
    id v22 = v20;
  }
  else if (v31)
  {
    uint64_t v26 = NSString;
    uint64_t v27 = [(FedStatsDataEncoder *)self typeConfiguration];
    long long v28 = [v27 firstObject];
    long long v29 = [v26 stringWithFormat:@"Cannot encode data to \"%@\"", v28];
    id *v31 = +[FedStatsError errorWithCode:401 underlyingError:v21 description:v29];
  }
LABEL_27:

  return v20;
}

- (id)decodeFromBitVector:(id)a3 possibleError:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v6 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v7 = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v23 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v25)
  {
    uint64_t v8 = 0;
    uint64_t v24 = *(void *)v29;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = a4;
      if (*(void *)v29 != v24) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v9);
      uint64_t v12 = [(FedStatsDataEncoder *)self dataTypes];
      uint64_t v13 = [v12 objectForKey:v11];

      uint64_t v14 = [v13 classCount];
      uint64_t v15 = objc_msgSend(v26, "subdataWithRange:", v8, v14);
      id v27 = 0;
      id v16 = [(FedStatsDataEncoder *)self decodeFromBitVector:v15 withType:v11 possibleError:&v27];
      id v17 = v27;
      if (v16) {
        break;
      }
      if (!v10) {
        goto LABEL_13;
      }
      uint64_t v18 = [NSString stringWithFormat:@"The decoder for \"%@\" failed", v11];
      a4 = v10;
      id *v10 = +[FedStatsError errorWithCode:500 underlyingError:v17 description:v18];

LABEL_14:
      if (!v16)
      {

        uint64_t v20 = 0;
        uint64_t v19 = v23;
        goto LABEL_19;
      }
      if (v25 == ++v9)
      {
        uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v25) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v23 addEntriesFromDictionary:v16];
    }
    else {
      [v23 setValue:v16 forKey:v11];
    }
    v8 += v14;
LABEL_13:
    a4 = v10;
    goto LABEL_14;
  }
LABEL_17:

  uint64_t v19 = v23;
  uint64_t v20 = [NSDictionary dictionaryWithDictionary:v23];
LABEL_19:

  return v20;
}

+ (id)encodeDataArray:(id)a3 dataTypeContent:(id)a4 resultType:(unint64_t *)a5 errorOut:(id *)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    if (a6)
    {
      id v26 = @"encodeDataArray missing data type content";
LABEL_22:
      +[FedStatsError errorWithCode:400 description:v26];
      uint64_t v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
LABEL_23:
    uint64_t v15 = 0;
    goto LABEL_44;
  }
  if (!v9)
  {
    if (a6)
    {
      id v26 = @"encodeDataArray missing data array";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  id v53 = 0;
  uint64_t v11 = +[FedStatsDataEncoder createWithDataTypeContent:v10 possibleError:&v53];
  id v12 = v53;
  uint64_t v13 = v12;
  if (v11)
  {
    id v38 = v12;
    id v39 = v10;
    id v40 = v9;
    uint64_t v14 = +[FedStatsDataSampler pickSamplesFrom:v9 length:20];
    uint64_t v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    id v16 = [v11 typeConfiguration];
    unint64_t v17 = [v16 count];

    long long v37 = v14;
    if (v17 < 2)
    {
      *a5 = 1;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v27 = v14;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v57 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v45 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            if (v32)
            {
              id v41 = 0;
              uint64_t v33 = [v11 encodeToIndex:v32 error:&v41];
              long long v34 = v41;
              if (v33)
              {
                [v15 addObject:v33];
              }
              else
              {
                long long v35 = +[FedStatsLog logger];
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
                  +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:](&buf, v34, &v56, v35);
                }
              }
            }
            else
            {
              long long v34 = +[FedStatsLog logger];
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:](&v42, v43, v34);
              }
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v57 count:16];
        }
        while (v29);
      }
    }
    else
    {
      *a5 = 2;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v18 = v14;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v50 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v49 + 1) + 8 * j);
            uint64_t v48 = 0;
            uint64_t v24 = [v11 encodeToBitVector:v23 possibleError:&v48];
            if (v24)
            {
              [v15 addObject:v24];
            }
            else
            {
              uint64_t v25 = +[FedStatsLog logger];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
                +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:](&buf, v55, v25);
              }
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v20);
      }
    }

    id v10 = v39;
    id v9 = v40;
    uint64_t v13 = v38;
  }
  else if (a6)
  {
    +[FedStatsError errorWithCode:302 underlyingError:v12 description:@"encodeDataArray encoder construction failed"];
    uint64_t v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = 0;
  }

LABEL_44:
  return v15;
}

+ (BOOL)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7
{
  v80[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (v14)
  {
    unint64_t v16 = [v14 length];
    if (v16 >= [@"fedstats:" length]
      && ([v15 substringToIndex:objc_msgSend(@"fedstats:", "length")],
          unint64_t v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v17 isEqualToString:@"fedstats:"],
          v17,
          (v18 & 1) != 0))
    {
      id v19 = v15;
    }
    else
    {
      id v19 = [@"fedstats:" stringByAppendingString:v15];
    }
    uint64_t v20 = v19;
    uint64_t v21 = +[FedStatsLog logger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:]((uint64_t)v20, v21);
    }

    id v71 = 0;
    uint64_t v72 = 0;
    id v22 = +[FedStatsDataEncoder encodeDataArray:v11 dataTypeContent:v12 resultType:&v72 errorOut:&v71];
    id v23 = v71;
    if (!v22)
    {
      if (a7)
      {
        +[FedStatsError errorWithCode:401 underlyingError:v23 description:@"encodeDataArrayAndRecord failed at encoding"];
        BOOL v26 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v26 = 0;
      }
      goto LABEL_61;
    }
    uint64_t v24 = +[FedStatsLog logger];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:](v24);
    }

    v62 = (void *)[objc_alloc(MEMORY[0x263F3A1F8]) initWithKey:v20];
    if (!v62)
    {
      if (a7)
      {
        +[FedStatsError errorWithCode:600 description:@"encodeDataArrayAndRecord failed at recorder allocation"];
        BOOL v26 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v26 = 0;
      }
      goto LABEL_60;
    }
    if ([v13 count])
    {
      id v25 = v13;
    }
    else
    {
      uint64_t v79 = *MEMORY[0x263F3A2F0];
      v80[0] = &stru_26D0AFFA8;
      id v25 = [NSDictionary dictionaryWithObjects:v80 forKeys:&v79 count:1];
    }
    uint64_t v61 = v25;
    if (![v22 count]) {
      goto LABEL_26;
    }
    if (v72 == 1)
    {
      id v55 = v23;
      id v59 = v11;
      v60 = v20;
      uint64_t v56 = v15;
      id v57 = v13;
      id v58 = v12;
      id v27 = [MEMORY[0x263EFF9A0] dictionary];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v28 = v22;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v67 objects:v78 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v68 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            long long v34 = [v33 dimensionality];
            long long v35 = [v27 objectForKey:v34];

            if (v35)
            {
              long long v36 = [v33 index];
              [v35 arrayByAddingObject:v36];
            }
            else
            {
              long long v37 = (void *)MEMORY[0x263EFF8C0];
              long long v36 = [v33 index];
              [v37 arrayWithObject:v36];
            id v38 = };
            id v39 = [v33 dimensionality];
            [v27 setObject:v38 forKey:v39];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v67 objects:v78 count:16];
        }
        while (v30);
      }

      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v40 = v27;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v63 objects:v77 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v64;
        uint64_t v44 = *MEMORY[0x263F3A220];
        uint64_t v45 = *MEMORY[0x263F3A228];
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v64 != v43) {
              objc_enumerationMutation(v40);
            }
            long long v47 = *(void **)(*((void *)&v63 + 1) + 8 * j);
            uint64_t v48 = +[FedStatsLog logger];
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint8_t buf = 138412290;
              v76 = v47;
              _os_log_debug_impl(&dword_21F0DC000, v48, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord recording with dimension = \"%@\"", buf, 0xCu);
            }

            long long v49 = (void *)[v61 mutableCopy];
            uint64_t v73 = v44;
            v74 = v47;
            long long v50 = [NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
            [v49 setObject:v50 forKey:v45];

            long long v51 = [v40 objectForKey:v47];
            char v52 = [v62 record:v51 metadata:v49];

            if ((v52 & 1) == 0)
            {
              id v53 = +[FedStatsLog logger];
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)uint8_t buf = 138412290;
                v76 = v60;
                _os_log_debug_impl(&dword_21F0DC000, v53, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord failed to record numbers for key '%@'", buf, 0xCu);
              }
            }
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v63 objects:v77 count:16];
        }
        while (v42);
      }

      BOOL v26 = 1;
      id v12 = v58;
      id v11 = v59;
      uint64_t v15 = v56;
      id v13 = v57;
      uint64_t v20 = v60;
      id v23 = v55;
    }
    else if (v72 == 2)
    {
      if ([v62 recordBitVectors:v22 metadata:v61])
      {
LABEL_26:
        BOOL v26 = 1;
LABEL_59:

LABEL_60:
LABEL_61:

        goto LABEL_62;
      }
      id v40 = +[FedStatsLog logger];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:]((uint64_t)v20, v40);
      }
      BOOL v26 = 1;
    }
    else
    {
      if (!a7)
      {
        BOOL v26 = 0;
        goto LABEL_59;
      }
      id v40 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported result type \"%lu\" in data encoder", v72);
      +[FedStatsError errorWithCode:900 description:v40];
      BOOL v26 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_59;
  }
  if (a7)
  {
    +[FedStatsError errorWithCode:400 description:@"encodeDataArrayAndRecord missing collection ID key"];
    BOOL v26 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v26 = 0;
  }
LABEL_62:

  return v26;
}

+ (BOOL)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v11 = (void *)MEMORY[0x263EFF8C0];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  unint64_t v16 = [v11 arrayWithObjects:&v18 count:1];
  LOBYTE(a7) = +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:", v16, v14, v13, v12, a7, v18, v19);

  return (char)a7;
}

+ (BOOL)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6
{
  return +[FedStatsDataEncoder encodeDataArrayAndRecord:a3 dataTypeContent:a4 metadata:MEMORY[0x263EFFA78] baseKey:a5 errorOut:a6];
}

+ (BOOL)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 arrayWithObjects:&v15 count:1];
  LOBYTE(a6) = +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:", v13, v11, v10, a6, v15, v16);

  return (char)a6;
}

+ (BOOL)record:(id)a3 metadata:(id)a4 baseKey:(id)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x263F3A1F8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v7 alloc] initWithKey:v8];

  LOBYTE(v8) = [v11 record:v10 metadata:v9];
  return (char)v8;
}

- (NSDictionary)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(id)a3
{
}

- (NSArray)typeConfiguration
{
  return self->_typeConfiguration;
}

- (void)setTypeConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeConfiguration, 0);
  objc_storeStrong((id *)&self->_dataTypes, 0);
}

+ (void)encodeDataArray:(os_log_t)log dataTypeContent:resultType:errorOut:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_21F0DC000, log, OS_LOG_TYPE_DEBUG, "Cannot process data point, skipping...", buf, 2u);
}

+ (void)encodeDataArray:(os_log_t)log dataTypeContent:resultType:errorOut:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_21F0DC000, log, OS_LOG_TYPE_DEBUG, "Non-dictionary or nil in the input, skipping...", buf, 2u);
}

+ (void)encodeDataArray:(uint8_t *)a1 dataTypeContent:(void *)a2 resultType:(void *)a3 errorOut:(NSObject *)a4 .cold.3(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 debugDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_21F0DC000, a4, OS_LOG_TYPE_DEBUG, "Cannot process data point: '%@', skipping", a1, 0xCu);
}

+ (void)encodeDataArrayAndRecord:(uint64_t)a1 dataTypeContent:(NSObject *)a2 metadata:baseKey:errorOut:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F0DC000, a2, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord failed to record bit vectors for key '%@'", (uint8_t *)&v2, 0xCu);
}

+ (void)encodeDataArrayAndRecord:(os_log_t)log dataTypeContent:metadata:baseKey:errorOut:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F0DC000, log, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord encoded data array, recording", v1, 2u);
}

+ (void)encodeDataArrayAndRecord:(uint64_t)a1 dataTypeContent:(NSObject *)a2 metadata:baseKey:errorOut:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F0DC000, a2, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord with baseKey = \"%@\"", (uint8_t *)&v2, 0xCu);
}

@end