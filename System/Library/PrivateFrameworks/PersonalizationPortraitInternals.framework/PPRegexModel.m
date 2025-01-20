@interface PPRegexModel
- (PPRegexModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation PPRegexModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v32 = mach_absolute_time();
  v10 = [v8 featureValueForName:self->_inputName];
  v11 = [v10 stringValue];

  if (v11)
  {
    regex = self->_regex;
    uint64_t v13 = [v11 length];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __53__PPRegexModel_predictionFromFeatures_options_error___block_invoke;
    v26[3] = &unk_1E65DC100;
    v29 = &v33;
    v30 = v31;
    id v27 = v11;
    v28 = self;
    -[NSRegularExpression enumerateMatchesInString:options:range:usingBlock:](regex, "enumerateMatchesInString:options:range:usingBlock:", v27, 1, 0, v13, v26);
    id v14 = objc_alloc(MEMORY[0x1E4F1E930]);
    outputName = self->_outputName;
    v15 = [NSNumber numberWithBool:*((unsigned __int8 *)v34 + 24)];
    v37 = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    v17 = +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v16);
    v39 = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&outputName count:1];
    v19 = (void *)[v14 initWithDictionary:v18 error:a5];

    v20 = v27;
  }
  else
  {
    *((unsigned char *)v34 + 24) = 1;
    id v21 = objc_alloc(MEMORY[0x1E4F1E930]);
    v41 = self->_outputName;
    v20 = [NSNumber numberWithBool:*((unsigned __int8 *)v34 + 24)];
    v40 = v20;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    v23 = +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v22);
    v42[0] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    v19 = (void *)[v21 initWithDictionary:v24 error:a5];
  }
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

void __53__PPRegexModel_predictionFromFeatures_options_error___block_invoke(void *a1, void *a2, char a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (v7)
  {
    id v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = a1[4];
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "Blocked (pattern): \"%@\"", (uint8_t *)&v13, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
LABEL_5:
    *a4 = 1;
    goto LABEL_11;
  }
  if ((a3 & 1) != 0 && (mach_absolute_time() - *(void *)(*(void *)(a1[7] + 8) + 24)) >> 5 >= 0xC35)
  {
    id v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      uint64_t v11 = *(void *)(a1[5] + 8);
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: aborting blocking regex \"%@\" due to long-running match against \"%@\".", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_5;
  }
LABEL_11:
}

- (PPRegexModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PPRegexModel;
  id v8 = [(PPRegexModel *)&v18 init];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28FD8]);
    uint64_t v10 = [v7 objectForKeyedSubscript:@"regex"];
    uint64_t v11 = [v9 initWithPattern:v10 options:1 error:a5];
    regex = v8->_regex;
    v8->_regex = (NSRegularExpression *)v11;

    uint64_t v13 = [v7 objectForKeyedSubscript:@"inputName"];
    inputName = v8->_inputName;
    v8->_inputName = (NSString *)v13;

    uint64_t v15 = [v7 objectForKeyedSubscript:@"outputName"];
    outputName = v8->_outputName;
    v8->_outputName = (NSString *)v15;
  }
  return v8;
}

@end