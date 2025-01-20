@interface MTAirDropActivityItemSource
- (MTAirDropActivityItemSource)initWithDataSource:(id)a3;
- (MTShareUtilDataSource)dataSource;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation MTAirDropActivityItemSource

- (MTAirDropActivityItemSource)initWithDataSource:(id)a3
{
  id v4 = a3;
  v5 = [(MTAirDropActivityItemSource *)self init];
  v6 = v5;
  if (v5) {
    [(MTAirDropActivityItemSource *)v5 setDataSource:v4];
  }

  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = [(MTAirDropActivityItemSource *)self dataSource];
  id v4 = [v3 shareURL];

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:UIActivityTypeAirDrop])
  {
    v5 = [(MTAirDropActivityItemSource *)self dataSource];
    v6 = [v5 shareURL];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  if (objc_msgSend(a4, "isEqualToString:", UIActivityTypeAirDrop, a5.width, a5.height))
  {
    v6 = [(MTAirDropActivityItemSource *)self dataSource];
    v7 = [v6 shareImage];
  }
  else
  {
    v7 = 0;
  }

  return v7;
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