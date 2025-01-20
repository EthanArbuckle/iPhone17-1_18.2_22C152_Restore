@interface NLPLearnerEmojiClassificationData
+ (void)initialize;
- (BOOL)addExamples:(id)a3;
- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4;
- (NLPLearnerEmojiClassificationData)initWithLocale:(id)a3;
- (NSDictionary)labelClasses;
- (id).cxx_construct;
- (id)nextEvaluationDataPoint;
- (id)nextTrainingDataBatch:(unint64_t)a3;
- (unint64_t)embeddingDimension;
- (unint64_t)numOutputClasses;
- (void)addResource:(id)a3;
- (void)sampleNoneClassExample:(id)a3;
@end

@implementation NLPLearnerEmojiClassificationData

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog = (uint64_t)os_log_create("com.apple.NLP", "NLPLearnerEmojiClassificationData");
    MEMORY[0x270F9A758]();
  }
}

- (NLPLearnerEmojiClassificationData)initWithLocale:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NLPLearnerEmojiClassificationData;
  v5 = [(NLPLearnerTextData *)&v17 initWithLocale:v4];
  if (!v5) {
    goto LABEL_4;
  }
  -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", [(id)objc_opt_class() defaultMaxSequenceLength]);
  v19[0] = *MEMORY[0x263F36850];
  v6 = [(NLPLearnerTextData *)v5 locale];
  v19[1] = *MEMORY[0x263F36858];
  v20[0] = v6;
  v20[1] = *MEMORY[0x263F36860];
  v7 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  v8 = (const void *)NLStringEmbeddingCreateWithOptions();
  nlp::CFScopedPtr<void *>::reset((const void **)&v5->_embedding.m_ref, v8);
  if (v5->_embedding.m_ref)
  {
    v5->_embeddingDimension = NLStringEmbeddingGetDimension();
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    labels = v5->_labels;
    v5->_labels = v9;

    noneClassProbability = v5->_noneClassProbability;
    v5->_noneClassProbability = (NSNumber *)&unk_26E74D6D8;

LABEL_4:
    v12 = v5;
    goto LABEL_8;
  }
  v13 = (id)sLog;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = [(NLPLearnerTextData *)v5 locale];
    v15 = [v14 languageCode];
    -[NLPLearnerEmojiClassificationData initWithLocale:](v15, buf, v13, v14);
  }

  v12 = 0;
LABEL_8:

  return v12;
}

- (void)sampleNoneClassExample:(id)a3
{
  id v12 = a3;
  if ([v12 count])
  {
    uint32_t v4 = arc4random_uniform(0x64u);
    [(NSNumber *)self->_noneClassProbability floatValue];
    if ((float)(v5 * 100.0) > (float)v4)
    {
      labels = self->_labels;
      v7 = [NSNumber numberWithInt:0];
      [(NSMutableArray *)labels addObject:v7];

      LODWORD(v7) = [v12 count];
      if (v7 >= [(NLPLearnerTextData *)self maxSequenceLength]) {
        uint32_t v8 = [(NLPLearnerTextData *)self maxSequenceLength];
      }
      else {
        uint32_t v8 = [v12 count];
      }
      uint32_t v9 = arc4random_uniform(v8);
      v10 = [(NLPLearnerTextData *)self sentences];
      v11 = objc_msgSend(v12, "subarrayWithRange:", 0, (int)(v9 + 1));
      [v10 addObject:v11];
    }
  }
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  id v6 = a3;
  labelClasses = self->_labelClasses;
  if (labelClasses)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    char v17 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    char v15 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy_;
    v12[4] = __Block_byref_object_dispose_;
    id v13 = [MEMORY[0x263EFF980] array];
    uint32_t v8 = [(NLPLearnerTextData *)self locale];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__NLPLearnerEmojiClassificationData_loadFromCoreDuet_limitSamplesTo___block_invoke;
    v11[3] = &unk_264BEE978;
    v11[4] = self;
    v11[5] = v14;
    v11[6] = v12;
    v11[7] = v16;
    v10.receiver = self;
    v10.super_class = (Class)NLPLearnerEmojiClassificationData;
    [(NLPLearnerTextData *)&v10 loadFromCoreDuet:v6 limitSamplesTo:a4 withLocale:v8 andLMStreamTokenizationBlock:v11];

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }

  return labelClasses != 0;
}

void __69__NLPLearnerEmojiClassificationData_loadFromCoreDuet_limitSamplesTo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4 == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else if (a4 == 1)
  {
    if ([*(id *)(a1 + 32) processingNewRecord])
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        [*(id *)(a1 + 32) sampleNoneClassExample:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
      float v5 = *(void **)(a1 + 32);
      [v5 setProcessingNewRecord:0];
    }
  }
  else
  {
    id v6 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
    id v14 = [v6 lowercaseString];

    if (CEMStringContainsEmoji())
    {
      v7 = [*(id *)(*(void *)(a1 + 32) + 56) valueForKey:v14];
      if (v7 && [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        [*(id *)(*(void *)(a1 + 32) + 48) addObject:v7];
        unint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
        unint64_t v9 = [*(id *)(a1 + 32) maxSequenceLength];
        objc_super v10 = *(void **)(a1 + 32);
        if (v8 <= v9)
        {
          v11 = [v10 sentences];
          id v12 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
          [v11 addObject:v12];
        }
        else
        {
          v11 = [v10 sentences];
          id v12 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "subarrayWithRange:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count")- objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength"), objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength"));
          id v13 = (void *)[v12 copy];
          [v11 addObject:v13];
        }
      }
    }
    else
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          [*(id *)(a1 + 32) sampleNoneClassExample:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        }
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v14];
    }
  }
}

- (id)nextTrainingDataBatch:(unint64_t)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  unint64_t v5 = [(NLPLearnerTextData *)self iterator] + a3;
  if (v5 <= [(NLPLearnerTextData *)self numSamples])
  {
    v7 = [(NLPLearnerTextData *)self sentences];
    unint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", -[NLPLearnerTextData iterator](self, "iterator"), a3);

    size_t v9 = 4 * a3 * [(NLPLearnerTextData *)self maxSequenceLength] * self->_embeddingDimension;
    objc_super v10 = malloc_type_malloc(v9, 0xCABCD16BuLL);
    unint64_t embeddingDimension = self->_embeddingDimension;
    int v17 = 0;
    std::vector<float>::vector(__p, embeddingDimension, &v17);
    [(NLPLearnerTextData *)self maxSequenceLength];
    NLStringEmbeddingFillWordVectors();
    id v12 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v10 length:v9 freeWhenDone:1];
    uint64_t v13 = *MEMORY[0x263F565D8];
    v20[0] = v12;
    uint64_t v14 = *MEMORY[0x263F565E0];
    v19[0] = v13;
    v19[1] = v14;
    char v15 = -[NSMutableArray subarrayWithRange:](self->_labels, "subarrayWithRange:", [(NLPLearnerTextData *)self iterator], a3);
    v20[1] = v15;
    id v6 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

    [(NLPLearnerTextData *)self setIterator:[(NLPLearnerTextData *)self iterator] + a3];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)nextEvaluationDataPoint
{
  v22[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NLPLearnerTextData *)self iterator];
  if (v3 >= [(NLPLearnerTextData *)self numSamples])
  {
    char v15 = 0;
  }
  else
  {
    uint32_t v4 = [(NLPLearnerTextData *)self sentences];
    unint64_t v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[NLPLearnerTextData iterator](self, "iterator"));
    v22[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];

    size_t v7 = 4 * [(NLPLearnerTextData *)self maxSequenceLength] * self->_embeddingDimension;
    unint64_t v8 = malloc_type_malloc(v7, 0x6BAACAC8uLL);
    unint64_t embeddingDimension = self->_embeddingDimension;
    int v17 = 0;
    std::vector<float>::vector(__p, embeddingDimension, &v17);
    [(NLPLearnerTextData *)self maxSequenceLength];
    NLStringEmbeddingFillWordVectors();
    objc_super v10 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v8 length:v7 freeWhenDone:1];
    uint64_t v11 = *MEMORY[0x263F56630];
    v21[0] = v10;
    uint64_t v12 = *MEMORY[0x263F56638];
    v20[0] = v11;
    v20[1] = v12;
    uint64_t v13 = [(NSMutableArray *)self->_labels objectAtIndexedSubscript:[(NLPLearnerTextData *)self iterator]];
    v19 = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    v21[1] = v14;
    char v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

    [(NLPLearnerTextData *)self setIterator:[(NLPLearnerTextData *)self iterator] + 1];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  return v15;
}

- (unint64_t)numOutputClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  unint64_t v3 = [(NSDictionary *)self->_labelClasses allValues];
  uint32_t v4 = [v2 setWithArray:v3];
  unint64_t v5 = [v4 count];

  return v5;
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [NSDictionary dictionaryWithContentsOfFile:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_labelClasses = &self->_labelClasses;
    objc_storeStrong((id *)&self->_labelClasses, v5);
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    unint64_t v39 = 0;
    unint64_t v39 = [(NLPLearnerEmojiClassificationData *)self numOutputClasses];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 1;
    labelClasses = self->_labelClasses;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __49__NLPLearnerEmojiClassificationData_addResource___block_invoke;
    v33[3] = &unk_264BEE9A0;
    v33[4] = self;
    v33[5] = v38;
    v33[6] = &v34;
    [(NSDictionary *)labelClasses enumerateKeysAndObjectsUsingBlock:v33];
    if (*((unsigned char *)v35 + 24))
    {
      [(NSNumber *)self->_noneClassProbability floatValue];
      if (v8 > 0.0)
      {
        size_t v9 = *p_labelClasses;
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __49__NLPLearnerEmojiClassificationData_addResource___block_invoke_15;
        v32[3] = &unk_264BEE9C8;
        v32[4] = &v34;
        [(NSDictionary *)v9 enumerateKeysAndObjectsUsingBlock:v32];
      }
      if (*((unsigned char *)v35 + 24)) {
        goto LABEL_13;
      }
      objc_super v10 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
        -[NLPLearnerEmojiClassificationData addResource:]((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      v24 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
        -[NLPLearnerEmojiClassificationData addResource:]((uint64_t)v4, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    v31 = *p_labelClasses;
    *p_labelClasses = 0;

LABEL_13:
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(v38, 8);
    goto LABEL_14;
  }
  int v17 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
    -[NLPLearnerEmojiClassificationData addResource:]((uint64_t)v4, v17, v18, v19, v20, v21, v22, v23);
  }
LABEL_14:
}

void __49__NLPLearnerEmojiClassificationData_addResource___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v10 isEqualToString:@"NONE"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v7 floatValue], v8 >= 0.0)
    && ([v7 floatValue], v9 <= 1.0))
  {
    objc_storeStrong((id *)(a1[4] + 64), a3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !CEMStringContainsEmoji()
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || [v7 integerValue] < 0
      || (unint64_t)[v7 integerValue] >= *(void *)(*(void *)(a1[5] + 8) + 24))
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

void __49__NLPLearnerEmojiClassificationData_addResource___block_invoke_15(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (CEMStringContainsEmoji() && ![v7 integerValue])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (unint64_t)embeddingDimension
{
  return self->_embeddingDimension;
}

- (NSDictionary)labelClasses
{
  return self->_labelClasses;
}

- (void).cxx_destruct
{
  nlp::CFScopedPtr<void *>::reset((const void **)&self->_embedding.m_ref, 0);
  objc_storeStrong((id *)&self->_noneClassProbability, 0);
  objc_storeStrong((id *)&self->_labelClasses, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  return self;
}

- (BOOL)addExamples:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        float v9 = [v8 objectForKeyedSubscript:@"sentence"];
        id v10 = [v9 componentsSeparatedByString:@" "];

        unint64_t v5 = v10;
        unint64_t v11 = [v10 count];
        if (v11 <= [(NLPLearnerTextData *)self maxSequenceLength])
        {
          uint64_t v12 = NSNumber;
          uint64_t v13 = [v8 objectForKeyedSubscript:@"label"];
          uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "unsignedIntegerValue") - 1);

          uint64_t v15 = [(NSDictionary *)self->_labelClasses allValues];
          LODWORD(v12) = [v15 containsObject:v14];

          if (v12)
          {
            [(NSMutableArray *)self->_labels addObject:v14];
            uint64_t v16 = [(NLPLearnerTextData *)self sentences];
            [v16 addObject:v5];
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }
  return 1;
}

- (void)initWithLocale:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_234530000, log, OS_LOG_TYPE_ERROR, "Failed to load '%@' word embeddings", buf, 0xCu);
}

- (void)addResource:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addResource:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addResource:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end