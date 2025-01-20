@interface SearchUIShowContactCardHandler
+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4;
- (id)createViewControllerForCommand:(id)a3 environment:(id)a4;
- (unint64_t)destination;
@end

@implementation SearchUIShowContactCardHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  id v4 = a3;
  v5 = [v4 contactIdentifiers];
  if (v5)
  {
    v6 = [v4 cardSection];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v5 = 0;
    }
    else
    {
      v5 = objc_opt_new();
      v8 = [v4 contactIdentifiers];
      v9 = [v8 firstObject];
      [v5 setContactIdentifier:v9];
    }
  }

  return v5;
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v4 = a3;
  v5 = [v4 contactIdentifier];
  v6 = +[SearchUIContactCache sharedCache];
  v7 = [v6 contactForContactViewController:v5];
  if (v7)
  {
    if ([v4 isSuggestedContact]) {
      +[SearchUIContactViewController viewControllerForUnknownContact:v7];
    }
    else {
    v9 = +[SearchUIContactViewController viewControllerForContact:v7];
    }
    v10 = (void *)MEMORY[0x1E4F1BBA0];
    v11 = [MEMORY[0x1E4F1BBA0] spotlightStyle];
    [v10 setCurrentStyle:v11];

    objc_msgSend(v9, "setActions:", objc_msgSend(v9, "actions") | 0x400);
    [v9 setAllowsDisplayModePickerActions:0];
    [v9 setAllowsEditPhoto:0];
    v12 = [v6 contactStore];
    [v9 setContactStore:v12];

    [v9 setTitle:&stru_1F40279D8];
    [v9 setAllowsEditing:0];
  }
  else
  {
    v8 = SearchUITapLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SearchUIShowContactCardHandler createViewControllerForCommand:environment:]((uint64_t)v5, v8);
    }

    v9 = 0;
  }

  return v9;
}

- (unint64_t)destination
{
  return 1;
}

- (void)createViewControllerForCommand:(uint64_t)a1 environment:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "couldnt find contact for identifier %@", (uint8_t *)&v2, 0xCu);
}

@end