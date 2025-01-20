@interface PKPaymentPassDetailContactSupportSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (NSString)footerText;
- (NSString)titleText;
- (PKPaymentPassDetailContactSupportSectionController)initWithDelegate:(id)a3;
- (PKPaymentPassDetailContactSupportSectionControllerDelegate)delegate;
- (UIColor)titleColor;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (unint64_t)contactOption;
- (void)setContactOption:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleText:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPaymentPassDetailContactSupportSectionController

- (PKPaymentPassDetailContactSupportSectionController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassDetailContactSupportSectionController;
  v5 = [(PKPaymentPassDetailSectionController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_contactOption = 15;
    uint64_t v7 = PKLocalizedPaymentString(&cfstr_TransactionDet_19.isa);
    titleText = v6->_titleText;
    v6->_titleText = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
    titleColor = v6->_titleColor;
    v6->_titleColor = (UIColor *)v9;
  }
  return v6;
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"ContactSupportSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)sectionIdentifiers
{
  if ([(PKPaymentPassDetailSectionController *)self currentSegment])
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = [(PKPaymentPassDetailContactSupportSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  v3 = [a3 devicePrimaryPaymentApplication];
  BOOL v4 = [v3 paymentNetworkIdentifier] == 135;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  v6 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"ContactSupportCell", a4, a5);
  if (!v6) {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"ContactSupportCell"];
  }
  uint64_t v7 = [MEMORY[0x1E4FB1948] cellConfiguration];
  [v7 setText:self->_titleText];
  v8 = [v7 textProperties];
  [v8 setColor:self->_titleColor];

  [v6 setContentConfiguration:v7];
  [v6 setSelectionStyle:0];

  return v6;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  return self->_footerText;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained contactSupportSectionControllerDidSelect:self];
}

- (PKPaymentPassDetailContactSupportSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentPassDetailContactSupportSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)contactOption
{
  return self->_contactOption;
}

- (void)setContactOption:(unint64_t)a3
{
  self->_contactOption = a3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleText, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end