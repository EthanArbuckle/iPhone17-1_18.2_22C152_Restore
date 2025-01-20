@interface WFFocusConfigurationContextualActionOptions
- (BOOL)isEnabled;
- (BOOL)showsEnablementButton;
- (NSArray)footerButtons;
- (WFColor)mastheadTintColor;
- (WFContextualAction)contextualAction;
- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3;
- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3 footerButtons:(id)a4;
- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3 footerButtons:(id)a4 showsEnablementButton:(BOOL)a5 isEnabled:(BOOL)a6;
- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3 footerButtons:(id)a4 showsEnablementButton:(BOOL)a5 isEnabled:(BOOL)a6 mastheadTintColor:(id)a7;
@end

@implementation WFFocusConfigurationContextualActionOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mastheadTintColor, 0);
  objc_storeStrong((id *)&self->_footerButtons, 0);
  objc_storeStrong((id *)&self->_contextualAction, 0);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)showsEnablementButton
{
  return self->_showsEnablementButton;
}

- (WFColor)mastheadTintColor
{
  return self->_mastheadTintColor;
}

- (NSArray)footerButtons
{
  return self->_footerButtons;
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3
{
  return [(WFFocusConfigurationContextualActionOptions *)self initWithContextualAction:a3 footerButtons:MEMORY[0x263EFFA68]];
}

- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3 footerButtons:(id)a4
{
  return [(WFFocusConfigurationContextualActionOptions *)self initWithContextualAction:a3 footerButtons:a4 showsEnablementButton:0 isEnabled:1];
}

- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3 footerButtons:(id)a4 showsEnablementButton:(BOOL)a5 isEnabled:(BOOL)a6
{
  return [(WFFocusConfigurationContextualActionOptions *)self initWithContextualAction:a3 footerButtons:a4 showsEnablementButton:a5 isEnabled:a6 mastheadTintColor:0];
}

- (WFFocusConfigurationContextualActionOptions)initWithContextualAction:(id)a3 footerButtons:(id)a4 showsEnablementButton:(BOOL)a5 isEnabled:(BOOL)a6 mastheadTintColor:(id)a7
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
    [v21 handleFailureInMethod:a2, self, @"WFFocusConfigurationOptions.m", 63, @"Invalid parameter not satisfying: %@", @"contextualAction" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"WFFocusConfigurationOptions.m", 64, @"Invalid parameter not satisfying: %@", @"footerButtons" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)WFFocusConfigurationContextualActionOptions;
  v17 = [(WFFocusConfigurationContextualActionOptions *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contextualAction, a3);
    objc_storeStrong((id *)&v18->_footerButtons, a4);
    v18->_showsEnablementButton = a5;
    v18->_enabled = a6;
    objc_storeStrong((id *)&v18->_mastheadTintColor, a7);
    v19 = v18;
  }

  return v18;
}

@end