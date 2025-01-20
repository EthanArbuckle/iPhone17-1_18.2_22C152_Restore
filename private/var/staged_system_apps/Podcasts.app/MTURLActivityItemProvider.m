@interface MTURLActivityItemProvider
- (MTShareUtilDataSource)dataSource;
- (MTURLActivityItemProvider)initWithDataSource:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation MTURLActivityItemProvider

- (MTURLActivityItemProvider)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTURLActivityItemProvider;
  v6 = [(MTURLActivityItemProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = [(MTURLActivityItemProvider *)self dataSource];
  v4 = [v3 shareURL];

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:UIActivityTypeMail])
  {
    id v5 = 0;
  }
  else
  {
    v6 = [(MTURLActivityItemProvider *)self dataSource];
    id v5 = [v6 shareURL];
  }

  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  id v5 = [(MTURLActivityItemProvider *)self dataSource];
  v6 = [v5 shareImage];

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