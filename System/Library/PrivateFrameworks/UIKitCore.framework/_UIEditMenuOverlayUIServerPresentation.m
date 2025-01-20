@interface _UIEditMenuOverlayUIServerPresentation
- (BOOL)canPresentEditMenu;
- (BOOL)wantsPasteTouchAuthenticationInEditMenuListView:(id)a3;
- (_UIOEditMenuPresentationConfiguration)presentationConfiguration;
- (_UIOServerActionOriginContext)originContext;
- (id)configureContainerViewWithConfiguration:(id)a3;
- (id)containerView;
- (int64_t)initialUserInterfaceStyle;
- (void)displayMenuForConfiguration:(id)a3 originContext:(id)a4 inDisplayDelegate:(id)a5;
- (void)teardownContainerView;
@end

@implementation _UIEditMenuOverlayUIServerPresentation

- (id)containerView
{
  return self->_menuContainerView;
}

- (BOOL)canPresentEditMenu
{
  return 1;
}

- (void)displayMenuForConfiguration:(id)a3 originContext:(id)a4 inDisplayDelegate:(id)a5
{
  v8 = (_UIOEditMenuPresentationConfiguration *)a3;
  v9 = (_UIOServerActionOriginContext *)a4;
  presentationConfiguration = self->_presentationConfiguration;
  self->_presentationConfiguration = v8;
  v11 = v8;
  id v12 = a5;

  originContext = self->_originContext;
  self->_originContext = v9;
  v14 = v9;

  objc_storeWeak((id *)&self->_displayDelegate, v12);
  v15 = [(_UIOEditMenuPresentationConfiguration *)v11 identifier];
  v16 = +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", v15, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  objc_msgSend(v16, "setPreferredArrowDirection:", -[_UIOEditMenuPresentationConfiguration preferredArrowDirection](v11, "preferredArrowDirection"));
  v17 = [(_UIOEditMenuPresentationConfiguration *)v11 menu];
  v18.receiver = self;
  v18.super_class = (Class)_UIEditMenuOverlayUIServerPresentation;
  [(_UIEditMenuContentPresentation *)&v18 displayMenu:v17 configuration:v16];
}

- (id)configureContainerViewWithConfiguration:(id)a3
{
  menuContainerView = self->_menuContainerView;
  if (!menuContainerView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_displayDelegate);
    v6 = [WeakRetained window];

    v7 = [[_UIEditMenuContainerView alloc] initWithPresentation:self enablePassthrough:1];
    [v6 bounds];
    -[_UIEditMenuContainerView setFrame:](v7, "setFrame:");
    [(UIView *)v7 setAutoresizingMask:18];
    [v6 addSubview:v7];
    v8 = self->_menuContainerView;
    self->_menuContainerView = v7;

    menuContainerView = self->_menuContainerView;
  }
  return menuContainerView;
}

- (void)teardownContainerView
{
  [(UIView *)self->_menuContainerView removeFromSuperview];
  menuContainerView = self->_menuContainerView;
  self->_menuContainerView = 0;
}

- (int64_t)initialUserInterfaceStyle
{
  return [(_UIOEditMenuPresentationConfiguration *)self->_presentationConfiguration initialUserInterfaceStyle];
}

- (BOOL)wantsPasteTouchAuthenticationInEditMenuListView:(id)a3
{
  return 0;
}

- (_UIOEditMenuPresentationConfiguration)presentationConfiguration
{
  return self->_presentationConfiguration;
}

- (_UIOServerActionOriginContext)originContext
{
  return self->_originContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originContext, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
  objc_destroyWeak((id *)&self->_displayDelegate);
  objc_storeStrong((id *)&self->_menuContainerView, 0);
}

@end