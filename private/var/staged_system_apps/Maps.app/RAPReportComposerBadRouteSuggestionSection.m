@interface RAPReportComposerBadRouteSuggestionSection
- (RAPReportComposerBadRouteSuggestionSection)initWithQuestion:(id)a3 selection:(id)a4;
- (id)cellForRowAtIndex:(int64_t)a3;
- (int64_t)rowsCount;
- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
@end

@implementation RAPReportComposerBadRouteSuggestionSection

- (RAPReportComposerBadRouteSuggestionSection)initWithQuestion:(id)a3 selection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPReportComposerBadRouteSuggestionSection;
  v9 = [(RAPTablePartSection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_question, a3);
    id v11 = objc_retainBlock(v8);
    id selection = v10->_selection;
    v10->_id selection = v11;

    [(RAPQuestion *)v10->_question addObserver:v10 changeHandler:&stru_101316380];
  }

  return v10;
}

- (int64_t)rowsCount
{
  return 1;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  v4 = [(RAPTablePartSection *)self dequeueDefaultSingleLineTableViewCell];
  v5 = [(RAPDirectionsCategoryQuestion *)self->_question betterRouteAvailableMenuItem];
  v6 = [v5 localizedTitle];
  id v7 = [v4 textLabel];
  [v7 setText:v6];

  [v4 setAccessoryType:1];

  return v4;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v6 = [(RAPDirectionsCategoryQuestion *)self->_question betterRouteAvailableMenuItem];
  -[RAPMenuQuestion setSelectedMenuItem:](self->_question, "setSelectedMenuItem:");
  id selection = (void (**)(id, id))self->_selection;
  if (selection) {
    selection[2](selection, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selection, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end