@interface WBSPrivateBrowsingUserDefinedContentBlockerManager
- (BOOL)hasContentBlockerWithActions;
- (WBSUserDefinedContentBlockerManager)normalBrowsingUserDefinedContentBlockerManager;
- (id)cachedGlobalContentBlockerActions;
- (void)_setCachedGlobalContentBlockerActions:(id)a3;
- (void)getGlobalContentBlockerWithCompletionHandler:(id)a3;
- (void)globalContentBlockerWithCompletionHandler:(id)a3;
- (void)setNormalBrowsingUserDefinedContentBlockerManager:(id)a3;
@end

@implementation WBSPrivateBrowsingUserDefinedContentBlockerManager

- (void)setNormalBrowsingUserDefinedContentBlockerManager:(id)a3
{
}

- (BOOL)hasContentBlockerWithActions
{
  v6.receiver = self;
  v6.super_class = (Class)WBSPrivateBrowsingUserDefinedContentBlockerManager;
  if ([(WBSUserDefinedContentBlockerManager *)&v6 hasContentBlockerWithActions]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_normalBrowsingUserDefinedContentBlockerManager);
  char v3 = [WeakRetained hasContentBlockerWithActions];

  return v3;
}

- (void)globalContentBlockerWithCompletionHandler:(id)a3
{
  p_normalBrowsingUserDefinedContentBlockerManager = &self->_normalBrowsingUserDefinedContentBlockerManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_normalBrowsingUserDefinedContentBlockerManager);
  [WeakRetained globalContentBlockerWithCompletionHandler:v4];
}

- (id)cachedGlobalContentBlockerActions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_normalBrowsingUserDefinedContentBlockerManager);
  char v3 = [WeakRetained cachedGlobalContentBlockerActions];

  return v3;
}

- (void)_setCachedGlobalContentBlockerActions:(id)a3
{
  char v3 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[WBSPrivateBrowsingUserDefinedContentBlockerManager _setCachedGlobalContentBlockerActions:]();
  }
}

- (void)getGlobalContentBlockerWithCompletionHandler:(id)a3
{
  p_normalBrowsingUserDefinedContentBlockerManager = &self->_normalBrowsingUserDefinedContentBlockerManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_normalBrowsingUserDefinedContentBlockerManager);
  [WeakRetained getGlobalContentBlockerWithCompletionHandler:v4];
}

- (WBSUserDefinedContentBlockerManager)normalBrowsingUserDefinedContentBlockerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_normalBrowsingUserDefinedContentBlockerManager);
  return (WBSUserDefinedContentBlockerManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)_setCachedGlobalContentBlockerActions:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to cache global content blocker into Private Manager.", v2, v3, v4, v5, v6);
}

@end