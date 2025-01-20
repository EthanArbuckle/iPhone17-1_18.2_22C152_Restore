@interface VTUIVoiceSelectionOptionsView
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (CGSize)_cellSizeForSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUICVoiceSelectionEventHandling)voiceSelectionEventHandler;
- (SUICVoiceSelectionViewModelProviding)voiceSelectionViewModelProvider;
- (VTUIVoiceSelectionOptionsView)init;
- (id)_diffableTableDataSource;
- (id)_tableCellForVoiceViewModel:(id)a3 indexPath:(id)a4;
- (void)_createAndApplySnapshotForViewModel:(id)a3;
- (void)_setupVoicesTableView;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setVoiceSelectionEventHandler:(id)a3;
- (void)setVoiceSelectionViewModelProvider:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)voiceSelectionViewModelDidChange;
@end

@implementation VTUIVoiceSelectionOptionsView

- (VTUIVoiceSelectionOptionsView)init
{
  v5.receiver = self;
  v5.super_class = (Class)VTUIVoiceSelectionOptionsView;
  v2 = [(VTUIVoiceSelectionOptionsView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(VTUIVoiceSelectionOptionsView *)v2 _setupVoicesTableView];
  }
  return v3;
}

- (void)_setupVoicesTableView
{
  v24[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  voicesTableView = self->_voicesTableView;
  self->_voicesTableView = v4;

  v6 = [(VTUIVoiceSelectionOptionsView *)self _diffableTableDataSource];
  tableViewDataSource = self->_tableViewDataSource;
  self->_tableViewDataSource = v6;

  [(UITableViewDiffableDataSource *)self->_tableViewDataSource setDefaultRowAnimation:5];
  [(UITableView *)self->_voicesTableView setDelegate:self];
  [(UITableView *)self->_voicesTableView setDataSource:self->_tableViewDataSource];
  [(UITableView *)self->_voicesTableView setShowsHorizontalScrollIndicator:0];
  [(UITableView *)self->_voicesTableView setShowsVerticalScrollIndicator:0];
  v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [(UITableView *)self->_voicesTableView setBackgroundColor:v8];

  v9 = [(UITableView *)self->_voicesTableView layer];
  [v9 setCornerRadius:8.0];

  [(UITableView *)self->_voicesTableView registerClass:objc_opt_class() forCellReuseIdentifier:@"VoiceCell"];
  [(VTUIVoiceSelectionOptionsView *)self addSubview:self->_voicesTableView];
  [(UITableView *)self->_voicesTableView setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = (void *)MEMORY[0x263F08938];
  v23 = [(UITableView *)self->_voicesTableView topAnchor];
  v22 = [(VTUIVoiceSelectionOptionsView *)self topAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v24[0] = v21;
  v10 = [(UITableView *)self->_voicesTableView leftAnchor];
  v11 = [(VTUIVoiceSelectionOptionsView *)self leftAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v24[1] = v12;
  v13 = [(UITableView *)self->_voicesTableView rightAnchor];
  v14 = [(VTUIVoiceSelectionOptionsView *)self rightAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v24[2] = v15;
  v16 = [(UITableView *)self->_voicesTableView bottomAnchor];
  v17 = [(VTUIVoiceSelectionOptionsView *)self bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v24[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
  [v20 activateConstraints:v19];
}

- (id)_diffableTableDataSource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F82C90]);
  voicesTableView = self->_voicesTableView;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__VTUIVoiceSelectionOptionsView__diffableTableDataSource__block_invoke;
  v7[3] = &unk_264D4C7C8;
  objc_copyWeak(&v8, &location);
  objc_super v5 = (void *)[v3 initWithTableView:voicesTableView cellProvider:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

id __57__VTUIVoiceSelectionOptionsView__diffableTableDataSource__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained[52] voices];
    id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

    v9 = [v6 _tableCellForVoiceViewModel:v8 indexPath:v4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_tableCellForVoiceViewModel:(id)a3 indexPath:(id)a4
{
  voicesTableView = self->_voicesTableView;
  id v7 = a3;
  id v8 = [(UITableView *)voicesTableView dequeueReusableCellWithIdentifier:@"VoiceCell" forIndexPath:a4];
  v9 = [MEMORY[0x263F82918] cellConfiguration];
  v10 = [v7 localizedDisplayName];
  [v9 setText:v10];

  [v8 setContentConfiguration:v9];
  v11 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v8 setBackgroundColor:v11];

  LODWORD(v11) = [v7 isCurrentSiriVoice];
  if (v11) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 0;
  }
  [v8 setAccessoryType:v12];
  objc_msgSend(v8, "setSemanticContentAttribute:", -[UITableView semanticContentAttribute](self->_voicesTableView, "semanticContentAttribute"));

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v9 = [(VTUIVoiceSelectionOptionsView *)self voiceSelectionEventHandler];
  v6 = [(SUICVoiceSelectionViewModel *)self->_viewModel voices];
  uint64_t v7 = [v5 row];

  id v8 = [v6 objectAtIndexedSubscript:v7];
  [v9 voiceSelectionView:self receivedRequestToSelectVoice:v8];
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (void)voiceSelectionViewModelDidChange
{
  id v3 = [(VTUIVoiceSelectionOptionsView *)self voiceSelectionViewModelProvider];
  id v4 = [v3 voiceSelectionViewModel];
  viewModel = self->_viewModel;
  self->_viewModel = v4;

  v6 = self->_viewModel;
  [(VTUIVoiceSelectionOptionsView *)self _createAndApplySnapshotForViewModel:v6];
}

- (void)_createAndApplySnapshotForViewModel:(id)a3
{
  v18 = self;
  v31[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F82358]);
  v31[0] = @"Voice";
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  [v4 appendSectionsWithIdentifiers:v5];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v19 = v3;
  v6 = [v3 voices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "localizedDisplayName", v18);

        if (v12)
        {
          v13 = [v11 localizedDisplayName];
          v29 = v13;
          v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
          [v4 appendItemsWithIdentifiers:v14 intoSectionWithIdentifier:@"Voice"];

          v15 = [v11 localizedDisplayName];
          v28 = v15;
          v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
          [v4 reloadItemsWithIdentifiers:v16];
        }
        else
        {
          v17 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v25 = "-[VTUIVoiceSelectionOptionsView _createAndApplySnapshotForViewModel:]";
            __int16 v26 = 2112;
            v27 = v11;
            _os_log_error_impl(&dword_238878000, v17, OS_LOG_TYPE_ERROR, "%s Unable to determine localized display name for %@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v8);
  }

  [(UITableViewDiffableDataSource *)v18->_tableViewDataSource applySnapshot:v4 animatingDifferences:0];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VTUIVoiceSelectionOptionsView;
  -[VTUIVoiceSelectionOptionsView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(UITableView *)self->_voicesTableView setSemanticContentAttribute:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(SUICVoiceSelectionViewModel *)self->_viewModel voices];
  double v7 = (double)(unint64_t)[v6 count];
  -[VTUIVoiceSelectionOptionsView _cellSizeForSize:](self, "_cellSizeForSize:", width, height);
  double v9 = v8 * v7;

  double v10 = width;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)_cellSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_alloc_init(MEMORY[0x263F82C80]);
  double v7 = [MEMORY[0x263F82918] cellConfiguration];
  [v7 setText:@"Height Check"];
  [v6 setContentConfiguration:v7];
  objc_msgSend(v6, "setSemanticContentAttribute:", -[UITableView semanticContentAttribute](self->_voicesTableView, "semanticContentAttribute"));
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (SUICVoiceSelectionViewModelProviding)voiceSelectionViewModelProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceSelectionViewModelProvider);
  return (SUICVoiceSelectionViewModelProviding *)WeakRetained;
}

- (void)setVoiceSelectionViewModelProvider:(id)a3
{
}

- (SUICVoiceSelectionEventHandling)voiceSelectionEventHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceSelectionEventHandler);
  return (SUICVoiceSelectionEventHandling *)WeakRetained;
}

- (void)setVoiceSelectionEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceSelectionEventHandler);
  objc_destroyWeak((id *)&self->_voiceSelectionViewModelProvider);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_voicesTableView, 0);
}

@end