@interface MTNumberDeresAction
- (MTNumberDeresAction)initWithField:(id)a3 configDictionary:(id)a4;
- (NSArray)buckets;
- (double)precision;
- (id)performAction:(id)a3 context:(id)a4;
- (void)setBuckets:(id)a3;
- (void)setPrecision:(double)a3;
@end

@implementation MTNumberDeresAction

- (MTNumberDeresAction)initWithField:(id)a3 configDictionary:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MTNumberDeresAction;
  v7 = [(MTTreatmentAction *)&v23 initWithField:a3 configDictionary:v6];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"precision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[MTNumberDeresAction setPrecision:](v7, "setPrecision:");
    }
    v9 = [v6 objectForKeyedSubscript:@"buckets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      v9 = v10;
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = objc_msgSend(v15, "objectForKeyedSubscript:", @"start", (void)v19);

              if (v16) {
                continue;
              }
            }

            v9 = 0;
            goto LABEL_16;
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v12) {
            continue;
          }
          break;
        }
        v9 = v10;
      }
LABEL_16:

      v17 = [v9 sortedArrayUsingComparator:&__block_literal_global_6];
      [(MTNumberDeresAction *)v7 setBuckets:v17];
    }
  }

  return v7;
}

- (id)performAction:(id)a3 context:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)MTNumberDeresAction;
  v5 = [(MTTreatmentAction *)&v20 performAction:a3 context:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(MTNumberDeresAction *)self buckets];
    if (![v6 count]) {
      goto LABEL_12;
    }
    long long v21 = @"start";
    v22[0] = v5;
    v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v8 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v6, "count"), 1536, &__block_literal_global_6);

    if (v8 && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = [v6 objectAtIndexedSubscript:v8 - 1];
      id v10 = [v9 objectForKeyedSubscript:@"value"];
      uint64_t v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [v9 objectForKeyedSubscript:@"start"];
      }
      id v14 = v12;

      v5 = v14;
    }
    uint64_t v13 = 0;
    if (v8)
    {
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_12:
        if (self->_precision == 0.0)
        {
          id v18 = v5;
          v5 = v18;
        }
        else
        {
          [v5 doubleValue];
          double v16 = v15;
          [(MTNumberDeresAction *)self precision];
          if (v17 > 0.0) {
            double v16 = v17 * floor(v16 / v17);
          }
          id v18 = [NSNumber numberWithDouble:v16];
        }
        uint64_t v13 = v18;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (double)precision
{
  return self->_precision;
}

- (void)setPrecision:(double)a3
{
  self->_precision = a3;
}

- (NSArray)buckets
{
  return self->_buckets;
}

- (void)setBuckets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end