@interface WFTTSString
+ (id)parseAnnotatedString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)components;
- (NSString)displayString;
- (WFTTSString)initWithComponents:(id)a3;
- (id)description;
@end

@implementation WFTTSString

- (void).cxx_destruct
{
}

- (NSArray)components
{
  return self->_components;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(WFTTSString *)self components];
    v6 = [v4 components];
    char v7 = [v5 isEqualToArray:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)WFTTSString;
  v3 = [(WFTTSString *)&v7 description];
  id v4 = [(WFTTSString *)self components];
  v5 = [v3 stringByAppendingFormat:@": %@", v4];

  return v5;
}

- (NSString)displayString
{
  v2 = [(WFTTSString *)self components];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_18909);

  id v4 = [v3 componentsJoinedByString:&stru_1F0C7EBE0];

  return (NSString *)v4;
}

id __28__WFTTSString_displayString__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 displayString];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (WFTTSString)initWithComponents:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFTTSString.m", 29, @"Invalid parameter not satisfying: %@", @"components" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFTTSString;
  v6 = [(WFTTSString *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    components = v6->_components;
    v6->_components = (NSArray *)v7;

    v9 = v6;
  }

  return v6;
}

+ (id)parseAnnotatedString:(id)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"WFTTSString.m", 40, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  v26 = (objc_class *)a1;
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v27 = objc_opt_new();
  uint64_t v6 = objc_msgSend(v5, "rangeOfString:options:range:", @"[Siri ", 0, 0, objc_msgSend(v5, "length"));
  uint64_t v29 = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
    uint64_t v29 = 0;
    do
    {
      uint64_t v9 = v8 + v7;
      uint64_t v10 = objc_msgSend(v5, "rangeOfString:options:range:", @"]", 0, v9, objc_msgSend(v5, "length") - v9);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = v10;
        uint64_t v30 = v11;
        v13 = objc_msgSend(v5, "substringWithRange:", v9, v10 - v9);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v14 = v28;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v32 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = [*(id *)(*((void *)&v31 + 1) + 8 * i) parseAnnotationString:v13];
              if (v19)
              {
                v20 = (void *)v19;

                v21 = objc_msgSend(v5, "substringWithRange:", v29, v8 - v29);
                if ([v21 length]) {
                  [v27 addObject:v21];
                }
                [v27 addObject:v20];
                uint64_t v9 = v12 + v30;

                uint64_t v29 = v12 + v30;
                goto LABEL_18;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
      }
LABEL_18:
      uint64_t v8 = objc_msgSend(v5, "rangeOfString:options:range:", @"[Siri ", 0, v9, objc_msgSend(v5, "length") - v9);
    }
    while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  }
  if (v29 != [v5 length])
  {
    v22 = objc_msgSend(v5, "substringWithRange:", v29, objc_msgSend(v5, "length") - v29);
    [v27 addObject:v22];
  }
  v23 = (void *)[[v26 alloc] initWithComponents:v27];

  return v23;
}

@end