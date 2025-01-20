@interface PKPaymentPassDetailWrapperSectionController
- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3;
- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3;
- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (NSArray)sectionIdentifiers;
- (PKPaymentPassDetailWrapperSectionController)init;
- (PKPaymentPassDetailWrapperSectionController)initWithViewController:(id)a3;
- (double)estimatedHeightForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSectionIdentifier:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSectionIdentifier:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5 sectionIdentifier:(id)a6;
- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)tableView:(id)a3 viewForFooterInSectionIdentifier:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSectionIdentifier:(id)a4;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (id)titleForHeaderInSectionIdentifier:(id)a3;
- (int64_t)editingStyleForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)setSectionIdentifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPaymentPassDetailWrapperSectionController

- (PKPaymentPassDetailWrapperSectionController)init
{
  return 0;
}

- (PKPaymentPassDetailWrapperSectionController)initWithViewController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassDetailWrapperSectionController;
  v5 = [(PKPaymentPassDetailWrapperSectionController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    v7 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:54];
    for (unint64_t i = 0; i != 54; ++i)
    {
      v9 = PKPassDetailSectionTypeToString(i);
      [(NSArray *)v7 addObject:v9];
    }
    sectionIdentifiers = v6->_sectionIdentifiers;
    v6->_sectionIdentifiers = v7;
  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  p_viewController = &self->_viewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v9 = PKPassDetailSectionTypeFromString(v6);

  int64_t v10 = [WeakRetained tableView:v7 numberOfRowsInSectionCase:v9];
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  p_viewController = &self->_viewController;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v12 = PKPassDetailSectionTypeFromString(v8);

  v13 = [WeakRetained tableView:v10 cellForRowAtIndexPath:v9 section:v12];

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  p_viewController = &self->_viewController;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v11 = PKPassDetailSectionTypeFromString(v8);

  [WeakRetained tableView:v10 didSelectRowAtIndexPath:v9 section:v11];
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  p_viewController = &self->_viewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v6 = PKPassDetailSectionTypeFromString(v4);

  id v7 = [WeakRetained titleForHeaderInSection:v6];

  return v7;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  p_viewController = &self->_viewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v6 = PKPassDetailSectionTypeFromString(v4);

  id v7 = [WeakRetained titleForFooterInSection:v6];

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSectionIdentifier:(id)a4
{
  p_viewController = &self->_viewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v9 = PKPassDetailSectionTypeFromString(v6);

  id v10 = [WeakRetained tableView:v7 viewForHeaderInSectionCase:v9];

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSectionIdentifier:(id)a4
{
  p_viewController = &self->_viewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v9 = PKPassDetailSectionTypeFromString(v6);

  id v10 = [WeakRetained tableView:v7 viewForFooterInSectionCase:v9];

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  p_viewController = &self->_viewController;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v12 = PKPassDetailSectionTypeFromString(v8);

  [WeakRetained tableView:v10 heightForRowAtIndexPath:v9 section:v12];
  double v14 = v13;

  return v14;
}

- (double)tableView:(id)a3 heightForHeaderInSectionIdentifier:(id)a4
{
  p_viewController = &self->_viewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v9 = PKPassDetailSectionTypeFromString(v6);

  [WeakRetained tableView:v7 heightForHeaderInSectionCase:v9];
  double v11 = v10;

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSectionIdentifier:(id)a4
{
  p_viewController = &self->_viewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v9 = PKPassDetailSectionTypeFromString(v6);

  [WeakRetained tableView:v7 heightForFooterInSectionCase:v9];
  double v11 = v10;

  return v11;
}

- (double)estimatedHeightForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  p_viewController = &self->_viewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v9 = PKPassDetailSectionTypeFromString(v6);

  [WeakRetained estimatedHeightForRowAtIndexPath:v7 section:v9];
  double v11 = v10;

  return v11;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  p_viewController = &self->_viewController;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v12 = PKPassDetailSectionTypeFromString(v8);

  LOBYTE(v8) = [WeakRetained tableView:v10 canEditRowAtIndexPath:v9 section:v12];
  return (char)v8;
}

- (int64_t)editingStyleForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  p_viewController = &self->_viewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v9 = PKPassDetailSectionTypeFromString(v6);

  int64_t v10 = [WeakRetained editingStyleForRowAtIndexPath:v7 section:v9];
  return v10;
}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  p_viewController = &self->_viewController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v9 = PKPassDetailSectionTypeFromString(v6);

  LOBYTE(v6) = [WeakRetained shouldHighlightRowAtIndexPath:v7 section:v9];
  return (char)v6;
}

- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3
{
  p_viewController = &self->_viewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v6 = PKPassDetailSectionTypeFromString(v4);

  LOBYTE(v4) = [WeakRetained shouldDrawTopSeparator:v6];
  return (char)v4;
}

- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3
{
  p_viewController = &self->_viewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v6 = PKPassDetailSectionTypeFromString(v4);

  LOBYTE(v4) = [WeakRetained shouldDrawBottomSeparator:v6];
  return (char)v4;
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  p_viewController = &self->_viewController;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v12 = PKPassDetailSectionTypeFromString(v8);

  double v13 = [WeakRetained tableView:v10 leadingSwipeActionsConfigurationForRowAtIndexPath:v9 section:v12];

  return v13;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  p_viewController = &self->_viewController;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v12 = PKPassDetailSectionTypeFromString(v8);

  double v13 = [WeakRetained tableView:v10 trailingSwipeActionsConfigurationForRowAtIndexPath:v9 section:v12];

  return v13;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5 sectionIdentifier:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  p_viewController = &self->_viewController;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  uint64_t v15 = PKPassDetailSectionTypeFromString(v11);

  v16 = objc_msgSend(WeakRetained, "tableView:contextMenuConfigurationForRowAtIndexPath:point:section:", v13, v12, v15, x, y);

  return v16;
}

- (NSArray)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (void)setSectionIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);

  objc_destroyWeak((id *)&self->_viewController);
}

@end