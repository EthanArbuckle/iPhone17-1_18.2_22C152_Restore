@interface PKDashboardMessageSectionController
- (BOOL)messagesView:(id)a3 shouldEnqueueEventForView:(id)a4;
- (BOOL)shouldHighlightItem:(id)a3;
- (PKDashboardMessageSectionController)initWithMessages:(id)a3 delegate:(id)a4;
- (PKDashboardMessageSectionControllerDelegate)delegate;
- (id)cellRegistrationForItem:(id)a3;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_decorateCell:(id)a3 forItem:(id)a4;
- (void)messagesView:(id)a3 scrolledToMessageWithIdentifier:(id)a4;
- (void)updateWithMessages:(id)a3 currentMessageIndex:(unint64_t)a4;
@end

@implementation PKDashboardMessageSectionController

- (PKDashboardMessageSectionController)initWithMessages:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardMessageSectionController;
  v8 = [(PKDashboardMessageSectionController *)&v12 init];
  if (v8)
  {
    v9 = [[PKDashboardMessageRowItem alloc] initWithMessages:v6 currentMessageIndex:0 messagesViewDelegate:v8];
    item = v8->_item;
    v8->_item = v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    [(PKDashboardMessageSectionController *)v8 updateWithMessages:v6 currentMessageIndex:0];
  }

  return v8;
}

- (void)updateWithMessages:(id)a3 currentMessageIndex:(unint64_t)a4
{
  id v10 = a3;
  id v6 = [(PKDashboardMessageRowItem *)self->_item messages];
  if (!PKEqualObjects())
  {

    goto LABEL_5;
  }
  int64_t v7 = [(PKDashboardMessageRowItem *)self->_item currentMessageIndex];

  v8 = v10;
  if (v7 != a4)
  {
LABEL_5:
    [(PKDashboardMessageRowItem *)self->_item setMessages:v10];
    [(PKDashboardMessageRowItem *)self->_item setCurrentMessageIndex:a4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadDataAnimated:1];

    v8 = v10;
  }
}

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"dashboardMessage";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v8[0] = self->_item;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 appendItems:v6];

  return v5;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v6 = objc_opt_class();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__PKDashboardMessageSectionController_cellRegistrationForItem___block_invoke;
    v9[3] = &unk_1E59D8090;
    objc_copyWeak(&v10, &location);
    int64_t v7 = [v5 registrationWithCellClass:v6 configurationHandler:v9];
    objc_destroyWeak(&v10);
  }
  else
  {
    int64_t v7 = 0;
  }
  objc_destroyWeak(&location);

  return v7;
}

void __63__PKDashboardMessageSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _decorateCell:v7 forItem:v6];
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)_decorateCell:(id)a3 forItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [PKDashboardMessagesView alloc];
  objc_super v12 = -[PKDashboardMessagesView initWithInsets:](v7, "initWithInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  v8 = [v5 messagesViewDelegate];
  [(PKDashboardMessagesView *)v12 setDelegate:v8];

  v9 = [v5 messages];
  uint64_t v10 = [v5 currentMessageIndex];

  [(PKDashboardMessagesView *)v12 updateWithMessages:v9 currentIndex:v10];
  [v6 setHostedContentView:v12];
  v11 = [v6 backgroundConfiguration];
  objc_msgSend(v11, "setBackgroundInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  [v6 setBackgroundConfiguration:v11];
}

- (void)messagesView:(id)a3 scrolledToMessageWithIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 messagesView:v11 scrolledToMessageWithIdentifier:v6];
  }
}

- (BOOL)messagesView:(id)a3 shouldEnqueueEventForView:(id)a4
{
  return 1;
}

- (PKDashboardMessageSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDashboardMessageSectionControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_item, 0);
}

@end