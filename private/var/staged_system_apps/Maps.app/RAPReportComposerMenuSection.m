@interface RAPReportComposerMenuSection
- (RAPReportComposerMenuSection)initWithMenu:(id)a3 headerText:(id)a4 menuSectionIndex:(unint64_t)a5 selection:(id)a6;
- (id)cellForRowAtIndex:(int64_t)a3;
- (int64_t)rowsCount;
- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
@end

@implementation RAPReportComposerMenuSection

- (RAPReportComposerMenuSection)initWithMenu:(id)a3 headerText:(id)a4 menuSectionIndex:(unint64_t)a5 selection:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RAPReportComposerMenuSection;
  v14 = [(RAPTablePartSection *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_question, a3);
    v15->_sectionIndex = a5;
    [(RAPTablePartSection *)v15 setHeaderTitle:v12];
    id v16 = [v13 copy];
    id selection = v15->_selection;
    v15->_id selection = v16;
  }
  return v15;
}

- (int64_t)rowsCount
{
  return (int64_t)[(RAPMenu *)self->_question numberOfMenuItemsInSection:self->_sectionIndex];
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  unsigned int v5 = [(RAPMenu *)self->_question shouldShowSubtitles];
  v6 = +[NSIndexPath indexPathForRow:a3 inSection:self->_sectionIndex];
  v7 = [(RAPMenu *)self->_question menuItemForIndexPath:v6];
  if (v5)
  {
    v8 = [(RAPTablePartSection *)self tableView];
    v9 = +[RAPTwoLinesMenuTableViewCell reuseIdentifier];
    v10 = [v8 dequeueReusableCellWithIdentifier:v9];

    if (!v10) {
      v10 = objc_alloc_init(RAPTwoLinesMenuTableViewCell);
    }
    id v11 = +[RAPTwoLinesViewModelImpl viewModelFromRAPMenuItem:v7];
    [(RAPTwoLinesMenuTableViewCell *)v10 setViewModel:v11];
  }
  else
  {
    v10 = [(RAPTablePartSection *)self dequeueDefaultSingleLineTableViewCell];
    id v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    id v13 = [(RAPTwoLinesMenuTableViewCell *)v10 textLabel];
    [v13 setFont:v12];

    v14 = [v7 localizedTitle];
    v15 = [(RAPTwoLinesMenuTableViewCell *)v10 textLabel];
    [v15 setText:v14];

    [(RAPTwoLinesMenuTableViewCell *)v10 setAccessoryType:1];
  }

  return v10;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v7 = +[NSIndexPath indexPathForRow:a3 inSection:self->_sectionIndex];
  unsigned int v5 = -[RAPMenu menuItemForIndexPath:](self->_question, "menuItemForIndexPath:");
  [(RAPMenu *)self->_question setSelectedMenuItem:v5];
  id selection = (void (**)(id, RAPReportComposerMenuSection *, void *))self->_selection;
  if (selection) {
    selection[2](selection, self, v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selection, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end