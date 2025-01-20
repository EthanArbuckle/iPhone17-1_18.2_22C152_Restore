@interface REEpubPlugin
+ (id)associatedAssetType;
- (BKEngagementManager)engagementManager;
- (BKStoreController)storeController;
- (REEpubPlugin)initWithStoreController:(id)a3 engagementManager:(id)a4;
- (id)associatedAssetType;
- (id)helperForURL:(id)a3 withOptions:(id)a4;
- (id)newViewControllerForAEBookInfo:(id)a3 storeID:(id)a4;
- (void)prewarmSharedResourcesWithCompletion:(id)a3;
- (void)setEngagementManager:(id)a3;
- (void)setStoreController:(id)a3;
@end

@implementation REEpubPlugin

- (void)setStoreController:(id)a3
{
}

- (void)setEngagementManager:(id)a3
{
}

- (void)prewarmSharedResourcesWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = +[NSLocale preferredLanguages];
  id v9 = [v4 objectAtIndexedSubscript:0];

  if (v9
    && (+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:"),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = [v5 languageCode];
  }
  else
  {
    v7 = @"en";
  }
  v8 = +[BKFontCache sharedInstance];
  [v8 prewarmFontsForLanguage:v7 completion:v3];
}

- (REEpubPlugin)initWithStoreController:(id)a3 engagementManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)REEpubPlugin;
  v8 = [(REEpubPlugin *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    [(REEpubPlugin *)v8 setStoreController:v6];
    [(REEpubPlugin *)v9 setEngagementManager:v7];
  }

  return v9;
}

- (id)associatedAssetType
{
  return @"application/ePub";
}

+ (id)associatedAssetType
{
  return @"application/ePub";
}

- (id)newViewControllerForAEBookInfo:(id)a3 storeID:(id)a4
{
  id v5 = a3;
  id v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"REI.EnableFixedLayout"];

  if (v5
    && (![v5 isFixedLayout] || v7 && objc_msgSend(v5, "isFixedLayout"))
    && ([v5 dcTermsContributor],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 hasPrefix:@"iBooks Author"],
        v8,
        (v9 & 1) == 0))
  {
    v12 = +[BKAppDelegate sceneManager];
    v13 = [v12 currentSceneController];

    v14 = [v13 _mainViewControllerForModalPresenting];
    if (v14)
    {
      v15 = [[REBookReaderHostLayoutController alloc] initWithViewController:v14];
      v16 = [REBookReaderModuleHost alloc];
      v17 = +[AEAnnotationProvider sharedInstance];
      v18 = [(REEpubPlugin *)self storeController];
      v19 = [v5 styleManager];
      v20 = [(REEpubPlugin *)self engagementManager];
      v10 = [(REBookReaderModuleHost *)v16 initWithHostEnvironmentProvider:v15 book:v5 annotationProvider:v17 storeController:v18 styleManager:v19 engagementManager:v20];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)AEEPubBookHelper) initWithDelegate:self forURL:v5];

  return v6;
}

- (BKStoreController)storeController
{
  return self->_storeController;
}

- (BKEngagementManager)engagementManager
{
  return self->_engagementManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementManager, 0);

  objc_storeStrong((id *)&self->_storeController, 0);
}

@end