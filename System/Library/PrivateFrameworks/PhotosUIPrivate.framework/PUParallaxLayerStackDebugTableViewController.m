@interface PUParallaxLayerStackDebugTableViewController
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (PUParallaxLayerStackView)layerStackView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)labelForLayer:(id)a3;
- (id)layerForIndexPath:(id)a3;
- (id)layersSortedByViewDepth;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)requestNewZPositionForCellAtIndexPath:(id)a3;
- (void)setLayerStackView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation PUParallaxLayerStackDebugTableViewController

- (void).cxx_destruct
{
}

- (PUParallaxLayerStackView)layerStackView
{
  return self->_layerStackView;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v9 isEqual:v10] & 1) == 0)
  {
    v45 = v8;
    v11 = [(PUParallaxLayerStackDebugTableViewController *)self layerStackView];
    v12 = [v11 viewModel];

    v13 = [v12 viewManager];
    v44 = [(PUParallaxLayerStackDebugTableViewController *)self layerForIndexPath:v9];
    v14 = objc_msgSend(v13, "viewForLayer:");
    v15 = [(PUParallaxLayerStackDebugTableViewController *)self layerForIndexPath:v10];
    v16 = [v13 viewForLayer:v15];
    v17 = [(PUParallaxLayerStackDebugTableViewController *)self layersSortedByViewDepth];
    uint64_t v18 = [v17 indexOfObject:v15];
    v46 = v14;
    v19 = [v14 layer];
    [v19 zPosition];
    double v21 = v20;
    v22 = [v16 layer];
    [v22 zPosition];
    double v24 = v23;

    v47 = v12;
    if (v21 >= v24)
    {
      unint64_t v33 = v18 + 1;
      if (v33 < [v17 count])
      {
        v25 = [v17 objectAtIndexedSubscript:v33];
        v34 = [v13 viewForLayer:v25];
        v35 = [v16 layer];
        [v35 zPosition];
        double v37 = v36;
        v38 = [v34 layer];
        [v38 zPosition];
        double v32 = (v37 + v39) * 0.5;

        goto LABEL_10;
      }
      v25 = [v16 layer];
      [v25 zPosition];
      double v41 = -5.0;
    }
    else
    {
      if (v18)
      {
        v25 = [v17 objectAtIndexedSubscript:v18 - 1];
        v26 = [v13 viewForLayer:v25];
        v27 = [v16 layer];
        [v27 zPosition];
        double v29 = v28;
        v30 = [v26 layer];
        [v30 zPosition];
        double v32 = (v29 + v31) * 0.5;

LABEL_10:
        id v8 = v45;

        v42 = [v46 layer];
        [v42 setZPosition:v32];

        dispatch_time_t v43 = dispatch_time(0, 250000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __89__PUParallaxLayerStackDebugTableViewController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke;
        block[3] = &unk_1E5F2ECC8;
        id v49 = v45;
        id v50 = v10;
        dispatch_after(v43, MEMORY[0x1E4F14428], block);

        goto LABEL_11;
      }
      v25 = [v16 layer];
      [v25 zPosition];
      double v41 = 5.0;
    }
    double v32 = v40 + v41;
    goto LABEL_10;
  }
LABEL_11:
}

void __89__PUParallaxLayerStackDebugTableViewController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 reconfigureRowsAtIndexPaths:v2];
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)requestNewZPositionForCellAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUParallaxLayerStackDebugTableViewController *)self layerStackView];
  v6 = [v5 viewModel];

  v7 = [v6 viewManager];
  id v8 = [(PUParallaxLayerStackDebugTableViewController *)self layerForIndexPath:v4];
  id v9 = [v7 viewForLayer:v8];
  id v10 = (void *)MEMORY[0x1E4FB1418];
  v11 = [(PUParallaxLayerStackDebugTableViewController *)self labelForLayer:v8];
  v12 = [v10 alertControllerWithTitle:v11 message:@"Z position:" preferredStyle:1];

  objc_initWeak(&location, v12);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__PUParallaxLayerStackDebugTableViewController_requestNewZPositionForCellAtIndexPath___block_invoke;
  v21[3] = &unk_1E5F2C520;
  id v13 = v9;
  id v22 = v13;
  [v12 addTextFieldWithConfigurationHandler:v21];
  v14 = (void *)MEMORY[0x1E4FB1410];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__PUParallaxLayerStackDebugTableViewController_requestNewZPositionForCellAtIndexPath___block_invoke_2;
  v17[3] = &unk_1E5F2C548;
  objc_copyWeak(&v20, &location);
  id v15 = v13;
  id v18 = v15;
  v19 = self;
  v16 = [v14 actionWithTitle:@"OK" style:0 handler:v17];
  [v12 addAction:v16];

  [(PUParallaxLayerStackDebugTableViewController *)self presentViewController:v12 animated:1 completion:0];
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

void __86__PUParallaxLayerStackDebugTableViewController_requestNewZPositionForCellAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 layer];
  [v7 zPosition];
  v6 = objc_msgSend(v2, "stringWithFormat:", @"%g", v5);
  [v4 setText:v6];
}

void __86__PUParallaxLayerStackDebugTableViewController_requestNewZPositionForCellAtIndexPath___block_invoke_2(id *a1)
{
  v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [WeakRetained textFields];
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  id v11 = [v5 text];

  [v11 doubleValue];
  double v7 = v6;
  id v8 = [a1[4] layer];
  [v8 setZPosition:v7];

  id v9 = [a1[5] tableView];
  [v9 reloadData];

  id v10 = objc_loadWeakRetained(v2);
  [v10 dismissViewControllerAnimated:1 completion:0];
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  id v9 = (void *)MEMORY[0x1E4FB1678];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__PUParallaxLayerStackDebugTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v13[3] = &unk_1E5F2C4F8;
  objc_copyWeak(&v15, &location);
  id v10 = v8;
  id v14 = v10;
  id v11 = [v9 configurationWithIdentifier:0 previewProvider:0 actionProvider:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

id __106__PUParallaxLayerStackDebugTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.stack.3d.down.right"];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __106__PUParallaxLayerStackDebugTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  id v14 = &unk_1E5F2D440;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  id v15 = *(id *)(a1 + 32);
  double v6 = [v4 actionWithTitle:@"Change Z Position" image:v5 identifier:0 handler:&v11];

  id v7 = (void *)MEMORY[0x1E4FB1970];
  v17[0] = v6;
  id v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 1, v11, v12, v13, v14);
  id v9 = [v7 menuWithChildren:v8];

  objc_destroyWeak(&v16);
  return v9;
}

void __106__PUParallaxLayerStackDebugTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained requestNewZPositionForCellAtIndexPath:*(void *)(a1 + 32)];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUParallaxLayerStackDebugTableViewController *)self layerStackView];
  id v9 = [v8 viewModel];

  id v10 = [v9 viewManager];
  uint64_t v11 = [(PUParallaxLayerStackDebugTableViewController *)self layerForIndexPath:v6];
  uint64_t v12 = [v10 viewForLayer:v11];
  objc_msgSend(v12, "setHidden:", objc_msgSend(v12, "isHidden") ^ 1);
  v14[0] = v6;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v7 reconfigureRowsAtIndexPaths:v13];

  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 120.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"layerCell" forIndexPath:v6];
  id v8 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  id v9 = [(PUParallaxLayerStackDebugTableViewController *)self layerStackView];
  id v10 = [v9 viewModel];

  uint64_t v11 = [v10 viewManager];
  uint64_t v12 = [(PUParallaxLayerStackDebugTableViewController *)self layerForIndexPath:v6];

  id v13 = v12;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  id v15 = v13;
  double v36 = v10;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  v17 = [v11 viewForLayer:v15];
  v35 = v16;
  if (v14)
  {
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithIOSurface:", CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v14, "image")));
  }
  else
  {
    if (!v16) {
      goto LABEL_14;
    }
    uint64_t v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"video"];
  }
  v19 = (void *)v18;
  [v8 setImage:v18];

LABEL_14:
  id v20 = [v8 imageProperties];
  objc_msgSend(v20, "setMaximumSize:", 90.0, 120.0);

  int v21 = [v17 isHidden];
  id v22 = &stru_1F06BE7B8;
  if (v21) {
    id v22 = @"🚫 ";
  }
  double v23 = v22;
  double v24 = [(PUParallaxLayerStackDebugTableViewController *)self labelForLayer:v15];
  v25 = [(__CFString *)v23 stringByAppendingString:v24];

  [v8 setText:v25];
  v26 = NSString;
  v27 = [v17 layer];
  [v27 zPosition];
  double v29 = objc_msgSend(v26, "stringWithFormat:", @"Z: %g", v28);
  [v8 setSecondaryText:v29];

  if (v21)
  {
    v30 = [MEMORY[0x1E4FB1618] grayColor];
    double v31 = [v8 textProperties];
    [v31 setColor:v30];

    double v32 = [MEMORY[0x1E4FB1498] listPlainCellConfiguration];
    unint64_t v33 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v32 setBackgroundColor:v33];
  }
  else
  {
    double v32 = 0;
  }
  [v7 setContentConfiguration:v8];
  [v7 setBackgroundConfiguration:v32];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(PUParallaxLayerStackDebugTableViewController *)self layerStackView];
  uint64_t v5 = [v4 viewModel];
  id v6 = [v5 currentLayerStack];
  id v7 = [v6 layers];
  int64_t v8 = [v7 count];

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)layerForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUParallaxLayerStackDebugTableViewController *)self layersSortedByViewDepth];
  uint64_t v6 = [v4 row];

  id v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (id)layersSortedByViewDepth
{
  v2 = [(PUParallaxLayerStackDebugTableViewController *)self layerStackView];
  id v3 = [v2 viewModel];

  id v4 = [v3 viewManager];
  uint64_t v5 = [v3 currentLayerStack];
  uint64_t v6 = [v5 layers];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PUParallaxLayerStackDebugTableViewController_layersSortedByViewDepth__block_invoke;
  v10[3] = &unk_1E5F2C4D0;
  id v11 = v4;
  id v7 = v4;
  int64_t v8 = [v6 sortedArrayUsingComparator:v10];

  return v8;
}

uint64_t __71__PUParallaxLayerStackDebugTableViewController_layersSortedByViewDepth__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 viewForLayer:a2];
  int64_t v8 = [*(id *)(a1 + 32) viewForLayer:v6];

  id v9 = [v7 layer];
  [v9 zPosition];
  double v11 = v10;

  uint64_t v12 = [v8 layer];
  [v12 zPosition];
  double v14 = v13;

  if (v11 <= v14) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = -1;
  }

  return v15;
}

- (id)labelForLayer:(id)a3
{
  return (id)[a3 identifier];
}

- (void)setLayerStackView:(id)a3
{
  uint64_t v5 = (PUParallaxLayerStackView *)a3;
  if (self->_layerStackView != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_layerStackView, a3);
    id v6 = [(PUParallaxLayerStackDebugTableViewController *)self tableView];
    [v6 reloadData];

    uint64_t v5 = v7;
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PUParallaxLayerStackDebugTableViewController;
  [(PUParallaxLayerStackDebugTableViewController *)&v5 viewDidLoad];
  id v3 = [(PUParallaxLayerStackDebugTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"layerCell"];

  id v4 = [(PUParallaxLayerStackDebugTableViewController *)self tableView];
  [v4 _setAllowsReorderingWhenNotEditing:1];
}

@end