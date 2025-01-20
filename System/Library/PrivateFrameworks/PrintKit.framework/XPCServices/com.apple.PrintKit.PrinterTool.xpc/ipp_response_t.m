@interface ipp_response_t
- (id)_descriptionLeader;
- (id)rewriteURLAttributes:(id)a3;
- (ipp_response_t)initWithRequest:(id)a3;
- (ipp_status_t)status;
@end

@implementation ipp_response_t

- (ipp_response_t)initWithRequest:(id)a3
{
  v4 = (id *)a3;
  v26.receiver = self;
  v26.super_class = (Class)ipp_response_t;
  v5 = [(ipp_t *)&v26 init];
  if (v5)
  {
    v5->super._request_id = objc_msgSend(v4, "request_id");
    if ([v4[3] count]
      && ([v4[3] objectAtIndexedSubscript:0],
          v6 = objc_claimAutoreleasedReturnValue(),
          [v6 name],
          v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 compare:@"attributes-charset"],
          v7,
          v6,
          !v8))
    {
      v9 = [v4[3] objectAtIndexedSubscript:0];
      v10 = [v9 values];
      v11 = [v10 objectAtIndexedSubscript:0];
      id v12 = [v11 string];
      v14 = v13;
      [(ipp_t *)v5 _addString:1 valueTag:71 name:@"attributes-charset" lang:0 value:v13];
    }
    else
    {
      [(ipp_t *)v5 _addString:1 valueTag:71 name:@"attributes-charset" lang:0 value:@"utf-8"];
    }
    if ([v4[3] count]
      && ([v4[3] objectAtIndexedSubscript:0],
          v15 = objc_claimAutoreleasedReturnValue(),
          [v15 name],
          v16 = objc_claimAutoreleasedReturnValue(),
          unsigned int v17 = [v16 compare:@"attributes-natural-language"],
          v16,
          v15,
          !v17))
    {
      v19 = [v4[3] objectAtIndexedSubscript:1];
      v20 = [v19 values];
      v21 = [v20 objectAtIndexedSubscript:0];
      id v22 = [v21 string];
      v24 = v23;
      [(ipp_t *)v5 _addString:1 valueTag:72 name:@"attributes-natural-language" lang:0 value:v23];
    }
    else
    {
      v18 = +[NSLocale currentLocale];
      v19 = [v18 objectForKey:NSLocaleLanguageCode];

      [(ipp_t *)v5 _addString:1 valueTag:72 name:@"attributes-natural-language" lang:0 value:v19];
    }
  }
  return v5;
}

- (id)_descriptionLeader
{
  return +[NSString stringWithFormat:@"<ID#%d, status 0x%4.4x>", self->super._request_id, [(ipp_t *)self op_or_status]];
}

- (ipp_status_t)status
{
  return [(ipp_t *)self op_or_status];
}

- (id)rewriteURLAttributes:(id)a3
{
  objc_super v26 = (void (**)(id, void *))a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = [(ipp_t *)self mutableCopy];
  id obj = [v21 attrs];
  id v24 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v29;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v4, "value_tag") == 69)
        {
          v5 = [v4 values];
          v27 = (char *)[v5 count];

          if (v27)
          {
            for (j = 0; j != v27; ++j)
            {
              v7 = [v4 values];
              unsigned int v8 = [v7 objectAtIndexedSubscript:j];
              id v9 = [v8 string];
              v11 = v10;

              if (v11)
              {
                id v12 = +[NSURL URLWithString:v11];
                if (v12)
                {
                  v13 = v26[2](v26, v12);
                  v14 = v13;
                  if (v13 && ([v13 isEqual:v12] & 1) == 0)
                  {
                    v15 = [v14 absoluteString];

                    v16 = [v4 values];
                    unsigned int v17 = [v16 objectAtIndexedSubscript:j];
                    id v18 = v9;
                    id v19 = v15;
                    v11 = v19;
                    if (v17)
                    {
                      objc_msgSend(v17, "setString:", v9, v19);
                    }
                    else
                    {
                    }
                  }
                }
              }
            }
          }
        }
      }
      id v24 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v24);
  }

  return v21;
}

@end