@interface CNVCardActivityAlertSerializer
+ (id)serializeDictionary:(id)a3;
+ (id)serializeString:(id)a3;
@end

@implementation CNVCardActivityAlertSerializer

+ (id)serializeDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v19 = [MEMORY[0x1E4F28E78] string];
  v4 = [v3 allKeys];
  v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_3];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    uint64_t v10 = *MEMORY[0x1E4F5A298];
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v3 objectForKey:v12];
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 16))(v10, v12) & 1) == 0
          && ((*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v13) & 1) == 0)
        {
          if ([v19 length]) {
            [v19 appendString:@","];
          }
          v14 = [a1 serializeString:v12];
          [v19 appendString:v14];

          [v19 appendString:@"="];
          v15 = [a1 serializeString:v13];
          [v19 appendString:v15];

          uint64_t v9 = v17;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v19;
}

+ (id)serializeString:(id)a3
{
  id v3 = a3;
  if (+[CNVCardActivityAlertQuotingSerializationStrategy strategyWouldAlterString:v3])
  {
    v4 = CNVCardActivityAlertQuotingSerializationStrategy;
LABEL_5:
    id v5 = [(__objc2_class *)v4 serializeString:v3];
    goto LABEL_7;
  }
  if (+[CNVCardActivityAlertEscapingSerializationStrategy strategyWouldAlterString:v3])
  {
    v4 = CNVCardActivityAlertEscapingSerializationStrategy;
    goto LABEL_5;
  }
  id v5 = v3;
LABEL_7:
  id v6 = v5;

  return v6;
}

@end