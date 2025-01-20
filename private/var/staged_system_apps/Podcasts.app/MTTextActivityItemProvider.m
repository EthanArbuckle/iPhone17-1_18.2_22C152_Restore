@interface MTTextActivityItemProvider
- (MTShareUtilDataSource)dataSource;
- (MTTextActivityItemProvider)initWithDataSource:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation MTTextActivityItemProvider

- (MTTextActivityItemProvider)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTTextActivityItemProvider;
  v6 = [(MTTextActivityItemProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = [(MTTextActivityItemProvider *)self dataSource];
  v4 = [v3 sharePodcastTitle];

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:UIActivityTypeSaveToNotes])
  {
    id v5 = [(MTTextActivityItemProvider *)self dataSource];
    v6 = +[MTShareUtilStringFactory textForShareToNotesFromDataSource:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MTShareUtilDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end