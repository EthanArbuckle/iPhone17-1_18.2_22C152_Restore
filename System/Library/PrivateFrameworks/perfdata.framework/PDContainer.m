@interface PDContainer
+ (PDContainer)containerWithFileURL:(id)a3 error:(id *)a4;
+ (PDContainer)containerWithJSONData:(id)a3 error:(id *)a4;
+ (PDContainer)containerWithJSONDictionary:(id)a3 error:(id *)a4;
+ (PDContainer)containerWithPath:(id)a3 error:(id *)a4;
- (BOOL)enumerateAggregatedMeasurementsIgnoringVariables:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateAggregatedMeasurementsMatchingNullableFilter:(id)a3 ignoringVariables:(id)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateMeasurementsMatchingNullableFilter:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateMeasurementsWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)isComparableTo:(id)a3;
- (BOOL)isLike:(id)a3;
- (BOOL)largerBetter;
- (NSDictionary)configuration;
- (NSDictionary)labels;
- (NSDictionary)variables;
- (NSMutableDictionary)extensions;
- (NSMutableDictionary)perfdata;
- (NSString)generator;
- (NSString)name;
- (NSString)notes;
- (NSString)primaryMetricFilter;
- (NSString)testDescription;
- (PDContainer)initWithFileURL:(id)a3 error:(id *)a4;
- (PDContainer)initWithJSONData:(id)a3 error:(id *)a4;
- (PDContainer)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (PDContainer)initWithPath:(id)a3 error:(id *)a4;
- (id)aggregateMeasurementsMatchingFilter:(id)a3 error:(id *)a4;
- (id)description;
- (unint64_t)measurementCount;
- (unint64_t)version;
- (void)setConfiguration:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setGenerator:(id)a3;
- (void)setLabels:(id)a3;
- (void)setLargerBetter:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNotes:(id)a3;
- (void)setPerfdata:(id)a3;
- (void)setPrimaryMetricFilter:(id)a3;
- (void)setTestDescription:(id)a3;
- (void)setVariables:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PDContainer

- (PDContainer)initWithPath:(id)a3 error:(id *)a4
{
  v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];
  v7 = [(PDContainer *)self initWithFileURL:v6 error:a4];

  return v7;
}

+ (PDContainer)containerWithPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [[PDContainer alloc] initWithPath:v5 error:a4];

  return v6;
}

- (PDContainer)initWithFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDContainer;
  v7 = [(PDContainer *)&v13 init];
  if (v7)
  {
    v8 = v7;
    v9 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v6];
    [v9 open];
    v10 = [MEMORY[0x1E4F28D90] JSONObjectWithStream:v9 options:3 error:a4];
    [v9 close];
    if (v10)
    {
      v8 = [(PDContainer *)v8 initWithJSONDictionary:v10 error:a4];
      v11 = v8;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (PDContainer)containerWithFileURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[PDContainer alloc] initWithFileURL:v5 error:a4];

  return v6;
}

- (PDContainer)initWithJSONData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PDContainer;
  v7 = [(PDContainer *)&v12 init];
  if (v7)
  {
    v8 = v7;
    v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:3 error:a4];
    if (v9)
    {
      v8 = [(PDContainer *)v8 initWithJSONDictionary:v9 error:a4];
      v10 = v8;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (PDContainer)containerWithJSONData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[PDContainer alloc] initWithJSONData:v5 error:a4];

  return v6;
}

- (PDContainer)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PDContainer *)self setPerfdata:v6];
    v7 = [(PDContainer *)self perfdata];
    v8 = [v7 objectForKeyedSubscript:@"$schema"];

    if (!v8
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([v8 hasPrefix:@"https://perfdata.apple.com/schema/"] & 1) == 0)
    {
      if (p_isa)
      {
        v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v55 = *MEMORY[0x1E4F28568];
        v56[0] = @"schema is not perfdata";
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
        *p_isa = [v26 errorWithDomain:@"PDError" code:3 userInfo:v27];

        p_isa = 0;
      }
      goto LABEL_17;
    }
    v9 = [(PDContainer *)self perfdata];
    v10 = [v9 objectForKeyedSubscript:@"name"];
    [(PDContainer *)self setName:v10];

    uint64_t v11 = [(PDContainer *)self name];
    if (!v11
      || (objc_super v12 = (void *)v11,
          [(PDContainer *)self name],
          objc_super v13 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v13,
          v12,
          (isKindOfClass & 1) == 0))
    {
      handle_malformed_data(p_isa, @"perfdata name");
      p_isa = (id *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    v15 = [(PDContainer *)self perfdata];
    v16 = [v15 objectForKeyedSubscript:@"version"];

    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[PDContainer setVersion:](self, "setVersion:", [v16 unsignedIntegerValue]);
      v17 = [(PDContainer *)self perfdata];
      v18 = [v17 objectForKeyedSubscript:@"description"];
      [(PDContainer *)self setTestDescription:v18];

      uint64_t v19 = [(PDContainer *)self testDescription];
      if (!v19
        || (v20 = (void *)v19,
            [(PDContainer *)self testDescription],
            v21 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char v22 = objc_opt_isKindOfClass(),
            v21,
            v20,
            (v22 & 1) != 0))
      {
        v23 = [(PDContainer *)self perfdata];
        v24 = [v23 objectForKeyedSubscript:@"larger_better"];

        if (v24)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v41 = @"perfdata larger_better";
            goto LABEL_31;
          }
          uint64_t v25 = [v24 BOOLValue];
        }
        else
        {
          uint64_t v25 = 0;
        }
        [(PDContainer *)self setLargerBetter:v25];
        v30 = [(PDContainer *)self perfdata];
        v31 = [v30 objectForKeyedSubscript:@"primary_metric"];
        [(PDContainer *)self setPrimaryMetricFilter:v31];

        uint64_t v32 = [(PDContainer *)self primaryMetricFilter];
        if (v32)
        {
          v33 = (void *)v32;
          v34 = [(PDContainer *)self primaryMetricFilter];
          objc_opt_class();
          char v35 = objc_opt_isKindOfClass();

          if ((v35 & 1) == 0)
          {
            v41 = @"perfdata primary_metric";
            goto LABEL_31;
          }
        }
        v36 = [(PDContainer *)self perfdata];
        v37 = [v36 objectForKeyedSubscript:@"generator"];
        [(PDContainer *)self setGenerator:v37];

        v38 = [(PDContainer *)self generator];

        if (v38)
        {
          v39 = [(PDContainer *)self generator];
          objc_opt_class();
          char v40 = objc_opt_isKindOfClass();

          if ((v40 & 1) == 0)
          {
            v41 = @"perfdata generator";
            goto LABEL_31;
          }
        }
        else
        {
          [(PDContainer *)self setGenerator:@"<unknown>"];
        }
        v43 = [(PDContainer *)self perfdata];
        v44 = expect_dictionary(v43, @"variables", p_isa, @"perfdata variables");
        [(PDContainer *)self setVariables:v44];

        v45 = [(PDContainer *)self variables];

        if (!v45) {
          goto LABEL_41;
        }
        v46 = [(PDContainer *)self perfdata];
        v47 = expect_dictionary(v46, @"configuration", p_isa, @"perfdata configuration");
        [(PDContainer *)self setConfiguration:v47];

        v48 = [(PDContainer *)self configuration];

        if (!v48)
        {
LABEL_41:
          p_isa = 0;
          goto LABEL_33;
        }
        v49 = [(PDContainer *)self perfdata];
        v50 = [v49 objectForKeyedSubscript:@"notes"];
        [(PDContainer *)self setNotes:v50];

        uint64_t v51 = [(PDContainer *)self notes];
        if (!v51
          || (v52 = (void *)v51,
              [(PDContainer *)self notes],
              v53 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char v54 = objc_opt_isKindOfClass(),
              v53,
              v52,
              (v54 & 1) != 0))
        {
          v42 = self;
          goto LABEL_32;
        }
        v41 = @"perfdata notes";
LABEL_31:
        handle_malformed_data(p_isa, v41);
        v42 = (PDContainer *)objc_claimAutoreleasedReturnValue();
LABEL_32:
        p_isa = (id *)&v42->super.isa;
LABEL_33:

        goto LABEL_34;
      }
      v29 = @"perfdata description";
    }
    else
    {
      v29 = @"perfdata version";
    }
    handle_malformed_data(p_isa, v29);
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
LABEL_34:

    goto LABEL_17;
  }
  handle_malformed_data(p_isa, @"perfdata object");
  p_isa = (id *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return (PDContainer *)p_isa;
}

+ (PDContainer)containerWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[PDContainer alloc] initWithJSONDictionary:v5 error:a4];

  return v6;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PDContainer *)self name];
  id v5 = [v3 stringWithFormat:@"PerfData: %@ v%lu", v4, -[PDContainer version](self, "version")];

  return v5;
}

- (BOOL)isComparableTo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PDContainer *)self version];
  if (v5 == [v4 version])
  {
    id v6 = [(PDContainer *)self name];
    v7 = [v4 name];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isLike:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0 || [(PDContainer *)self isComparableTo:v4];

  return v5;
}

- (unint64_t)measurementCount
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(PDContainer *)self perfdata];
  v3 = [v2 objectForKeyedSubscript:@"data"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (v10)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v7 += objc_msgSend(v10, "count", (void)v12);
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)enumerateMeasurementsWithError:(id *)a3 usingBlock:(id)a4
{
  return [(PDContainer *)self enumerateMeasurementsMatchingNullableFilter:0 error:a3 usingBlock:a4];
}

- (BOOL)enumerateMeasurementsMatchingNullableFilter:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [(PDContainer *)self perfdata];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"data"];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v8)
      {
        v44 = 0;
        long long v14 = 0;
        goto LABEL_10;
      }
      if ([v8 length])
      {
        long long v12 = strip_container_prefix(self, v8);

        v44 = get_metric_filter_metric(v12);
        uint64_t v13 = get_metric_filter_variables(v12, a4);
        if (!v13)
        {
          BOOL v15 = 0;
          id v8 = v12;
LABEL_42:

          goto LABEL_43;
        }
        long long v14 = (void *)v13;
        id v8 = v12;
LABEL_10:
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v17 = v11;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v18)
        {
          uint64_t v43 = 0;
          uint64_t v19 = *(void *)v51;
          v39 = v17;
          uint64_t v37 = *(void *)v51;
          while (2)
          {
            uint64_t v20 = 0;
            uint64_t v36 = v18;
            do
            {
              if (*(void *)v51 != v19) {
                objc_enumerationMutation(v17);
              }
              v21 = *(void **)(*((void *)&v50 + 1) + 8 * v20);
              if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                id v34 = (id)handle_malformed_data(a4, @"perfdata group");
                BOOL v15 = 0;
                id v17 = v39;
                goto LABEL_41;
              }
              long long v48 = 0u;
              long long v49 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              id obj = v21;
              uint64_t v22 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v42 = *(void *)v47;
                id v40 = v9;
                id v38 = v8;
                uint64_t v35 = v20;
                while (2)
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v47 != v42) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                    if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      id v32 = (id)handle_malformed_data(a4, @"perfdata measurement");
                      BOOL v15 = 0;
LABEL_40:

                      id v9 = v40;
                      id v8 = v38;
                      id v17 = v39;
                      goto LABEL_41;
                    }
                    v26 = a4;
                    v27 = [[PDMeasurement alloc] initWithContainer:self dictionary:v25 group:v43 error:a4];
                    v28 = v27;
                    BOOL v15 = v27 != 0;
                    if (!v27) {
                      goto LABEL_39;
                    }
                    if (!v44
                      || ([(PDMeasurement *)v27 metric],
                          v29 = v14,
                          v30 = objc_claimAutoreleasedReturnValue(),
                          int v31 = [v30 isEqualToString:v44],
                          v30,
                          long long v14 = v29,
                          v31))
                    {
                      if (!v14
                        || [(PDMeasurement *)v28 matchesVariables:v14 ignoringMissing:0])
                      {
                        char v45 = 0;
                        (*((void (**)(id, PDMeasurement *, char *))v40 + 2))(v40, v28, &v45);
                        if (v45)
                        {
LABEL_39:

                          goto LABEL_40;
                        }
                      }
                    }

                    a4 = v26;
                  }
                  uint64_t v23 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
                  id v9 = v40;
                  id v8 = v38;
                  uint64_t v20 = v35;
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

              ++v43;
              ++v20;
              uint64_t v19 = v37;
              id v17 = v39;
            }
            while (v20 != v36);
            uint64_t v18 = [v39 countByEnumeratingWithState:&v50 objects:v55 count:16];
            uint64_t v19 = v37;
            BOOL v15 = 1;
            if (v18) {
              continue;
            }
            break;
          }
        }
        else
        {
          BOOL v15 = 1;
        }
LABEL_41:

        goto LABEL_42;
      }
      BOOL v15 = 1;
    }
    else
    {
      id v16 = (id)handle_malformed_data(a4, @"perfdata data");
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_43:

  return v15;
}

- (BOOL)enumerateAggregatedMeasurementsIgnoringVariables:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  return [(PDContainer *)self enumerateAggregatedMeasurementsMatchingNullableFilter:0 ignoringVariables:a3 error:a4 usingBlock:a5];
}

- (BOOL)enumerateAggregatedMeasurementsMatchingNullableFilter:(id)a3 ignoringVariables:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v12 = (void (**)(id, void *, unsigned char *))a6;
  uint64_t v13 = objc_opt_new();
  long long v14 = objc_opt_new();
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __104__PDContainer_enumerateAggregatedMeasurementsMatchingNullableFilter_ignoringVariables_error_usingBlock___block_invoke;
  v36[3] = &unk_1E63F65C8;
  id v15 = v11;
  id v37 = v15;
  id v16 = v13;
  id v38 = v16;
  v39 = self;
  id v17 = v14;
  id v40 = v17;
  BOOL v18 = [(PDContainer *)self enumerateMeasurementsMatchingNullableFilter:v10 error:a5 usingBlock:v36];
  BOOL v19 = v18;
  if (v18)
  {
    BOOL v29 = v18;
    id v30 = v10;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = v17;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v33;
LABEL_4:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = [v16 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * v24)];
        if (!v25) {
          pdwriter_open_stream_cold_1();
        }
        v26 = v25;
        unsigned __int8 v31 = 0;
        v27 = [v25 measurement];
        v12[2](v12, v27, &v31);

        LODWORD(v27) = v31;
        if (v27) {
          break;
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v22) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v10 = v30;
    BOOL v19 = v29;
  }

  return v19;
}

void __104__PDContainer_enumerateAggregatedMeasurementsMatchingNullableFilter_ignoringVariables_error_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = v3;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v3, "metricFilterIgnoringVariables:");
  }
  else {
  id v4 = [v3 metricFilter];
  }
  uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    unint64_t v7 = [PDAggregateMeasurement alloc];
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [v11 metric];
    id v10 = [v11 unitString];
    uint64_t v5 = [(PDAggregateMeasurement *)v7 initWithContainer:v8 metric:v9 unitString:v10];
    [v6 setObject:v5 forKeyedSubscript:v4];

    [*(id *)(a1 + 56) addObject:v4];
  }
  [(PDAggregateMeasurement *)v5 updateWithMeasurement:v11];
}

- (id)aggregateMeasurementsMatchingFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  long long v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PDContainer_aggregateMeasurementsMatchingFilter_error___block_invoke;
  v9[3] = &unk_1E63F65F0;
  v9[4] = self;
  v9[5] = &v10;
  if ([(PDContainer *)self enumerateMeasurementsMatchingFilter:v6 error:a4 usingBlock:v9])
  {
    unint64_t v7 = [(id)v11[5] measurement];
  }
  else
  {
    unint64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __57__PDContainer_aggregateMeasurementsMatchingFilter_error___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v3)
  {
    id v4 = [PDAggregateMeasurement alloc];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v11 metric];
    unint64_t v7 = [v11 unitString];
    uint64_t v8 = [(PDAggregateMeasurement *)v4 initWithContainer:v5 metric:v6 unitString:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  [v3 updateWithMeasurement:v11];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSMutableDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSString)testDescription
{
  return self->_testDescription;
}

- (void)setTestDescription:(id)a3
{
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSString)primaryMetricFilter
{
  return self->_primaryMetricFilter;
}

- (void)setPrimaryMetricFilter:(id)a3
{
}

- (NSString)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (void)setVariables:(id)a3
{
}

- (NSDictionary)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (BOOL)largerBetter
{
  return self->_largerBetter;
}

- (void)setLargerBetter:(BOOL)a3
{
  self->_largerBetter = a3;
}

- (NSMutableDictionary)perfdata
{
  return self->_perfdata;
}

- (void)setPerfdata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfdata, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_primaryMetricFilter, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_testDescription, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end