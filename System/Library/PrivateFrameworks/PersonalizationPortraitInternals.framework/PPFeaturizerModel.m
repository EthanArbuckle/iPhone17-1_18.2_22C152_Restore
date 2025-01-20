@interface PPFeaturizerModel
- (PPFeaturizerModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation PPFeaturizerModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_param, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![(NSString *)self->_operation isEqualToString:@"seq-count"])
  {
    if ([(NSString *)self->_operation isEqualToString:@"arr-count"])
    {
      v19 = (void *)MEMORY[0x1E4F1E950];
      v11 = [v8 featureValueForName:self->_inputName];
      v20 = [v11 multiArrayValue];
      uint64_t v21 = [v20 count];
LABEL_8:
      uint64_t v22 = [v19 featureValueWithInt64:v21];
LABEL_9:
      v18 = (void *)v22;
LABEL_13:

      goto LABEL_14;
    }
    if ([(NSString *)self->_operation isEqualToString:@"dict-count"])
    {
      v23 = (void *)MEMORY[0x1E4F1E950];
      v11 = [v8 featureValueForName:self->_inputName];
      v20 = [v11 dictionaryValue];
      v24 = [v20 allValues];
      uint64_t v25 = objc_msgSend(v23, "featureValueWithInt64:", objc_msgSend(v24, "count"));
LABEL_12:
      v18 = (void *)v25;

      goto LABEL_13;
    }
    if ([(NSString *)self->_operation isEqualToString:@"string-length"])
    {
      v11 = [v8 featureValueForName:self->_inputName];
      if ([v11 type] == 3)
      {
        v19 = (void *)MEMORY[0x1E4F1E950];
        v20 = [v11 stringValue];
        uint64_t v21 = [v20 length];
        goto LABEL_8;
      }
      if ([v11 type] == 7)
      {
        v31 = [v11 sequenceValue];
        v32 = [v31 stringValues];
        v20 = objc_msgSend(v32, "_pas_mappedArrayWithTransform:", &__block_literal_global_26378);

        v33 = (void *)MEMORY[0x1E4F1E950];
        v24 = [MEMORY[0x1E4F1E9F0] sequenceWithInt64Array:v20];
        uint64_t v25 = [v33 featureValueWithSequence:v24];
        goto LABEL_12;
      }
LABEL_28:
      v18 = 0;
      goto LABEL_14;
    }
    if ([(NSString *)self->_operation isEqualToString:@"dictionary-values"])
    {
      v29 = [v8 featureValueForName:self->_inputName];
      v30 = [v29 dictionaryValue];
      v11 = [v30 allValues];

      if (v11)
      {
        v20 = +[PPCoreMLUtils multiArrayForArray:v11];
        if (!v20)
        {
          v18 = 0;
          goto LABEL_13;
        }
        uint64_t v22 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v20];
        goto LABEL_9;
      }
      goto LABEL_28;
    }
    if ([(NSString *)self->_operation isEqualToString:@"number-to-array"])
    {
      v34 = (void *)MEMORY[0x1CB79D060]();
      v35 = [v8 featureValueForName:self->_inputName];
      uint64_t v36 = [v35 type];
      v37 = NSNumber;
      if (v36 == 1)
      {
        objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v35, "int64Value"));
      }
      else
      {
        [v35 doubleValue];
        objc_msgSend(v37, "numberWithDouble:");
      v44 = };
      uint64_t v45 = +[PPCoreMLUtils multiArrayFeatureValueForNumber:v44];
LABEL_39:
      v18 = (void *)v45;

      goto LABEL_44;
    }
    if ([(NSString *)self->_operation isEqualToString:@"count-in-seq"])
    {
      v34 = (void *)MEMORY[0x1CB79D060]();
      v38 = [v8 featureValueForName:self->_inputName];
      v35 = [v38 sequenceValue];

      if ([v35 type] == 1)
      {
        v39 = [(NSArray *)self->_param firstObject];
        uint64_t v40 = [v39 integerValue];

        v41 = [v35 int64Values];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __58__PPFeaturizerModel_predictionFromFeatures_options_error___block_invoke_2;
        v57[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
        v57[4] = v40;
        v42 = objc_msgSend(v41, "_pas_filteredArrayWithTest:", v57);
        uint64_t v43 = [v42 count];
      }
      else
      {
        v49 = [v35 stringValues];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __58__PPFeaturizerModel_predictionFromFeatures_options_error___block_invoke_3;
        v56[3] = &unk_1E65DC168;
        v56[4] = self;
        v50 = objc_msgSend(v49, "_pas_filteredArrayWithTest:", v56);
        uint64_t v43 = [v50 count];
      }
      uint64_t v51 = [MEMORY[0x1E4F1E950] featureValueWithInt64:v43];
    }
    else
    {
      if ([(NSString *)self->_operation isEqualToString:@"count-unique"])
      {
        v34 = (void *)MEMORY[0x1CB79D060]();
        v46 = [v8 featureValueForName:self->_inputName];
        v35 = [v46 multiArrayValue];

        v44 = objc_opt_new();
        if ([v35 count] >= 1)
        {
          uint64_t v47 = 0;
          do
          {
            v48 = [v35 objectAtIndexedSubscript:v47];
            [v44 addObject:v48];

            ++v47;
          }
          while (v47 < [v35 count]);
        }
        uint64_t v45 = objc_msgSend(MEMORY[0x1E4F1E950], "featureValueWithInt64:", objc_msgSend(v44, "count"));
        goto LABEL_39;
      }
      if (![(NSString *)self->_operation isEqualToString:@"seq-to-array"]) {
        goto LABEL_45;
      }
      v34 = (void *)MEMORY[0x1CB79D060]();
      v53 = [v8 featureValueForName:self->_inputName];
      v54 = [v53 sequenceValue];
      v55 = [v54 int64Values];
      v35 = +[PPCoreMLUtils multiArrayForArray:v55];

      if (!v35)
      {
        v18 = 0;
LABEL_44:

        if (v18) {
          goto LABEL_15;
        }
        goto LABEL_45;
      }
      uint64_t v51 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v35];
    }
    v18 = (void *)v51;
    goto LABEL_44;
  }
  v10 = [v8 featureValueForName:self->_inputName];
  v11 = [v10 sequenceValue];

  v12 = (void *)MEMORY[0x1E4F1E950];
  v13 = [v11 int64Values];
  unint64_t v14 = [v13 count];

  v15 = [v11 stringValues];
  unint64_t v16 = [v15 count];

  if (v14 <= v16) {
    unint64_t v17 = v16;
  }
  else {
    unint64_t v17 = v14;
  }
  v18 = [v12 featureValueWithInt64:v17];
LABEL_14:

  if (v18)
  {
LABEL_15:
    id v26 = objc_alloc(MEMORY[0x1E4F1E930]);
    outputName = self->_outputName;
    v59[0] = v18;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&outputName count:1];
    v28 = (void *)[v26 initWithDictionary:v27 error:a5];

    goto LABEL_46;
  }
LABEL_45:
  v28 = 0;
LABEL_46:

  return v28;
}

BOOL __58__PPFeaturizerModel_predictionFromFeatures_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) == (int)[a2 intValue];
}

uint64_t __58__PPFeaturizerModel_predictionFromFeatures_options_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) containsObject:a2];
}

uint64_t __58__PPFeaturizerModel_predictionFromFeatures_options_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 length];
  return [v2 numberWithUnsignedInteger:v3];
}

- (PPFeaturizerModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PPFeaturizerModel;
  v7 = [(PPFeaturizerModel *)&v18 init];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"inputName"];
    inputName = v7->_inputName;
    v7->_inputName = (NSString *)v8;

    uint64_t v10 = [v6 objectForKeyedSubscript:@"outputName"];
    outputName = v7->_outputName;
    v7->_outputName = (NSString *)v10;

    uint64_t v12 = [v6 objectForKeyedSubscript:@"operation"];
    operation = v7->_operation;
    v7->_operation = (NSString *)v12;

    unint64_t v14 = [v6 objectForKeyedSubscript:@"customParam"];
    uint64_t v15 = [v14 componentsSeparatedByString:@"|"];
    param = v7->_param;
    v7->_param = (NSArray *)v15;
  }
  return v7;
}

@end