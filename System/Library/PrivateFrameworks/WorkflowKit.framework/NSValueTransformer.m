@interface NSValueTransformer
@end

@implementation NSValueTransformer

uint64_t __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) reverseTransformedValue:a2 success:a3 error:a4];
}

uint64_t __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) transformedValue:a2 success:a3 error:a4];
}

uint64_t __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) reverseTransformedValue:a2];
}

uint64_t __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transformedValue:a2];
}

id __101__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_transformerWithFormatter_forObjectClass___block_invoke(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  v45[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (!v7)
  {
    id v18 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = *(void **)(a1 + 32);
    id v38 = 0;
    id v39 = 0;
    char v9 = [v8 getObjectValue:&v39 forString:v7 errorDescription:&v38];
    id v10 = v39;
    id v11 = v38;
    *a3 = v9;
    if (v11)
    {
      if (a4)
      {
        v42[0] = *MEMORY[0x1E4F28568];
        v12 = NSString;
        v13 = [MEMORY[0x1E4F28B50] mainBundle];
        v14 = [v13 localizedStringForKey:@"Could not convert string to %@" value:&stru_1F229A4D8 table:0];
        v15 = objc_msgSend(v12, "stringWithFormat:", v14, *(void *)(a1 + 40));
        uint64_t v16 = *MEMORY[0x1E4F28588];
        v43[0] = v15;
        v43[1] = v11;
        v42[1] = v16;
        v42[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v43[2] = v7;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v17];
      }
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
        id v18 = v10;
LABEL_15:

        goto LABEL_16;
      }
      if (a4)
      {
        v40[0] = *MEMORY[0x1E4F28568];
        v28 = NSString;
        v37 = [MEMORY[0x1E4F28B50] mainBundle];
        v36 = [v37 localizedStringForKey:@"Could not convert string to %@" value:&stru_1F229A4D8 table:0];
        v29 = objc_msgSend(v28, "stringWithFormat:", v36, *(void *)(a1 + 40));
        v41[0] = v29;
        v40[1] = *MEMORY[0x1E4F28588];
        v30 = NSString;
        v31 = [MEMORY[0x1E4F28B50] mainBundle];
        v32 = [v31 localizedStringForKey:@"Expected an %@ as output from the formatter, got: %@.", &stru_1F229A4D8, 0 value table];
        v33 = objc_msgSend(v30, "stringWithFormat:", v32, *(void *)(a1 + 40), v10);
        v41[1] = v33;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:2048 userInfo:v34];
      }
    }
    id v18 = 0;
    *a3 = 0;
    goto LABEL_15;
  }
  if (a4)
  {
    v44[0] = *MEMORY[0x1E4F28568];
    v19 = NSString;
    v20 = [MEMORY[0x1E4F28B50] mainBundle];
    v21 = [v20 localizedStringForKey:@"Could not convert string to %@" value:&stru_1F229A4D8 table:0];
    v22 = objc_msgSend(v19, "stringWithFormat:", v21, *(void *)(a1 + 40));
    v45[0] = v22;
    v44[1] = *MEMORY[0x1E4F28588];
    v23 = NSString;
    v24 = [MEMORY[0x1E4F28B50] mainBundle];
    v25 = [v24 localizedStringForKey:@"Expected an NSString as input, got: %@.", &stru_1F229A4D8, 0 value table];
    v26 = objc_msgSend(v23, "stringWithFormat:", v25, v7);
    v44[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
    v45[1] = v26;
    v45[2] = v7;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];

    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v27];
  }
  id v18 = 0;
  *a3 = 0;
LABEL_16:

  return v18;
}

void *__101__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_transformerWithFormatter_forObjectClass___block_invoke_2(uint64_t a1, void *a2, BOOL *a3, void *a4)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (v7)
  {
    if (objc_opt_isKindOfClass())
    {
      a4 = [*(id *)(a1 + 32) stringForObjectValue:v7];
      BOOL v8 = a4 != 0;
    }
    else if (a4)
    {
      v19[0] = *MEMORY[0x1E4F28568];
      char v9 = NSString;
      id v10 = [MEMORY[0x1E4F28B50] mainBundle];
      id v11 = [v10 localizedStringForKey:@"Could not convert %@ to string" value:&stru_1F229A4D8 table:0];
      v12 = objc_msgSend(v9, "stringWithFormat:", v11, *(void *)(a1 + 40));
      v20[0] = v12;
      v19[1] = *MEMORY[0x1E4F28588];
      v13 = NSString;
      v14 = [MEMORY[0x1E4F28B50] mainBundle];
      v15 = [v14 localizedStringForKey:@"Expected an %@ as input, got: %@.", &stru_1F229A4D8, 0 value table];
      uint64_t v16 = objc_msgSend(v13, "stringWithFormat:", v15, *(void *)(a1 + 40), v7);
      v19[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
      v20[1] = v16;
      v20[2] = v7;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v17];

      BOOL v8 = 0;
      a4 = 0;
    }
    else
    {
      BOOL v8 = 0;
    }
    *a3 = v8;
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

id __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (!v3)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (!v6) {
    v6 = *(void **)(a1 + 40);
  }
  id v8 = v6;

  if (!v3) {
  return v8;
  }
}

id __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__59648;
  uint64_t v16 = __Block_byref_object_dispose__59649;
  id v17 = 0;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke_148;
  v9[3] = &unk_1E6556518;
  id v5 = v3;
  id v10 = v5;
  id v11 = &v12;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  v6 = (void *)v13[5];
  if (!v6) {
    v6 = *(void **)(a1 + 40);
  }
  id v7 = v6;

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __132__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_valueMappingTransformerWithDictionary_defaultValue_reverseDefaultValue___block_invoke_148(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) isEqual:a3])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

id __91__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_validatingTransformerForClass___block_invoke(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v17[0] = *MEMORY[0x1E4F28568];
      char v9 = [MEMORY[0x1E4F28B50] mainBundle];
      id v10 = [v9 localizedStringForKey:@"Value did not match expected type" value:&stru_1F229A4D8 table:0];
      v18[0] = v10;
      v17[1] = *MEMORY[0x1E4F28588];
      id v11 = NSString;
      uint64_t v12 = [MEMORY[0x1E4F28B50] mainBundle];
      v13 = [v12 localizedStringForKey:@"Expected %1$@ to be of class %2$@ but got %3$@" value:&stru_1F229A4D8 table:0];
      uint64_t v14 = objc_msgSend(v11, "stringWithFormat:", v13, v7, *(void *)(a1 + 32), objc_opt_class());
      v17[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
      v18[1] = v14;
      v18[2] = v7;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v15];
    }
    id v8 = 0;
    *a3 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

id __100__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_arrayMappingTransformerWithTransformer___block_invoke(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v41 = v7;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v47;
        uint64_t v13 = -1;
LABEL_5:
        uint64_t v14 = 0;
        uint64_t v42 = v13 + 1;
        uint64_t v43 = v13 + v11;
        while (1)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v46 + 1) + 8 * v14);
          uint64_t v16 = [MEMORY[0x1E4F1CA98] null];

          if (v15 == v16) {
            break;
          }
          int v17 = [*(id *)(a1 + 32) conformsToProtocol:&unk_1F2327818];
          id v18 = *(void **)(a1 + 32);
          if (v17)
          {
            id v45 = 0;
            v19 = [v18 transformedValue:v15 success:a3 error:&v45];
            id v20 = v45;
            v21 = v20;
            if (!*a3)
            {
              if (a4)
              {
                id v30 = v9;
                uint64_t v31 = v42 + v14;
                v50[0] = *MEMORY[0x1E4F28568];
                v44 = [MEMORY[0x1E4F28B50] mainBundle];
                v32 = [v44 localizedStringForKey:@"Could not transform array" value:&stru_1F229A4D8 table:0];
                v51[0] = v32;
                v50[1] = *MEMORY[0x1E4F28588];
                v33 = NSString;
                v34 = [MEMORY[0x1E4F28B50] mainBundle];
                v35 = [v34 localizedStringForKey:@"Could not transform value at index %ld" value:&stru_1F229A4D8 table:0];
                uint64_t v40 = v31;
                id v9 = v30;
                v36 = objc_msgSend(v33, "stringWithFormat:", v35, v40);
                uint64_t v37 = *MEMORY[0x1E4F28A50];
                v51[1] = v36;
                v51[2] = v21;
                v50[2] = v37;
                v50[3] = @"MTLTransformerErrorHandlingInputValueErrorKey";
                v51[3] = v30;
                id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:4];

                *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v38];
              }
              id v22 = 0;
              goto LABEL_26;
            }

            if (!v19) {
              goto LABEL_16;
            }
            goto LABEL_15;
          }
          v19 = [v18 transformedValue:v15];
          if (v19) {
            goto LABEL_15;
          }
LABEL_16:

          if (v11 == ++v14)
          {
            uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
            uint64_t v13 = v43;
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_18;
          }
        }
        v19 = [MEMORY[0x1E4F1CA98] null];
LABEL_15:
        [v8 addObject:v19];
        goto LABEL_16;
      }
LABEL_18:

      id v22 = v8;
LABEL_26:

      id v7 = v41;
    }
    else
    {
      if (a4)
      {
        v53[0] = *MEMORY[0x1E4F28568];
        v23 = [MEMORY[0x1E4F28B50] mainBundle];
        v24 = [v23 localizedStringForKey:@"Could not transform non-array type" value:&stru_1F229A4D8 table:0];
        v54[0] = v24;
        v53[1] = *MEMORY[0x1E4F28588];
        v25 = NSString;
        v26 = [MEMORY[0x1E4F28B50] mainBundle];
        v27 = [v26 localizedStringForKey:@"Expected an NSArray, got: %@.", &stru_1F229A4D8, 0 value table];
        v28 = objc_msgSend(v25, "stringWithFormat:", v27, v7);
        v53[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v54[1] = v28;
        v54[2] = v7;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v29];
      }
      id v22 = 0;
      *a3 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

id __100__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_arrayMappingTransformerWithTransformer___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  v56[3] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v40 = a4;
      id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v41 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v49;
        uint64_t v12 = -1;
        id obj = v8;
LABEL_5:
        uint64_t v13 = 0;
        uint64_t v42 = v12 + 1;
        uint64_t v43 = v12 + v10;
        while (1)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
          v15 = [MEMORY[0x1E4F1CA98] null];

          if (v14 == v15) {
            break;
          }
          char v16 = objc_opt_respondsToSelector();
          int v17 = *(void **)(a1 + 32);
          if (v16)
          {
            id v47 = 0;
            id v18 = [v17 reverseTransformedValue:v14 success:a3 error:&v47];
            id v19 = v47;
            id v20 = v19;
            if (!*a3)
            {
              v29 = obj;
              if (v40)
              {
                uint64_t v30 = v42 + v13;
                v52[0] = *MEMORY[0x1E4F28568];
                id v45 = [MEMORY[0x1E4F28B50] mainBundle];
                uint64_t v31 = [v45 localizedStringForKey:@"Could not transform array" value:&stru_1F229A4D8 table:0];
                v53[0] = v31;
                v52[1] = *MEMORY[0x1E4F28588];
                v32 = NSString;
                v33 = [MEMORY[0x1E4F28B50] mainBundle];
                v34 = [v33 localizedStringForKey:@"Could not transform value at index %ld" value:&stru_1F229A4D8 table:0];
                uint64_t v39 = v30;
                v29 = obj;
                v35 = objc_msgSend(v32, "stringWithFormat:", v34, v39);
                uint64_t v36 = *MEMORY[0x1E4F28A50];
                v53[1] = v35;
                v53[2] = v20;
                v52[2] = v36;
                v52[3] = @"MTLTransformerErrorHandlingInputValueErrorKey";
                void v53[3] = obj;
                uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:4];

                *uint64_t v40 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v37];
              }
              id v21 = 0;
              goto LABEL_26;
            }

            if (!v18) {
              goto LABEL_16;
            }
            goto LABEL_15;
          }
          id v18 = [v17 reverseTransformedValue:v14];
          if (v18) {
            goto LABEL_15;
          }
LABEL_16:

          if (v10 == ++v13)
          {
            id v8 = obj;
            uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
            uint64_t v12 = v43;
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_18;
          }
        }
        id v18 = [MEMORY[0x1E4F1CA98] null];
LABEL_15:
        [v7 addObject:v18];
        goto LABEL_16;
      }
LABEL_18:

      id v21 = v7;
LABEL_26:

      id v6 = v41;
    }
    else
    {
      if (a4)
      {
        v55[0] = *MEMORY[0x1E4F28568];
        id v22 = [MEMORY[0x1E4F28B50] mainBundle];
        v23 = [v22 localizedStringForKey:@"Could not transform non-array type" value:&stru_1F229A4D8 table:0];
        v56[0] = v23;
        v55[1] = *MEMORY[0x1E4F28588];
        v24 = NSString;
        v25 = [MEMORY[0x1E4F28B50] mainBundle];
        v26 = [v25 localizedStringForKey:@"Expected an NSArray, got: %@.", &stru_1F229A4D8, 0 value table];
        v27 = objc_msgSend(v24, "stringWithFormat:", v26, v6);
        v55[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v56[1] = v27;
        v56[2] = v6;
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v28];
      }
      id v21 = 0;
      *a3 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

void __84__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_BOOLeanValueTransformer__block_invoke()
{
  uint64_t v0 = +[MTLValueTransformer transformerUsingReversibleBlock:&__block_literal_global_52];
  v1 = (void *)mtl_BOOLeanValueTransformer_BOOLeanValueTransformer;
  mtl_BOOLeanValueTransformer_BOOLeanValueTransformer = v0;
}

id __84__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_BOOLeanValueTransformer__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = [v6 BOOLValue];
      id v8 = (id *)MEMORY[0x1E4F1CFD0];
      if (!v7) {
        id v8 = (id *)MEMORY[0x1E4F1CFC8];
      }
      id v9 = *v8;
    }
    else
    {
      if (a4)
      {
        v18[0] = *MEMORY[0x1E4F28568];
        uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v11 = [v10 localizedStringForKey:@"Could not convert number to BOOLean-backed number or vice-versa" value:&stru_1F229A4D8 table:0];
        v19[0] = v11;
        v18[1] = *MEMORY[0x1E4F28588];
        uint64_t v12 = NSString;
        uint64_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v14 = [v13 localizedStringForKey:@"Expected an NSNumber, got: %@.", &stru_1F229A4D8, 0 value table];
        v15 = objc_msgSend(v12, "stringWithFormat:", v14, v6);
        v18[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v19[1] = v15;
        v19[2] = v6;
        char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v16];
      }
      id v9 = 0;
      *a3 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __81__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_UUIDValueTransformer__block_invoke()
{
  uint64_t v0 = +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_31_59673 reverseBlock:&__block_literal_global_41];
  v1 = (void *)mtl_UUIDValueTransformer_UUIDValueTransformer;
  mtl_UUIDValueTransformer_UUIDValueTransformer = v0;
}

id __81__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_UUIDValueTransformer__block_invoke_3(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  void v17[3] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = [v6 UUIDString];
    }
    else
    {
      if (a4)
      {
        v16[0] = *MEMORY[0x1E4F28568];
        id v8 = [MEMORY[0x1E4F28B50] mainBundle];
        id v9 = [v8 localizedStringForKey:@"Could not convert UUID to string" value:&stru_1F229A4D8 table:0];
        v17[0] = v9;
        v16[1] = *MEMORY[0x1E4F28588];
        uint64_t v10 = NSString;
        uint64_t v11 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v12 = [v11 localizedStringForKey:@"Expected an NSUUID, got: %@.", &stru_1F229A4D8, 0 value table];
        uint64_t v13 = objc_msgSend(v10, "stringWithFormat:", v12, v6);
        v16[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v17[1] = v13;
        v17[2] = v6;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v14];
      }
      int v7 = 0;
      *a3 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

id __81__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_UUIDValueTransformer__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
      id v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        if (a4)
        {
          v25[0] = *MEMORY[0x1E4F28568];
          int v17 = [MEMORY[0x1E4F28B50] mainBundle];
          id v18 = [v17 localizedStringForKey:@"Could not convert string to UUID" value:&stru_1F229A4D8 table:0];
          v26[0] = v18;
          v25[1] = *MEMORY[0x1E4F28588];
          id v19 = NSString;
          id v20 = [MEMORY[0x1E4F28B50] mainBundle];
          id v21 = [v20 localizedStringForKey:@"Input UUID string %@ was malformed" value:&stru_1F229A4D8 table:0];
          id v22 = objc_msgSend(v19, "stringWithFormat:", v21, v6);
          v25[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
          v26[1] = v22;
          v26[2] = v6;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];

          *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v23];
        }
        *a3 = 0;
      }
    }
    else
    {
      if (a4)
      {
        v27[0] = *MEMORY[0x1E4F28568];
        uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v11 = [v10 localizedStringForKey:@"Could not convert string to UUID" value:&stru_1F229A4D8 table:0];
        v28[0] = v11;
        v27[1] = *MEMORY[0x1E4F28588];
        uint64_t v12 = NSString;
        uint64_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v14 = [v13 localizedStringForKey:@"Expected an NSString, got: %@.", &stru_1F229A4D8, 0 value table];
        v15 = objc_msgSend(v12, "stringWithFormat:", v14, v6);
        v27[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v28[1] = v15;
        v28[2] = v6;
        char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v16];
      }
      id v8 = 0;
      *a3 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __80__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_URLValueTransformer__block_invoke()
{
  uint64_t v0 = +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_3 reverseBlock:&__block_literal_global_21];
  v1 = (void *)mtl_URLValueTransformer_URLValueTransformer;
  mtl_URLValueTransformer_URLValueTransformer = v0;
}

id __80__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_URLValueTransformer__block_invoke_3(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  void v17[3] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = [v6 absoluteString];
    }
    else
    {
      if (a4)
      {
        v16[0] = *MEMORY[0x1E4F28568];
        id v8 = [MEMORY[0x1E4F28B50] mainBundle];
        id v9 = [v8 localizedStringForKey:@"Could not convert URL to string" value:&stru_1F229A4D8 table:0];
        v17[0] = v9;
        v16[1] = *MEMORY[0x1E4F28588];
        uint64_t v10 = NSString;
        uint64_t v11 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v12 = [v11 localizedStringForKey:@"Expected an NSURL, got: %@.", &stru_1F229A4D8, 0 value table];
        uint64_t v13 = objc_msgSend(v10, "stringWithFormat:", v12, v6);
        v16[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v17[1] = v13;
        v17[2] = v6;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v14];
      }
      int v7 = 0;
      *a3 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

id __80__NSValueTransformer_MTLPredefinedTransformerAdditions__mtl_URLValueTransformer__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3, void *a4)
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
      id v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        if (a4)
        {
          v25[0] = *MEMORY[0x1E4F28568];
          int v17 = [MEMORY[0x1E4F28B50] mainBundle];
          id v18 = [v17 localizedStringForKey:@"Could not convert string to URL" value:&stru_1F229A4D8 table:0];
          v26[0] = v18;
          v25[1] = *MEMORY[0x1E4F28588];
          id v19 = NSString;
          id v20 = [MEMORY[0x1E4F28B50] mainBundle];
          id v21 = [v20 localizedStringForKey:@"Input URL string %@ was malformed" value:&stru_1F229A4D8 table:0];
          id v22 = objc_msgSend(v19, "stringWithFormat:", v21, v6);
          v25[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
          v26[1] = v22;
          v26[2] = v6;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];

          *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v23];
        }
        *a3 = 0;
      }
    }
    else
    {
      if (a4)
      {
        v27[0] = *MEMORY[0x1E4F28568];
        uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v11 = [v10 localizedStringForKey:@"Could not convert string to URL" value:&stru_1F229A4D8 table:0];
        v28[0] = v11;
        v27[1] = *MEMORY[0x1E4F28588];
        uint64_t v12 = NSString;
        uint64_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v14 = [v13 localizedStringForKey:@"Expected an NSString, got: %@.", &stru_1F229A4D8, 0 value table];
        v15 = objc_msgSend(v12, "stringWithFormat:", v14, v6);
        v27[2] = @"MTLTransformerErrorHandlingInputValueErrorKey";
        v28[1] = v15;
        v28[2] = v6;
        char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTLTransformerErrorHandlingErrorDomain" code:1 userInfo:v16];
      }
      id v8 = 0;
      *a3 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end