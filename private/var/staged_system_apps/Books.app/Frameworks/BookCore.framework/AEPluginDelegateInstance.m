@interface AEPluginDelegateInstance
- (AEPluginDelegateInstance)initWithDelegate:(id)a3 forURL:(id)a4;
- (BOOL)helperValidateBookAuthorizationWithError:(id *)a3 needsCoordination:(BOOL)a4;
- (id)annotationProviderWithCoordination:(BOOL)a3 forAssetID:(id)a4;
- (id)helperCoverImage;
- (id)helperCoverImageOfSize:(CGSize)a3;
- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4;
- (id)url;
- (void)dealloc;
- (void)helperDeletePersistentCache;
- (void)helperUpdateCachedURLTo:(id)a3;
- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4;
- (void)setMetadata:(id)a3 forKey:(id)a4;
@end

@implementation AEPluginDelegateInstance

- (AEPluginDelegateInstance)initWithDelegate:(id)a3 forURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(AEPluginDelegateInstance *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a4);
    objc_storeStrong((id *)&v10->_delegate, a3);
  }

  return v10;
}

- (void)dealloc
{
  delegate = self->_delegate;
  self->_delegate = 0;

  url = self->_url;
  self->_url = 0;

  v5.receiver = self;
  v5.super_class = (Class)AEPluginDelegateInstance;
  [(AEPluginDelegateInstance *)&v5 dealloc];
}

- (id)url
{
  return self->_url;
}

- (id)helperCoverImageOfSize:(CGSize)a3
{
  return -[AEInstanceDelegate helper:coverImageForURL:size:](self->_delegate, "helper:coverImageForURL:size:", a3.width, a3.height);
}

- (id)helperCoverImage
{
  return -[AEInstanceDelegate helper:coverImageForURL:](self->_delegate, "helper:coverImageForURL:");
}

- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4
{
  return -[AEInstanceDelegate helper:metadataForKey:forURL:needsCoordination:](self->_delegate, "helper:metadataForKey:forURL:needsCoordination:");
}

- (void)setMetadata:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(AEInstanceDelegate *)self->_delegate helper:self setMetadata:v7 forKey:v6 forURL:self->_url];
  }
}

- (void)helperDeletePersistentCache
{
}

- (void)helperUpdateCachedURLTo:(id)a3
{
}

- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4
{
}

- (id)annotationProviderWithCoordination:(BOOL)a3 forAssetID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(AEInstanceDelegate *)self->_delegate helper:self annotationProviderForURL:self->_url needsCoordination:v4 forAssetID:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)helperValidateBookAuthorizationWithError:(id *)a3 needsCoordination:(BOOL)a4
{
  return [(AEInstanceDelegate *)self->_delegate helper:self validateBookAuthorizationWithError:a3 needsCoordination:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end