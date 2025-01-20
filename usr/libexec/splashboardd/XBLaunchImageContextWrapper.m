@interface XBLaunchImageContextWrapper
+ (id)contextWrapperForApplicationWithCompatibilityInfo:(id)a3 launchRequest:(id)a4 captureOptions:(int64_t)a5;
- (BOOL)_verifyMemoryImpactOfViewHierarchy:(id)a3 bundleID:(id)a4 size:(unint64_t *)a5 error:(id *)a6;
- (UIViewController)rootViewController;
- (XBApplicationLaunchCompatibilityInfo)appInfo;
- (XBLaunchCaptureInformation)captureInformation;
- (XBLaunchImageContextWrapper)initWithApplicationCompatibilityInfo:(id)a3 launchRequest:(id)a4 captureOptions:(int64_t)a5;
- (XBLaunchImageError)error;
- (XBLaunchInterface)launchInterface;
- (XBLaunchStateRequest)launchRequest;
- (_XBWrapperWindow)wrapperWindow;
- (id)_errorForParsingException:(id)a3 bundleID:(id)a4;
- (id)_ioSurfaceForLayerContents:(void *)a3;
- (id)_parseInterfaceConfiguration:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6;
- (id)_parseInterfaceWithNibName:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6;
- (id)_parseInterfaceWithStoryboardName:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6;
- (id)_parseLaunchInterface:(id)a3 bundle:(id)a4 bundlePath:(id)a5 bundleID:(id)a6 error:(id *)a7;
- (unint64_t)_estimatedMemorySizeOfViewHierarchy:(id)a3;
- (unsigned)contextID;
- (void)_configureNewWindow;
- (void)_configureRootViewForRTL:(id)a3 bundle:(id)a4;
- (void)_update;
- (void)invalidate;
- (void)setAppInfo:(id)a3;
- (void)setCaptureInformation:(id)a3;
- (void)setLaunchRequest:(id)a3;
- (void)setWrapperWindow:(id)a3;
- (void)updateLaunchRequest:(id)a3;
@end

@implementation XBLaunchImageContextWrapper

+ (id)contextWrapperForApplicationWithCompatibilityInfo:(id)a3 launchRequest:(id)a4 captureOptions:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithApplicationCompatibilityInfo:v9 launchRequest:v8 captureOptions:a5];

  return v10;
}

- (XBLaunchImageContextWrapper)initWithApplicationCompatibilityInfo:(id)a3 launchRequest:(id)a4 captureOptions:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)XBLaunchImageContextWrapper;
  v11 = [(XBLaunchImageContextWrapper *)&v25 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appInfo, a3);
    objc_storeStrong((id *)&v12->_launchRequest, a4);
    v13 = [v10 launchInterfaceIdentifier];
    uint64_t v14 = [v9 launchInterfaceWithIdentifier:v13];
    launchInterface = v12->_launchInterface;
    v12->_launchInterface = (XBLaunchInterface *)v14;

    v12->_int64_t captureOptions = a5;
    if (a5)
    {
      v16 = (XBLaunchCaptureInformation *)objc_alloc_init((Class)XBLaunchCaptureInformation);
      captureInformation = v12->_captureInformation;
      v12->_captureInformation = v16;
    }
    v18 = sub_1000027C4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [(XBApplicationLaunchCompatibilityInfo *)v12->_appInfo bundleIdentifier];
      v20 = [v10 launchInterfaceIdentifier];
      v21 = v12->_launchInterface;
      int64_t captureOptions = v12->_captureOptions;
      launchRequest = v12->_launchRequest;
      *(_DWORD *)buf = 138544386;
      v27 = v19;
      __int16 v28 = 2114;
      v29 = v20;
      __int16 v30 = 2114;
      v31 = v21;
      __int16 v32 = 2048;
      int64_t v33 = captureOptions;
      __int16 v34 = 2114;
      v35 = launchRequest;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] XBLaunchImageContextWrapper configuring with\nlaunchInterfaceIdentifier: %{public}@\nlaunchInterface: %{public}@\ncaptureOptions: %ld\nlaunchRequest: %{public}@", buf, 0x34u);
    }
    [(XBLaunchImageContextWrapper *)v12 _configureNewWindow];
  }

  return v12;
}

- (unsigned)contextID
{
  wrapperWindow = self->_wrapperWindow;
  if (wrapperWindow) {
    return [(_XBWrapperWindow *)wrapperWindow _contextId];
  }
  else {
    return XBInvalidContextId;
  }
}

- (id)_errorForParsingException:(id)a3 bundleID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 name];
  unsigned int v8 = [v7 isEqualToString:@"UIWindowRestrictedSplashboardViewException"];
  id v9 = objc_alloc((Class)XBLaunchImageError);
  id v10 = [v6 description];

  if (v8)
  {
    v11 = +[NSString stringWithFormat:@"Exception thrown attempting to load a storyboard using a restricted view class: %@", v10];
    v12 = v9;
    uint64_t v13 = 5;
  }
  else
  {
    v11 = +[NSString stringWithFormat:@"Exception thrown during load: %@", v10];
    v12 = v9;
    uint64_t v13 = 2;
  }
  id v14 = [v12 initWithCode:v13 bundleID:v5 reason:v11 fatal:0];

  return v14;
}

- (id)_parseInterfaceWithStoryboardName:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[UIStoryboard storyboardWithName:v9 bundle:v10];
  uint64_t v13 = [v12 instantiateInitialViewController];

  if (a6 && !v13 && !*a6)
  {
    id v14 = objc_alloc((Class)XBLaunchImageError);
    v15 = +[NSString stringWithFormat:@"Could not load any content for the interface named \"%@\".", v9];
    *a6 = [v14 initWithCode:3 bundleID:v11 reason:v15 fatal:0];
  }

  return v13;
}

- (id)_parseInterfaceWithNibName:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v22 = a5;
  v21 = +[UINib nibWithNibName:v9 bundle:v10];
  [v21 instantiateWithOwner:0 options:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = sub_1000027C4();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
            sub_100006CF4(v17, buf, &v29, v16);
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v15;
            goto LABEL_17;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = objc_alloc_init((Class)UIViewController);
            [v12 setView:v15];
            goto LABEL_17;
          }
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if (a6 && !v12 && !*a6)
  {
    id v18 = objc_alloc((Class)XBLaunchImageError);
    v19 = +[NSString stringWithFormat:@"Could not load any content for the interface named \"%@\".", v9];
    *a6 = [v18 initWithCode:3 bundleID:v22 reason:v19 fatal:0];
  }

  return v12;
}

- (id)_parseInterfaceConfiguration:(id)a3 bundle:(id)a4 bundleID:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v51 = a4;
  id v48 = a5;
  id v50 = objc_alloc_init((Class)UIViewController);
  id v9 = objc_alloc_init((Class)UIView);
  id v10 = [v8 colorName];

  if (v10
    && ([v8 colorName],
        id v11 = objc_claimAutoreleasedReturnValue(),
        +[UIColor colorNamed:v11 inBundle:v51 compatibleWithTraitCollection:0], v49 = objc_claimAutoreleasedReturnValue(), v11, (id v12 = v49) != 0))
  {
    int v13 = 0;
  }
  else
  {
    id v12 = +[UIColor systemBackgroundColor];
    v49 = 0;
    int v13 = 1;
  }
  [v9 setBackgroundColor:v12];
  if (v13) {

  }
  id v14 = [v8 imageName];

  if (v14)
  {
    v15 = [v8 imageName];
    v16 = +[UIImage imageNamed:v15 inBundle:v51 compatibleWithTraitCollection:0];

    if (v16)
    {
      v17 = objc_alloc_init(XBUpdatingImageView);
      [v9 addSubview:v17];
      if ([v8 imageRespectsSafeAreaInsets])
      {
        [(XBUpdatingImageView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
        v47 = [v9 safeAreaLayoutGuide];
        v46 = [v47 leadingAnchor];
        v45 = [(XBUpdatingImageView *)v17 leadingAnchor];
        v44 = [v46 constraintEqualToAnchor:v45];
        v52[0] = v44;
        v43 = [v47 trailingAnchor];
        v42 = [(XBUpdatingImageView *)v17 trailingAnchor];
        v41 = [v43 constraintEqualToAnchor:v42];
        v52[1] = v41;
        v40 = [v47 topAnchor];
        id v18 = [(XBUpdatingImageView *)v17 topAnchor];
        v19 = [v40 constraintEqualToAnchor:v18];
        v52[2] = v19;
        v20 = [v47 bottomAnchor];
        v21 = [(XBUpdatingImageView *)v17 bottomAnchor];
        id v22 = [v20 constraintEqualToAnchor:v21];
        v52[3] = v22;
        v23 = +[NSArray arrayWithObjects:v52 count:4];
        +[NSLayoutConstraint activateConstraints:v23];
      }
      else
      {
        [(XBUpdatingImageView *)v17 setAutoresizingMask:18];
      }
      [(XBUpdatingImageView *)v17 setImage:v16];
    }
  }
  long long v24 = [v8 bars];
  unsigned int v25 = [v24 containsObject:XBLaunchConfigurationToolbarKey];

  if (v25)
  {
    id v26 = objc_alloc_init((Class)UIToolbar);
    long long v27 = [v8 toolbarImageName];
    __int16 v28 = +[UIImage imageNamed:v27 inBundle:v51 compatibleWithTraitCollection:0];

    uint64_t v29 = [[XBViewMatchingImageView alloc] initWithMatchingView:v26 image:v28 bottom:1];
    [(XBViewMatchingImageView *)v29 setAutoresizingMask:18];
    [v9 addSubview:v29];
  }
  else
  {
    __int16 v30 = [v8 bars];
    unsigned int v31 = [v30 containsObject:XBLaunchConfigurationTabBarKey];

    if (!v31) {
      goto LABEL_19;
    }
    id v26 = objc_alloc_init((Class)UITabBar);
    __int16 v32 = [v8 tabBarImageName];
    __int16 v28 = +[UIImage imageNamed:v32 inBundle:v51 compatibleWithTraitCollection:0];

    uint64_t v29 = [[XBViewMatchingImageView alloc] initWithMatchingView:v26 image:v28 bottom:1];
    [(XBViewMatchingImageView *)v29 setAutoresizingMask:18];
    [v9 addSubview:v29];
  }

LABEL_19:
  int64_t v33 = [v8 bars];
  unsigned int v34 = [v33 containsObject:XBLaunchConfigurationNavigationBarKey];

  if (v34)
  {
    id v35 = objc_alloc_init((Class)UINavigationBar);
    v36 = [v8 navigationBarImageName];
    v37 = +[UIImage imageNamed:v36 inBundle:v51 compatibleWithTraitCollection:0];

    v38 = [[XBViewMatchingImageView alloc] initWithMatchingView:v35 image:v37 bottom:0];
    [(XBViewMatchingImageView *)v38 setAutoresizingMask:18];
    [v9 addSubview:v38];
  }
  [v50 setView:v9];

  return v50;
}

- (id)_parseLaunchInterface:(id)a3 bundle:(id)a4 bundlePath:(id)a5 bundleID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v13)
  {
    v19 = sub_1000027C4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100006D50();
    }

    if (a7)
    {
      id v20 = objc_alloc((Class)XBLaunchImageError);
      v21 = +[NSString stringWithFormat:@"Failed to construct NSBundle for %@ at %@.", v15, v14];
      *a7 = [v20 initWithCode:4 bundleID:v15 reason:v21 fatal:0];
    }
    goto LABEL_10;
  }
  if ([v12 isStoryboard])
  {
    v16 = sub_1000027C4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100006D84();
    }

    v17 = [(XBLaunchInterface *)self->_launchInterface name];
    uint64_t v18 = [(XBLaunchImageContextWrapper *)self _parseInterfaceWithStoryboardName:v17 bundle:v13 bundleID:v15 error:a7];
LABEL_19:
    id v22 = (void *)v18;

    goto LABEL_20;
  }
  if ([v12 isXIB])
  {
    v23 = sub_1000027C4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100006DB8();
    }

    v17 = [(XBLaunchInterface *)self->_launchInterface name];
    uint64_t v18 = [(XBLaunchImageContextWrapper *)self _parseInterfaceWithNibName:v17 bundle:v13 bundleID:v15 error:a7];
    goto LABEL_19;
  }
  if ([v12 isConfiguration])
  {
    long long v24 = sub_1000027C4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_100006DEC();
    }

    v17 = [(XBLaunchInterface *)self->_launchInterface configuration];
    uint64_t v18 = [(XBLaunchImageContextWrapper *)self _parseInterfaceConfiguration:v17 bundle:v13 bundleID:v15 error:a7];
    goto LABEL_19;
  }
  if (!a7)
  {
LABEL_10:
    id v22 = 0;
    goto LABEL_20;
  }
  id v26 = sub_1000027C4();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_100006E20();
  }

  id v22 = 0;
  *a7 = [objc_alloc((Class)XBLaunchImageError) initWithCode:1 bundleID:v15 reason:@"No such interface found." fatal:0];
LABEL_20:

  return v22;
}

- (void)_configureRootViewForRTL:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v11 = v5;
    id v6 = [(NSBundle *)self->_bundle localizations];
    v7 = +[NSLocale preferredLanguages];
    id v8 = +[NSBundle preferredLocalizationsFromArray:v6 forPreferences:v7];

    id v9 = [v8 firstObject];
    NSWritingDirection v10 = +[NSParagraphStyle defaultWritingDirectionForLanguage:v9];

    if (v10 == NSWritingDirectionRightToLeft) {
      sub_100003DA8(v11);
    }

    id v5 = v11;
  }
}

- (BOOL)_verifyMemoryImpactOfViewHierarchy:(id)a3 bundleID:(id)a4 size:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  [v11 setNeedsLayout];
  [v11 layoutIfNeeded];
  unint64_t v12 = [(XBLaunchImageContextWrapper *)self _estimatedMemorySizeOfViewHierarchy:v11];

  if (a5) {
    *a5 = v12;
  }
  id v13 = sub_100002564();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100006EDC();
  }

  if (v12 >= 0x17D7840)
  {
    int IsEnabled = _XBDebugCaptureIsEnabled();
    if (!IsEnabled)
    {
      if (a6)
      {
        id v16 = objc_alloc((Class)XBLaunchImageError);
        v17 = +[NSString stringWithFormat:@"[%@] Estimated size (%zu) is over limit (%zu)", v10, v12, 25000000];
        *a6 = [v16 initWithCode:6 bundleID:v10 reason:v17 fatal:0];
      }
      id v15 = sub_100002564();
      if (os_signpost_enabled(v15))
      {
        uint64_t v18 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
        *(_DWORD *)buf = 138543874;
        v21 = v18;
        __int16 v22 = 2050;
        unint64_t v23 = v12;
        __int16 v24 = 2050;
        uint64_t v25 = 25000000;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OverMemoryLimit", "BundleIdOverride=%{public, signpost.description:attribute}@ estimate=%{signpost.telemetry:number1, public}zu limit=%{signpost.telemetry:number2, public}zu enableTelemetry=YES ", buf, 0x20u);
      }
      goto LABEL_15;
    }
    if (v12 > 0x17D7840)
    {
      id v15 = sub_100002564();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_100006E54();
      }
LABEL_15:

      goto LABEL_16;
    }
  }
  LOBYTE(IsEnabled) = 1;
LABEL_16:

  return IsEnabled;
}

- (void)_configureNewWindow
{
  if (!+[NSThread isMainThread])
  {
    int64_t v33 = +[NSAssertionHandler currentHandler];
    unsigned int v34 = _NSFullMethodName();
    [v33 handleFailureInMethod:a2, self, @"XBLaunchImageContextWrapper.m", 403, @"%@ must be called on the main thread", v34 object file lineNumber description];
  }
  id v5 = +[UIScreen mainScreen];
  [v5 _setUIIBAlwaysProvidePeripheryInsets:1];

  id v6 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundlePath];
  v7 = +[NSBundle bundleWithPath:v6];
  bundle = self->_bundle;
  self->_bundle = v7;

  launchInterface = self->_launchInterface;
  id v10 = self->_bundle;
  id v11 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
  id v36 = 0;
  unint64_t v12 = [(XBLaunchImageContextWrapper *)self _parseLaunchInterface:launchInterface bundle:v10 bundlePath:v6 bundleID:v11 error:&v36];
  id v13 = v36;
  rootViewController = self->_rootViewController;
  self->_rootViewController = v12;

  id v15 = self->_rootViewController;
  if (v15 && !v13)
  {
    id v16 = [(UIViewController *)v15 view];
    v17 = sub_100002564();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v31 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
      __int16 v32 = self->_rootViewController;
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v31;
      __int16 v38 = 2112;
      v39 = v32;
      __int16 v40 = 2112;
      v41 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%@] rootViewController: %@; rootView: %@",
        buf,
        0x20u);
    }
    [(XBLaunchImageContextWrapper *)self _configureRootViewForRTL:v16 bundle:self->_bundle];
    *(void *)buf = 0;
    uint64_t v18 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
    id v35 = 0;
    unsigned int v19 = [(XBLaunchImageContextWrapper *)self _verifyMemoryImpactOfViewHierarchy:v16 bundleID:v18 size:buf error:&v35];
    id v13 = v35;

    if (v19)
    {
      id v20 = [_XBWrapperWindow alloc];
      [(XBLaunchStateRequest *)self->_launchRequest naturalSize];
      BSRectWithSize();
      v21 = -[_XBWrapperWindow initWithFrame:](v20, "initWithFrame:");
      wrapperWindow = self->_wrapperWindow;
      self->_wrapperWindow = v21;

      unint64_t v23 = self->_wrapperWindow;
      if ([(XBApplicationLaunchCompatibilityInfo *)self->_appInfo launchesOpaque]) {
        +[UIColor blackColor];
      }
      else {
      __int16 v24 = +[UIColor clearColor];
      }
      [(_XBWrapperWindow *)v23 setBackgroundColor:v24];

      [(_XBWrapperWindow *)self->_wrapperWindow setRootViewController:self->_rootViewController];
      [(XBLaunchImageContextWrapper *)self _update];
      if (self->_captureOptions) {
        [(XBLaunchCaptureInformation *)self->_captureInformation setEstimatedMemoryImpact:*(void *)buf];
      }
    }
  }
  if (v13)
  {
    objc_storeStrong((id *)&self->_error, v13);
    unsigned int v25 = [v13 isFatal];
    id v26 = @"Error";
    if (v25) {
      id v26 = @"Fatal error";
    }
    long long v27 = v26;
    __int16 v28 = sub_1000027C4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
      __int16 v30 = [v13 succinctDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v27;
      __int16 v38 = 2114;
      v39 = v29;
      __int16 v40 = 2114;
      v41 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@ generating launch image for %{public}@: %{public}@", buf, 0x20u);
    }
  }
}

- (void)_update
{
  v4 = sub_1000027C4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    launchRequest = self->_launchRequest;
    *(_DWORD *)buf = 138543362;
    __int16 v32 = launchRequest;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating window to %{public}@", buf, 0xCu);
  }

  id v6 = [(XBLaunchStateRequest *)self->_launchRequest interfaceOrientation];
  [(XBLaunchStateRequest *)self->_launchRequest naturalSize];
  BSRectWithSize();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [(XBLaunchStateRequest *)self->_launchRequest userInterfaceStyle];
  id v16 = [(_XBWrapperWindow *)self->_wrapperWindow screen];
  [v16 _updateUserInterfaceIdiom];
  [v16 _setInterfaceOrientation:v6];
  _UIAppSetStatusBarOrientation();
  sub_100002B74((uint64_t)[(XBLaunchStateRequest *)self->_launchRequest statusBarState]);
  _UIAppSetStatusBarHeight();
  v17 = [v16 _launchImageTraitCollectionForInterfaceOrientation:v6 inBounds:v8, v10, v12, v14];
  uint64_t v18 = +[UITraitCollection traitCollectionWithUserInterfaceIdiom:](UITraitCollection, "traitCollectionWithUserInterfaceIdiom:", [v16 _userInterfaceIdiom]);
  unsigned int v19 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:v15];
  wrapperWindow = self->_wrapperWindow;
  v30[0] = v17;
  v30[1] = v18;
  v30[2] = v19;
  v21 = +[NSArray arrayWithObjects:v30 count:3];
  __int16 v22 = +[UITraitCollection traitCollectionWithTraitsFromCollections:v21];
  [(_XBWrapperWindow *)wrapperWindow _setLocalOverrideTraitCollection:v22];

  [(_XBWrapperWindow *)self->_wrapperWindow _setWindowInterfaceOrientation:v6];
  [(_XBWrapperWindow *)self->_wrapperWindow _setRotatableViewOrientation:v6 updateStatusBar:0 duration:0 force:0.0];
  unint64_t v23 = self->_wrapperWindow;
  __int16 v24 = [(XBLaunchStateRequest *)self->_launchRequest customSafeAreaInsets];
  [(_XBWrapperWindow *)v23 _setCustomSafeAreaInsets:v24];

  [(_XBWrapperWindow *)self->_wrapperWindow setHidden:0];
  -[_XBWrapperWindow setFrame:](self->_wrapperWindow, "setFrame:", v8, v10, v12, v14);
  unsigned int v25 = [(UIViewController *)self->_rootViewController view];
  [(_XBWrapperWindow *)self->_wrapperWindow bounds];
  [v25 setFrame:];

  [(_XBWrapperWindow *)self->_wrapperWindow setNeedsUpdateConstraints];
  [(_XBWrapperWindow *)self->_wrapperWindow setNeedsLayout];
  [(_XBWrapperWindow *)self->_wrapperWindow layoutIfNeeded];
  [(_XBWrapperWindow *)self->_wrapperWindow setNeedsDisplay];
  id v26 = sub_1000027C4();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Updated window", buf, 2u);
  }

  +[CATransaction flush];
  +[CATransaction synchronize];
  int64_t captureOptions = self->_captureOptions;
  [(XBLaunchImageContextWrapper *)self contextID];
  if ((captureOptions & 2) != 0)
  {
    _XBPreparedLaunchInterfaceForCapture();
    id v28 = 0;
    if (v28)
    {
      uint64_t v29 = v28;
      [(XBLaunchCaptureInformation *)self->_captureInformation setCaarFilePath:v28];
    }
  }
  else
  {
    _XBPreparedLaunchInterfaceForCapture();
  }
}

- (id)_ioSurfaceForLayerContents:(void *)a3
{
  CFTypeID v4 = CFGetTypeID(a3);
  if (v4 == CGImageGetTypeID())
  {
    CGImageGetImageProvider();
    id v5 = (void *)CGImageProviderCopyIOSurface();
  }
  else if (v4 == IOSurfaceGetTypeID())
  {
    id v5 = a3;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (unint64_t)_estimatedMemorySizeOfViewHierarchy:(id)a3
{
  id v4 = a3;
  id v5 = [v4 layer];
  id v6 = [v5 contents];
  if (!v6)
  {
    double v13 = sub_100002564();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_16:
        unint64_t v11 = 0;
        goto LABEL_30;
      }
      [v4 bounds];
      unint64_t v11 = 0;
      if (v16 <= 0.0 || v15 <= 0.0) {
        goto LABEL_30;
      }
      double v13 = v4;
      v17 = [v13 image];
      if (v17)
      {
        uint64_t v18 = sub_100002564();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v39 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
          *(_DWORD *)buf = 138543874;
          uint64_t v47 = (uint64_t)v39;
          __int16 v48 = 2114;
          size_t v49 = (size_t)v13;
          __int16 v50 = 2114;
          size_t v51 = (size_t)v17;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}@] found UIImageView with no contents, but has image: %{public}@ %{public}@", buf, 0x20u);
        }
      }
    }
    goto LABEL_16;
  }
  double v7 = [(XBLaunchImageContextWrapper *)self _ioSurfaceForLayerContents:v6];
  double v8 = v7;
  if (v7)
  {
    id v9 = [v7 width];
    id v10 = [v8 height];
    unint64_t v11 = (unint64_t)[v8 allocationSize];
    double v12 = sub_100002564();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v37 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
      *(_DWORD *)buf = 138544642;
      uint64_t v47 = (uint64_t)v37;
      __int16 v48 = 2048;
      size_t v49 = (size_t)v9;
      __int16 v50 = 2048;
      size_t v51 = (size_t)v10;
      __int16 v52 = 2048;
      unint64_t v53 = v11;
      __int16 v54 = 2114;
      id v55 = v4;
      __int16 v56 = 2114;
      v57 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] found IOSurface in layer hierarchy; size: {%zu, %zu}; allocSize: %zu; view: %{public}@; layer: %{public}@",
        buf,
        0x3Eu);
    }
  }
  else
  {
    CFTypeID v19 = CFGetTypeID(v6);
    if (v19 == CGImageGetTypeID())
    {
      size_t Width = CGImageGetWidth((CGImageRef)v6);
      size_t Height = CGImageGetHeight((CGImageRef)v6);
      size_t BitsPerPixel = CGImageGetBitsPerPixel((CGImageRef)v6);
      size_t BytesPerRow = CGImageGetBytesPerRow((CGImageRef)v6);
      if (CGImageGetAlphaInfo((CGImageRef)v6) == kCGImageAlphaOnly)
      {
        __int16 v24 = sub_100002564();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v25 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
          size_t v26 = BitsPerPixel >> 3;
          *(_DWORD *)buf = 138543874;
          uint64_t v47 = v25;
          long long v27 = (void *)v25;
          __int16 v48 = 2048;
          size_t v49 = v26;
          __int16 v50 = 2048;
          size_t v51 = BytesPerRow;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[%{public}@] found CGImage that's alpha only. Trusting %zu bytes per pixel and %zu bytes per row", buf, 0x20u);
        }
      }
      else
      {
        unint64_t v28 = BitsPerPixel >> 3;
        uint64_t v29 = 4;
        if (v28 > 4) {
          uint64_t v29 = v28;
        }
        size_t BytesPerRow = v29 * Width;
        __int16 v24 = sub_100002564();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          __int16 v40 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
          *(_DWORD *)buf = 138543874;
          uint64_t v47 = (uint64_t)v40;
          __int16 v48 = 2048;
          size_t v49 = v28;
          __int16 v50 = 2048;
          size_t v51 = BytesPerRow;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[%{public}@] found CGImage that's NOT alpha only. Taking MAX(4, %zu) bytes per pixel to calculate %zu bytes per row", buf, 0x20u);
        }
      }

      __int16 v30 = sub_100002564();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        __int16 v38 = [(XBApplicationLaunchCompatibilityInfo *)self->_appInfo bundleIdentifier];
        *(_DWORD *)buf = 138544642;
        uint64_t v47 = (uint64_t)v38;
        __int16 v48 = 2048;
        size_t v49 = Width;
        __int16 v50 = 2048;
        size_t v51 = Height;
        __int16 v52 = 2048;
        unint64_t v53 = BytesPerRow;
        __int16 v54 = 2114;
        id v55 = v4;
        __int16 v56 = 2114;
        v57 = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "[%{public}@] found CGImage in layer hierarchy; size: {%zu, %zu}; bytesPerRow: %zu; view: %{public}@; layer: %{public}@",
          buf,
          0x3Eu);
      }
      unint64_t v11 = BytesPerRow * Height;
    }
    else
    {
      unint64_t v11 = 0;
    }
  }

LABEL_30:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unsigned int v31 = [v4 subviews];
  id v32 = [v31 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v42;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(v31);
        }
        v11 += [(XBLaunchImageContextWrapper *)self _estimatedMemorySizeOfViewHierarchy:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      id v33 = [v31 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v33);
  }

  return v11;
}

- (void)updateLaunchRequest:(id)a3
{
  id v5 = (XBLaunchStateRequest *)a3;
  p_launchRequest = &self->_launchRequest;
  if (self->_launchRequest != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_launchRequest, a3);
    if (v7) {
      p_launchRequest = (XBLaunchStateRequest **)[(XBLaunchImageContextWrapper *)self _update];
    }
  }

  _objc_release_x1(p_launchRequest);
}

- (void)invalidate
{
  [(_XBWrapperWindow *)self->_wrapperWindow setHidden:1];
  [(_XBWrapperWindow *)self->_wrapperWindow setRootViewController:0];
  wrapperWindow = self->_wrapperWindow;
  self->_wrapperWindow = 0;

  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;

  [(NSBundle *)self->_bundle unload];
  bundle = self->_bundle;
  self->_bundle = 0;

  captureInformation = self->_captureInformation;
  self->_captureInformation = 0;

  self->_int64_t captureOptions = 0;

  +[_UIAssetManager _clearAllCachedImagesAndAssets];
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (XBLaunchInterface)launchInterface
{
  return self->_launchInterface;
}

- (_XBWrapperWindow)wrapperWindow
{
  return self->_wrapperWindow;
}

- (void)setWrapperWindow:(id)a3
{
}

- (XBApplicationLaunchCompatibilityInfo)appInfo
{
  return self->_appInfo;
}

- (void)setAppInfo:(id)a3
{
}

- (XBLaunchStateRequest)launchRequest
{
  return self->_launchRequest;
}

- (void)setLaunchRequest:(id)a3
{
}

- (XBLaunchImageError)error
{
  return self->_error;
}

- (XBLaunchCaptureInformation)captureInformation
{
  return self->_captureInformation;
}

- (void)setCaptureInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureInformation, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_launchRequest, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
  objc_storeStrong((id *)&self->_wrapperWindow, 0);
  objc_storeStrong((id *)&self->_launchInterface, 0);

  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end