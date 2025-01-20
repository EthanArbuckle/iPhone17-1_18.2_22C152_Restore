@interface RUIPrivacyLinkContainerView
- (OBPrivacyLinkController)linkController;
- (RUIPrivacyLinkContainerView)initWithAttributes:(id)a3;
- (double)footerHeightForWidth:(double)a3 inView:(id)a4;
- (id)_viewController;
- (void)configureInPage:(id)a3;
- (void)didMoveToWindow;
@end

@implementation RUIPrivacyLinkContainerView

- (RUIPrivacyLinkContainerView)initWithAttributes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RUIPrivacyLinkContainerView;
  v6 = -[RUIPrivacyLinkContainerView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributes, a3);
  }

  return v7;
}

- (id)_viewController
{
  v2 = self;
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [(RUIPrivacyLinkContainerView *)v2 nextResponder];

      v2 = (RUIPrivacyLinkContainerView *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)didMoveToWindow
{
  [(OBPrivacyLinkController *)self->_linkController removeFromParentViewController];
  id v3 = [(RUIPrivacyLinkContainerView *)self _viewController];
  [v3 addChildViewController:self->_linkController];
  [(OBPrivacyLinkController *)self->_linkController didMoveToParentViewController:v3];
}

- (void)configureInPage:(id)a3
{
  v39[4] = *MEMORY[0x263EF8340];
  id v33 = a3;
  if (v33)
  {
    v4 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:@"privacyBundleIdentifier"];

    if (v4)
    {
      id v5 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:@"privacyBundleIdentifier"];
      v32 = [v5 componentsSeparatedByString:@", "];

      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2050000000;
      v6 = (void *)getOBPrivacyLinkControllerClass_softClass;
      uint64_t v38 = getOBPrivacyLinkControllerClass_softClass;
      if (!getOBPrivacyLinkControllerClass_softClass)
      {
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __getOBPrivacyLinkControllerClass_block_invoke;
        v34[3] = &unk_264211600;
        v34[4] = &v35;
        __getOBPrivacyLinkControllerClass_block_invoke((uint64_t)v34);
        v6 = (void *)v36[3];
      }
      id v7 = v6;
      _Block_object_dispose(&v35, 8);
      v8 = [v7 linkWithBundleIdentifiers:v32];
      linkController = self->_linkController;
      self->_linkController = v8;

      v10 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:@"hidePrivacyIcon"];
      int v11 = [v10 BOOLValue];

      if (v11)
      {
        [(OBPrivacyLinkController *)self->_linkController setDisplayIcon:0];
        [(OBPrivacyLinkController *)self->_linkController setDisplayCaptionText:0];
      }
      v12 = [(OBPrivacyLinkController *)self->_linkController view];
      [(RUIPrivacyLinkContainerView *)self addSubview:v12];

      v13 = [(OBPrivacyLinkController *)self->_linkController view];
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

      v24 = (void *)MEMORY[0x263F08938];
      v31 = [(OBPrivacyLinkController *)self->_linkController view];
      v30 = [v31 topAnchor];
      v29 = [(RUIPrivacyLinkContainerView *)self topAnchor];
      v28 = [v30 constraintEqualToAnchor:v29 constant:10.0];
      v39[0] = v28;
      v27 = [(OBPrivacyLinkController *)self->_linkController view];
      v25 = [v27 bottomAnchor];
      v26 = [(RUIPrivacyLinkContainerView *)self bottomAnchor];
      v14 = [v25 constraintEqualToAnchor:v26 constant:-10.0];
      v39[1] = v14;
      v15 = [(OBPrivacyLinkController *)self->_linkController view];
      v16 = [v15 leadingAnchor];
      v17 = [(RUIPrivacyLinkContainerView *)self leadingAnchor];
      v18 = [v16 constraintEqualToAnchor:v17];
      v39[2] = v18;
      v19 = [(OBPrivacyLinkController *)self->_linkController view];
      v20 = [v19 trailingAnchor];
      v21 = [(RUIPrivacyLinkContainerView *)self trailingAnchor];
      v22 = [v20 constraintEqualToAnchor:v21];
      v39[3] = v22;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
      [v24 activateConstraints:v23];
    }
  }
}

- (double)footerHeightForWidth:(double)a3 inView:(id)a4
{
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1112014848;
  -[RUIPrivacyLinkContainerView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4, a3, *(double *)(MEMORY[0x263F83810] + 8), v4, v5);
  return v6;
}

- (OBPrivacyLinkController)linkController
{
  return (OBPrivacyLinkController *)objc_getProperty(self, a2, 416, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkController, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end