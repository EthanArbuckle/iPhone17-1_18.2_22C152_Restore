@interface ICEpochDateContentMapping
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICEpochDateContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__ICEpochDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E6556D50;
  id v11 = v8;
  id v9 = v8;
  [(ICContentMapping *)self getContentCollection:v10 withInput:a4 parameters:a5];
}

void __74__ICEpochDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 numberOfItems])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __74__ICEpochDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
    v4[3] = &unk_1E654F610;
    id v5 = *(id *)(a1 + 32);
    [v3 getObjectRepresentation:v4 forClass:objc_opt_class()];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __74__ICEpochDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = NSString;
  id v7 = a4;
  [a2 timeIntervalSince1970];
  objc_msgSend(v6, "stringWithFormat:", @"%.0f", v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v9, v7);
}

@end