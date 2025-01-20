@interface PPCountVectorizer
- (PPCountVectorizer)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation PPCountVectorizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabulary, 0);
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 featureValueForName:self->_inputName];
  v11 = [v10 sequenceValue];

  id v12 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  v13 = (void *)MEMORY[0x1CB79D060]();
  v47[0] = &unk_1F256A3D0;
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_vocabulary, "count"));
  v47[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];

  v16 = (void *)[v12 initWithShape:v15 dataType:65568 error:a5];

  if (v16)
  {
    v35 = a5;
    v36 = v11;
    id v37 = v9;
    id v38 = v8;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v17 = [v11 stringValues];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1CB79D060]();
          vocabulary = self->_vocabulary;
          v25 = [v22 lowercaseString];
          v26 = [(NSMutableDictionary *)vocabulary objectForKeyedSubscript:v25];

          if (v26)
          {
            v27 = NSNumber;
            v28 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v26, "unsignedIntegerValue"));
            v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "unsignedIntegerValue") + 1);
            objc_msgSend(v16, "setObject:atIndexedSubscript:", v29, objc_msgSend(v26, "unsignedIntegerValue"));
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v19);
    }

    id v30 = objc_alloc(MEMORY[0x1E4F1E930]);
    v31 = (void *)MEMORY[0x1CB79D060]();
    outputName = self->_outputName;
    v45 = v16;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&outputName count:1];
    v33 = (void *)[v30 initWithDictionary:v32 error:v35];
    id v9 = v37;
    id v8 = v38;
    v11 = v36;
  }
  else
  {
    v32 = pp_default_log_handle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_ERROR, "PPCoreMLUtils: unable to construct multiarray", buf, 2u);
    }
    v33 = 0;
  }

  return v33;
}

- (PPCountVectorizer)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PPCountVectorizer;
  id v9 = [(PPCountVectorizer *)&v24 init];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"inputName"];
    inputName = v9->_inputName;
    v9->_inputName = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:@"outputName"];
    outputName = v9->_outputName;
    v9->_outputName = (NSString *)v12;

    v14 = [v8 objectForKeyedSubscript:@"vocabulary"];
    v15 = [v14 componentsSeparatedByString:@";"];

    uint64_t v16 = objc_opt_new();
    vocabulary = v9->_vocabulary;
    v9->_vocabulary = (NSMutableDictionary *)v16;

    if ([v15 count])
    {
      unint64_t v18 = 0;
      do
      {
        uint64_t v19 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v20 = [NSNumber numberWithUnsignedInteger:v18];
        v21 = v9->_vocabulary;
        v22 = [v15 objectAtIndexedSubscript:v18];
        [(NSMutableDictionary *)v21 setObject:v20 forKeyedSubscript:v22];

        ++v18;
      }
      while (v18 < [v15 count]);
    }
  }
  return v9;
}

@end