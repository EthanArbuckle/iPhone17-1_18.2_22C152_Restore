@interface UISUIActivityConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)configurationForActivity:(id)a3 forRemoteUIService:(BOOL)a4;
- (BOOL)activitySupportsPromiseURLs;
- (BOOL)appIsDocumentTypeOwner;
- (BOOL)isBuiltinDerived;
- (BOOL)isCapabilityBasedActivity;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsInSystemActionGroup;
- (BOOL)wantsOriginalImageColor;
- (CGSize)preferredThumbnailSize;
- (NSAttributedString)_activityFooterText;
- (NSExtension)extension;
- (NSString)activityClassName;
- (NSString)activityImageUTI;
- (NSString)activityTitle;
- (NSString)activityType;
- (NSString)defaultActivityTitle;
- (NSString)extensionIdentifier;
- (NSString)fallbackActivityType;
- (NSString)overrideTitle;
- (NSString)positionBeforeActivityType;
- (NSString)systemImageName;
- (NSUUID)activityUUID;
- (UIActivity)activity;
- (UIColor)activityStatusTintColor;
- (UIImage)actionImage;
- (UIImage)activityImage;
- (UIImage)activitySettingsImage;
- (UIImage)activityStatusImage;
- (UISUIActivityConfiguration)initWithActivity:(id)a3 encodingType:(int64_t)a4 forRemoteUIService:(BOOL)a5;
- (UISUIActivityConfiguration)initWithBSXPCCoder:(id)a3;
- (UISUIActivityConfiguration)initWithCoder:(id)a3;
- (id)_init;
- (int64_t)activityCategory;
- (int64_t)defaultSortGroup;
- (int64_t)encodingType;
- (unint64_t)indexInApplicationDefinedActivities;
- (void)_collectPropertiesFromAttributesOfUnderlyingActivity:(id)a3 forRemoteUIService:(BOOL)a4;
- (void)_decodeBasicPropertiesWithCoder:(id)a3;
- (void)_decodeForEncodingByClassNameWithCoder:(id)a3;
- (void)_decodeForEncodingByPropertiesWithCoder:(id)a3;
- (void)_encodeBasicPropertiesWithCoder:(id)a3;
- (void)_encodeByClassNameWithCoder:(id)a3;
- (void)_encodeByPropertiesWithCoder:(id)a3;
- (void)_validateProperties;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(id)a3;
- (void)setActivityClassName:(id)a3;
- (void)setEncodingType:(int64_t)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setIsCapabilityBasedActivity:(BOOL)a3;
- (void)setOverrideTitle:(id)a3;
- (void)set_activityFooterText:(id)a3;
- (void)updateConfigurationWithOverrideTitle:(id)a3;
@end

@implementation UISUIActivityConfiguration

+ (id)configurationForActivity:(id)a3 forRemoteUIService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = ~[(id)objc_opt_class() _xpcAttributes] & 3;
  v8 = share_sheet_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      +[UISUIActivityConfiguration configurationForActivity:forRemoteUIService:]((uint64_t)v6, v8);
    }
    uint64_t v10 = 2;
  }
  else
  {
    if (v9) {
      +[UISUIActivityConfiguration configurationForActivity:forRemoteUIService:]((uint64_t)v6, v8);
    }
    uint64_t v10 = 1;
  }

  v11 = (void *)[objc_alloc((Class)a1) initWithActivity:v6 encodingType:v10 forRemoteUIService:v4];
  return v11;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UISUIActivityConfiguration;
  return [(UISUIActivityConfiguration *)&v3 init];
}

- (UISUIActivityConfiguration)initWithActivity:(id)a3 encodingType:(int64_t)a4 forRemoteUIService:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UISUIActivityConfiguration;
  BOOL v9 = [(UISUIActivityConfiguration *)&v16 init];
  if (v9)
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    activityClassName = v9->_activityClassName;
    v9->_activityClassName = (NSString *)v11;

    v9->_encodingType = a4;
    uint64_t v13 = [v8 activityUUID];
    activityUUID = v9->_activityUUID;
    v9->_activityUUID = (NSUUID *)v13;

    v9->_appIsDocumentTypeOwner = [v8 _appIsDocumentTypeOwner];
    v9->_isCapabilityBasedActivity = [(id)objc_opt_class() _isCapabilityBasedActivity];
    v9->_isDisabled = [v8 _isDisabled];
    if (a4 == 2) {
      [(UISUIActivityConfiguration *)v9 _collectPropertiesFromAttributesOfUnderlyingActivity:v8 forRemoteUIService:v5];
    }
  }

  return v9;
}

- (void)updateConfigurationWithOverrideTitle:(id)a3
{
}

- (NSString)activityTitle
{
  overrideTitle = self->_overrideTitle;
  if (!overrideTitle) {
    overrideTitle = self->_defaultActivityTitle;
  }
  return overrideTitle;
}

- (NSExtension)extension
{
  objc_super v3 = [(UISUIActivityConfiguration *)self extensionIdentifier];
  if (v3)
  {
    BOOL v4 = [(UISUIActivityConfiguration *)self activity];
    BOOL v5 = [v4 applicationExtension];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSExtension *)v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (UISUIActivityConfiguration *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      id v6 = [(UISUIActivityConfiguration *)self activityUUID];
      uint64_t v7 = [(UISUIActivityConfiguration *)v5 activityUUID];
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = v9;
      if (v8 == v9)
      {
        char v11 = 1;
      }
      else if ((v8 == 0) == (v9 != 0))
      {
        char v11 = 0;
      }
      else
      {
        char v11 = [v8 isEqual:v9];
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  -[UISUIActivityConfiguration _encodeBasicPropertiesWithCoder:](self, "_encodeBasicPropertiesWithCoder:");
  int64_t encodingType = self->_encodingType;
  if (encodingType == 2)
  {
    [(UISUIActivityConfiguration *)self _encodeByPropertiesWithCoder:v5];
  }
  else if (encodingType == 1)
  {
    [(UISUIActivityConfiguration *)self _encodeByClassNameWithCoder:v5];
  }
}

- (UISUIActivityConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UISUIActivityConfiguration *)self _init];
  id v6 = v5;
  if (v5)
  {
    [(UISUIActivityConfiguration *)v5 _decodeBasicPropertiesWithCoder:v4];
    int64_t encodingType = v6->_encodingType;
    if (encodingType == 2)
    {
      [(UISUIActivityConfiguration *)v6 _decodeForEncodingByPropertiesWithCoder:v4];
    }
    else if (encodingType == 1)
    {
      [(UISUIActivityConfiguration *)v6 _decodeForEncodingByClassNameWithCoder:v4];
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUIActivityConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UISUIActivityConfiguration *)self _init];
  id v6 = v5;
  if (v5)
  {
    [(UISUIActivityConfiguration *)v5 _decodeBasicPropertiesWithCoder:v4];
    int64_t encodingType = v6->_encodingType;
    if (encodingType == 2)
    {
      [(UISUIActivityConfiguration *)v6 _decodeForEncodingByPropertiesWithCoder:v4];
    }
    else if (encodingType == 1)
    {
      [(UISUIActivityConfiguration *)v6 _decodeForEncodingByClassNameWithCoder:v4];
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  -[UISUIActivityConfiguration _encodeBasicPropertiesWithCoder:](self, "_encodeBasicPropertiesWithCoder:");
  int64_t encodingType = self->_encodingType;
  if (encodingType == 2)
  {
    [(UISUIActivityConfiguration *)self _encodeByPropertiesWithCoder:v5];
  }
  else if (encodingType == 1)
  {
    [(UISUIActivityConfiguration *)self _encodeByClassNameWithCoder:v5];
  }
}

- (void)_encodeBasicPropertiesWithCoder:(id)a3
{
  id v17 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int64_t encodingType = self->_encodingType;
  id v6 = NSStringFromSelector(sel_encodingType);
  if (isKindOfClass) {
    [v17 encodeInt64:encodingType forKey:v6];
  }
  else {
    [v17 encodeInteger:encodingType forKey:v6];
  }

  activityUUID = self->_activityUUID;
  id v8 = NSStringFromSelector(sel_activityUUID);
  [v17 encodeObject:activityUUID forKey:v8];

  BOOL appIsDocumentTypeOwner = self->_appIsDocumentTypeOwner;
  uint64_t v10 = NSStringFromSelector(sel_appIsDocumentTypeOwner);
  [v17 encodeBool:appIsDocumentTypeOwner forKey:v10];

  overrideTitle = self->_overrideTitle;
  if (overrideTitle)
  {
    v12 = NSStringFromSelector(sel_overrideTitle);
    [v17 encodeObject:overrideTitle forKey:v12];
  }
  BOOL isCapabilityBasedActivity = self->_isCapabilityBasedActivity;
  v14 = NSStringFromSelector(sel_isCapabilityBasedActivity);
  [v17 encodeBool:isCapabilityBasedActivity forKey:v14];

  BOOL isDisabled = self->_isDisabled;
  objc_super v16 = NSStringFromSelector(sel_isDisabled);
  [v17 encodeBool:isDisabled forKey:v16];
}

- (void)_encodeByClassNameWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(UISUIActivityConfiguration *)self activityClassName];
  id v5 = NSStringFromSelector(sel_activityClassName);
  [v4 encodeObject:v6 forKey:v5];
}

- (void)_encodeByPropertiesWithCoder:(id)a3
{
  id v50 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int64_t activityCategory = self->_activityCategory;
  id v6 = NSStringFromSelector(sel_activityCategory);
  if (isKindOfClass)
  {
    [v50 encodeInt64:activityCategory forKey:v6];

    int64_t defaultSortGroup = self->_defaultSortGroup;
    id v8 = NSStringFromSelector(sel_defaultSortGroup);
    [v50 encodeInt64:defaultSortGroup forKey:v8];

    unint64_t indexInApplicationDefinedActivities = self->_indexInApplicationDefinedActivities;
    uint64_t v10 = NSStringFromSelector(sel_indexInApplicationDefinedActivities);
    [v50 encodeInt64:indexInApplicationDefinedActivities forKey:v10];
  }
  else
  {
    [v50 encodeInteger:activityCategory forKey:v6];

    int64_t v11 = self->_defaultSortGroup;
    v12 = NSStringFromSelector(sel_defaultSortGroup);
    [v50 encodeInteger:v11 forKey:v12];

    unint64_t v13 = self->_indexInApplicationDefinedActivities;
    uint64_t v10 = NSStringFromSelector(sel_indexInApplicationDefinedActivities);
    [v50 encodeInteger:v13 forKey:v10];
  }

  defaultActivityTitle = self->_defaultActivityTitle;
  v15 = NSStringFromSelector(sel_activityTitle);
  [v50 encodeObject:defaultActivityTitle forKey:v15];

  activityType = self->_activityType;
  id v17 = NSStringFromSelector(sel_activityType);
  [v50 encodeObject:activityType forKey:v17];

  fallbackActivityType = self->_fallbackActivityType;
  v19 = NSStringFromSelector(sel_fallbackActivityType);
  [v50 encodeObject:fallbackActivityType forKey:v19];

  positionBeforeActivityType = self->_positionBeforeActivityType;
  v21 = NSStringFromSelector(sel_positionBeforeActivityType);
  [v50 encodeObject:positionBeforeActivityType forKey:v21];

  BOOL activitySupportsPromiseURLs = self->_activitySupportsPromiseURLs;
  v23 = NSStringFromSelector(sel_activitySupportsPromiseURLs);
  [v50 encodeBool:activitySupportsPromiseURLs forKey:v23];

  BOOL wantsOriginalImageColor = self->_wantsOriginalImageColor;
  v25 = NSStringFromSelector(sel_wantsOriginalImageColor);
  [v50 encodeBool:wantsOriginalImageColor forKey:v25];

  BOOL isBuiltinDerived = self->_isBuiltinDerived;
  v27 = NSStringFromSelector(sel_isBuiltinDerived);
  [v50 encodeBool:isBuiltinDerived forKey:v27];

  BOOL showsInSystemActionGroup = self->_showsInSystemActionGroup;
  v29 = NSStringFromSelector(sel_showsInSystemActionGroup);
  [v50 encodeBool:showsInSystemActionGroup forKey:v29];

  if (self->_preferredThumbnailSize.width != *MEMORY[0x1E4F1DB30]
    || self->_preferredThumbnailSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
    [v50 encodeObject:v30 forKey:@"preferredThumbnailSizeValue"];
  }
  extensionIdentifier = self->_extensionIdentifier;
  if (extensionIdentifier)
  {
    v32 = NSStringFromSelector(sel_extensionIdentifier);
    [v50 encodeObject:extensionIdentifier forKey:v32];
  }
  activityImage = self->_activityImage;
  if (activityImage)
  {
    v34 = NSStringFromSelector(sel_activityImage);
    [v50 encodeObject:activityImage forKey:v34];
  }
  actionImage = self->_actionImage;
  if (actionImage)
  {
    v36 = NSStringFromSelector(sel_actionImage);
    [v50 encodeObject:actionImage forKey:v36];
  }
  activitySettingsImage = self->_activitySettingsImage;
  if (activitySettingsImage)
  {
    v38 = NSStringFromSelector(sel_activitySettingsImage);
    [v50 encodeObject:activitySettingsImage forKey:v38];
  }
  systemImageName = self->_systemImageName;
  if (systemImageName)
  {
    v40 = NSStringFromSelector(sel_systemImageName);
    [v50 encodeObject:systemImageName forKey:v40];
  }
  activityImageUTI = self->_activityImageUTI;
  if (activityImageUTI)
  {
    v42 = NSStringFromSelector(sel_activityImageUTI);
    [v50 encodeObject:activityImageUTI forKey:v42];
  }
  activityFooterText = self->__activityFooterText;
  if (activityFooterText)
  {
    v44 = NSStringFromSelector(sel__activityFooterText);
    [v50 encodeObject:activityFooterText forKey:v44];
  }
  activityStatusImage = self->_activityStatusImage;
  if (activityStatusImage)
  {
    v46 = NSStringFromSelector(sel_activityStatusImage);
    [v50 encodeObject:activityStatusImage forKey:v46];
  }
  activityStatusTintColor = self->_activityStatusTintColor;
  v48 = v50;
  if (activityStatusTintColor)
  {
    v49 = NSStringFromSelector(sel_activityStatusTintColor);
    [v50 encodeObject:activityStatusTintColor forKey:v49];

    v48 = v50;
  }
}

- (void)_decodeBasicPropertiesWithCoder:(id)a3
{
  id v18 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = NSStringFromSelector(sel_encodingType);
  if (isKindOfClass) {
    int64_t v6 = [v18 decodeInt64ForKey:v5];
  }
  else {
    int64_t v6 = [v18 decodeIntegerForKey:v5];
  }
  self->_int64_t encodingType = v6;

  uint64_t v7 = objc_opt_class();
  id v8 = NSStringFromSelector(sel_activityUUID);
  id v9 = [v18 decodeObjectOfClass:v7 forKey:v8];
  activityUUID = self->_activityUUID;
  self->_activityUUID = v9;

  int64_t v11 = NSStringFromSelector(sel_appIsDocumentTypeOwner);
  self->_BOOL appIsDocumentTypeOwner = [v18 decodeBoolForKey:v11];

  uint64_t v12 = objc_opt_class();
  unint64_t v13 = NSStringFromSelector(sel_overrideTitle);
  v14 = [v18 decodeObjectOfClass:v12 forKey:v13];
  overrideTitle = self->_overrideTitle;
  self->_overrideTitle = v14;

  objc_super v16 = NSStringFromSelector(sel_isCapabilityBasedActivity);
  self->_BOOL isCapabilityBasedActivity = [v18 decodeBoolForKey:v16];

  id v17 = NSStringFromSelector(sel_isDisabled);
  self->_BOOL isDisabled = [v18 decodeBoolForKey:v17];
}

- (void)_decodeForEncodingByClassNameWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  int64_t v6 = NSStringFromSelector(sel_activityClassName);
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  activityClassName = self->_activityClassName;
  self->_activityClassName = v7;

  NSClassFromString(self->_activityClassName);
  id v9 = (UIActivity *)objc_opt_new();
  activity = self->_activity;
  self->_activity = v9;
  MEMORY[0x1F41817F8](v9, activity);
}

- (void)_decodeForEncodingByPropertiesWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int64_t v6 = NSStringFromSelector(sel_activityCategory);
  if (isKindOfClass)
  {
    self->_int64_t activityCategory = [v4 decodeInt64ForKey:v6];

    uint64_t v7 = NSStringFromSelector(sel_defaultSortGroup);
    self->_int64_t defaultSortGroup = [v4 decodeInt64ForKey:v7];

    id v8 = NSStringFromSelector(sel_indexInApplicationDefinedActivities);
    unint64_t v9 = [v4 decodeInt64ForKey:v8];
  }
  else
  {
    self->_int64_t activityCategory = [v4 decodeIntegerForKey:v6];

    uint64_t v10 = NSStringFromSelector(sel_defaultSortGroup);
    self->_int64_t defaultSortGroup = [v4 decodeIntegerForKey:v10];

    id v8 = NSStringFromSelector(sel_indexInApplicationDefinedActivities);
    unint64_t v9 = [v4 decodeIntegerForKey:v8];
  }
  self->_unint64_t indexInApplicationDefinedActivities = v9;

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = NSStringFromSelector(sel_activityTitle);
  unint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
  defaultActivityTitle = self->_defaultActivityTitle;
  self->_defaultActivityTitle = v13;

  uint64_t v15 = objc_opt_class();
  objc_super v16 = NSStringFromSelector(sel_activityType);
  id v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
  activityType = self->_activityType;
  self->_activityType = v17;

  uint64_t v19 = objc_opt_class();
  v20 = NSStringFromSelector(sel_fallbackActivityType);
  v21 = [v4 decodeObjectOfClass:v19 forKey:v20];
  fallbackActivityType = self->_fallbackActivityType;
  self->_fallbackActivityType = v21;

  uint64_t v23 = objc_opt_class();
  v24 = NSStringFromSelector(sel_positionBeforeActivityType);
  v25 = [v4 decodeObjectOfClass:v23 forKey:v24];
  positionBeforeActivityType = self->_positionBeforeActivityType;
  self->_positionBeforeActivityType = v25;

  v27 = NSStringFromSelector(sel_activitySupportsPromiseURLs);
  self->_BOOL activitySupportsPromiseURLs = [v4 decodeBoolForKey:v27];

  v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredThumbnailSizeValue"];
  v29 = v28;
  if (v28)
  {
    [v28 CGSizeValue];
    self->_preferredThumbnailSize.width = v30;
    self->_preferredThumbnailSize.height = v31;
  }
  v32 = NSStringFromSelector(sel_wantsOriginalImageColor);
  self->_BOOL wantsOriginalImageColor = [v4 decodeBoolForKey:v32];

  v33 = NSStringFromSelector(sel_isBuiltinDerived);
  self->_BOOL isBuiltinDerived = [v4 decodeBoolForKey:v33];

  v34 = NSStringFromSelector(sel_showsInSystemActionGroup);
  self->_BOOL showsInSystemActionGroup = [v4 decodeBoolForKey:v34];

  uint64_t v35 = objc_opt_class();
  v36 = NSStringFromSelector(sel_activityImage);
  v37 = [v4 decodeObjectOfClass:v35 forKey:v36];
  activityImage = self->_activityImage;
  self->_activityImage = v37;

  uint64_t v39 = objc_opt_class();
  v40 = NSStringFromSelector(sel_actionImage);
  v41 = [v4 decodeObjectOfClass:v39 forKey:v40];
  actionImage = self->_actionImage;
  self->_actionImage = v41;

  uint64_t v43 = objc_opt_class();
  v44 = NSStringFromSelector(sel_activitySettingsImage);
  v45 = [v4 decodeObjectOfClass:v43 forKey:v44];
  activitySettingsImage = self->_activitySettingsImage;
  self->_activitySettingsImage = v45;

  uint64_t v47 = objc_opt_class();
  v48 = NSStringFromSelector(sel_systemImageName);
  v49 = [v4 decodeObjectOfClass:v47 forKey:v48];
  systemImageName = self->_systemImageName;
  self->_systemImageName = v49;

  uint64_t v51 = objc_opt_class();
  v52 = NSStringFromSelector(sel_activityImageUTI);
  v53 = [v4 decodeObjectOfClass:v51 forKey:v52];
  activityImageUTI = self->_activityImageUTI;
  self->_activityImageUTI = v53;

  uint64_t v55 = objc_opt_class();
  v56 = NSStringFromSelector(sel__activityFooterText);
  v57 = [v4 decodeObjectOfClass:v55 forKey:v56];
  activityFooterText = self->__activityFooterText;
  self->__activityFooterText = v57;

  uint64_t v59 = objc_opt_class();
  v60 = NSStringFromSelector(sel_activityStatusImage);
  v61 = [v4 decodeObjectOfClass:v59 forKey:v60];
  activityStatusImage = self->_activityStatusImage;
  self->_activityStatusImage = v61;

  uint64_t v63 = objc_opt_class();
  v64 = NSStringFromSelector(sel_activityStatusTintColor);
  v65 = [v4 decodeObjectOfClass:v63 forKey:v64];
  activityStatusTintColor = self->_activityStatusTintColor;
  self->_activityStatusTintColor = v65;

  uint64_t v67 = objc_opt_class();
  v68 = NSStringFromSelector(sel_extensionIdentifier);
  v69 = [v4 decodeObjectOfClass:v67 forKey:v68];
  extensionIdentifier = self->_extensionIdentifier;
  self->_extensionIdentifier = v69;

  v71 = self->_extensionIdentifier;
  if (v71)
  {
    id v77 = 0;
    v72 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v71 error:&v77];
    id v73 = v77;
    if (v72)
    {
      v74 = [[UIApplicationExtensionActivity alloc] initWithApplicationExtension:v72];
      v75 = [NSNumber numberWithInteger:self->_activityCategory];
      [(UIApplicationExtensionActivity *)v74 setOverrideActivityCategory:v75];

      p_super = &self->_activity->super;
      self->_activity = &v74->super;
    }
    else
    {
      p_super = share_sheet_log();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        [(UISUIActivityConfiguration *)(uint64_t *)&self->_extensionIdentifier _decodeForEncodingByPropertiesWithCoder:p_super];
      }
    }
  }
}

- (void)_collectPropertiesFromAttributesOfUnderlyingActivity:(id)a3 forRemoteUIService:(BOOL)a4
{
  BOOL v4 = a4;
  id v35 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  self->_int64_t activityCategory = [(id)objc_opt_class() activityCategory];
  if (isKindOfClass)
  {
    defaultActivityTitle = self->_defaultActivityTitle;
    self->_defaultActivityTitle = 0;
  }
  else
  {
    id v8 = [v35 activityTitle];
    defaultActivityTitle = self->_defaultActivityTitle;
    self->_defaultActivityTitle = v8;
  }

  unint64_t v9 = [v35 activityType];
  activityType = self->_activityType;
  self->_activityType = v9;

  uint64_t v11 = [(id)objc_opt_class() _defaultFallbackActivityType];
  fallbackActivityType = self->_fallbackActivityType;
  self->_fallbackActivityType = v11;

  unint64_t v13 = [v35 _beforeActivity];
  positionBeforeActivityType = self->_positionBeforeActivityType;
  self->_positionBeforeActivityType = v13;

  self->_BOOL activitySupportsPromiseURLs = [v35 _activitySupportsPromiseURLs];
  [v35 _thumbnailSize];
  self->_preferredThumbnailSize.width = v15;
  self->_preferredThumbnailSize.height = v16;
  self->_int64_t defaultSortGroup = [v35 _defaultSortGroup];
  self->_unint64_t indexInApplicationDefinedActivities = [v35 indexInApplicationDefinedActivities];
  id v17 = [v35 _activityFooterText];
  activityFooterText = self->__activityFooterText;
  self->__activityFooterText = v17;

  if (v4 && _os_feature_enabled_impl())
  {
    self->_BOOL wantsOriginalImageColor = [v35 _wantsOriginalImageColor];
    self->_BOOL isBuiltinDerived = [v35 _isBuiltinDerived];
    self->_BOOL showsInSystemActionGroup = [v35 _showsInSystemActionGroup];
    uint64_t v19 = [v35 _activityStatusTintColor];
    activityStatusTintColor = self->_activityStatusTintColor;
    self->_activityStatusTintColor = v19;

    if (isKindOfClass)
    {
      activityStatusImage = [v35 applicationExtension];
      v22 = [activityStatusImage identifier];
      extensionIdentifier = self->_extensionIdentifier;
      self->_extensionIdentifier = v22;
    }
    else
    {
      v24 = [v35 _activityImage];
      activityImage = self->_activityImage;
      self->_activityImage = v24;

      v26 = [v35 _actionImage];
      actionImage = self->_actionImage;
      self->_actionImage = v26;

      v28 = [v35 _activitySettingsImage];
      activitySettingsImage = self->_activitySettingsImage;
      self->_activitySettingsImage = v28;

      CGFloat v30 = [v35 _systemImageName];
      systemImageName = self->_systemImageName;
      self->_systemImageName = v30;

      v32 = [v35 _activityImageUTI];
      activityImageUTI = self->_activityImageUTI;
      self->_activityImageUTI = v32;

      v34 = [v35 _activityStatusImage];
      activityStatusImage = self->_activityStatusImage;
      self->_activityStatusImage = v34;
    }
  }
  [(UISUIActivityConfiguration *)self _validateProperties];
}

- (void)_validateProperties
{
  if (![(NSString *)self->_defaultActivityTitle length])
  {
    defaultActivityTitle = self->_defaultActivityTitle;
    self->_defaultActivityTitle = (NSString *)@" ";
  }
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSString)fallbackActivityType
{
  return self->_fallbackActivityType;
}

- (CGSize)preferredThumbnailSize
{
  double width = self->_preferredThumbnailSize.width;
  double height = self->_preferredThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)activitySupportsPromiseURLs
{
  return self->_activitySupportsPromiseURLs;
}

- (int64_t)defaultSortGroup
{
  return self->_defaultSortGroup;
}

- (BOOL)appIsDocumentTypeOwner
{
  return self->_appIsDocumentTypeOwner;
}

- (unint64_t)indexInApplicationDefinedActivities
{
  return self->_indexInApplicationDefinedActivities;
}

- (BOOL)isCapabilityBasedActivity
{
  return self->_isCapabilityBasedActivity;
}

- (void)setIsCapabilityBasedActivity:(BOOL)a3
{
  self->_BOOL isCapabilityBasedActivity = a3;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (BOOL)wantsOriginalImageColor
{
  return self->_wantsOriginalImageColor;
}

- (BOOL)isBuiltinDerived
{
  return self->_isBuiltinDerived;
}

- (BOOL)showsInSystemActionGroup
{
  return self->_showsInSystemActionGroup;
}

- (UIImage)activityImage
{
  return self->_activityImage;
}

- (UIImage)actionImage
{
  return self->_actionImage;
}

- (UIImage)activitySettingsImage
{
  return self->_activitySettingsImage;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (UIImage)activityStatusImage
{
  return self->_activityStatusImage;
}

- (UIColor)activityStatusTintColor
{
  return self->_activityStatusTintColor;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)activityImageUTI
{
  return self->_activityImageUTI;
}

- (NSAttributedString)_activityFooterText
{
  return self->__activityFooterText;
}

- (void)set_activityFooterText:(id)a3
{
}

- (NSString)overrideTitle
{
  return self->_overrideTitle;
}

- (void)setOverrideTitle:(id)a3
{
}

- (NSString)defaultActivityTitle
{
  return self->_defaultActivityTitle;
}

- (NSString)positionBeforeActivityType
{
  return self->_positionBeforeActivityType;
}

- (NSString)activityClassName
{
  return self->_activityClassName;
}

- (void)setActivityClassName:(id)a3
{
}

- (int64_t)encodingType
{
  return self->_encodingType;
}

- (void)setEncodingType:(int64_t)a3
{
  self->_int64_t encodingType = a3;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_activityClassName, 0);
  objc_storeStrong((id *)&self->_positionBeforeActivityType, 0);
  objc_storeStrong((id *)&self->_defaultActivityTitle, 0);
  objc_storeStrong((id *)&self->_overrideTitle, 0);
  objc_storeStrong((id *)&self->__activityFooterText, 0);
  objc_storeStrong((id *)&self->_activityImageUTI, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_activityStatusTintColor, 0);
  objc_storeStrong((id *)&self->_activityStatusImage, 0);
  objc_storeStrong((id *)&self->_activitySettingsImage, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_fallbackActivityType, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

+ (void)configurationForActivity:(uint64_t)a1 forRemoteUIService:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_DEBUG, "configurationForActivity:%@ encodingType:UISUIActivityConfigurationEncodingByClassName", (uint8_t *)&v2, 0xCu);
}

+ (void)configurationForActivity:(uint64_t)a1 forRemoteUIService:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_DEBUG, "configurationForActivity:%@ encodingType:UISUIActivityConfigurationEncodingByProperties", (uint8_t *)&v2, 0xCu);
}

- (void)_decodeForEncodingByPropertiesWithCoder:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "failure retrieving extension for identifier:%@ error:%@", (uint8_t *)&v4, 0x16u);
}

@end