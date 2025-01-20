@interface PXSettingsConfigurationsViewController
- (BOOL)areAllActionsAvailable;
- (PXSettings)settings;
- (PXSettingsConfigurationsSource)source;
- (PXSettingsConfigurationsViewController)initWithCoder:(id)a3;
- (PXSettingsConfigurationsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXSettingsConfigurationsViewController)initWithSettings:(id)a3;
- (PXSettingsConfigurationsViewController)initWithStyle:(int64_t)a3;
- (UIAlertAction)promptConfirmAction;
- (UITextField)promptTextField;
- (id)_titleForSettings:(id)a3;
- (id)_untitledName;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleDone:(id)a3;
- (void)_promptNameWithAlertTitle:(id)a3 message:(id)a4 proposedNamed:(id)a5 confirmationButtonTitle:(id)a6 completionHandler:(id)a7;
- (void)_promptedNameDidChange:(id)a3;
- (void)_shareConfigurations:(id)a3;
- (void)_updateAvailableActions;
- (void)setAreAllActionsAvailable:(BOOL)a3;
- (void)setPromptConfirmAction:(id)a3;
- (void)setPromptTextField:(id)a3;
- (void)settingsConfigurationSource:(id)a3 didChange:(id)a4;
- (void)settingsConfigurationSource:(id)a3 performChanges:(id)a4;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PXSettingsConfigurationsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptConfirmAction, 0);
  objc_storeStrong((id *)&self->_promptTextField, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)setPromptConfirmAction:(id)a3
{
}

- (UIAlertAction)promptConfirmAction
{
  return self->_promptConfirmAction;
}

- (void)setPromptTextField:(id)a3
{
}

- (UITextField)promptTextField
{
  return self->_promptTextField;
}

- (BOOL)areAllActionsAvailable
{
  return self->_areAllActionsAvailable;
}

- (PXSettingsConfigurationsSource)source
{
  return self->_source;
}

- (PXSettings)settings
{
  return self->_settings;
}

- (void)settingsConfigurationSource:(id)a3 didChange:(id)a4
{
  id v5 = a4;
  if ([(PXSettingsConfigurationsViewController *)self isViewLoaded])
  {
    v6 = [(PXSettingsConfigurationsViewController *)self tableView];
    if ([v5 hasIncrementalChanges] && !objc_msgSend(v5, "hasMoves"))
    {
      v8 = [v5 removedIndexes];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke;
      v17[3] = &unk_1E5DD3010;
      id v9 = v6;
      id v18 = v9;
      [v8 enumerateIndexesUsingBlock:v17];

      v10 = [v5 insertedIndexes];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke_2;
      v15[3] = &unk_1E5DD3010;
      id v11 = v9;
      id v16 = v11;
      [v10 enumerateIndexesUsingBlock:v15];

      v12 = [v5 changedIndexes];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke_3;
      v13[3] = &unk_1E5DD3010;
      id v14 = v11;
      [v12 enumerateIndexesUsingBlock:v13];
    }
    else
    {
      v7 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
      [v6 reloadSections:v7 withRowAnimation:100];
    }
    [(PXSettingsConfigurationsViewController *)self _updateAvailableActions];
  }
}

void __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke(uint64_t a1, uint64_t a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:0];
  v5[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 deleteRowsAtIndexPaths:v4 withRowAnimation:100];
}

void __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:0];
  v5[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 insertRowsAtIndexPaths:v4 withRowAnimation:100];
}

void __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:0];
  v5[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 reloadRowsAtIndexPaths:v4 withRowAnimation:100];
}

- (void)settingsConfigurationSource:(id)a3 performChanges:(id)a4
{
  v7 = (void (**)(void))a4;
  if ([(PXSettingsConfigurationsViewController *)self isViewLoaded]
    && ([(PXSettingsConfigurationsViewController *)self tableView],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    [v5 performBatchUpdates:v7 completion:0];
  }
  else
  {
    v7[2]();
  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v6 = a4;
  if ([v6 section])
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PXSettingsConfigurationsViewController.m", 318, @"Invalid parameter not satisfying: %@", @"indexPath.section == SectionConfigurations" object file lineNumber description];
  }
  v7 = [(PXSettingsConfigurationsViewController *)self source];
  uint64_t v8 = [v6 item];

  id v9 = [v7 configurationAtIndex:v8];
  v10 = (void *)MEMORY[0x1E4FB1418];
  id v11 = [v9 name];
  v12 = [v9 settings];
  v13 = [(PXSettingsConfigurationsViewController *)self _titleForSettings:v12];
  id v14 = [v10 alertControllerWithTitle:v11 message:v13 preferredStyle:1];

  v15 = (void *)MEMORY[0x1E4FB1410];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke;
  v34[3] = &unk_1E5DD1068;
  v34[4] = self;
  id v16 = v9;
  id v35 = v16;
  v17 = [v15 actionWithTitle:@"Share…" style:0 handler:v34];
  [v14 addAction:v17];

  id v18 = (void *)MEMORY[0x1E4FB1410];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_2;
  v31[3] = &unk_1E5DC28F8;
  v31[4] = self;
  id v19 = v16;
  id v32 = v19;
  id v20 = v7;
  id v33 = v20;
  v21 = [v18 actionWithTitle:@"Update…" style:0 handler:v31];
  [v14 addAction:v21];

  v22 = (void *)MEMORY[0x1E4FB1410];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_5;
  v28[3] = &unk_1E5DC28F8;
  v28[4] = self;
  id v29 = v19;
  id v30 = v20;
  id v23 = v20;
  id v24 = v19;
  v25 = [v22 actionWithTitle:@"Rename…" style:0 handler:v28];
  [v14 addAction:v25];

  v26 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v14 addAction:v26];

  [(PXSettingsConfigurationsViewController *)self presentViewController:v14 animated:1 completion:0];
}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 _shareConfigurations:v2];
}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_2(id *a1)
{
  id v2 = [NSString alloc];
  id v3 = a1[4];
  v4 = [a1[5] settings];
  id v5 = [v3 _titleForSettings:v4];
  id v6 = (void *)[v2 initWithFormat:@"Using current values for the settings ”%@”", v5];

  v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Update Configuration" message:v6 preferredStyle:1];
  uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_3;
  v11[3] = &unk_1E5DD1068;
  id v12 = a1[6];
  id v13 = a1[5];
  id v9 = [v8 actionWithTitle:@"Update" style:0 handler:v11];
  [v7 addAction:v9];

  v10 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v7 addAction:v10];

  [a1[4] presentViewController:v7 animated:1 completion:0];
}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) name];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_6;
  v4[3] = &unk_1E5DD0BD0;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v2 _promptNameWithAlertTitle:&stru_1F00B0030 message:0 proposedNamed:v3 confirmationButtonTitle:@"Rename" completionHandler:v4];
}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_7;
    v5[3] = &unk_1E5DC2920;
    id v6 = v4;
    id v7 = *(id *)(a1 + 40);
    id v8 = v3;
    [v6 performChanges:v5];
  }
}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_7(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "renameConfigurationAtIndex:withName:", objc_msgSend(v3, "indexOfConfiguration:", v4), a1[6]);
}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_4;
  v3[3] = &unk_1E5DC28D0;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  [v4 performChanges:v3];
}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v4, "updateConfigurationAtIndex:", objc_msgSend(v2, "indexOfConfiguration:", v3));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == 1)
  {
    switch([v7 item])
    {
      case 0:
        id v13 = [(PXSettingsConfigurationsViewController *)self settings];
        id v14 = [NSString alloc];
        v15 = [(PXSettingsConfigurationsViewController *)self _titleForSettings:v13];
        v10 = (void *)[v14 initWithFormat:@"Using current values for the settings ”%@”", v15];

        id v16 = [(PXSettingsConfigurationsViewController *)self _untitledName];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v37[3] = &unk_1E5DD0BD0;
        id v38 = v13;
        v39 = self;
        id v17 = v13;
        [(PXSettingsConfigurationsViewController *)self _promptNameWithAlertTitle:@"New Configuration" message:v10 proposedNamed:v16 confirmationButtonTitle:@"Create" completionHandler:v37];

        goto LABEL_19;
      case 1:
        id v18 = [MEMORY[0x1E4FB1A78] generalPasteboard];
        v10 = [v18 string];

        id v19 = +[PXSettingsConfiguration configurationsFromSharableString:v10];
        if ([v19 count])
        {
          uint64_t v20 = [v19 count];
          v21 = NSString;
          if (v20 == 1)
          {
            v22 = [v19 firstObject];
            id v23 = [v22 name];
            id v24 = [v21 stringWithFormat:@"Import configuration ”%@”?", v23];
          }
          else
          {
            id v24 = objc_msgSend(NSString, "stringWithFormat:", @"Import %li configurations?", v20);
          }
          id v30 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v24 message:0 preferredStyle:1];
          v31 = (void *)MEMORY[0x1E4FB1410];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
          v35[3] = &unk_1E5DD1068;
          v35[4] = self;
          id v36 = v19;
          id v32 = [v31 actionWithTitle:@"Import" style:0 handler:v35];
          [v30 addAction:v32];

          id v33 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
          [v30 addAction:v33];

          [(PXSettingsConfigurationsViewController *)self presentViewController:v30 animated:1 completion:0];
        }
        else
        {
          id v24 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"No valid text in pasteboard", @"To import configurations, make sure to first copy the text that you received from the person trying to share configurations with you.", 1 message preferredStyle];
          id v29 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
          [v24 addAction:v29];

          [(PXSettingsConfigurationsViewController *)self presentViewController:v24 animated:1 completion:0];
        }

        goto LABEL_18;
      case 2:
        v10 = [(PXSettingsConfigurationsViewController *)self source];
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([v10 numberOfConfigurations] >= 1)
        {
          uint64_t v25 = 0;
          do
          {
            v26 = [v10 configurationAtIndex:v25];
            [v19 addObject:v26];

            ++v25;
          }
          while (v25 < [v10 numberOfConfigurations]);
        }
        [(PXSettingsConfigurationsViewController *)self _shareConfigurations:v19];
LABEL_18:

        goto LABEL_19;
      case 3:
        v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Delete All Configurations?" message:0 preferredStyle:1];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5;
        v34[3] = &unk_1E5DD0030;
        v34[4] = self;
        v27 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Delete All" style:2 handler:v34];
        [v10 addAction:v27];

        v28 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
        [v10 addAction:v28];

        [(PXSettingsConfigurationsViewController *)self presentViewController:v10 animated:1 completion:0];
        goto LABEL_19;
      default:
        goto LABEL_20;
    }
  }
  if (!v8)
  {
    id v9 = [(PXSettingsConfigurationsViewController *)self source];
    v10 = objc_msgSend(v9, "configurationAtIndex:", objc_msgSend(v7, "item"));

    id v11 = [v10 settings];
    id v12 = [v10 archive];
    [v11 restoreFromArchiveDictionary:v12];

LABEL_19:
  }
LABEL_20:
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

void __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [[PXSettingsConfiguration alloc] initWithName:v3 settings:*(void *)(a1 + 32)];

    id v5 = [*(id *)(a1 + 40) source];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v7[3] = &unk_1E5DC2888;
    uint64_t v8 = v4;
    id v6 = v4;
    [v5 performChanges:v7];
  }
}

void __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) source];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
  v3[3] = &unk_1E5DC2888;
  id v4 = *(id *)(a1 + 40);
  [v2 performChanges:v3];
}

void __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) source];
  [v1 performChanges:&__block_literal_global_183228];
}

uint64_t __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 deleteAllConfigurations];
}

uint64_t __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 insertConfigurations:*(void *)(a1 + 32) atIndex:0];
}

uint64_t __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 insertConfiguration:*(void *)(a1 + 32) atIndex:0];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 section];
  if (v9)
  {
    if (v9 != 1)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXSettingsConfigurationsViewController.m" lineNumber:242 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    int64_t v10 = 0;
  }
  else
  {
    int64_t v10 = 1;
  }

  return v10;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 section];
  if (v10)
  {
    if (v10 == 1)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXSettingsConfigurationsViewController.m" lineNumber:228 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  else
  {
    id v12 = [(PXSettingsConfigurationsViewController *)self source];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__PXSettingsConfigurationsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
    v13[3] = &unk_1E5DC2888;
    id v14 = v9;
    [v12 performChanges:v13];
  }
}

void __89__PXSettingsConfigurationsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "deleteConfigurationAtIndex:", objc_msgSend(v2, "item"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == 1)
  {
    unint64_t v15 = [v7 item];
    if (v15 <= 3)
    {
      id v13 = 0;
      uint64_t v14 = 0;
      id v11 = off_1E5DC2940[v15];
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    id v9 = [(PXSettingsConfigurationsViewController *)self source];
    uint64_t v10 = objc_msgSend(v9, "configurationAtIndex:", objc_msgSend(v7, "item"));

    id v11 = [v10 name];
    id v12 = [v10 settings];
    id v13 = [(PXSettingsConfigurationsViewController *)self _titleForSettings:v12];

    uint64_t v14 = 4;
    goto LABEL_7;
  }
  id v13 = 0;
  uint64_t v14 = 0;
  id v11 = 0;
LABEL_7:
  id v16 = [v6 dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
  if (!v16)
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"cellReuseIdentifier"];
    id v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    id v18 = [v16 detailTextLabel];
    [v18 setTextColor:v17];
  }
  id v19 = [v16 textLabel];
  [v19 setText:v11];

  uint64_t v20 = [v16 detailTextLabel];
  [v20 setText:v13];

  [v16 setAccessoryType:v14];
  return v16;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 1)
  {
    if ([(PXSettingsConfigurationsViewController *)self areAllActionsAvailable]) {
      int64_t v9 = 4;
    }
    else {
      int64_t v9 = 2;
    }
  }
  else
  {
    if (a4)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXSettingsConfigurationsViewController.m" lineNumber:173 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v8 = [(PXSettingsConfigurationsViewController *)self source];
    int64_t v9 = [v8 numberOfConfigurations];
  }
  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void)_shareConfigurations:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = +[PXSettingsConfiguration sharableStringForConfigurations:a3];
  id v5 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v19[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v7 = (void *)[v5 initWithActivityItems:v6 applicationActivities:0];

  [(PXSettingsConfigurationsViewController *)self presentViewController:v7 animated:1 completion:0];
  uint64_t v8 = [(PXSettingsConfigurationsViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v8 safeAreaInsets];
  double v16 = v15;
  id v17 = [v7 popoverPresentationController];
  [v17 setSourceView:v8];

  id v18 = [v7 popoverPresentationController];
  objc_msgSend(v18, "setSourceRect:", v10, v12, v14, v16);
}

- (id)_untitledName
{
  id v2 = [(PXSettingsConfigurationsViewController *)self source];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v2 numberOfConfigurations] >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      id v5 = [v2 configurationAtIndex:v4];
      id v6 = [v5 name];
      [v3 addObject:v6];

      ++v4;
    }
    while (v4 < [v2 numberOfConfigurations]);
  }
  id v7 = @"Untitled";
  if ([v3 containsObject:@"Untitled"])
  {
    uint64_t v8 = @"Untitled";
    uint64_t v9 = 2;
    do
    {
      id v7 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Untitled %li", v9);

      ++v9;
      uint64_t v8 = v7;
    }
    while (([v3 containsObject:v7] & 1) != 0);
  }

  return v7;
}

- (id)_titleForSettings:(id)a3
{
  id v3 = [(id)objc_opt_class() settingsControllerModule];
  uint64_t v4 = [v3 valueForKey:@"title"];

  return v4;
}

- (void)_promptedNameDidChange:(id)a3
{
  id v7 = [(PXSettingsConfigurationsViewController *)self promptTextField];
  uint64_t v4 = [v7 text];
  BOOL v5 = [v4 length] != 0;
  id v6 = [(PXSettingsConfigurationsViewController *)self promptConfirmAction];
  [v6 setEnabled:v5];
}

- (void)_promptNameWithAlertTitle:(id)a3 message:(id)a4 proposedNamed:(id)a5 confirmationButtonTitle:(id)a6 completionHandler:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  double v14 = (void *)MEMORY[0x1E4FB1418];
  id v15 = a6;
  double v16 = [v14 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke;
  v31[3] = &unk_1E5DC2860;
  id v32 = v12;
  id v33 = self;
  id v17 = v12;
  [v16 addTextFieldWithConfigurationHandler:v31];
  id v18 = [v16 textFields];
  id v19 = [v18 lastObject];
  [(PXSettingsConfigurationsViewController *)self setPromptTextField:v19];

  uint64_t v20 = (void *)MEMORY[0x1E4FB1410];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke_2;
  v29[3] = &unk_1E5DC7010;
  id v21 = v13;
  v29[4] = self;
  id v30 = v21;
  v22 = [v20 actionWithTitle:v15 style:0 handler:v29];

  [(PXSettingsConfigurationsViewController *)self setPromptConfirmAction:v22];
  id v23 = [(PXSettingsConfigurationsViewController *)self promptConfirmAction];
  [v16 addAction:v23];

  id v24 = (void *)MEMORY[0x1E4FB1410];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke_3;
  v27[3] = &unk_1E5DCE788;
  id v28 = v21;
  id v25 = v21;
  v26 = [v24 actionWithTitle:@"Cancel" style:1 handler:v27];
  [v16 addAction:v26];

  [(PXSettingsConfigurationsViewController *)self presentViewController:v16 animated:1 completion:0];
}

void __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setText:v3];
  [v4 setAutocapitalizationType:2];
  [v4 setAutocorrectionType:0];
  [v4 setClearButtonMode:3];
  [v4 addTarget:*(void *)(a1 + 40) action:sel__promptedNameDidChange_ forControlEvents:0x20000];
}

void __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) promptTextField];
  id v2 = [v3 text];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAreAllActionsAvailable:(BOOL)a3
{
  if (self->_areAllActionsAvailable != a3)
  {
    self->_areAllActionsAvailable = a3;
    if ([(PXSettingsConfigurationsViewController *)self isViewLoaded])
    {
      id v8 = [(PXSettingsConfigurationsViewController *)self tableView];
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      for (uint64_t i = 2; i != 4; ++i)
      {
        id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:1];
        [v5 addObject:v7];
      }
      if (a3) {
        [v8 insertRowsAtIndexPaths:v5 withRowAnimation:100];
      }
      else {
        [v8 deleteRowsAtIndexPaths:v5 withRowAnimation:100];
      }
    }
  }
}

- (void)_updateAvailableActions
{
  id v3 = [(PXSettingsConfigurationsViewController *)self source];
  -[PXSettingsConfigurationsViewController setAreAllActionsAvailable:](self, "setAreAllActionsAvailable:", [v3 numberOfConfigurations] > 0);
}

- (void)_handleDone:(id)a3
{
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PXSettingsConfigurationsViewController;
  [(PXSettingsConfigurationsViewController *)&v5 viewDidLoad];
  id v3 = [(PXSettingsConfigurationsViewController *)self navigationItem];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleDone_];
  [v3 setRightBarButtonItem:v4];
}

- (PXSettingsConfigurationsViewController)initWithSettings:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXSettingsConfigurationsViewController;
  id v6 = [(PXSettingsConfigurationsViewController *)&v11 initWithStyle:1];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    id v8 = objc_alloc_init(PXSettingsConfigurationsSource);
    source = v7->_source;
    v7->_source = v8;

    [(PXSettingsConfigurationsSource *)v7->_source setObserver:v7];
    [(PXSettingsConfigurationsViewController *)v7 setTitle:@"Configurations"];
    [(PXSettingsConfigurationsViewController *)v7 _updateAvailableActions];
  }

  return v7;
}

- (PXSettingsConfigurationsViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSettingsConfigurationsViewController.m", 55, @"%s is not available as initializer", "-[PXSettingsConfigurationsViewController initWithCoder:]");

  abort();
}

- (PXSettingsConfigurationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSettingsConfigurationsViewController.m", 51, @"%s is not available as initializer", "-[PXSettingsConfigurationsViewController initWithNibName:bundle:]");

  abort();
}

- (PXSettingsConfigurationsViewController)initWithStyle:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSettingsConfigurationsViewController.m", 47, @"%s is not available as initializer", "-[PXSettingsConfigurationsViewController initWithStyle:]");

  abort();
}

@end