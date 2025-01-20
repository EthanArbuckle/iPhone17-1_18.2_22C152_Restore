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
  id v7 = a3;
  id v8 = a4;
  v42.receiver = self;
  v42.super_class = (Class)FedStatsDataEncoder;
  v9 = [(FedStatsDataEncoder *)&v42 init];
  v10 = v9;
  if (v9)
  {
    v31 = v9;
    objc_storeStrong((id *)&v9->_dataTypes, a3);
    v11 = [v8 allKeys];
    v12 = [v11 sortedArrayUsingComparator:&stru_1000308F0];

    id v32 = v7;
    v13 = [v7 allKeys];
    v14 = +[NSMutableSet setWithArray:v13];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v12;
    id v15 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v18);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          v20 = [v8 objectForKey:v19];
          v21 = [v20 typesInCombination];

          id v22 = [v21 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v35;
            do
            {
              v25 = 0;
              do
              {
                if (*(void *)v35 != v24) {
                  objc_enumerationMutation(v21);
                }
                [v14 removeObject:*(void *)(*((void *)&v34 + 1) + 8 * (void)v25)];
                v25 = (char *)v25 + 1;
              }
              while (v23 != v25);
              id v23 = [v21 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v23);
          }

          [v14 removeObject:v19];
          v18 = (char *)v18 + 1;
        }
        while (v18 != v16);
        id v16 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v16);
    }

    v26 = [v14 allObjects];
    v27 = [v26 sortedArrayUsingComparator:&stru_1000308F0];
    uint64_t v28 = [obj arrayByAddingObjectsFromArray:v27];
    v10 = v31;
    typeConfiguration = v31->_typeConfiguration;
    v31->_typeConfiguration = (NSArray *)v28;

    id v7 = v32;
  }

  return v10;
}

+ (id)createWithDataTypeContent:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!v6 || ![v6 count])
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:100 description:@"Missing data type content"];
      id v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v30 = 0;
    }
    goto LABEL_42;
  }
  v44 = a4;
  long long v41 = +[NSMutableArray array];
  v45 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v40 = v7;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v51;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v51 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v50 + 1) + 8 * i);
      id v14 = [v8 objectForKey:v13];
      id v15 = [v14 objectForKey:@"dataType"];
      if (!v15)
      {
        v31 = v44;
        if (!v44) {
          goto LABEL_39;
        }
        id v32 = +[NSString stringWithFormat:@"Missing data type specifier key \"%@\", @"dataType""];
        uint64_t v33 = 100;
        goto LABEL_35;
      }
      int64_t v16 = +[FedStatsDataTypeFactory dataTypeFromString:v15];
      if (v16 != 99)
      {
        if (v16 != -1)
        {
          uint64_t v17 = +[FedStatsDataTypeFactory createFedStatsDataType:v15 dataTypeParams:v14 possibleError:v44];
          if (v17)
          {
            v18 = (void *)v17;
            [v45 setValue:v17 forKey:v13];

            goto LABEL_14;
          }
          if (v44)
          {
            id v37 = [*v44 code];
            id v32 = [*v44 localizedDescription];
            long long v38 = +[NSString stringWithFormat:@"Could not create data type \"%@\": %@", v13, v32];
            id *v44 = +[FedStatsError errorWithCode:v37 description:v38];

            goto LABEL_38;
          }
LABEL_39:
          id v30 = 0;
LABEL_40:
          id v7 = v40;
          v29 = v45;
          goto LABEL_41;
        }
        v31 = v44;
        if (!v44) {
          goto LABEL_39;
        }
        id v32 = +[NSString stringWithFormat:@"The data type \"%@\" is not supported", v15];
        uint64_t v33 = 101;
LABEL_35:
        id *v31 = +[FedStatsError errorWithCode:v33 description:v32];
LABEL_38:
        id v7 = v40;
        v29 = v45;

        id v30 = 0;
        goto LABEL_41;
      }
      [v41 addObject:v13];
LABEL_14:
    }
    id v10 = [v8 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_16:

  v43 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v41 count]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v14 = v41;
  id v19 = [v14 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v42 = *(void *)v47;
    while (2)
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v47 != v42) {
          objc_enumerationMutation(v14);
        }
        uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
        id v23 = [v8 objectForKey:v22];
        id v15 = +[NSMutableDictionary dictionaryWithDictionary:v23];

        uint64_t v24 = +[FedStatsCombinationType kAvailableTypes];
        v54 = v24;
        v55 = v45;
        v25 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        [v15 addEntriesFromDictionary:v25];

        uint64_t v26 = +[FedStatsCombinationType createFromDict:v15 possibleError:v44];
        if (!v26)
        {
          if (v44)
          {
            id v34 = [*v44 code];
            long long v35 = [*v44 localizedDescription];
            long long v36 = +[NSString stringWithFormat:@"Could not create data type \"%@\": %@", v22, v35];
            id *v44 = +[FedStatsError errorWithCode:v34 description:v36];
          }
          id v30 = 0;
          id v8 = v43;
          goto LABEL_40;
        }
        v27 = (void *)v26;
        [v43 setValue:v26 forKey:v22];
        [v45 setValue:v27 forKey:v22];
      }
      id v20 = [v14 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  id v28 = objc_alloc((Class)a1);
  v29 = v45;
  id v14 = +[NSDictionary dictionaryWithDictionary:v45];
  id v8 = v43;
  id v15 = +[NSDictionary dictionaryWithDictionary:v43];
  id v30 = [v28 initWithDataTypes:v14 combinationTypes:v15];
  id v7 = v40;
LABEL_41:

LABEL_42:
  return v30;
}

- (id)encodeToIndex:(id)a3 withType:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = [(FedStatsDataEncoder *)self dataTypes];
    uint64_t v11 = [v10 objectForKey:v9];

    if (!v11)
    {
      if (a5)
      {
        uint64_t v26 = +[NSString stringWithFormat:@"The data type \"%@\" is not valid", v9];
        *a5 = +[FedStatsError errorWithCode:200 description:v26];
      }
      v25 = 0;
      goto LABEL_24;
    }
    if ([v11 dataType] == (id)99)
    {
      id v30 = a5;
      id v29 = v11;
      v12 = [v29 typesInCombination];
      uint64_t v13 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v12 count]);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v14 = v12;
      id v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            id v20 = [v8 objectForKey:v19];
            [v13 setValue:v20 forKey:v19];
          }
          id v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v16);
      }

      id v21 = [v13 copy];
      id v32 = 0;
      uint64_t v22 = v29;
      id v23 = [v29 encodeToIndex:v21 possibleError:&v32];
      id v24 = v32;

      a5 = v30;
    }
    else
    {
      uint64_t v22 = [v8 objectForKey:v9];
      id v31 = 0;
      id v23 = [v11 encodeToIndex:v22 possibleError:&v31];
      id v24 = v31;
    }

    if (v23)
    {
      v27 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v11 classCount]);
      v25 = +[FedStatsDataEncoderDimensionalResult resultWithIndex:v23 dimensionality:v27];
    }
    else
    {
      if (!a5)
      {
        v25 = 0;
        goto LABEL_23;
      }
      v27 = +[NSString stringWithFormat:@"Cannot encode data to \"%@\"", v9];
      +[FedStatsError errorWithCode:401 underlyingError:v24 description:v27];
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_23:
LABEL_24:

    goto LABEL_25;
  }
  if (a5)
  {
    +[FedStatsError errorWithCode:401 description:@"Provided data is empty"];
    v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
LABEL_25:

  return v25;
}

- (id)encodeToBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = [(FedStatsDataEncoder *)self dataTypes];
    uint64_t v11 = [v10 objectForKey:v9];

    if (v11)
    {
      if ([v11 dataType] == (id)99)
      {
        v27 = a5;
        id v26 = v11;
        v12 = [v26 typesInCombination];
        uint64_t v13 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v12 count]);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v14 = v12;
        id v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v29;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              id v20 = [v8 objectForKey:v19];
              [v13 setValue:v20 forKey:v19];
            }
            id v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v16);
        }

        id v21 = +[NSDictionary dictionaryWithDictionary:v13];
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
        id v23 = +[NSString stringWithFormat:@"The data type \"%@\" is not valid", v9];
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
    id v10 = [(FedStatsDataEncoder *)self dataTypes];
    uint64_t v11 = [v10 objectForKey:v9];

    if (v11)
    {
      v12 = [v11 decodeFromOneHotVector:v8 possibleError:a5];
    }
    else
    {
      if (a5)
      {
        uint64_t v13 = +[NSString stringWithFormat:@"The data type \"%@\" is not valid", v9];
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
  id v30 = a3;
  if (!v30)
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
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = [(FedStatsDataEncoder *)self typeConfiguration];
  id v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v13 = [(FedStatsDataEncoder *)self dataTypes];
        id v14 = [v13 objectForKey:v12];
        v9 += (unint64_t)[v14 classCount];
      }
      id v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v8);

    if (v9 > 0x186A0)
    {
      if (a4)
      {
        id v15 = +[NSString stringWithFormat:@"Resulting dimensionality %lu is larger than max dimensionality %lu", v9, 100000];
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
  uint64_t v17 = +[NSMutableData data];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v18 = [(FedStatsDataEncoder *)self typeConfiguration];
  id v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v19)
  {
    id v20 = v19;
    id v21 = 0;
    uint64_t v22 = *(void *)v32;
    while (2)
    {
      id v23 = 0;
      id v24 = v21;
      do
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v25 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v23);
        id v21 = [(FedStatsDataEncoder *)self encodeToBitVector:v30 withType:v25 possibleError:a4];

        if (!v21)
        {
          if (a4)
          {
            id v26 = [*a4 code];
            v27 = [*a4 localizedDescription];
            long long v28 = +[NSString stringWithFormat:@"Error encoding \"%@\" type: %@", v25, v27];
            *a4 = +[FedStatsError errorWithCode:v26 description:v28];
          }
          id v16 = 0;
          goto LABEL_29;
        }
        [v17 appendData:v21];
        id v23 = (char *)v23 + 1;
        id v24 = v21;
      }
      while (v20 != v23);
      id v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
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
  id v6 = a3;
  id v7 = [(FedStatsDataEncoder *)self typeConfiguration];
  id v8 = [v7 count];

  if (v8 != (id)1)
  {
    if (a4)
    {
      CFStringRef v23 = @"This API is only available for single type in encoding schema";
      uint64_t v24 = 900;
LABEL_19:
      +[FedStatsError errorWithCode:v24 description:v23];
      id v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_23:
    id v20 = 0;
    goto LABEL_27;
  }
  if (!v6)
  {
    if (a4)
    {
      CFStringRef v23 = @"Provided data is empty";
      uint64_t v24 = 401;
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  id v30 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v9 = [(FedStatsDataEncoder *)self dataTypes];
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v15 = [(FedStatsDataEncoder *)self dataTypes];
        id v16 = [v15 objectForKey:v14];
        if ([v16 dataType] == (id)99)
        {
        }
        else
        {
          uint64_t v17 = [v6 objectForKey:v14];

          if (!v17)
          {
            if (v30)
            {
              uint64_t v25 = +[NSString stringWithFormat:@"Provided data does not contain a value for \"%@\"", v14];
              *id v30 = +[FedStatsError errorWithCode:200 description:v25];
            }
            goto LABEL_23;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v18 = [(FedStatsDataEncoder *)self typeConfiguration];
  id v19 = [v18 firstObject];
  id v31 = 0;
  id v20 = [(FedStatsDataEncoder *)self encodeToIndex:v6 withType:v19 error:&v31];
  id v21 = v31;

  if (v20)
  {
    id v22 = v20;
  }
  else if (v30)
  {
    id v26 = [(FedStatsDataEncoder *)self typeConfiguration];
    v27 = [v26 firstObject];
    long long v28 = +[NSString stringWithFormat:@"Cannot encode data to \"%@\"", v27];
    *id v30 = +[FedStatsError errorWithCode:401 underlyingError:v21 description:v28];
  }
LABEL_27:

  return v20;
}

- (id)decodeFromBitVector:(id)a3 possibleError:(id *)a4
{
  id v25 = a3;
  id v6 = [(FedStatsDataEncoder *)self typeConfiguration];
  id v22 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(FedStatsDataEncoder *)self typeConfiguration];
  id v24 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v24)
  {
    uint64_t v7 = 0;
    uint64_t v23 = *(void *)v28;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      unint64_t v9 = a4;
      if (*(void *)v28 != v23) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * v8);
      id v11 = [(FedStatsDataEncoder *)self dataTypes];
      uint64_t v12 = [v11 objectForKey:v10];

      id v13 = [v12 classCount];
      uint64_t v14 = objc_msgSend(v25, "subdataWithRange:", v7, v13);
      id v26 = 0;
      id v15 = [(FedStatsDataEncoder *)self decodeFromBitVector:v14 withType:v10 possibleError:&v26];
      id v16 = v26;
      if (v15) {
        break;
      }
      if (!v9) {
        goto LABEL_13;
      }
      uint64_t v17 = +[NSString stringWithFormat:@"The decoder for \"%@\" failed", v10];
      a4 = v9;
      id *v9 = +[FedStatsError errorWithCode:500 underlyingError:v16 description:v17];

LABEL_14:
      if (!v15)
      {

        id v19 = 0;
        v18 = v22;
        goto LABEL_19;
      }
      if (v24 == (id)++v8)
      {
        id v24 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v24) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v22 addEntriesFromDictionary:v15];
    }
    else {
      [v22 setValue:v15 forKey:v10];
    }
    v7 += (uint64_t)v13;
LABEL_13:
    a4 = v9;
    goto LABEL_14;
  }
LABEL_17:

  v18 = v22;
  id v19 = +[NSDictionary dictionaryWithDictionary:v22];
LABEL_19:

  return v19;
}

+ (id)encodeDataArray:(id)a3 dataTypeContent:(id)a4 resultType:(unint64_t *)a5 errorOut:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    if (a6)
    {
      CFStringRef v26 = @"encodeDataArray missing data type content";
LABEL_22:
      +[FedStatsError errorWithCode:400 description:v26];
      id v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
LABEL_23:
    id v15 = 0;
    goto LABEL_44;
  }
  if (!v9)
  {
    if (a6)
    {
      CFStringRef v26 = @"encodeDataArray missing data array";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  id v53 = 0;
  id v11 = +[FedStatsDataEncoder createWithDataTypeContent:v10 possibleError:&v53];
  id v12 = v53;
  id v13 = v12;
  if (v11)
  {
    id v38 = v12;
    id v39 = v10;
    id v40 = v9;
    uint64_t v14 = +[FedStatsDataSampler pickSamplesFrom:v9 length:20];
    id v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v14 count]);
    id v16 = [v11 typeConfiguration];
    id v17 = [v16 count];

    long long v37 = v14;
    if ((unint64_t)v17 < 2)
    {
      *a5 = 1;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v27 = v14;
      id v28 = [v27 countByEnumeratingWithState:&v44 objects:v57 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v45;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v45 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            if (v32)
            {
              id v41 = 0;
              long long v33 = [v11 encodeToIndex:v32 error:&v41];
              long long v34 = v41;
              if (v33)
              {
                [v15 addObject:v33];
              }
              else
              {
                long long v35 = +[FedStatsLog logger];
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
                  sub_100020074(&buf, v34, &v56, v35);
                }
              }
            }
            else
            {
              long long v34 = +[FedStatsLog logger];
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                sub_100020034(&v42, v43, v34);
              }
            }
          }
          id v29 = [v27 countByEnumeratingWithState:&v44 objects:v57 count:16];
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
      id v19 = [v18 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v50;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v50 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
            uint64_t v48 = 0;
            id v24 = [v11 encodeToBitVector:v23 possibleError:&v48];
            if (v24)
            {
              [v15 addObject:v24];
            }
            else
            {
              id v25 = +[FedStatsLog logger];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
                sub_10001FFF4(&buf, v55, v25);
              }
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v20);
      }
    }

    id v10 = v39;
    id v9 = v40;
    id v13 = v38;
  }
  else if (a6)
  {
    +[FedStatsError errorWithCode:302 underlyingError:v12 description:@"encodeDataArray encoder construction failed"];
    id v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }

LABEL_44:
  return v15;
}

+ (BOOL)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v14;
  if (v14)
  {
    id v16 = [v14 length];
    if (v16 >= [@"fedstats:" length]
      && ([v15 substringToIndex:objc_msgSend(@"fedstats:", "length")],
          id v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = [v17 isEqualToString:@"fedstats:"],
          v17,
          (v18 & 1) != 0))
    {
      id v19 = v15;
    }
    else
    {
      id v19 = [@"fedstats:" stringByAppendingString:v15];
    }
    id v20 = v19;
    uint64_t v21 = +[FedStatsLog logger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1000201A8((uint64_t)v20, v21);
    }

    id v70 = 0;
    uint64_t v71 = 0;
    id v22 = +[FedStatsDataEncoder encodeDataArray:v11 dataTypeContent:v12 resultType:&v71 errorOut:&v70];
    id v23 = v70;
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
    id v24 = +[FedStatsLog logger];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_100020164(v24);
    }

    id v61 = [objc_alloc((Class)_DPBitValueRecorder) initWithKey:v20];
    if (!v61)
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
      uint64_t v78 = kDPMetadataVersionHash;
      CFStringRef v79 = &stru_100031EA0;
      id v25 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    }
    v60 = v25;
    if (![v22 count]) {
      goto LABEL_26;
    }
    if (v71 == 1)
    {
      id v54 = v23;
      id v58 = v11;
      v59 = v20;
      v55 = v15;
      id v56 = v13;
      id v57 = v12;
      id v27 = +[NSMutableDictionary dictionary];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v28 = v22;
      id v29 = [v28 countByEnumeratingWithState:&v66 objects:v77 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v67;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v67 != v31) {
              objc_enumerationMutation(v28);
            }
            long long v33 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            long long v34 = [v33 dimensionality];
            long long v35 = [v27 objectForKey:v34];

            long long v36 = [v33 index];
            if (v35) {
              [v35 arrayByAddingObject:v36];
            }
            else {
            long long v37 = +[NSArray arrayWithObject:v36];
            }
            id v38 = [v33 dimensionality];
            [v27 setObject:v37 forKey:v38];
          }
          id v30 = [v28 countByEnumeratingWithState:&v66 objects:v77 count:16];
        }
        while (v30);
      }

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v39 = v27;
      id v40 = [v39 countByEnumeratingWithState:&v62 objects:v76 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v63;
        uint64_t v43 = kDPMetadataAlgoParamDimensionality;
        uint64_t v44 = kDPMetadataAlgorithmParameters;
        do
        {
          for (j = 0; j != v41; j = (char *)j + 1)
          {
            if (*(void *)v63 != v42) {
              objc_enumerationMutation(v39);
            }
            long long v46 = *(void **)(*((void *)&v62 + 1) + 8 * (void)j);
            long long v47 = +[FedStatsLog logger];
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint8_t buf = 138412290;
              v75 = v46;
              _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord recording with dimension = \"%@\"", buf, 0xCu);
            }

            id v48 = [v60 mutableCopy];
            uint64_t v72 = v43;
            v73 = v46;
            long long v49 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
            [v48 setObject:v49 forKey:v44];

            long long v50 = [v39 objectForKey:v46];
            unsigned __int8 v51 = [v61 record:v50 metadata:v48];

            if ((v51 & 1) == 0)
            {
              long long v52 = +[FedStatsLog logger];
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)uint8_t buf = 138412290;
                v75 = v59;
                _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord failed to record numbers for key '%@'", buf, 0xCu);
              }
            }
          }
          id v41 = [v39 countByEnumeratingWithState:&v62 objects:v76 count:16];
        }
        while (v41);
      }

      BOOL v26 = 1;
      id v12 = v57;
      id v11 = v58;
      id v15 = v55;
      id v13 = v56;
      id v20 = v59;
      id v23 = v54;
    }
    else if (v71 == 2)
    {
      if ([v61 recordBitVectors:v22 metadata:v60])
      {
LABEL_26:
        BOOL v26 = 1;
LABEL_59:

LABEL_60:
LABEL_61:

        goto LABEL_62;
      }
      id v39 = +[FedStatsLog logger];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        sub_1000200EC((uint64_t)v20, v39);
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
      id v39 = +[NSString stringWithFormat:@"Unsupported result type \"%lu\" in data encoder", v71];
      +[FedStatsError errorWithCode:900 description:v39];
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
  id v17 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = +[NSArray arrayWithObjects:&v17 count:1];
  LOBYTE(a7) = +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:", v15, v13, v12, v11, a7, v17);

  return (char)a7;
}

+ (BOOL)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6
{
  return +[FedStatsDataEncoder encodeDataArrayAndRecord:a3 dataTypeContent:a4 metadata:&__NSDictionary0__struct baseKey:a5 errorOut:a6];
}

+ (BOOL)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6
{
  id v14 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[NSArray arrayWithObjects:&v14 count:1];
  LOBYTE(a6) = +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:", v12, v10, v9, a6, v14);

  return (char)a6;
}

+ (BOOL)record:(id)a3 metadata:(id)a4 baseKey:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)_DPBitValueRecorder) initWithKey:v7];

  LOBYTE(v7) = [v10 record:v9 metadata:v8];
  return (char)v7;
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

@end