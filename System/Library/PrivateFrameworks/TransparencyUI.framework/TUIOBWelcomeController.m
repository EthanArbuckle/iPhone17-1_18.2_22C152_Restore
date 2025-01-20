@interface TUIOBWelcomeController
- (NSString)helpLinkURL;
- (OBTrayButton)primaryButton;
- (OBTrayButton)secondaryButton;
- (TUIOBWelcomeController)initWithViewModel:(id)a3;
- (void)_addContentViewWithViewModel:(id)a3;
- (void)_addHelpLinkButtonWithViewModel:(id)a3;
- (void)_addPrimaryButtonWithViewModel:(id)a3;
- (void)_addSecondaryButtonWithViewModel:(id)a3;
- (void)_openHelpLink;
- (void)setHelpLinkURL:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation TUIOBWelcomeController

- (TUIOBWelcomeController)initWithViewModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = [v4 detailText];
  v7 = [v4 symbolName];
  v10.receiver = self;
  v10.super_class = (Class)TUIOBWelcomeController;
  v8 = -[TUIOBWelcomeController initWithTitle:detailText:symbolName:contentLayout:](&v10, sel_initWithTitle_detailText_symbolName_contentLayout_, v5, v6, v7, [v4 contentViewLayout]);

  if (v8)
  {
    [(TUIOBWelcomeController *)v8 _addContentViewWithViewModel:v4];
    [(TUIOBWelcomeController *)v8 _addPrimaryButtonWithViewModel:v4];
    [(TUIOBWelcomeController *)v8 _addSecondaryButtonWithViewModel:v4];
    [(TUIOBWelcomeController *)v8 _addHelpLinkButtonWithViewModel:v4];
  }

  return v8;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TUIOBWelcomeController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  [(TUIOBWelcomeController *)self setModalInPresentation:1];
}

- (void)_addContentViewWithViewModel:(id)a3
{
  v30[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 contentViewController];

  if (v5)
  {
    v6 = [v4 contentViewController];
    [(TUIOBWelcomeController *)self addChildViewController:v6];

    [v4 contentViewController];
    v7 = v29 = v4;
    v8 = [v7 view];

    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(TUIOBWelcomeController *)self contentView];
    [v9 addSubview:v8];

    v21 = (void *)MEMORY[0x263F08938];
    v27 = [v8 leadingAnchor];
    v28 = [(TUIOBWelcomeController *)self contentView];
    v26 = [v28 leadingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v30[0] = v25;
    v23 = [v8 trailingAnchor];
    v24 = [(TUIOBWelcomeController *)self contentView];
    v22 = [v24 trailingAnchor];
    v20 = [v23 constraintEqualToAnchor:v22];
    v30[1] = v20;
    v19 = [v8 topAnchor];
    objc_super v10 = [(TUIOBWelcomeController *)self contentView];
    v11 = [v10 topAnchor];
    v12 = [v19 constraintEqualToAnchor:v11];
    v30[2] = v12;
    v13 = [v8 bottomAnchor];
    v14 = [(TUIOBWelcomeController *)self contentView];
    v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v30[3] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
    [v21 activateConstraints:v17];

    id v4 = v29;
    v18 = [v29 contentViewController];
    [v18 didMoveToParentViewController:self];
  }
}

- (void)_addPrimaryButtonWithViewModel:(id)a3
{
  id v10 = a3;
  id v4 = [v10 primaryButton];

  if (v4)
  {
    v5 = [MEMORY[0x263F5B898] boldButton];
    primaryButton = self->_primaryButton;
    self->_primaryButton = v5;

    v7 = self->_primaryButton;
    v8 = [v10 primaryButton];
    [(OBTrayButton *)v7 setTitle:v8 forState:0];

    v9 = [(TUIOBWelcomeController *)self buttonTray];
    [v9 addButton:self->_primaryButton];
  }
}

- (void)_addSecondaryButtonWithViewModel:(id)a3
{
  id v10 = a3;
  id v4 = [v10 secondaryButton];

  if (v4)
  {
    v5 = [MEMORY[0x263F5B8D0] linkButton];
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = v5;

    v7 = self->_secondaryButton;
    v8 = [v10 secondaryButton];
    [(OBTrayButton *)v7 setTitle:v8 forState:0];

    v9 = [(TUIOBWelcomeController *)self buttonTray];
    [v9 addButton:self->_secondaryButton];
  }
}

- (void)_addHelpLinkButtonWithViewModel:(id)a3
{
  id v10 = a3;
  id v4 = [v10 helpLinkTitle];

  if (v4)
  {
    v5 = [v10 helpLinkURL];
    helpLinkURL = self->_helpLinkURL;
    self->_helpLinkURL = v5;

    v7 = [MEMORY[0x263F5B8B8] accessoryButton];
    v8 = [v10 helpLinkTitle];
    [v7 setTitle:v8 forState:0];

    [v7 addTarget:self action:sel__openHelpLink forControlEvents:64];
    v9 = [(TUIOBWelcomeController *)self headerView];
    [v9 addAccessoryButton:v7];
  }
}

- (void)_openHelpLink
{
  id v2 = [NSURL URLWithString:self->_helpLinkURL];
  [(id)*MEMORY[0x263F1D020] openURL:v2 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (OBTrayButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (OBTrayButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
}

@end