@interface VUIActionBundleOffer
- (BOOL)isAccountRequired;
- (BOOL)isMultiOfferDynamicVC;
- (NSDictionary)offerMetrics;
- (NSString)notificationBody;
- (NSString)notificationBundleTitle;
- (NSString)notificationTitle;
- (NSString)offerDomain;
- (NSString)offerURLString;
- (NSString)secondaryOfferNotificationBody;
- (NSString)secondaryOfferNotificationTitle;
- (NSString)sharedWatchUrl;
- (VUIActionBundleOffer)initWithContextData:(id)a3 appContext:(id)a4;
- (VUIAppContext)appContext;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setAppContext:(id)a3;
- (void)setIsMultiOfferDynamicVC:(BOOL)a3;
- (void)setNotificationBody:(id)a3;
- (void)setNotificationBundleTitle:(id)a3;
- (void)setNotificationTitle:(id)a3;
- (void)setOfferDomain:(id)a3;
- (void)setOfferMetrics:(id)a3;
- (void)setOfferURLString:(id)a3;
- (void)setSecondaryOfferNotificationBody:(id)a3;
- (void)setSecondaryOfferNotificationTitle:(id)a3;
- (void)setSharedWatchUrl:(id)a3;
@end

@implementation VUIActionBundleOffer

- (VUIActionBundleOffer)initWithContextData:(id)a3 appContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)VUIActionBundleOffer;
  v8 = [(VUIActionBundleOffer *)&v24 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(v6, "vui_stringForKey:", @"offerURL");
    offerURLString = v8->_offerURLString;
    v8->_offerURLString = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v6, "vui_stringForKey:", @"offerDomain");
    offerDomain = v8->_offerDomain;
    v8->_offerDomain = (NSString *)v11;

    uint64_t v13 = objc_msgSend(v6, "vui_stringForKey:", @"notificationTitle");
    notificationTitle = v8->_notificationTitle;
    v8->_notificationTitle = (NSString *)v13;

    uint64_t v15 = objc_msgSend(v6, "vui_stringForKey:", @"notificationBundleTitle");
    notificationBundleTitle = v8->_notificationBundleTitle;
    v8->_notificationBundleTitle = (NSString *)v15;

    uint64_t v17 = objc_msgSend(v6, "vui_stringForKey:", @"notificationBody");
    notificationBody = v8->_notificationBody;
    v8->_notificationBody = (NSString *)v17;

    uint64_t v19 = objc_msgSend(v6, "vui_dictionaryForKey:", @"metricsDictionary");
    offerMetrics = v8->_offerMetrics;
    v8->_offerMetrics = (NSDictionary *)v19;

    uint64_t v21 = objc_msgSend(v6, "vui_stringForKey:", @"sharedWatchUrl");
    sharedWatchUrl = v8->_sharedWatchUrl;
    v8->_sharedWatchUrl = (NSString *)v21;

    v8->_isMultiOfferDynamicVC = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", @"isMultiOfferDynamicVC", 0);
    objc_storeStrong((id *)&v8->_appContext, a4);
  }

  return v8;
}

- (BOOL)isAccountRequired
{
  return 1;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CB10] URLWithString:self->_offerURLString];
  if (v6)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __69__VUIActionBundleOffer_performWithTargetResponder_completionHandler___block_invoke;
    v22 = &unk_1E6DF3D80;
    id v23 = v5;
    id v7 = _Block_copy(&v19);
    v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v19, v20, v21, v22);
    objc_msgSend(v8, "vui_setObjectIfNotNil:forKey:", self->_notificationTitle, @"notificationTitle");
    objc_msgSend(v8, "vui_setObjectIfNotNil:forKey:", self->_offerDomain, @"offerDomain");
    objc_msgSend(v8, "vui_setObjectIfNotNil:forKey:", self->_notificationBundleTitle, @"notificationBundleTitle");
    objc_msgSend(v8, "vui_setObjectIfNotNil:forKey:", self->_notificationBody, @"notificationBody");
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isMultiOfferDynamicVC];
    objc_msgSend(v8, "vui_setObjectIfNotNil:forKey:", v9, @"isMultiOfferDynamicVC");

    objc_msgSend(v8, "vui_setObjectIfNotNil:forKey:", self->_sharedWatchUrl, @"sharedWatchUrl");
    if (self->_offerMetrics)
    {
      v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
      offerMetrics = self->_offerMetrics;
      objc_super v24 = @"metricsDictionary";
      v25[0] = offerMetrics;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      [v10 addEntriesFromDictionary:v12];

      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];

      v8 = (void *)v13;
    }
    v14 = +[VUIInterfaceFactory sharedInstance];
    uint64_t v15 = [v14 openURLHandler];
    v16 = [v8 valueForKey:@"sharedWatchUrl"];
    uint64_t v17 = [(VUIActionBundleOffer *)self appContext];
    [v15 processNonDeeplinkURL:v6 contextData:v8 sharedWatchUrl:v16 appContext:v17 completion:v7];
  }
  else
  {
    v18 = VUIDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[VUIActionBundleOffer performWithTargetResponder:completionHandler:](v18);
    }

    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

uint64_t __69__VUIActionBundleOffer_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIActionBundleOffer - BundleOffer:: Action completed with success:%d", (uint8_t *)v6, 8u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (NSString)offerURLString
{
  return self->_offerURLString;
}

- (void)setOfferURLString:(id)a3
{
}

- (NSString)offerDomain
{
  return self->_offerDomain;
}

- (void)setOfferDomain:(id)a3
{
}

- (NSString)notificationTitle
{
  return self->_notificationTitle;
}

- (void)setNotificationTitle:(id)a3
{
}

- (NSString)notificationBundleTitle
{
  return self->_notificationBundleTitle;
}

- (void)setNotificationBundleTitle:(id)a3
{
}

- (NSString)notificationBody
{
  return self->_notificationBody;
}

- (void)setNotificationBody:(id)a3
{
}

- (NSString)sharedWatchUrl
{
  return self->_sharedWatchUrl;
}

- (void)setSharedWatchUrl:(id)a3
{
}

- (BOOL)isMultiOfferDynamicVC
{
  return self->_isMultiOfferDynamicVC;
}

- (void)setIsMultiOfferDynamicVC:(BOOL)a3
{
  self->_isMultiOfferDynamicVC = a3;
}

- (NSString)secondaryOfferNotificationTitle
{
  return self->_secondaryOfferNotificationTitle;
}

- (void)setSecondaryOfferNotificationTitle:(id)a3
{
}

- (NSString)secondaryOfferNotificationBody
{
  return self->_secondaryOfferNotificationBody;
}

- (void)setSecondaryOfferNotificationBody:(id)a3
{
}

- (NSDictionary)offerMetrics
{
  return self->_offerMetrics;
}

- (void)setOfferMetrics:(id)a3
{
}

- (VUIAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_offerMetrics, 0);
  objc_storeStrong((id *)&self->_secondaryOfferNotificationBody, 0);
  objc_storeStrong((id *)&self->_secondaryOfferNotificationTitle, 0);
  objc_storeStrong((id *)&self->_sharedWatchUrl, 0);
  objc_storeStrong((id *)&self->_notificationBody, 0);
  objc_storeStrong((id *)&self->_notificationBundleTitle, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_offerDomain, 0);
  objc_storeStrong((id *)&self->_offerURLString, 0);
}

- (void)performWithTargetResponder:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIActionBundleOffer - BundleOffer:: No offer url", v1, 2u);
}

@end