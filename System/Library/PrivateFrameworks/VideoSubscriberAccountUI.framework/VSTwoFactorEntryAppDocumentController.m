@interface VSTwoFactorEntryAppDocumentController
- (BOOL)_updateTwoFactorEntryViewModel:(id)a3 withTemplate:(id)a4 error:(id *)a5;
- (BOOL)_updateViewModel:(id)a3 error:(id *)a4;
- (id)_newViewModel;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopObservingViewModel:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)twoFactorEntryViewModel:(id)a3 didPressButtonAtIndex:(unint64_t)a4;
@end

@implementation VSTwoFactorEntryAppDocumentController

- (void)_startObservingViewModel:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VSTwoFactorEntryAppDocumentController;
  [(VSAppDocumentController *)&v6 _startObservingViewModel:v4];
  v5 = [v4 twoFactorTextField];
  [v5 addObserver:self forKeyPath:@"text" options:3 context:kVSKeyValueObservingContext_TwoFactorText];
}

- (void)_stopObservingViewModel:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VSTwoFactorEntryAppDocumentController;
  [(VSAppDocumentController *)&v6 _stopObservingViewModel:v4];
  v5 = [v4 twoFactorTextField];
  [v5 removeObserver:self forKeyPath:@"text" context:kVSKeyValueObservingContext_TwoFactorText];
}

- (id)_newViewModel
{
  v3 = objc_alloc_init(VSTwoFactorEntryViewModel);
  [(VSTwoFactorEntryViewModel *)v3 setDelegate:self];
  return v3;
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSTwoFactorEntryAppDocumentController;
  [(VSAppDocumentController *)&v14 _updateViewModel:v6 error:a4];
  id v7 = v6;
  v8 = [(VSAppDocumentController *)self appDocument];
  id v9 = [v8 error];

  if (v9)
  {
    BOOL v10 = 0;
    if (a4) {
LABEL_3:
    }
      *a4 = v9;
  }
  else
  {
    v12 = [(VSAppDocumentController *)self templateElement];
    if (objc_msgSend(v12, "vs_elementType") == 165)
    {
      id v13 = 0;
      BOOL v10 = [(VSTwoFactorEntryAppDocumentController *)self _updateTwoFactorEntryViewModel:v7 withTemplate:v12 error:&v13];
      id v9 = v13;
    }
    else
    {
      VSPrivateError();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v10 = 0;
    }

    if (a4) {
      goto LABEL_3;
    }
  }

  return v10;
}

- (BOOL)_updateTwoFactorEntryViewModel:(id)a3 withTemplate:(id)a4 error:(id *)a5
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v72 = a3;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v6 = [a4 children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v86 objects:v96 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v87;
    uint64_t v65 = *MEMORY[0x263EFF4A0];
    uint64_t v66 = *(void *)v87;
    v67 = v6;
    do
    {
      uint64_t v10 = 0;
      uint64_t v69 = v8;
      do
      {
        if (*(void *)v87 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v86 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend(v11, "vs_elementType");
        if (v12 != 160)
        {
          if (v12 != 138)
          {
            if (v12 == 49)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v13 = (void *)MEMORY[0x263EFF940];
                objc_super v14 = (objc_class *)objc_opt_class();
                v15 = NSStringFromClass(v14);
                [v13 raise:v65, @"Unexpectedly, element was %@, instead of IKImageElement.", v15 format];
              }
              id v16 = [(VSAppDocumentController *)self _imageItemProviderWithImageElement:v11];
              [v72 setLogoProvider:v16];
              goto LABEL_59;
            }
            goto LABEL_60;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = (void *)MEMORY[0x263EFF940];
            v18 = (objc_class *)objc_opt_class();
            v19 = NSStringFromClass(v18);
            [v17 raise:v65, @"Unexpectedly, element was %@, instead of IKTextElement.", v19 format];
          }
          id v16 = v11;
          v20 = [v16 elementName];
          if ([v20 isEqual:@"title"])
          {
            v21 = [v16 text];
            v22 = [v21 string];
            [v72 setHeaderText:v22];
            goto LABEL_34;
          }
          if ([v20 isEqual:@"description"])
          {
            v21 = [v16 text];
            v22 = [v21 string];
            [v72 setMessage:v22];
LABEL_34:
          }
          goto LABEL_59;
        }
        uint64_t v71 = v10;
        v23 = objc_msgSend(v11, "vs_itemElementsOfType:", 140);
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v16 = v23;
        uint64_t v24 = [v16 countByEnumeratingWithState:&v82 objects:v95 count:16];
        if (!v24) {
          goto LABEL_58;
        }
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v83;
        obuint64_t j = v16;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v83 != v26) {
              objc_enumerationMutation(obj);
            }
            v28 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            v29 = [v28 attributes];
            v30 = [v29 objectForKey:@"label"];

            v31 = [v28 attributes];
            v32 = [v31 objectForKey:@"length"];

            v33 = [v28 attributes];
            v34 = [v33 objectForKey:@"type"];

            v35 = [v28 attributes];
            v36 = [v35 objectForKey:@"autocapitalize"];

            v37 = [v28 attributes];
            v38 = [v37 objectForKey:@"autoshowkeyboard"];

            if (v32 && [v32 integerValue] > 0)
            {
              if (!v34)
              {
                uint64_t v40 = 0;
                id v16 = obj;
                if (!v36) {
                  goto LABEL_50;
                }
                goto LABEL_43;
              }
              id v16 = obj;
              if ([v34 isEqual:@"default"]) {
                goto LABEL_30;
              }
              if ([v34 isEqual:@"emailAddress"])
              {
                uint64_t v40 = 7;
                if (!v36) {
                  goto LABEL_50;
                }
LABEL_43:
                if (objc_msgSend(v28, "vs_BOOLAttributeValueForKey:", @"autocapitalize")) {
                  uint64_t v41 = 3;
                }
                else {
                  uint64_t v41 = 0;
                }
                if (v38)
                {
LABEL_47:
                  unsigned int v70 = objc_msgSend(v28, "vs_BOOLAttributeValueForKey:", @"autoshowkeyboard");
LABEL_52:
                  v42 = objc_alloc_init(VSITMLTwoFactorEntryField);
                  [(VSITMLTwoFactorEntryField *)v42 setAssociatedTextFieldElement:v28];
                  [(VSTwoFactorEntryTextField *)v42 setKeyboardType:v40];
                  [(VSTwoFactorEntryTextField *)v42 setAutocapitalizationType:v41];
                  [(VSTwoFactorEntryTextField *)v42 setAutoShowKeyboard:v70];
                  [(VSTwoFactorEntryTextField *)v42 setLabel:v30];
                  if ([v32 integerValue] < 9)
                  {
                    uint64_t v44 = [v32 integerValue];
                  }
                  else
                  {
                    v43 = VSErrorLogObject();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v46 = [v32 integerValue];
                      *(_DWORD *)buf = 134218240;
                      uint64_t v92 = v46;
                      __int16 v93 = 2048;
                      uint64_t v94 = 8;
                      _os_log_error_impl(&dword_23F9AB000, v43, OS_LOG_TYPE_ERROR, "Attempted to use TFA with %ld digits, limit is %ld", buf, 0x16u);
                    }

                    uint64_t v44 = 8;
                  }
                  [(VSTwoFactorEntryTextField *)v42 setExpectedLength:v44];
                  [v72 setTwoFactorTextField:v42];

                  goto LABEL_58;
                }
              }
              else
              {
                if ([v34 isEqual:@"numberPad"])
                {
                  uint64_t v40 = 4;
                  if (!v36) {
                    goto LABEL_50;
                  }
                  goto LABEL_43;
                }
                if ([v34 isEqual:@"url"])
                {
                  uint64_t v40 = 3;
                  if (!v36) {
                    goto LABEL_50;
                  }
                  goto LABEL_43;
                }
                v45 = VSErrorLogObject();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                  -[VSTwoFactorEntryAppDocumentController _updateTwoFactorEntryViewModel:withTemplate:error:](&v80, v81, v45);
                }

LABEL_30:
                uint64_t v40 = 0;
                if (v36) {
                  goto LABEL_43;
                }
LABEL_50:
                uint64_t v41 = 0;
                if (v38) {
                  goto LABEL_47;
                }
              }
              unsigned int v70 = 1;
              goto LABEL_52;
            }
            v39 = VSDefaultLogObject();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_23F9AB000, v39, OS_LOG_TYPE_DEFAULT, "Ignoring text field due to missing or invalid length attribute.", buf, 2u);
            }
          }
          id v16 = obj;
          uint64_t v25 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
          if (v25) {
            continue;
          }
          break;
        }
LABEL_58:

        uint64_t v9 = v66;
        id v6 = v67;
        uint64_t v8 = v69;
        uint64_t v10 = v71;
LABEL_59:

LABEL_60:
        ++v10;
      }
      while (v10 != v8);
      uint64_t v47 = [v6 countByEnumeratingWithState:&v86 objects:v96 count:16];
      uint64_t v8 = v47;
    }
    while (v47);
  }

  id v75 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v48 = [(VSAppDocumentController *)self filteredButtonLockupElements];
  uint64_t v49 = [v48 countByEnumeratingWithState:&v76 objects:v90 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v77;
    uint64_t v74 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v77 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        v54 = objc_msgSend(v53, "vs_itemElementsOfType:", 138);
        v55 = [v54 firstObject];

        if (v55)
        {
          v56 = [v55 text];
          v57 = [v56 string];

          v58 = objc_alloc_init(VSTwoFactorEntryButton);
          if (!v57) {
            [MEMORY[0x263EFF940] raise:v74 format:@"The buttonText parameter must not be nil."];
          }
          [(VSTwoFactorEntryButton *)v58 setText:v57];
          v59 = [v53 attributes];
          v60 = [v59 objectForKey:@"type"];

          if (v60) {
            [(VSTwoFactorEntryButton *)v58 setType:v60];
          }
          [v75 addObject:v58];
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v76 objects:v90 count:16];
    }
    while (v50);
  }

  [v72 setButtons:v75];
  v61 = [v72 twoFactorTextField];

  if (v61)
  {
    v62 = 0;
  }
  else
  {
    v62 = VSPrivateError();
  }
  if (*a5) {
    *a5 = v62;
  }

  return v62 == 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if ((void *)kVSKeyValueObservingContext_TwoFactorText == a6)
  {
    id v12 = a5;
    id v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v13, OS_LOG_TYPE_DEFAULT, "Two factor text field did change.", buf, 2u);
    }

    uint64_t v14 = *MEMORY[0x263F081B8];
    id v15 = v10;
    id v11 = [v12 objectForKey:v14];

    id v16 = [v15 associatedTextFieldElement];

    v17 = [v16 keyboard];
    [v17 setText:v11];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VSTwoFactorEntryAppDocumentController;
    id v11 = a5;
    [(VSAppDocumentController *)&v18 observeValueForKeyPath:a3 ofObject:v10 change:v11 context:a6];
  }
}

- (void)twoFactorEntryViewModel:(id)a3 didPressButtonAtIndex:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = [(VSAppDocumentController *)self filteredButtonLockupElements];
  id v6 = [v5 objectAtIndex:a4];

  if (v6)
  {
    uint64_t v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_23F9AB000, v7, OS_LOG_TYPE_DEFAULT, "Sending select event for button %@.", (uint8_t *)&v9, 0xCu);
    }

    [v6 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
  else
  {
    uint64_t v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VSTwoFactorEntryAppDocumentController twoFactorEntryViewModel:didPressButtonAtIndex:](a4, v8);
    }
  }
}

- (void)_updateTwoFactorEntryViewModel:(uint8_t *)buf withTemplate:(unsigned char *)a2 error:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "Invalid keyboard type provided, using default.", buf, 2u);
}

- (void)twoFactorEntryViewModel:(uint64_t)a1 didPressButtonAtIndex:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Two factor button with index %lu does not exist.", (uint8_t *)&v2, 0xCu);
}

@end