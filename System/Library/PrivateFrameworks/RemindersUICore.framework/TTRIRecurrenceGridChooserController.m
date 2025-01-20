@interface TTRIRecurrenceGridChooserController
- (BOOL)drawBackgroundForRow:(int64_t)a3;
- (double)heightForRow:(int64_t)a3;
- (id)allCells;
- (id)cellAccessibilityLabels;
- (id)cellLabels;
- (id)tableViewCell;
- (int64_t)gridViewType;
- (void)dividedGridViewController:(id)a3 didSelectCell:(id)a4 atIndex:(int64_t)a5;
- (void)dividedGridViewControllerDidLayout:(id)a3;
- (void)prepareForDisplay;
- (void)refreshCells;
- (void)selectCell:(id)a3 atIndex:(int64_t)a4;
@end

@implementation TTRIRecurrenceGridChooserController

- (id)tableViewCell
{
  tableViewCell = self->_tableViewCell;
  if (!tableViewCell)
  {
    v4 = [TTRIUIDividedGridViewTableViewCell alloc];
    int64_t v5 = [(TTRIRecurrenceGridChooserController *)self gridViewType];
    v6 = [(TTRIRecurrenceGridChooserController *)self cellLabels];
    v7 = [(TTRIRecurrenceGridChooserController *)self cellAccessibilityLabels];
    v8 = [(TTRIRecurrenceChooserController *)self backgroundColor];
    v9 = [(TTRIUIDividedGridViewTableViewCell *)v4 initWithStyle:0 reuseIdentifier:0 gridViewType:v5 buttonTitles:v6 buttonAccessibilityLabels:v7 cellBackgroundColor:v8];

    [(TTRIUIDividedGridViewTableViewCell *)v9 setDrawingEnabled:1];
    [(TTRIUIDividedGridViewTableViewCell *)v9 setSelectionStyle:0];
    v10 = [(TTRIUIDividedGridViewTableViewCell *)v9 gridViewController];
    [v10 setDelegate:self];

    [(TTRIUIDividedGridViewTableViewCell *)v9 setDrawsTopDivider:0];
    v11 = self->_tableViewCell;
    self->_tableViewCell = v9;

    tableViewCell = self->_tableViewCell;
  }

  return tableViewCell;
}

- (id)allCells
{
  v2 = [(TTRIRecurrenceGridChooserController *)self tableViewCell];
  v3 = [v2 gridViewController];
  v4 = [v3 allCells];

  return v4;
}

- (double)heightForRow:(int64_t)a3
{
  v3 = [(TTRIRecurrenceGridChooserController *)self tableViewCell];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v5 = v4;

  return v5;
}

- (void)dividedGridViewControllerDidLayout:(id)a3
{
  [(TTRIRecurrenceGridChooserController *)self prepareForDisplay];

  [(TTRIRecurrenceGridChooserController *)self refreshCells];
}

- (void)dividedGridViewController:(id)a3 didSelectCell:(id)a4 atIndex:(int64_t)a5
{
}

- (BOOL)drawBackgroundForRow:(int64_t)a3
{
  return [(TTRIUIDividedGridViewTableViewCell *)self->_tableViewCell wantsDrawBackground];
}

- (id)cellAccessibilityLabels
{
  return 0;
}

- (void).cxx_destruct
{
}

- (id)cellLabels
{
  return 0;
}

- (int64_t)gridViewType
{
  return -1;
}

- (void)prepareForDisplay
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();

  NSRequestConcreteImplementation();
}

- (void)refreshCells
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();

  NSRequestConcreteImplementation();
}

- (void)selectCell:(id)a3 atIndex:(int64_t)a4
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();

  NSRequestConcreteImplementation();
}

@end