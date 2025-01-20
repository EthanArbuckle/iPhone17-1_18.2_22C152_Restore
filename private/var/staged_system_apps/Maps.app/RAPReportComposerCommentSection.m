@interface RAPReportComposerCommentSection
- (RAPCommentPartHeaderView)headerView;
- (RAPReportComposerCommentSection)initWithQuestion:(id)a3;
- (id)cellForRowAtIndex:(int64_t)a3;
- (int64_t)rowsCount;
- (void)beginEditingCommentIfPossible;
- (void)registerReuseIdentifiersForCells;
- (void)setHeaderView:(id)a3;
@end

@implementation RAPReportComposerCommentSection

- (RAPCommentPartHeaderView)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = [[RAPCommentPartHeaderView alloc] initWithQuestion:self->_question reuseIdentifier:@"RAPCommentPartHeaderView"];
    v5 = self->_headerView;
    self->_headerView = v4;

    headerView = self->_headerView;
  }

  return headerView;
}

- (RAPReportComposerCommentSection)initWithQuestion:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RAPReportComposerCommentSection;
  v6 = [(RAPTablePartSection *)&v10 init];
  v7 = v6;
  if (v6)
  {
    p_question = (id *)&v6->_question;
    objc_storeStrong((id *)&v6->_question, a3);
    if (objc_opt_respondsToSelector()) {
      [*p_question addObserver:v7 changeHandler:&stru_101316CB0];
    }
  }

  return v7;
}

- (int64_t)rowsCount
{
  return 1;
}

- (void)registerReuseIdentifiersForCells
{
  uint64_t v3 = objc_opt_class();

  [(RAPTablePartSection *)self registerClass:v3 forNamespacedReuseIdentifier:@"TextViewCell"];
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  v4 = [(RAPTablePartSection *)self tableView];
  [v4 setKeyboardDismissMode:1];

  id v5 = [(RAPTablePartSection *)self dequeueCellWithNamespacedReuseIdentifier:@"TextViewCell"];
  [v5 setPropertiesFromQuestion:self->_question];
  v6 = self->_question;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100ACEAA4;
  v9[3] = &unk_1012E78C8;
  objc_super v10 = v6;
  v7 = v6;
  [v5 setTextDidChange:v9];

  return v5;
}

- (void)beginEditingCommentIfPossible
{
  uint64_t v3 = +[NSIndexPath indexPathForRow:0 inSection:[(RAPTablePartSection *)self sectionIndex]];
  v4 = [(RAPTablePartSection *)self tableView];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100ACEBDC;
  v8[3] = &unk_1012E5D58;
  v8[4] = self;
  id v9 = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100ACEC38;
  v6[3] = &unk_1012E6160;
  v6[4] = self;
  id v7 = v9;
  id v5 = v9;
  [v4 _performBatchUpdates:v8 completion:v6];
}

- (void)setHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end