@interface ICCreateDayOneEntryAction
- (BOOL)inputRequired;
- (void)getImagesFromInput:(id)a3 completionHandler:(id)a4;
- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7;
@end

@implementation ICCreateDayOneEntryAction

- (void)getImagesFromInput:(id)a3 completionHandler:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F5A7E0];
  id v6 = a4;
  id v7 = a3;
  v22[0] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v9 = [v5 requestForCoercingToContentClasses:v8 completionHandler:v6];

  v10 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "orderedSetWithObjects:", v11, v12, objc_opt_class(), 0);
  v14 = (void *)MEMORY[0x1E4F5A7D8];
  uint64_t v15 = *MEMORY[0x1E4F5AAB0];
  v19 = v13;
  uint64_t v20 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v21 = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v18 = [v14 optionsWithDictionary:v17];
  [v9 setOptions:v18];

  [v7 performCoercion:v9];
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __105__ICCreateDayOneEntryAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke;
  v22[3] = &unk_1E65599D0;
  id v23 = v13;
  id v24 = v12;
  id v27 = v15;
  id v28 = v16;
  id v25 = v14;
  v26 = self;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v12;
  id v21 = v13;
  [(ICCreateDayOneEntryAction *)self getImagesFromInput:v20 completionHandler:v22];
}

void __105__ICCreateDayOneEntryAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = (void *)[v3 mutableCopy];
  uint64_t v6 = [v4 numberOfItems];

  if (v6) {
    [v5 setObject:@"1" forKey:@"imageClipboard"];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  v11.receiver = *(id *)(a1 + 56);
  v11.super_class = (Class)ICCreateDayOneEntryAction;
  objc_msgSendSuper2(&v11, sel_performActionWithInput_parameters_userInterface_successHandler_errorHandler_, v7, v5, v8, v9, v10);
}

- (BOOL)inputRequired
{
  return 0;
}

@end