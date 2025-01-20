@interface WFWidgetConfigurationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isWidgetExtensionInformationLoaded;
- (BOOL)usesWidgetAccentColor;
- (CGRect)initialCardFrame;
- (CGSize)defaultCardSize;
- (INIntent)intent;
- (INIntent)remoteLocalizedIntent;
- (NSSecurityScopedURLWrapper)intentLocalizationTableBundleURL;
- (NSSecurityScopedURLWrapper)widgetBundleScopedURL;
- (NSString)appBundleIdentifier;
- (NSString)bundleIdentifier;
- (NSString)fallbackDisplayName;
- (NSString)remoteAppLocalizedName;
- (NSString)remoteDeviceIdentifier;
- (NSString)remoteLanguageCode;
- (NSString)widgetDescription;
- (NSString)widgetDisplayName;
- (UIColor)widgetPrimaryColor;
- (UIColor)widgetTintColor;
- (WFImage)remoteAppIcon;
- (WFWidgetConfigurationRequest)initWithCoder:(id)a3;
- (WFWidgetConfigurationRequest)initWithIntent:(id)a3 bundleIdentifier:(id)a4 intentLocalizationTableBundleURL:(id)a5 widgetBundleScopedURL:(id)a6 family:(int64_t)a7 widgetConfigurationStyle:(unint64_t)a8 widgetConfigurationType:(unint64_t)a9 defaultCardSize:(CGSize)a10 initialCardFrame:(CGRect)a11 widgetDisplayName:(id)a12 widgetDescription:(id)a13 usesWidgetAccentColor:(BOOL)a14 remoteDeviceIdentifier:(id)a15 remoteAppLocalizedName:(id)a16 remoteAppIcon:(id)a17;
- (WFWidgetConfigurationRequest)initWithIntent:(id)a3 bundleIdentifier:(id)a4 intentLocalizationTableBundleURL:(id)a5 widgetBundleScopedURL:(id)a6 family:(int64_t)a7 widgetConfigurationStyle:(unint64_t)a8 widgetConfigurationType:(unint64_t)a9 defaultCardSize:(CGSize)a10 initialCardFrame:(CGRect)a11 widgetDisplayName:(id)a12 widgetDescription:(id)a13 widgetPrimaryColor:(id)a14 widgetTintColor:(id)a15 usesWidgetAccentColor:(BOOL)a16 remoteDeviceIdentifier:(id)a17 remoteAppLocalizedName:(id)a18 remoteAppIcon:(id)a19;
- (WFWidgetConfigurationRequest)initWithOptions:(id)a3;
- (int64_t)family;
- (unint64_t)resolvedWidgetConfigurationStyle;
- (unint64_t)widgetConfigurationStyle;
- (unint64_t)widgetConfigurationType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadWidgetExtensionInformationWithCompletion:(id)a3;
- (void)setRemoteLanguageCode:(id)a3;
- (void)setRemoteLocalizedIntent:(id)a3;
- (void)startAccessingSecurityScopedBundleResource;
@end

@implementation WFWidgetConfigurationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetBundleScopedURL, 0);
  objc_storeStrong((id *)&self->_intentLocalizationTableBundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteLanguageCode, 0);
  objc_storeStrong((id *)&self->_remoteLocalizedIntent, 0);
  objc_storeStrong((id *)&self->_remoteAppIcon, 0);
  objc_storeStrong((id *)&self->_remoteAppLocalizedName, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetPrimaryColor, 0);
  objc_storeStrong((id *)&self->_widgetDescription, 0);
  objc_storeStrong((id *)&self->_widgetDisplayName, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetTintColor, 0);
}

- (NSSecurityScopedURLWrapper)widgetBundleScopedURL
{
  return self->_widgetBundleScopedURL;
}

- (NSSecurityScopedURLWrapper)intentLocalizationTableBundleURL
{
  return self->_intentLocalizationTableBundleURL;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setRemoteLanguageCode:(id)a3
{
}

- (NSString)remoteLanguageCode
{
  return self->_remoteLanguageCode;
}

- (void)setRemoteLocalizedIntent:(id)a3
{
}

- (INIntent)remoteLocalizedIntent
{
  return self->_remoteLocalizedIntent;
}

- (WFImage)remoteAppIcon
{
  return self->_remoteAppIcon;
}

- (NSString)remoteAppLocalizedName
{
  return self->_remoteAppLocalizedName;
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (BOOL)usesWidgetAccentColor
{
  return self->_usesWidgetAccentColor;
}

- (UIColor)widgetPrimaryColor
{
  return self->_widgetPrimaryColor;
}

- (NSString)widgetDescription
{
  return self->_widgetDescription;
}

- (NSString)widgetDisplayName
{
  return self->_widgetDisplayName;
}

- (CGRect)initialCardFrame
{
  double x = self->_initialCardFrame.origin.x;
  double y = self->_initialCardFrame.origin.y;
  double width = self->_initialCardFrame.size.width;
  double height = self->_initialCardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)defaultCardSize
{
  double width = self->_defaultCardSize.width;
  double height = self->_defaultCardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)widgetConfigurationType
{
  return self->_widgetConfigurationType;
}

- (unint64_t)widgetConfigurationStyle
{
  return self->_widgetConfigurationStyle;
}

- (int64_t)family
{
  return self->_family;
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = INIntentWithTypedIntent();
  [v8 encodeObject:v4 forKey:@"intent"];

  [v8 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v8 encodeObject:self->_intentLocalizationTableBundleURL forKey:@"intentLocalizationTableBundleURL"];
  [v8 encodeObject:self->_widgetBundleScopedURL forKey:@"widgetBundleScopedURL"];
  [v8 encodeInteger:self->_family forKey:@"family"];
  [v8 encodeInteger:self->_widgetConfigurationStyle forKey:@"widgetConfigurationStyle"];
  [v8 encodeInteger:self->_widgetConfigurationType forKey:@"widgetConfigurationType"];
  v5 = [MEMORY[0x263F08D40] value:&self->_defaultCardSize withObjCType:"{CGSize=dd}"];
  [v8 encodeObject:v5 forKey:@"defaultCardSize"];

  v6 = [MEMORY[0x263F08D40] value:&self->_initialCardFrame withObjCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v8 encodeObject:v6 forKey:@"initialCardFrame"];

  [v8 encodeObject:self->_widgetDisplayName forKey:@"widgetDisplayName"];
  [v8 encodeObject:self->_widgetDescription forKey:@"widgetDescription"];
  [v8 encodeBool:self->_usesWidgetAccentColor forKey:@"usesWidgetAccentColor"];
  [v8 encodeObject:self->_remoteDeviceIdentifier forKey:@"remoteDeviceIdentifier"];
  [v8 encodeObject:self->_remoteAppLocalizedName forKey:@"remoteAppLocalizedName"];
  [v8 encodeObject:self->_remoteAppIcon forKey:@"remoteAppIcon"];
  v7 = INIntentWithTypedIntent();
  [v8 encodeObject:v7 forKey:@"remoteLocalizedIntent"];

  [v8 encodeObject:self->_remoteLanguageCode forKey:@"remoteLanguageCode"];
}

- (WFWidgetConfigurationRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  v31 = INTypedIntentWithIntent();

  v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  v29 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"intentLocalizationTableBundleURL"];
  v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"widgetBundleScopedURL"];
  uint64_t v27 = [v3 decodeIntegerForKey:@"family"];
  uint64_t v26 = [v3 decodeIntegerForKey:@"widgetConfigurationStyle"];
  uint64_t v24 = [v3 decodeIntegerForKey:@"widgetConfigurationType"];
  long long v34 = *MEMORY[0x263F001B0];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"defaultCardSize"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  [v7 getValue:&v34 size:16];
  long long v8 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v32 = *MEMORY[0x263F001A0];
  long long v33 = v8;
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"initialCardFrame"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  [v11 getValue:&v32 size:32];
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"widgetDescription"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"widgetDisplayName"];
  char v12 = [v3 decodeBoolForKey:@"usesWidgetAccentColor"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"remoteDeviceIdentifier"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"remoteAppLocalizedName"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"remoteAppIcon"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"remoteLocalizedIntent"];
  v16 = INTypedIntentWithIntent();

  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"remoteLanguageCode"];
  LOBYTE(v20) = v12;
  v18 = objc_retain(-[WFWidgetConfigurationRequest initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:](self, "initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:", v31, v30, v29, v28, v27, v26, v34, v32, v33, v24, v22, v23, v20, v13,
            v21,
            v14));
  [(WFWidgetConfigurationRequest *)v18 setRemoteLocalizedIntent:v16];
  [(WFWidgetConfigurationRequest *)v18 setRemoteLanguageCode:v17];

  return v18;
}

- (void)startAccessingSecurityScopedBundleResource
{
  id v3 = [(WFWidgetConfigurationRequest *)self intentLocalizationTableBundleURL];
  v2 = [v3 url];
  [v2 startAccessingSecurityScopedResource];
}

- (void)loadWidgetExtensionInformationWithCompletion:(id)a3
{
  v53[2] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  if ([(WFWidgetConfigurationRequest *)self isWidgetExtensionInformationLoaded]) {
    goto LABEL_6;
  }
  id v5 = [(WFWidgetConfigurationRequest *)self intent];
  v6 = objc_alloc_init(WFShortcutsWidgetConfigurationIntent);
  id v7 = objc_alloc_init(WFShortcutsSmallWidgetConfigurationIntent);
  long long v8 = softLinkDOCCreateDefaultHomeScreenWidgetIntent();
  v9 = [v5 _className];
  v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  if ([v9 isEqualToString:v11]) {
    goto LABEL_5;
  }
  v48 = self;
  char v12 = [v5 _className];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  if ([v12 isEqualToString:v14])
  {

LABEL_5:
LABEL_6:
    v4[2](v4, 0);
    goto LABEL_7;
  }
  v15 = [v5 _className];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = v47 = v4;
  char v46 = [v15 isEqualToString:v17];

  v4 = v47;
  if (v46) {
    goto LABEL_6;
  }
  v18 = [MEMORY[0x263F100F0] sharedProvider];
  v19 = [(WFWidgetConfigurationRequest *)v48 intent];
  uint64_t v20 = [v18 descriptorForIntent:v19];

  v21 = [v20 extensionBundleIdentifier];
  if (!v21)
  {
    v22 = [(WFWidgetConfigurationRequest *)v48 intent];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      uint64_t v24 = [(WFWidgetConfigurationRequest *)v48 intent];
      v25 = [v24 _asMigratedAppIntent];

      if (v25)
      {
        uint64_t v26 = [v25 extensionBundleId];
        uint64_t v27 = v26;
        if (v26)
        {
          id v28 = v26;
        }
        else
        {
          id v28 = [v25 launchId];
        }
        v21 = v28;
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
  }
  id v51 = 0;
  v29 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v21 error:&v51];
  id v30 = v51;
  if (v29)
  {
    id v31 = objc_alloc(MEMORY[0x263F08B18]);
    long long v32 = [v29 URL];
    uint64_t v33 = [v31 initWithURL:v32 readonly:1];
    widgetBundleScopedURL = v48->_widgetBundleScopedURL;
    v48->_widgetBundleScopedURL = (NSSecurityScopedURLWrapper *)v33;

    v35 = [v29 URL];
    id v49 = 0;
    id v50 = 0;
    WFWidgetColorsFromBundle((uint64_t)v35, &v50, &v49);
    v36 = (UIColor *)v50;
    v37 = (UIColor *)v49;

    widgetPrimaryColor = v48->_widgetPrimaryColor;
    v48->_widgetPrimaryColor = v36;
    v39 = v36;

    widgetTintColor = v48->_widgetTintColor;
    v48->_widgetTintColor = v37;

    uint64_t v41 = 0;
  }
  else
  {
    id v42 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v43 = *MEMORY[0x263F08320];
    v52[0] = *MEMORY[0x263F08338];
    v52[1] = v43;
    v53[0] = @"Widget Extension Not found";
    v53[1] = @"The associated Widget Extension is not found.";
    v44 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
    v45 = (void *)[v42 initWithDictionary:v44];

    objc_msgSend(v45, "if_setObjectIfNonNil:forKey:", v30, *MEMORY[0x263F08608]);
    uint64_t v41 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3328 userInfo:v45];
    v39 = (UIColor *)v41;
    id v30 = v45;
  }
  v4 = v47;
  v47[2](v47, v41);

LABEL_7:
}

- (void)dealloc
{
  id v3 = [(WFWidgetConfigurationRequest *)self intentLocalizationTableBundleURL];
  v4 = [v3 url];
  [v4 stopAccessingSecurityScopedResource];

  v5.receiver = self;
  v5.super_class = (Class)WFWidgetConfigurationRequest;
  [(WFWidgetConfigurationRequest *)&v5 dealloc];
}

- (NSString)appBundleIdentifier
{
  appBundleIdentifier = self->_appBundleIdentifier;
  if (!appBundleIdentifier)
  {
    v4 = [(WFWidgetConfigurationRequest *)self intent];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_super v5 = (NSString *)[objc_alloc(MEMORY[0x263F520A8]) initWithOptions:0];
      v6 = objc_msgSend(v4, "_intents_bundleIdForLaunching");
      id v7 = [v4 appIntentIdentifier];
      long long v8 = [(NSString *)v5 actionsForBundleIdentifier:v6 andActionIdentifier:v7 error:0];
      v9 = [v8 firstObject];

      v10 = [v9 attributionBundleIdentifier];
      id v11 = v10;
      if (v10)
      {
        char v12 = v10;
        v13 = self->_appBundleIdentifier;
        self->_appBundleIdentifier = v12;
      }
      else
      {
        v13 = [(WFWidgetConfigurationRequest *)self intent];
        objc_msgSend(v13, "_intents_bundleIdForDisplay");
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        v16 = self->_appBundleIdentifier;
        self->_appBundleIdentifier = v15;
      }
    }
    else
    {

      v4 = [(WFWidgetConfigurationRequest *)self intent];
      objc_msgSend(v4, "_intents_bundleIdForDisplay");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_super v5 = self->_appBundleIdentifier;
      self->_appBundleIdentifier = v14;
    }

    appBundleIdentifier = self->_appBundleIdentifier;
  }
  return appBundleIdentifier;
}

- (BOOL)isWidgetExtensionInformationLoaded
{
  v2 = [(WFWidgetConfigurationRequest *)self widgetBundleScopedURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIColor)widgetTintColor
{
  if ([(WFWidgetConfigurationRequest *)self usesWidgetAccentColor]) {
    BOOL v3 = self->_widgetTintColor;
  }
  else {
    BOOL v3 = 0;
  }
  return v3;
}

- (unint64_t)resolvedWidgetConfigurationStyle
{
  if ([(WFWidgetConfigurationRequest *)self widgetConfigurationStyle])
  {
    return [(WFWidgetConfigurationRequest *)self widgetConfigurationStyle];
  }
  else
  {
    [(WFWidgetConfigurationRequest *)self family];
    if (CHSWidgetFamilyIsAccessory()) {
      return 2;
    }
    else {
      return 1;
    }
  }
}

- (NSString)fallbackDisplayName
{
  if ([(WFWidgetConfigurationRequest *)self widgetConfigurationType] == 1) {
    v2 = @"Control";
  }
  else {
    v2 = @"Widget";
  }
  BOOL v3 = WFLocalizedStringFromTable(v2, @"WidgetConfiguration");
  return (NSString *)v3;
}

- (WFWidgetConfigurationRequest)initWithIntent:(id)a3 bundleIdentifier:(id)a4 intentLocalizationTableBundleURL:(id)a5 widgetBundleScopedURL:(id)a6 family:(int64_t)a7 widgetConfigurationStyle:(unint64_t)a8 widgetConfigurationType:(unint64_t)a9 defaultCardSize:(CGSize)a10 initialCardFrame:(CGRect)a11 widgetDisplayName:(id)a12 widgetDescription:(id)a13 widgetPrimaryColor:(id)a14 widgetTintColor:(id)a15 usesWidgetAccentColor:(BOOL)a16 remoteDeviceIdentifier:(id)a17 remoteAppLocalizedName:(id)a18 remoteAppIcon:(id)a19
{
  CGFloat height = a11.size.height;
  CGFloat width = a11.size.width;
  CGFloat y = a11.origin.y;
  CGFloat x = a11.origin.x;
  CGFloat v26 = a10.height;
  CGFloat v27 = a10.width;
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v72 = a3;
  id v28 = a4;
  id v65 = a5;
  id v71 = a5;
  id v66 = a6;
  id v70 = a6;
  id v29 = a12;
  id v77 = a13;
  id v69 = a14;
  id v76 = a15;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  v78.receiver = self;
  v78.super_class = (Class)WFWidgetConfigurationRequest;
  uint64_t v33 = [(WFWidgetConfigurationRequest *)&v78 init];
  long long v34 = v33;
  v75 = v31;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_intent, a3);
    id v35 = v28;
    uint64_t v36 = [v28 copy];
    bundleIdentifier = v34->_bundleIdentifier;
    v34->_bundleIdentifier = (NSString *)v36;

    objc_storeStrong((id *)&v34->_intentLocalizationTableBundleURL, v65);
    objc_storeStrong((id *)&v34->_widgetBundleScopedURL, v66);
    v34->_familCGFloat y = a7;
    v34->_widgetConfigurationStyle = a8;
    v34->_widgetConfigurationType = a9;
    v34->_defaultCardSize.CGFloat width = v27;
    v34->_defaultCardSize.CGFloat height = v26;
    v34->_initialCardFrame.origin.CGFloat x = x;
    v34->_initialCardFrame.origin.CGFloat y = y;
    v34->_initialCardFrame.size.CGFloat width = width;
    v34->_initialCardFrame.size.CGFloat height = height;
    uint64_t v38 = [v29 copy];
    widgetDisplayName = v34->_widgetDisplayName;
    v34->_widgetDisplayName = (NSString *)v38;

    uint64_t v40 = [v77 copy];
    widgetDescription = v34->_widgetDescription;
    v34->_widgetDescription = (NSString *)v40;

    objc_storeStrong((id *)&v34->_widgetPrimaryColor, a14);
    objc_storeStrong((id *)&v34->_widgetTintColor, a15);
    v34->_usesWidgetAccentColor = a16;
    id v74 = v30;
    uint64_t v42 = [v30 copy];
    remoteDeviceIdentifier = v34->_remoteDeviceIdentifier;
    v34->_remoteDeviceIdentifier = (NSString *)v42;

    uint64_t v44 = [v31 copy];
    remoteAppLocalizedName = v34->_remoteAppLocalizedName;
    v34->_remoteAppLocalizedName = (NSString *)v44;

    uint64_t v46 = [v32 copy];
    remoteAppIcon = v34->_remoteAppIcon;
    v34->_remoteAppIcon = (WFImage *)v46;

    remoteLocalizedIntent = v34->_remoteLocalizedIntent;
    v34->_remoteLocalizedIntent = 0;

    remoteLanguageCode = v34->_remoteLanguageCode;
    v34->_remoteLanguageCode = 0;

    id v50 = (double *)MEMORY[0x263F001B0];
    id v51 = v29;
    if (v34->_intent
      && (v34->_bundleIdentifier || v34->_remoteDeviceIdentifier)
      && (v34->_defaultCardSize.width != *MEMORY[0x263F001B0]
       || v34->_defaultCardSize.height != *(double *)(MEMORY[0x263F001B0] + 8)))
    {
      v60 = v72;
      v61 = v69;
      v56 = v35;
      if (!v34->_family)
      {
        v62 = getWFWidgetConfigurationLogObject();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v80 = "-[WFWidgetConfigurationRequest initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBu"
                "ndleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:w"
                "idgetDisplayName:widgetDescription:widgetPrimaryColor:widgetTintColor:usesWidgetAccentColor:remoteDevice"
                "Identifier:remoteAppLocalizedName:remoteAppIcon:]";
          _os_log_impl(&dword_2177E0000, v62, OS_LOG_TYPE_DEBUG, "%s Widget Configuration UI was requested with undefined widget family", buf, 0xCu);
        }
      }
      v59 = v34;
      v55 = v70;
      v54 = v71;
    }
    else
    {
      v52 = objc_opt_new();
      v53 = v52;
      v55 = v70;
      v54 = v71;
      if (!v34->_intent) {
        [v52 addObject:@"Intent"];
      }
      if (!v34->_bundleIdentifier) {
        [v53 addObject:@"Bundle Identifier"];
      }
      v56 = v35;
      if (v34->_defaultCardSize.width == *v50 && v34->_defaultCardSize.height == v50[1]) {
        [v53 addObject:@"Default Card Size"];
      }
      v57 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
      {
        v58 = [v53 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 136315394;
        v80 = "-[WFWidgetConfigurationRequest initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBund"
              "leScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widge"
              "tDisplayName:widgetDescription:widgetPrimaryColor:widgetTintColor:usesWidgetAccentColor:remoteDeviceIdenti"
              "fier:remoteAppLocalizedName:remoteAppIcon:]";
        __int16 v81 = 2114;
        v82 = v58;
        _os_log_impl(&dword_2177E0000, v57, OS_LOG_TYPE_FAULT, "%s Invalid Widget Configuration Request with invalid %{public}@", buf, 0x16u);

        id v30 = v74;
      }

      v59 = 0;
      v60 = v72;
      v61 = v69;
    }
  }
  else
  {
    v59 = 0;
    v54 = v71;
    v60 = v72;
    v56 = v28;
    v55 = v70;
    id v51 = v29;
    v61 = v69;
  }

  return v59;
}

- (WFWidgetConfigurationRequest)initWithIntent:(id)a3 bundleIdentifier:(id)a4 intentLocalizationTableBundleURL:(id)a5 widgetBundleScopedURL:(id)a6 family:(int64_t)a7 widgetConfigurationStyle:(unint64_t)a8 widgetConfigurationType:(unint64_t)a9 defaultCardSize:(CGSize)a10 initialCardFrame:(CGRect)a11 widgetDisplayName:(id)a12 widgetDescription:(id)a13 usesWidgetAccentColor:(BOOL)a14 remoteDeviceIdentifier:(id)a15 remoteAppLocalizedName:(id)a16 remoteAppIcon:(id)a17
{
  double height = a11.size.height;
  double width = a11.size.width;
  double y = a11.origin.y;
  double x = a11.origin.x;
  double v24 = a10.height;
  double v25 = a10.width;
  id v43 = a3;
  id v42 = a4;
  id v38 = a5;
  id v27 = a6;
  id v28 = a12;
  id v29 = a13;
  id v30 = a15;
  id v31 = a16;
  id v32 = a17;
  v37 = v27;
  if (v27)
  {
    uint64_t v33 = [v27 url];
    [v33 startAccessingSecurityScopedResource];
    id v44 = 0;
    v45[0] = 0;
    WFWidgetColorsFromBundle((uint64_t)v33, v45, &v44);
    id v34 = v45[0];
    id v27 = v44;
    [v33 stopAccessingSecurityScopedResource];
  }
  else
  {
    id v34 = 0;
  }
  LOBYTE(v36) = a14;
  uint64_t v41 = -[WFWidgetConfigurationRequest initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:widgetPrimaryColor:widgetTintColor:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:](self, "initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:widgetPrimaryColor:widgetTintColor:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:", v43, v42, v38, v37, a7, a8, v25, v24, x, y, width, height, a9, v28, v29,
          v34,
          v27,
          v36,
          v30,
          v31,
          v32);

  return v41;
}

- (WFWidgetConfigurationRequest)initWithOptions:(id)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v72 = [MEMORY[0x263F08690] currentHandler];
    [v72 handleFailureInMethod:a2, self, @"WFWidgetConfigurationRequest.m", 203, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  v79 = self;
  v6 = [v5 intent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v8 = (void *)MEMORY[0x263F01890];
    v9 = [v5 intent];
    v10 = [v9 launchId];
    id v11 = [v8 bundleRecordWithBundleIdentifier:v10 allowPlaceholder:0 error:0];
  }
  else
  {
    id v12 = [v5 intent];
    v9 = v12;
    if (v12)
    {
      v13 = [v12 extensionBundleId];

      if (v13)
      {
        id v14 = objc_alloc(MEMORY[0x263F01858]);
        v15 = [v9 extensionBundleId];
        *(void *)buf = 0;
        id v11 = (void *)[v14 initWithBundleIdentifier:v15 error:buf];
        id v16 = *(id *)buf;
      }
      else
      {
        id v16 = 0;
        id v11 = 0;
      }
      v17 = [v11 intentDefinitionURLs];
      uint64_t v18 = [v17 count];

      if (!v18)
      {
        v19 = [v9 launchId];
        v80[1] = 0;
        INExtractAppInfoFromSiriLaunchId();
        id v20 = 0;

        v80[0] = v16;
        uint64_t v21 = [objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v20 allowPlaceholder:0 error:v80];
        id v22 = v80[0];

        id v16 = v22;
        id v11 = (void *)v21;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  objc_super v78 = v11;
  uint64_t v23 = [v11 bundleIdentifier];
  id v24 = objc_alloc_init(MEMORY[0x263F79488]);
  id v77 = (void *)v23;
  double v25 = [v24 previewMetricsSpecificationForBundleIdentifier:v23];
  CGFloat v26 = [v25 metricsForFamily:2];
  id v27 = v26;
  if (v26)
  {
    [v26 size];
    double v29 = v28;
LABEL_16:
    double v30 = ceil(v29 * 0.7);
    goto LABEL_17;
  }
  v62 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "WFWidgetConfiugrationRequestDefaultCardSizeForBundleIdentifier";
    _os_log_impl(&dword_2177E0000, v62, OS_LOG_TYPE_FAULT, "%s Cannot load the widget metrics from SpringBoard Services", buf, 0xCu);
  }

  v63 = [MEMORY[0x263F82B60] mainScreen];
  [v63 bounds];
  double v65 = v64;
  double v67 = v66;

  v68 = [MEMORY[0x263F82B60] mainScreen];
  id v69 = [v68 traitCollection];
  uint64_t v70 = [v69 userInterfaceIdiom];

  if (v70)
  {
    if (v70 == 1)
    {
      if (fmax(v65, v67) <= 1024.0)
      {
LABEL_30:
        double v30 = 230.0;
        double v29 = 329.0;
        goto LABEL_17;
      }
      goto LABEL_40;
    }
    double v30 = 300.0;
    double v29 = 400.0;
  }
  else
  {
    double v71 = fmax(v67, v65);
    if (v71 >= 926.0)
    {
LABEL_40:
      double v30 = 255.0;
      double v29 = 364.0;
      goto LABEL_17;
    }
    if (v71 >= 896.0)
    {
      double v30 = 252.0;
      double v29 = 360.0;
    }
    else if (v71 >= 844.0)
    {
      double v30 = 237.0;
      double v29 = 338.0;
    }
    else
    {
      if (v71 >= 812.0) {
        goto LABEL_30;
      }
      if (v71 >= 736.0)
      {
        double v30 = 244.0;
        double v29 = 348.0;
      }
      else
      {
        double v30 = 205.0;
        double v29 = 292.0;
        if (v71 < 693.0)
        {
          if (v71 >= 667.0)
          {
            double v30 = 225.0;
            double v29 = 321.0;
          }
          else if (v71 < 568.0)
          {
            double v29 = fmin(v67, v65) + -28.0;
            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_17:

  id v31 = [v5 intent];
  objc_opt_class();
  char v32 = objc_opt_isKindOfClass();

  if (v32)
  {
    uint64_t v33 = (void *)MEMORY[0x263F01890];
    id v34 = [v5 intent];
    id v35 = [v34 extensionBundleId];
    uint64_t v36 = [v33 bundleRecordWithBundleIdentifier:v35 allowPlaceholder:0 error:0];
  }
  else
  {
    v37 = [v5 intent];
    id v38 = [v37 _codableDescription];
    v39 = [v38 localizationBundleIdentifier];

    if (!v39)
    {
LABEL_23:
      v75 = 0;
      id v76 = 0;
      goto LABEL_24;
    }
    uint64_t v40 = (void *)MEMORY[0x263F01890];
    id v34 = [v5 intent];
    id v35 = [v34 _codableDescription];
    uint64_t v41 = [v35 localizationBundleIdentifier];
    uint64_t v36 = [v40 bundleRecordWithBundleIdentifier:v41 allowPlaceholder:0 error:0];
  }
  if (!v36) {
    goto LABEL_23;
  }
  id v42 = objc_alloc(MEMORY[0x263F08B18]);
  id v76 = v36;
  id v43 = [v36 URL];
  v75 = (void *)[v42 initWithURL:v43 readonly:1];

LABEL_24:
  id v44 = [v5 intent];
  uint64_t v74 = [v5 family];
  uint64_t v45 = [v5 widgetConfigurationStyle];
  uint64_t v46 = [v5 widgetConfigurationType];
  [v5 initialConfigurationCardViewFrame];
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  v55 = [v5 widgetDisplayName];
  v56 = [v5 widgetDescription];
  v57 = [v5 remoteDeviceIdentifier];
  v58 = [v5 remoteAppLocalizedName];
  v59 = [v5 remoteAppIcon];
  LOBYTE(v73) = 1;
  v60 = -[WFWidgetConfigurationRequest initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:](v79, "initWithIntent:bundleIdentifier:intentLocalizationTableBundleURL:widgetBundleScopedURL:family:widgetConfigurationStyle:widgetConfigurationType:defaultCardSize:initialCardFrame:widgetDisplayName:widgetDescription:usesWidgetAccentColor:remoteDeviceIdentifier:remoteAppLocalizedName:remoteAppIcon:", v44, v77, v75, 0, v74, v45, v29, v30, v48, v50, v52, v54, v46, v55, v56,
          v73,
          v57,
          v58,
          v59);

  return v60;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end