@interface PKTransitCardNumberViewController
+ (BOOL)canShowForPass:(id)a3 expressPassController:(id)a4;
- (PKTransitCardNumberViewController)initWithPass:(id)a3;
@end

@implementation PKTransitCardNumberViewController

- (PKTransitCardNumberViewController)initWithPass:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKTransitCardNumberViewController;
  v6 = -[PKDynamicTableViewController initWithStyle:](&v14, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pass, a3);
    v8 = [[PKPassDetailsCardInfoSectionController alloc] initWithPass:v7->_pass peerPaymentAccount:0 mode:1 detailViewStyle:0 delegate:0];
    cardInfoSectionController = v7->_cardInfoSectionController;
    v7->_cardInfoSectionController = v8;

    [(PKPassDetailsCardInfoSectionController *)v7->_cardInfoSectionController setHideSectionTitles:1];
    v15[0] = v7->_cardInfoSectionController;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(PKDynamicTableViewController *)v7 setSectionControllers:v10];

    v11 = [(PKTransitCardNumberViewController *)v7 navigationItem];
    v12 = PKLocalizedString(&cfstr_SettingsViewTr.isa, 0);
    [v11 setTitle:v12];
  }
  return v7;
}

+ (BOOL)canShowForPass:(id)a3 expressPassController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 activationState] != 2
    && +[PKPassDetailsCardInfoSectionController canShowSectionForPaymentPass:v5 expressPassController:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardInfoSectionController, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end