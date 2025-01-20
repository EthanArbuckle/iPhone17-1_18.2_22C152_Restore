@interface RAPCuratedCollectionCategoriesViewController
- (RAPCuratedCollectionCategoriesViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (RAPCuratedCollectionQuestion)question;
- (RAPReport)report;
- (id)completion;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setCompletion:(id)a3;
- (void)setQuestion:(id)a3;
- (void)setReport:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation RAPCuratedCollectionCategoriesViewController

- (RAPCuratedCollectionCategoriesViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)RAPCuratedCollectionCategoriesViewController;
  v12 = [(RAPCuratedCollectionCategoriesViewController *)&v23 initWithStyle:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    objc_storeStrong((id *)&v13->_question, a4);
    id v14 = [v11 copy];
    id completion = v13->_completion;
    v13->_id completion = v14;

    v16 = [(RAPCuratedCollectionCategoriesViewController *)v13 tableView];
    uint64_t v17 = objc_opt_class();
    v18 = +[RAPSingleLineTableViewCell reuseIdentifier];
    [v16 registerClass:v17 forCellReuseIdentifier:v18];

    v19 = [(RAPCuratedCollectionCategoriesViewController *)v13 tableView];
    [v19 _maps_initializeRAPAppearance];

    v20 = [(RAPQuestion *)v13->_question localizedTitle];
    v21 = [(RAPCuratedCollectionCategoriesViewController *)v13 navigationItem];
    [v21 setTitle:v20];
  }
  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  if (a4)
  {
    v6 = &stru_101324E70;
  }
  else
  {
    v7 = +[NSBundle mainBundle];
    v6 = [v7 localizedStringForKey:@"Feedback [Report a Problem]" value:@"localized string not found" table:0];
  }
  v8 = [v5 _maps_groupedHeaderViewWithTitle:v6];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  id v5 = [(RAPCuratedCollectionCategoriesViewController *)self question];
  v6 = [v5 categoryItems];
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    v8 = 0;
  }
  else
  {
    id v9 = +[RAPSingleLineTableViewCell reuseIdentifier];
    v8 = [v6 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];

    id v10 = [(RAPCuratedCollectionCategoriesViewController *)self question];
    id v11 = [v10 categoryItems];
    v12 = [v11 objectAtIndex:[v7 row]];

    [v8 setAccessoryType:1];
    v13 = [v12 localizedName];
    id v14 = [v8 textLabel];
    [v14 setText:v13];
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (![v6 section])
  {
    [v19 deselectRowAtIndexPath:v6 animated:1];
    id v7 = [(RAPCuratedCollectionCategoriesViewController *)self question];
    v8 = [v7 categoryItems];
    id v9 = [v8 objectAtIndex:[v6 row]];

    id v10 = [v9 type];
    id v11 = [(RAPCuratedCollectionCategoriesViewController *)self question];
    [v11 setSelectedQuestionType:v10];

    if ([v9 type] == (id)3)
    {
      v12 = [RAPCuratedCollectionPOISelectionViewController alloc];
      v13 = [(RAPCuratedCollectionCategoriesViewController *)self report];
      id v14 = [(RAPCuratedCollectionCategoriesViewController *)self question];
      v15 = [(RAPCuratedCollectionPOISelectionViewController *)v12 initWithReport:v13 parentQuestion:v14 completion:self->_completion];
    }
    else
    {
      v16 = [RAPReportComposerCommentViewController alloc];
      v13 = [(RAPCuratedCollectionCategoriesViewController *)self report];
      id v14 = [(RAPCuratedCollectionCategoriesViewController *)self question];
      v15 = [(RAPReportComposerCommentViewController *)v16 initWithReport:v13 question:v14 completion:self->_completion];
    }
    uint64_t v17 = v15;

    v18 = [(RAPCuratedCollectionCategoriesViewController *)self navigationController];
    [v18 pushViewController:v17 animated:1];
  }
}

- (RAPReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (RAPCuratedCollectionQuestion)question
{
  return self->_question;
}

- (void)setQuestion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_question, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end