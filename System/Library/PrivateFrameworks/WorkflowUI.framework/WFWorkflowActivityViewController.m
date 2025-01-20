@interface WFWorkflowActivityViewController
- (BOOL)_customizationAvailableForActivityViewController:(id)a3;
- (WFFileRepresentation)workflowFile;
- (WFSignedShortcutFileProvider)signedShortcutFileProvider;
- (WFWorkflow)workflow;
- (WFWorkflowActivityViewController)initWithWorkflow:(id)a3 applicationActivities:(id)a4;
- (WFWorkflowLinkProvider)linkProvider;
- (id)_customizationGroupsForActivityViewController:(id)a3;
- (id)generateSharingDestinationGroup;
- (id)generateSharingModeGroup;
- (int64_t)selectedDestination;
- (int64_t)selectedMode;
- (void)_customizationsDidChange;
- (void)setLinkProvider:(id)a3;
- (void)setSelectedDestination:(int64_t)a3;
- (void)setSelectedMode:(int64_t)a3;
- (void)setSignedShortcutFileProvider:(id)a3;
- (void)setWorkflow:(id)a3;
- (void)setWorkflowFile:(id)a3;
@end

@implementation WFWorkflowActivityViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedShortcutFileProvider, 0);
  objc_storeStrong((id *)&self->_linkProvider, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_workflowFile, 0);
}

- (void)setSignedShortcutFileProvider:(id)a3
{
}

- (WFSignedShortcutFileProvider)signedShortcutFileProvider
{
  return self->_signedShortcutFileProvider;
}

- (void)setLinkProvider:(id)a3
{
}

- (WFWorkflowLinkProvider)linkProvider
{
  return self->_linkProvider;
}

- (void)setWorkflow:(id)a3
{
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setWorkflowFile:(id)a3
{
}

- (WFFileRepresentation)workflowFile
{
  return self->_workflowFile;
}

- (void)setSelectedDestination:(int64_t)a3
{
  self->_selectedDestination = a3;
}

- (int64_t)selectedDestination
{
  return self->_selectedDestination;
}

- (void)setSelectedMode:(int64_t)a3
{
  self->_selectedMode = a3;
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (BOOL)_customizationAvailableForActivityViewController:(id)a3
{
  return 1;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v4 = [(WFWorkflowActivityViewController *)self generateSharingModeGroup];
  v5 = (void *)MEMORY[0x263EFF980];
  v10[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  v7 = [v5 arrayWithArray:v6];

  if ([(WFWorkflowActivityViewController *)self selectedMode] == 1)
  {
    v8 = [(WFWorkflowActivityViewController *)self generateSharingDestinationGroup];
    [v7 addObject:v8];
  }
  return v7;
}

- (id)generateSharingDestinationGroup
{
  v19[2] = *MEMORY[0x263EF8340];
  v3 = WFLocalizedString(@"Anyone");
  v19[0] = v3;
  v4 = WFLocalizedString(@"People Who Know Me");
  v19[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];

  int64_t v6 = [(WFWorkflowActivityViewController *)self selectedDestination];
  if (!v6)
  {
    v7 = @"When you export a shortcut file for anyone, Apple will sign your shortcut on its server.";
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    v7 = @"Only people who have you in their contacts will be able to use the shortcut. Your contact info will be included in the shortcut file for verification.\n\nYou can also use this option to make a personal backup of your shortcuts.";
LABEL_5:
    v8 = WFLocalizedString(v7);
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  v9 = (void *)MEMORY[0x263F6BCC0];
  int64_t v10 = [(WFWorkflowActivityViewController *)self selectedDestination];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__WFWorkflowActivityViewController_generateSharingDestinationGroup__block_invoke;
  v17[3] = &unk_2649CAF20;
  v17[4] = self;
  v11 = [v9 pickerCustomizationWithIdentifier:@"WFWorkflowSharingDestinationPicker" options:v5 selectedOptionIndex:v10 footerText:v8 valueChangedHandler:v17];
  id v12 = objc_alloc(MEMORY[0x263F6BCC8]);
  v13 = WFLocalizedString(@"For");
  v18 = v11;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  v15 = (void *)[v12 _initGroupWithName:v13 identifier:@"WFWorkflowSharingDestinationGroup" customizations:v14];

  return v15;
}

void __67__WFWorkflowActivityViewController_generateSharingDestinationGroup__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) selectedDestination];
  if (v3 != [v4 selectedOptionIndex])
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedDestination:", objc_msgSend(v4, "selectedOptionIndex"));
    [*(id *)(a1 + 32) _customizationsDidChange];
  }
}

- (id)generateSharingModeGroup
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = WFLocalizedString(@"iCloud Link");
  v16[0] = v3;
  id v4 = WFLocalizedString(@"File");
  v16[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

  int64_t v6 = (void *)MEMORY[0x263F6BCC0];
  int64_t v7 = [(WFWorkflowActivityViewController *)self selectedMode];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__WFWorkflowActivityViewController_generateSharingModeGroup__block_invoke;
  v14[3] = &unk_2649CAF20;
  v14[4] = self;
  v8 = [v6 pickerCustomizationWithIdentifier:@"WFWorkflowSharingModePicker" options:v5 selectedOptionIndex:v7 footerText:0 valueChangedHandler:v14];
  id v9 = objc_alloc(MEMORY[0x263F6BCC8]);
  int64_t v10 = WFLocalizedString(@"Send As");
  v15 = v8;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  id v12 = (void *)[v9 _initGroupWithName:v10 identifier:@"WFWorkflowSharingModeGroup" customizations:v11];

  return v12;
}

void __60__WFWorkflowActivityViewController_generateSharingModeGroup__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) selectedMode];
  if (v3 != [v4 selectedOptionIndex])
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedMode:", objc_msgSend(v4, "selectedOptionIndex"));
    [*(id *)(a1 + 32) _customizationsDidChange];
  }
}

- (void)_customizationsDidChange
{
  void v19[3] = *MEMORY[0x263EF8340];
  if ([(WFWorkflowActivityViewController *)self selectedMode])
  {
    if ([(WFWorkflowActivityViewController *)self selectedMode] != 1) {
      return;
    }
    uint64_t v3 = WFUserInterfaceFromViewController();
    int64_t v4 = [(WFWorkflowActivityViewController *)self selectedDestination];
    if (v4 == 1)
    {
      v5 = WFP2PSignedShortcutFileProvider;
    }
    else
    {
      if (v4)
      {
LABEL_9:
        uint64_t v13 = *MEMORY[0x263F6BCD0];
        v17[0] = *MEMORY[0x263F6BCE8];
        v17[1] = v13;
        v17[2] = *MEMORY[0x263F6BCE0];
        v17[3] = v13;
        v17[4] = *MEMORY[0x263F6BD40];
        v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:5];
        [(WFWorkflowActivityViewController *)self setExcludedActivityTypes:v14];

        v8 = [(WFWorkflowActivityViewController *)self signedShortcutFileProvider];
        v16[0] = v8;
        id v9 = [(WFWorkflowActivityViewController *)self workflow];
        v16[1] = v9;
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
        [(WFWorkflowActivityViewController *)self _updateActivityItems:v15];

        goto LABEL_10;
      }
      v5 = WFICloudSignedShortcutFileProvider;
    }
    id v10 = [v5 alloc];
    v11 = [(WFWorkflowActivityViewController *)self workflow];
    id v12 = (void *)[v10 initWithWorkflow:v11 userInterface:v3];
    [(WFWorkflowActivityViewController *)self setSignedShortcutFileProvider:v12];

    goto LABEL_9;
  }
  uint64_t v6 = *MEMORY[0x263F6BCD0];
  v19[0] = *MEMORY[0x263F6BCE8];
  v19[1] = v6;
  v19[2] = *MEMORY[0x263F6BCE0];
  int64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
  [(WFWorkflowActivityViewController *)self setExcludedActivityTypes:v7];

  uint64_t v3 = [(WFWorkflowActivityViewController *)self linkProvider];
  v18[0] = v3;
  v8 = [(WFWorkflowActivityViewController *)self workflow];
  v18[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [(WFWorkflowActivityViewController *)self _updateActivityItems:v9];
LABEL_10:
}

- (WFWorkflowActivityViewController)initWithWorkflow:(id)a3 applicationActivities:(id)a4
{
  v36[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = WFGallerySharingURLForIdentifier();
  id v9 = (void *)[v7 mutableCopy];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  uint64_t v13 = [[WFWorkflowCopyActivity alloc] initWithExcludedURL:v8];
  [v12 insertObject:v13 atIndex:0];

  v14 = WFUserInterfaceFromViewController();
  v15 = [[WFWorkflowLinkProvider alloc] initWithWorkflow:v6 userInterface:v14];
  v36[0] = v15;
  v36[1] = v6;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  v33.receiver = self;
  v33.super_class = (Class)WFWorkflowActivityViewController;
  v17 = [(WFWorkflowActivityViewController *)&v33 initWithActivityItems:v16 applicationActivities:v12];

  if (v17)
  {
    [(WFWorkflowActivityViewController *)v17 setLinkProvider:v15];
    [(WFWorkflowActivityViewController *)v17 setWorkflow:v6];
    v18 = [(WFWorkflowActivityViewController *)v17 workflow];
    int v19 = [v18 isReportable];

    if (v19)
    {
      objc_initWeak(&location, v17);
      v20 = [WFReportShortcutActivity alloc];
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __75__WFWorkflowActivityViewController_initWithWorkflow_applicationActivities___block_invoke;
      v30 = &unk_2649CAEF8;
      objc_copyWeak(&v31, &location);
      v21 = [(WFReportShortcutActivity *)v20 initWithWorkflow:v6 completion:&v27];
      -[WFReportShortcutActivity setActivityControler:](v21, "setActivityControler:", v17, v27, v28, v29, v30);
      [v12 addObject:v21];
      v35[0] = v15;
      v35[1] = v6;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
      [(WFWorkflowActivityViewController *)v17 _updateActivityItems:v22 applicationActivities:v12];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    uint64_t v23 = *MEMORY[0x263F6BCD0];
    v34[0] = *MEMORY[0x263F6BCE8];
    v34[1] = v23;
    v34[2] = *MEMORY[0x263F6BCE0];
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:3];
    [(WFWorkflowActivityViewController *)v17 setExcludedActivityTypes:v24];

    [(WFWorkflowActivityViewController *)v17 setObjectManipulationDelegate:v17];
    v25 = v17;
  }

  return v17;
}

void __75__WFWorkflowActivityViewController_initWithWorkflow_applicationActivities___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancel];
}

@end