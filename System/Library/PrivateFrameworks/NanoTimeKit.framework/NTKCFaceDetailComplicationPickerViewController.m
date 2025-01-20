@interface NTKCFaceDetailComplicationPickerViewController
- (BOOL)_handleHomeItemSelection:(id)a3;
- (BOOL)_handleWidgetItemSelection:(id)a3;
- (BOOL)_showCustomHomePickerUI;
- (BOOL)hasDoneInitialScrollToItem;
- (NSIndexPath)indexPathToScrollToAfterLayout;
- (NSString)slot;
- (NTKCFaceDetailComplicationCellProvider)cellProvider;
- (NTKCFaceDetailComplicationPickerViewController)initWithFace:(id)a3 slot:(id)a4 selectedComplication:(id)a5;
- (NTKCFaceDetailComplicationPickerViewController)initWithSlot:(id)a3 listProvider:(id)a4 title:(id)a5 selectedComplication:(id)a6;
- (NTKCFaceDetailComplicationPickerViewControllerDelegate)delegate;
- (NTKComplicationPickerListProvider)listProvider;
- (NTKFaceSlotComplicationTopLevelListProvider)topLevelListProvider;
- (UITableViewDiffableDataSource)dataSource;
- (id)detailViewControllerForSectionInfo:(id)a3;
- (void)_configureWithSlot:(id)a3 listProvider:(id)a4 selectedComplication:(id)a5;
- (void)_setCheckmarkForTableView:(id)a3 atIndexPath:(id)a4;
- (void)faceDetailComplicationPickerViewController:(id)a3 didSelectComplication:(id)a4;
- (void)homeDetailPickerViewController:(id)a3 didSelectItem:(id)a4;
- (void)homeListPickerViewController:(id)a3 didSelectItem:(id)a4;
- (void)peopleComplicationPickerViewController:(id)a3 didSelectItem:(id)a4;
- (void)setCellProvider:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasDoneInitialScrollToItem:(BOOL)a3;
- (void)setIndexPathToScrollToAfterLayout:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NTKCFaceDetailComplicationPickerViewController

- (void)_configureWithSlot:(id)a3 listProvider:(id)a4 selectedComplication:(id)a5
{
  objc_storeStrong((id *)&self->_listProvider, a4);
  id v11 = a4;
  id v8 = a3;
  v9 = (NSString *)[v8 copy];

  slot = self->_slot;
  self->_slot = v9;
}

- (NTKCFaceDetailComplicationPickerViewController)initWithSlot:(id)a3 listProvider:(id)a4 title:(id)a5 selectedComplication:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)NTKCFaceDetailComplicationPickerViewController;
  v14 = [(NTKCFaceDetailComplicationPickerViewController *)&v17 initWithStyle:2];
  v15 = v14;
  if (v14)
  {
    [(NTKCFaceDetailComplicationPickerViewController *)v14 _configureWithSlot:v10 listProvider:v11 selectedComplication:v13];
    [(NTKCFaceDetailComplicationPickerViewController *)v15 setTitle:v12];
  }

  return v15;
}

- (NTKCFaceDetailComplicationPickerViewController)initWithFace:(id)a3 slot:(id)a4 selectedComplication:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)NTKCFaceDetailComplicationPickerViewController;
  id v11 = [(NTKCFaceDetailComplicationPickerViewController *)&v24 initWithStyle:2];
  if (v11)
  {
    id v12 = objc_opt_class();
    id v13 = [v8 device];
    v14 = [v12 richComplicationSlotsForDevice:v13];
    uint64_t v15 = [v14 containsObject:v9];

    v16 = [v8 rankedComplicationFamiliesForSlot:v9];
    objc_super v17 = [v16 firstObject];
    uint64_t v18 = [v17 integerValue];

    v19 = [v8 allowedComplicationsForSlot:v9];
    v20 = [[NTKFaceSlotComplicationTopLevelListProvider alloc] initWithRichSlot:v15 complicationFamily:v18 complications:v19 selectedComplication:v10];
    topLevelListProvider = v11->_topLevelListProvider;
    v11->_topLevelListProvider = v20;

    v22 = NTKCompanionClockFaceLocalizedString(@"EDIT_MODE_LABEL_COMPLICATIONS_COMPANION", @"Complications");
    [(NTKCFaceDetailComplicationPickerViewController *)v11 setTitle:v22];
    [(NTKCFaceDetailComplicationPickerViewController *)v11 _configureWithSlot:v9 listProvider:v11->_topLevelListProvider selectedComplication:v10];
  }
  return v11;
}

- (id)detailViewControllerForSectionInfo:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ntk_identifier");
  v6 = [(NTKCFaceDetailComplicationPickerViewController *)self topLevelListProvider];
  v7 = [v6 detailListProviderForSectionIdentifier:v5];

  if (v7)
  {
    id v8 = [NTKCFaceDetailComplicationPickerViewController alloc];
    id v9 = [(NTKCFaceDetailComplicationPickerViewController *)self slot];
    id v10 = objc_msgSend(v4, "ntk_localizedSectionName");
    id v11 = [(NTKCFaceDetailComplicationPickerViewController *)self topLevelListProvider];
    id v12 = [v11 selectedItemIgnoringMoreButton];
    id v13 = [(NTKCFaceDetailComplicationPickerViewController *)v8 initWithSlot:v9 listProvider:v7 title:v10 selectedComplication:v12];

    [(NTKCFaceDetailComplicationPickerViewController *)v13 setDelegate:self];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)NTKCFaceDetailComplicationPickerViewController;
  [(NTKCFaceDetailComplicationPickerViewController *)&v17 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = [NTKCFaceDetailDiffableDataSource alloc];
  id v4 = [(NTKCFaceDetailComplicationPickerViewController *)self tableView];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __61__NTKCFaceDetailComplicationPickerViewController_viewDidLoad__block_invoke;
  v14 = &unk_1E62C8B68;
  objc_copyWeak(&v15, &location);
  v5 = [(UITableViewDiffableDataSource *)v3 initWithTableView:v4 cellProvider:&v11];

  v6 = [(NTKCFaceDetailComplicationPickerViewController *)self listProvider];
  v7 = [(NTKCFaceDetailComplicationPickerViewController *)self tableView];
  double v8 = *MEMORY[0x1E4FB2F28];
  [v7 setRowHeight:*MEMORY[0x1E4FB2F28]];
  double v9 = *MEMORY[0x1E4FB2F30];
  [v7 setEstimatedRowHeight:v9];
  [v7 setSectionHeaderHeight:v8];
  [v7 setEstimatedSectionHeaderHeight:v9];
  id v10 = [[NTKCFaceDetailComplicationCellProvider alloc] initWithTableView:v7 listProvider:v6];
  [(NTKCFaceDetailComplicationPickerViewController *)self setCellProvider:v10];
  [(NTKCFaceDetailComplicationPickerViewController *)self setDataSource:v5];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __61__NTKCFaceDetailComplicationPickerViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  double v9 = [WeakRetained cellProvider];
  id v10 = [v9 cellForItem:v6 atIndexPath:v7];

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKCFaceDetailComplicationPickerViewController;
  [(NTKCFaceDetailComplicationPickerViewController *)&v13 viewWillAppear:a3];
  id v4 = [(NTKCFaceDetailComplicationPickerViewController *)self listProvider];
  v5 = [v4 pickerListDataSourceSnapshot];

  id v6 = [(NTKCFaceDetailComplicationPickerViewController *)self dataSource];
  [v6 applySnapshot:v5 animatingDifferences:0 completion:0];

  id v7 = [(NTKCFaceDetailComplicationPickerViewController *)self listProvider];
  double v8 = [v7 pickerSelectedItem];

  if (v8)
  {
    double v9 = [(NTKCFaceDetailComplicationPickerViewController *)self dataSource];
    id v10 = [v9 indexPathForItemIdentifier:v8];
    [(NTKCFaceDetailComplicationPickerViewController *)self setIndexPathToScrollToAfterLayout:v10];

    uint64_t v11 = [(NTKCFaceDetailComplicationPickerViewController *)self tableView];
    uint64_t v12 = [(NTKCFaceDetailComplicationPickerViewController *)self indexPathToScrollToAfterLayout];
    [v11 scrollToRowAtIndexPath:v12 atScrollPosition:2 animated:0];
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCFaceDetailComplicationPickerViewController;
  [(NTKCFaceDetailComplicationPickerViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(NTKCFaceDetailComplicationPickerViewController *)self indexPathToScrollToAfterLayout];
  if (v3
    && ![(NTKCFaceDetailComplicationPickerViewController *)self hasDoneInitialScrollToItem])
  {
    id v4 = [(NTKCFaceDetailComplicationPickerViewController *)self tableView];
    [v4 scrollToRowAtIndexPath:v3 atScrollPosition:2 animated:0];

    [(NTKCFaceDetailComplicationPickerViewController *)self setHasDoneInitialScrollToItem:1];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v4 = [a3 cellForRowAtIndexPath:a4];
  [v4 setAccessoryType:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NTKCFaceDetailComplicationPickerViewController *)self dataSource];
  double v9 = [v8 itemIdentifierForIndexPath:v7];

  switch(objc_msgSend(v9, "ntk_itemType"))
  {
    case 1:
    case 2:
    case 4:
      [(NTKCFaceDetailComplicationPickerViewController *)self _setCheckmarkForTableView:v6 atIndexPath:v7];
      id v10 = v9;
      uint64_t v11 = [(NTKCFaceDetailComplicationPickerViewController *)self delegate];
      [v11 faceDetailComplicationPickerViewController:self didSelectComplication:v10];

      goto LABEL_24;
    case 3:
      uint64_t v12 = [v7 section];
      objc_super v13 = [(NTKCFaceDetailComplicationPickerViewController *)self dataSource];
      v14 = [v13 snapshot];
      id v15 = [v14 sectionIdentifiers];
      v16 = [v15 objectAtIndex:v12];

      objc_super v17 = objc_msgSend(v16, "ntk_identifier");
      LODWORD(v14) = [v17 isEqualToString:@"com.apple.nanotimekit.contacts"];

      if (v14)
      {
        uint64_t v18 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v41) = 0;
          _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_DEFAULT, "Did select \"More...\" under Contacts. Loading Contacts-specific picker UI.", (uint8_t *)&v41, 2u);
        }

        v19 = objc_msgSend(v16, "ntk_identifier");
        v20 = objc_msgSend(v16, "ntk_localizedSectionName");
        v21 = [(NTKCFaceDetailComplicationPickerViewController *)self topLevelListProvider];
        v22 = [v21 detailListProviderForSectionIdentifier:v19];

        v23 = [[NTKComplicationPickerDetailViewConfiguration alloc] initWithDetailListProvider:v22 title:v20];
        objc_super v24 = NTKPeopleComplicationPickerViewController;
LABEL_7:
        v25 = (void *)[[v24 alloc] initWithDetailConfiguration:v23];
        [v25 setDelegate:self];

LABEL_23:
        [(NTKCFaceDetailComplicationPickerViewController *)self showViewController:v25 sender:self];

        goto LABEL_24;
      }
      v34 = objc_msgSend(v16, "ntk_identifier");
      v35 = [MEMORY[0x1E4F79CB0] appContainerBundleIdentifier];
      if ([v34 isEqualToString:v35])
      {
        BOOL v36 = [(NTKCFaceDetailComplicationPickerViewController *)self _showCustomHomePickerUI];

        if (v36)
        {
          v37 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v41) = 0;
            _os_log_impl(&dword_1BC5A9000, v37, OS_LOG_TYPE_DEFAULT, "Did select \"More...\" under NanoHome. Loading Home-specific picker UI.", (uint8_t *)&v41, 2u);
          }

          v19 = objc_msgSend(v16, "ntk_identifier");
          v20 = objc_msgSend(v16, "ntk_localizedSectionName");
          v38 = [(NTKCFaceDetailComplicationPickerViewController *)self topLevelListProvider];
          v22 = [v38 detailListProviderForSectionIdentifier:v19];

          v23 = [[NTKComplicationPickerDetailViewConfiguration alloc] initWithDetailListProvider:v22 title:v20];
          objc_super v24 = NTKHomeListPickerViewController;
          goto LABEL_7;
        }
      }
      else
      {
      }
      v39 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = objc_msgSend(v16, "ntk_identifier");
        int v41 = 138412290;
        v42 = v40;
        _os_log_impl(&dword_1BC5A9000, v39, OS_LOG_TYPE_DEFAULT, "Did select \"More...\" under section %@", (uint8_t *)&v41, 0xCu);
      }
      v25 = [(NTKCFaceDetailComplicationPickerViewController *)self detailViewControllerForSectionInfo:v16];
      goto LABEL_23;
    case 6:
      [(NTKCFaceDetailComplicationPickerViewController *)self _setCheckmarkForTableView:v6 atIndexPath:v7];
      if (![(NTKCFaceDetailComplicationPickerViewController *)self _handleWidgetItemSelection:v9])
      {
        v26 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[NTKCFaceDetailComplicationPickerViewController tableView:didSelectRowAtIndexPath:](v26, v27, v28, v29, v30, v31, v32, v33);
        }
        goto LABEL_13;
      }
      goto LABEL_24;
    default:
      v26 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[NTKCFaceDetailComplicationPickerViewController tableView:didSelectRowAtIndexPath:](v9, v26);
      }
LABEL_13:

LABEL_24:
      return;
  }
}

- (void)faceDetailComplicationPickerViewController:(id)a3 didSelectComplication:(id)a4
{
  id v5 = a4;
  id v6 = [(NTKCFaceDetailComplicationPickerViewController *)self delegate];
  [v6 faceDetailComplicationPickerViewController:self didSelectComplication:v5];
}

- (void)peopleComplicationPickerViewController:(id)a3 didSelectItem:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(NTKCFaceDetailComplicationPickerViewController *)self delegate];
    [v5 faceDetailComplicationPickerViewController:self didSelectComplication:v6];
  }
}

- (void)homeListPickerViewController:(id)a3 didSelectItem:(id)a4
{
  id v5 = a4;
  if (![(NTKCFaceDetailComplicationPickerViewController *)self _handleWidgetItemSelection:v5]&& ![(NTKCFaceDetailComplicationPickerViewController *)self _handleHomeItemSelection:v5])
  {
    id v6 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NTKCFaceDetailComplicationPickerViewController homeListPickerViewController:didSelectItem:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)homeDetailPickerViewController:(id)a3 didSelectItem:(id)a4
{
  if (![(NTKCFaceDetailComplicationPickerViewController *)self _handleWidgetItemSelection:a4])
  {
    id v4 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[NTKCFaceDetailComplicationPickerViewController homeDetailPickerViewController:didSelectItem:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (BOOL)_showCustomHomePickerUI
{
  v2 = [MEMORY[0x1E4F19A30] currentDevice];
  char v3 = [MEMORY[0x1E4F79CA0] eagleRoostFeatureFlagIsEnabled];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4AA0FC66-2573-4079-A68E-D366D9AD3489"];
  char v5 = [v2 supportsCapability:v4];

  return v3 & v5;
}

- (BOOL)_handleWidgetItemSelection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t v6 = [v4 widgetComplication];
    uint64_t v7 = [(NTKCFaceDetailComplicationPickerViewController *)self delegate];
    [v7 faceDetailComplicationPickerViewController:self didSelectComplication:v6];
  }
  return isKindOfClass & 1;
}

- (BOOL)_handleHomeItemSelection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v6 = v4;
    uint64_t v7 = [v6 homeLocalizedName];
    uint64_t v8 = [(NTKCFaceDetailComplicationPickerViewController *)self topLevelListProvider];
    uint64_t v9 = [MEMORY[0x1E4F79CB0] appContainerBundleIdentifier];
    uint64_t v10 = [v8 detailListProviderForSectionIdentifier:v9];

    uint64_t v11 = [[NTKComplicationPickerDetailViewConfiguration alloc] initWithDetailListProvider:v10 title:v7];
    uint64_t v12 = [[NTKHomeDetailPickerViewController alloc] initWithDetailConfiguration:v11 homeListItem:v6];

    [(NTKHomeDetailPickerViewController *)v12 setDelegate:self];
    [(NTKCFaceDetailComplicationPickerViewController *)self showViewController:v12 sender:self];
  }
  return isKindOfClass & 1;
}

- (void)_setCheckmarkForTableView:(id)a3 atIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [(NTKCFaceDetailComplicationPickerViewController *)self listProvider];
  uint64_t v8 = [v7 pickerSelectedItem];

  if (v8)
  {
    uint64_t v9 = [(NTKCFaceDetailComplicationPickerViewController *)self dataSource];
    uint64_t v10 = [v9 indexPathForItemIdentifier:v8];

    uint64_t v11 = [v13 cellForRowAtIndexPath:v10];
    objc_msgSend(v11, "ntk_setPickerSelected:", 0);
  }
  uint64_t v12 = [v13 cellForRowAtIndexPath:v6];
  objc_msgSend(v12, "ntk_setPickerSelected:", 1);
}

- (NSString)slot
{
  return self->_slot;
}

- (NTKCFaceDetailComplicationPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKCFaceDetailComplicationPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITableViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NTKCFaceDetailComplicationCellProvider)cellProvider
{
  return self->_cellProvider;
}

- (void)setCellProvider:(id)a3
{
}

- (NTKComplicationPickerListProvider)listProvider
{
  return self->_listProvider;
}

- (NTKFaceSlotComplicationTopLevelListProvider)topLevelListProvider
{
  return self->_topLevelListProvider;
}

- (NSIndexPath)indexPathToScrollToAfterLayout
{
  return self->_indexPathToScrollToAfterLayout;
}

- (void)setIndexPathToScrollToAfterLayout:(id)a3
{
}

- (BOOL)hasDoneInitialScrollToItem
{
  return self->_hasDoneInitialScrollToItem;
}

- (void)setHasDoneInitialScrollToItem:(BOOL)a3
{
  self->_hasDoneInitialScrollToItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathToScrollToAfterLayout, 0);
  objc_storeStrong((id *)&self->_topLevelListProvider, 0);
  objc_storeStrong((id *)&self->_listProvider, 0);
  objc_storeStrong((id *)&self->_cellProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_slot, 0);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(a1, "ntk_itemType");
  char v5 = objc_msgSend(a1, "ntk_identifier");
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Item with type %ld and identifier %@ not expected to appear on top level detail picker view!", (uint8_t *)&v6, 0x16u);
}

- (void)tableView:(uint64_t)a3 didSelectRowAtIndexPath:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)homeListPickerViewController:(uint64_t)a3 didSelectItem:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)homeDetailPickerViewController:(uint64_t)a3 didSelectItem:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end