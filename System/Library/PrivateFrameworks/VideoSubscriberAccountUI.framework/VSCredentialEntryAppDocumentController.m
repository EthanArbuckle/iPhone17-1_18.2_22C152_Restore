@interface VSCredentialEntryAppDocumentController
- (BOOL)_updateCredentialEntryViewModel:(id)a3 error:(id *)a4;
- (BOOL)_updateCredentialEntryViewModel:(id)a3 withTemplate:(id)a4 error:(id *)a5;
- (BOOL)_updateViewModel:(id)a3 error:(id *)a4;
- (VSIKItemGroupElement)pickerElement;
- (id)_credentialEntryViewModelWithViewModel:(id)a3;
- (id)_newViewModel;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopObservingViewModel:(id)a3;
- (void)itemGroup:(id)a3 selectedItemIndexDidChange:(int64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPickerElement:(id)a3;
- (void)viewModel:(id)a3 buttonTappedAtIndex:(unint64_t)a4;
- (void)viewModel:(id)a3 pickerDidSelectRow:(unint64_t)a4;
@end

@implementation VSCredentialEntryAppDocumentController

- (void)_startObservingViewModel:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  v15.receiver = self;
  v15.super_class = (Class)VSCredentialEntryAppDocumentController;
  [(VSAppDocumentController *)&v15 _startObservingViewModel:v4];
  v5 = [(VSCredentialEntryAppDocumentController *)self _credentialEntryViewModelWithViewModel:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = objc_msgSend(v5, "credentialEntryFields", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) addObserver:self forKeyPath:@"text" options:3 context:kVSKeyValueObservingContext_CredentialEntryFieldText];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_stopObservingViewModel:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  v15.receiver = self;
  v15.super_class = (Class)VSCredentialEntryAppDocumentController;
  [(VSAppDocumentController *)&v15 _stopObservingViewModel:v4];
  v5 = [(VSCredentialEntryAppDocumentController *)self _credentialEntryViewModelWithViewModel:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = objc_msgSend(v5, "credentialEntryFields", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) removeObserver:self forKeyPath:@"text" context:kVSKeyValueObservingContext_CredentialEntryFieldText];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)_newViewModel
{
  v3 = objc_alloc_init(VSCredentialEntryViewModel);
  [(VSCredentialEntryViewModel *)v3 setDelegate:self];
  return v3;
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  v13.receiver = self;
  v13.super_class = (Class)VSCredentialEntryAppDocumentController;
  [(VSAppDocumentController *)&v13 _updateViewModel:v6 error:a4];
  uint64_t v7 = [(VSCredentialEntryAppDocumentController *)self _credentialEntryViewModelWithViewModel:v6];
  uint64_t v8 = [(VSAppDocumentController *)self appDocument];
  id v9 = [v8 error];

  if (!v9)
  {
    id v12 = 0;
    BOOL v10 = [(VSCredentialEntryAppDocumentController *)self _updateCredentialEntryViewModel:v7 error:&v12];
    id v9 = v12;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v10 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v9;
LABEL_6:

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if ((void *)kVSKeyValueObservingContext_CredentialEntryFieldText == a6)
  {
    id v12 = a5;
    objc_super v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v13, OS_LOG_TYPE_DEFAULT, "Text field text did change.", buf, 2u);
    }

    id v11 = v10;
    long long v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];

    objc_super v15 = [v11 associatedTextFieldElement];
    v16 = VSDefaultLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v16, OS_LOG_TYPE_DEFAULT, "Will update keyboard text.", buf, 2u);
    }

    uint64_t v17 = [v15 keyboard];
    [v17 setText:v14];

    v18 = VSDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v18, OS_LOG_TYPE_DEFAULT, "Did update keyboard text.", buf, 2u);
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)VSCredentialEntryAppDocumentController;
    id v11 = a5;
    [(VSAppDocumentController *)&v19 observeValueForKeyPath:a3 ofObject:v10 change:v11 context:a6];
  }
}

- (id)_credentialEntryViewModelWithViewModel:(id)a3
{
  id v3 = a3;
  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    [v4 raise:v5, @"Unexpectedly, viewModel was %@, instead of VSCredentialEntryViewModel.", v7 format];
  }
  return v3;
}

- (BOOL)_updateCredentialEntryViewModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
  }
  uint64_t v7 = [(VSAppDocumentController *)self templateElement];
  if (objc_msgSend(v7, "vs_elementType") == 161)
  {
    id v11 = 0;
    BOOL v8 = [(VSCredentialEntryAppDocumentController *)self _updateCredentialEntryViewModel:v6 withTemplate:v7 error:&v11];
    id v9 = v11;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  VSPrivateError();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v8 = 0;
  if (a4) {
LABEL_7:
  }
    *a4 = v9;
LABEL_8:

  return v8;
}

- (BOOL)_updateCredentialEntryViewModel:(id)a3 withTemplate:(id)a4 error:(id *)a5
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (uint64_t *)MEMORY[0x263EFF4A0];
  v115 = v7;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v89 = v8;
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The viewModel parameter must not be nil."];
    id v8 = v89;
    if (v89) {
      goto LABEL_3;
    }
  }
  id v90 = v8;
  [MEMORY[0x263EFF940] raise:*v9 format:@"The templateElement parameter must not be nil."];
  id v8 = v90;
LABEL_3:
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  v108 = v8;
  id v10 = [v8 children];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v136 objects:v144 count:16];
  v107 = a5;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v112 = 0;
    uint64_t v13 = *(void *)v137;
    uint64_t v116 = *v9;
    long long v14 = self;
    v109 = v10;
    uint64_t v111 = *(void *)v137;
    while (1)
    {
      uint64_t v15 = 0;
      uint64_t v113 = v12;
      do
      {
        if (*(void *)v137 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v136 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend(v16, "vs_elementType");
        if (v17 <= 156)
        {
          if (v17 == 49)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v58 = v15;
              v59 = (void *)MEMORY[0x263EFF940];
              v60 = (objc_class *)objc_opt_class();
              v61 = NSStringFromClass(v60);
              v62 = v59;
              uint64_t v15 = v58;
              [v62 raise:v116, @"Unexpectedly, childElement was %@, instead of IKImageElement.", v61 format];
            }
            id v38 = [(VSAppDocumentController *)v14 _imageItemProviderWithImageElement:v16];
            [v115 setLogoProvider:v38];
          }
          else
          {
            if (v17 != 138) {
              goto LABEL_74;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v40 = v15;
              v41 = (void *)MEMORY[0x263EFF940];
              v42 = (objc_class *)objc_opt_class();
              v43 = NSStringFromClass(v42);
              v44 = v41;
              uint64_t v15 = v40;
              [v44 raise:v116, @"Unexpectedly, childElement was %@, instead of IKTextElement.", v43 format];
            }
            id v38 = v16;
            v45 = [v38 elementName];
            if ([v45 isEqual:@"description"])
            {
              [v38 text];
              id v46 = v38;
              v48 = uint64_t v47 = v15;
              v49 = [v48 string];

              uint64_t v15 = v47;
              id v38 = v46;
              [v115 setAdditionalMessage:v49];
            }
          }
        }
        else if (v17 == 157)
        {
          uint64_t v50 = v15;
          v51 = [v16 attributes];
          uint64_t v52 = [v51 objectForKey:@"label"];

          v53 = (void *)v52;
          [v115 setLinkTitle:v52];
          v54 = [v16 attributes];
          v55 = [v54 objectForKey:@"src"];

          if (v55)
          {
            v56 = [NSURL URLWithString:v55];
            if (v56) {
              [v115 setLinkURL:v56];
            }
          }
          uint64_t v15 = v50;
          id v38 = v53;
        }
        else
        {
          uint64_t v114 = v15;
          if (v17 != 158)
          {
            if (v17 == 160)
            {
              v18 = [v115 credentialEntryFields];

              if (!v18)
              {
                id v119 = objc_alloc_init(MEMORY[0x263EFF980]);
                objc_super v19 = objc_msgSend(v16, "vs_itemElementsOfType:", 140);
                long long v132 = 0u;
                long long v133 = 0u;
                long long v134 = 0u;
                long long v135 = 0u;
                obuint64_t j = v19;
                uint64_t v20 = [v19 countByEnumeratingWithState:&v132 objects:v143 count:16];
                if (!v20) {
                  goto LABEL_35;
                }
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v133;
                while (1)
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v133 != v22) {
                      objc_enumerationMutation(obj);
                    }
                    v24 = *(void **)(*((void *)&v132 + 1) + 8 * i);
                    v25 = [v24 attributes];
                    v26 = [v25 objectForKey:@"label"];

                    if ([v26 length])
                    {
                      if (!v26) {
                        [MEMORY[0x263EFF940] raise:v116 format:@"The fieldTitleOrNil parameter must not be nil."];
                      }
                      v27 = v26;
                      v28 = objc_alloc_init(VSITMLCredentialEntryField);
                      v29 = [v24 attributes];
                      v30 = [v29 objectForKey:@"required"];

                      if (v30) {
                        [(VSCredentialEntryField *)v28 setRequired:1];
                      }

                      [(VSITMLCredentialEntryField *)v28 setAssociatedTextFieldElement:v24];
                      [(VSCredentialEntryField *)v28 setTitle:v27];
                      v31 = [v24 text];
                      v32 = [v31 string];

                      [(VSCredentialEntryField *)v28 setPlaceholder:v32];
                      v33 = [v24 attributes];
                      v34 = [v33 objectForKey:@"type"];

                      if ([v34 isEqualToString:@"emailAddress"])
                      {
                        uint64_t v35 = 7;
                        goto LABEL_29;
                      }
                      if ([v34 isEqualToString:@"numberPad"])
                      {
                        uint64_t v35 = 4;
LABEL_29:
                        [(VSCredentialEntryField *)v28 setKeyboardType:v35];
                      }
                      v36 = [v24 attributes];
                      v37 = [v36 objectForKey:@"secure"];

                      if (v37)
                      {
                        [(VSCredentialEntryField *)v28 setSecure:1];
                        [(VSCredentialEntryField *)v28 setKeyboardType:1];
                        [(VSCredentialEntryField *)v28 setAutocapitalizationType:0];
                      }
                      [(VSCredentialEntryField *)v28 setAutocorrectionType:1];
                      [v119 addObject:v28];

                      goto LABEL_33;
                    }
                    v27 = VSErrorLogObject();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                      -[VSCredentialEntryAppDocumentController _updateCredentialEntryViewModel:withTemplate:error:](&buf, v131, v27);
                    }
LABEL_33:
                  }
                  uint64_t v21 = [obj countByEnumeratingWithState:&v132 objects:v143 count:16];
                  if (!v21)
                  {
LABEL_35:
                    id v38 = v119;
                    if ([v119 count])
                    {
                      v39 = (void *)[v119 copy];
                      [v115 setCredentialEntryFields:v39];

                      v112 += [v119 count];
                    }
                    id v10 = v109;
                    long long v14 = self;
                    uint64_t v13 = v111;
                    uint64_t v12 = v113;
                    uint64_t v15 = v114;

                    goto LABEL_73;
                  }
                }
              }
            }
LABEL_51:
            uint64_t v15 = v114;
            goto LABEL_74;
          }
          v57 = [(VSCredentialEntryAppDocumentController *)v14 pickerElement];

          if (v57) {
            goto LABEL_51;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v63 = (void *)MEMORY[0x263EFF940];
            v64 = (objc_class *)objc_opt_class();
            v65 = NSStringFromClass(v64);
            [v63 raise:v116, @"Unexpectedly, childElement was %@, instead of VSIKItemGroupElement.", v65 format];
          }
          id v66 = v16;
          v67 = [MEMORY[0x263EFF980] array];
          v68 = [v66 attributes];
          v69 = [v68 objectForKey:@"title"];

          v120 = v66;
          if (v69)
          {
            id obja = v69;
            long long v126 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            v70 = [v66 children];
            uint64_t v71 = [v70 countByEnumeratingWithState:&v126 objects:v142 count:16];
            if (v71)
            {
              uint64_t v72 = v71;
              uint64_t v73 = *(void *)v127;
              do
              {
                for (uint64_t j = 0; j != v72; ++j)
                {
                  if (*(void *)v127 != v73) {
                    objc_enumerationMutation(v70);
                  }
                  v75 = *(void **)(*((void *)&v126 + 1) + 8 * j);
                  v76 = objc_alloc_init(VSCredentialEntryPickerItem);
                  v77 = [v75 text];
                  v78 = [v77 string];
                  [(VSCredentialEntryPickerItem *)v76 setItemName:v78];

                  v79 = [v75 attributes];
                  v80 = [v79 objectForKey:@"value"];

                  if (v80)
                  {
                    [(VSCredentialEntryPickerItem *)v76 setItemValue:v80];
                    v81 = [v75 elementID];
                    [(VSCredentialEntryPickerItem *)v76 setItemId:v81];

                    [v67 addObject:v76];
                  }
                }
                uint64_t v72 = [v70 countByEnumeratingWithState:&v126 objects:v142 count:16];
              }
              while (v72);
            }

            uint64_t v82 = objc_msgSend(v120, "vs_selectedChildElementIndex");
            if ([v67 count])
            {
              v83 = objc_alloc_init(VSCredentialEntryPicker);
              v84 = obja;
              [(VSCredentialEntryPicker *)v83 setTitle:obja];
              [(VSCredentialEntryPicker *)v83 setPickerItems:v67];
              [(VSCredentialEntryPicker *)v83 setSelectedIndex:v82];
              long long v14 = self;
              [(VSCredentialEntryAppDocumentController *)self setPickerElement:v120];
              v85 = [(VSCredentialEntryAppDocumentController *)self pickerElement];
              v86 = [v85 itemGroup];
              [v86 setSelectedItemIndex:v82];

              v87 = [(VSCredentialEntryAppDocumentController *)self pickerElement];
              v88 = [v87 itemGroup];
              [v88 setDelegate:self];

              [v115 setPicker:v83];
              ++v112;

              id v10 = v109;
              uint64_t v15 = v114;
            }
            else
            {
              id v10 = v109;
              long long v14 = self;
              uint64_t v15 = v114;
              v84 = obja;
            }
          }
          else
          {
            uint64_t v15 = v114;
          }

          uint64_t v13 = v111;
          uint64_t v12 = v113;
          id v38 = v120;
        }
LABEL_73:

LABEL_74:
        ++v15;
      }
      while (v15 != v12);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v136 objects:v144 count:16];
      if (!v12) {
        goto LABEL_80;
      }
    }
  }
  uint64_t v112 = 0;
  long long v14 = self;
LABEL_80:

  id v91 = objc_alloc_init(MEMORY[0x263EFF980]);
  v92 = (objc_class *)objc_opt_class();
  v93 = NSStringFromClass(v92);
  v141[0] = @"title";
  v141[1] = @"text";
  uint64_t v94 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:2];
  v95 = v14;
  v96 = (void *)v94;
  v125.receiver = v95;
  v125.super_class = (Class)VSCredentialEntryAppDocumentController;
  v97 = [(VSAppDocumentController *)&v125 _getSupportedButtonTextsforTemplate:v93 andElementKeys:v94 supportedCount:2];

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v98 = v97;
  uint64_t v99 = [v98 countByEnumeratingWithState:&v121 objects:v140 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v122;
    do
    {
      for (uint64_t k = 0; k != v100; ++k)
      {
        if (*(void *)v122 != v101) {
          objc_enumerationMutation(v98);
        }
        uint64_t v103 = *(void *)(*((void *)&v121 + 1) + 8 * k);
        v104 = objc_alloc_init(VSCredentialEntryButton);
        [(VSCredentialEntryButton *)v104 setTitle:v103];
        [(VSCredentialEntryButton *)v104 setOwningViewModel:v115];
        [v91 addObject:v104];
      }
      uint64_t v100 = [v98 countByEnumeratingWithState:&v121 objects:v140 count:16];
    }
    while (v100);
  }

  [v115 setButtons:v91];
  if (v112)
  {
    v105 = 0;
  }
  else
  {
    v105 = VSPrivateError();
  }
  if (v107) {
    id *v107 = v105;
  }

  return v105 == 0;
}

- (void)itemGroup:(id)a3 selectedItemIndexDidChange:(int64_t)a4
{
  id v6 = [(VSAppDocumentController *)self viewModel];

  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self viewModel] parameter must not be nil."];
  }
  id v12 = [(VSAppDocumentController *)self viewModel];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF4A0];
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v7 raise:v8, @"Unexpectedly, genericViewModel was %@, instead of VSCredentialEntryViewModel.", v10 format];
  }
  uint64_t v11 = [v12 picker];
  [v11 setSelectedIndex:a4];
}

- (void)viewModel:(id)a3 buttonTappedAtIndex:(unint64_t)a4
{
  id v6 = [(VSAppDocumentController *)self filteredButtonLockupElements];

  if (!v6) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self filteredButtonLockupElements] parameter must not be nil."];
  }
  id v7 = [(VSAppDocumentController *)self filteredButtonLockupElements];
  id v8 = [v7 objectAtIndex:a4];

  [v8 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
}

- (void)viewModel:(id)a3 pickerDidSelectRow:(unint64_t)a4
{
  id v6 = [(VSCredentialEntryAppDocumentController *)self pickerElement];
  id v7 = [v6 children];

  if (!v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [[self pickerElement] children] parameter must not be nil."];
  }
  id v8 = [(VSCredentialEntryAppDocumentController *)self pickerElement];
  id v9 = [v8 children];

  id v12 = [v9 objectAtIndex:a4];

  id v10 = [(VSCredentialEntryAppDocumentController *)self pickerElement];
  uint64_t v11 = [v10 itemGroup];
  [v11 setSelectedItemIndex:a4];

  [v12 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
}

- (VSIKItemGroupElement)pickerElement
{
  return self->_pickerElement;
}

- (void)setPickerElement:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_updateCredentialEntryViewModel:(uint8_t *)buf withTemplate:(unsigned char *)a2 error:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "Ignoring text element with empty title", buf, 2u);
}

@end