@interface NUExtensionURLHandler
- (NSExtensionContext)extensionContext;
- (NUExtensionURLHandler)initWithExtensionContext:(id)a3;
- (void)openURL:(id)a3;
- (void)openURL:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation NUExtensionURLHandler

- (NUExtensionURLHandler)initWithExtensionContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUExtensionURLHandler;
  v6 = [(NUExtensionURLHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_extensionContext, a3);
  }

  return v7;
}

- (void)openURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(NUExtensionURLHandler *)self extensionContext];
  [v9 openURL:v8 completionHandler:v7];
}

- (void)openURL:(id)a3
{
  id v4 = a3;
  id v5 = [(NUExtensionURLHandler *)self extensionContext];
  [v5 openURL:v4 completionHandler:0];
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void).cxx_destruct
{
}

@end