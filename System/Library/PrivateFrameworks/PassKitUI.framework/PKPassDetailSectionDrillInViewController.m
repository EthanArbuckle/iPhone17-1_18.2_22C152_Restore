@interface PKPassDetailSectionDrillInViewController
- (PKPassDetailSectionDrillInViewController)initWithPass:(id)a3 field:(id)a4 useBridgeStyle:(BOOL)a5 isShowingSecureInformation:(BOOL)a6;
@end

@implementation PKPassDetailSectionDrillInViewController

- (PKPassDetailSectionDrillInViewController)initWithPass:(id)a3 field:(id)a4 useBridgeStyle:(BOOL)a5 isShowingSecureInformation:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKPassDetailSectionDrillInViewController;
  v12 = [(PKDynamicTableViewController *)&v24 init];
  if (v12)
  {
    v13 = [PKConfigurablePassDetailSectionsController alloc];
    v14 = [v11 sectionIdentifiers];
    uint64_t v15 = [(PKConfigurablePassDetailSectionsController *)v13 initWithPaymentPass:v10 forSelectSections:v14];
    sectionController = v12->_sectionController;
    v12->_sectionController = (PKConfigurablePassDetailSectionsController *)v15;

    [(PKConfigurablePassDetailSectionsController *)v12->_sectionController setUseBridgeStyle:v7];
    v25[0] = v12->_sectionController;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [(PKDynamicTableViewController *)v12 setSectionControllers:v17];

    v18 = [(PKPassDetailSectionDrillInViewController *)v12 navigationItem];
    id v19 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v19 configureWithOpaqueBackground];
    v20 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v19 setBackgroundColor:v20];

    [v18 setStandardAppearance:v19];
    objc_msgSend(v18, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 1.0);
    v21 = [v11 localizedTitle];
    [(PKPassDetailSectionDrillInViewController *)v12 setTitle:v21];

    if (v6)
    {
      v22 = [(PKPassDetailSectionDrillInViewController *)v12 tableView];
      objc_msgSend(v22, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
    }
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end