@interface COSMLCaptureDisclosureView
- (COSMLCaptureDisclosureView)initWithFrame:(CGRect)a3;
- (UILabel)descriptionText;
- (UISwitch)disclosureToggle;
- (UITapGestureRecognizer)tapRecognizer;
- (UIViewController)parentController;
- (void)layoutSubviews;
- (void)setDescriptionText:(id)a3;
- (void)setDisclosureToggle:(id)a3;
- (void)setParentController:(id)a3;
- (void)setTapRecognizer:(id)a3;
- (void)tappedLearnMore:(id)a3;
- (void)userToggledSwitch:(id)a3;
@end

@implementation COSMLCaptureDisclosureView

- (COSMLCaptureDisclosureView)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)COSMLCaptureDisclosureView;
  v3 = -[COSMLCaptureDisclosureView initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor colorWithWhite:0.7 alpha:0.45];
    [(COSMLCaptureDisclosureView *)v3 setBackgroundColor:v4];

    v5 = (UISwitch *)objc_alloc_init((Class)UISwitch);
    disclosureToggle = v3->_disclosureToggle;
    v3->_disclosureToggle = v5;

    [(UISwitch *)v3->_disclosureToggle addTarget:v3 action:"userToggledSwitch:" forControlEvents:4096];
    [(UISwitch *)v3->_disclosureToggle setOn:+[COSMLCaptureDisclosureController disclosureEffectivelyAccepted]];
    v7 = +[COSInternalUserStudyAssetManager detailBundle];
    v8 = [v7 localizedStringForKey:@"CAPTURE_DISCLOSURE" value:&stru_100249230 table:@"User_Study"];

    v30[0] = NSFontAttributeName;
    v9 = +[UIFont systemFontOfSize:14.0];
    v31[0] = v9;
    v30[1] = NSForegroundColorAttributeName;
    v10 = +[UIColor whiteColor];
    v31[1] = v10;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

    v26 = (void *)v11;
    id v12 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v8 attributes:v11];
    v13 = +[COSInternalUserStudyAssetManager detailBundle];
    v14 = [v13 localizedStringForKey:@"CAPTURE_DISCLOSURE_LINK" value:&stru_100249230 table:@"User_Study"];
    id v15 = [v8 rangeOfString:v14 options:5];
    uint64_t v17 = v16;

    if (v17)
    {
      v28[0] = NSFontAttributeName;
      v18 = +[UIFont systemFontOfSize:14.0];
      v28[1] = NSForegroundColorAttributeName;
      v29[0] = v18;
      v19 = BPSBridgeTintColor();
      v29[1] = v19;
      v20 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

      [v12 setAttributes:v20 range:v15];
    }
    v21 = (UILabel *)objc_alloc_init((Class)UILabel);
    descriptionText = v3->_descriptionText;
    v3->_descriptionText = v21;

    [(UILabel *)v3->_descriptionText setAttributedText:v12];
    [(UILabel *)v3->_descriptionText setNumberOfLines:0];
    [(UILabel *)v3->_descriptionText setUserInteractionEnabled:1];
    v23 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"tappedLearnMore:"];
    tapRecognizer = v3->_tapRecognizer;
    v3->_tapRecognizer = v23;

    [(UILabel *)v3->_descriptionText addGestureRecognizer:v3->_tapRecognizer];
    [(COSMLCaptureDisclosureView *)v3 addSubview:v3->_disclosureToggle];
    [(COSMLCaptureDisclosureView *)v3 addSubview:v3->_descriptionText];
  }
  return v3;
}

- (void)userToggledSwitch:(id)a3
{
  id v3 = [a3 isOn];

  +[COSMLCaptureDisclosureController setUserAcceptedDisclosure:v3];
}

- (void)layoutSubviews
{
  [(COSMLCaptureDisclosureView *)self frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UISwitch sizeThatFits:](self->_disclosureToggle, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v12 = v11;
  double v14 = v13;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  CGFloat v15 = CGRectGetWidth(v24) - v12 + -20.0;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  float v16 = (CGRectGetHeight(v25) - v14) * 0.5;
  -[UISwitch setFrame:](self->_disclosureToggle, "setFrame:", v15, floorf(v16), v12, v14);
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  -[UILabel sizeThatFits:](self->_descriptionText, "sizeThatFits:", CGRectGetWidth(v26) - v12 + -60.0, 0.0);
  double v18 = v17;
  descriptionText = self->_descriptionText;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  float v20 = (CGRectGetHeight(v27) - v18) * 0.5;
  double v21 = floorf(v20);
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  double v22 = CGRectGetWidth(v28) - v12 + -40.0;

  -[UILabel setFrame:](descriptionText, "setFrame:", 10.0, v21, v22, v18);
}

- (void)tappedLearnMore:(id)a3
{
  CGFloat v4 = +[COSInternalUserStudyAssetManager detailBundle];
  double v5 = [v4 localizedStringForKey:@"LEARN_MORE_TITLE" value:&stru_100249230 table:@"User_Study"];
  CGFloat v6 = +[COSInternalUserStudyAssetManager detailBundle];
  double v7 = [v6 localizedStringForKey:@"LEARN_MORE_BODY" value:&stru_100249230 table:@"User_Study"];
  CGFloat v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  double v9 = +[COSInternalUserStudyAssetManager detailBundle];
  CGFloat v10 = [v9 localizedStringForKey:@"LEARN_MORE_OKAY" value:&stru_100249230 table:@"User_Study"];
  double v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:&stru_100245CD8];

  [v8 addAction:v11];
  [v8 setPreferredAction:v11];
  double v12 = pbb_bridge_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Presenting 'Learn More' alert", v14, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  [WeakRetained presentViewController:v8 animated:1 completion:0];
}

- (UIViewController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  return (UIViewController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (UISwitch)disclosureToggle
{
  return self->_disclosureToggle;
}

- (void)setDisclosureToggle:(id)a3
{
}

- (UILabel)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_disclosureToggle, 0);

  objc_destroyWeak((id *)&self->_parentController);
}

@end