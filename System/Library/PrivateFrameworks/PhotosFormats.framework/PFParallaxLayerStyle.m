@interface PFParallaxLayerStyle
+ (BOOL)isSegmentedStyle:(id)a3;
+ (BOOL)styleKind:(id)a3 supportsParameter:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateParameterKey:(id)a3 value:(id)a4 error:(id *)a5;
+ (BOOL)validateParameters:(id)a3 error:(id *)a4;
+ (PFParallaxLayerStyle)styleWithDictionary:(id)a3 error:(id *)a4;
+ (id)deserializeColorSuggestions:(id)a3 error:(id *)a4;
+ (id)deserializeParameter:(id)a3 forKey:(id)a4 error:(id *)a5;
+ (id)deserializeParameters:(id)a3 error:(id *)a4;
+ (id)dictionaryWithStyle:(id)a3;
+ (id)serializeColorSuggestions:(id)a3;
+ (id)serializeParameter:(id)a3 forKey:(id)a4;
+ (id)serializeParameters:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToParallaxLayerStyle:(id)a3;
- (NSArray)colorSuggestions;
- (NSDictionary)parameters;
- (NSString)kind;
- (PFParallaxLayerStyle)initWithCoder:(id)a3;
- (PFParallaxLayerStyle)initWithKind:(id)a3 parameters:(id)a4 colorSuggestions:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PFParallaxLayerStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSuggestions, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_kind, 0);
}

- (NSArray)colorSuggestions
{
  return self->_colorSuggestions;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSString)kind
{
  return self->_kind;
}

- (PFParallaxLayerStyle)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:3];
  v9 = objc_msgSend(v7, "setWithArray:", v8, v14, v15);
  v10 = [v4 decodeDictionaryWithKeysOfClasses:v6 objectsOfClasses:v9 forKey:@"parameters"];

  v11 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"colorSuggestions"];

  v12 = [(PFParallaxLayerStyle *)self initWithKind:v5 parameters:v10 colorSuggestions:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PFParallaxLayerStyle *)self kind];
  [v4 encodeObject:v5 forKey:@"kind"];

  v6 = [(PFParallaxLayerStyle *)self parameters];
  [v4 encodeObject:v6 forKey:@"parameters"];

  id v7 = [(PFParallaxLayerStyle *)self colorSuggestions];
  [v4 encodeObject:v7 forKey:@"colorSuggestions"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PFParallaxLayerStyle *)self kind];
  v6 = [(PFParallaxLayerStyle *)self parameters];
  id v7 = [(PFParallaxLayerStyle *)self colorSuggestions];
  v8 = [v3 stringWithFormat:@"<%@: %p, kind: %@, parameters: %@, color suggestions: %@", v4, self, v5, v6, v7];

  return v8;
}

- (BOOL)isEqualToParallaxLayerStyle:(id)a3
{
  id v4 = a3;
  v5 = [(PFParallaxLayerStyle *)self kind];
  v6 = [v4 kind];
  int v7 = [v5 isEqualToString:v6];

  if (v7
    && ([(PFParallaxLayerStyle *)self parameters],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 parameters],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqualToDictionary:v9],
        v9,
        v8,
        v10))
  {
    v11 = [(PFParallaxLayerStyle *)self colorSuggestions];
    v12 = [v4 colorSuggestions];
    char v13 = [v11 isEqualToArray:v12];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PFParallaxLayerStyle *)self isEqualToParallaxLayerStyle:v4];

  return v5;
}

- (PFParallaxLayerStyle)initWithKind:(id)a3 parameters:(id)a4 colorSuggestions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v21 = 0;
  +[PFParallaxLayerStyle validateParameters:v9 error:&v21];
  id v11 = v21;
  v20.receiver = self;
  v20.super_class = (Class)PFParallaxLayerStyle;
  v12 = [(PFParallaxLayerStyle *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    kind = v12->_kind;
    v12->_kind = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    parameters = v12->_parameters;
    v12->_parameters = (NSDictionary *)v15;

    uint64_t v17 = [v10 copy];
    colorSuggestions = v12->_colorSuggestions;
    v12->_colorSuggestions = (NSArray *)v17;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)validateParameterKey:(id)a3 value:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (validateParameterKey_value_error__onceToken != -1) {
    dispatch_once(&validateParameterKey_value_error__onceToken, &__block_literal_global_123_8796);
  }
  uint64_t v9 = [(id)validateParameterKey_value_error__parameterValidationMap objectForKeyedSubscript:v7];
  id v10 = (void *)v9;
  if (!v9)
  {
    if (!a5)
    {
LABEL_10:
      BOOL v12 = 0;
      goto LABEL_11;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    uint64_t v14 = [NSString stringWithFormat:@"Unknown parameter key: %@", v7];
    v23[0] = v14;
    uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = (void **)v23;
    uint64_t v17 = &v22;
LABEL_9:
    v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    *a5 = [v13 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v18];

    goto LABEL_10;
  }
  char v11 = (*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v8);
  BOOL v12 = v11;
  if (a5 && (v11 & 1) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    uint64_t v14 = [NSString stringWithFormat:@"Invalid parameter for key: %@, value: %@", v7, v8];
    id v21 = v14;
    uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = &v21;
    uint64_t v17 = &v20;
    goto LABEL_9;
  }
LABEL_11:

  return v12;
}

void __57__PFParallaxLayerStyle_validateParameterKey_value_error___block_invoke()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v2[0] = @"mode";
  v2[1] = @"color";
  v3[0] = &__block_literal_global_120;
  v3[1] = &__block_literal_global_116;
  v2[2] = @"primaryColor";
  v2[3] = @"secondaryColor";
  v3[2] = &__block_literal_global_116;
  v3[3] = &__block_literal_global_116;
  v2[4] = @"clockFont";
  v2[5] = @"clockColor";
  v3[4] = &__block_literal_global_118;
  v3[5] = &__block_literal_global_116;
  v2[6] = @"clockVibrancy";
  v2[7] = @"lowKey";
  v3[6] = &__block_literal_global_120;
  v3[7] = &__block_literal_global_120;
  v2[8] = @"highKey";
  v2[9] = @"background";
  v3[8] = &__block_literal_global_120;
  v3[9] = &__block_literal_global_120;
  v2[10] = @"headroomLook";
  v3[10] = &__block_literal_global_120;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:11];
  v1 = (void *)validateParameterKey_value_error__parameterValidationMap;
  validateParameterKey_value_error__parameterValidationMap = v0;
}

+ (BOOL)validateParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__8807;
  uint64_t v15 = __Block_byref_object_dispose__8808;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PFParallaxLayerStyle_validateParameters_error___block_invoke;
  v10[3] = &unk_1E5B2EAC8;
  v10[5] = &v11;
  v10[6] = a1;
  v10[4] = &v17;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  int v7 = *((unsigned __int8 *)v18 + 24);
  if (a4 && !*((unsigned char *)v18 + 24))
  {
    *a4 = (id) v12[5];
    int v7 = *((unsigned __int8 *)v18 + 24);
  }
  BOOL v8 = v7 != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __49__PFParallaxLayerStyle_validateParameters_error___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)a1[6];
  id v10 = 0;
  char v7 = [v6 validateParameterKey:a2 value:a3 error:&v10];
  id v8 = v10;
  id v9 = v10;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = v7;
  if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v8);
  }
}

+ (id)deserializeColorSuggestions:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v16 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v24 = *MEMORY[0x1E4F28228];
            uint64_t v17 = [NSString stringWithFormat:@"Invalid color suggestion value: %@", v12];
            v25 = v17;
            v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
            *a4 = [v16 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v18];
          }
LABEL_13:

          id v15 = 0;
          goto LABEL_14;
        }
        uint64_t v13 = +[PFParallaxPaletteSuggestion paletteSuggestionWithDictionary:v12 error:a4];
        if (!v13) {
          goto LABEL_13;
        }
        uint64_t v14 = (void *)v13;
        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = v6;
LABEL_14:

  return v15;
}

+ (id)deserializeParameter:(id)a3 forKey:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (deserializeParameter_forKey_error__onceToken != -1) {
    dispatch_once(&deserializeParameter_forKey_error__onceToken, &__block_literal_global_105);
  }
  uint64_t v9 = [(id)deserializeParameter_forKey_error__parameterDeserializationMap objectForKeyedSubscript:v8];
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id, id *))(v9 + 16))(v9, v7, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = [NSString stringWithFormat:@"Unknown parameter key: %@", v8, *MEMORY[0x1E4F28228]];
    v16[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a5 = [v11 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v13];

    a5 = 0;
  }

  return a5;
}

void __58__PFParallaxLayerStyle_deserializeParameter_forKey_error___block_invoke()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v2[0] = @"mode";
  v2[1] = @"color";
  v3[0] = &__block_literal_global_103;
  v3[1] = &__block_literal_global_97_8814;
  v2[2] = @"primaryColor";
  v2[3] = @"secondaryColor";
  v3[2] = &__block_literal_global_97_8814;
  v3[3] = &__block_literal_global_97_8814;
  v2[4] = @"clockFont";
  v2[5] = @"clockColor";
  v3[4] = &__block_literal_global_103;
  v3[5] = &__block_literal_global_97_8814;
  v2[6] = @"clockVibrancy";
  v2[7] = @"lowKey";
  v3[6] = &__block_literal_global_103;
  v3[7] = &__block_literal_global_103;
  v2[8] = @"highKey";
  v2[9] = @"background";
  v3[8] = &__block_literal_global_103;
  v3[9] = &__block_literal_global_103;
  v2[10] = @"headroomLook";
  v3[10] = &__block_literal_global_103;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:11];
  v1 = (void *)deserializeParameter_forKey_error__parameterDeserializationMap;
  deserializeParameter_forKey_error__parameterDeserializationMap = v0;
}

+ (id)deserializeParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__8807;
  long long v20 = __Block_byref_object_dispose__8808;
  id v21 = 0;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__PFParallaxLayerStyle_deserializeParameters_error___block_invoke;
  v12[3] = &unk_1E5B2EA80;
  id v15 = a1;
  id v8 = v7;
  id v13 = v8;
  uint64_t v14 = &v16;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v9 = (void *)v17[5];
  if (v9)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    id v10 = v8;
  }

  _Block_object_dispose(&v16, 8);

  return v10;
}

void __52__PFParallaxLayerStyle_deserializeParameters_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 48);
  id v12 = 0;
  uint64_t v9 = [v8 deserializeParameter:a3 forKey:v7 error:&v12];
  id v10 = v12;
  id v11 = v12;
  if (v9)
  {
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
    *a4 = 1;
  }
}

+ (PFParallaxLayerStyle)styleWithDictionary:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"kind"];
  if (!v7)
  {
    if (a4)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28228];
      uint64_t v10 = [NSString stringWithFormat:@"Dictionary missing a style kind: %@", v6];
      v32[0] = v10;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = v32;
      uint64_t v16 = &v31;
LABEL_14:
      id v11 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
      [v13 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v11];
      uint64_t v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

      uint64_t v9 = (void *)v10;
      goto LABEL_28;
    }
LABEL_15:
    uint64_t v17 = 0;
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28228];
      uint64_t v10 = [NSString stringWithFormat:@"Invalid style kind: %@", v7];
      uint64_t v30 = v10;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = &v30;
      uint64_t v16 = &v29;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"parameters"];
  if (!v8)
  {
    if (a4)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28228];
      id v11 = [NSString stringWithFormat:@"Dictionary missing style parameters: %@", v6];
      v28 = v11;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      [v18 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v12];
      uint64_t v10 = 0;
      uint64_t v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    goto LABEL_20;
  }
  uint64_t v9 = (void *)v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [a1 deserializeParameters:v9 error:a4];

    if (v10)
    {
      id v11 = [v6 objectForKeyedSubscript:@"colorSuggestions"];
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
LABEL_32:
            uint64_t v17 = 0;
            goto LABEL_27;
          }
          long long v20 = (void *)MEMORY[0x1E4F28C58];
          id v12 = [NSString stringWithFormat:@"Invalid color suggestions: %@", v11, *MEMORY[0x1E4F28228]];
          uint64_t v24 = v12;
          id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          *a4 = [v20 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v21];

          uint64_t v17 = 0;
          goto LABEL_26;
        }
        id v12 = [a1 deserializeColorSuggestions:v11 error:a4];
        if (!v12) {
          goto LABEL_32;
        }
      }
      else
      {
        NSLog(&cfstr_DictionaryMiss_1.isa);
        id v12 = (void *)MEMORY[0x1E4F1CBF0];
      }
      uint64_t v17 = [[PFParallaxLayerStyle alloc] initWithKind:v7 parameters:v10 colorSuggestions:v12];
LABEL_26:

      goto LABEL_27;
    }
LABEL_20:
    uint64_t v9 = 0;
    goto LABEL_21;
  }
  if (a4)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    id v11 = [NSString stringWithFormat:@"Invalid style parameters: %@", v9];
    v26 = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [v19 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v12];
    uint64_t v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (uint64_t)v9;
    goto LABEL_26;
  }
LABEL_21:
  uint64_t v17 = 0;
LABEL_28:

LABEL_29:

  return v17;
}

+ (id)serializeParameter:(id)a3 forKey:(id)a4
{
  uint64_t v5 = serializeParameter_forKey__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&serializeParameter_forKey__onceToken, &__block_literal_global_71);
  }
  uint64_t v8 = [(id)serializeParameter_forKey__parameterSerializationMap objectForKeyedSubscript:v6];

  uint64_t v9 = ((void (**)(void, id))v8)[2](v8, v7);

  return v9;
}

void __50__PFParallaxLayerStyle_serializeParameter_forKey___block_invoke()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v2[0] = @"mode";
  v2[1] = @"color";
  v3[0] = &__block_literal_global_69;
  v3[1] = &__block_literal_global_66;
  v2[2] = @"primaryColor";
  v2[3] = @"secondaryColor";
  v3[2] = &__block_literal_global_66;
  v3[3] = &__block_literal_global_66;
  v2[4] = @"clockFont";
  v2[5] = @"clockVibrancy";
  v3[4] = &__block_literal_global_69;
  v3[5] = &__block_literal_global_69;
  v2[6] = @"clockColor";
  v2[7] = @"lowKey";
  v3[6] = &__block_literal_global_66;
  v3[7] = &__block_literal_global_69;
  v2[8] = @"highKey";
  v2[9] = @"background";
  v3[8] = &__block_literal_global_69;
  v3[9] = &__block_literal_global_69;
  v2[10] = @"headroomLook";
  v3[10] = &__block_literal_global_69;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:11];
  v1 = (void *)serializeParameter_forKey__parameterSerializationMap;
  serializeParameter_forKey__parameterSerializationMap = v0;
}

+ (id)serializeParameters:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PFParallaxLayerStyle_serializeParameters___block_invoke;
  v5[3] = &__block_descriptor_40_e21__24__0__NSString_8_16l;
  v5[4] = a1;
  v3 = PFMapDictionary(a3, v5);

  return v3;
}

uint64_t __44__PFParallaxLayerStyle_serializeParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) serializeParameter:a3 forKey:a2];
}

+ (id)serializeColorSuggestions:(id)a3
{
  return PFMap(a3, &__block_literal_global_61);
}

id __50__PFParallaxLayerStyle_serializeColorSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PFParallaxPaletteSuggestion dictionaryWithPaletteSuggestion:a2];
}

+ (id)dictionaryWithStyle:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 colorSuggestions];
  id v6 = [a1 serializeColorSuggestions:v5];

  id v7 = [v4 parameters];
  uint64_t v8 = [a1 serializeParameters:v7];

  v12[0] = @"kind";
  uint64_t v9 = [v4 kind];

  v13[0] = v9;
  v13[1] = v8;
  v12[1] = @"parameters";
  v12[2] = @"colorSuggestions";
  v13[2] = v6;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (BOOL)isSegmentedStyle:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"Studio"] & 1) != 0
    || ([v3 isEqualToString:@"BlackWhite"] & 1) != 0
    || ([v3 isEqualToString:@"ColorBGStandard"] & 1) != 0
    || ([v3 isEqualToString:@"GreenScreen"] & 1) != 0
    || ([v3 isEqualToString:@"GreenScreenMono"] & 1) != 0
    || ([v3 isEqualToString:@"GreenScreenBlur"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"GreenScreenGraphic"];
  }

  return v4;
}

+ (BOOL)styleKind:(id)a3 supportsParameter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 isEqualToString:@"mode"])
  {
    if ([v6 isEqualToString:@"color"])
    {
      if (([v5 isEqualToString:@"ColorWashSingle"] & 1) == 0
        && ([v5 isEqualToString:@"ColorBGStandard"] & 1) == 0
        && ([v5 isEqualToString:@"GreenScreen"] & 1) == 0
        && ([v5 isEqualToString:@"GreenScreenMono"] & 1) == 0
        && ([v5 isEqualToString:@"GreenScreenBlur"] & 1) == 0)
      {
        id v7 = @"GreenScreenGraphic";
        goto LABEL_14;
      }
    }
    else
    {
      if (([v6 isEqualToString:@"primaryColor"] & 1) != 0
        || ([v6 isEqualToString:@"secondaryColor"] & 1) != 0)
      {
        id v7 = @"ColorWashDuotone";
        goto LABEL_14;
      }
      if (([v6 isEqualToString:@"clockFont"] & 1) == 0
        && ([v6 isEqualToString:@"clockColor"] & 1) == 0
        && ([v6 isEqualToString:@"clockVibrancy"] & 1) == 0)
      {
        if (![v6 isEqualToString:@"headroomLook"])
        {
          char v8 = 0;
          goto LABEL_19;
        }
        id v7 = @"Original";
        goto LABEL_14;
      }
    }
LABEL_18:
    char v8 = 1;
    goto LABEL_19;
  }
  if ([v5 isEqualToString:@"Studio"]) {
    goto LABEL_18;
  }
  id v7 = @"BlackWhite";
LABEL_14:
  char v8 = [v5 isEqualToString:v7];
LABEL_19:

  return v8;
}

@end