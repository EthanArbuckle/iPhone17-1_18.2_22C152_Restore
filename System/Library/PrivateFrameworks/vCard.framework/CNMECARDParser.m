@interface CNMECARDParser
+ (id)parseString:(id)a3 resultFactory:(id)a4 error:(id *)a5;
+ (void)enumerateTagsInString:(id)a3 usingBlock:(id)a4;
@end

@implementation CNMECARDParser

+ (id)parseString:(id)a3 resultFactory:(id)a4 error:(id *)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [a4 makeBuilder];
  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = [MEMORY[0x1E4F1CA48] array];
  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = [MEMORY[0x1E4F1CA48] array];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __50__CNMECARDParser_parseString_resultFactory_error___block_invoke;
  v30[3] = &unk_1E6C2D370;
  id v13 = v8;
  id v31 = v13;
  id v14 = v9;
  id v32 = v14;
  id v15 = v10;
  id v33 = v15;
  id v16 = v11;
  id v34 = v16;
  id v17 = v12;
  id v35 = v17;
  [a1 enumerateTagsInString:v7 usingBlock:v30];

  v18 = objc_msgSend(v14, "_cn_map:", &__block_literal_global_14);
  v19 = objc_msgSend(v14, "_cn_map:", &__block_literal_global_43);
  [v13 setValues:v14 labels:v18 isPrimaries:v19 forProperty:@"Phone"];

  v20 = objc_msgSend(v15, "_cn_map:", &__block_literal_global_14);
  v21 = objc_msgSend(v15, "_cn_map:", &__block_literal_global_43);
  [v13 setValues:v15 labels:v20 isPrimaries:v21 forProperty:@"Email"];

  v22 = objc_msgSend(v16, "_cn_map:", &__block_literal_global_14);
  v23 = objc_msgSend(v16, "_cn_map:", &__block_literal_global_43);
  [v13 setValues:v16 labels:v22 isPrimaries:v23 forProperty:@"Address"];

  v24 = objc_msgSend(v17, "_cn_map:", &__block_literal_global_14);
  v25 = objc_msgSend(v17, "_cn_map:", &__block_literal_global_43);
  [v13 setValues:v17 labels:v24 isPrimaries:v25 forProperty:@"URLs"];

  uint64_t v26 = [v13 build];
  v27 = (void *)v26;
  if (v26)
  {
    v36[0] = v26;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  }
  else
  {
    v28 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v28;
}

void __50__CNMECARDParser_parseString_resultFactory_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([@"N" isEqualToString:v5])
  {
    id v7 = [MEMORY[0x1E4F5A470] componentsFromString:v6];
    v8 = *(void **)(a1 + 32);
    v9 = [v7 familyName];
    [v8 setValue:v9 forProperty:@"Last"];

    v10 = *(void **)(a1 + 32);
    v11 = [v7 givenName];
    [v10 setValue:v11 forProperty:@"First"];

    v12 = *(void **)(a1 + 32);
    id v13 = [v7 middleName];
    [v12 setValue:v13 forProperty:@"Middle"];

    id v14 = *(void **)(a1 + 32);
    id v15 = [v7 namePrefix];
    [v14 setValue:v15 forProperty:@"Title"];

    id v16 = *(void **)(a1 + 32);
    id v17 = [v7 nameSuffix];
    [v16 setValue:v17 forProperty:@"Suffix"];

    v18 = *(void **)(a1 + 32);
    v19 = [v7 nickname];
    v20 = CNVCardKeyNickname;
LABEL_5:
    [v18 setValue:v19 forProperty:*v20];
    goto LABEL_6;
  }
  if ([@"SOUND" isEqualToString:v5])
  {
    id v7 = [MEMORY[0x1E4F5A470] componentsFromString:v6];
    v21 = *(void **)(a1 + 32);
    v22 = [v7 familyName];
    [v21 setValue:v22 forProperty:@"LastPhonetic"];

    v23 = *(void **)(a1 + 32);
    v24 = [v7 givenName];
    [v23 setValue:v24 forProperty:@"FirstPhonetic"];

    v18 = *(void **)(a1 + 32);
    v19 = [v7 middleName];
    v20 = CNVCardKeyPhoneticMiddleName;
    goto LABEL_5;
  }
  if ([@"NICKNAME" isEqualToString:v5])
  {
    v25 = *(void **)(a1 + 32);
    uint64_t v26 = CNVCardKeyNickname;
LABEL_11:
    [v25 setValue:v6 forProperty:*v26];
    goto LABEL_8;
  }
  if ([@"TEL" isEqualToString:v5]
    || [@"TEL-AV" isEqualToString:v5])
  {
    v27 = *(void **)(a1 + 40);
LABEL_15:
    [v27 addObject:v6];
    goto LABEL_8;
  }
  if ([@"EMAIL" isEqualToString:v5])
  {
    v27 = *(void **)(a1 + 48);
    goto LABEL_15;
  }
  if ([@"ADR" isEqualToString:v5])
  {
    id v7 = [MEMORY[0x1E4F5A4B0] postalAddressFromString:v6 error:0];
    if (!v7) {
      goto LABEL_7;
    }
    v19 = [MEMORY[0x1E4F1CA60] dictionary];
    v28 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F5A2F8]];
    [v19 setObject:v28 forKeyedSubscript:@"street"];

    v29 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F5A2D0]];
    [v19 setObject:v29 forKeyedSubscript:@"city"];

    v30 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F5A2F0]];
    [v19 setObject:v30 forKeyedSubscript:@"state"];

    id v31 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F5A2E8]];
    [v19 setObject:v31 forKeyedSubscript:@"postalCode"];

    id v32 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F5A2D8]];
    [v19 setObject:v32 forKeyedSubscript:@"country"];

    [*(id *)(a1 + 56) addObject:v19];
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  if ([@"BDAY" isEqualToString:v5])
  {
    if ([v6 length] != 8) {
      goto LABEL_8;
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    id v33 = objc_msgSend(v6, "substringWithRange:", 0, 4);
    objc_msgSend(v7, "setYear:", objc_msgSend(v33, "integerValue"));

    id v34 = objc_msgSend(v6, "substringWithRange:", 4, 2);
    objc_msgSend(v7, "setMonth:", objc_msgSend(v34, "integerValue"));

    id v35 = objc_msgSend(v6, "substringWithRange:", 6, 2);
    objc_msgSend(v7, "setDay:", objc_msgSend(v35, "integerValue"));

    [*(id *)(a1 + 32) setValue:v7 forProperty:@"BirthdayComponents"];
    goto LABEL_7;
  }
  if ([@"URL" isEqualToString:v5])
  {
    v27 = *(void **)(a1 + 64);
    goto LABEL_15;
  }
  if ([@"NOTE" isEqualToString:v5])
  {
    v25 = *(void **)(a1 + 32);
    uint64_t v26 = CNVCardKeyNote;
    goto LABEL_11;
  }
  v36 = +[CNVCardLogging meCard];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 138543618;
    id v38 = v5;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_1DC18F000, v36, OS_LOG_TYPE_DEFAULT, "Unhandled tag: %{public}@ — %@", (uint8_t *)&v37, 0x16u);
  }

LABEL_8:
}

+ (void)enumerateTagsInString:(id)a3 usingBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, NSObject *, void *))a4;
  id v6 = [a3 substringFromIndex:7];
  id v7 = [v6 componentsSeparatedByString:@";"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    uint64_t v12 = *MEMORY[0x1E4F5A298];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (((*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v14) & 1) == 0)
        {
          uint64_t v15 = [v14 rangeOfString:@":"];
          if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v16 = +[CNVCardLogging meCard];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v14;
              _os_log_error_impl(&dword_1DC18F000, v16, OS_LOG_TYPE_ERROR, "Syntax error: no value separator in field: '%@'", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v17 = v15;
            id v16 = [v14 substringToIndex:v15];
            v18 = [v14 substringFromIndex:v17 + 1];
            v5[2](v5, v16, v18);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v10);
  }
}

@end