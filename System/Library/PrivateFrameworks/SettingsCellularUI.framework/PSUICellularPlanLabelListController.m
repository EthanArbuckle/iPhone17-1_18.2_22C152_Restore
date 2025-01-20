@interface PSUICellularPlanLabelListController
- (NSArray)predefinedLabels;
- (NSString)validatedCustomLabelText;
- (PSUICellularPlanUniversalReference)planReference;
- (UITextField)textField;
- (id)getLogger;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dismissKeyboard;
- (void)setPlanReference:(id)a3;
- (void)setPredefinedLabels:(id)a3;
- (void)setTextField:(id)a3;
- (void)setValidatedCustomLabelText:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PSUICellularPlanLabelListController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PSUICellularPlanLabelListController;
  [(PSUICellularPlanLabelListController *)&v2 viewDidLoad];
}

- (void)willMoveToParentViewController:(id)a3
{
  v4 = [(PSUICellularPlanLabelListController *)self textField];
  int v5 = [v4 isFirstResponder];

  if (v5)
  {
    id v6 = [(PSUICellularPlanLabelListController *)self textField];
    [v6 resignFirstResponder];
  }
}

- (id)specifiers
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    int v5 = [(PSUICellularPlanLabelListController *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[PSUICellularPlanLabelListController specifiers]";
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s (re)loading specifiers", buf, 0xCu);
    }

    id v6 = objc_opt_new();
    if (!self->_planReference)
    {
      v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) propertyForKey:*MEMORY[0x263F5FFF0]];
      planReference = self->_planReference;
      self->_planReference = v7;

      v9 = [(PSUICellularPlanLabelListController *)self getLogger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_planReference;
        *(_DWORD *)buf = 138412290;
        v46 = (const char *)v10;
        _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "initializing label picker with plan reference: %@", buf, 0xCu);
      }
    }
    v11 = +[PSUICellularPlanManagerCache sharedInstance];
    v12 = [v11 planFromReference:self->_planReference];

    v13 = +[PSUICellularPlanManagerCache sharedInstance];
    uint64_t v14 = [v13 subscriptionContextForPlanItem:v12 cachedSubscriptionContexts:0];

    if (v14)
    {
      v15 = [v12 phoneNumber];
      uint64_t v16 = [v15 length];

      if (v16)
      {
        v17 = +[PSUICoreTelephonyCallCache sharedInstance];
        v18 = [v12 phoneNumber];
        v19 = [v17 localizedPhoneNumber:v18 context:v14];

        if (v19) {
          [(PSUICellularPlanLabelListController *)self setTitle:v19];
        }
      }
    }
    v38 = (void *)v14;
    v39 = v12;
    v20 = +[PSUICellularPlanManagerCache sharedInstance];
    v21 = [v20 predefinedLabels];
    predefinedLabels = self->_predefinedLabels;
    self->_predefinedLabels = v21;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v23 = self->_predefinedLabels;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v41;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = (void *)MEMORY[0x263F5FC40];
          v29 = [*(id *)(*((void *)&v40 + 1) + 8 * v27) label];
          v30 = [v28 preferenceSpecifierNamed:v29 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          [v6 addObject:v30];
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v25);
    }

    v31 = (void *)MEMORY[0x263F5FC40];
    v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v33 = [v32 localizedStringForKey:@"CUSTOM_LABEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    v34 = [v31 groupSpecifierWithName:v33];
    [v6 addObject:v34];

    v35 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:3 edit:0];
    [v6 addObject:v35];
    [MEMORY[0x263F67F00] logSpecifiers:v6 origin:@"[PSUICellularPlanLabelListController specifiers] end"];
    v36 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[PSUICellularPlanManagerCache sharedInstance];
  v9 = [v8 planFromReference:self->_planReference];

  if ([v7 section])
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1000 reuseIdentifier:@"customLabel"];
    v11 = [v9 userLabel];
    uint64_t v12 = [v11 indexInPredefinedLabels:self->_predefinedLabels];

    if (v12 == -1)
    {
      v20 = [(PSUICellularPlanLabelListController *)self getLogger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v9 userLabel];
        *(_DWORD *)buf = 138412290;
        v39 = v21;
        _os_log_impl(&dword_221B17000, v20, OS_LOG_TYPE_DEFAULT, "user label is not a predefined label, selecting custom label: %@", buf, 0xCu);
      }
      [v10 setAccessoryType:3];
      v22 = [v9 userLabel];
      v23 = [v22 label];
      uint64_t v24 = [v10 editableTextField];
      [v24 setText:v23];

      uint64_t v25 = [v9 userLabel];
      uint64_t v26 = [v25 label];
      validatedCustomLabelText = self->_validatedCustomLabelText;
      self->_validatedCustomLabelText = v26;
    }
    else
    {
      v13 = self->_validatedCustomLabelText;
      if (v13)
      {
        uint64_t v14 = [v10 editableTextField];
        [v14 setText:v13];

LABEL_14:
        v30 = [v10 editableTextField];
        [v30 setReturnKeyType:9];

        v31 = [v10 editableTextField];
        [v31 setClearButtonMode:1];

        v32 = [v10 editableTextField];
        [v32 setDelegate:self];

        v33 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
        v34 = [v10 editableTextField];
        [v34 setFont:v33];

        [v10 setSelectionStyle:0];
        [v10 setTextFieldOffset:0.01];
        v35 = [v10 editableTextField];
        objc_storeWeak((id *)&self->_textField, v35);

        goto LABEL_15;
      }
      uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v28 = [v25 localizedStringForKey:@"TYPE_LABEL_HERE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
      v29 = [v10 editableTextField];
      [v29 setPlaceholder:v28];
    }
    goto LABEL_14;
  }
  v37.receiver = self;
  v37.super_class = (Class)PSUICellularPlanLabelListController;
  v10 = [(PSUICellularPlanLabelListController *)&v37 tableView:v6 cellForRowAtIndexPath:v7];
  v15 = [v9 userLabel];
  uint64_t v16 = [v15 indexInPredefinedLabels:self->_predefinedLabels];
  uint64_t v17 = [v7 row];

  if (v16 == v17)
  {
    v18 = [(PSUICellularPlanLabelListController *)self getLogger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v9 userLabel];
      *(_DWORD *)buf = 138412290;
      v39 = v19;
      _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "user label found, selecting predefined label: %@", buf, 0xCu);
    }
    [v10 setAccessoryType:3];
  }
LABEL_15:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = +[PSUICellularPlanManagerCache sharedInstance];
  v9 = [v8 planFromReference:self->_planReference];

  v10 = [(PSUICellularPlanLabelListController *)self getLogger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "selected label at indexPath %@ for plan %@", (uint8_t *)&v16, 0x16u);
  }

  if (![v6 section])
  {
    v11 = +[PSUICellularPlanManagerCache sharedInstance];
    v13 = -[NSArray objectAtIndexedSubscript:](self->_predefinedLabels, "objectAtIndexedSubscript:", [v6 row]);
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    goto LABEL_7;
  }
  if (self->_validatedCustomLabelText)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F31990]) initWithLabel:self->_validatedCustomLabelText];
    uint64_t v12 = +[PSUICellularPlanManagerCache sharedInstance];
    v13 = v12;
    uint64_t v14 = v11;
LABEL_7:
    [v12 setLabel:v14 forPlan:v9];
  }
  [v7 deselectRowAtIndexPath:v6 animated:1];
  [v7 reloadData];

  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  [WeakRetained reloadSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) animated:1];
}

- (void)dismissKeyboard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  [WeakRetained resignFirstResponder];
}

- (void)textFieldDidEndEditing:(id)a3
{
  v4 = [a3 text];
  int v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id obj = [v4 stringByTrimmingCharactersInSet:v5];

  if ([obj length])
  {
    if ((unint64_t)[obj length] < 0x1F)
    {
      v11 = obj;
    }
    else
    {
      unint64_t v6 = [obj length];
      if (v6 >= 0x1E) {
        uint64_t v7 = 30;
      }
      else {
        uint64_t v7 = v6;
      }
      uint64_t v8 = objc_msgSend(obj, "rangeOfComposedCharacterSequencesForRange:", 0, v7);
      uint64_t v10 = objc_msgSend(obj, "substringWithRange:", v8, v9);

      v11 = (void *)v10;
    }
    id obj = v11;
    objc_storeStrong((id *)&self->_validatedCustomLabelText, v11);
    validatedCustomLabelText = (NSString *)[objc_alloc(MEMORY[0x263F31990]) initWithLabel:self->_validatedCustomLabelText];
    v13 = +[PSUICellularPlanManagerCache sharedInstance];
    uint64_t v14 = +[PSUICellularPlanManagerCache sharedInstance];
    v15 = [v14 planFromReference:self->_planReference];
    [v13 setLabel:validatedCustomLabelText forPlan:v15];

    [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) reloadData];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE78]));
    [WeakRetained reloadSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) animated:1];
  }
  else
  {
    validatedCustomLabelText = self->_validatedCustomLabelText;
    self->_validatedCustomLabelText = 0;
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularPlanLabelListController"];
}

- (NSArray)predefinedLabels
{
  return self->_predefinedLabels;
}

- (void)setPredefinedLabels:(id)a3
{
}

- (NSString)validatedCustomLabelText
{
  return self->_validatedCustomLabelText;
}

- (void)setValidatedCustomLabelText:(id)a3
{
}

- (UITextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  return (UITextField *)WeakRetained;
}

- (void)setTextField:(id)a3
{
}

- (PSUICellularPlanUniversalReference)planReference
{
  return self->_planReference;
}

- (void)setPlanReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planReference, 0);
  objc_destroyWeak((id *)&self->_textField);
  objc_storeStrong((id *)&self->_validatedCustomLabelText, 0);
  objc_storeStrong((id *)&self->_predefinedLabels, 0);
}

@end