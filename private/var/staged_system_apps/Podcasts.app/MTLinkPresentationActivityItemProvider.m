@interface MTLinkPresentationActivityItemProvider
- (MTLinkPresentationActivityItemProvider)initWithDataSource:(id)a3;
- (MTShareUtilDataSource)dataSource;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation MTLinkPresentationActivityItemProvider

- (MTLinkPresentationActivityItemProvider)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTLinkPresentationActivityItemProvider;
  v6 = [(MTLinkPresentationActivityItemProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  v3 = [(MTLinkPresentationActivityItemProvider *)self dataSource];
  v4 = +[MTLinkPresentationMetadataUtil linkMetadataForDataSource:v3];

  return v4;
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