@interface MTEmailActivityItemProvider
- (MTEmailActivityItemProvider)initWithDataSource:(id)a3;
- (MTShareUtilDataSource)dataSource;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation MTEmailActivityItemProvider

- (MTEmailActivityItemProvider)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTEmailActivityItemProvider;
  v6 = [(MTEmailActivityItemProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = [(MTEmailActivityItemProvider *)self dataSource];
  v4 = +[MTShareUtilStringFactory bodyForShareEmailFromDataSource:v3];

  return v4;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  unsigned int v5 = [a4 isEqualToString:UIActivityTypeMail];
  v6 = [(MTEmailActivityItemProvider *)self dataSource];
  if (v5) {
    +[MTShareUtilStringFactory subjectForShareEmailFromDataSource:v6];
  }
  else {
  v7 = +[MTShareUtilStringFactory subjectForShareGenericFromDataSource:v6];
  }

  return v7;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:UIActivityTypeMail])
  {
    unsigned int v5 = [(MTEmailActivityItemProvider *)self dataSource];
    v6 = +[MTShareUtilStringFactory bodyForShareEmailFromDataSource:v5];
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