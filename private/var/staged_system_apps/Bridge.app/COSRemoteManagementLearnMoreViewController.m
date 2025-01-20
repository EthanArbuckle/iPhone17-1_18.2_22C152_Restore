@interface COSRemoteManagementLearnMoreViewController
+ (id)defaultParagraphTextAttributes;
- (COSRemoteManagementLearnMoreViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSString)organizationAddress;
- (NSString)organizationAddressLine1;
- (NSString)organizationAddressLine2;
- (NSString)organizationCity;
- (NSString)organizationCountry;
- (NSString)organizationDepartment;
- (NSString)organizationName;
- (NSString)organizationRegion;
- (NSString)organizationSupportEmail;
- (NSString)organizationSupportPhone;
- (NSString)organizationZipCode;
- (id)_descriptionText;
- (void)controllerDone:(id)a3;
- (void)setOrganizationAddress:(id)a3;
- (void)setOrganizationAddressLine1:(id)a3;
- (void)setOrganizationAddressLine2:(id)a3;
- (void)setOrganizationCity:(id)a3;
- (void)setOrganizationCountry:(id)a3;
- (void)setOrganizationDepartment:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setOrganizationRegion:(id)a3;
- (void)setOrganizationSupportEmail:(id)a3;
- (void)setOrganizationSupportPhone:(id)a3;
- (void)setOrganizationZipCode:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSRemoteManagementLearnMoreViewController

+ (id)defaultParagraphTextAttributes
{
  if (qword_10029B2E8 != -1) {
    dispatch_once(&qword_10029B2E8, &stru_1002477F0);
  }
  v2 = (void *)qword_10029B2E0;

  return v2;
}

- (COSRemoteManagementLearnMoreViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v51.receiver = self;
  v51.super_class = (Class)COSRemoteManagementLearnMoreViewController;
  v4 = [(COSRemoteManagementLearnMoreViewController *)&v51 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)UIScrollView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
    containerView = v4->_containerView;
    v4->_containerView = v9;

    [(UIScrollView *)v4->_containerView setScrollEnabled:1];
    [(UIScrollView *)v4->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = BPSBackgroundColor();
    [(UIScrollView *)v4->_containerView setBackgroundColor:v11];

    v12 = [(COSRemoteManagementLearnMoreViewController *)v4 view];
    [v12 addSubview:v4->_containerView];

    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = v13;

    v15 = v4->_descriptionLabel;
    v16 = BPSTextColor();
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)v4->_descriptionLabel setNumberOfLines:0];
    [(UILabel *)v4->_descriptionLabel setTextAlignment:1];
    [(UILabel *)v4->_descriptionLabel setLineBreakMode:0];
    [(UILabel *)v4->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = +[UIScreen mainScreen];
    [v17 bounds];
    [(UILabel *)v4->_descriptionLabel setPreferredMaxLayoutWidth:v18 + -36.0];

    [(UIScrollView *)v4->_containerView addSubview:v4->_descriptionLabel];
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"REMOTE_MANAGEMENT_TITLE" value:&stru_100249230 table:@"Localizable-yorktown"];
    [(COSRemoteManagementLearnMoreViewController *)v4 setTitle:v20];

    v49 = [(UIScrollView *)v4->_containerView leadingAnchor];
    v50 = [(COSRemoteManagementLearnMoreViewController *)v4 view];
    v48 = [v50 leadingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v52[0] = v47;
    v45 = [(UIScrollView *)v4->_containerView trailingAnchor];
    v46 = [(COSRemoteManagementLearnMoreViewController *)v4 view];
    v44 = [v46 trailingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v52[1] = v43;
    v41 = [(UIScrollView *)v4->_containerView topAnchor];
    v42 = [(COSRemoteManagementLearnMoreViewController *)v4 view];
    v40 = [v42 topAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v52[2] = v39;
    v37 = [(UIScrollView *)v4->_containerView bottomAnchor];
    v38 = [(COSRemoteManagementLearnMoreViewController *)v4 view];
    v36 = [v38 bottomAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v52[3] = v35;
    v34 = [(UILabel *)v4->_descriptionLabel leadingAnchor];
    v33 = [(UIScrollView *)v4->_containerView leadingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:18.0];
    v52[4] = v32;
    v31 = [(UILabel *)v4->_descriptionLabel trailingAnchor];
    v21 = [(UIScrollView *)v4->_containerView trailingAnchor];
    v22 = [v31 constraintEqualToAnchor:v21 constant:-18.0];
    v52[5] = v22;
    v23 = [(UILabel *)v4->_descriptionLabel topAnchor];
    v24 = [(UIScrollView *)v4->_containerView topAnchor];
    v25 = [v23 constraintEqualToAnchor:v24 constant:57.0];
    v52[6] = v25;
    v26 = [(UILabel *)v4->_descriptionLabel bottomAnchor];
    v27 = [(UIScrollView *)v4->_containerView bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:-57.0];
    v52[7] = v28;
    v29 = +[NSArray arrayWithObjects:v52 count:8];
    +[NSLayoutConstraint activateConstraints:v29];
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)COSRemoteManagementLearnMoreViewController;
  [(COSRemoteManagementLearnMoreViewController *)&v11 viewWillAppear:a3];
  id v4 = objc_alloc((Class)UIBarButtonItem);
  id v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"DONE" value:&stru_100249230 table:@"Localizable-yorktown"];
  id v7 = [v4 initWithTitle:v6 style:2 target:self action:"controllerDone:"];

  v8 = [(COSRemoteManagementLearnMoreViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  v9 = [(COSRemoteManagementLearnMoreViewController *)self _descriptionText];
  if (self)
  {
    [(UILabel *)self->_descriptionLabel setAttributedText:v9];

    descriptionLabel = self->_descriptionLabel;
  }
  else
  {
    [0 setAttributedText:v9];

    descriptionLabel = 0;
  }
  [(UILabel *)descriptionLabel sizeToFit];
}

- (void)controllerDone:(id)a3
{
}

- (id)_descriptionText
{
  v3 = objc_opt_new();
  id v4 = BPSDefaultDetailTextAttributes();
  id v5 = BPSDefaultTitleTextAttributes();
  id v6 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n" attributes:v4];
  id v7 = [(COSRemoteManagementLearnMoreViewController *)self organizationName];

  if (v7)
  {
    id v8 = objc_alloc((Class)NSMutableAttributedString);
    v9 = [(COSRemoteManagementLearnMoreViewController *)self organizationName];
    id v10 = [v8 initWithString:v9 attributes:v5];
    [v3 appendAttributedString:v10];

    [v3 appendAttributedString:v6];
  }
  objc_super v11 = [(COSRemoteManagementLearnMoreViewController *)self organizationDepartment];

  if (v11)
  {
    id v12 = objc_alloc((Class)NSMutableAttributedString);
    v13 = [(COSRemoteManagementLearnMoreViewController *)self organizationDepartment];
    id v14 = [v12 initWithString:v13 attributes:v4];
    [v3 appendAttributedString:v14];

    [v3 appendAttributedString:v6];
  }
  v15 = objc_opt_new();
  v16 = [(COSRemoteManagementLearnMoreViewController *)self organizationAddressLine1];
  [v15 setValue:v16 forKey:CNPostalAddressStreetKey];

  v17 = [(COSRemoteManagementLearnMoreViewController *)self organizationAddressLine2];
  [v15 setValue:v17 forKey:CNPostalAddressSubLocalityKey];

  double v18 = [(COSRemoteManagementLearnMoreViewController *)self organizationCity];
  [v15 setValue:v18 forKey:CNPostalAddressCityKey];

  v19 = [(COSRemoteManagementLearnMoreViewController *)self organizationRegion];
  [v15 setValue:v19 forKey:CNPostalAddressStateKey];

  v20 = [(COSRemoteManagementLearnMoreViewController *)self organizationZipCode];
  [v15 setValue:v20 forKey:CNPostalAddressPostalCodeKey];

  v21 = [(COSRemoteManagementLearnMoreViewController *)self organizationCountry];
  [v15 setValue:v21 forKey:CNPostalAddressCountryKey];

  v56 = v15;
  uint64_t v22 = +[CNPostalAddress postalAddressWithDictionaryRepresentation:v15];
  v55 = (void *)v22;
  if (!v22)
  {
LABEL_9:
    v25 = [(COSRemoteManagementLearnMoreViewController *)self organizationAddress];

    if (!v25) {
      goto LABEL_19;
    }
    v26 = objc_opt_new();
    v27 = [(COSRemoteManagementLearnMoreViewController *)self organizationAddress];
    v23 = [v26 postalAddressFromString:v27];

    v54 = v5;
    if (v23)
    {
      v28 = +[CNPostalAddressFormatter stringFromPostalAddress:v23 style:0];
      id v29 = objc_alloc((Class)NSAttributedString);
      v30 = v4;
      if (v28)
      {
        int v31 = 0;
        v32 = v28;
LABEL_15:
        id v33 = [v29 initWithString:v32 attributes:v30];
        [v3 appendAttributedString:v33];

        if (v31) {
        [v3 appendAttributedString:v6];
        }

        id v4 = v30;
        id v5 = v54;
        goto LABEL_18;
      }
    }
    else
    {
      v30 = v4;
      id v29 = objc_alloc((Class)NSAttributedString);
    }
    v32 = [(COSRemoteManagementLearnMoreViewController *)self organizationAddress];
    v28 = 0;
    int v31 = 1;
    goto LABEL_15;
  }
  v23 = +[CNPostalAddressFormatter stringFromPostalAddress:v22 style:0];
  if (![v23 length])
  {

    goto LABEL_9;
  }
  id v24 = [objc_alloc((Class)NSAttributedString) initWithString:v23 attributes:v4];
  [v3 appendAttributedString:v24];

  [v3 appendAttributedString:v6];
LABEL_18:

LABEL_19:
  v34 = [(COSRemoteManagementLearnMoreViewController *)self organizationSupportPhone];

  if (v34)
  {
    id v35 = objc_alloc((Class)NSMutableAttributedString);
    v36 = [(COSRemoteManagementLearnMoreViewController *)self organizationSupportPhone];
    id v37 = [v35 initWithString:v36 attributes:v4];
    [v3 appendAttributedString:v37];

    [v3 appendAttributedString:v6];
  }
  v38 = [(COSRemoteManagementLearnMoreViewController *)self organizationSupportEmail];

  if (v38)
  {
    id v39 = objc_alloc((Class)NSMutableAttributedString);
    v40 = [(COSRemoteManagementLearnMoreViewController *)self organizationSupportEmail];
    id v41 = [v39 initWithString:v40 attributes:v4];
    [v3 appendAttributedString:v41];

    [v3 appendAttributedString:v6];
  }
  [v3 appendAttributedString:v6];
  [v3 appendAttributedString:v6];
  v42 = [(COSRemoteManagementLearnMoreViewController *)self organizationName];

  if (v42)
  {
    id v43 = objc_alloc((Class)NSMutableAttributedString);
    v44 = +[NSBundle mainBundle];
    v45 = [v44 localizedStringForKey:@"REMOTE_MANAGEMENT_ABOUT_DESCRIPTION_%@" value:&stru_100249230 table:@"Localizable-yorktown"];
    [(COSRemoteManagementLearnMoreViewController *)self organizationName];
    id v46 = v6;
    v47 = v5;
    v49 = v48 = v4;
    v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v45, v49);
    objc_super v51 = [(id)objc_opt_class() defaultParagraphTextAttributes];
    id v52 = [v43 initWithString:v50 attributes:v51];
    [v3 appendAttributedString:v52];

    id v4 = v48;
    id v5 = v47;
    id v6 = v46;

    [v3 appendAttributedString:v46];
  }

  return v3;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)organizationDepartment
{
  return self->_organizationDepartment;
}

- (void)setOrganizationDepartment:(id)a3
{
}

- (NSString)organizationAddress
{
  return self->_organizationAddress;
}

- (void)setOrganizationAddress:(id)a3
{
}

- (NSString)organizationAddressLine1
{
  return self->_organizationAddressLine1;
}

- (void)setOrganizationAddressLine1:(id)a3
{
}

- (NSString)organizationAddressLine2
{
  return self->_organizationAddressLine2;
}

- (void)setOrganizationAddressLine2:(id)a3
{
}

- (NSString)organizationCity
{
  return self->_organizationCity;
}

- (void)setOrganizationCity:(id)a3
{
}

- (NSString)organizationRegion
{
  return self->_organizationRegion;
}

- (void)setOrganizationRegion:(id)a3
{
}

- (NSString)organizationZipCode
{
  return self->_organizationZipCode;
}

- (void)setOrganizationZipCode:(id)a3
{
}

- (NSString)organizationCountry
{
  return self->_organizationCountry;
}

- (void)setOrganizationCountry:(id)a3
{
}

- (NSString)organizationSupportPhone
{
  return self->_organizationSupportPhone;
}

- (void)setOrganizationSupportPhone:(id)a3
{
}

- (NSString)organizationSupportEmail
{
  return self->_organizationSupportEmail;
}

- (void)setOrganizationSupportEmail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_organizationSupportEmail, 0);
  objc_storeStrong((id *)&self->_organizationSupportPhone, 0);
  objc_storeStrong((id *)&self->_organizationCountry, 0);
  objc_storeStrong((id *)&self->_organizationZipCode, 0);
  objc_storeStrong((id *)&self->_organizationRegion, 0);
  objc_storeStrong((id *)&self->_organizationCity, 0);
  objc_storeStrong((id *)&self->_organizationAddressLine2, 0);
  objc_storeStrong((id *)&self->_organizationAddressLine1, 0);
  objc_storeStrong((id *)&self->_organizationAddress, 0);
  objc_storeStrong((id *)&self->_organizationDepartment, 0);

  objc_storeStrong((id *)&self->_organizationName, 0);
}

@end