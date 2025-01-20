@interface SearchUICreateContactHandler
- (BOOL)prefersContextMenu;
- (BOOL)prefersModalPresentation;
- (id)contactFromCommand;
- (id)createViewControllerForCommand:(id)a3 environment:(id)a4;
- (unint64_t)destination;
- (void)contactFromCommand;
@end

@implementation SearchUICreateContactHandler

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  if ([a3 addToExistingContact]) {
    v5 = SearchUIContactPickerViewController;
  }
  else {
    v5 = SearchUIContactViewNavigationController;
  }
  id v6 = [v5 alloc];
  v7 = [(SearchUICreateContactHandler *)self contactFromCommand];
  v8 = (void *)[v6 initWithContact:v7];

  v9 = (void *)MEMORY[0x1E4F1BBA0];
  v10 = [MEMORY[0x1E4F1BBA0] defaultStyle];
  [v9 setCurrentStyle:v10];

  return v8;
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (BOOL)prefersContextMenu
{
  return 0;
}

- (unint64_t)destination
{
  if ([MEMORY[0x1E4FAE198] isMacOS]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (id)contactFromCommand
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = [(SearchUICommandHandler *)self command];
  v3 = [v2 person];
  if (!v3)
  {
    v16 = SearchUITapLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SearchUICreateContactHandler contactFromCommand](v16);
    }
    v4 = 0;
    goto LABEL_23;
  }
  v4 = objc_opt_new();
  v5 = [v3 phoneNumbers];

  v25 = v4;
  if (v5)
  {
    v24 = v2;
    id v6 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v7 = [v3 phoneNumbers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)MEMORY[0x1E4F1BA20];
          v13 = objc_msgSend(MEMORY[0x1E4F1BA70], "phoneNumberWithStringValue:", *(void *)(*((void *)&v30 + 1) + 8 * i), v24);
          v14 = [v12 labeledValueWithLabel:0 value:v13];

          [v6 addObject:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
    }

    [v4 setPhoneNumbers:v6];
    v2 = v24;
  }
  v15 = objc_msgSend(v3, "emailAddresses", v24);

  if (v15)
  {
    v16 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v17 = [v3 emailAddresses];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:@"email" value:*(void *)(*((void *)&v26 + 1) + 8 * j)];
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    v4 = v25;
    [v25 setEmailAddresses:v16];
LABEL_23:
  }
  return v4;
}

- (void)contactFromCommand
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "Error performing SearchUICreateContactHandler: No person set in SFCreateContactCommand", v1, 2u);
}

@end