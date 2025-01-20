@interface UISharePlayActivity
+ (BOOL)_canPerform;
+ (int64_t)activityCategory;
+ (unint64_t)_xpcAttributes;
+ (void)_canPerform;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (SHSheetGroupActivitySharingController)groupActivitySharingController;
- (id)_systemImageName;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (int64_t)_defaultSortGroup;
- (void)_cleanup;
- (void)groupActivitySharingController:(id)a3 didFinish:(BOOL)a4;
- (void)prepareWithActivityItems:(id)a3;
- (void)setGroupActivitySharingController:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation UISharePlayActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (int64_t)activityCategory
{
  return 0;
}

- (int64_t)_defaultSortGroup
{
  return 1;
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.SharePlay";
}

- (id)_systemImageName
{
  return @"shareplay";
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"SharePlay[Activity]" value:@"SharePlay" table:@"Localizable"];

  return v3;
}

- (id)activityImage
{
  if (activityImage_onceToken != -1) {
    dispatch_once(&activityImage_onceToken, &__block_literal_global_41);
  }
  uint64_t v2 = (void *)activityImage_transportImage;
  return v2;
}

void __36__UISharePlayActivity_activityImage__block_invoke()
{
  id v29 = [MEMORY[0x1E4FB1830] configurationWithScale:2];
  v0 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:withConfiguration:", @"shareplay");
  v1 = v0;
  if (v0)
  {
    [v0 size];
    double v3 = v2;
    [v1 size];
    double v5 = v4;
    [v1 size];
    if (v3 <= v5) {
      double v6 = v7;
    }
    CGFloat v8 = v6 * 1.2;
    v31.width = v8;
    v31.height = v8;
    UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    [v1 size];
    CGContextTranslateCTM(CurrentContext, 0.0, v10);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    CGContextSetBlendMode(CurrentContext, kCGBlendModeNormal);
    [v1 size];
    CGFloat v12 = (v8 - v11) * 0.5 + 0.5;
    [v1 size];
    CGFloat v14 = 1.0 - (v8 - v13) * 0.5;
    [v1 size];
    CGFloat v16 = v15;
    [v1 size];
    CGFloat v18 = v17;
    id v19 = v1;
    v20 = (CGImage *)[v19 CGImage];
    v32.origin.x = v12;
    v32.origin.CGFloat y = v14;
    v32.size.width = v16;
    v32.size.height = v18;
    CGContextDrawImage(CurrentContext, v32, v20);
    CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceIn);
    id v21 = [MEMORY[0x1E4FB1618] whiteColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v21 CGColor]);

    [v19 size];
    v33.origin.x = 0.0;
    v33.origin.CGFloat y = -(v22 + 2.0);
    CGFloat y = v33.origin.y;
    v33.size.width = v8;
    v33.size.height = v8 + 2.0;
    CGContextFillRect(CurrentContext, v33);
    CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOver);
    id v24 = [MEMORY[0x1E4FB1618] systemGreenColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v24 CGColor]);

    v34.origin.x = 0.0;
    v34.origin.CGFloat y = y;
    v34.size.width = v8;
    v34.size.height = v8 + 2.0;
    CGContextFillRect(CurrentContext, v34);
    uint64_t v25 = UIGraphicsGetImageFromCurrentImageContext();
    v26 = (void *)activityImage_transportImage;
    activityImage_transportImage = v25;

    UIGraphicsEndImageContext();
    uint64_t v27 = [(id)activityImage_transportImage _applicationIconImageForFormat:5 precomposed:0];
    v28 = (void *)activityImage_transportImage;
    activityImage_transportImage = v27;
  }
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return +[UISharePlayActivity _canPerform];
}

+ (BOOL)_canPerform
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    if (_ShareSheetSupportsSharePlayStartFromApp())
    {
      double v3 = [(objc_class *)getTUCallCenterClass() sharedInstance];
      double v4 = [v3 conversationManager];
      char v5 = [v4 isSharePlayAvailable];

      if (v5)
      {
        LOBYTE(v2) = 1;
        return v2;
      }
      double v6 = share_sheet_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[UISharePlayActivity _canPerform](v6);
      }
    }
    else
    {
      double v6 = share_sheet_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CGFloat v8 = 0;
        _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "SharePlay: SharePlay is not supported because the app does not have the appropriate entitlement", v8, 2u);
      }
    }

    LOBYTE(v2) = 0;
  }
  return v2;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  +[SHSheetActivityItemUtilities itemProvidersFromActivityItems:a3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      CGFloat v10 = +[SHSheetGroupActivity groupActivityType];
      char v11 = [v9 hasItemConformingToTypeIdentifier:v10];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (!v12) {
      goto LABEL_14;
    }
    double v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v12;
      _os_log_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_DEFAULT, "SharePlay: Found group activity for SharePlay activity: %@", buf, 0xCu);
    }
  }
  else
  {
LABEL_9:

LABEL_14:
    CGFloat v14 = share_sheet_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0AD8000, v14, OS_LOG_TYPE_DEFAULT, "SharePlay: No group activities were found for SharePlay activity", buf, 2u);
    }

    id v12 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  }
  double v15 = [[SHSheetGroupActivitySharingController alloc] initWithItemProvider:v12];
  groupActivitySharingController = self->_groupActivitySharingController;
  self->_groupActivitySharingController = v15;

  [(SHSheetGroupActivitySharingController *)self->_groupActivitySharingController setDelegate:self];
}

- (SHSheetGroupActivitySharingController)groupActivitySharingController
{
  return self->_groupActivitySharingController;
}

- (void)setSessionID:(id)a3
{
}

- (void)_cleanup
{
  [(SHSheetGroupActivitySharingController *)self->_groupActivitySharingController setDelegate:0];
  groupActivitySharingController = self->_groupActivitySharingController;
  self->_groupActivitySharingController = 0;
}

- (void)groupActivitySharingController:(id)a3 didFinish:(BOOL)a4
{
}

- (void)setGroupActivitySharingController:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)_canPerform
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "SharePlay: SharePlay is not supported because it is disabled at a system level", v1, 2u);
}

@end