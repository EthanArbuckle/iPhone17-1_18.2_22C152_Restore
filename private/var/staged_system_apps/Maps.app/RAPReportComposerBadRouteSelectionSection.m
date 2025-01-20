@interface RAPReportComposerBadRouteSelectionSection
- (BOOL)_isExpansionCellIndex:(int64_t)a3;
- (BOOL)_isNoGoodCellIndex:(int64_t)a3;
- (RAPReportComposerBadRouteSelectionSection)initWithQuestion:(id)a3 willChangeQuestionRequiringNoScroll:(id)a4;
- (UIEdgeInsets)_separatorInset;
- (id)cellForRowAtIndex:(int64_t)a3;
- (int64_t)_expansionCellIndex;
- (int64_t)rowsCount;
- (unint64_t)_selectableRouteSuggestionIndexForCellIndex:(int64_t)a3;
- (void)_noteWillSelectWithoutScroll;
- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
@end

@implementation RAPReportComposerBadRouteSelectionSection

- (RAPReportComposerBadRouteSelectionSection)initWithQuestion:(id)a3 willChangeQuestionRequiringNoScroll:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RAPReportComposerBadRouteSelectionSection;
  v9 = [(RAPTablePartSection *)&v18 init];
  v10 = v9;
  if (v9)
  {
    p_question = (id *)&v9->_question;
    objc_storeStrong((id *)&v9->_question, a3);
    v12 = [*p_question selectableRouteSuggestions];
    v10->_collapsed = (unint64_t)[v12 count] > 5;

    id v13 = [v8 copy];
    id willChangeQuestionRequiringNoScroll = v10->_willChangeQuestionRequiringNoScroll;
    v10->_id willChangeQuestionRequiringNoScroll = v13;

    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"Route" value:@"localized string not found" table:0];
    [(RAPTablePartSection *)v10 setHeaderTitle:v16];

    [*p_question addObserver:v10 changeHandler:&stru_1012F96B0];
  }

  return v10;
}

- (int64_t)rowsCount
{
  if (self->_collapsed) {
    return 7;
  }
  v4 = [(RAPBadRouteSuggestionsQuestion *)self->_question selectableRouteSuggestions];
  id v5 = [v4 count];

  return (int64_t)v5 + self->_collapsed + 1;
}

- (BOOL)_isNoGoodCellIndex:(int64_t)a3
{
  return a3 == 0;
}

- (int64_t)_expansionCellIndex
{
  return 6;
}

- (BOOL)_isExpansionCellIndex:(int64_t)a3
{
  return self->_collapsed
      && [(RAPReportComposerBadRouteSelectionSection *)self _expansionCellIndex] == a3;
}

- (unint64_t)_selectableRouteSuggestionIndexForCellIndex:(int64_t)a3
{
  return a3 - 1;
}

- (UIEdgeInsets)_separatorInset
{
  CGFloat bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  +[TransitRouteRAPTableViewCell leadingTextAlignmentMargin];
  CGFloat v5 = v4;
  v6 = +[UIApplication sharedApplication];
  id v7 = [v6 userInterfaceLayoutDirection];

  if (v7)
  {
    CGFloat left = UIEdgeInsetsZero.left;
    v9 = +[UIApplication sharedApplication];
    id v10 = [v9 userInterfaceLayoutDirection];

    if (v10 == (id)1) {
      double right = v5;
    }
    CGFloat v5 = left;
  }
  double top = UIEdgeInsetsZero.top;
  double v12 = v5;
  double v13 = bottom;
  double v14 = right;
  result.double right = v14;
  result.CGFloat bottom = v13;
  result.CGFloat left = v12;
  result.double top = top;
  return result;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  if (-[RAPReportComposerBadRouteSelectionSection _isNoGoodCellIndex:](self, "_isNoGoodCellIndex:"))
  {
    CGFloat v5 = [(RAPTablePartSection *)self dequeueCellWithNamespacedReuseIdentifier:@"NoGoodCell" creationBlock:&stru_1012F96F0];
    v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"No good routes shown" value:@"localized string not found" table:0];
    id v8 = [v5 textLabel];
    [v8 setText:v7];

    [v5 setChecked:[self->_question noGoodRoutesShown]];
  }
  else if ([(RAPReportComposerBadRouteSelectionSection *)self _isExpansionCellIndex:a3])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1007F2200;
    v19[3] = &unk_1012F9718;
    v19[4] = self;
    CGFloat v5 = [(RAPTablePartSection *)self dequeueCellWithNamespacedReuseIdentifier:@"ExpandCell" creationBlock:v19];
    v9 = [(RAPTablePartSection *)self tableView];
    id v10 = [v9 tintColor];
    v11 = [v5 textLabel];
    [v11 setTextColor:v10];
  }
  else
  {
    unint64_t v12 = [(RAPReportComposerBadRouteSelectionSection *)self _selectableRouteSuggestionIndexForCellIndex:a3];
    double v13 = [(RAPBadRouteSuggestionsQuestion *)self->_question selectableRouteSuggestions];
    double v14 = [v13 objectAtIndexedSubscript:v12];

    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    CGFloat v5 = [(RAPTablePartSection *)self dequeueCellWithNamespacedReuseIdentifier:v16 creationBlock:&stru_1012F9738];

    [v5 setRoute:v14];
    v17 = [(RAPBadRouteSuggestionsQuestion *)self->_question selectedRouteSuggestions];
    [v5 setChecked:[v17 containsObject:v14]];
  }

  return v5;
}

- (void)_noteWillSelectWithoutScroll
{
  id willChangeQuestionRequiringNoScroll = (void (**)(void))self->_willChangeQuestionRequiringNoScroll;
  if (willChangeQuestionRequiringNoScroll) {
    willChangeQuestionRequiringNoScroll[2]();
  }
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(RAPTablePartSection *)self tableView];
  [v7 deselectRowAtIndexPath:v6 animated:1];

  if ([(RAPReportComposerBadRouteSelectionSection *)self _isNoGoodCellIndex:a3])
  {
    [(RAPBadRouteSuggestionsQuestion *)self->_question setNoGoodRoutesShown:[(RAPBadRouteSuggestionsQuestion *)self->_question noGoodRoutesShown] ^ 1];
    [(RAPReportComposerBadRouteSelectionSection *)self _noteWillSelectWithoutScroll];
  }
  else if ([(RAPReportComposerBadRouteSelectionSection *)self _isExpansionCellIndex:a3])
  {
    id v8 = [(RAPTablePartSection *)self tableView];
    [v8 beginUpdates];

    self->_collapsed = 0;
    v9 = [(RAPTablePartSection *)self tableView];
    id v10 = +[NSIndexPath indexPathForRow:[(RAPReportComposerBadRouteSelectionSection *)self _expansionCellIndex] inSection:[(RAPTablePartSection *)self sectionIndex]];
    v22 = v10;
    v11 = +[NSArray arrayWithObjects:&v22 count:1];
    [v9 deleteRowsAtIndexPaths:v11 withRowAnimation:4];

    id v12 = objc_alloc_init((Class)NSMutableArray);
    for (uint64_t i = [(RAPReportComposerBadRouteSelectionSection *)self _expansionCellIndex];
          i < [(RAPReportComposerBadRouteSelectionSection *)self rowsCount];
          ++i)
    {
      double v14 = +[NSIndexPath indexPathForRow:i inSection:[(RAPTablePartSection *)self sectionIndex]];
      [v12 addObject:v14];
    }
    v20 = [(RAPTablePartSection *)self tableView];
    [v20 insertRowsAtIndexPaths:v12 withRowAnimation:3];

    v21 = [(RAPTablePartSection *)self tableView];
    [v21 endUpdates];
  }
  else
  {
    v15 = [(RAPBadRouteSuggestionsQuestion *)self->_question selectedRouteSuggestions];
    id v16 = [v15 mutableCopy];

    if (!v16) {
      id v16 = objc_alloc_init((Class)NSMutableSet);
    }
    unint64_t v17 = [(RAPReportComposerBadRouteSelectionSection *)self _selectableRouteSuggestionIndexForCellIndex:a3];
    objc_super v18 = [(RAPBadRouteSuggestionsQuestion *)self->_question selectableRouteSuggestions];
    v19 = [v18 objectAtIndexedSubscript:v17];

    if (v19)
    {
      if ([v16 containsObject:v19]) {
        [v16 removeObject:v19];
      }
      else {
        [v16 addObject:v19];
      }
    }
    [(RAPReportComposerBadRouteSelectionSection *)self _noteWillSelectWithoutScroll];
    [(RAPBadRouteSuggestionsQuestion *)self->_question setSelectedRouteSuggestions:v16];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_willChangeQuestionRequiringNoScroll, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end