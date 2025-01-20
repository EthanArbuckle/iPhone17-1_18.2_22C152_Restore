@interface PPSanitizedStringFilter
- (PPSanitizedStringFilter)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation PPSanitizedStringFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  context = (void *)MEMORY[0x1CB79D060]();
  v10 = [v8 featureValueForName:self->_inputName];
  v11 = [v10 stringValue];

  if (v11)
  {
    v29 = a5;
    id v12 = v9;
    v13 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
    uint64_t v14 = [v11 rangeOfCharacterFromSet:v13];

    v15 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789.,"];
    v16 = [v15 invertedSet];

    uint64_t v17 = [v11 rangeOfCharacterFromSet:v16];
    if (v14) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = v17 == 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v19 = v18;
    id v20 = objc_alloc(MEMORY[0x1E4F1E930]);
    outputName = self->_outputName;
    v21 = [NSNumber numberWithInt:v19];
    v33 = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    v23 = +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v22);
    v35 = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&outputName count:1];
    id v31 = 0;
    v25 = (void *)[v20 initWithDictionary:v24 error:&v31];
    id v26 = v31;

    id v9 = v12;
    a5 = v29;
  }
  else
  {
    id v27 = objc_alloc(MEMORY[0x1E4F1E930]);
    v37 = self->_outputName;
    v16 = [NSNumber numberWithInt:1];
    v36 = v16;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    v22 = +[PPCoreMLUtils _multiArrayForNumberArray:]((uint64_t)PPCoreMLUtils, v21);
    v38[0] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v32 = 0;
    v25 = (void *)[v27 initWithDictionary:v23 error:&v32];
    id v26 = v32;
  }

  if (a5) {
    *a5 = v26;
  }

  return v25;
}

- (PPSanitizedStringFilter)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PPSanitizedStringFilter;
  v7 = [(PPSanitizedStringFilter *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"inputName"];
    inputName = v7->_inputName;
    v7->_inputName = (NSString *)v8;

    uint64_t v10 = [v6 objectForKeyedSubscript:@"outputName"];
    outputName = v7->_outputName;
    v7->_outputName = (NSString *)v10;
  }
  return v7;
}

@end