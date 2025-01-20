@interface UIPrintLayoutDirectionOption
- (NSArray)layoutDirectionOptions;
- (NSIndexPath)selectedIndexPath;
- (UIPrintLayoutDirectionOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4;
- (id)itemList;
- (id)printOptionTableViewCell;
- (id)shortSummary;
- (id)summaryString;
- (int64_t)listItemSelected:(id)a3;
- (void)dealloc;
- (void)didSelectPrintOption;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setLayoutDirectionOptions:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintLayoutDirectionOption

- (void)dealloc
{
  v3 = [(UIPrintOption *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9E058];

  v4 = [(UIPrintOption *)self printInfo];
  [v4 removeObserver:self forKeyPath:0x1F3C9DFF8];

  v5.receiver = self;
  v5.super_class = (Class)UIPrintLayoutDirectionOption;
  [(UIPrintLayoutDirectionOption *)&v5 dealloc];
}

- (UIPrintLayoutDirectionOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  v38[4] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)UIPrintLayoutDirectionOption;
  v4 = [(UIPrintOption *)&v37 initWithPrintInfo:a3 printPanelViewController:a4];
  if (v4)
  {
    objc_super v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"Layout Direction" value:@"Layout Direction" table:@"Localizable"];
    [(UIPrintOption *)v4 setTitle:v6];

    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v35 = [v36 localizedStringForKey:@"Left-Right-Top-Bottom" value:@"Left-Right-Top-Bottom" table:@"Localizable"];
    v34 = [MEMORY[0x1E4FB1818] imageNamed:@"LayoutDirection1" inBundle:v7 withConfiguration:0];
    v33 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v35, @"Title", v34, @"Image", 0);
    v38[0] = v33;
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v30 = [v32 localizedStringForKey:@"Right-Left-Top-Bottom" value:@"Right-Left-Top-Bottom" table:@"Localizable"];
    v10 = (void *)v7;
    v29 = [MEMORY[0x1E4FB1818] imageNamed:@"LayoutDirection2" inBundle:v7 withConfiguration:0];
    v28 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v30, @"Title", v29, @"Image", 0);
    v38[1] = v28;
    v11 = (void *)MEMORY[0x1E4F1C9E8];
    v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [v27 localizedStringForKey:@"Top-Bottom-Left-Right" value:@"Top-Bottom-Left-Right" table:@"Localizable"];
    v13 = v10;
    v31 = v10;
    v14 = [MEMORY[0x1E4FB1818] imageNamed:@"LayoutDirection3" inBundle:v10 withConfiguration:0];
    v15 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, @"Title", v14, @"Image", 0);
    v38[2] = v15;
    v16 = (void *)MEMORY[0x1E4F1C9E8];
    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"Top-Bottom-Right-Left" value:@"Top-Bottom-Right-Left" table:@"Localizable"];
    v19 = [MEMORY[0x1E4FB1818] imageNamed:@"LayoutDirection4" inBundle:v13 withConfiguration:0];
    v20 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v18, @"Title", v19, @"Image", 0);
    v38[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
    [(UIPrintLayoutDirectionOption *)v4 setLayoutDirectionOptions:v21];

    v22 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [(UIPrintLayoutDirectionOption *)v4 setSelectedIndexPath:v22];

    v23 = [(UIPrintLayoutDirectionOption *)v4 summaryString];
    [(UIPrintOption *)v4 setSummary:v23];

    v24 = [(UIPrintOption *)v4 printInfo];
    [v24 addObserver:v4 forKeyPath:0x1F3C9E058 options:0 context:0];

    v25 = [(UIPrintOption *)v4 printInfo];
    [v25 addObserver:v4 forKeyPath:0x1F3C9DFF8 options:0 context:0];
  }
  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__UIPrintLayoutDirectionOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __79__UIPrintLayoutDirectionOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (id)printOptionTableViewCell
{
  v3 = [(UIPrintOption *)self printPanelViewController];
  v4 = [v3 printOptionsTableView];
  objc_super v5 = [v4 dequeueReusableCellWithIdentifier:@"UIPrintOptionListCell"];

  v6 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  uint64_t v7 = [(UIPrintOption *)self title];
  [v6 setText:v7];

  v8 = [(UIPrintLayoutDirectionOption *)self shortSummary];
  [v6 setSecondaryText:v8];

  [v5 setContentConfiguration:v6];
  [v5 setAccessoryType:1];
  [v5 setSelectionStyle:3];
  [v5 setItemListDelegate:self];
  [(UIPrintOption *)self setTableViewCell:v5];

  return v5;
}

- (void)updateFromPrintInfo
{
  v3 = (void *)MEMORY[0x1E4F28D58];
  v4 = [(UIPrintOption *)self printInfo];
  objc_super v5 = objc_msgSend(v3, "indexPathForRow:inSection:", objc_msgSend(v4, "nUpLayoutDirection"), 0);
  [(UIPrintLayoutDirectionOption *)self setSelectedIndexPath:v5];

  v6 = [(UIPrintOption *)self tableViewCell];
  id v10 = [v6 contentConfiguration];

  uint64_t v7 = [(UIPrintLayoutDirectionOption *)self shortSummary];
  [v10 setSecondaryText:v7];

  v8 = [(UIPrintOption *)self tableViewCell];
  [v8 setContentConfiguration:v10];

  v9 = [(UIPrintLayoutDirectionOption *)self summaryString];
  [(UIPrintOption *)self setSummary:v9];
}

- (id)itemList
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(UIPrintLayoutDirectionOption *)self layoutDirectionOptions];
  v4 = [v2 arrayWithObject:v3];

  return v4;
}

- (int64_t)listItemSelected:(id)a3
{
  id v4 = a3;
  [(UIPrintLayoutDirectionOption *)self setSelectedIndexPath:v4];
  uint64_t v5 = [v4 row];

  v6 = [(UIPrintOption *)self printInfo];
  [v6 setNUpLayoutDirection:v5];

  return 1;
}

- (id)shortSummary
{
  v3 = [(UIPrintLayoutDirectionOption *)self layoutDirectionOptions];
  id v4 = [(UIPrintOption *)self printInfo];
  uint64_t v5 = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "nUpLayoutDirection"));
  v6 = [v5 objectForKey:@"Title"];

  return v6;
}

- (id)summaryString
{
  v2 = [(UIPrintOption *)self printInfo];
  uint64_t v3 = [v2 nUpLayoutDirection];

  if (v3 == 1)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    v6 = @"Right-Left-Top-Bottom";
  }
  else if (v3 == 2)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    v6 = @"Top-Bottom-Left-Right";
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (v3 == 3)
    {
      uint64_t v5 = v4;
      v6 = @"Top-Bottom-Right-Left";
    }
    else
    {
      uint64_t v5 = v4;
      v6 = @"Left-Right-Top-Bottom";
    }
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:v6 table:@"Localizable"];

  return v7;
}

- (void)didSelectPrintOption
{
  id v2 = [(UIPrintOption *)self tableViewCell];
  [v2 printOptionCellTapped];
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSArray)layoutDirectionOptions
{
  return self->_layoutDirectionOptions;
}

- (void)setLayoutDirectionOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutDirectionOptions, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
}

@end