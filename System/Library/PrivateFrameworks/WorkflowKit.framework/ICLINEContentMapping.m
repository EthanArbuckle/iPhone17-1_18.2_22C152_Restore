@interface ICLINEContentMapping
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICLINEContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__ICLINEContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E6556D50;
  id v11 = v8;
  id v9 = v8;
  [(ICContentMapping *)self getContentCollection:v10 withInput:a4 parameters:a5];
}

void __69__ICLINEContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v7 = [a2 items];
  id v8 = [v7 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 string];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [NSString stringWithFormat:@"text/%@", v9];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__ICLINEContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
      block[3] = &unk_1E6558678;
      id v13 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __69__ICLINEContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1)
{
  id v5 = [(objc_class *)getUIPasteboardClass() generalPasteboard];
  v2 = NSString;
  v3 = [v5 name];
  v4 = [v2 stringWithFormat:@"image/%@", v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end