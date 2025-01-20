@interface VINSFWModelHandler
+ (BOOL)isSensitiveLabelScore:(id)a3 confidenceScore:(double)a4 classificationMode:(unint64_t)a5;
- (VINSFWModelHandler)initWithPreferredMetalDevice:(id)a3;
- (id)generateClassificationScoresForPixelBuffer:(__CVBuffer *)a3;
@end

@implementation VINSFWModelHandler

- (VINSFWModelHandler)initWithPreferredMetalDevice:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VINSFWModelHandler;
  v5 = [(VINSFWModelHandler *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F9A618]);
    if (v4)
    {
      uint64_t v17 = *MEMORY[0x1E4F9A680];
      v18[0] = v4;
      v7 = (void *)MEMORY[0x1E4F1C9E8];
      v8 = v18;
      v9 = &v17;
    }
    else
    {
      uint64_t v15 = *MEMORY[0x1E4F9A678];
      uint64_t v16 = MEMORY[0x1E4F1CC38];
      v7 = (void *)MEMORY[0x1E4F1C9E8];
      v8 = &v16;
      v9 = &v15;
    }
    v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];
    uint64_t v11 = [v6 initWithOptions:v10 error:0];
    scmlHandler = v5->_scmlHandler;
    v5->_scmlHandler = (SCMLHandler *)v11;
  }
  return v5;
}

- (id)generateClassificationScoresForPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(SCMLHandler *)self->_scmlHandler analyzePixelBuffer:a3 error:0];
  id v4 = [v3 scoresForLabels];

  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v5 setObject:v12 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = (void *)[v5 copy];
  return v13;
}

+ (BOOL)isSensitiveLabelScore:(id)a3 confidenceScore:(double)a4 classificationMode:(unint64_t)a5
{
  return [MEMORY[0x1E4F9A618] isImageSensitiveForLabel:a3 confidenceScore:a5 classificationMode:a4];
}

- (void).cxx_destruct
{
}

@end