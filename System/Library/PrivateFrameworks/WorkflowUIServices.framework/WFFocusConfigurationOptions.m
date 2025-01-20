@interface WFFocusConfigurationOptions
- (BOOL)isEnabled;
- (BOOL)showsEnablementButton;
- (LNAction)action;
- (LNFocusConfigurationSuggestionContext)suggestionContext;
- (LNFullyQualifiedActionIdentifier)actionIdentifier;
- (NSArray)footerButtons;
- (WFFocusConfigurationOptions)initWithFocusConfigurationAction:(id)a3;
- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4;
- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5;
- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5 footerButtons:(id)a6;
- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5 footerButtons:(id)a6 showsEnablementButton:(BOOL)a7 isEnabled:(BOOL)a8;
@end

@implementation WFFocusConfigurationOptions

- (void).cxx_destruct
{
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

- (NSArray)footerButtons
{
  return self->_footerButtons;
}

- (LNFocusConfigurationSuggestionContext)suggestionContext
{
  return self->_suggestionContext;
}

- (LNAction)action
{
  return self->_action;
}

- (LNFullyQualifiedActionIdentifier)actionIdentifier
{
  return self->_actionIdentifier;
}

- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5 footerButtons:(id)a6
{
  return [(WFFocusConfigurationOptions *)self initWithFocusConfigurationActionIdentifier:a3 action:a4 suggestionContext:a5 footerButtons:a6 showsEnablementButton:0 isEnabled:1];
}

- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5
{
  return [(WFFocusConfigurationOptions *)self initWithFocusConfigurationActionIdentifier:a3 action:a4 suggestionContext:a5 footerButtons:MEMORY[0x263EFFA68]];
}

- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v8 = (void *)getLNFocusConfigurationSuggestionContextClass_softClass;
  uint64_t v17 = getLNFocusConfigurationSuggestionContextClass_softClass;
  if (!getLNFocusConfigurationSuggestionContextClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getLNFocusConfigurationSuggestionContextClass_block_invoke;
    v13[3] = &unk_2642A5AD8;
    v13[4] = &v14;
    __getLNFocusConfigurationSuggestionContextClass_block_invoke((uint64_t)v13);
    v8 = (void *)v15[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v14, 8);
  v10 = objc_opt_new();
  v11 = [(WFFocusConfigurationOptions *)self initWithFocusConfigurationActionIdentifier:v6 action:v7 suggestionContext:v10];

  return v11;
}

- (WFFocusConfigurationOptions)initWithFocusConfigurationAction:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF980];
  id v6 = [v4 identifier];
  id v7 = [v6 componentsSeparatedByString:@"."];
  v8 = [v5 arrayWithArray:v7];

  id v9 = [v8 lastObject];
  [v8 removeLastObject];
  v10 = [v8 componentsJoinedByString:@"."];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v11 = (void *)getLNFullyQualifiedActionIdentifierClass_softClass;
  uint64_t v20 = getLNFullyQualifiedActionIdentifierClass_softClass;
  if (!getLNFullyQualifiedActionIdentifierClass_softClass)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __getLNFullyQualifiedActionIdentifierClass_block_invoke;
    v16[3] = &unk_2642A5AD8;
    v16[4] = &v17;
    __getLNFullyQualifiedActionIdentifierClass_block_invoke((uint64_t)v16);
    v11 = (void *)v18[3];
  }
  v12 = v11;
  _Block_object_dispose(&v17, 8);
  v13 = (void *)[[v12 alloc] initWithActionIdentifier:v9 bundleIdentifier:v10];
  uint64_t v14 = [(WFFocusConfigurationOptions *)self initWithFocusConfigurationActionIdentifier:v13 action:v4];

  return v14;
}

- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5 footerButtons:(id)a6 showsEnablementButton:(BOOL)a7 isEnabled:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WFFocusConfigurationOptions;
  uint64_t v19 = [(WFFocusConfigurationOptions *)&v25 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_actionIdentifier, a3);
    uint64_t v21 = [v16 copy];
    action = v20->_action;
    v20->_action = (LNAction *)v21;

    objc_storeStrong((id *)&v20->_suggestionContext, a5);
    objc_storeStrong((id *)&v20->_footerButtons, a6);
    v20->_showsEnablementButton = a7;
    v20->_enabled = a8;
    v23 = v20;
  }

  return v20;
}

@end