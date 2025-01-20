@interface ICPhoneNumberContentMapping
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICPhoneNumberContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__ICPhoneNumberContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E6551C70;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(ICContentMapping *)self getContentCollection:v10 withInput:a4 parameters:a5];
}

void __76__ICPhoneNumberContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    id v8 = [v6 collectionByFilteringToItemClass:objc_opt_class() excludedItems:0];
    if ([v8 numberOfItems])
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__ICPhoneNumberContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
      v17[3] = &unk_1E6553AC0;
      id v9 = *(void **)(a1 + 40);
      v17[4] = *(void *)(a1 + 32);
      id v18 = v9;
      [v8 getObjectRepresentations:v17 forClass:objc_opt_class()];
    }
    else
    {
      [v6 getStringRepresentation:*(void *)(a1 + 40)];
    }
  }
  else
  {
    v10 = [*(id *)(a1 + 32) destinationType];
    char v11 = [v10 isEqualToString:@"URLQueryValue"];

    if (!v7 && (v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F281F8];
      v19[0] = *MEMORY[0x1E4F28588];
      v14 = WFLocalizedString(@"Error");
      v20[0] = v14;
      v19[1] = *MEMORY[0x1E4F28568];
      v15 = WFLocalizedString(@"No phone numbers were passed into this action.");
      v20[1] = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
      id v7 = [v12 errorWithDomain:v13 code:260 userInfo:v16];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __76__ICPhoneNumberContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v10 = (void *)getCNLabelPhoneNumberiPhoneSymbolLoc_ptr;
  uint64_t v33 = getCNLabelPhoneNumberiPhoneSymbolLoc_ptr;
  if (!getCNLabelPhoneNumberiPhoneSymbolLoc_ptr)
  {
    char v11 = ContactsLibrary();
    v31[3] = (uint64_t)dlsym(v11, "CNLabelPhoneNumberiPhone");
    getCNLabelPhoneNumberiPhoneSymbolLoc_ptr = v31[3];
    v10 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v10)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = [NSString stringWithUTF8String:"NSString *getCNLabelPhoneNumberiPhone(void)"];
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"ICPhoneNumberContentMapping.m", 14, @"%s", dlerror());
LABEL_19:

    __break(1u);
    return;
  }
  v12 = [v7 objectMatchingKey:@"label" value:*v10];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v13 = (void *)getCNLabelPhoneNumberMobileSymbolLoc_ptr;
  uint64_t v33 = getCNLabelPhoneNumberMobileSymbolLoc_ptr;
  if (!getCNLabelPhoneNumberMobileSymbolLoc_ptr)
  {
    v14 = ContactsLibrary();
    v31[3] = (uint64_t)dlsym(v14, "CNLabelPhoneNumberMobile");
    getCNLabelPhoneNumberMobileSymbolLoc_ptr = v31[3];
    uint64_t v13 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v13)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = [NSString stringWithUTF8String:"NSString *getCNLabelPhoneNumberMobile(void)"];
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"ICPhoneNumberContentMapping.m", 15, @"%s", dlerror());
    goto LABEL_19;
  }
  uint64_t v15 = [v7 objectMatchingKey:@"label" value:*v13];
  v16 = (void *)v15;
  if (v12) {
    v17 = v12;
  }
  else {
    v17 = (void *)v15;
  }
  v29 = v8;
  if (v17)
  {
    id v18 = v17;
  }
  else
  {
    id v18 = [v7 firstObject];
  }
  v19 = v18;
  uint64_t v20 = a1;
  v21 = [*(id *)(a1 + 32) definition];
  v22 = [v21 objectForKey:@"UseNormalizedNumber"];
  if ([v22 BOOLValue]) {
    [v19 normalizedPhoneNumber];
  }
  else {
  v23 = [v19 string];
  }

  v24 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v25 = [v23 componentsSeparatedByCharactersInSet:v24];
  v26 = [v25 componentsJoinedByString:&stru_1F229A4D8];

  (*(void (**)(void))(*(void *)(v20 + 40) + 16))();
}

@end