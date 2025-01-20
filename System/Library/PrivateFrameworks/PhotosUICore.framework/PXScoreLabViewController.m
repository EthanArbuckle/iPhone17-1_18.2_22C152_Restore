@interface PXScoreLabViewController
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (PXScoreLabViewController)init;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)valueGetterForSceneIdentifier:(unint64_t)a3;
- (id)valueGetterForScoreKeyPath:(id)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (unint64_t)identifierForSceneName:(id)a3;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)redrawGraph;
- (void)sceneNameChanged:(id)a3;
- (void)scoreLabGraphView:(id)a3 reloadProgressed:(double)a4;
- (void)scoreLabGraphViewDidFinishReloading:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PXScoreLabViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifierBySceneName, 0);
  objc_storeStrong((id *)&self->_assetPredicateByFilterName, 0);
  objc_storeStrong((id *)&self->_assetFilterNames, 0);
  objc_storeStrong((id *)&self->_timestampKeyPathByPrefix, 0);
  objc_storeStrong((id *)&self->_keyPathByScoreName, 0);
  objc_storeStrong((id *)&self->_scoreNames, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_storeStrong((id *)&self->_assetFilterPickerView, 0);
  objc_storeStrong((id *)&self->_yScoreSceneNameField, 0);
  objc_storeStrong((id *)&self->_yScorePickerView, 0);
  objc_storeStrong((id *)&self->_graphTypePickerView, 0);
  objc_storeStrong((id *)&self->_xScoreSceneNameField, 0);
  objc_storeStrong((id *)&self->_xScorePickerView, 0);
}

- (void)scoreLabGraphViewDidFinishReloading:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PXScoreLabViewController_scoreLabGraphViewDidFinishReloading___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__PXScoreLabViewController_scoreLabGraphViewDidFinishReloading___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1032) setHidden:1];
}

- (void)scoreLabGraphView:(id)a3 reloadProgressed:(double)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PXScoreLabViewController_scoreLabGraphView_reloadProgressed___block_invoke;
  v4[3] = &unk_1E5DD08D8;
  v4[4] = self;
  *(double *)&v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __63__PXScoreLabViewController_scoreLabGraphView_reloadProgressed___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  *(float *)&double v1 = v1;
  return [*(id *)(*(void *)(a1 + 32) + 1032) setProgress:v1];
}

- (void)sceneNameChanged:(id)a3
{
  v4 = (UITextField *)a3;
  if (self->_xScoreSceneNameField == v4 || self->_yScoreSceneNameField == v4)
  {
    v9 = v4;
    v5 = [(UITextField *)v4 text];
    unint64_t v6 = [(PXScoreLabViewController *)self identifierForSceneName:v5];
    if (v6)
    {
      v7 = [(PXScoreLabViewController *)self valueGetterForSceneIdentifier:v6];
      graphView = self->_graphView;
      if (self->_xScoreSceneNameField == v9) {
        [(_PXScoreLabGraphView *)graphView setXScoreValueGetter:v7];
      }
      else {
        [(_PXScoreLabGraphView *)graphView setYScoreValueGetter:v7];
      }
      [(PXScoreLabViewController *)self redrawGraph];
    }
    else
    {
      v7 = [MEMORY[0x1E4FB1618] redColor];
      [(UITextField *)v9 setTextColor:v7];
    }

    v4 = v9;
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  id v5 = [v3 blackColor];
  [v4 setTextColor:v5];
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  v7 = (UIPickerView *)a3;
  if (self->_xScorePickerView != v7)
  {
    if (self->_graphTypePickerView == v7)
    {
      v14 = v7;
      [(_PXScoreLabGraphView *)self->_graphView setGraphType:a4];
      if (a4 == 1) {
        double v11 = 0.25;
      }
      else {
        double v11 = 1.0;
      }
      [(UIPickerView *)self->_xScorePickerView setUserInteractionEnabled:a4 != 1];
      [(UIPickerView *)self->_xScorePickerView setAlpha:v11];
      if (a4) {
        double v12 = 1.0;
      }
      else {
        double v12 = 0.25;
      }
      [(UIPickerView *)self->_yScorePickerView setUserInteractionEnabled:a4 != 0];
      [(UIPickerView *)self->_yScorePickerView setAlpha:v12];
      [(PXScoreLabViewController *)self redrawGraph];
      goto LABEL_20;
    }
    if (self->_yScorePickerView != v7)
    {
      if (self->_assetFilterPickerView != v7) {
        goto LABEL_21;
      }
      v14 = v7;
      v8 = [(NSArray *)self->_assetFilterNames objectAtIndexedSubscript:a4];
      v9 = [(NSDictionary *)self->_assetPredicateByFilterName objectForKeyedSubscript:v8];
      [(_PXScoreLabGraphView *)self->_graphView setAssetPredicate:v9];
      goto LABEL_18;
    }
    v14 = v7;
    v8 = [(NSArray *)self->_scoreNames objectAtIndexedSubscript:a4];
    v9 = [(NSDictionary *)self->_keyPathByScoreName objectForKeyedSubscript:v8];
    if (v9)
    {
      [(UITextField *)self->_yScoreSceneNameField setHidden:1];
      v10 = [(PXScoreLabViewController *)self valueGetterForScoreKeyPath:v9];
      [(_PXScoreLabGraphView *)self->_graphView setYScoreValueGetter:v10];
      goto LABEL_17;
    }
    if (![v8 hasPrefix:@"Scene"]) {
      goto LABEL_19;
    }
    uint64_t v13 = 1008;
LABEL_28:
    [*(id *)((char *)&self->super.super.super.isa + v13) setHidden:0];
    [(PXScoreLabViewController *)self sceneNameChanged:*(Class *)((char *)&self->super.super.super.isa + v13)];
    goto LABEL_19;
  }
  v14 = v7;
  v8 = [(NSArray *)self->_scoreNames objectAtIndexedSubscript:a4];
  v9 = [(NSDictionary *)self->_keyPathByScoreName objectForKeyedSubscript:v8];
  if (!v9)
  {
    if (![v8 hasPrefix:@"Scene"]) {
      goto LABEL_19;
    }
    uint64_t v13 = 984;
    goto LABEL_28;
  }
  [(UITextField *)self->_xScoreSceneNameField setHidden:1];
  v10 = [(PXScoreLabViewController *)self valueGetterForScoreKeyPath:v9];
  [(_PXScoreLabGraphView *)self->_graphView setXScoreValueGetter:v10];
LABEL_17:

LABEL_18:
  [(PXScoreLabViewController *)self redrawGraph];
LABEL_19:

LABEL_20:
  v7 = v14;
LABEL_21:
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v7 = (UIPickerView *)a3;
  v8 = v7;
  if (self->_xScorePickerView == v7 || self->_yScorePickerView == v7)
  {
    uint64_t v10 = 1040;
  }
  else
  {
    if (self->_graphTypePickerView == v7)
    {
      double v11 = &unk_1F02D4900;
      goto LABEL_8;
    }
    if (self->_assetFilterPickerView != v7)
    {
      v9 = 0;
      goto LABEL_9;
    }
    uint64_t v10 = 1064;
  }
  double v11 = *(Class *)((char *)&self->super.super.super.isa + v10);
LABEL_8:
  v9 = [v11 objectAtIndexedSubscript:a4];
LABEL_9:

  return v9;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5 = (UIPickerView *)a3;
  unint64_t v6 = v5;
  if (self->_xScorePickerView == v5 || self->_yScorePickerView == v5)
  {
    v8 = &OBJC_IVAR___PXScoreLabViewController__scoreNames;
LABEL_7:
    int64_t v7 = [*(id *)((char *)&self->super.super.super.isa + *v8) count];
    goto LABEL_8;
  }
  if (self->_graphTypePickerView == v5)
  {
    int64_t v7 = 3;
    goto LABEL_8;
  }
  if (self->_assetFilterPickerView == v5)
  {
    v8 = &OBJC_IVAR___PXScoreLabViewController__assetFilterNames;
    goto LABEL_7;
  }
  int64_t v7 = 0;
LABEL_8:

  return v7;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (unint64_t)identifierForSceneName:(id)a3
{
  id v4 = [a3 lowercaseString];
  if ([v4 hasPrefix:@"junk"])
  {
    if ([v4 hasSuffix:@"screenshot"])
    {
      unint64_t v5 = 2147483632;
    }
    else
    {
      unint64_t v5 = 2147483633;
      if (([v4 hasSuffix:@"framing"] & 1) == 0)
      {
        if ([v4 hasSuffix:@"lighting"])
        {
          unint64_t v5 = 2147483634;
        }
        else if ([v4 hasSuffix:@"blurry"])
        {
          unint64_t v5 = 2147483635;
        }
        else if ([v4 hasSuffix:@"drink"])
        {
          unint64_t v5 = 2147483636;
        }
        else if ([v4 hasSuffix:@"other"])
        {
          unint64_t v5 = 2147483637;
        }
        else if ([v4 hasSuffix:@"medical reference"])
        {
          unint64_t v5 = 2147483638;
        }
        else if ([v4 hasSuffix:@"negative-internal"])
        {
          unint64_t v5 = 2147483639;
        }
        else if ([v4 hasSuffix:@"document"])
        {
          unint64_t v5 = 2147483640;
        }
        else if ([v4 hasSuffix:@"repair reference"])
        {
          unint64_t v5 = 2147483641;
        }
        else if ([v4 hasSuffix:@"shopping reference"])
        {
          unint64_t v5 = 2147483642;
        }
        else if ([v4 hasSuffix:@"utility reference"])
        {
          unint64_t v5 = 2147483643;
        }
        else if ([v4 hasSuffix:@"negative"])
        {
          unint64_t v5 = 2147483644;
        }
        else if ([v4 hasSuffix:@"memorable"])
        {
          unint64_t v5 = 2147483645;
        }
        else if ([v4 hasSuffix:@"quality"])
        {
          unint64_t v5 = 2147483646;
        }
        else if ([v4 hasSuffix:@"legacy"])
        {
          unint64_t v5 = 0x7FFFFFFFLL;
        }
        else
        {
          unint64_t v5 = 0;
        }
      }
    }
  }
  else
  {
    unint64_t v6 = [(NSDictionary *)self->_sceneIdentifierBySceneName objectForKeyedSubscript:v4];
    unint64_t v5 = [v6 unsignedIntValue];
  }
  return v5;
}

- (id)valueGetterForSceneIdentifier:(unint64_t)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PXScoreLabViewController_valueGetterForSceneIdentifier___block_invoke;
  aBlock[3] = &__block_descriptor_40_e27___NSNumber_16__0__PHAsset_8l;
  aBlock[4] = a3;
  v3 = _Block_copy(aBlock);
  return v3;
}

id __58__PXScoreLabViewController_valueGetterForSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    [v3 sceneClassifications];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "extendedSceneIdentifier", (void)v14) == *(void *)(a1 + 32))
          {
            double v12 = NSNumber;
            [v10 confidence];
            double v11 = objc_msgSend(v12, "numberWithDouble:");
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    double v11 = 0;
LABEL_12:
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)valueGetterForScoreKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"."];
  uint64_t v6 = [v5 firstObject];

  uint64_t v7 = [(NSDictionary *)self->_timestampKeyPathByPrefix objectForKeyedSubscript:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__PXScoreLabViewController_valueGetterForScoreKeyPath___block_invoke;
    aBlock[3] = &unk_1E5DBFB98;
    v9 = &v17;
    id v17 = v7;
    id v18 = v4;
    id v10 = v4;
    double v11 = _Block_copy(aBlock);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__PXScoreLabViewController_valueGetterForScoreKeyPath___block_invoke_2;
    v14[3] = &unk_1E5DBFBC0;
    v9 = &v15;
    id v15 = v4;
    id v12 = v4;
    double v11 = _Block_copy(v14);
  }

  return v11;
}

id __55__PXScoreLabViewController_valueGetterForScoreKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 valueForKeyPath:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = [v3 valueForKeyPath:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __55__PXScoreLabViewController_valueGetterForScoreKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 valueForKeyPath:*(void *)(a1 + 32)];
}

- (void)redrawGraph
{
  if (!self->_redrawIsDisabled)
  {
    [(PXRoundProgressView *)self->_progressView prepareForReuse];
    [(PXRoundProgressView *)self->_progressView setHidden:0];
    graphView = self->_graphView;
    [(_PXScoreLabGraphView *)graphView reloadData];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXScoreLabViewController;
  [(PXScoreLabViewController *)&v5 viewDidAppear:a3];
  id v4 = [(PXScoreLabViewController *)self navigationController];
  [v4 setToolbarHidden:1];
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)PXScoreLabViewController;
  [(PXScoreLabViewController *)&v49 viewDidLoad];
  id v3 = [(PXScoreLabViewController *)self view];
  id v4 = [MEMORY[0x1E4FB1618] lightGrayColor];
  [v3 setBackgroundColor:v4];

  [(PXScoreLabViewController *)self additionalSafeAreaInsets];
  double v6 = v5 + 60.0;
  uint64_t v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:24.0];
  v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, v6, 130.0, 70.0);
  [v47 setFont:v7];
  [v47 setText:@"X Score:"];
  [v47 setTextAlignment:2];
  [v47 setAutoresizingMask:36];
  [v3 addSubview:v47];
  id v8 = objc_alloc(MEMORY[0x1E4FB1A98]);
  [v3 bounds];
  id v10 = (UIPickerView *)objc_msgSend(v8, "initWithFrame:", 130.0, v6, v9 + -130.0, 70.0);
  xScorePickerView = self->_xScorePickerView;
  self->_xScorePickerView = v10;

  [(UIPickerView *)self->_xScorePickerView setDataSource:self];
  [(UIPickerView *)self->_xScorePickerView setDelegate:self];
  [(UIPickerView *)self->_xScorePickerView setAutoresizingMask:34];
  [(UIPickerView *)self->_xScorePickerView selectRow:[(NSArray *)self->_scoreNames indexOfObject:@"Pleasant Lighting"] inComponent:0 animated:0];
  [v3 addSubview:self->_xScorePickerView];
  id v12 = objc_alloc(MEMORY[0x1E4FB1D70]);
  [v3 bounds];
  long long v14 = (UITextField *)objc_msgSend(v12, "initWithFrame:", v13 + -100.0, v6 + 2.0, 100.0, 68.0);
  xScoreSceneNameField = self->_xScoreSceneNameField;
  self->_xScoreSceneNameField = v14;

  [(UITextField *)self->_xScoreSceneNameField setDelegate:self];
  [(UITextField *)self->_xScoreSceneNameField setAutoresizingMask:33];
  [(UITextField *)self->_xScoreSceneNameField setFont:v7];
  [(UITextField *)self->_xScoreSceneNameField setText:@"Dog"];
  [v3 addSubview:self->_xScoreSceneNameField];
  double v16 = v6 + 50.0;
  v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, v16, 130.0, 70.0);
  [v46 setFont:v7];
  [v46 setText:@"Graph Type:"];
  [v46 setTextAlignment:2];
  [v46 setAutoresizingMask:36];
  [v3 addSubview:v46];
  id v17 = objc_alloc(MEMORY[0x1E4FB1A98]);
  [v3 bounds];
  uint64_t v19 = (UIPickerView *)objc_msgSend(v17, "initWithFrame:", 130.0, v16, v18 + -130.0, 70.0);
  graphTypePickerView = self->_graphTypePickerView;
  self->_graphTypePickerView = v19;

  [(UIPickerView *)self->_graphTypePickerView setDataSource:self];
  [(UIPickerView *)self->_graphTypePickerView setDelegate:self];
  [(UIPickerView *)self->_graphTypePickerView setAutoresizingMask:34];
  [v3 addSubview:self->_graphTypePickerView];
  double v21 = v16 + 50.0;
  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, v21, 130.0, 70.0);
  [v22 setFont:v7];
  [v22 setText:@"Y Score:"];
  [v22 setTextAlignment:2];
  [v22 setAutoresizingMask:36];
  [v3 addSubview:v22];
  id v23 = objc_alloc(MEMORY[0x1E4FB1A98]);
  [v3 bounds];
  v25 = (UIPickerView *)objc_msgSend(v23, "initWithFrame:", 130.0, v21, v24 + -130.0, 70.0);
  yScorePickerView = self->_yScorePickerView;
  self->_yScorePickerView = v25;

  [(UIPickerView *)self->_yScorePickerView setDataSource:self];
  [(UIPickerView *)self->_yScorePickerView setDelegate:self];
  [(UIPickerView *)self->_yScorePickerView setAutoresizingMask:34];
  [(UIPickerView *)self->_yScorePickerView selectRow:[(NSArray *)self->_scoreNames indexOfObject:@"Pleasant Perspective"] inComponent:0 animated:0];
  [v3 addSubview:self->_yScorePickerView];
  id v27 = objc_alloc(MEMORY[0x1E4FB1D70]);
  [v3 bounds];
  v29 = (UITextField *)objc_msgSend(v27, "initWithFrame:", v28 + -100.0, v21 + 2.0, 100.0, 68.0);
  yScoreSceneNameField = self->_yScoreSceneNameField;
  self->_yScoreSceneNameField = v29;

  [(UITextField *)self->_yScoreSceneNameField setDelegate:self];
  [(UITextField *)self->_yScoreSceneNameField setAutoresizingMask:33];
  [(UITextField *)self->_yScoreSceneNameField setFont:v7];
  [(UITextField *)self->_yScoreSceneNameField setText:@"Beach"];
  [v3 addSubview:self->_yScoreSceneNameField];
  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, v21 + 50.0, 130.0, 70.0);
  [v31 setFont:v7];
  [v31 setText:@"Asset Filter:"];
  [v31 setTextAlignment:2];
  [v31 setAutoresizingMask:36];
  [v3 addSubview:v31];
  id v32 = objc_alloc(MEMORY[0x1E4FB1A98]);
  [v3 bounds];
  v34 = (UIPickerView *)objc_msgSend(v32, "initWithFrame:", 130.0, v21 + 50.0, v33 + -130.0, 70.0);
  assetFilterPickerView = self->_assetFilterPickerView;
  self->_assetFilterPickerView = v34;

  [(UIPickerView *)self->_assetFilterPickerView setDataSource:self];
  [(UIPickerView *)self->_assetFilterPickerView setDelegate:self];
  [(UIPickerView *)self->_assetFilterPickerView setAutoresizingMask:34];
  [(UIPickerView *)self->_assetFilterPickerView selectRow:[(NSArray *)self->_assetFilterNames indexOfObject:@"All"] inComponent:0 animated:0];
  [v3 addSubview:self->_assetFilterPickerView];
  double v36 = v21 + 50.0 + 50.0;
  self->_redrawIsDisabled = 1;
  v37 = [_PXScoreLabGraphView alloc];
  [v3 bounds];
  double v39 = v38;
  [v3 bounds];
  v41 = -[_PXScoreLabGraphView initWithFrame:](v37, "initWithFrame:", 0.0, v36, v39, v40 - v36);
  graphView = self->_graphView;
  self->_graphView = v41;

  [(_PXScoreLabGraphView *)self->_graphView setDelegate:self];
  [(_PXScoreLabGraphView *)self->_graphView setAutoresizingMask:18];
  [(PXScoreLabViewController *)self pickerView:self->_xScorePickerView didSelectRow:[(NSArray *)self->_scoreNames indexOfObject:@"Pleasant Lighting"] inComponent:0];
  [(PXScoreLabViewController *)self pickerView:self->_yScorePickerView didSelectRow:[(NSArray *)self->_scoreNames indexOfObject:@"Pleasant Perspective"] inComponent:0];
  [v3 addSubview:self->_graphView];
  [v3 bounds];
  v44 = -[PXRoundProgressView initWithFrame:style:]([PXRoundProgressView alloc], "initWithFrame:style:", 1, v43 + -10.0 + -36.0, v36 + 10.0, 36.0, 36.0);
  progressView = self->_progressView;
  self->_progressView = v44;

  [(PXRoundProgressView *)self->_progressView setAutoresizingMask:45];
  [v3 addSubview:self->_progressView];
  self->_redrawIsDisabled = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PXScoreLabViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E5DD08D8;
  block[4] = self;
  void block[5] = 0;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __39__PXScoreLabViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pickerView:*(void *)(*(void *)(a1 + 32) + 992) didSelectRow:*(void *)(a1 + 40) inComponent:0];
}

- (PXScoreLabViewController)init
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PXScoreLabViewController;
  v2 = [(PXScoreLabViewController *)&v20 init];
  id v3 = v2;
  if (v2)
  {
    scoreNames = v2->_scoreNames;
    v2->_scoreNames = (NSArray *)&unk_1F02D48D0;

    keyPathByScoreName = v3->_keyPathByScoreName;
    v3->_keyPathByScoreName = (NSDictionary *)&unk_1F02DB6D0;

    timestampKeyPathByPrefix = v3->_timestampKeyPathByPrefix;
    v3->_timestampKeyPathByPrefix = (NSDictionary *)&unk_1F02DB6F8;

    assetFilterNames = v3->_assetFilterNames;
    v3->_assetFilterNames = (NSArray *)&unk_1F02D48E8;

    v21[0] = @"Portrait";
    id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(mediaSubtypes & %d) != 0", 16);
    v22[0] = v8;
    v21[1] = @"Live";
    double v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(mediaSubtypes & %d) != 0", 8);
    v22[1] = v9;
    v21[2] = @"HDR";
    id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(mediaSubtypes & %d) != 0", 2);
    v22[2] = v10;
    v21[3] = @"Panorama";
    double v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(mediaSubtypes & %d) != 0", 1);
    v22[3] = v11;
    v21[4] = @"Video";
    id v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"mediaType == %d", 2);
    v22[4] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
    assetPredicateByFilterName = v3->_assetPredicateByFilterName;
    v3->_assetPredicateByFilterName = (NSDictionary *)v13;

    id v15 = objc_alloc_init(MEMORY[0x1E4F8CD60]);
    uint64_t v19 = (NSDictionary *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "nodeCount"));
    PFSceneTaxonomyEnumerateTopologicallyOrderedNodes();
    sceneIdentifierBySceneName = v3->_sceneIdentifierBySceneName;
    v3->_sceneIdentifierBySceneName = v19;
    id v17 = v19;
  }
  return v3;
}

uint64_t __32__PXScoreLabViewController_init__block_invoke(uint64_t a1)
{
  v2 = PFSceneTaxonomyNodeName();
  if (v2)
  {
    id v3 = [NSNumber numberWithUnsignedLongLong:PFSceneTaxonomyNodeExtendedSceneClassId()];
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v2];
  }
  return 0;
}

@end