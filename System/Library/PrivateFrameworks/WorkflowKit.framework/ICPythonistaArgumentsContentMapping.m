@interface ICPythonistaArgumentsContentMapping
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICPythonistaArgumentsContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__ICPythonistaArgumentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E6556D50;
  id v11 = v8;
  id v9 = v8;
  [(ICContentMapping *)self getContentCollection:v10 withInput:a4 parameters:a5];
}

void __84__ICPythonistaArgumentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __84__ICPythonistaArgumentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
    v4[3] = &unk_1E65586C8;
    id v5 = *(id *)(a1 + 32);
    [a2 getStringRepresentations:v4];
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

void __84__ICPythonistaArgumentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    id v5 = (void *)[v4 mutableCopy];

    [v5 removeCharactersInString:@"?&="];
    v6 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v13 + 1) + 8 * i) stringByAddingPercentEncodingWithAllowedCharacters:v5];
          [v6 appendFormat:@"&argv=%@", v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end