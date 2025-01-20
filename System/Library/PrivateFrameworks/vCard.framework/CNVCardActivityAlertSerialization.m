@interface CNVCardActivityAlertSerialization
+ (id)activityAlertWithString:(id)a3;
+ (id)dictionaryWithType:(id)a3 info:(id)a4;
+ (id)infoFromDictionary:(id)a3;
+ (id)stringWithType:(id)a3 info:(id)a4;
+ (id)typeFromDictionary:(id)a3;
+ (void)parseString:(id)a3 intoTypeAndInfo:(id)a4;
@end

@implementation CNVCardActivityAlertSerialization

+ (id)stringWithType:(id)a3 info:(id)a4
{
  v4 = [a1 dictionaryWithType:a3 info:a4];
  v5 = +[CNVCardActivityAlertSerializer serializeDictionary:v4];

  return v5;
}

+ (id)dictionaryWithType:(id)a3 info:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 dictionary];
  v9 = sAPITypeToSerializedType_block_invoke_3((uint64_t)v8, v7);

  objc_msgSend(v8, "_cn_setNonNilObject:forKey:", v9, @"type");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__CNVCardActivityAlertSerialization_dictionaryWithType_info___block_invoke;
  v12[3] = &unk_1E6C2D030;
  id v10 = v8;
  id v13 = v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  return v10;
}

void __61__CNVCardActivityAlertSerialization_dictionaryWithType_info___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  sAPIKeyToSerializedKey_block_invoke((uint64_t)v5, a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKey:v6];
}

+ (void)parseString:(id)a3 intoTypeAndInfo:(id)a4
{
  id v6 = (void (**)(id, void *, void *))a4;
  id v9 = [a1 activityAlertWithString:a3];
  id v7 = [a1 typeFromDictionary:v9];
  v8 = [a1 infoFromDictionary:v9];
  v6[2](v6, v7, v8);
}

+ (id)activityAlertWithString:(id)a3
{
  return +[CNVCardActivityAlertScanner scanAlertValueFromString:a3];
}

+ (id)typeFromDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"type"];
  v4 = sSerializedTypeToAPIType_block_invoke_4((uint64_t)v3, v3);

  return v4;
}

+ (id)infoFromDictionary:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CNVCardActivityAlertSerialization_infoFromDictionary___block_invoke;
  v8[3] = &unk_1E6C2D030;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __56__CNVCardActivityAlertSerialization_infoFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v8, "_cn_caseInsensitiveIsEqual:", @"type");
  if ((v6 & 1) == 0)
  {
    id v7 = sSerializedKeyToAPIKey_block_invoke_2(v6, v8);
    [*(id *)(a1 + 32) setObject:v5 forKey:v7];
  }
}

@end