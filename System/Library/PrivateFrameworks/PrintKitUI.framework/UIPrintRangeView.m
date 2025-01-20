@interface UIPrintRangeView
- (NSArray)savedMultiPageRanges;
- (UIPickerView)fromPicker;
- (UIPickerView)toPicker;
- (UIPrintInfo)printInfo;
- (UIPrintRangeView)initWithFrame:(CGRect)a3 printInfo:(id)a4;
- (UITableView)tableView;
- (UIView)pickerView;
- (double)pickerWidth;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)loadViews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)reloadTableView;
- (void)setFromPicker:(id)a3;
- (void)setPickerView:(id)a3;
- (void)setPickerWidth:(double)a3;
- (void)setPrintInfo:(id)a3;
- (void)setSavedMultiPageRanges:(id)a3;
- (void)setTableView:(id)a3;
- (void)setToPicker:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updatePageRangeView;
@end

@implementation UIPrintRangeView

- (UIPrintRangeView)initWithFrame:(CGRect)a3 printInfo:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UIPrintRangeView;
  v10 = -[UIPrintRangeView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(UIPrintRangeView *)v10 setPrintInfo:v9];
    v12 = [v9 pageRanges];
    unint64_t v13 = [v12 count];

    if (v13 >= 2)
    {
      v14 = [v9 pageRanges];
      [(UIPrintRangeView *)v11 setSavedMultiPageRanges:v14];
    }
    [(UIPrintRangeView *)v11 loadViews];
    v15 = [(UIPrintRangeView *)v11 printInfo];
    [v15 addObserver:v11 forKeyPath:0x1F3C9DEB8 options:0 context:0];
  }
  return v11;
}

- (void)dealloc
{
  v3 = [(UIPrintRangeView *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DEB8];

  v4.receiver = self;
  v4.super_class = (Class)UIPrintRangeView;
  [(UIPrintRangeView *)&v4 dealloc];
}

- (void)loadViews
{
  v80[5] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [(UIPrintRangeView *)self setBackgroundColor:v3];

  objc_super v4 = (objc_class *)MEMORY[0x1E4FB1D00];
  v5 = self;
  id v6 = [v4 alloc];
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = objc_msgSend(v6, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], v8, v9, v10);
  [v11 setDataSource:v5];
  [v11 setDelegate:v5];

  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 setEstimatedSectionHeaderHeight:8.0];
  [v11 setEstimatedSectionFooterHeight:100.0];
  [(UIPrintRangeView *)v5 setTableView:v11];

  v12 = [(UIPrintRangeView *)v5 tableView];
  [(UIPrintRangeView *)v5 addSubview:v12];

  unint64_t v13 = (objc_class *)MEMORY[0x1E4FB1A98];
  v14 = v5;
  v15 = objc_msgSend([v13 alloc], "initWithFrame:", v7, v8, v9, v10);
  [v15 setDataSource:v14];
  [v15 setDelegate:v14];

  [v15 setBackgroundColor:0];
  [v15 setOpaque:0];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIPrintRangeView *)v14 setFromPicker:v15];

  v16 = (objc_class *)MEMORY[0x1E4FB1A98];
  objc_super v17 = v14;
  v18 = objc_msgSend([v16 alloc], "initWithFrame:", v7, v8, v9, v10);
  [v18 setDataSource:v17];
  [v18 setDelegate:v17];

  [v18 setBackgroundColor:0];
  [v18 setOpaque:0];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIPrintRangeView *)v17 setToPicker:v18];

  id v19 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"to" value:@"to" table:@"Localizable"];
  [v19 setText:v21];

  [v19 setOpaque:0];
  [v19 setBackgroundColor:0];
  v22 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2990]];
  [v19 setFont:v22];

  v23 = [MEMORY[0x1E4FB1618] labelColor];
  [v19 setTextColor:v23];

  [v19 setTextAlignment:1];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v24) = 1148846080;
  [v19 setContentHuggingPriority:0 forAxis:v24];
  id v25 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v26 = [(UIPrintRangeView *)v17 toPicker];
  [v26 frame];
  v27 = objc_msgSend(v25, "initWithFrame:");

  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  v28 = [(UIPrintRangeView *)v17 fromPicker];
  [v27 addSubview:v28];

  v29 = [(UIPrintRangeView *)v17 toPicker];
  [v27 addSubview:v29];

  [v27 addSubview:v19];
  v79[0] = @"table";
  v30 = [(UIPrintRangeView *)v17 tableView];
  v80[0] = v30;
  v80[1] = v27;
  v79[1] = @"pickers";
  v79[2] = @"from";
  v31 = [(UIPrintRangeView *)v17 fromPicker];
  v80[2] = v31;
  v79[3] = @"to";
  v32 = [(UIPrintRangeView *)v17 toPicker];
  v79[4] = @"label";
  v80[3] = v32;
  v80[4] = v19;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:5];

  v34 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-20-[from]|" options:0 metrics:0 views:v33];
  [v27 addConstraints:v34];

  v35 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-20-[label]|" options:0 metrics:0 views:v33];
  [v27 addConstraints:v35];

  v36 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-20-[to]|" options:0 metrics:0 views:v33];
  [v27 addConstraints:v36];

  v37 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[table]|" options:0 metrics:0 views:v33];
  [(UIPrintRangeView *)v17 addConstraints:v37];

  id v38 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v39 = [(UIPrintRangeView *)v17 toPicker];
  [v39 frame];
  v40 = objc_msgSend(v38, "initWithFrame:");
  [(UIPrintRangeView *)v17 setPickerView:v40];

  v41 = [(UIPrintRangeView *)v17 pickerView];
  [v41 addSubview:v27];

  v42 = [(UIPrintRangeView *)v17 pickerView];
  v43 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[pickers]|" options:0 metrics:0 views:v33];
  [v42 addConstraints:v43];

  v44 = [(UIPrintRangeView *)v17 pickerView];
  v45 = [v27 centerXAnchor];
  v46 = [(UIPrintRangeView *)v17 pickerView];
  v47 = [v46 centerXAnchor];
  v48 = [v45 constraintEqualToAnchor:v47];
  [v44 addConstraint:v48];

  v49 = (void *)MEMORY[0x1E4F28DC8];
  v77 = @"tableviewheight";
  v50 = (void *)MEMORY[0x1E4F28ED0];
  v51 = [(UIPrintRangeView *)v17 tableView];
  [(UIPrintRangeView *)v17 frame];
  objc_msgSend(v51, "sizeThatFits:", v52, v53);
  *(float *)&double v55 = v54;
  v56 = [v50 numberWithFloat:v55];
  v78 = v56;
  v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  v58 = [v49 constraintsWithVisualFormat:@"V:|-0-[table]|" options:0 metrics:v57 views:v33];
  [(UIPrintRangeView *)v17 addConstraints:v58];

  v59 = objc_opt_new();
  v60 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  [v59 setFont:v60];

  v61 = [(UIPrintRangeView *)v17 printInfo];
  uint64_t v62 = [v61 pageCount];

  if (v62 < 1)
  {
    double v70 = 32.0;
  }
  else
  {
    uint64_t v63 = 0;
    double v64 = 0.0;
    do
    {
      v65 = LocalizedInteger(++v63);
      [v59 setText:v65];

      [v59 intrinsicContentSize];
      double v67 = ceil(v66);
      if (v67 >= v64) {
        double v64 = v67;
      }
      v68 = [(UIPrintRangeView *)v17 printInfo];
      uint64_t v69 = [v68 pageCount];
    }
    while (v63 < v69);
    double v70 = v64 + 32.0;
  }
  if (v70 < 72.0) {
    double v70 = 72.0;
  }
  [(UIPrintRangeView *)v17 setPickerWidth:v70];
  v71 = NSString;
  [(UIPrintRangeView *)v17 pickerWidth];
  uint64_t v73 = v72;
  [(UIPrintRangeView *)v17 pickerWidth];
  v75 = objc_msgSend(v71, "stringWithFormat:", @"H:|-[from(==%f)]-%f-[label]-%f-[to(==%f)]-|", v73, 0x4020000000000000, 0x4020000000000000, v74);
  v76 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v75 options:0 metrics:0 views:v33];
  [v27 addConstraints:v76];

  [(UIPrintRangeView *)v17 updatePageRangeView];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__UIPrintRangeView_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__UIPrintRangeView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePageRangeView];
}

- (void)updatePageRangeView
{
  __assert_rtn("-[UIPrintRangeView updatePageRangeView]", "UIPrintMoreOptions.m", 582, "dispatch_get_main_queue() == dispatch_get_current_queue()");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(UIPrintRangeView *)self savedMultiPageRanges];
  if (v4) {
    int64_t v5 = 3;
  }
  else {
    int64_t v5 = 2;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v45 = a4;
  id v6 = [a3 dequeueReusableCellWithIdentifier:@"PageRangeViewCell"];
  if (!v6) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PageRangeViewCell"];
  }
  v44 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  double v7 = [(UIPrintRangeView *)self printInfo];
  double v8 = [v7 pageRanges];
  unint64_t v9 = [v8 count];
  double v10 = [(UIPrintRangeView *)self printInfo];
  v11 = v10;
  if (v9 > 1)
  {
    unint64_t v17 = [v10 pageCount];
    uint64_t v18 = 0;
  }
  else
  {
    v12 = [v10 pageRanges];
    unint64_t v13 = [v12 firstObject];
    v14 = self;
    uint64_t v15 = [v13 rangeValue];
    unint64_t v17 = v16;

    uint64_t v18 = v15;
    self = v14;
  }

  if (![v45 row])
  {
    v35 = [(UIPrintRangeView *)self printInfo];
    if (v17 == [v35 pageCount])
    {
      v36 = [(UIPrintRangeView *)self printInfo];
      v37 = [v36 pageRanges];
      BOOL v22 = (unint64_t)[v37 count] < 2;
    }
    else
    {
      BOOL v22 = 0;
    }

    v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v40 = [v39 localizedStringForKey:@"All Pages" value:@"All Pages" table:@"Localizable"];
    [v44 setText:v40];

    [v44 setSecondaryText:0];
    goto LABEL_18;
  }
  if ([v45 row] == 1)
  {
    id v19 = [(UIPrintRangeView *)self savedMultiPageRanges];

    if (v19)
    {
      v20 = [(UIPrintRangeView *)self printInfo];
      v21 = [v20 pageRanges];
      BOOL v22 = (unint64_t)[v21 count] > 1;

      v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v24 = [v23 localizedStringForKey:@"Custom Range" value:@"Custom Range" table:@"Localizable"];
      [v44 setText:v24];

      id v25 = [(UIPrintRangeView *)self savedMultiPageRanges];
      v26 = SummaryForRange(v25);
      [v44 setSecondaryText:v26];

      v27 = [v44 secondaryTextProperties];
      [v27 setNumberOfLines:0];

LABEL_18:
      [v6 setSelectionStyle:3];
      goto LABEL_19;
    }
  }
  v28 = [(UIPrintRangeView *)self printInfo];
  BOOL v22 = v17 < [v28 pageCount];

  v29 = LocalizedUnsignedInteger(v18 + 1);
  v30 = LocalizedUnsignedInteger(v17 + v18);
  v31 = NSString;
  v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v33 = v32;
  if (v17 == 1)
  {
    v34 = [v32 localizedStringForKey:@"Page %@" value:@"Page %@" table:@"Localizable"];
  }
  else
  {
    v34 = [v32 localizedStringForKey:@"Pages %@-%@" value:@"Pages %@-%@" table:@"Localizable"];
    v43 = v30;
  }
  id v38 = objc_msgSend(v31, "stringWithFormat:", v34, v29, v43);
  [v44 setText:v38];

  [v44 setSecondaryText:0];
  [v6 setSelectionStyle:0];

LABEL_19:
  [v6 setContentConfiguration:v44];
  if (v22) {
    uint64_t v41 = 3;
  }
  else {
    uint64_t v41 = 0;
  }
  [v6 setAccessoryType:v41];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (![v5 row])
  {
    id v6 = [(UIPrintRangeView *)self printInfo];
    uint64_t v7 = [v6 pageCount];

    double v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, v7);
    v16[0] = v8;
    unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    double v10 = [(UIPrintRangeView *)self printInfo];
    [v10 setPageRanges:v9];

    v11 = [(UIPrintRangeView *)self fromPicker];
    [v11 selectRow:0 inComponent:0 animated:1];

    v12 = [(UIPrintRangeView *)self toPicker];
    [v12 selectRow:v7 - 1 inComponent:0 animated:1];

    [(UIPrintRangeView *)self reloadTableView];
  }
  if ([v5 row] == 1)
  {
    unint64_t v13 = [(UIPrintRangeView *)self savedMultiPageRanges];

    if (v13)
    {
      v14 = [(UIPrintRangeView *)self savedMultiPageRanges];
      uint64_t v15 = [(UIPrintRangeView *)self printInfo];
      [v15 setPageRanges:v14];

      [(UIPrintRangeView *)self reloadTableView];
    }
  }
}

- (void)reloadTableView
{
  v3 = [(UIPrintRangeView *)self tableView];
  [v3 reloadData];

  id v4 = [(UIPrintRangeView *)self tableView];
  [v4 layoutIfNeeded];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v4 = [(UIPrintRangeView *)self printInfo];
  int64_t v5 = [v4 pageCount];

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return LocalizedInteger(a4 + 1);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(UIPrintRangeView *)self fromPicker];
  uint64_t v8 = [v7 selectedRowInComponent:0];

  unint64_t v9 = [(UIPrintRangeView *)self toPicker];
  uint64_t v10 = [v9 selectedRowInComponent:0];

  id v11 = [(UIPrintRangeView *)self fromPicker];

  v12 = [(UIPrintRangeView *)self toPicker];
  id v13 = v12;
  if (v11 == v6 && v8 > v10)
  {
    [v12 selectRow:v8 inComponent:0 animated:1];
    uint64_t v10 = v8;
LABEL_7:

    goto LABEL_8;
  }

  if (v13 == v6 && v8 > v10)
  {
    id v13 = [(UIPrintRangeView *)self fromPicker];
    [v13 selectRow:v10 inComponent:0 animated:1];
    uint64_t v8 = v10;
    goto LABEL_7;
  }
LABEL_8:
  v14 = [(UIPrintRangeView *)self printInfo];
  uint64_t v15 = [v14 pageRanges];
  unint64_t v16 = [v15 firstObject];
  [v16 rangeValue];

  unint64_t v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v8, v10 - v8 + 1);
  v20[0] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v19 = [(UIPrintRangeView *)self printInfo];
  [v19 setPageRanges:v18];

  [(UIPrintRangeView *)self reloadTableView];
}

- (UIView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
}

- (UIPickerView)fromPicker
{
  return self->_fromPicker;
}

- (void)setFromPicker:(id)a3
{
}

- (UIPickerView)toPicker
{
  return self->_toPicker;
}

- (void)setToPicker:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)savedMultiPageRanges
{
  return self->_savedMultiPageRanges;
}

- (void)setSavedMultiPageRanges:(id)a3
{
}

- (double)pickerWidth
{
  return self->_pickerWidth;
}

- (void)setPickerWidth:(double)a3
{
  self->_pickerWidth = a3;
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_savedMultiPageRanges, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_toPicker, 0);
  objc_storeStrong((id *)&self->_fromPicker, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
}

@end