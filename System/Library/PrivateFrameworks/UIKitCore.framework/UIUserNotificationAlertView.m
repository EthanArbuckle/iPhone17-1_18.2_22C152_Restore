@interface UIUserNotificationAlertView
@end

@implementation UIUserNotificationAlertView

void __36___UIUserNotificationAlertView_show__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 text];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1ED0E84C0;
  }
  [v4 addObject:v7];

  v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v3 placeholder];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_1ED0E84C0;
  }
  [v8 addObject:v11];

  v12 = *(void **)(a1 + 48);
  v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "keyboardType"));
  [v12 addObject:v13];

  v14 = *(void **)(a1 + 56);
  v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "autocapitalizationType"));
  [v14 addObject:v15];

  v16 = *(void **)(a1 + 64);
  v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "autocorrectionType"));
  [v16 addObject:v17];

  [*(id *)(a1 + 72) setObject:*(void *)(a1 + 32) forKey:*MEMORY[0x1E4F1DA28]];
  [*(id *)(a1 + 72) setObject:*(void *)(a1 + 40) forKey:*MEMORY[0x1E4F1DA20]];
  [*(id *)(a1 + 72) setObject:*(void *)(a1 + 48) forKey:*MEMORY[0x1E4F1D9F0]];
  uint64_t v19 = *(void *)(a1 + 64);
  v18 = *(void **)(a1 + 72);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  v20 = (void *)qword_1EB25BFA8;
  uint64_t v35 = qword_1EB25BFA8;
  if (!qword_1EB25BFA8)
  {
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __getSBUserNotificationTextAutocorrectionTypeSymbolLoc_block_invoke;
    v31 = &unk_1E52D9900;
    v21 = SpringBoardServicesLibrary_2();
    v33[3] = (uint64_t)dlsym(v21, "SBUserNotificationTextAutocorrectionType");
    qword_1EB25BFA8 = v33[3];
    v20 = (void *)v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (v20)
  {
    [v18 setObject:v19 forKey:*v20];
    v22 = *(void **)(a1 + 72);
    uint64_t v23 = *(void *)(a1 + 56);
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v24 = (void *)qword_1EB25BFB0;
    uint64_t v35 = qword_1EB25BFB0;
    if (!qword_1EB25BFB0)
    {
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      v30 = __getSBUserNotificationTextAutocapitalizationTypeSymbolLoc_block_invoke;
      v31 = &unk_1E52D9900;
      v25 = SpringBoardServicesLibrary_2();
      v33[3] = (uint64_t)dlsym(v25, "SBUserNotificationTextAutocapitalizationType");
      qword_1EB25BFB0 = v33[3];
      v24 = (void *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (v24)
    {
      [v22 setObject:v23 forKey:*v24];

      return;
    }
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = [NSString stringWithUTF8String:"NSString *getSBUserNotificationTextAutocapitalizationType(void)"];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"UIAlertView_ViewServiceSupport.m", 31, @"%s", dlerror(), v28, v29, v30, v31);
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = [NSString stringWithUTF8String:"NSString *getSBUserNotificationTextAutocorrectionType(void)"];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"UIAlertView_ViewServiceSupport.m", 30, @"%s", dlerror(), v28, v29, v30, v31);
  }

  __break(1u);
}

@end