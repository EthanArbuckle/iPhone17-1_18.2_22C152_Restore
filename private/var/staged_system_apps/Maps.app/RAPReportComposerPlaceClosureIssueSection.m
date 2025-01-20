@interface RAPReportComposerPlaceClosureIssueSection
- (RAPReportComposerPlaceClosureIssueSection)initWithQuestion:(id)a3 selection:(id)a4;
- (id)cellForRowAtIndex:(int64_t)a3;
- (int64_t)rowsCount;
- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
@end

@implementation RAPReportComposerPlaceClosureIssueSection

- (RAPReportComposerPlaceClosureIssueSection)initWithQuestion:(id)a3 selection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPReportComposerPlaceClosureIssueSection;
  v9 = [(RAPTablePartSection *)&v16 init];
  v10 = v9;
  if (v9)
  {
    p_question = (id *)&v9->_question;
    objc_storeStrong((id *)&v9->_question, a3);
    [*p_question addObserver:v10 changeHandler:&stru_1012E7458];
    v12 = [*p_question localizedSelectableIssueLabel];
    [(RAPTablePartSection *)v10 setHeaderTitle:v12];

    id v13 = [v8 copy];
    id selection = v10->_selection;
    v10->_id selection = v13;
  }
  return v10;
}

- (int64_t)rowsCount
{
  v2 = [(RAPPlaceClosureQuestion *)self->_question selectableIssues];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  v5 = [(RAPTablePartSection *)self dequeueDefaultSingleLineTableViewCell];
  v6 = [(RAPPlaceClosureQuestion *)self->_question selectableIssues];
  id v7 = [v6 objectAtIndexedSubscript:a3];

  id v8 = [v7 localizedName];
  v9 = [v5 textLabel];
  [v9 setText:v8];

  v10 = [(RAPPlaceClosureQuestion *)self->_question selectedIssue];

  if (v10 == v7) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }
  [v5 setAccessoryType:v11];
  [v5 setSelectionStyle:0];

  return v5;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  v6 = [(RAPPlaceClosureQuestion *)self->_question selectableIssues];
  id v8 = [v6 objectAtIndexedSubscript:a3];

  [(RAPPlaceClosureQuestion *)self->_question setSelectedIssue:v8];
  id selection = (void (**)(void))self->_selection;
  if (selection) {
    selection[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selection, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end