@interface WFTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)isSupportedOnThisDevice;
+ (BOOL)isUserInitiated;
+ (BOOL)requiresNotification;
+ (BOOL)supportsSecureCoding;
+ (double)displayGlyphCornerRadius;
+ (id)displayGlyph;
+ (id)displayGlyphHierarchicalColors;
+ (id)displayGlyphName;
+ (id)displayGlyphTintColor;
+ (id)inputTypeDescriptionForClass:(Class)a3;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (id)offIcon;
+ (id)offIconTintColor;
+ (id)offLabel;
+ (id)onIcon;
+ (id)onIconTintColor;
+ (id)onLabel;
+ (id)triggerWithSerializedData:(id)a3;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (Class)shortcutInputContentItemClass;
- (WFTrigger)init;
- (double)displayGlyphCornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayGlyph;
- (id)displayGlyphHierarchicalColors;
- (id)displayGlyphName;
- (id)displayGlyphTintColor;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedDisplayExplanation;
- (id)localizedDisplayName;
- (id)localizedPastTenseDescription;
- (id)serializedData;
- (id)suggestedActions;
@end

@implementation WFTrigger

- (Class)shortcutInputContentItemClass
{
  return 0;
}

- (id)suggestedActions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)localizedPastTenseDescription
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = [(id)objc_opt_class() isAllowedToRunAutomatically];
  v4 = getWFTriggersLogObject();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315394;
      v11 = "-[WFTrigger localizedPastTenseDescription]";
      __int16 v12 = 2114;
      id v13 = (id)objc_opt_class();
      id v6 = v13;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_FAULT, "%s Subclasses MUST override -localizedPastTenseDescription (but %{public}@ didn't)", (uint8_t *)&v10, 0x16u);
    }
    v7 = [(WFTrigger *)self localizedDescriptionWithConfigurationSummary];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[WFTrigger localizedPastTenseDescription]";
      __int16 v12 = 2112;
      id v13 = (id)objc_opt_class();
      id v8 = v13;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Shouldn't have used -localizedPastTenseDescription for %@, because it should always ask before running", (uint8_t *)&v10, 0x16u);
    }
    v7 = &stru_1F229A4D8;
  }
  return v7;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v6 = 136315394;
    v7 = "-[WFTrigger localizedDescriptionWithConfigurationSummary]";
    __int16 v8 = 2114;
    id v9 = (id)objc_opt_class();
    id v3 = v9;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_FAULT, "%s Subclasses MUST override -localizedDescriptionWithConfigurationSummary (but %{public}@ didn't)", (uint8_t *)&v6, 0x16u);
  }
  v4 = [(id)objc_opt_class() localizedDisplayName];
  return v4;
}

- (BOOL)hasValidConfiguration
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315394;
    int v6 = "-[WFTrigger hasValidConfiguration]";
    __int16 v7 = 2114;
    id v8 = (id)objc_opt_class();
    id v3 = v8;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_FAULT, "%s Subclasses MUST override -hasValidConfiguration (but %{public}@ didn't)", (uint8_t *)&v5, 0x16u);
  }
  return 0;
}

- (id)displayGlyphTintColor
{
  v2 = objc_opt_class();
  return (id)[v2 displayGlyphTintColor];
}

- (double)displayGlyphCornerRadius
{
  v2 = objc_opt_class();
  [v2 displayGlyphCornerRadius];
  return result;
}

- (id)displayGlyph
{
  v2 = objc_opt_class();
  return (id)[v2 displayGlyph];
}

- (id)displayGlyphHierarchicalColors
{
  v2 = objc_opt_class();
  return (id)[v2 displayGlyphHierarchicalColors];
}

- (id)displayGlyphName
{
  v2 = objc_opt_class();
  return (id)[v2 displayGlyphName];
}

- (id)localizedDisplayExplanation
{
  v2 = objc_opt_class();
  return (id)[v2 localizedDisplayExplanation];
}

- (id)localizedDisplayName
{
  v2 = objc_opt_class();
  return (id)[v2 localizedDisplayName];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

- (id)serializedData
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (!v3)
  {
    int v5 = getWFTriggersLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v9 = "-[WFTrigger serializedData]";
      __int16 v10 = 2112;
      v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s failed to serialize trigger (%@): %{public}@", buf, 0x20u);
    }
  }
  return v3;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  int v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  return v6;
}

- (WFTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFTrigger;
  v2 = [(WFTrigger *)&v6 init];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

+ (id)inputTypeDescriptionForClass:(Class)a3
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    __int16 v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = NSStringFromClass(a3);
    [v10 handleFailureInMethod:a2, a1, @"WFTrigger.m", 238, @"Class is not of type WFContentItem instead %@", v11 object file lineNumber description];
  }
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()]
    || [(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    objc_super v6 = [(objc_class *)a3 localizedPluralTypeDescription];
  }
  else
  {
    objc_super v6 = [(objc_class *)a3 localizedTypeDescription];
  }
  id v7 = v6;
  id v8 = [v6 localizedLowercaseString];

  return v8;
}

+ (id)offIconTintColor
{
  return 0;
}

+ (id)onIconTintColor
{
  return 0;
}

+ (id)displayGlyphTintColor
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB45E0]) initWithSystemColor:4];
  return v2;
}

+ (id)offLabel
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v6 = 136315394;
    id v7 = "+[WFTrigger offLabel]";
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_FAULT, "%s Subclass MUST override, but %{public}@ didn't", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

+ (id)onLabel
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v6 = 136315394;
    id v7 = "+[WFTrigger onLabel]";
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_FAULT, "%s Subclass MUST override, but %{public}@ didn't", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

+ (id)offIcon
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v6 = 136315394;
    id v7 = "+[WFTrigger offIcon]";
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_FAULT, "%s Subclass MUST override, but %{public}@ didn't", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

+ (id)onIcon
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v6 = 136315394;
    id v7 = "+[WFTrigger onIcon]";
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_FAULT, "%s Subclass MUST override, but %{public}@ didn't", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

+ (int64_t)triggerBacking
{
  return 0;
}

+ (double)displayGlyphCornerRadius
{
  return 0.0;
}

+ (id)displayGlyph
{
  id v3 = [a1 displayGlyphHierarchicalColors];

  id v4 = (void *)MEMORY[0x1E4FB4770];
  int v5 = [a1 displayGlyphName];
  if (v3)
  {
    int v6 = [a1 displayGlyphHierarchicalColors];
    id v7 = [v4 triggerDisplaySymbolNamed:v5 hierarchicalColors:v6];
  }
  else
  {
    id v7 = [v4 triggerDisplaySymbolNamed:v5 renderingMode:0];
  }

  return v7;
}

+ (id)displayGlyphHierarchicalColors
{
  return 0;
}

+ (id)displayGlyphName
{
  return &stru_1F229A4D8;
}

+ (id)localizedDisplayExplanation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315394;
    int v6 = "+[WFTrigger localizedDisplayExplanation]";
    __int16 v7 = 2114;
    id v8 = (id)objc_opt_class();
    id v3 = v8;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_FAULT, "%s Subclasses MUST override +localizedDisplayExplanation (but %{public}@ didn't)", (uint8_t *)&v5, 0x16u);
  }
  return &stru_1F229A4D8;
}

+ (id)localizedDisplayName
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315394;
    int v6 = "+[WFTrigger localizedDisplayName]";
    __int16 v7 = 2114;
    id v8 = (id)objc_opt_class();
    id v3 = v8;
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_FAULT, "%s Subclasses MUST override +localizedDisplayName (but %{public}@ didn't)", (uint8_t *)&v5, 0x16u);
  }
  return &stru_1F229A4D8;
}

+ (BOOL)isSupportedOnThisDevice
{
  return 1;
}

+ (BOOL)isUserInitiated
{
  return 0;
}

+ (BOOL)requiresNotification
{
  return 0;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)triggerWithSerializedData:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(WFTriggerMigrator);
  id v20 = 0;
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v20];
  id v6 = v20;
  [v5 setClass:objc_opt_class() forClassName:@"LSApplicationProxy"];
  [v5 setDelegate:v4];
  if (!v5)
  {
    v11 = getWFTriggersLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v22 = "+[WFTrigger triggerWithSerializedData:]";
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v16;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to create NSKeyedUnarchiver due to error: %@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  __int16 v7 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  uint64_t v10 = [v5 decodeObjectOfClasses:v9 forKey:*MEMORY[0x1E4F284E8]];

  if (!v10)
  {
    v17 = getWFTriggersLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [v3 length];
      *(_DWORD *)buf = 136315650;
      v22 = "+[WFTrigger triggerWithSerializedData:]";
      __int16 v23 = 2048;
      uint64_t v24 = v18;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_ERROR, "%s Failed to unarchive WFTrigger from data (length=%lu) error: %{public}@", buf, 0x20u);
    }

    v11 = 0;
LABEL_10:
    __int16 v12 = 0;
    goto LABEL_12;
  }
  if ([v10 isMemberOfClass:objc_opt_class()])
  {
    v11 = v10;
    __int16 v12 = objc_opt_new();
    id v13 = [v11 region];
    [v12 setRegion:v13];

    uint64_t v14 = [v11 startTime];
    [v12 setStartTime:v14];

    v15 = [v11 endTime];

    [v12 setEndTime:v15];
  }
  else
  {
    v11 = v10;
    __int16 v12 = v11;
  }
LABEL_12:

  return v12;
}

@end