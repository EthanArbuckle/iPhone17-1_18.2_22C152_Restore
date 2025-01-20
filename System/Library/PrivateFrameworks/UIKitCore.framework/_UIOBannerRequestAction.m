@interface _UIOBannerRequestAction
+ (id)actionForSystemBannerRequest:(void *)a3 completionHandler:;
- (BOOL)connectionIsEntitled:(id)a3;
- (BOOL)isPermitted;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIOBannerRequestAction

+ (id)actionForSystemBannerRequest:(void *)a3 completionHandler:
{
  id v4 = a3;
  id v5 = a2;
  v6 = (objc_class *)self;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v7 setObject:v5 forSetting:0];

  v8 = (void *)MEMORY[0x1E4F4F670];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74___UIOBannerRequestAction_actionForSystemBannerRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E52EE548;
  id v14 = v4;
  id v9 = v4;
  v10 = [v8 responderWithHandler:v13];
  v11 = (void *)[[v6 alloc] initWithInfo:v7 responder:v10];

  return v11;
}

- (BOOL)isPermitted
{
  return 1;
}

- (BOOL)connectionIsEntitled:(id)a3
{
  return [a3 clientHasEntitlement:@"com.apple.private.uikit.requestsystembanner"];
}

- (void)performActionFromConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_UIOBannerRequestAction *)self connectionIsEntitled:v4])
  {
    id v5 = [(_UIOBannerRequestAction *)self info];
    v6 = [v5 objectForSetting:0];

    if (qword_1EB2605D8 != -1) {
      dispatch_once(&qword_1EB2605D8, &__block_literal_global_209);
    }
    id v7 = (id) qword_1EB2605D0;
    if (!v7) {
      goto LABEL_9;
    }
    v8 = [v7 sharedInstance];
    [v8 postBannerWithRequest:v6];
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("OverlayUI", &_MergedGlobals_1045) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v6 = v9;
    v8 = [v4 bundleIdentifier];
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "%{public}@ has attempted to request a system banner without necessary entitlements, ignoring the request", (uint8_t *)&v10, 0xCu);
    goto LABEL_8;
  }
LABEL_10:
}

@end