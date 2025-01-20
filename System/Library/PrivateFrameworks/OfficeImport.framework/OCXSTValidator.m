@interface OCXSTValidator
+ (BOOL)isValidValue:(id)a3 simpleType:(unint64_t)a4;
+ (id)simpleType:(unint64_t)a3 integerValue:(int64_t)a4;
+ (id)simpleType:(unint64_t)a3 stringValue:(id)a4;
+ (id)validateIntegerValue:(int64_t)a3 minValue:(int64_t)a4 maxValue:(int64_t)a5;
+ (id)validator;
- (OCXSTValidator)init;
- (id)simpleTypeMap;
@end

@implementation OCXSTValidator

+ (id)validateIntegerValue:(int64_t)a3 minValue:(int64_t)a4 maxValue:(int64_t)a5
{
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
  v9 = (void *)v8;
  if (a3 < a4)
  {
    v10 = [NSNumber numberWithInteger:a4];

    if (TSUDefaultCat_init_token == -1) {
      goto LABEL_8;
    }
    v12 = &__block_literal_global_68;
LABEL_13:
    dispatch_once(&TSUDefaultCat_init_token, v12);
    goto LABEL_8;
  }
  if (a3 <= a5)
  {
    v10 = (void *)v8;
    goto LABEL_8;
  }
  v10 = [NSNumber numberWithInteger:a5];

  if (TSUDefaultCat_init_token != -1)
  {
    v12 = &__block_literal_global_3;
    goto LABEL_13;
  }
LABEL_8:
  return v10;
}

void __57__OCXSTValidator_validateIntegerValue_minValue_maxValue___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __57__OCXSTValidator_validateIntegerValue_minValue_maxValue___block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

+ (BOOL)isValidValue:(id)a3 simpleType:(unint64_t)a4
{
  id v6 = a3;
  v7 = [a1 validator];
  uint64_t v8 = objc_opt_class();
  v9 = [v7 simpleTypeMap];
  v10 = [NSNumber numberWithUnsignedInteger:a4];
  v11 = [v9 objectForKeyedSubscript:v10];
  v12 = TSUDynamicCast(v8, (uint64_t)v11);

  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    v14 = [v12 objectAtIndexedSubscript:0];
    v15 = TSUDynamicCast(v13, (uint64_t)v14);

    uint64_t v16 = objc_opt_class();
    v17 = [v12 objectAtIndexedSubscript:1];
    v18 = TSUDynamicCast(v16, (uint64_t)v17);

    BOOL v19 = 0;
    if (v15 && v18)
    {
      uint64_t v20 = [v15 compare:v6];
      unint64_t v21 = [v18 compare:v6];
      BOOL v19 = (unint64_t)(v20 + 1) < 2 && v21 < 2;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

+ (id)validator
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!+[OCXSTValidator validator]::validator)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)+[OCXSTValidator validator]::validator;
    +[OCXSTValidator validator]::validator = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)+[OCXSTValidator validator]::validator;
  return v5;
}

+ (id)simpleType:(unint64_t)a3 integerValue:(int64_t)a4
{
  v7 = [NSNumber numberWithInteger:a4];
  uint64_t v8 = [a1 validator];
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 simpleTypeMap];
    v11 = [NSNumber numberWithUnsignedInteger:a3];
    v12 = [v10 objectForKeyedSubscript:v11];
    uint64_t v13 = TSUDynamicCast(v9, (uint64_t)v12);

    if (v13)
    {
      uint64_t v14 = objc_opt_class();
      v15 = [v13 objectAtIndexedSubscript:0];
      uint64_t v16 = TSUDynamicCast(v14, (uint64_t)v15);

      uint64_t v17 = objc_opt_class();
      v18 = [v13 objectAtIndexedSubscript:1];
      BOOL v19 = TSUDynamicCast(v17, (uint64_t)v18);

      if (v16 && v19)
      {
        uint64_t v20 = objc_msgSend(a1, "validateIntegerValue:minValue:maxValue:", a4, objc_msgSend(v16, "integerValue"), objc_msgSend(v19, "integerValue"));

        v7 = (void *)v20;
      }
    }
  }

  return v7;
}

+ (id)simpleType:(unint64_t)a3 stringValue:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [NSString stringWithString:v6];
  uint64_t v8 = [a1 validator];
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 simpleTypeMap];
    v11 = [NSNumber numberWithUnsignedInteger:a3];
    v12 = [v10 objectForKeyedSubscript:v11];
    uint64_t v13 = TSUDynamicCast(v9, (uint64_t)v12);

    if (!v13) {
      goto LABEL_16;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "caseInsensitiveCompare:", v6, (void)v23))
          {
            uint64_t v20 = v14;
            goto LABEL_18;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    if ([v14 count])
    {
      uint64_t v18 = objc_opt_class();
      BOOL v19 = [v14 objectAtIndexedSubscript:0];
      uint64_t v20 = TSUDynamicCast(v18, (uint64_t)v19);

      if (v20)
      {
        unint64_t v21 = [NSString stringWithString:v20];

        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_8_2);
        }
      }
      else
      {
LABEL_18:
        unint64_t v21 = v7;
      }
    }
    else
    {
LABEL_16:
      unint64_t v21 = v7;
    }
  }
  else
  {
    unint64_t v21 = v7;
  }

  return v21;
}

void __41__OCXSTValidator_simpleType_stringValue___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void).cxx_destruct
{
}

- (OCXSTValidator)init
{
  v9[11] = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)OCXSTValidator;
  id v2 = [(OCXSTValidator *)&v7 init];
  if (v2)
  {
    v8[0] = &unk_26EC80F48;
    v8[1] = &unk_26EC80F90;
    v9[0] = &unk_26EC80A50;
    v9[1] = &unk_26EC80A68;
    v8[2] = &unk_26EC80FC0;
    v8[3] = &unk_26EC80FF0;
    v9[2] = &unk_26EC80A80;
    v9[3] = &unk_26EC80A98;
    v8[4] = &unk_26EC81038;
    v8[5] = &unk_26EC81080;
    v9[4] = &unk_26EC80AB0;
    v9[5] = &unk_26EC80AC8;
    v8[6] = &unk_26EC810C8;
    v8[7] = &unk_26EC810F8;
    v9[6] = &unk_26EC80AE0;
    v9[7] = &unk_26EC80AF8;
    v8[8] = &unk_26EC81128;
    v8[9] = &unk_26EC81158;
    v9[8] = &unk_26EC80B10;
    v9[9] = &unk_26EC80B28;
    v8[10] = &unk_26EC81188;
    v9[10] = &unk_26EC80B40;
    uint64_t v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:11];
    uint64_t v4 = objc_opt_new();
    simpleTypeMap = v2->_simpleTypeMap;
    v2->_simpleTypeMap = (NSMutableDictionary *)v4;

    [(NSMutableDictionary *)v2->_simpleTypeMap addEntriesFromDictionary:v3];
  }
  return v2;
}

- (id)simpleTypeMap
{
  return self->_simpleTypeMap;
}

@end