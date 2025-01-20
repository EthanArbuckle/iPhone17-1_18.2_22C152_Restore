@interface SUSSoftwareUpdateLicenseViewController
- (NSString)licenseTextInfo;
- (SUSSoftwareUpdateLicenseViewController)initWithLicense:(id)a3;
- (UITextView)licenseTextView;
- (void)setLicenseText:(id)a3;
- (void)setLicenseTextInfo:(id)a3;
- (void)setLicenseTextView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SUSSoftwareUpdateLicenseViewController

- (SUSSoftwareUpdateLicenseViewController)initWithLicense:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)v10 + 128, location[0]);
  id v3 = v10;
  id v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)SUSSoftwareUpdateLicenseViewController;
  v7 = -[SUSSoftwareUpdateLicenseViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0);
  id v10 = v7;
  objc_storeStrong(&v10, v7);
  if (v7)
  {
    id v6 = (id)[v10 view];
    id v5 = (id)[MEMORY[0x263F825C8] systemBackgroundColor];
    objc_msgSend(v6, "setBackgroundColor:");

    v11 = (SUSSoftwareUpdateLicenseViewController *)v10;
  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v10, 0);
  return v11;
}

- (void)viewDidLoad
{
  v31[4] = *MEMORY[0x263EF8340];
  v30 = self;
  SEL v29 = a2;
  v28.receiver = self;
  v28.super_class = (Class)SUSSoftwareUpdateLicenseViewController;
  [(SUSSoftwareUpdateLicenseViewController *)&v28 viewDidLoad];
  id v2 = objc_alloc(MEMORY[0x263F82D60]);
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  licenseTextView = v30->_licenseTextView;
  v30->_licenseTextView = (UITextView *)v3;

  id v5 = v30->_licenseTextView;
  id v6 = (id)[MEMORY[0x263F81708] systemFontOfSize:13.0];
  -[UITextView setFont:](v5, "setFont:");

  [(UITextView *)v30->_licenseTextView setContentToHTMLString:v30->_licenseTextInfo];
  v7 = v30->_licenseTextView;
  id v8 = (id)[MEMORY[0x263F825C8] labelColor];
  -[UITextView setTextColor:](v7, "setTextColor:");

  [(UITextView *)v30->_licenseTextView setEditable:0];
  [(UITextView *)v30->_licenseTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)v30->_licenseTextView setAccessibilityIdentifier:@"SUSSoftwareUpdateLicenseViewControllerLicenseText"];
  id v9 = (id)[(SUSSoftwareUpdateLicenseViewController *)v30 view];
  [v9 addSubview:v30->_licenseTextView];

  -[UITextView setContentOffset:](v30->_licenseTextView, "setContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  id v10 = (id)[(SUSSoftwareUpdateLicenseViewController *)v30 view];
  id v27 = (id)[v10 safeAreaLayoutGuide];

  id v11 = (id)[(SUSSoftwareUpdateLicenseViewController *)v30 view];
  id v26 = (id)[v11 layoutMarginsGuide];

  id v13 = (id)[(UITextView *)v30->_licenseTextView leadingAnchor];
  id v12 = (id)[v26 leadingAnchor];
  id v25 = (id)objc_msgSend(v13, "constraintEqualToAnchor:constant:");

  id v15 = (id)[(UITextView *)v30->_licenseTextView trailingAnchor];
  id v14 = (id)[v26 trailingAnchor];
  id v24 = (id)objc_msgSend(v15, "constraintEqualToAnchor:constant:", 1.0);

  id v17 = (id)[(UITextView *)v30->_licenseTextView topAnchor];
  id v16 = (id)[v27 topAnchor];
  id v23 = (id)objc_msgSend(v17, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", 1.0);

  id v19 = (id)[v27 bottomAnchor];
  id v18 = (id)[(UITextView *)v30->_licenseTextView bottomAnchor];
  id v22 = (id)objc_msgSend(v19, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", 1.0);

  v20 = (void *)MEMORY[0x263F08938];
  v31[0] = v25;
  v31[1] = v24;
  v31[2] = v23;
  v31[3] = v22;
  id v21 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
  objc_msgSend(v20, "activateConstraints:");

  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
}

- (void)viewWillLayoutSubviews
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSSoftwareUpdateLicenseViewController;
  [(SUSSoftwareUpdateLicenseViewController *)&v2 viewWillLayoutSubviews];
}

- (void)setLicenseText:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_licenseTextInfo, location[0]);
  objc_storeStrong(location, 0);
}

- (NSString)licenseTextInfo
{
  return self->_licenseTextInfo;
}

- (void)setLicenseTextInfo:(id)a3
{
}

- (UITextView)licenseTextView
{
  return self->_licenseTextView;
}

- (void)setLicenseTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end