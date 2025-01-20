@interface SXGalleryItemImageViewFactory
- (SWReachabilityProvider)reachabilityProvider;
- (SXGalleryItemImageViewFactory)initWithResourceDataSourceProvider:(id)a3 reachabilityProvider:(id)a4;
- (SXResourceDataSourceProvider)resourceDataSourceProvider;
- (id)imageViewForGalleryItem:(id)a3 imageResource:(id)a4;
@end

@implementation SXGalleryItemImageViewFactory

- (SXGalleryItemImageViewFactory)initWithResourceDataSourceProvider:(id)a3 reachabilityProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXGalleryItemImageViewFactory;
  v9 = [(SXGalleryItemImageViewFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceDataSourceProvider, a3);
    objc_storeStrong((id *)&v10->_reachabilityProvider, a4);
  }

  return v10;
}

- (id)imageViewForGalleryItem:(id)a3 imageResource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [SXGalleryItemImageView alloc];
  v9 = [(SXGalleryItemImageViewFactory *)self resourceDataSourceProvider];
  v10 = [v9 resourceDataSource];
  v11 = [(SXGalleryItemImageViewFactory *)self reachabilityProvider];
  objc_super v12 = [(SXGalleryItemImageView *)v8 initWithGalleryItem:v7 imageResource:v6 resourceDataSource:v10 reachabilityProvider:v11];

  return v12;
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