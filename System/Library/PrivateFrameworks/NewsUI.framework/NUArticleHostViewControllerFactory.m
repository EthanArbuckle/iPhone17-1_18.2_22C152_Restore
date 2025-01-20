@interface NUArticleHostViewControllerFactory
- (NUArticleContentSizeManager)contentSizeManager;
- (NUArticleHostViewControllerFactory)initWithArticleViewControllerFactory:(id)a3 settings:(id)a4 errorMessageFactory:(id)a5 contentSizeManager:(id)a6;
- (NUArticleViewControllerFactory)articleViewControllerFactory;
- (NUErrorMessageFactory)errorMessageFactory;
- (NUSettings)settings;
- (id)createArticleHostViewControllerForArticle:(id)a3;
@end

@implementation NUArticleHostViewControllerFactory

- (NUArticleHostViewControllerFactory)initWithArticleViewControllerFactory:(id)a3 settings:(id)a4 errorMessageFactory:(id)a5 contentSizeManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NUArticleHostViewControllerFactory;
  v15 = [(NUArticleHostViewControllerFactory *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_articleViewControllerFactory, a3);
    objc_storeStrong((id *)&v16->_settings, a4);
    objc_storeStrong((id *)&v16->_errorMessageFactory, a5);
    objc_storeStrong((id *)&v16->_contentSizeManager, a6);
  }

  return v16;
}

- (id)createArticleHostViewControllerForArticle:(id)a3
{
  id v4 = a3;
  v5 = [NUArticleHostViewController alloc];
  v6 = [(NUArticleHostViewControllerFactory *)self articleViewControllerFactory];
  v7 = [(NUArticleHostViewControllerFactory *)self settings];
  v8 = [(NUArticleHostViewControllerFactory *)self errorMessageFactory];
  v9 = [(NUArticleHostViewControllerFactory *)self contentSizeManager];
  v10 = [(NUArticleHostViewController *)v5 initWithArticle:v4 articleViewControllerFactory:v6 settings:v7 errorMessageFactory:v8 contentSizeManager:v9];

  return v10;
}

- (NUArticleViewControllerFactory)articleViewControllerFactory
{
  return self->_articleViewControllerFactory;
}

- (NUSettings)settings
{
  return self->_settings;
}

- (NUErrorMessageFactory)errorMessageFactory
{
  return self->_errorMessageFactory;
}

- (NUArticleContentSizeManager)contentSizeManager
{
  return self->_contentSizeManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSizeManager, 0);
  objc_storeStrong((id *)&self->_errorMessageFactory, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_articleViewControllerFactory, 0);
}

@end