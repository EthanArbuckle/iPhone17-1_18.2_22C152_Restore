@interface WFFocusConfigurationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isValid;
- (BOOL)showsEnablementButton;
- (LNAction)action;
- (LNFocusConfigurationSuggestionContext)suggestionContext;
- (LNFullyQualifiedActionIdentifier)actionIdentifier;
- (NSArray)footerButtons;
- (WFColor)mastheadTintColor;
- (WFContextualAction)contextualAction;
- (WFFocusConfigurationRequest)initWithCoder:(id)a3;
- (WFFocusConfigurationRequest)initWithContextualAction:(id)a3 footerButtons:(id)a4 showsEnablementButton:(BOOL)a5 isEnabled:(BOOL)a6 mastheadTintColor:(id)a7;
- (WFFocusConfigurationRequest)initWithContextualActionOptions:(id)a3;
- (WFFocusConfigurationRequest)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5 footerButtons:(id)a6 showsEnablementButton:(BOOL)a7 isEnabled:(BOOL)a8;
- (WFFocusConfigurationRequest)initWithOptions:(id)a3;
- (unint64_t)mode;
- (void)encodeWithCoder:(id)a3;
- (void)loadFocusActionWithCompletion:(id)a3;
- (void)setAction:(id)a3;
@end

@implementation WFFocusConfigurationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualAction, 0);
  objc_storeStrong((id *)&self->_mastheadTintColor, 0);
  objc_storeStrong((id *)&self->_footerButtons, 0);
  objc_storeStrong((id *)&self->_suggestionContext, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)showsEnablementButton
{
  return self->_showsEnablementButton;
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (WFColor)mastheadTintColor
{
  return self->_mastheadTintColor;
}

- (NSArray)footerButtons
{
  return self->_footerButtons;
}

- (LNFocusConfigurationSuggestionContext)suggestionContext
{
  return self->_suggestionContext;
}

- (void)setAction:(id)a3
{
}

- (LNAction)action
{
  return self->_action;
}

- (LNFullyQualifiedActionIdentifier)actionIdentifier
{
  return self->_actionIdentifier;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", -[WFFocusConfigurationRequest mode](self, "mode"), @"mode");
  v4 = [(WFFocusConfigurationRequest *)self actionIdentifier];
  [v10 encodeObject:v4 forKey:@"actionIdentifier"];

  v5 = [(WFFocusConfigurationRequest *)self action];
  [v10 encodeObject:v5 forKey:@"action"];

  v6 = [(WFFocusConfigurationRequest *)self suggestionContext];
  [v10 encodeObject:v6 forKey:@"suggestionContext"];

  v7 = [(WFFocusConfigurationRequest *)self contextualAction];
  [v10 encodeObject:v7 forKey:@"contextualAction"];

  v8 = [(WFFocusConfigurationRequest *)self footerButtons];
  [v10 encodeObject:v8 forKey:@"footerButtons"];

  v9 = [(WFFocusConfigurationRequest *)self mastheadTintColor];
  [v10 encodeObject:v9 forKey:@"mastheadTintColor"];

  objc_msgSend(v10, "encodeBool:forKey:", -[WFFocusConfigurationRequest showsEnablementButton](self, "showsEnablementButton"), @"showsEnablementButton");
  objc_msgSend(v10, "encodeBool:forKey:", -[WFFocusConfigurationRequest isEnabled](self, "isEnabled"), @"isEnabled");
}

- (WFFocusConfigurationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"mode"];
  uint64_t v6 = [v4 decodeBoolForKey:@"showsEnablementButton"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isEnabled"];
  if (v5 == 1)
  {
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextualAction"];
    v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v24 = [v4 decodeObjectOfClasses:v23 forKey:@"footerButtons"];

    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mastheadTintColor"];
    self = [(WFFocusConfigurationRequest *)self initWithContextualAction:v10 footerButtons:v24 showsEnablementButton:v6 isEnabled:v7 mastheadTintColor:v25];
  }
  else
  {
    if (v5)
    {
      v26 = 0;
      goto LABEL_13;
    }
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v8 = (void *)getLNFullyQualifiedActionIdentifierClass_softClass_630;
    uint64_t v36 = getLNFullyQualifiedActionIdentifierClass_softClass_630;
    if (!getLNFullyQualifiedActionIdentifierClass_softClass_630)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __getLNFullyQualifiedActionIdentifierClass_block_invoke_631;
      v31 = &unk_2642A5AD8;
      v32 = &v33;
      __getLNFullyQualifiedActionIdentifierClass_block_invoke_631((uint64_t)&v28);
      v8 = (void *)v34[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v33, 8);
    id v10 = [v4 decodeObjectOfClass:v9 forKey:@"actionIdentifier"];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v11 = (void *)getLNActionClass_softClass;
    uint64_t v36 = getLNActionClass_softClass;
    if (!getLNActionClass_softClass)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __getLNActionClass_block_invoke;
      v31 = &unk_2642A5AD8;
      v32 = &v33;
      __getLNActionClass_block_invoke((uint64_t)&v28);
      v11 = (void *)v34[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v33, 8);
    v13 = [v4 decodeObjectOfClass:v12 forKey:@"action"];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2050000000;
    v14 = (void *)getLNFocusConfigurationSuggestionContextClass_softClass_632;
    uint64_t v36 = getLNFocusConfigurationSuggestionContextClass_softClass_632;
    if (!getLNFocusConfigurationSuggestionContextClass_softClass_632)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __getLNFocusConfigurationSuggestionContextClass_block_invoke_633;
      v31 = &unk_2642A5AD8;
      v32 = &v33;
      __getLNFocusConfigurationSuggestionContextClass_block_invoke_633((uint64_t)&v28);
      v14 = (void *)v34[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v33, 8);
    v16 = [v4 decodeObjectOfClass:v15 forKey:@"suggestionContext"];
    v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v20 = [v4 decodeObjectOfClasses:v19 forKey:@"footerButtons"];

    self = [(WFFocusConfigurationRequest *)self initWithFocusConfigurationActionIdentifier:v10 action:v13 suggestionContext:v16 footerButtons:v20 showsEnablementButton:v6 isEnabled:v7];
  }

  v26 = self;
LABEL_13:

  return v26;
}

- (void)loadFocusActionWithCompletion:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  unint64_t v5 = [(WFFocusConfigurationRequest *)self mode];
  if (v5 == 1) {
    goto LABEL_4;
  }
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v8 = WFLocalizedString(@"Invalid focus configuration request.");
    v27[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v10 = [v7 errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v9];
    v4[2](v4, v10);

    goto LABEL_9;
  }
  uint64_t v6 = [(WFFocusConfigurationRequest *)self action];

  if (v6)
  {
LABEL_4:
    v4[2](v4, 0);
  }
  else
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v11 = (void *)getLNActionDefaultValueProviderClass_softClass;
    uint64_t v25 = getLNActionDefaultValueProviderClass_softClass;
    if (!getLNActionDefaultValueProviderClass_softClass)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __getLNActionDefaultValueProviderClass_block_invoke;
      v21[3] = &unk_2642A5AD8;
      v21[4] = &v22;
      __getLNActionDefaultValueProviderClass_block_invoke((uint64_t)v21);
      v11 = (void *)v23[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v22, 8);
    id v13 = [v12 alloc];
    v14 = [(WFFocusConfigurationRequest *)self actionIdentifier];
    id v15 = (void *)[v13 initWithActionIdentifier:v14 actionMetadata:0];

    v16 = [(WFFocusConfigurationRequest *)self suggestionContext];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __61__WFFocusConfigurationRequest_loadFocusActionWithCompletion___block_invoke;
    v18[3] = &unk_2642A56D0;
    v18[4] = self;
    id v19 = v15;
    v20 = v4;
    id v17 = v15;
    [v17 loadSuggestedFocusActionsWithSuggestionContext:v16 completion:v18];
  }
LABEL_9:
}

void __61__WFFocusConfigurationRequest_loadFocusActionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 && v6)
  {
    v8 = getWFFocusConfigurationLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFFocusConfigurationRequest loadFocusActionWithCompletion:]_block_invoke";
      __int16 v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_2177E0000, v8, OS_LOG_TYPE_ERROR, "%s Failed to load suggested focus actions with error: %@", buf, 0x16u);
    }
  }
  id v9 = [v5 firstObject];
  if (v9)
  {
    [*(id *)(a1 + 32) setAction:v9];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__WFFocusConfigurationRequest_loadFocusActionWithCompletion___block_invoke_61;
    v11[3] = &unk_2642A56A8;
    id v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 48);
    [v10 loadDefaultValuesWithCompletionHandler:v11];
  }
}

void __61__WFFocusConfigurationRequest_loadFocusActionWithCompletion___block_invoke_61(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setAction:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isValid
{
  unint64_t v3 = [(WFFocusConfigurationRequest *)self mode];
  if (v3 == 1)
  {
    id v4 = [(WFFocusConfigurationRequest *)self contextualAction];
    BOOL v6 = v4 != 0;
LABEL_8:

    return v6;
  }
  if (!v3)
  {
    id v4 = [(WFFocusConfigurationRequest *)self actionIdentifier];
    if (v4)
    {
      id v5 = [(WFFocusConfigurationRequest *)self action];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
    goto LABEL_8;
  }
  return 0;
}

- (WFFocusConfigurationRequest)initWithContextualAction:(id)a3 footerButtons:(id)a4 showsEnablementButton:(BOOL)a5 isEnabled:(BOOL)a6 mastheadTintColor:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFFocusConfigurationRequest.m", 62, @"Invalid parameter not satisfying: %@", @"contextualAction" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"WFFocusConfigurationRequest.m", 63, @"Invalid parameter not satisfying: %@", @"footerButtons" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)WFFocusConfigurationRequest;
  uint64_t v17 = [(WFFocusConfigurationRequest *)&v23 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_mode = 1;
    objc_storeStrong((id *)&v17->_contextualAction, a3);
    objc_storeStrong((id *)&v18->_footerButtons, a4);
    v18->_showsEnablementButton = a5;
    v18->_enabled = a6;
    objc_storeStrong((id *)&v18->_mastheadTintColor, a7);
    id v19 = v18;
  }

  return v18;
}

- (WFFocusConfigurationRequest)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5 footerButtons:(id)a6 showsEnablementButton:(BOOL)a7 isEnabled:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WFFocusConfigurationRequest;
  id v19 = [(WFFocusConfigurationRequest *)&v25 init];
  v20 = v19;
  if (v19)
  {
    v19->_mode = 0;
    uint64_t v21 = [v16 copy];
    action = v20->_action;
    v20->_action = (LNAction *)v21;

    objc_storeStrong((id *)&v20->_actionIdentifier, a3);
    objc_storeStrong((id *)&v20->_suggestionContext, a5);
    objc_storeStrong((id *)&v20->_footerButtons, a6);
    v20->_showsEnablementButton = a7;
    v20->_enabled = a8;
    objc_super v23 = v20;
  }

  return v20;
}

- (WFFocusConfigurationRequest)initWithContextualActionOptions:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFFocusConfigurationRequest.m", 41, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  BOOL v6 = [v5 contextualAction];
  uint64_t v7 = [v5 footerButtons];
  uint64_t v8 = [v5 showsEnablementButton];
  uint64_t v9 = [v5 isEnabled];
  id v10 = [v5 mastheadTintColor];
  v11 = [(WFFocusConfigurationRequest *)self initWithContextualAction:v6 footerButtons:v7 showsEnablementButton:v8 isEnabled:v9 mastheadTintColor:v10];

  return v11;
}

- (WFFocusConfigurationRequest)initWithOptions:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFFocusConfigurationRequest.m", 36, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  BOOL v6 = [v5 actionIdentifier];
  uint64_t v7 = [v5 action];
  uint64_t v8 = [v5 suggestionContext];
  uint64_t v9 = [v5 footerButtons];
  id v10 = -[WFFocusConfigurationRequest initWithFocusConfigurationActionIdentifier:action:suggestionContext:footerButtons:showsEnablementButton:isEnabled:](self, "initWithFocusConfigurationActionIdentifier:action:suggestionContext:footerButtons:showsEnablementButton:isEnabled:", v6, v7, v8, v9, [v5 showsEnablementButton], objc_msgSend(v5, "isEnabled"));

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end