@interface SDAirDropActivity
+ (int64_t)activityCategory;
- (BOOL)_allowsAutoCancelOnDismiss;
- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming;
- (BOOL)ss_shouldExecuteInShareSheet;
- (CGSize)_thumbnailSize;
- (NSMutableArray)activeSecurityContexts;
- (NSString)sendingAppBundleID;
- (SDAirDropActivity)init;
- (id)activityType;
- (void)dealloc;
- (void)prepareWithActivityItemData:(id)a3;
- (void)setActiveSecurityContexts:(id)a3;
- (void)setSendingAppBundleID:(id)a3;
- (void)startAccessingSecurityScopedResourcesInContext:(id)a3;
- (void)stopAccessingSecurityScopedResources;
@end

@implementation SDAirDropActivity

- (SDAirDropActivity)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDAirDropActivity;
  v2 = [(SDAirDropActivity *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    activeSecurityContexts = v2->_activeSecurityContexts;
    v2->_activeSecurityContexts = (NSMutableArray *)v3;
  }
  return v2;
}

- (BOOL)ss_shouldExecuteInShareSheet
{
  return 1;
}

- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming
{
  return 0;
}

- (id)activityType
{
  return UIActivityTypeAirDrop;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (CGSize)_thumbnailSize
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  SFSuggestedAirDropThumbnailSize();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

- (void)prepareWithActivityItemData:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = [a3 securityContexts];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SDAirDropActivity *)self startAccessingSecurityScopedResourcesInContext:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)startAccessingSecurityScopedResourcesInContext:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 activate];
    [(NSMutableArray *)self->_activeSecurityContexts addObject:v4];
  }
}

- (void)stopAccessingSecurityScopedResources
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = self->_activeSecurityContexts;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) deactivate:v8];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_activeSecurityContexts removeAllObjects];
}

- (void)dealloc
{
  [(SDAirDropActivity *)self stopAccessingSecurityScopedResources];
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropActivity;
  [(SDAirDropActivity *)&v3 dealloc];
}

- (NSString)sendingAppBundleID
{
  return self->_sendingAppBundleID;
}

- (void)setSendingAppBundleID:(id)a3
{
}

- (NSMutableArray)activeSecurityContexts
{
  return self->_activeSecurityContexts;
}

- (void)setActiveSecurityContexts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSecurityContexts, 0);

  objc_storeStrong((id *)&self->_sendingAppBundleID, 0);
}

@end