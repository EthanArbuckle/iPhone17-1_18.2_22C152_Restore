@interface RAPLookAroundInitialCategoriesViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (RAPLookAroundInitialCategoriesViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int)analyticTarget;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_captureUserAction:(int)a3;
- (void)_setupTableView;
- (void)didSelectCategoryOfType:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation RAPLookAroundInitialCategoriesViewController

- (RAPLookAroundInitialCategoriesViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RAPLookAroundInitialCategoriesViewController;
  v12 = [(RAPLookAroundInitialCategoriesViewController *)&v17 initWithStyle:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_report, a3);
    objc_storeStrong((id *)&v13->_question, a4);
    id v14 = [v11 copy];
    id completion = v13->_completion;
    v13->_id completion = v14;
  }
  return v13;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)RAPLookAroundInitialCategoriesViewController;
  [(RAPLookAroundInitialCategoriesViewController *)&v5 viewDidLoad];
  [(RAPLookAroundInitialCategoriesViewController *)self _setupTableView];
  v3 = [(RAPLookAroundQuestion *)self->_question localizedTitle];
  v4 = [(RAPLookAroundInitialCategoriesViewController *)self navigationItem];
  [v4 setTitle:v3];

  [(RAPLookAroundInitialCategoriesViewController *)self setAccessibilityIdentifier:@"LookAroundRAPView"];
}

- (void)_setupTableView
{
  v3 = [(RAPLookAroundInitialCategoriesViewController *)self tableView];
  [v3 setDataSource:self];

  v4 = [(RAPLookAroundInitialCategoriesViewController *)self tableView];
  uint64_t v5 = objc_opt_class();
  v6 = +[RAPLookAroundThumbnailTableViewCell reuseIdentifier];
  [v4 registerClass:v5 forCellReuseIdentifier:v6];

  v7 = [(RAPLookAroundInitialCategoriesViewController *)self tableView];
  uint64_t v8 = objc_opt_class();
  id v9 = +[MacRAPLookAroundImageCell reuseIdentifier];
  [v7 registerClass:v8 forCellReuseIdentifier:v9];

  id v10 = [(RAPLookAroundInitialCategoriesViewController *)self tableView];
  uint64_t v11 = objc_opt_class();
  v12 = +[RAPSingleLineTableViewCell reuseIdentifier];
  [v10 registerClass:v11 forCellReuseIdentifier:v12];

  v13 = [(RAPLookAroundInitialCategoriesViewController *)self tableView];
  uint64_t v14 = objc_opt_class();
  v15 = +[MacRapImageSingleLineCell reuseIdentifier];
  [v13 registerClass:v14 forCellReuseIdentifier:v15];

  v16 = [(RAPLookAroundInitialCategoriesViewController *)self tableView];
  [v16 _maps_initializeRAPAppearance];

  id v18 = +[UIColor systemBackgroundColor];
  objc_super v17 = [(RAPLookAroundInitialCategoriesViewController *)self tableView];
  [v17 setBackgroundColor:v18];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(RAPLookAroundInitialCategoriesViewController *)self traitCollection];
  if ([v3 userInterfaceIdiom] == (id)5) {
    int64_t v4 = 3;
  }
  else {
    int64_t v4 = 2;
  }

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v10 = [(RAPLookAroundQuestion *)self->_question privacyItems];
LABEL_9:
    v12 = v10;
    int64_t v11 = (int64_t)[v10 count];

    goto LABEL_10;
  }
  if (a4 == 1)
  {
    v7 = [(RAPLookAroundInitialCategoriesViewController *)self traitCollection];
    id v8 = [v7 userInterfaceIdiom];

    question = self->_question;
    if (v8 == (id)5) {
      [(RAPLookAroundQuestion *)question initialItemsMinusPrivacy];
    }
    else {
    id v10 = [(RAPLookAroundQuestion *)question initialItems];
    }
    goto LABEL_9;
  }
  int64_t v11 = 1;
LABEL_10:

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 section];
  if (v6 == (id)2)
  {
    uint64_t v14 = [(RAPLookAroundQuestion *)self->_question privacyItems];
    v13 = [v14 objectAtIndex:[v5 row]];

    v15 = [(RAPLookAroundInitialCategoriesViewController *)self tableView];
    v16 = +[MacRapImageSingleLineCell reuseIdentifier];
    int64_t v11 = [v15 dequeueReusableCellWithIdentifier:v16];

    objc_super v17 = [v13 localizedName];
    id v18 = [v11 textLabel];
    [v18 setText:v17];

    v19 = +[UIImage systemImageNamed:@"arrow.forward"];
    [v11 setImage:v19];
LABEL_16:

    goto LABEL_17;
  }
  if (v6 == (id)1)
  {
    v20 = [(RAPLookAroundInitialCategoriesViewController *)self traitCollection];
    id v21 = [v20 userInterfaceIdiom];
    question = self->_question;
    if (v21 == (id)5) {
      [(RAPLookAroundQuestion *)question initialItemsMinusPrivacy];
    }
    else {
    v13 = [(RAPLookAroundQuestion *)question initialItems];
    }

    v19 = [v13 objectAtIndex:[v5 row]];
    v23 = [(RAPLookAroundInitialCategoriesViewController *)self traitCollection];
    id v24 = [v23 userInterfaceIdiom];

    v25 = [(RAPLookAroundInitialCategoriesViewController *)self tableView];
    if (v24 == (id)5)
    {
      v26 = +[MacRapImageSingleLineCell reuseIdentifier];
      int64_t v11 = [v25 dequeueReusableCellWithIdentifier:v26];

      v27 = [v19 localizedName];
      v28 = [v11 textLabel];
      [v28 setText:v27];

      v29 = +[UIImage systemImageNamed:@"arrow.forward"];
      [v11 setImage:v29];
    }
    else
    {
      v30 = +[RAPSingleLineTableViewCell reuseIdentifier];
      int64_t v11 = [v25 dequeueReusableCellWithIdentifier:v30];

      [v11 setAccessoryType:1];
      v29 = [v19 localizedName];
      v31 = [v11 textLabel];
      [v31 setText:v29];
    }
    goto LABEL_15;
  }
  if (v6)
  {
    int64_t v11 = 0;
    goto LABEL_18;
  }
  v7 = [(RAPLookAroundInitialCategoriesViewController *)self traitCollection];
  id v8 = [v7 userInterfaceIdiom];

  id v9 = [(RAPLookAroundInitialCategoriesViewController *)self tableView];
  if (v8 != (id)5)
  {
    v32 = +[RAPLookAroundThumbnailTableViewCell reuseIdentifier];
    int64_t v11 = [v9 dequeueReusableCellWithIdentifier:v32];

    v33 = [(RAPLookAroundQuestion *)self->_question thumbnailImage];
    [v11 setThumbnailImage:v33];

    v13 = [(RAPReport *)self->_report _context];
    v19 = [v13 reportedLookAroundContext];
    v29 = [v19 reportedMuninViewState];
    [v11 setViewState:v29];
LABEL_15:

    goto LABEL_16;
  }
  id v10 = +[MacRAPLookAroundImageCell reuseIdentifier];
  int64_t v11 = [v9 dequeueReusableCellWithIdentifier:v10];

  v12 = [(RAPLookAroundQuestion *)self->_question thumbnailImage];
  [v11 setLookAroundImage:v12];

  v13 = +[UIColor systemBackgroundColor];
  [v11 setBackgroundColor:v13];
LABEL_17:

LABEL_18:
  v34 = [(RAPLookAroundInitialCategoriesViewController *)self traitCollection];
  id v35 = [v34 userInterfaceIdiom];

  if (v35 == (id)5)
  {
    v36 = +[UIColor systemBackgroundColor];
    [v11 setBackgroundColor:v36];
  }

  return v11;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [a4 section:a3] - 1 < (char *)2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a4;
  [a3 deselectRowAtIndexPath:v14 animated:1];
  id v6 = [v14 section];
  if (v6 == (id)2)
  {
    id v10 = [(RAPLookAroundQuestion *)self->_question privacyItems];
    int64_t v11 = [v10 objectAtIndex:[v14 row]];

    -[RAPLookAroundQuestion setSelectedQuestionType:](self->_question, "setSelectedQuestionType:", [v11 type]);
    -[RAPLookAroundInitialCategoriesViewController _captureUserAction:](self, "_captureUserAction:", [v11 analyticAction]);
    v12 = [[RAPLookAroundDetailsEditorViewController alloc] initWithReport:self->_report question:self->_question completion:self->_completion];
    v13 = [(RAPLookAroundInitialCategoriesViewController *)self navigationController];
    [v13 pushViewController:v12 animated:1];
  }
  else
  {
    if (v6 != (id)1) {
      goto LABEL_9;
    }
    v7 = [(RAPLookAroundInitialCategoriesViewController *)self traitCollection];
    id v8 = [v7 userInterfaceIdiom];
    question = self->_question;
    if (v8 == (id)5) {
      [(RAPLookAroundQuestion *)question initialItemsMinusPrivacy];
    }
    else {
    int64_t v11 = [(RAPLookAroundQuestion *)question initialItems];
    }

    [v11 objectAtIndex:[v14 row]];
    v12 = (RAPLookAroundDetailsEditorViewController *)objc_claimAutoreleasedReturnValue();
    [(RAPLookAroundInitialCategoriesViewController *)self _captureUserAction:[(RAPLookAroundDetailsEditorViewController *)v12 analyticAction]];
    [(RAPLookAroundInitialCategoriesViewController *)self didSelectCategoryOfType:[(RAPLookAroundDetailsEditorViewController *)v12 type]];
  }

LABEL_9:
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 2:
      id v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Privacy Concerns [LookAround RAP]";
      goto LABEL_7;
    case 1:
      id v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Feedback [Report a Problem]";
      goto LABEL_7;
    case 0:
      id v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Location [Report a Problem]";
LABEL_7:
      id v9 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];

      goto LABEL_9;
  }
  id v9 = &stru_101324E70;
LABEL_9:
  id v10 = [v5 _maps_groupedHeaderViewWithTitle:v9];

  return v10;
}

- (void)didSelectCategoryOfType:(unint64_t)a3
{
  [(RAPLookAroundQuestion *)self->_question setSelectedQuestionType:a3];
  if ((id)[(RAPLookAroundQuestion *)self->_question selectedQuestionType] == (id)3) {
    int64_t v4 = RAPLookAroundPrivacyCategoryViewController;
  }
  else {
    int64_t v4 = RAPLookAroundDetailsEditorViewController;
  }
  id v6 = [[v4 alloc] initWithReport:self->_report question:self->_question completion:self->_completion];
  id v5 = [(RAPLookAroundInitialCategoriesViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (int)analyticTarget
{
  return 1151;
}

- (void)_captureUserAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(RAPLookAroundInitialCategoriesViewController *)self analyticTarget];

  +[GEOAPPortal captureUserAction:v3 target:v4 value:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_question, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end