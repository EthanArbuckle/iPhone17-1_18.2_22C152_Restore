@interface THApplicationDelegate
+ (id)cacheDirectoryForAsset:(id)a3;
+ (id)contextDirectoryForAsset:(id)a3;
+ (id)documentDirectoryPath;
+ (void)ensureCacheDirectory:(id)a3;
+ (void)ensureContextDirectoryExists:(id)a3;
+ (void)p_upgradeContextDirectoryForAsset:(id)a3 newPath:(id)a4;
+ (void)setupSurrogateDelegate;
- (BCExternalURLOpenPrompter)externalURLLoadPrompter;
- (BCExternalURLOpenPrompter)externalURLOpenPrompter;
- (BOOL)_maybeOpenExternalURL:(id)a3 sourceDocumentRoot:(id)a4;
- (BOOL)openURL:(id)a3 sourceDocumentRoot:(id)a4;
- (BOOL)shouldAuthorizeURLToLoad:(id)a3 loadContext:(id)a4 completion:(id)a5;
- (Class)documentRootClass;
- (NSMutableDictionary)bookDescriptionCache;
- (THApplicationDelegate)init;
- (id)applicationName;
- (id)cachedBookDescriptionForURL:(id)a3;
- (id)createCompatibilityDelegate;
- (id)descriptionForURL:(id)a3;
- (id)nativeDocumentType;
- (id)templateDocumentType;
- (id)urlSchemesNotRequiringUserPrompt;
- (id)validStoreURLSchemes;
- (id)validURLSchemes;
- (void)cacheBookDescription:(id)a3 forURL:(id)a4;
- (void)clearBookDescriptionCache;
- (void)dealloc;
- (void)presentAlertController:(id)a3 promptContext:(id)a4;
- (void)setBookDescriptionCache:(id)a3;
- (void)setExternalURLLoadPrompter:(id)a3;
- (void)setExternalURLOpenPrompter:(id)a3;
- (void)uncacheBookDescriptionForURL:(id)a3;
@end

@implementation THApplicationDelegate

+ (void)setupSurrogateDelegate
{
  if (qword_573318 != -1) {
    dispatch_once(&qword_573318, &stru_45A6E8);
  }
}

+ (id)documentDirectoryPath
{
  return +[UIApplication applicationDocumentsDirectory];
}

- (id)createCompatibilityDelegate
{
  return 0;
}

+ (id)contextDirectoryForAsset:(id)a3
{
  id v5 = +[UIApplication contextDirectoryForAssetWithID:](UIApplication, "contextDirectoryForAssetWithID:", [a3 assetID]);
  [a1 p_upgradeContextDirectoryForAsset:a3 newPath:v5];
  return v5;
}

+ (void)ensureContextDirectoryExists:(id)a3
{
  id v3 = [a1 contextDirectoryForAsset:a3];
  v4 = +[NSFileManager defaultManager];
  if (![(NSFileManager *)v4 fileExistsAtPath:v3])
  {
    id v8 = 0;
    if (![(NSFileManager *)v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v8])
    {
      id v5 = +[TSUAssertionHandler currentHandler];
      v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THApplicationDelegate ensureContextDirectoryExists:]");
      v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THApplicationDelegate.m"];
      [v5 handleFailureInFunction:v6, v7, 88, @"ensureContextDirectoryExists error: %@", [v8 description]];
    }
  }
}

+ (id)cacheDirectoryForAsset:(id)a3
{
  id v4 = +[UIApplication applicationCacheDirectory];
  id v5 = [a3 assetID];

  return [v4 stringByAppendingPathComponent:v5];
}

+ (void)ensureCacheDirectory:(id)a3
{
  id v3 = [a1 cacheDirectoryForAsset:a3];
  id v4 = +[NSFileManager defaultManager];
  if (![(NSFileManager *)v4 fileExistsAtPath:v3])
  {
    id v8 = 0;
    if (![(NSFileManager *)v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v8])
    {
      id v5 = +[TSUAssertionHandler currentHandler];
      v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THApplicationDelegate ensureCacheDirectory:]");
      v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THApplicationDelegate.m"];
      [v5 handleFailureInFunction:v6, v7, 107, @"ensureCacheDirectory error: %@", [v8 description]];
    }
  }
}

+ (void)p_upgradeContextDirectoryForAsset:(id)a3 newPath:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1A8268;
  v4[3] = &unk_456E38;
  v4[4] = a3;
  v4[5] = a4;
  if (qword_573320 != -1) {
    dispatch_once(&qword_573320, v4);
  }
}

- (THApplicationDelegate)init
{
  v4.receiver = self;
  v4.super_class = (Class)THApplicationDelegate;
  v2 = [(THApplicationDelegate *)&v4 init];
  if (v2) {
    v2->_bookDescriptionCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THApplicationDelegate;
  [(THApplicationDelegate *)&v3 dealloc];
}

- (id)applicationName
{
  return @"Thunderfish";
}

- (Class)documentRootClass
{
  return (Class)objc_opt_class();
}

- (id)nativeDocumentType
{
  return @"com.apple.ibooks";
}

- (id)templateDocumentType
{
  return 0;
}

- (id)validURLSchemes
{
  if (qword_573330 != -1) {
    dispatch_once(&qword_573330, &stru_45A708);
  }
  objc_super v3 = (void *)qword_573328;
  id v4 = [(THApplicationDelegate *)self validStoreURLSchemes];

  return [v3 setByAddingObjectsFromSet:v4];
}

- (id)validStoreURLSchemes
{
  if (qword_573340 != -1) {
    dispatch_once(&qword_573340, &stru_45A728);
  }
  return (id)qword_573338;
}

- (BOOL)openURL:(id)a3 sourceDocumentRoot:(id)a4
{
  id v5 = (NSURL *)a3;
  if (![+[UIApplication sharedApplication] canOpenURL:a3]&& [[(NSString *)[(NSURL *)v5 scheme] lowercaseString] isEqualToString:@"itms-itunesu"])
  {
    id v5 = +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString stringWithFormat:@"http:%@", [(NSURL *)v5 resourceSpecifier]]);
  }

  return [(THApplicationDelegate *)self _maybeOpenExternalURL:v5 sourceDocumentRoot:a4];
}

- (id)descriptionForURL:(id)a3
{
  objc_sync_enter(self);
  objc_opt_class();
  [(NSMutableDictionary *)[(THApplicationDelegate *)self bookDescriptionCache] objectForKey:a3];
  id v5 = (THBookDescription *)TSUDynamicCast();
  if (!v5)
  {
    if (THIsApplePubAtPath([a3 path]))
    {
      [(THApplicationDelegate *)self clearBookDescriptionCache];
      id v5 = +[THBookDescription descriptionWithURL:a3];
      if (v5) {
        [(THApplicationDelegate *)self cacheBookDescription:v5 forURL:a3];
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  objc_sync_exit(self);
  return v5;
}

- (id)cachedBookDescriptionForURL:(id)a3
{
  id v4 = [(THApplicationDelegate *)self bookDescriptionCache];

  return [(NSMutableDictionary *)v4 objectForKey:a3];
}

- (void)cacheBookDescription:(id)a3 forURL:(id)a4
{
  v6 = [(THApplicationDelegate *)self bookDescriptionCache];

  [(NSMutableDictionary *)v6 setObject:a3 forKey:a4];
}

- (void)uncacheBookDescriptionForURL:(id)a3
{
  id v4 = [(THApplicationDelegate *)self bookDescriptionCache];

  [(NSMutableDictionary *)v4 removeObjectForKey:a3];
}

- (void)clearBookDescriptionCache
{
  v2 = [(THApplicationDelegate *)self bookDescriptionCache];

  [(NSMutableDictionary *)v2 removeAllObjects];
}

- (BOOL)_maybeOpenExternalURL:(id)a3 sourceDocumentRoot:(id)a4
{
  if (objc_msgSend(-[THApplicationDelegate urlSchemesNotRequiringUserPrompt](self, "urlSchemesNotRequiringUserPrompt"), "containsObject:", objc_msgSend(a3, "scheme")))
  {
    v11.receiver = self;
    v11.super_class = (Class)THApplicationDelegate;
    return [(THApplicationDelegate *)&v11 openURL:a3 sourceDocumentRoot:a4];
  }
  else
  {
    id v8 = [a4 viewController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1A8960;
    v10[3] = &unk_45A750;
    v10[4] = a3;
    v10[5] = a4;
    v10[6] = self;
    BOOL v7 = 1;
    [(BCExternalURLOpenPrompter *)[(THApplicationDelegate *)self externalURLOpenPrompter] maybePromptUserBeforeOpeningExternalURL:a3 shouldThrottle:1 promptContext:v8 completion:v10];
  }
  return v7;
}

- (id)urlSchemesNotRequiringUserPrompt
{
  if (qword_573350 != -1) {
    dispatch_once(&qword_573350, &stru_45A770);
  }
  return (id)qword_573348;
}

- (BOOL)shouldAuthorizeURLToLoad:(id)a3 loadContext:(id)a4 completion:(id)a5
{
  if ([self urlSchemesNotRequiringUserPrompt] containsObject:[a3 scheme])return 1; {
  v10 = [(THApplicationDelegate *)self externalURLLoadPrompter];
  }

  return [(BCExternalURLOpenPrompter *)v10 maybePromptUserBeforeOpeningExternalURL:a3 shouldThrottle:0 promptContext:a4 completion:a5];
}

- (BCExternalURLOpenPrompter)externalURLOpenPrompter
{
  result = self->_externalURLOpenPrompter;
  if (!result)
  {
    self->_externalURLOpenPrompter = (BCExternalURLOpenPrompter *)objc_alloc_init((Class)BCExternalURLOpenPrompter);
    -[BCExternalURLOpenPrompter setPromptTitle:](self->_externalURLOpenPrompter, "setPromptTitle:", [(id)THBundle() localizedStringForKey:@"Leave Books and open this link?" value:&stru_46D7E8 table:0]);
    -[BCExternalURLOpenPrompter setCancelButtonTitle:](self->_externalURLOpenPrompter, "setCancelButtonTitle:", [(id)THBundle() localizedStringForKey:@"Cancel" value:&stru_46D7E8 table:0]);
    -[BCExternalURLOpenPrompter setOkButtonTitle:](self->_externalURLOpenPrompter, "setOkButtonTitle:", [(id)THBundle() localizedStringForKey:@"Open" value:&stru_46D7E8 table:0]);
    [(BCExternalURLOpenPrompter *)self->_externalURLOpenPrompter setDelegate:self];
    return self->_externalURLOpenPrompter;
  }
  return result;
}

- (BCExternalURLOpenPrompter)externalURLLoadPrompter
{
  result = self->_externalURLLoadPrompter;
  if (!result)
  {
    self->_externalURLLoadPrompter = (BCExternalURLOpenPrompter *)objc_alloc_init((Class)BCExternalURLOpenPrompter);
    -[BCExternalURLOpenPrompter setPromptTitle:](self->_externalURLLoadPrompter, "setPromptTitle:", [(id)THBundle() localizedStringForKey:@"Allow Online Content?" value:&stru_46D7E8 table:0]);
    -[BCExternalURLOpenPrompter setPromptMessage:](self->_externalURLLoadPrompter, "setPromptMessage:", [(id)THBundle() localizedStringForKey:@"This book needs to access online content, or it may not display as the publisher intended.", &stru_46D7E8, 0 value table]);
    -[BCExternalURLOpenPrompter setCancelButtonTitle:](self->_externalURLLoadPrompter, "setCancelButtonTitle:", [(id)THBundle() localizedStringForKey:@"Don\\U2019t Allow" value:&stru_46D7E8 table:0]);
    -[BCExternalURLOpenPrompter setOkButtonTitle:](self->_externalURLLoadPrompter, "setOkButtonTitle:", [(id)THBundle() localizedStringForKey:@"Allow" value:&stru_46D7E8 table:0]);
    [(BCExternalURLOpenPrompter *)self->_externalURLLoadPrompter setCacheResponses:0];
    [(BCExternalURLOpenPrompter *)self->_externalURLLoadPrompter setDelegate:self];
    return self->_externalURLLoadPrompter;
  }
  return result;
}

- (void)presentAlertController:(id)a3 promptContext:(id)a4
{
  BOOL v5 = +[UIView areAnimationsEnabled];
  objc_opt_class();
  v6 = (void *)TSUDynamicCast();
  if (v6)
  {
    [v6 presentViewController:a3 animated:v5 completion:0];
  }
  else
  {
    id v7 = +[AEAssetEngine appInfoMgr];
    [v7 presentViewControllerOverMainCanvas:a3 animated:v5 completion:0];
  }
}

- (NSMutableDictionary)bookDescriptionCache
{
  return self->_bookDescriptionCache;
}

- (void)setBookDescriptionCache:(id)a3
{
}

- (void)setExternalURLOpenPrompter:(id)a3
{
}

- (void)setExternalURLLoadPrompter:(id)a3
{
}

@end