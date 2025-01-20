@interface SXImageViewFactory
- (SWReachabilityProvider)reachabilityProvider;
- (SXImageViewFactory)initWithResourceDataSourceProvider:(id)a3 reachabilityProvider:(id)a4;
- (SXResourceDataSourceProvider)resourceDataSourceProvider;
- (id)imageViewForResource:(id)a3;
- (id)repeatableImageViewForResource:(id)a3;
@end

@implementation SXImageViewFactory

- (SXImageViewFactory)initWithResourceDataSourceProvider:(id)a3 reachabilityProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXImageViewFactory;
  v9 = [(SXImageViewFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceDataSourceProvider, a3);
    objc_storeStrong((id *)&v10->_reachabilityProvider, a4);
  }

  return v10;
}

- (id)imageViewForResource:(id)a3
{
  id v4 = a3;
  v5 = [SXImageView alloc];
  v6 = [(SXImageViewFactory *)self resourceDataSourceProvider];
  id v7 = [v6 resourceDataSource];
  id v8 = [(SXImageViewFactory *)self reachabilityProvider];
  v9 = [(SXImageView *)v5 initWithImageResource:v4 resourceDataSource:v7 reachabilityProvider:v8];

  return v9;
}

- (id)repeatableImageViewForResource:(id)a3
{
  id v4 = a3;
  v5 = [SXRepeatableImageView alloc];
  v6 = [(SXImageViewFactory *)self resourceDataSourceProvider];
  id v7 = [v6 resourceDataSource];
  id v8 = [(SXImageViewFactory *)self reachabilityProvider];
  v9 = [(SXImageView *)v5 initWithImageResource:v4 resourceDataSource:v7 reachabilityProvider:v8];

  return v9;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
}

@end