@interface NSDictionary(WFAdditions)
- (double)wf_doubleForKeyPath:()WFAdditions;
- (float)wf_floatForKeyPath:()WFAdditions;
- (id)wf_URLForKeyPath:()WFAdditions;
- (id)wf_arrayForKeyPath:()WFAdditions;
- (id)wf_dictionaryForKeyPath:()WFAdditions;
- (id)wf_filter:()WFAdditions;
- (id)wf_numberForKeyPath:()WFAdditions;
- (id)wf_objectOfKind:()WFAdditions forKeyPath:;
- (id)wf_stringForKeyPath:()WFAdditions;
- (id)wf_temperatureWithCelsiusKeyPath:()WFAdditions fahrenheitKeyPath:;
- (uint64_t)wf_integerForKeyPath:()WFAdditions;
- (uint64_t)wf_objectForKeyPath:()WFAdditions;
@end

@implementation NSDictionary(WFAdditions)

- (id)wf_objectOfKind:()WFAdditions forKeyPath:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a1;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v7, "firstObject", (void)v18);
          id v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v14 = v7;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([v14 objectForKeyedSubscript:v13],
              v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              !v15))
        {

          v16 = 0;
          goto LABEL_17;
        }
        id v7 = [v14 objectForKeyedSubscript:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (a3 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    id v14 = v7;
  }
  else
  {
    id v14 = v7;
    v16 = v14;
  }
LABEL_17:

  return v16;
}

- (uint64_t)wf_objectForKeyPath:()WFAdditions
{
  return objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", 0, a3);
}

- (id)wf_dictionaryForKeyPath:()WFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v4);

  return v5;
}

- (id)wf_arrayForKeyPath:()WFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v4);

  return v5;
}

- (id)wf_stringForKeyPath:()WFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v4);

  return v5;
}

- (id)wf_URLForKeyPath:()WFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v4);

  return v5;
}

- (id)wf_numberForKeyPath:()WFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v4);

  return v5;
}

- (id)wf_temperatureWithCelsiusKeyPath:()WFAdditions fahrenheitKeyPath:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v7);

  uint64_t v9 = objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v6);

  if (v8 | v9)
  {
    uint64_t v10 = objc_opt_new();
    if (v8)
    {
      [(id)v8 doubleValue];
      objc_msgSend(v10, "setCelsius:");
    }
    if (v9)
    {
      [(id)v9 doubleValue];
      objc_msgSend(v10, "setFahrenheit:");
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)wf_integerForKeyPath:()WFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "wf_numberForKeyPath:", v4);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "wf_stringForKeyPath:", v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;

  uint64_t v9 = [v8 integerValue];
  return v9;
}

- (float)wf_floatForKeyPath:()WFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "wf_numberForKeyPath:", v4);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "wf_stringForKeyPath:", v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;

  [v8 floatValue];
  float v10 = v9;

  return v10;
}

- (double)wf_doubleForKeyPath:()WFAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "wf_numberForKeyPath:", v4);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "wf_stringForKeyPath:", v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;

  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

- (id)wf_filter:()WFAdditions
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(a1, "count"));
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __39__NSDictionary_WFAdditions__wf_filter___block_invoke;
    v12 = &unk_264431D38;
    id v13 = v5;
    id v14 = v4;
    id v6 = v5;
    [a1 enumerateKeysAndObjectsUsingBlock:&v9];
    objc_msgSend(NSDictionary, "dictionaryWithDictionary:", v6, v9, v10, v11, v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

@end