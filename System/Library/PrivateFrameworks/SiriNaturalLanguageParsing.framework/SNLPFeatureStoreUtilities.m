@interface SNLPFeatureStoreUtilities
+ (BOOL)_insertToFeatureStoreWithJSONString:(id)a3 interactionIdentifier:(id)a4 streamIdentifier:(id)a5;
+ (BOOL)_insertToFeatureStoreWithProtobufObject:(id)a3 interactionIdentifier:(id)a4 streamIdentifier:(id)a5;
+ (BOOL)insertToFeatureStoreWithITFMAssertVersion:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5;
+ (BOOL)insertToFeatureStoreWithITFMContextResponse:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5;
+ (BOOL)insertToFeatureStoreWithITFMExecutedHandcraftedRules:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5;
+ (BOOL)insertToFeatureStoreWithITFMSpanResponse:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5;
+ (BOOL)insertToFeatureStoreWithNLv4AssertVersion:(id)a3 interactionIdentifier:(id)a4;
+ (BOOL)insertToFeatureStoreWithNLv4ContextResponse:(id)a3 interactionIdentifier:(id)a4;
+ (BOOL)insertToFeatureStoreWithNLv4ExecutedHandcraftedRules:(id)a3 interactionIdentifier:(id)a4;
+ (BOOL)insertToFeatureStoreWithNLv4SpanResponse:(id)a3 interactionIdentifier:(id)a4;
+ (BOOL)insertToFeatureStoreWithSSUEncodingResult:(id)a3 interactionIdentifier:(id)a4;
+ (id)_jsonStringFromProtobufObject:(id)a3;
+ (unint64_t)itfmModelTypeForSNLPComponent:(const int *)a3;
@end

@implementation SNLPFeatureStoreUtilities

+ (unint64_t)itfmModelTypeForSNLPComponent:(const int *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t result = *(unsigned int *)a3;
  if (result != 1)
  {
    if (result == 4)
    {
      return 2;
    }
    else
    {
      id v5 = SNLPOSLoggerForCategory(0);
      uint64_t v6 = *a3;
      if (v6 >= 8)
      {
        v7 = SNLPOSLoggerForCategory(4);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v8 = 136315394;
          v9 = "<UNDEFINED_COMPONENT>";
          __int16 v10 = 2048;
          uint64_t v11 = v6;
          _os_log_impl(&dword_1C8DA9000, v7, OS_LOG_TYPE_ERROR, "[%s] The component %zu is invalid", (uint8_t *)&v8, 0x16u);
        }
      }
      return 0;
    }
  }
  return result;
}

+ (BOOL)_insertToFeatureStoreWithJSONString:(id)a3 interactionIdentifier:(id)a4 streamIdentifier:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[SNLPFeatureFlagUtilities isSNLPFeatureStoreEnabled])
  {
    __int16 v10 = SNLPOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_1C8DA9000, v10, OS_LOG_TYPE_DEBUG, "Inserting FeatureStore entry with interactionIdentifier=%@, streamIdentifier=%@", buf, 0x16u);
    }

    uint64_t v11 = [MEMORY[0x1E4F618B8] getWithStreamId:v9];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F618B0]) initWithJsonStr:v7 interactionId:v8 dataVersion:1];
    id v19 = 0;
    char v13 = [v11 insert:v12 error:&v19];
    id v14 = v19;
    if ((v13 & 1) == 0)
    {
      id v15 = SNLPOSLoggerForCategory(0);
      id v16 = (id)[v14 localizedDescription];
    }
  }
  else
  {
    id v17 = SNLPOSLoggerForCategory(0);
    char v13 = 0;
  }

  return v13;
}

+ (BOOL)_insertToFeatureStoreWithProtobufObject:(id)a3 interactionIdentifier:(id)a4 streamIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = [(id)objc_opt_class() _jsonStringFromProtobufObject:v7];
  char v11 = [(id)objc_opt_class() _insertToFeatureStoreWithJSONString:v10 interactionIdentifier:v8 streamIdentifier:v9];

  return v11;
}

+ (id)_jsonStringFromProtobufObject:(id)a3
{
  v3 = [a3 dictionaryRepresentation];
  id v10 = 0;
  v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:1 error:&v10];
  id v5 = v10;
  if (!v4)
  {
    id v6 = SNLPOSLoggerForCategory(0);
    id v7 = (id)[v5 localizedDescription];
  }
  id v8 = (void *)[[NSString alloc] initWithData:v4 encoding:4];

  return v8;
}

+ (BOOL)insertToFeatureStoreWithSSUEncodingResult:(id)a3 interactionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [(id)objc_opt_class() _insertToFeatureStoreWithProtobufObject:v5 interactionIdentifier:v6 streamIdentifier:@"SSUEncodingResultAsJSON"];

  return v7;
}

+ (BOOL)insertToFeatureStoreWithITFMExecutedHandcraftedRules:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[SNLPITFMModelInfo stringForModelType:a5];
  id v10 = [NSString stringWithFormat:@"%@-ITFMExecutedHandcraftedRulesAsJSON", v9];
  char v11 = [(id)objc_opt_class() _insertToFeatureStoreWithProtobufObject:v7 interactionIdentifier:v8 streamIdentifier:v10];

  return v11;
}

+ (BOOL)insertToFeatureStoreWithITFMAssertVersion:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[SNLPITFMModelInfo stringForModelType:a5];
  id v10 = [NSString stringWithFormat:@"%@-ITFMAssetVersionAsJSON", v9];
  char v11 = [(id)objc_opt_class() _insertToFeatureStoreWithProtobufObject:v7 interactionIdentifier:v8 streamIdentifier:v10];

  return v11;
}

+ (BOOL)insertToFeatureStoreWithITFMContextResponse:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[SNLPITFMModelInfo stringForModelType:a5];
  id v10 = [NSString stringWithFormat:@"%@-ITFMContextResponseAsJSON", v9];
  char v11 = [(id)objc_opt_class() _insertToFeatureStoreWithProtobufObject:v7 interactionIdentifier:v8 streamIdentifier:v10];

  return v11;
}

+ (BOOL)insertToFeatureStoreWithITFMSpanResponse:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[SNLPITFMModelInfo stringForModelType:a5];
  id v10 = [NSString stringWithFormat:@"%@-ITFMSpanResponseAsJSON", v9];
  char v11 = [(id)objc_opt_class() _insertToFeatureStoreWithProtobufObject:v7 interactionIdentifier:v8 streamIdentifier:v10];

  return v11;
}

+ (BOOL)insertToFeatureStoreWithNLv4ExecutedHandcraftedRules:(id)a3 interactionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [(id)objc_opt_class() _insertToFeatureStoreWithProtobufObject:v5 interactionIdentifier:v6 streamIdentifier:@"NLv4ExecutedHandcraftedRulesAsJSON"];

  return v7;
}

+ (BOOL)insertToFeatureStoreWithNLv4AssertVersion:(id)a3 interactionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [(id)objc_opt_class() _insertToFeatureStoreWithProtobufObject:v5 interactionIdentifier:v6 streamIdentifier:@"NLv4AssetVersionAsJSON"];

  return v7;
}

+ (BOOL)insertToFeatureStoreWithNLv4ContextResponse:(id)a3 interactionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [(id)objc_opt_class() _insertToFeatureStoreWithProtobufObject:v5 interactionIdentifier:v6 streamIdentifier:@"NLv4ContextResponseAsJSON"];

  return v7;
}

+ (BOOL)insertToFeatureStoreWithNLv4SpanResponse:(id)a3 interactionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [(id)objc_opt_class() _insertToFeatureStoreWithProtobufObject:v5 interactionIdentifier:v6 streamIdentifier:@"NLv4SpanResponseAsJSON"];

  return v7;
}

@end