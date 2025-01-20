@interface RAPTableCollapsableCheckmarkSection
- (Class)defaultCellClass;
- (NSArray)originalValues;
- (RAPTableCollapsableCheckmarkSection)initWithOwner:(id)a3 initialValues:(id)a4 initialSelectedValue:(id)a5 configureForValue:(id)a6 selection:(id)a7;
- (id)headerTitle;
- (void)_sharedInit;
- (void)_showAll;
- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
- (void)selectedValueDidChange;
- (void)setHeaderTitle:(id)a3;
- (void)setValues:(id)a3;
- (void)toggleCollapse;
@end

@implementation RAPTableCollapsableCheckmarkSection

- (RAPTableCollapsableCheckmarkSection)initWithOwner:(id)a3 initialValues:(id)a4 initialSelectedValue:(id)a5 configureForValue:(id)a6 selection:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [a6 copy];
  id v17 = [v12 copy];

  v20.receiver = self;
  v20.super_class = (Class)RAPTableCollapsableCheckmarkSection;
  v18 = [(RAPTableCheckmarkRadioSection *)&v20 initWithOwner:v15 initialValues:v14 initialSelectedValue:v13 configureForValue:v16 selection:v17];

  if (v18) {
    [(RAPTableCollapsableCheckmarkSection *)v18 _sharedInit];
  }
  return v18;
}

- (void)_sharedInit
{
  v3 = [(RAPHeaderFooterView *)[RAPCollapsableHeaderFooterView alloc] initWithReuseIdentifier:@"RAPSearchResultsHeaderView"];
  collapsableHeaderView = self->_collapsableHeaderView;
  self->_collapsableHeaderView = v3;

  [(RAPCollapsableHeaderFooterView *)self->_collapsableHeaderView setTarget:self action:"_showAll"];
  v5 = self->_collapsableHeaderView;

  [(RAPTablePartSection *)self setHeaderView:v5];
}

- (void)setHeaderTitle:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:self->_headerTitle] & 1) == 0) {
    [(RAPHeaderFooterView *)self->_collapsableHeaderView setTitleLabelText:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)RAPTableCollapsableCheckmarkSection;
  [(RAPTablePartSection *)&v5 setHeaderTitle:v4];
}

- (void)setValues:(id)a3
{
  id v4 = (NSArray *)a3;
  objc_super v5 = v4;
  if (self->super._values != v4)
  {
    v6 = (NSArray *)[(NSArray *)v4 copy];
    originalValues = self->_originalValues;
    self->_originalValues = v6;

    v8 = [(RAPTableCheckmarkRadioSection *)self selectedValue];
    if (v8)
    {
      v9 = self->_originalValues;
      v10 = [(RAPTableCheckmarkRadioSection *)self selectedValue];
      self->_selectedIndex = [(NSArray *)v9 indexOfObject:v10];
    }
    else
    {
      self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)RAPTableCollapsableCheckmarkSection;
  [(RAPTableCheckmarkRadioSection *)&v11 setValues:v5];
}

- (Class)defaultCellClass
{
  return (Class)objc_opt_class();
}

- (void)_showAll
{
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  if (a3 || self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9.receiver = self;
    v9.super_class = (Class)RAPTableCollapsableCheckmarkSection;
    id v8 = a4;
    [(RAPTableCheckmarkRadioSection *)&v9 didSelectCellForRowAtIndex:a3 tableIndexPath:v8];
  }
  else
  {
    id v6 = a4;
    v7 = [(RAPTablePartSection *)self tableView];
    [v7 deselectRowAtIndexPath:v6 animated:1];

    [(RAPTableCollapsableCheckmarkSection *)self _showAll];
  }
}

- (void)selectedValueDidChange
{
  if ((id)[(NSArray *)self->_originalValues count] == (id)1)
  {
    id v13 = self;
    v3 = &v13;
  }
  else
  {
    id v4 = [(RAPTableCheckmarkRadioSection *)self selectedValue];

    if (v4)
    {
      objc_super v5 = [(RAPTableCheckmarkRadioSection *)self selectedValue];
      id v14 = v5;
      id v6 = +[NSArray arrayWithObjects:&v14 count:1];
      values = self->super._values;
      self->super._values = v6;

      originalValues = self->_originalValues;
      objc_super v9 = [(RAPTableCheckmarkRadioSection *)self selectedValue];
      self->_selectedIndex = [(NSArray *)originalValues indexOfObject:v9];
    }
    if ([(NSArray *)self->_originalValues count] < 2)
    {
      BOOL v11 = 0;
    }
    else
    {
      v10 = [(RAPTableCheckmarkRadioSection *)self selectedValue];
      BOOL v11 = v10 != 0;
    }
    [(RAPCollapsableHeaderFooterView *)self->_collapsableHeaderView setShowAllButtonVisible:v11];
    [(RAPTableCollapsableCheckmarkSection *)self toggleCollapse];
    id v12 = self;
    v3 = &v12;
  }
  v3[1] = (RAPTableCollapsableCheckmarkSection *)RAPTableCollapsableCheckmarkSection;
  [super selectedValueDidChange:v12];
}

- (void)toggleCollapse
{
  id v5 = [(RAPTablePartSection *)self tableView];
  v3 = [(RAPTableCheckmarkRadioSection *)self selectedValue];
  if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t selectedIndex = -1;
  }
  else {
    int64_t selectedIndex = self->_selectedIndex;
  }
  +[RAPCollapsableHeaderFooterView toggleCollapseForTableView:v5 AtSection:0 withSelectedValue:v3 withSelectedIndex:selectedIndex withAllValues:self->_originalValues];
}

- (id)headerTitle
{
  return self->_headerTitle;
}

- (NSArray)originalValues
{
  return self->_originalValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalValues, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);

  objc_storeStrong((id *)&self->_collapsableHeaderView, 0);
}

@end