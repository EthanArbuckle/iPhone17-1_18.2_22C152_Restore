@interface PUPortraitVideoDebugController
- (NSArray)debugModes;
- (PICompositionController)compositionController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setCompositionController:(id)a3;
- (void)setDebugModes:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PUPortraitVideoDebugController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugModes, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
}

- (void)setDebugModes:(id)a3
{
}

- (NSArray)debugModes
{
  return self->_debugModes;
}

- (void)setCompositionController:(id)a3
{
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(PUPortraitVideoDebugController *)self compositionController];
  v7 = [v6 adjustmentConstants];

  v8 = [(PUPortraitVideoDebugController *)self compositionController];
  v9 = [v7 PIPortraitVideoAdjustmentKey];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PUPortraitVideoDebugController_tableView_didSelectRowAtIndexPath___block_invoke;
  v11[3] = &unk_1E5F292E0;
  id v12 = v5;
  id v10 = v5;
  [v8 modifyAdjustmentWithKey:v9 modificationBlock:v11];
}

void __68__PUPortraitVideoDebugController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setDebugMode:", objc_msgSend(v2, "row"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"cell"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"cell"];
  }
  v8 = [(PUPortraitVideoDebugController *)self debugModes];
  uint64_t v9 = [v6 row];

  id v10 = [v8 objectAtIndexedSubscript:v9];
  v11 = [v7 textLabel];
  [v11 setText:v10];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(PUPortraitVideoDebugController *)self debugModes];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)loadView
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPortraitVideoDebugController *)self compositionController];
  v44 = [v3 portraitVideoAdjustmentController];

  [(PUPortraitVideoDebugController *)self setDebugModes:&unk_1F078B228];
  id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
  [v9 addSubview:v10];
  v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v10 setFont:v11];

  [v10 setText:@"Debug:"];
  [v10 setTextAlignment:2];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  v34 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [v10 leadingAnchor];
  v42 = v9;
  v40 = [v9 layoutMarginsGuide];
  v36 = [v40 leadingAnchor];
  id v12 = [v38 constraintEqualToAnchor:v36];
  v46[0] = v12;
  v13 = [v10 trailingAnchor];
  v14 = [v10 leadingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:80.0];
  v46[1] = v15;
  v16 = [v10 topAnchor];
  v17 = [v9 layoutMarginsGuide];
  v18 = [v17 topAnchor];
  v19 = [v16 constraintEqualToAnchor:v18 constant:20.0];
  v46[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  [v34 activateConstraints:v20];

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:style:", 0, v5, v6, v7, v8);
  [v42 addSubview:v21];
  [v21 setDataSource:self];
  [v21 setDelegate:self];
  v22 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v44, "debugMode"), 0);
  [v21 selectRowAtIndexPath:v22 animated:0 scrollPosition:1];

  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  v31 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [v21 leadingAnchor];
  v39 = [v10 trailingAnchor];
  v37 = [v41 constraintEqualToAnchor:v39 constant:8.0];
  v45[0] = v37;
  v33 = [v21 trailingAnchor];
  v35 = [v42 layoutMarginsGuide];
  v32 = [v35 trailingAnchor];
  v23 = [v33 constraintEqualToAnchor:v32];
  v45[1] = v23;
  v24 = [v21 topAnchor];
  v25 = [v10 topAnchor];
  v26 = [v24 constraintEqualToAnchor:v25 constant:-10.0];
  v45[2] = v26;
  v27 = [v21 heightAnchor];
  v28 = [(PUPortraitVideoDebugController *)self debugModes];
  v29 = objc_msgSend(v27, "constraintEqualToConstant:", (double)(unint64_t)objc_msgSend(v28, "count") * 44.0);
  v45[3] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
  [v31 activateConstraints:v30];

  [(PUPortraitVideoDebugController *)self setView:v42];
}

@end