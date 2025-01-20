@interface SKUIRedeemIdViewController
- (BOOL)_validateForm;
- (NSMutableDictionary)fields;
- (SKUIClientContext)clientContext;
- (SKUIRedeemIdDelegate)delegate;
- (SKUIRedeemIdManager)manager;
- (SKUIRedeemIdViewController)initWithClientContext:(id)a3;
- (UIBarButtonItem)nextButton;
- (UIEdgeInsets)_edgeInsetsFromInsets:(UIEdgeInsets)result usingNewTopInset:(double)a4;
- (UITableView)tableView;
- (id)_fieldForIndexPath:(id)a3;
- (id)_finalOutputFields;
- (void)_adjustInsetsForKeyboardFrameValue:(id)a3;
- (void)_cancelPressed;
- (void)_initializeManager;
- (void)_initializeNavigationItem;
- (void)_initializeTableView;
- (void)_keyboardDidHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_nextPressed;
- (void)_refreshNavigationItem;
- (void)_reloadFooter;
- (void)_subscribeToKeyboardEvents;
- (void)_updateFieldAtIndexPath:(id)a3 withText:(id)a4;
- (void)redeemIdManager:(id)a3 didChangeToText:(id)a4 forCellAtIndexPath:(id)a5;
- (void)redeemIdManager:(id)a3 didReturnText:(id)a4 forCellAtIndexPath:(id)a5;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFields:(id)a3;
- (void)setManager:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIRedeemIdViewController

- (SKUIRedeemIdViewController)initWithClientContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemIdViewController initWithClientContext:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemIdViewController;
  v5 = [(SKUIRedeemIdViewController *)&v8 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    [(SKUIRedeemIdViewController *)v5 setFields:v6];

    [(SKUIRedeemIdViewController *)v5 setClientContext:v4];
    [(SKUIRedeemIdViewController *)v5 _initializeManager];
    [(SKUIRedeemIdViewController *)v5 _initializeTableView];
    [(SKUIRedeemIdViewController *)v5 _initializeNavigationItem];
    [(SKUIRedeemIdViewController *)v5 _subscribeToKeyboardEvents];
  }

  return v5;
}

- (void)viewDidLayoutSubviews
{
  v3 = [(SKUIRedeemIdViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(SKUIRedeemIdViewController *)self tableView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13.receiver = self;
  v13.super_class = (Class)SKUIRedeemIdViewController;
  [(SKUIRedeemIdViewController *)&v13 viewDidLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)SKUIRedeemIdViewController;
  id v7 = a4;
  -[SKUIRedeemIdViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(SKUIRedeemIdViewController *)self manager];
  [v8 setFooterHidden:1];

  [(SKUIRedeemIdViewController *)self _reloadFooter];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__SKUIRedeemIdViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E6422278;
  v9[4] = self;
  [v7 animateAlongsideTransition:0 completion:v9];
}

void __81__SKUIRedeemIdViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) manager];
  [v2 setFooterHidden:0];

  [*(id *)(a1 + 32) _reloadFooter];
  id v3 = [*(id *)(a1 + 32) manager];
  [v3 dismissActiveCell];
}

- (void)redeemIdManager:(id)a3 didReturnText:(id)a4 forCellAtIndexPath:(id)a5
{
}

- (void)redeemIdManager:(id)a3 didChangeToText:(id)a4 forCellAtIndexPath:(id)a5
{
}

- (void)_updateFieldAtIndexPath:(id)a3 withText:(id)a4
{
  id v6 = a4;
  id v8 = [(SKUIRedeemIdViewController *)self _fieldForIndexPath:a3];
  id v7 = [(SKUIRedeemIdViewController *)self fields];
  [v7 setObject:v6 forKey:v8];

  [(SKUIRedeemIdViewController *)self _refreshNavigationItem];
}

- (id)_fieldForIndexPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 section];
  if (v4 == 2)
  {
    id v7 = @"national_redeem_national_id";
  }
  else if (v4 == 1)
  {
    id v7 = @"national_redeem_phone";
  }
  else if (v4)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v5 = [v3 row];
    id v6 = @"national_redeem_last_name";
    if (v5 == 1) {
      id v6 = @"national_redeem_first_name";
    }
    id v7 = v6;
  }

  return v7;
}

- (void)_refreshNavigationItem
{
  BOOL v3 = [(SKUIRedeemIdViewController *)self _validateForm];
  id v4 = [(SKUIRedeemIdViewController *)self nextButton];
  [v4 setEnabled:v3];
}

- (BOOL)_validateForm
{
  BOOL v3 = [(SKUIRedeemIdViewController *)self fields];
  id v4 = [v3 objectForKeyedSubscript:@"national_redeem_first_name"];
  uint64_t v5 = [v4 length];

  id v6 = [(SKUIRedeemIdViewController *)self fields];
  id v7 = [v6 objectForKeyedSubscript:@"national_redeem_last_name"];
  uint64_t v8 = [v7 length];

  double v9 = [(SKUIRedeemIdViewController *)self fields];
  objc_super v10 = [v9 objectForKeyedSubscript:@"national_redeem_phone"];
  uint64_t v11 = [v10 length];

  v12 = [(SKUIRedeemIdViewController *)self fields];
  objc_super v13 = [v12 objectForKeyedSubscript:@"national_redeem_national_id"];
  uint64_t v14 = [v13 length];

  BOOL result = 0;
  if (v5 && v8)
  {
    if (v11) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    return !v16;
  }
  return result;
}

- (void)_reloadFooter
{
  id v3 = [(SKUIRedeemIdViewController *)self tableView];
  v2 = [MEMORY[0x1E4F28D60] indexSetWithIndex:3];
  [v3 reloadSections:v2 withRowAnimation:5];
}

- (UIEdgeInsets)_edgeInsetsFromInsets:(UIEdgeInsets)result usingNewTopInset:(double)a4
{
  result.top = a4;
  return result;
}

- (id)_finalOutputFields
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  id v4 = [(SKUIRedeemIdViewController *)self fields];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"national_redeem_last_name"];
  id v6 = [(SKUIRedeemIdViewController *)self fields];
  id v7 = [v6 objectForKeyedSubscript:@"national_redeem_first_name"];
  uint64_t v8 = [v3 stringWithFormat:@"%@%@", v5, v7];

  v16[0] = v8;
  v15[0] = @"name";
  v15[1] = @"phone";
  double v9 = [(SKUIRedeemIdViewController *)self fields];
  objc_super v10 = [v9 objectForKeyedSubscript:@"national_redeem_phone"];
  v16[1] = v10;
  v15[2] = @"nationalId";
  uint64_t v11 = [(SKUIRedeemIdViewController *)self fields];
  v12 = [v11 objectForKeyedSubscript:@"national_redeem_national_id"];
  v16[2] = v12;
  objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  return v13;
}

- (void)_initializeManager
{
  id v3 = [SKUIRedeemIdManager alloc];
  id v4 = [(SKUIRedeemIdViewController *)self clientContext];
  uint64_t v5 = [(SKUIRedeemIdManager *)v3 initWithClientContext:v4];
  [(SKUIRedeemIdViewController *)self setManager:v5];

  id v6 = [(SKUIRedeemIdViewController *)self manager];
  [v6 setDelegate:self];
}

- (void)_initializeTableView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SKUIRedeemIdViewController *)self setTableView:v4];

  uint64_t v5 = [(SKUIRedeemIdViewController *)self manager];
  id v6 = [(SKUIRedeemIdViewController *)self tableView];
  [v6 setDataSource:v5];

  id v7 = [(SKUIRedeemIdViewController *)self manager];
  uint64_t v8 = [(SKUIRedeemIdViewController *)self tableView];
  [v8 setDelegate:v7];

  double v9 = [(SKUIRedeemIdViewController *)self view];
  objc_super v10 = [(SKUIRedeemIdViewController *)self tableView];
  [v9 addSubview:v10];

  id v12 = [(SKUIRedeemIdViewController *)self tableView];
  uint64_t v11 = [(SKUIRedeemIdViewController *)self manager];
  [v11 setTableView:v12];
}

- (void)_initializeNavigationItem
{
  id v16 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed];
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v4 = [(SKUIRedeemIdViewController *)self clientContext];
  uint64_t v5 = v4;
  if (v4) {
    [v4 localizedStringForKey:@"REDEEM_NATIONAL_ID_NEXT_BUTTON" inTable:@"Redeem"];
  }
  else {
  id v6 = +[SKUIClientContext localizedStringForKey:@"REDEEM_NATIONAL_ID_NEXT_BUTTON" inBundles:0 inTable:@"Redeem"];
  }
  id v7 = (void *)[v3 initWithTitle:v6 style:2 target:self action:sel__nextPressed];
  [(SKUIRedeemIdViewController *)self setNextButton:v7];

  uint64_t v8 = [(SKUIRedeemIdViewController *)self nextButton];
  [v8 setEnabled:0];

  double v9 = [(SKUIRedeemIdViewController *)self navigationItem];
  objc_super v10 = [(SKUIRedeemIdViewController *)self clientContext];
  uint64_t v11 = v10;
  if (v10) {
    [v10 localizedStringForKey:@"REDEEM_NATIONAL_ID_VIEW_TITLE" inTable:@"Redeem"];
  }
  else {
  id v12 = +[SKUIClientContext localizedStringForKey:@"REDEEM_NATIONAL_ID_VIEW_TITLE" inBundles:0 inTable:@"Redeem"];
  }
  [v9 setTitle:v12];

  objc_super v13 = [(SKUIRedeemIdViewController *)self navigationItem];
  [v13 setLeftBarButtonItem:v16];

  uint64_t v14 = [(SKUIRedeemIdViewController *)self navigationItem];
  v15 = [(SKUIRedeemIdViewController *)self nextButton];
  [v14 setRightBarButtonItem:v15];
}

- (void)_cancelPressed
{
  id v3 = [(SKUIRedeemIdViewController *)self delegate];
  [v3 redeemIdViewControllerDidCancel:self];
}

- (void)_nextPressed
{
  id v3 = [(SKUIRedeemIdViewController *)self manager];
  [v3 handleNextPressed];

  id v5 = [(SKUIRedeemIdViewController *)self delegate];
  id v4 = [(SKUIRedeemIdViewController *)self _finalOutputFields];
  [v5 redeemIdViewController:self submittedWithFields:v4];
}

- (void)_subscribeToKeyboardEvents
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__keyboardDidHide_ name:*MEMORY[0x1E4FB2BC0] object:0];
}

- (void)_keyboardWillShow:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 valueForKey:*MEMORY[0x1E4FB2BD8]];
  [(SKUIRedeemIdViewController *)self _adjustInsetsForKeyboardFrameValue:v4];
}

- (void)_keyboardDidHide:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIRedeemIdViewController *)self manager];
  [v5 dismissActiveCell];

  id v6 = [v4 userInfo];
  id v7 = [v6 valueForKey:*MEMORY[0x1E4FB2BD8]];

  uint64_t v8 = [v4 userInfo];

  double v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB2BA8]];

  objc_super v10 = (void *)MEMORY[0x1E4FB1EB0];
  [v9 floatValue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__SKUIRedeemIdViewController__keyboardDidHide___block_invoke;
  v14[3] = &unk_1E6421FF8;
  double v12 = v11;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v10 animateWithDuration:v14 animations:v12];
}

uint64_t __47__SKUIRedeemIdViewController__keyboardDidHide___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _adjustInsetsForKeyboardFrameValue:*(void *)(a1 + 40)];
}

- (void)_adjustInsetsForKeyboardFrameValue:(id)a3
{
  [a3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(SKUIRedeemIdViewController *)self tableView];
  id v13 = [v12 superview];
  objc_msgSend(v13, "convertRect:fromView:", 0, v5, v7, v9, v11);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v22 = [(SKUIRedeemIdViewController *)self tableView];
  [v22 frame];
  v43.origin.x = v15;
  v43.origin.y = v17;
  v43.size.double width = v19;
  v43.size.double height = v21;
  CGRect v42 = CGRectIntersection(v41, v43);
  double height = v42.size.height;

  v24 = [(SKUIRedeemIdViewController *)self tableView];
  [v24 contentInset];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  v31 = [(SKUIRedeemIdViewController *)self tableView];
  objc_msgSend(v31, "setContentInset:", v26, v28, height, v30);

  v32 = [(SKUIRedeemIdViewController *)self tableView];
  [v32 scrollIndicatorInsets];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  id v39 = [(SKUIRedeemIdViewController *)self tableView];
  objc_msgSend(v39, "setScrollIndicatorInsets:", v34, v36, height, v38);
}

- (SKUIRedeemIdDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIRedeemIdDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUIRedeemIdManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UIBarButtonItem)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (NSMutableDictionary)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemIdViewController initWithClientContext:]";
}

@end