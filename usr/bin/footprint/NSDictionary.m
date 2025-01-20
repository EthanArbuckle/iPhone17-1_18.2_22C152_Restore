@interface NSDictionary
- (BOOL)fp_isContainer;
- (id)fp_jsonRepresentation;
- (id)fp_mergeAuxDatum:(id)a3 withDatum:(id)a4 forceAggregate:(BOOL)a5;
- (id)fp_mergeWithData:(id)a3;
- (id)fp_mergeWithData:(id)a3 forceAggregate:(BOOL)a4;
@end

@implementation NSDictionary

- (BOOL)fp_isContainer
{
  return 1;
}

- (id)fp_mergeAuxDatum:(id)a3 withDatum:(id)a4 forceAggregate:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    unsigned int v9 = [v7 fp_isContainer];
    if (v9 != objc_msgSend(v8, "fp_isContainer")) {
      __assert_rtn("-[NSDictionary(FPAuxData) fp_mergeAuxDatum:withDatum:forceAggregate:]", "FPAuxData.m", 18, "!datum2 || datum1.fp_isContainer == datum2.fp_isContainer");
    }
  }
  if (objc_msgSend(v7, "fp_isContainer"))
  {
    [v7 fp_mergeWithData:v8 forceAggregate:v5];
    v10 = (FPAuxData *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = v10;
    goto LABEL_11;
  }
  if (v5 || [v7 shouldAggregate])
  {
    if (v8) {
      v10 = -[FPAuxData initWithValue:shouldAggregate:]([FPAuxData alloc], "initWithValue:shouldAggregate:", (char *)[v7 value] + [v7 shouldAggregate]);
    }
    else {
      v10 = (FPAuxData *)v7;
    }
    goto LABEL_10;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)fp_mergeWithData:(id)a3
{
  return [(NSDictionary *)self fp_mergeWithData:a3 forceAggregate:0];
}

- (id)fp_mergeWithData:(id)a3 forceAggregate:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  if (v27 || !v4)
  {
    id v7 = +[NSMutableDictionary dictionary];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = self;
    id v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v14 = [(NSDictionary *)v8 objectForKeyedSubscript:v13];
          v15 = [v27 objectForKeyedSubscript:v13];
          v16 = [(NSDictionary *)v8 fp_mergeAuxDatum:v14 withDatum:v15 forceAggregate:v4];
          [v7 setObject:v16 forKeyedSubscript:v13];
        }
        id v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v10);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v27;
    id v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * (void)j);
          v23 = [(NSDictionary *)v8 objectForKeyedSubscript:v22];

          if (!v23)
          {
            v24 = [v17 objectForKeyedSubscript:v22];
            v25 = [(NSDictionary *)v8 fp_mergeAuxDatum:v24 withDatum:0 forceAggregate:v4];
            [v7 setObject:v25 forKeyedSubscript:v22];
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v19);
    }

    if ([v7 count]) {
      v6 = v7;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = self;
  }

  return v6;
}

- (id)fp_jsonRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = self;
  id v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v9, (void)v13);
        uint64_t v11 = [v10 fp_jsonRepresentation];
        [v3 setObject:v11 forKeyedSubscript:v9];
      }
      id v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

@end