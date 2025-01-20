@interface APWebViewConfiguration
- (APUnfairLock)videoConfigurationLock;
- (APUnfairLock)videoConfigurationWithBackgroundPriorityLock;
- (APUnfairLock)webProcessConfigurationLock;
- (APUnfairLock)webProcessConfigurationWithBackgroundPriorityLock;
- (APWebViewConfiguration)init;
- (WKWebViewConfiguration)videoConfiguration;
- (WKWebViewConfiguration)videoConfigurationWithBackgroundPriority;
- (WKWebViewConfiguration)webProcessConfiguration;
- (WKWebViewConfiguration)webProcessConfigurationWithBackgroundPriority;
- (id)_injectionScriptForResource:(id)a3 injectionTime:(int64_t)a4;
- (id)_injectionStyleForResource:(id)a3;
- (id)_newProcessPoolWithBackgroundPriority:(BOOL)a3;
- (id)_newSharedConfigurationWithBackgroundPriority:(BOOL)a3;
@end

@implementation APWebViewConfiguration

- (APWebViewConfiguration)init
{
  v28.receiver = self;
  v28.super_class = (Class)APWebViewConfiguration;
  v2 = [(APWebViewConfiguration *)&v28 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F20B90]);
    uint64_t v7 = objc_msgSend_initWithOptions_(v3, v4, 1, v5, v6);
    webProcessConfigurationLock = v2->_webProcessConfigurationLock;
    v2->_webProcessConfigurationLock = (APUnfairLock *)v7;

    id v9 = objc_alloc(MEMORY[0x263F20B90]);
    uint64_t v13 = objc_msgSend_initWithOptions_(v9, v10, 1, v11, v12);
    webProcessConfigurationWithBackgroundPriorityLock = v2->_webProcessConfigurationWithBackgroundPriorityLock;
    v2->_webProcessConfigurationWithBackgroundPriorityLock = (APUnfairLock *)v13;

    id v15 = objc_alloc(MEMORY[0x263F20B90]);
    uint64_t v19 = objc_msgSend_initWithOptions_(v15, v16, 1, v17, v18);
    videoConfigurationLock = v2->_videoConfigurationLock;
    v2->_videoConfigurationLock = (APUnfairLock *)v19;

    id v21 = objc_alloc(MEMORY[0x263F20B90]);
    uint64_t v25 = objc_msgSend_initWithOptions_(v21, v22, 1, v23, v24);
    videoConfigurationWithBackgroundPriorityLock = v2->_videoConfigurationWithBackgroundPriorityLock;
    v2->_videoConfigurationWithBackgroundPriorityLock = (APUnfairLock *)v25;
  }
  return v2;
}

- (WKWebViewConfiguration)webProcessConfiguration
{
  uint64_t v6 = objc_msgSend_webProcessConfigurationLock(self, a2, v2, v3, v4);
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  if (!self->_webProcessConfiguration)
  {
    id v15 = (WKWebViewConfiguration *)objc_msgSend__newSharedConfigurationWithBackgroundPriority_(self, v11, 0, v13, v14);
    webProcessConfiguration = self->_webProcessConfiguration;
    self->_webProcessConfiguration = v15;
  }
  uint64_t v17 = objc_msgSend_webProcessConfigurationLock(self, v11, v12, v13, v14);
  objc_msgSend_unlock(v17, v18, v19, v20, v21);

  v22 = self->_webProcessConfiguration;

  return v22;
}

- (WKWebViewConfiguration)webProcessConfigurationWithBackgroundPriority
{
  uint64_t v6 = objc_msgSend_webProcessConfigurationWithBackgroundPriorityLock(self, a2, v2, v3, v4);
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  if (!self->_webProcessConfigurationWithBackgroundPriority)
  {
    id v15 = (WKWebViewConfiguration *)objc_msgSend__newSharedConfigurationWithBackgroundPriority_(self, v11, 1, v13, v14);
    webProcessConfigurationWithBackgroundPriority = self->_webProcessConfigurationWithBackgroundPriority;
    self->_webProcessConfigurationWithBackgroundPriority = v15;
  }
  uint64_t v17 = objc_msgSend_webProcessConfigurationWithBackgroundPriorityLock(self, v11, v12, v13, v14);
  objc_msgSend_unlock(v17, v18, v19, v20, v21);

  v22 = self->_webProcessConfigurationWithBackgroundPriority;

  return v22;
}

- (WKWebViewConfiguration)videoConfiguration
{
  uint64_t v6 = objc_msgSend_videoConfigurationLock(self, a2, v2, v3, v4);
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  if (!self->_videoConfiguration)
  {
    id v15 = (WKWebViewConfiguration *)objc_msgSend__newSharedConfigurationWithBackgroundPriority_(self, v11, 0, v13, v14);
    videoConfiguration = self->_videoConfiguration;
    self->_videoConfiguration = v15;
  }
  uint64_t v17 = objc_msgSend_videoConfigurationLock(self, v11, v12, v13, v14);
  objc_msgSend_unlock(v17, v18, v19, v20, v21);

  v22 = self->_videoConfiguration;

  return v22;
}

- (WKWebViewConfiguration)videoConfigurationWithBackgroundPriority
{
  uint64_t v6 = objc_msgSend_videoConfigurationWithBackgroundPriorityLock(self, a2, v2, v3, v4);
  objc_msgSend_lock(v6, v7, v8, v9, v10);

  if (!self->_videoConfigurationWithBackgroundPriority)
  {
    id v15 = (WKWebViewConfiguration *)objc_msgSend__newSharedConfigurationWithBackgroundPriority_(self, v11, 1, v13, v14);
    videoConfigurationWithBackgroundPriority = self->_videoConfigurationWithBackgroundPriority;
    self->_videoConfigurationWithBackgroundPriority = v15;
  }
  uint64_t v17 = objc_msgSend_videoConfigurationWithBackgroundPriorityLock(self, v11, v12, v13, v14);
  objc_msgSend_unlock(v17, v18, v19, v20, v21);

  v22 = self->_videoConfigurationWithBackgroundPriority;

  return v22;
}

- (id)_newSharedConfigurationWithBackgroundPriority:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F1FA60]);
  objc_msgSend_setAllowsInlineMediaPlayback_(v5, v6, 1, v7, v8);
  objc_msgSend_setMediaTypesRequiringUserActionForPlayback_(v5, v9, 0, v10, v11);
  id v15 = objc_msgSend_stringWithFormat_(NSString, v12, @"connect-src https: %@: %@: %@: %@:", v13, v14, @"pc-video-https", @"pc-video-http", @"pc-x-tag-https", @"pc-x-tag-http");
  objc_msgSend__setOverrideContentSecurityPolicy_(v5, v16, (uint64_t)v15, v17, v18);
  uint64_t v23 = objc_msgSend_nonPersistentDataStore(MEMORY[0x263F1FA68], v19, v20, v21, v22);
  objc_msgSend_setWebsiteDataStore_(v5, v24, (uint64_t)v23, v25, v26);

  id v27 = objc_alloc_init(MEMORY[0x263F1FA38]);
  v30 = objc_msgSend__injectionScriptForResource_injectionTime_(self, v28, @"APInjectionScript", 0, v29);
  objc_msgSend_addUserScript_(v27, v31, (uint64_t)v30, v32, v33);

  v36 = objc_msgSend__injectionScriptForResource_injectionTime_(self, v34, @"APViewportElementScript", 1, v35);
  objc_msgSend_addUserScript_(v27, v37, (uint64_t)v36, v38, v39);

  v43 = objc_msgSend__injectionStyleForResource_(self, v40, @"APStyleSheet", v41, v42);
  objc_msgSend__addUserStyleSheet_(v27, v44, (uint64_t)v43, v45, v46);

  objc_msgSend_setUserContentController_(v5, v47, (uint64_t)v27, v48, v49);
  v53 = objc_msgSend__newProcessPoolWithBackgroundPriority_(self, v50, v3, v51, v52);
  objc_msgSend_setProcessPool_(v5, v54, (uint64_t)v53, v55, v56);
  objc_msgSend__setWaitsForPaintAfterViewDidMoveToWindow_(v5, v57, 0, v58, v59);
  id v60 = objc_alloc_init(MEMORY[0x263F1FA20]);
  objc_msgSend__setPeerConnectionEnabled_(v60, v61, 0, v62, v63);
  objc_msgSend_setPreferences_(v5, v64, (uint64_t)v60, v65, v66);

  return v5;
}

- (id)_newProcessPoolWithBackgroundPriority:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F1FAB0]);
  uint64_t v8 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x263F086E0], v5, @"com.apple.ap.Proxy", v6, v7);
  uint64_t v13 = objc_msgSend_builtInPlugInsURL(v8, v9, v10, v11, v12);
  v16 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v13, v14, @"PromotedContentWebProcessBundle.bundle", 1, v15);

  objc_msgSend_setAlwaysRunsAtBackgroundPriority_(v4, v17, v3, v18, v19);
  objc_msgSend_setInjectedBundleURL_(v4, v20, (uint64_t)v16, v21, v22);
  id v23 = objc_alloc(MEMORY[0x263F1FA28]);
  id v27 = objc_msgSend__initWithConfiguration_(v23, v24, (uint64_t)v4, v25, v26);

  return v27;
}

- (id)_injectionScriptForResource:(id)a3 injectionTime:(int64_t)a4
{
  id v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_bundleWithIdentifier_(v5, v7, @"com.apple.ap.PromotedContentUI", v8, v9);
  uint64_t v13 = objc_msgSend_URLForResource_withExtension_(v10, v11, (uint64_t)v6, @"js", v12);

  uint64_t v15 = objc_msgSend_stringWithContentsOfURL_encoding_error_(NSString, v14, (uint64_t)v13, 4, 0);
  id v16 = objc_alloc(MEMORY[0x263F1FA40]);
  uint64_t v18 = objc_msgSend_initWithSource_injectionTime_forMainFrameOnly_(v16, v17, (uint64_t)v15, a4, 0);

  return v18;
}

- (id)_injectionStyleForResource:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_bundleWithIdentifier_(v3, v5, @"com.apple.ap.PromotedContentUI", v6, v7);
  uint64_t v11 = objc_msgSend_URLForResource_withExtension_(v8, v9, (uint64_t)v4, @"css", v10);

  uint64_t v13 = objc_msgSend_stringWithContentsOfURL_encoding_error_(NSString, v12, (uint64_t)v11, 4, 0);
  id v14 = objc_alloc(MEMORY[0x263F1FAC0]);
  uint64_t v17 = objc_msgSend_initWithSource_forMainFrameOnly_(v14, v15, (uint64_t)v13, 0, v16);

  return v17;
}

- (APUnfairLock)webProcessConfigurationLock
{
  return self->_webProcessConfigurationLock;
}

- (APUnfairLock)webProcessConfigurationWithBackgroundPriorityLock
{
  return self->_webProcessConfigurationWithBackgroundPriorityLock;
}

- (APUnfairLock)videoConfigurationLock
{
  return self->_videoConfigurationLock;
}

- (APUnfairLock)videoConfigurationWithBackgroundPriorityLock
{
  return self->_videoConfigurationWithBackgroundPriorityLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConfigurationWithBackgroundPriorityLock, 0);
  objc_storeStrong((id *)&self->_videoConfigurationLock, 0);
  objc_storeStrong((id *)&self->_webProcessConfigurationWithBackgroundPriorityLock, 0);
  objc_storeStrong((id *)&self->_webProcessConfigurationLock, 0);
  objc_storeStrong((id *)&self->_videoConfigurationWithBackgroundPriority, 0);
  objc_storeStrong((id *)&self->_videoConfiguration, 0);
  objc_storeStrong((id *)&self->_webProcessConfigurationWithBackgroundPriority, 0);

  objc_storeStrong((id *)&self->_webProcessConfiguration, 0);
}

@end