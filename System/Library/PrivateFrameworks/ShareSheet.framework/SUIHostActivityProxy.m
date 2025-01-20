@interface SUIHostActivityProxy
+ (Class)activityProxyClassForActivityCategory:(int64_t)a3;
+ (id)activitiesForConfigurations:(id)a3;
+ (id)newWithActivityConfiguration:(id)a3;
- (BOOL)_activitySupportsPromiseURLs;
- (BOOL)_appIsDocumentTypeOwner;
- (BOOL)_isBuiltinDerived;
- (BOOL)_isDisabled;
- (BOOL)_showsInSystemActionGroup;
- (BOOL)_wantsOriginalImageColor;
- (BOOL)activitySupportsPromiseURLs;
- (BOOL)appIsDocumentTypeOwner;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isBuiltinDerived;
- (BOOL)showsInSystemActionGroup;
- (BOOL)wantsOriginalImageColor;
- (CGSize)_thumbnailSize;
- (CGSize)preferredThumbnailSize;
- (NSAttributedString)activityFooterText;
- (NSString)activityImageUTI;
- (NSString)activityTitle;
- (NSString)activityType;
- (NSString)fallbackActivityType;
- (NSString)overrideActivityTitle;
- (NSString)positionBeforeActivityType;
- (NSString)systemImageName;
- (NSUUID)activityUUID;
- (NSUUID)hostActivityUUID;
- (SUIHostActivityProxy)initWithAttributesFromActivityConfiguration:(id)a3;
- (UIActivity)activity;
- (UIColor)activityStatusTintColor;
- (UIImage)actionImage;
- (UIImage)activityImage;
- (UIImage)activitySettingsImage;
- (UIImage)activityStatusImage;
- (UISUIActivityConfiguration)activityConfiguration;
- (id)_actionImage;
- (id)_activityFooterText;
- (id)_activityImage;
- (id)_activityImageUTI;
- (id)_activitySettingsImage;
- (id)_activityStatusImage;
- (id)_activityStatusTintColor;
- (id)_activityTypeUsingFallbackActivityTypeIfNecessary;
- (id)_beforeActivity;
- (id)_systemImageName;
- (id)debugDescription;
- (int64_t)_defaultSortGroup;
- (int64_t)defaultSortGroup;
- (int64_t)userInterfaceStyle;
- (void)setActionImage:(id)a3;
- (void)setActivity:(id)a3;
- (void)setActivityConfiguration:(id)a3;
- (void)setActivityFooterText:(id)a3;
- (void)setActivityImage:(id)a3;
- (void)setActivityImageUTI:(id)a3;
- (void)setActivitySettingsImage:(id)a3;
- (void)setActivityStatusImage:(id)a3;
- (void)setActivityStatusTintColor:(id)a3;
- (void)setActivitySupportsPromiseURLs:(BOOL)a3;
- (void)setActivityTitle:(id)a3;
- (void)setActivityType:(id)a3;
- (void)setAppIsDocumentTypeOwner:(BOOL)a3;
- (void)setDefaultSortGroup:(int64_t)a3;
- (void)setFallbackActivityType:(id)a3;
- (void)setHostActivityUUID:(id)a3;
- (void)setIsBuiltinDerived:(BOOL)a3;
- (void)setOverrideActivityTitle:(id)a3;
- (void)setPositionBeforeActivityType:(id)a3;
- (void)setPreferredThumbnailSize:(CGSize)a3;
- (void)setShowsInSystemActionGroup:(BOOL)a3;
- (void)setSystemImageName:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setWantsOriginalImageColor:(BOOL)a3;
@end

@implementation SUIHostActivityProxy

+ (id)activitiesForConfigurations:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[SUIHostActivityProxy newWithActivityConfiguration:](SUIHostActivityProxy, "newWithActivityConfiguration:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)newWithActivityConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activity];
  if (v5)
  {
    uint64_t v6 = [v4 extension];
    uint64_t v7 = v4;
    if (!v6) {
      uint64_t v7 = objc_opt_class();
    }
    uint64_t v8 = [v7 activityCategory];
  }
  else
  {
    uint64_t v8 = [v4 activityCategory];
  }
  v9 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "activityProxyClassForActivityCategory:", v8)), "initWithAttributesFromActivityConfiguration:", v4);

  return v9;
}

+ (Class)activityProxyClassForActivityCategory:(int64_t)a3
{
  if ((unint64_t)a3 <= 1)
  {
    objc_opt_class();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)a1;
}

- (SUIHostActivityProxy)initWithAttributesFromActivityConfiguration:(id)a3
{
  id v5 = (UIActivity *)a3;
  v47.receiver = self;
  v47.super_class = (Class)SUIHostActivityProxy;
  uint64_t v6 = [(UIActivity *)&v47 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityConfiguration, a3);
    uint64_t v8 = [(UIActivity *)v5 activity];
    activity = v7->_activity;
    v7->_activity = (UIActivity *)v8;

    uint64_t v10 = [(UIActivity *)v5 activityUUID];
    hostActivityUUID = v7->_hostActivityUUID;
    v7->_hostActivityUUID = (NSUUID *)v10;

    v7->_appIsDocumentTypeOwner = [(UIActivity *)v5 appIsDocumentTypeOwner];
    long long v12 = v7->_activity;
    if (!v12) {
      long long v12 = v5;
    }
    long long v13 = [(UIActivity *)v12 activityType];
    objc_storeStrong((id *)&v7->_activityType, v13);

    if (v7->_activity) {
      [(id)objc_opt_class() _defaultFallbackActivityType];
    }
    else {
    long long v14 = [(UIActivity *)v5 fallbackActivityType];
    }
    objc_storeStrong((id *)&v7->_fallbackActivityType, v14);

    long long v15 = v7->_activity;
    if (v15) {
      uint64_t v16 = [(UIActivity *)v15 _defaultSortGroup];
    }
    else {
      uint64_t v16 = [(UIActivity *)v5 defaultSortGroup];
    }
    v7->_defaultSortGroup = v16;
    uint64_t v17 = v7->_activity;
    if (v17) {
      [(UIActivity *)v17 _beforeActivity];
    }
    else {
    v18 = [(UIActivity *)v5 positionBeforeActivityType];
    }
    objc_storeStrong((id *)&v7->_positionBeforeActivityType, v18);

    v19 = v7->_activity;
    if (v19) {
      [(UIActivity *)v19 _thumbnailSize];
    }
    else {
      [(UIActivity *)v5 preferredThumbnailSize];
    }
    v7->_preferredThumbnailSize.width = v20;
    v7->_preferredThumbnailSize.height = v21;
    v22 = v7->_activity;
    if (v22) {
      char v23 = [(UIActivity *)v22 _activitySupportsPromiseURLs];
    }
    else {
      char v23 = [(UIActivity *)v5 activitySupportsPromiseURLs];
    }
    v7->_activitySupportsPromiseURLs = v23;
    v24 = v7->_activity;
    if (!v24) {
      v24 = v5;
    }
    [(UIActivity *)v7 setIndexInApplicationDefinedActivities:[(UIActivity *)v24 indexInApplicationDefinedActivities]];
    v25 = [(UIActivity *)v5 overrideTitle];
    uint64_t v26 = [v25 copy];
    overrideActivityTitle = v7->_overrideActivityTitle;
    v7->_overrideActivityTitle = (NSString *)v26;

    v7->_wantsOriginalImageColor = [(UIActivity *)v5 wantsOriginalImageColor];
    v7->_isBuiltinDerived = [(UIActivity *)v5 isBuiltinDerived];
    v7->_showsInSystemActionGroup = [(UIActivity *)v5 showsInSystemActionGroup];
    uint64_t v28 = [(UIActivity *)v5 activityTitle];
    activityTitle = v7->_activityTitle;
    v7->_activityTitle = (NSString *)v28;

    uint64_t v30 = [(UIActivity *)v5 activityImage];
    activityImage = v7->_activityImage;
    v7->_activityImage = (UIImage *)v30;

    uint64_t v32 = [(UIActivity *)v5 activitySettingsImage];
    activitySettingsImage = v7->_activitySettingsImage;
    v7->_activitySettingsImage = (UIImage *)v32;

    uint64_t v34 = [(UIActivity *)v5 actionImage];
    actionImage = v7->_actionImage;
    v7->_actionImage = (UIImage *)v34;

    uint64_t v36 = [(UIActivity *)v5 systemImageName];
    systemImageName = v7->_systemImageName;
    v7->_systemImageName = (NSString *)v36;

    uint64_t v38 = [(UIActivity *)v5 activityImageUTI];
    activityImageUTI = v7->_activityImageUTI;
    v7->_activityImageUTI = (NSString *)v38;

    uint64_t v40 = [(UIActivity *)v5 _activityFooterText];
    activityFooterText = v7->_activityFooterText;
    v7->_activityFooterText = (NSAttributedString *)v40;

    uint64_t v42 = [(UIActivity *)v5 activityStatusImage];
    activityStatusImage = v7->_activityStatusImage;
    v7->_activityStatusImage = (UIImage *)v42;

    uint64_t v44 = [(UIActivity *)v5 activityStatusTintColor];
    activityStatusTintColor = v7->_activityStatusTintColor;
    v7->_activityStatusTintColor = (UIColor *)v44;
  }
  return v7;
}

- (NSUUID)activityUUID
{
  return self->_hostActivityUUID;
}

- (id)_activityTypeUsingFallbackActivityTypeIfNecessary
{
  activityType = self->_activityType;
  if (!activityType) {
    activityType = self->_fallbackActivityType;
  }
  return activityType;
}

- (id)_beforeActivity
{
  return self->_positionBeforeActivityType;
}

- (CGSize)_thumbnailSize
{
  double width = self->_preferredThumbnailSize.width;
  double height = self->_preferredThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)_activitySupportsPromiseURLs
{
  return self->_activitySupportsPromiseURLs;
}

- (int64_t)_defaultSortGroup
{
  return self->_defaultSortGroup;
}

- (BOOL)_appIsDocumentTypeOwner
{
  return self->_appIsDocumentTypeOwner;
}

- (BOOL)_isDisabled
{
  return [(UISUIActivityConfiguration *)self->_activityConfiguration isDisabled];
}

- (NSString)activityTitle
{
  uint64_t v3 = [(SUIHostActivityProxy *)self overrideActivityTitle];
  if (!v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activity];
    if (v4)
    {
      id v5 = [(SUIHostActivityProxy *)self activity];
      uint64_t v3 = [v5 activityTitle];
    }
    else
    {
      uint64_t v3 = self->_activityTitle;
    }
  }
  return v3;
}

- (id)_activityFooterText
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activityConfiguration];
    id v5 = [v4 extension];
    if (v5)
    {
      uint64_t v6 = self->_activityFooterText;
    }
    else
    {
      uint64_t v7 = [(SUIHostActivityProxy *)self activity];
      uint64_t v6 = [v7 _activityFooterText];
    }
  }
  else
  {
    uint64_t v6 = self->_activityFooterText;
  }

  return v6;
}

- (BOOL)_wantsOriginalImageColor
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activityConfiguration];
    id v5 = [v4 extension];
    if (v5)
    {
      int wantsOriginalImageColor = self->_wantsOriginalImageColor;
    }
    else
    {
      uint64_t v7 = [(SUIHostActivityProxy *)self activity];
      int wantsOriginalImageColor = [v7 _wantsOriginalImageColor];
    }
  }
  else
  {
    int wantsOriginalImageColor = self->_wantsOriginalImageColor;
  }

  return wantsOriginalImageColor != 0;
}

- (BOOL)_isBuiltinDerived
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activityConfiguration];
    id v5 = [v4 extension];
    if (v5)
    {
      int isBuiltinDerived = self->_isBuiltinDerived;
    }
    else
    {
      uint64_t v7 = [(SUIHostActivityProxy *)self activity];
      int isBuiltinDerived = [v7 _isBuiltinDerived];
    }
  }
  else
  {
    int isBuiltinDerived = self->_isBuiltinDerived;
  }

  return isBuiltinDerived != 0;
}

- (BOOL)_showsInSystemActionGroup
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activityConfiguration];
    id v5 = [v4 extension];
    if (v5)
    {
      int showsInSystemActionGroup = self->_showsInSystemActionGroup;
    }
    else
    {
      uint64_t v7 = [(SUIHostActivityProxy *)self activity];
      int showsInSystemActionGroup = [v7 _showsInSystemActionGroup];
    }
  }
  else
  {
    int showsInSystemActionGroup = self->_showsInSystemActionGroup;
  }

  return showsInSystemActionGroup != 0;
}

- (id)_activityStatusTintColor
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activityConfiguration];
    id v5 = [v4 extension];
    if (v5)
    {
      uint64_t v6 = self->_activityStatusTintColor;
    }
    else
    {
      uint64_t v7 = [(SUIHostActivityProxy *)self activity];
      uint64_t v6 = [v7 _activityStatusTintColor];
    }
  }
  else
  {
    uint64_t v6 = self->_activityStatusTintColor;
  }

  return v6;
}

- (UIImage)activityImage
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activity];
    id v5 = [v4 _activityImage];
  }
  else
  {
    id v5 = self->_activityImage;
  }

  return v5;
}

- (id)_actionImage
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activity];
    id v5 = [v4 _actionImage];
  }
  else
  {
    id v5 = self->_actionImage;
  }

  return v5;
}

- (id)_systemImageName
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activity];
    id v5 = [v4 _systemImageName];
  }
  else
  {
    id v5 = self->_systemImageName;
  }

  return v5;
}

- (id)_activityImageUTI
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activity];
    id v5 = [v4 _activityImageUTI];
  }
  else
  {
    id v5 = self->_activityImageUTI;
  }

  return v5;
}

- (id)_activitySettingsImage
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activity];
    id v5 = [v4 _activitySettingsImage];
  }
  else
  {
    id v5 = self->_activitySettingsImage;
  }

  return v5;
}

- (id)_activityStatusImage
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activity];
    id v5 = [v4 _activityStatusImage];
  }
  else
  {
    id v5 = self->_activityStatusImage;
  }

  return v5;
}

- (id)_activityImage
{
  uint64_t v3 = [(SUIHostActivityProxy *)self activity];
  if (v3)
  {
    id v4 = [(SUIHostActivityProxy *)self activity];
    id v5 = [v4 _activityImage];
  }
  else
  {
    id v5 = self->_activityImage;
  }

  return v5;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  id v4 = [(SUIHostActivityProxy *)self activity];
  [v4 setUserInterfaceStyle:a3];
}

- (int64_t)userInterfaceStyle
{
  v2 = [(SUIHostActivityProxy *)self activity];
  int64_t v3 = [v2 userInterfaceStyle];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (id)debugDescription
{
  int64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SUIHostActivityProxy;
  id v4 = [(UIActivity *)&v9 description];
  id v5 = [(SUIHostActivityProxy *)self _activityTypeUsingFallbackActivityTypeIfNecessary];
  uint64_t v6 = [(SUIHostActivityProxy *)self activityTitle];
  uint64_t v7 = [v3 stringWithFormat:@"%@ {type = %@, title = %@}", v4, v5, v6];

  return v7;
}

- (void)setActivityTitle:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (void)setActivityImage:(id)a3
{
}

- (UIImage)activitySettingsImage
{
  return self->_activitySettingsImage;
}

- (void)setActivitySettingsImage:(id)a3
{
}

- (UISUIActivityConfiguration)activityConfiguration
{
  return self->_activityConfiguration;
}

- (void)setActivityConfiguration:(id)a3
{
}

- (NSUUID)hostActivityUUID
{
  return self->_hostActivityUUID;
}

- (void)setHostActivityUUID:(id)a3
{
}

- (NSString)overrideActivityTitle
{
  return self->_overrideActivityTitle;
}

- (void)setOverrideActivityTitle:(id)a3
{
}

- (NSString)fallbackActivityType
{
  return self->_fallbackActivityType;
}

- (void)setFallbackActivityType:(id)a3
{
}

- (CGSize)preferredThumbnailSize
{
  double width = self->_preferredThumbnailSize.width;
  double height = self->_preferredThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredThumbnailSize:(CGSize)a3
{
  self->_preferredThumbnailSize = a3;
}

- (NSString)positionBeforeActivityType
{
  return self->_positionBeforeActivityType;
}

- (void)setPositionBeforeActivityType:(id)a3
{
}

- (BOOL)activitySupportsPromiseURLs
{
  return self->_activitySupportsPromiseURLs;
}

- (void)setActivitySupportsPromiseURLs:(BOOL)a3
{
  self->_activitySupportsPromiseURLs = a3;
}

- (int64_t)defaultSortGroup
{
  return self->_defaultSortGroup;
}

- (void)setDefaultSortGroup:(int64_t)a3
{
  self->_defaultSortGroup = a3;
}

- (BOOL)appIsDocumentTypeOwner
{
  return self->_appIsDocumentTypeOwner;
}

- (void)setAppIsDocumentTypeOwner:(BOOL)a3
{
  self->_appIsDocumentTypeOwner = a3;
}

- (BOOL)wantsOriginalImageColor
{
  return self->_wantsOriginalImageColor;
}

- (void)setWantsOriginalImageColor:(BOOL)a3
{
  self->_int wantsOriginalImageColor = a3;
}

- (BOOL)isBuiltinDerived
{
  return self->_isBuiltinDerived;
}

- (void)setIsBuiltinDerived:(BOOL)a3
{
  self->_int isBuiltinDerived = a3;
}

- (BOOL)showsInSystemActionGroup
{
  return self->_showsInSystemActionGroup;
}

- (void)setShowsInSystemActionGroup:(BOOL)a3
{
  self->_int showsInSystemActionGroup = a3;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (UIImage)actionImage
{
  return self->_actionImage;
}

- (void)setActionImage:(id)a3
{
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
}

- (NSString)activityImageUTI
{
  return self->_activityImageUTI;
}

- (void)setActivityImageUTI:(id)a3
{
}

- (NSAttributedString)activityFooterText
{
  return self->_activityFooterText;
}

- (void)setActivityFooterText:(id)a3
{
}

- (UIImage)activityStatusImage
{
  return self->_activityStatusImage;
}

- (void)setActivityStatusImage:(id)a3
{
}

- (UIColor)activityStatusTintColor
{
  return self->_activityStatusTintColor;
}

- (void)setActivityStatusTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityStatusTintColor, 0);
  objc_storeStrong((id *)&self->_activityStatusImage, 0);
  objc_storeStrong((id *)&self->_activityFooterText, 0);
  objc_storeStrong((id *)&self->_activityImageUTI, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_positionBeforeActivityType, 0);
  objc_storeStrong((id *)&self->_fallbackActivityType, 0);
  objc_storeStrong((id *)&self->_overrideActivityTitle, 0);
  objc_storeStrong((id *)&self->_hostActivityUUID, 0);
  objc_storeStrong((id *)&self->_activityConfiguration, 0);
  objc_storeStrong((id *)&self->_activitySettingsImage, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
}

@end