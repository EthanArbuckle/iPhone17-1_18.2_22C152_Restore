@interface RAPReportComposerCommentViewController
- (RAPReportComposerCommentTableViewCell)rapReportComposerCommentTableViewCell;
- (RAPReportComposerCommentViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (id)tableParts;
- (int)analyticTarget;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation RAPReportComposerCommentViewController

- (RAPReportComposerCommentViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerCommentViewController;
  v10 = [(RAPReportTableViewController *)&v15 initWithReport:a3 question:v9 completion:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = [(RAPReportTableViewController *)v11 sendButtonItem];
    v13 = [(RAPReportComposerCommentViewController *)v11 navigationItem];
    [v13 setRightBarButtonItem:v12];
  }
  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RAPReportComposerCommentViewController;
  [(RAPReportComposerCommentViewController *)&v5 viewDidAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"RAPReportComposerCommentViewControllerDidAppearNotification" object:self];
}

- (int)analyticTarget
{
  return 1135;
}

- (RAPReportComposerCommentTableViewCell)rapReportComposerCommentTableViewCell
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(RAPReportComposerCommentViewController *)self tableView];
  v3 = [v2 visibleCells];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (RAPReportComposerCommentTableViewCell *)v4;
}

- (id)tableParts
{
  if (!self->_commentPart)
  {
    v3 = [RAPReportComposerCommentPart alloc];
    id v4 = [(RAPCommentQuestionProtocol *)self->_question commentQuestion];
    uint64_t v5 = [(RAPReportComposerCommentPart *)v3 initWithCommentQuestion:v4];
    commentPart = self->_commentPart;
    self->_commentPart = v5;
  }
  if (MapsFeature_IsEnabled_RAPCommunityID())
  {
    if ([(RAPCommentQuestionProtocol *)self->_question isAnonymous])
    {
      objc_super v15 = self->_commentPart;
      v7 = +[NSArray arrayWithObjects:&v15 count:1];
      goto LABEL_9;
    }
    v8 = [(RAPReportTableViewController *)self userInfoPart];
    long long v11 = self->_commentPart;
    v16[0] = v8;
    v16[1] = v11;
    long long v10 = (void **)v16;
  }
  else
  {
    v8 = [(RAPReportTableViewController *)self userInfoPart];
    long long v9 = self->_commentPart;
    v13 = v8;
    v14 = v9;
    long long v10 = &v13;
  }
  v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2, v13, v14);

LABEL_9:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentPart, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end