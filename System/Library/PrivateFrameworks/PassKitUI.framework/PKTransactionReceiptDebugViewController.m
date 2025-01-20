@interface PKTransactionReceiptDebugViewController
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKTransactionReceiptDebugViewController)initWithPaymentTransaction:(id)a3;
- (id)_amountCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_headerFieldCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_infoCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_lineItemCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_previewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_summaryItemCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)provideDataForItem:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_presentReceiptPreview;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKTransactionReceiptDebugViewController

- (PKTransactionReceiptDebugViewController)initWithPaymentTransaction:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTransactionReceiptDebugViewController;
  v6 = [(PKSectionTableViewController *)&v11 initWithStyle:1 numberOfSections:6];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v7];
    paymentService = v7->_paymentService;
    v7->_paymentService = (PKPaymentService *)v8;
  }
  return v7;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  BOOL v4 = 1;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      return v4;
    case 1uLL:
      id v5 = [(PKTransactionReceipt *)self->_receipt headerFields];
      goto LABEL_6;
    case 2uLL:
      id v5 = [(PKTransactionReceipt *)self->_receipt lineItems];
      goto LABEL_6;
    case 3uLL:
      id v5 = [(PKTransactionReceipt *)self->_receipt summaryItems];
LABEL_6:
      v6 = v5;
      BOOL v4 = [v5 count] != 0;

      break;
    case 5uLL:
      v7 = [(PKTransactionReceipt *)self->_receipt htmlReceiptData];
      if (v7)
      {
        BOOL v4 = 1;
      }
      else
      {
        uint64_t v8 = [(PKTransactionReceipt *)self->_receipt pdfReceiptData];
        BOOL v4 = v8 != 0;
      }
      break;
    default:
      BOOL v4 = 0;
      break;
  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]))
  {
    case 0uLL:
      uint64_t v8 = [(PKTransactionReceiptDebugViewController *)self _infoCellForTableView:v6 atIndexPath:v7];
      goto LABEL_9;
    case 1uLL:
      uint64_t v8 = [(PKTransactionReceiptDebugViewController *)self _headerFieldCellForTableView:v6 atIndexPath:v7];
      goto LABEL_9;
    case 2uLL:
      uint64_t v8 = [(PKTransactionReceiptDebugViewController *)self _lineItemCellForTableView:v6 atIndexPath:v7];
      goto LABEL_9;
    case 3uLL:
      uint64_t v8 = [(PKTransactionReceiptDebugViewController *)self _summaryItemCellForTableView:v6 atIndexPath:v7];
      goto LABEL_9;
    case 4uLL:
      uint64_t v8 = [(PKTransactionReceiptDebugViewController *)self _amountCellForTableView:v6 atIndexPath:v7];
      goto LABEL_9;
    case 5uLL:
      uint64_t v8 = [(PKTransactionReceiptDebugViewController *)self _previewCellForTableView:v6 atIndexPath:v7];
LABEL_9:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3)) == 5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v6 section]) == 5) {
    [(PKTransactionReceiptDebugViewController *)self _presentReceiptPreview];
  }
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unint64_t v4 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v4 - 1 > 2) {
    return 0;
  }
  else {
    return off_1E59D79F8[v4 - 1];
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PKTransactionReceiptDebugViewController;
  [(PKSectionTableViewController *)&v7 viewDidLoad];
  v3 = [(PKTransactionReceiptDebugViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"CellReuseIdentifier"];
  paymentService = self->_paymentService;
  id v5 = [(PKPaymentTransaction *)self->_transaction identifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PKTransactionReceiptDebugViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_1E59D79D8;
  v6[4] = self;
  [(PKPaymentService *)paymentService transactionReceiptForTransactionWithIdentifier:v5 updateIfNecessary:1 completion:v6];
}

void __54__PKTransactionReceiptDebugViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PKTransactionReceiptDebugViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __54__PKTransactionReceiptDebugViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1104), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return [v2 reloadData];
}

- (id)provideDataForItem:(id)a3
{
  id v4 = [(PKTransactionReceipt *)self->_receipt pdfReceiptData];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(PKTransactionReceipt *)self->_receipt htmlReceiptData];
  }
  objc_super v7 = v6;

  return v7;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  id v4 = [(PKTransactionReceipt *)self->_receipt pdfReceiptData];
  if (v4)
  {
    int64_t v5 = 1;
  }
  else
  {
    id v6 = [(PKTransactionReceipt *)self->_receipt htmlReceiptData];
    int64_t v5 = v6 != 0;
  }
  return v5;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  return self->_receiptPreviewItem;
}

- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKTransactionReceiptDebugViewController_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v6;
  v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __99__PKTransactionReceiptDebugViewController_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 1096) identifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_12:
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1104), *(id *)(a1 + 48));
    id v8 = *(void **)(a1 + 40);
    [v8 reloadData];
    return;
  }
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  id v9 = v5;
  if (!v6)
  {
    int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)_presentReceiptPreview
{
  id v3 = [(PKTransactionReceipt *)self->_receipt pdfReceiptData];

  if (v3)
  {
    id v4 = (id *)MEMORY[0x1E4F44450];
  }
  else
  {
    id v5 = [(PKTransactionReceipt *)self->_receipt htmlReceiptData];

    if (!v5) {
      return;
    }
    id v4 = (id *)MEMORY[0x1E4F443F0];
  }
  uint64_t v6 = [*v4 identifier];
  if (v6)
  {
    id v11 = (id)v6;
    int v7 = (QLItem *)[objc_alloc((Class)_MergedGlobals_1_18[0]()) initWithDataProvider:self contentType:v6 previewTitle:@"Receipt"];
    receiptPreviewItem = self->_receiptPreviewItem;
    self->_receiptPreviewItem = v7;

    id v9 = (QLPreviewController *)objc_alloc_init((Class)off_1EC33AEA8[0]());
    previewController = self->_previewController;
    self->_previewController = v9;

    [(QLPreviewController *)self->_previewController setDelegate:self];
    [(QLPreviewController *)self->_previewController setDataSource:self];
    [(PKTransactionReceiptDebugViewController *)self presentViewController:self->_previewController animated:1 completion:0];
  }
}

- (id)_infoCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  int v7 = [a3 dequeueReusableCellWithIdentifier:@"CellReuseIdentifier" forIndexPath:v6];
  uint64_t v8 = [v6 row];

  switch(v8)
  {
    case 0:
      id v9 = [(PKTransactionReceipt *)self->_receipt uniqueID];
      v10 = @"Unique ID";
      break;
    case 1:
      id v9 = [(PKTransactionReceipt *)self->_receipt receiptProviderIdentifier];
      v10 = @"Provider ID";
      break;
    case 2:
      id v9 = [(PKTransactionReceipt *)self->_receipt receiptIdentifier];
      v10 = @"Receipt ID";
      break;
    case 3:
      id v11 = [(PKTransactionReceipt *)self->_receipt lastUpdatedDate];
      PKW3CDateStringFromDate();
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v10 = @"Last Updated";
      break;
    case 4:
      v12 = [(PKTransactionReceipt *)self->_receipt supportURL];
      id v9 = [v12 absoluteString];

      v10 = @"Support URL";
      break;
    case 5:
      unint64_t v13 = [(PKTransactionReceipt *)self->_receipt state];
      if (v13 > 2) {
        id v9 = 0;
      }
      else {
        id v9 = off_1E59D7A10[v13];
      }
      v10 = @"State";
      break;
    default:
      v10 = 0;
      id v9 = 0;
      break;
  }
  v14 = [v7 keyLabel];
  [v14 setText:v10];

  v15 = [v7 valueLabel];
  [v15 setText:v9];

  return v7;
}

- (id)_headerFieldCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  int v7 = [a3 dequeueReusableCellWithIdentifier:@"CellReuseIdentifier" forIndexPath:v6];
  uint64_t v8 = [(PKTransactionReceipt *)self->_receipt headerFields];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  id v11 = [v7 keyLabel];
  v12 = [v10 label];
  [v11 setText:v12];

  unint64_t v13 = [v7 valueLabel];
  v14 = [v10 value];
  [v13 setText:v14];

  return v7;
}

- (id)_lineItemCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  int v7 = [a3 dequeueReusableCellWithIdentifier:@"CellReuseIdentifier" forIndexPath:v6];
  uint64_t v8 = [(PKTransactionReceipt *)self->_receipt lineItems];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  id v11 = [v7 keyLabel];
  v12 = [v10 title];
  [v11 setText:v12];

  unint64_t v13 = [v7 valueLabel];
  v14 = [v10 currencyAmount];
  v15 = [v14 formattedStringValue];
  [v13 setText:v15];

  v16 = [v7 imageView];
  v17 = (void *)MEMORY[0x1E4FB1818];
  v18 = [v10 image];
  v19 = [v17 imageWithPKImage:v18];
  [v16 setImage:v19];

  return v7;
}

- (id)_summaryItemCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  int v7 = [a3 dequeueReusableCellWithIdentifier:@"CellReuseIdentifier" forIndexPath:v6];
  uint64_t v8 = [(PKTransactionReceipt *)self->_receipt summaryItems];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  id v11 = [v10 label];
  if (!v11)
  {
    unint64_t v12 = [v10 type];
    if (v12 > 4) {
      id v11 = 0;
    }
    else {
      id v11 = off_1E59D7A28[v12];
    }
  }
  unint64_t v13 = [v7 keyLabel];
  [v13 setText:v11];

  v14 = [v7 valueLabel];
  v15 = [v10 currencyAmount];
  v16 = [v15 formattedStringValue];
  [v14 setText:v16];

  return v7;
}

- (id)_amountCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  int v7 = [a3 dequeueReusableCellWithIdentifier:@"CellReuseIdentifier" forIndexPath:v6];
  uint64_t v8 = [v6 row];

  if (v8 == 1)
  {
    uint64_t v9 = [(PKTransactionReceipt *)self->_receipt totalCurrencyAmount];
    v10 = @"Total";
    goto LABEL_5;
  }
  if (!v8)
  {
    uint64_t v9 = [(PKTransactionReceipt *)self->_receipt subtotalCurrencyAmount];
    v10 = @"Subtotal";
LABEL_5:
    id v11 = [v9 formattedStringValue];

    goto LABEL_7;
  }
  v10 = 0;
  id v11 = 0;
LABEL_7:
  unint64_t v12 = [v7 keyLabel];
  [v12 setText:v10];

  unint64_t v13 = [v7 valueLabel];
  [v13 setText:v11];

  return v7;
}

- (id)_previewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v4 = [a3 dequeueReusableCellWithIdentifier:@"CellReuseIdentifier" forIndexPath:a4];
  id v5 = [v4 keyLabel];
  [v5 setText:@"View Receipt"];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_receiptPreviewItem, 0);
  objc_storeStrong((id *)&self->_receipt, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end