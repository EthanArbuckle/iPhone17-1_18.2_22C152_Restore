@interface TFFeedbackFormViewDataSource
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (TFFeedbackFormCellUpdater)cellUpdater;
- (TFFeedbackFormPresenter)presenter;
- (TFFeedbackFormViewDataSource)initWithPresenter:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)prepareTableViewForDataSource:(id)a3;
@end

@implementation TFFeedbackFormViewDataSource

- (TFFeedbackFormViewDataSource)initWithPresenter:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFFeedbackFormViewDataSource;
  v6 = [(TFFeedbackFormViewDataSource *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    v8 = objc_alloc_init(TFFeedbackFormCellUpdater);
    cellUpdater = v7->_cellUpdater;
    v7->_cellUpdater = v8;
  }
  return v7;
}

- (void)prepareTableViewForDataSource:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = +[TFLinkableHeaderFooterView reuseIdentifier];
  [v3 registerClass:v4 forHeaderFooterViewReuseIdentifier:v5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TFFeedbackFormViewDataSource *)self presenter];
  v9 = objc_msgSend(v8, "visibleEntryAtGroupIndex:entryIndex:", objc_msgSend(v6, "section"), objc_msgSend(v6, "row"));

  v10 = +[TFFeedbackEntryTypeCellProvider reuseIdentifierForEntryType:](TFFeedbackEntryTypeCellProvider, "reuseIdentifierForEntryType:", [v9 type]);
  objc_super v11 = [v7 dequeueReusableCellWithIdentifier:v10 forIndexPath:v6];

  v12 = [(TFFeedbackFormViewDataSource *)self cellUpdater];
  v13 = [(TFFeedbackFormViewDataSource *)self presenter];
  v14 = [v13 feedbackDataSource];
  v15 = [(TFFeedbackFormViewDataSource *)self presenter];
  [v12 updateCell:v11 displayingEntry:v9 contentDataSource:v14 updateProxy:v15];

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(TFFeedbackFormViewDataSource *)self presenter];
  int64_t v6 = [v5 numberOfVisibleItemsInGroupAtIndex:a4];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(TFFeedbackFormViewDataSource *)self presenter];
  int64_t v4 = [v3 numberOfEntryGroupsInForm];

  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TFFeedbackFormViewDataSource *)self presenter];
  v8 = [v7 headerTextForGroupAtIndex:a4];

  if (v8)
  {
    v9 = +[TFLinkableHeaderFooterView reuseIdentifier];
    v10 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v9];

    [v10 applyText:v8 withTextLinkMap:0 isHeader:1];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TFFeedbackFormViewDataSource *)self presenter];
  v8 = [v7 footerTextForGroupAtIndex:a4];

  if (v8)
  {
    v9 = +[TFLinkableHeaderFooterView reuseIdentifier];
    v10 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v9];

    objc_super v11 = [(TFFeedbackFormViewDataSource *)self presenter];
    v12 = [v11 footerTextLinkMapForGroupAtIndex:a4];
    [v10 applyText:v8 withTextLinkMap:v12 isHeader:0];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TFFeedbackFormViewDataSource *)self presenter];
  v8 = [v7 headerTextForGroupAtIndex:a4];

  if (v8)
  {
    [v6 bounds];
    +[TFLinkableHeaderFooterView itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:](TFLinkableHeaderFooterView, "itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:", v8, 1, v6, CGRectGetWidth(v12), 1.79769313e308);
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(TFFeedbackFormViewDataSource *)self presenter];
  v8 = [v7 footerTextForGroupAtIndex:a4];

  if (v8)
  {
    [v6 bounds];
    +[TFLinkableHeaderFooterView itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:](TFLinkableHeaderFooterView, "itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:", v8, 0, v6, CGRectGetWidth(v12), 1.79769313e308);
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TFFeedbackFormViewDataSource *)self presenter];
  uint64_t v9 = [v6 section];
  uint64_t v10 = [v6 row];

  objc_super v11 = [v8 visibleEntryAtGroupIndex:v9 entryIndex:v10];

  CGRect v12 = [(TFFeedbackFormViewDataSource *)self presenter];
  v13 = [v12 feedbackDataSource];
  [v7 bounds];
  +[TFFeedbackEntryTypeCellProvider cellSizeForEntry:dataSource:fittingSize:inTraitEnvironment:](TFFeedbackEntryTypeCellProvider, "cellSizeForEntry:dataSource:fittingSize:inTraitEnvironment:", v11, v13, v7, v14, 1.79769313e308);
  double v16 = v15;

  return v16;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [a3 cellForRowAtIndexPath:v5];
  id v7 = v6;
  if (v6 && [v6 isSelectable]) {
    id v8 = v5;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (TFFeedbackFormPresenter)presenter
{
  return self->_presenter;
}

- (TFFeedbackFormCellUpdater)cellUpdater
{
  return self->_cellUpdater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellUpdater, 0);

  objc_storeStrong((id *)&self->_presenter, 0);
}

@end