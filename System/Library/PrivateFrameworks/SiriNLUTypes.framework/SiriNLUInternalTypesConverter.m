@interface SiriNLUInternalTypesConverter
+ (id)convertToSubwordEmbeddingResponse:(id)a3;
@end

@implementation SiriNLUInternalTypesConverter

+ (id)convertToSubwordEmbeddingResponse:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse);
    v5 = [v3 subwordTokenChain];
    [(SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse *)v4 setSubwordTokenChain:v5];

    v6 = [v3 subwordEmbeddingTensorOutputs];
    v7 = [v6 firstObject];
    [(SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse *)v4 setSubwordTokenEmbedding:v7];
  }
  else
  {
    v8 = loggerContext(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      v11 = "+[SiriNLUInternalTypesConverter convertToSubwordEmbeddingResponse:]";
      _os_log_impl(&dword_1C8881000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: Input EmbeddingResponse to convertToSubwordEmbeddingResponse function is nil, and therefore returning nil", (uint8_t *)&v10, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

@end