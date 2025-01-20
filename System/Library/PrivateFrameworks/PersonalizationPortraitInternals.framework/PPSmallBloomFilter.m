@interface PPSmallBloomFilter
- (PPSmallBloomFilter)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation PPSmallBloomFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_bloomFilter, 0);
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)PPSmallBloomFilter;
  [(PPSmallBloomFilter *)&v3 dealloc];
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = objc_opt_new();
  if ([v9 count] < 1)
  {
    id v13 = 0;
  }
  else
  {
    SEL v24 = a2;
    v25 = a5;
    uint64_t v12 = 0;
    id v13 = 0;
    do
    {
      v14 = v13;
      v15 = (void *)MEMORY[0x1CB79D060]();
      v16 = [v9 featuresAtIndex:v12];
      id v27 = v13;
      v17 = [(PPSmallBloomFilter *)self predictionFromFeatures:v16 options:v10 error:&v27];
      id v13 = v27;

      if (v17)
      {
        [v11 addObject:v17];
      }
      else
      {
        id v18 = objc_alloc(MEMORY[0x1E4F1E930]);
        id v26 = v13;
        v19 = (void *)[v18 initWithDictionary:MEMORY[0x1E4F1CC08] error:&v26];
        id v20 = v26;

        if (!v19)
        {
          v21 = [MEMORY[0x1E4F28B00] currentHandler];
          [v21 handleFailureInMethod:v24 object:self file:@"PPCoreMLUtils.m" lineNumber:242 description:@"Empty provider should not be null"];
        }
        objc_msgSend(v11, "addObject:", v19, v24);

        id v13 = v20;
      }

      ++v12;
    }
    while (v12 < [v9 count]);
    if (v25 && v13)
    {
      id v13 = v13;
      id *v25 = v13;
    }
  }
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1E910]) initWithFeatureProviderArray:v11];

  return v22;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend(a3, "featureValueForName:", self->_inputName, a4);
  v8 = [v7 stringValue];
  id v9 = [v8 localizedLowercaseString];

  if (v9)
  {
    pthread_mutex_lock(&self->_lock);
    id v10 = [(_PASBloomFilter *)self->_bloomFilter computeHashesForString:v9 reuse:0];
    uint64_t v11 = [(_PASBloomFilter *)self->_bloomFilter getWithHashes:v10];
    pthread_mutex_unlock(&self->_lock);
  }
  else
  {
    uint64_t v11 = 1;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1E930]);
  outputName = self->_outputName;
  id v13 = [NSNumber numberWithBool:v11];
  v19 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v15 = +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v14);
  v21[0] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&outputName count:1];
  v17 = (void *)[v12 initWithDictionary:v16 error:a5];

  return v17;
}

- (PPSmallBloomFilter)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PPSmallBloomFilter;
  v7 = [(PPSmallBloomFilter *)&v21 init];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"trial_namespace_name"];
    if (v8) {
      id v9 = (__CFString *)v8;
    }
    else {
      id v9 = @"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES";
    }
    id v10 = +[PPTrialWrapper sharedInstance];
    uint64_t v11 = [v6 objectForKeyedSubscript:@"path"];
    id v12 = [v10 filepathForFactor:v11 namespaceName:v9];

    if (!v12)
    {

      v19 = 0;
      goto LABEL_11;
    }
    if (!v7->_bloomFilter)
    {
      uint64_t v13 = [MEMORY[0x1E4F93AB0] bloomFilterWithPathToFile:v12];
      bloomFilter = v7->_bloomFilter;
      v7->_bloomFilter = (_PASBloomFilter *)v13;
    }
    pthread_mutex_init(&v7->_lock, 0);
    uint64_t v15 = [v6 objectForKeyedSubscript:@"inputName"];
    inputName = v7->_inputName;
    v7->_inputName = (NSString *)v15;

    uint64_t v17 = [v6 objectForKeyedSubscript:@"outputName"];
    outputName = v7->_outputName;
    v7->_outputName = (NSString *)v17;
  }
  v19 = v7;
LABEL_11:

  return v19;
}

@end