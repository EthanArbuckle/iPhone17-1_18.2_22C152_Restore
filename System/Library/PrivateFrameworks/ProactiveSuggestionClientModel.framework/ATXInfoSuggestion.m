@interface ATXInfoSuggestion
+ (BOOL)supportsSecureCoding;
+ (id)_executableSpecificationForInfoSuggestion:(id)a3;
+ (id)_uiSpecForInfoSuggestion:(id)a3;
+ (id)infoSuggestionFromProactiveSuggestion:(id)a3;
+ (id)proactiveSuggestionForInfoSuggestion:(id)a3 withClientModelId:(id)a4 clientModelVersion:(id)a5 rawScore:(double)a6 confidenceCategory:(int64_t)a7;
- (ATXCustomIntentDescription)intentDescription;
- (ATXInfoSuggestion)initWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intent:(id)a11 metadata:(id)a12 relevanceScore:(id)a13;
- (ATXInfoSuggestion)initWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intentDescription:(id)a11 metadata:(id)a12 relevanceScore:(id)a13;
- (ATXInfoSuggestion)initWithCoder:(id)a3;
- (ATXInfoSuggestion)initWithData:(id)a3;
- (ATXInfoSuggestion)initWithProactiveSuggestion:(id)a3;
- (ATXInfoSuggestion)initWithProto:(id)a3;
- (ATXInfoSuggestion)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXInfoSuggestion:(id)a3;
- (BOOL)isFallback;
- (INIntent)intent;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)metadata;
- (NSNumber)relevanceScore;
- (NSString)appBundleIdentifier;
- (NSString)clientModelId;
- (NSString)criterion;
- (NSString)description;
- (NSString)sourceIdentifier;
- (NSString)suggestionIdentifier;
- (NSString)widgetBundleIdentifier;
- (NSString)widgetKind;
- (id)_dictionaryRepresentationAvoidingLoadingIntentIfPossible:(BOOL)a3;
- (id)_initWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intent:(id)a11 intentDescription:(id)a12 metadata:(id)a13 relevanceScore:(id)a14;
- (id)_safeDecodeObjectOfClass:(Class)a3 allowedClasses:(id)a4 forKey:(id)a5 withCoder:(id)a6;
- (id)_safeDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5;
- (id)_verifyAndReturnDecodedObject:(id)a3 ofClass:(Class)a4 forKey:(id)a5 withCoder:(id)a6;
- (id)copyByReplacingIntentWithIndexingHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)dictionaryRepresentation;
- (id)encodeAsProto;
- (id)proto;
- (int64_t)confidenceLevel;
- (int64_t)intentIndexingHash;
- (unint64_t)hash;
- (unint64_t)layouts;
- (void)data;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleMemoryPressure;
- (void)intent;
- (void)proto;
- (void)setClientModelId:(id)a3;
- (void)setConfidenceLevel:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setIntentIndexingHash:(int64_t)a3;
- (void)setLayouts:(unint64_t)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setSuggestionIdentifier:(id)a3;
@end

@implementation ATXInfoSuggestion

- (ATXInfoSuggestion)initWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intent:(id)a11 metadata:(id)a12 relevanceScore:(id)a13
{
  return (ATXInfoSuggestion *)[(ATXInfoSuggestion *)self _initWithAppBundleIdentifier:a3 widgetBundleIdentifier:a4 widgetKind:a5 criterion:a6 applicableLayouts:a7 suggestionIdentifier:a8 startDate:a9 endDate:a10 intent:a11 intentDescription:0 metadata:a12 relevanceScore:a13];
}

- (ATXInfoSuggestion)initWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intentDescription:(id)a11 metadata:(id)a12 relevanceScore:(id)a13
{
  return (ATXInfoSuggestion *)[(ATXInfoSuggestion *)self _initWithAppBundleIdentifier:a3 widgetBundleIdentifier:a4 widgetKind:a5 criterion:a6 applicableLayouts:a7 suggestionIdentifier:a8 startDate:a9 endDate:a10 intent:0 intentDescription:a11 metadata:a12 relevanceScore:a13];
}

- (id)_initWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intent:(id)a11 intentDescription:(id)a12 metadata:(id)a13 relevanceScore:(id)a14
{
  id v18 = a3;
  id v19 = a4;
  id v48 = a5;
  id v20 = a6;
  id v21 = a8;
  id v47 = a9;
  v22 = v21;
  id v46 = a10;
  id v23 = a11;
  id v45 = a12;
  id v24 = a13;
  id v25 = a14;
  v49.receiver = self;
  v49.super_class = (Class)ATXInfoSuggestion;
  v26 = [(ATXInfoSuggestion *)&v49 init];
  if (v26)
  {
    uint64_t v27 = [v18 copy];
    appBundleIdentifier = v26->_appBundleIdentifier;
    v26->_appBundleIdentifier = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    widgetBundleIdentifier = v26->_widgetBundleIdentifier;
    v26->_widgetBundleIdentifier = (NSString *)v29;

    uint64_t v31 = [v48 copy];
    widgetKind = v26->_widgetKind;
    v26->_widgetKind = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    criterion = v26->_criterion;
    v26->_criterion = (NSString *)v33;

    v26->_layouts = a7;
    uint64_t v35 = [v22 copy];
    suggestionIdentifier = v26->_suggestionIdentifier;
    v26->_suggestionIdentifier = (NSString *)v35;

    objc_storeStrong((id *)&v26->_startDate, a9);
    objc_storeStrong((id *)&v26->_endDate, a10);
    uint64_t v37 = [v23 copy];
    intent = v26->_intent;
    v26->_intent = (INIntent *)v37;

    objc_storeStrong((id *)&v26->_intentDescription, a12);
    uint64_t v39 = [v24 copy];
    metadata = v26->_metadata;
    v26->_metadata = (NSDictionary *)v39;

    objc_storeStrong((id *)&v26->_relevanceScore, a14);
    v41 = [MEMORY[0x1E4F4B640] sharedInstance];
    [v41 registerObserver:v26];
  }
  return v26;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F4B640] sharedInstance];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ATXInfoSuggestion;
  [(ATXInfoSuggestion *)&v4 dealloc];
}

- (ATXInfoSuggestion)initWithData:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1B3E6F520]();
  id v11 = 0;
  v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];
  id v7 = v11;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = __atxlog_handle_gi();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXInfoSuggestion initWithData:]();
    }
  }
  return v6;
}

- (BOOL)isFallback
{
  return [(NSString *)self->_criterion hasPrefix:@"ATXFallback"];
}

- (id)dictionaryRepresentation
{
  return [(ATXInfoSuggestion *)self _dictionaryRepresentationAvoidingLoadingIntentIfPossible:0];
}

- (id)_dictionaryRepresentationAvoidingLoadingIntentIfPossible:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_opt_new();
  [v5 setObject:self->_appBundleIdentifier forKeyedSubscript:@"app"];
  [v5 setObject:self->_widgetBundleIdentifier forKeyedSubscript:@"widget"];
  [v5 setObject:self->_widgetKind forKeyedSubscript:@"kind"];
  [v5 setObject:self->_criterion forKeyedSubscript:@"criterion"];
  [v5 setObject:self->_suggestionIdentifier forKeyedSubscript:@"suggID"];
  [v5 setObject:self->_clientModelId forKeyedSubscript:@"clientModelId"];
  v6 = [NSNumber numberWithUnsignedInteger:self->_layouts];
  [v5 setObject:v6 forKeyedSubscript:@"layouts"];

  [v5 setObject:self->_startDate forKeyedSubscript:@"startDate"];
  [v5 setObject:self->_endDate forKeyedSubscript:@"endDate"];
  id v7 = [(ATXCustomIntentDescription *)self->_intentDescription description];
  [v5 setObject:v7 forKeyedSubscript:@"intentDescription"];

  if (self->_intentDescription && v3)
  {
    v8 = __atxlog_handle_gi();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ATXInfoSuggestion _dictionaryRepresentationAvoidingLoadingIntentIfPossible:]();
    }
  }
  else
  {
    v8 = [(ATXInfoSuggestion *)self intent];
    v9 = [v8 description];
    [v5 setObject:v9 forKeyedSubscript:@"intent"];
  }
  [v5 setObject:self->_metadata forKeyedSubscript:@"meta"];
  [v5 setObject:self->_sourceIdentifier forKeyedSubscript:@"src"];
  v10 = [NSNumber numberWithInteger:self->_confidenceLevel];
  [v5 setObject:v10 forKeyedSubscript:@"confLevel"];

  [v5 setObject:self->_relevanceScore forKeyedSubscript:@"relevanceScore"];
  return v5;
}

- (NSString)description
{
  v2 = [(ATXInfoSuggestion *)self _dictionaryRepresentationAvoidingLoadingIntentIfPossible:1];
  BOOL v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [v2 descriptionWithLocale:v3];

  return (NSString *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  appBundleIdentifier = self->_appBundleIdentifier;
  widgetBundleIdentifier = self->_widgetBundleIdentifier;
  widgetKind = self->_widgetKind;
  criterion = self->_criterion;
  unint64_t layouts = self->_layouts;
  suggestionIdentifier = self->_suggestionIdentifier;
  startDate = self->_startDate;
  endDate = self->_endDate;
  v12 = [(ATXInfoSuggestion *)self intent];
  v13 = (void *)[v15 initWithAppBundleIdentifier:appBundleIdentifier widgetBundleIdentifier:widgetBundleIdentifier widgetKind:widgetKind criterion:criterion applicableLayouts:layouts suggestionIdentifier:suggestionIdentifier startDate:startDate endDate:endDate intent:v12 metadata:self->_metadata relevanceScore:self->_relevanceScore];

  [v13 setSourceIdentifier:self->_sourceIdentifier];
  [v13 setConfidenceLevel:self->_confidenceLevel];
  [v13 setClientModelId:self->_clientModelId];
  return v13;
}

- (id)copyByReplacingIntentWithIndexingHash
{
  BOOL v3 = [(ATXInfoSuggestion *)self intent];
  uint64_t v4 = objc_msgSend(v3, "atx_indexingHash");

  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAppBundleIdentifier:self->_appBundleIdentifier widgetBundleIdentifier:self->_widgetBundleIdentifier widgetKind:self->_widgetKind criterion:self->_criterion applicableLayouts:self->_layouts suggestionIdentifier:self->_suggestionIdentifier startDate:self->_startDate endDate:self->_endDate intent:0 metadata:self->_metadata relevanceScore:self->_relevanceScore];
  [v5 setSourceIdentifier:self->_sourceIdentifier];
  [v5 setConfidenceLevel:self->_confidenceLevel];
  [v5 setClientModelId:self->_clientModelId];
  [v5 setIntentIndexingHash:v4];
  return v5;
}

- (id)data
{
  BOOL v3 = (void *)MEMORY[0x1B3E6F520](self, a2);
  id v9 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = __atxlog_handle_gi();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXInfoSuggestion data]();
    }
  }
  return v4;
}

- (ATXInfoSuggestion)initWithProactiveSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [ATXInfoSuggestion alloc];
  id v6 = [v4 executableSpecification];

  id v7 = [v6 executable];
  v8 = [(ATXInfoSuggestion *)v5 initWithData:v7];

  if (!v8)
  {
    id v9 = __atxlog_handle_gi();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXInfoSuggestion initWithProactiveSuggestion:]();
    }
  }
  return v8;
}

+ (id)proactiveSuggestionForInfoSuggestion:(id)a3 withClientModelId:(id)a4 clientModelVersion:(id)a5 rawScore:(double)a6 confidenceCategory:(int64_t)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a4;
  v15 = [[ATXProactiveSuggestionClientModelSpecification alloc] initWithClientModelId:v14 clientModelVersion:v13 engagementResetPolicy:1];

  v16 = [a1 _executableSpecificationForInfoSuggestion:v12];
  if (v16)
  {
    v17 = [v12 appBundleIdentifier];
    id v18 = (void *)CFPreferencesCopyValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    int v19 = [v18 containsObject:v17];

    if (!v19)
    {
      id v23 = [a1 _uiSpecForInfoSuggestion:v12];
      if (v23)
      {
        id v24 = [[ATXProactiveSuggestionScoreSpecification alloc] initWithRawScore:a7 suggestedConfidenceCategory:a6];
        v22 = [[ATXProactiveSuggestion alloc] initWithClientModelSpecification:v15 executableSpecification:v16 uiSpecification:v23 scoreSpecification:v24];
      }
      else
      {
        v22 = 0;
      }

      goto LABEL_11;
    }
    id v20 = __atxlog_handle_gi();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v12 appBundleIdentifier];
      int v26 = 136315394;
      uint64_t v27 = "+[ATXInfoSuggestion proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:]";
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      _os_log_impl(&dword_1AE67F000, v20, OS_LOG_TYPE_DEFAULT, "%s: BundleId: %@ is disabled to show suggestions on home screen", (uint8_t *)&v26, 0x16u);
    }
  }
  v22 = 0;
LABEL_11:

  return v22;
}

+ (id)_executableSpecificationForInfoSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = [ATXProactiveSuggestionExecutableSpecification alloc];
  id v5 = [v3 description];
  id v6 = [v3 suggestionIdentifier];
  id v7 = [(ATXProactiveSuggestionExecutableSpecification *)v4 initWithExecutableObject:v3 executableDescription:v5 executableIdentifier:v6 suggestionExecutableType:3];

  return v7;
}

+ (id)_uiSpecForInfoSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = +[ATXProactiveSuggestionLayoutConfig layoutConfigurationsForLayoutOptions:](ATXProactiveSuggestionLayoutConfig, "layoutConfigurationsForLayoutOptions:", [v3 layouts]);
  if ([v4 count])
  {
    id v5 = [ATXProactiveSuggestionUISpecification alloc];
    id v6 = [v3 widgetBundleIdentifier];
    LOWORD(v9) = 0;
    id v7 = -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:](v5, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v6, 0, 0, v4, 0, 1, v9);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)infoSuggestionFromProactiveSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && ([v3 executableSpecification],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 executableType],
        v5,
        v6 == 3))
  {
    id v7 = [v4 executableSpecification];
    v8 = [v7 executableClassString];
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    char v11 = [v8 isEqualToString:v10];

    if (v11)
    {
      id v12 = [v4 executableSpecification];
      id v13 = [v12 executableObject];

      if (v13) {
        goto LABEL_12;
      }
      id v14 = __atxlog_handle_gi();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        +[ATXInfoSuggestion infoSuggestionFromProactiveSuggestion:]();
      }
    }
    else
    {
      id v14 = __atxlog_handle_gi();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        +[ATXInfoSuggestion infoSuggestionFromProactiveSuggestion:]();
      }
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_12:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXInfoSuggestion *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (id)_safeDecodeObjectOfClass:(Class)a3 allowedClasses:(id)a4 forKey:(id)a5 withCoder:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [v10 decodeObjectOfClasses:a4 forKey:v11];
  id v13 = [(ATXInfoSuggestion *)self _verifyAndReturnDecodedObject:v12 ofClass:a3 forKey:v11 withCoder:v10];

  return v13;
}

- (id)_safeDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [v8 decodeObjectOfClass:a3 forKey:v9];
  id v11 = [(ATXInfoSuggestion *)self _verifyAndReturnDecodedObject:v10 ofClass:a3 forKey:v9 withCoder:v8];

  return v11;
}

- (id)_verifyAndReturnDecodedObject:(id)a3 ofClass:(Class)a4 forKey:(id)a5 withCoder:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  id v11 = v10;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = [NSString stringWithFormat:@"key \"%@\" maps to unexpected class", v9];
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = v12;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      v15 = (void *)[v13 initWithDomain:@"ATXInfoSuggestion" code:-1 userInfo:v14];

      [v11 failWithError:v15];
      v16 = __atxlog_handle_gi();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ATXInfoSuggestion _verifyAndReturnDecodedObject:ofClass:forKey:withCoder:]();
      }

LABEL_9:
      id v18 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v17 = [v10 error];

    if (v17)
    {
      id v12 = __atxlog_handle_gi();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ATXInfoSuggestion _verifyAndReturnDecodedObject:ofClass:forKey:withCoder:](v11, v12);
      }
      goto LABEL_9;
    }
  }
  id v18 = v8;
LABEL_11:

  return v18;
}

- (ATXInfoSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];
  if (!v5)
  {
    id v7 = [(ATXInfoSuggestion *)self _safeDecodeObjectOfClass:objc_opt_class() forKey:@"app" withCoder:v4];
    id v8 = [(ATXInfoSuggestion *)self _safeDecodeObjectOfClass:objc_opt_class() forKey:@"widget" withCoder:v4];
    id v9 = [(ATXInfoSuggestion *)self _safeDecodeObjectOfClass:objc_opt_class() forKey:@"kind" withCoder:v4];
    uint64_t v10 = [(ATXInfoSuggestion *)self _safeDecodeObjectOfClass:objc_opt_class() forKey:@"criterion" withCoder:v4];
    id v11 = (void *)v10;
    if (v7 && v8 && v9 && v10)
    {
      uint64_t v12 = [v4 decodeIntegerForKey:@"layouts"];
      if (v12)
      {
        uint64_t v13 = v12;
        v55.receiver = self;
        v55.super_class = (Class)ATXInfoSuggestion;
        id v14 = [(ATXInfoSuggestion *)&v55 init];
        v15 = v14;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_appBundleIdentifier, v7);
          objc_storeStrong((id *)&v15->_widgetBundleIdentifier, v8);
          v54 = v9;
          objc_storeStrong((id *)&v15->_widgetKind, v9);
          objc_storeStrong((id *)&v15->_criterion, v11);
          v15->_unint64_t layouts = v13;
          uint64_t v16 = [(ATXInfoSuggestion *)v15 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"suggID" withCoder:v4];
          suggestionIdentifier = v15->_suggestionIdentifier;
          v15->_suggestionIdentifier = (NSString *)v16;

          uint64_t v18 = [(ATXInfoSuggestion *)v15 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"startDate" withCoder:v4];
          startDate = v15->_startDate;
          v15->_startDate = (NSDate *)v18;

          uint64_t v20 = [(ATXInfoSuggestion *)v15 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"endDate" withCoder:v4];
          endDate = v15->_endDate;
          v15->_endDate = (NSDate *)v20;

          uint64_t v22 = [(ATXInfoSuggestion *)v15 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"intent" withCoder:v4];
          intent = v15->_intent;
          v15->_intent = (INIntent *)v22;

          if (!v15->_intent)
          {
            id v24 = [(ATXInfoSuggestion *)v15 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"intentDescription" withCoder:v4];
            id v25 = v24;
            if (v24)
            {
              uint64_t v26 = [v24 createIntent];
              uint64_t v27 = v15->_intent;
              v15->_intent = (INIntent *)v26;

              if (!v15->_intent)
              {
                __int16 v28 = v11;
                uint64_t v29 = __atxlog_handle_gi();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
                  -[ATXInfoSuggestion initWithCoder:]();
                }

                id v11 = v28;
              }
            }
          }
          uint64_t v30 = objc_opt_class();
          v52 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v53 = v30;
          uint64_t v51 = objc_opt_class();
          uint64_t v50 = objc_opt_class();
          uint64_t v31 = v11;
          uint64_t v32 = objc_opt_class();
          uint64_t v33 = v8;
          v34 = v7;
          uint64_t v35 = objc_opt_class();
          uint64_t v36 = objc_opt_class();
          uint64_t v49 = v35;
          id v7 = v34;
          id v8 = v33;
          uint64_t v48 = v32;
          id v11 = v31;
          uint64_t v37 = objc_msgSend(v52, "setWithObjects:", v51, v50, v48, v49, v36, objc_opt_class(), 0);
          uint64_t v38 = [(ATXInfoSuggestion *)v15 _safeDecodeObjectOfClass:v53 allowedClasses:v37 forKey:@"meta" withCoder:v4];
          metadata = v15->_metadata;
          v15->_metadata = (NSDictionary *)v38;

          uint64_t v40 = [(ATXInfoSuggestion *)v15 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"src" withCoder:v4];
          sourceIdentifier = v15->_sourceIdentifier;
          v15->_sourceIdentifier = (NSString *)v40;

          v15->_confidenceLevel = [v4 decodeIntegerForKey:@"confLevel"];
          uint64_t v42 = [(ATXInfoSuggestion *)v15 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"clientModelId" withCoder:v4];
          clientModelId = v15->_clientModelId;
          v15->_clientModelId = (NSString *)v42;

          uint64_t v44 = [(ATXInfoSuggestion *)v15 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"relevanceScore" withCoder:v4];
          relevanceScore = v15->_relevanceScore;
          v15->_relevanceScore = (NSNumber *)v44;

          id v9 = v54;
        }
        self = v15;
        uint64_t v6 = self;
        goto LABEL_23;
      }
      id v46 = __atxlog_handle_gi();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[ATXInfoSuggestion initWithCoder:]();
      }
    }
    else
    {
      id v46 = __atxlog_handle_gi();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[ATXInfoSuggestion initWithCoder:]();
      }
    }

    uint64_t v6 = 0;
LABEL_23:

    goto LABEL_24;
  }
  self = [(ATXInfoSuggestion *)self initWithProtoData:v5];
  uint64_t v6 = self;
LABEL_24:

  return v6;
}

- (void)handleMemoryPressure
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_intentProtoData && v2->_intent)
  {
    id v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1AE67F000, v3, OS_LOG_TYPE_DEFAULT, "Purging intent proto data due to memory pressure", v5, 2u);
    }

    intentProtoData = v2->_intentProtoData;
    v2->_intentProtoData = 0;
  }
  objc_sync_exit(v2);
}

- (id)encodeAsProto
{
  v2 = [(ATXInfoSuggestion *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXInfoSuggestion)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBInfoSuggestion alloc] initWithData:v4];

    self = [(ATXInfoSuggestion *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (ATXInfoSuggestion)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXInfoSuggestion initWithProto:].cold.7((uint64_t)self, v5);
      }
      uint64_t v12 = 0;
      goto LABEL_42;
    }
    id v5 = v4;
    uint64_t v6 = [v5 appBundleIdentifier];
    id v7 = [v5 widgetBundleIdentifier];
    uint64_t v8 = [v5 criterion];
    id v9 = (void *)v8;
    if (!v6 || !v7 || !v8)
    {
      uint64_t v13 = __atxlog_handle_gi();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXInfoSuggestion initWithProto:].cold.6();
      }
      uint64_t v12 = 0;
      goto LABEL_41;
    }
    [v5 archivedIntent];
    v54 = v7;
    obj = objc_super v55 = v6;
    uint64_t v53 = v9;
    if (obj)
    {
      uint64_t v10 = __atxlog_handle_gi();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[ATXInfoSuggestion initWithProto:].cold.5();
      }
      uint64_t v11 = 0;
    }
    else
    {
      if (![v5 hasArchivedIntentDescription])
      {
        uint64_t v51 = 0;
LABEL_28:
        id v21 = [v5 archivedMetadata];

        unint64_t v22 = 0x1E4F28000uLL;
        if (v21)
        {
          uint64_t v23 = MEMORY[0x1B3E6F520]();
          uint64_t v49 = (void *)MEMORY[0x1E4F28DC0];
          context = (void *)v23;
          id v24 = (void *)MEMORY[0x1B3E6F520]();
          id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v26 = objc_opt_class();
          uint64_t v27 = objc_opt_class();
          uint64_t v28 = objc_opt_class();
          uint64_t v29 = objc_opt_class();
          uint64_t v30 = objc_opt_class();
          uint64_t v31 = objc_msgSend(v25, "initWithObjects:", v26, v27, v28, v29, v30, objc_opt_class(), 0);
          uint64_t v32 = [v5 archivedMetadata];
          id v56 = 0;
          uint64_t v33 = [v49 unarchivedObjectOfClasses:v31 fromData:v32 error:&v56];
          id v34 = v56;

          if (v34)
          {
            uint64_t v35 = __atxlog_handle_gi();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              -[ATXInfoSuggestion initWithProto:]();
            }
          }
          unint64_t v22 = 0x1E4F28000;
        }
        else
        {
          uint64_t v33 = 0;
        }
        if ([v5 hasRelevanceScore])
        {
          uint64_t v36 = *(void **)(v22 + 3792);
          [v5 relevanceScore];
          uint64_t v37 = objc_msgSend(v36, "numberWithDouble:");
        }
        else
        {
          uint64_t v37 = 0;
        }
        uint64_t v38 = [v5 widgetKind];
        uint64_t v39 = [v5 layouts];
        uint64_t v40 = [v5 suggestionIdentifier];
        v41 = (void *)MEMORY[0x1E4F1C9C8];
        [v5 startDate];
        uint64_t v42 = objc_msgSend(v41, "dateWithTimeIntervalSinceReferenceDate:");
        v43 = (void *)MEMORY[0x1E4F1C9C8];
        [v5 endDate];
        uint64_t v44 = objc_msgSend(v43, "dateWithTimeIntervalSinceReferenceDate:");
        id v45 = [(ATXInfoSuggestion *)self initWithAppBundleIdentifier:v55 widgetBundleIdentifier:v54 widgetKind:v38 criterion:v53 applicableLayouts:v39 suggestionIdentifier:v40 startDate:v42 endDate:v44 intent:0 metadata:v33 relevanceScore:v37];

        if (v45)
        {
          id v46 = [v5 clientModelId];
          [(ATXInfoSuggestion *)v45 setClientModelId:v46];

          [(ATXInfoSuggestion *)v45 setConfidenceLevel:[v5 confidenceLevel]];
          id v47 = [v5 sourceIdentifier];
          [(ATXInfoSuggestion *)v45 setSourceIdentifier:v47];

          objc_storeStrong((id *)&v45->_intentProtoData, obj);
          objc_storeStrong((id *)&v45->_intentDescription, v51);
        }
        self = v45;

        uint64_t v12 = self;
        id v7 = v54;
        uint64_t v6 = v55;
        uint64_t v13 = obj;
        id v9 = v53;
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      id v14 = __atxlog_handle_gi();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[ATXInfoSuggestion initWithProto:].cold.4();
      }

      v15 = (void *)MEMORY[0x1B3E6F520]();
      uint64_t v16 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = [v5 archivedIntentDescription];
      id v57 = 0;
      uint64_t v11 = [v16 unarchivedObjectOfClass:v17 fromData:v18 error:&v57];
      uint64_t v10 = v57;

      int v19 = __atxlog_handle_gi();
      uint64_t v20 = v19;
      if (v10)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[ATXInfoSuggestion initWithProto:]();
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[ATXInfoSuggestion initWithProto:]();
      }
    }
    uint64_t v51 = (void *)v11;

    goto LABEL_28;
  }
  uint64_t v12 = 0;
LABEL_43:

  return v12;
}

- (INIntent)intent
{
  v2 = self;
  objc_sync_enter(v2);
  intent = v2->_intent;
  if (intent) {
    goto LABEL_2;
  }
  intentDescription = v2->_intentDescription;
  if (intentDescription)
  {
    uint64_t v7 = [(ATXCustomIntentDescription *)intentDescription createIntent];
    uint64_t v8 = v2->_intent;
    v2->_intent = (INIntent *)v7;

    intent = v2->_intent;
    if (intent)
    {
LABEL_2:
      id v4 = intent;
      goto LABEL_3;
    }
    id v9 = __atxlog_handle_gi();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      [(ATXInfoSuggestion *)(uint64_t)v2 intent];
    }
  }
  if (v2->_intentProtoData)
  {
    uint64_t v10 = __atxlog_handle_gi();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ATXInfoSuggestion intent]();
    }

    uint64_t v11 = (void *)MEMORY[0x1B3E6F520]();
    uint64_t v12 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v13 = objc_opt_class();
    intentProtoData = v2->_intentProtoData;
    id v19 = 0;
    uint64_t v15 = [v12 unarchivedObjectOfClass:v13 fromData:intentProtoData error:&v19];
    id v16 = v19;
    uint64_t v17 = v2->_intent;
    v2->_intent = (INIntent *)v15;

    if (v16)
    {
      uint64_t v18 = __atxlog_handle_gi();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ATXInfoSuggestion intent]();
      }
    }
    id v4 = v2->_intent;
  }
  else
  {
    id v4 = 0;
  }
LABEL_3:
  objc_sync_exit(v2);

  return v4;
}

- (id)proto
{
  id v3 = objc_opt_new();
  [v3 setAppBundleIdentifier:self->_appBundleIdentifier];
  [v3 setWidgetBundleIdentifier:self->_widgetBundleIdentifier];
  [v3 setWidgetKind:self->_widgetKind];
  [v3 setCriterion:self->_criterion];
  [v3 setLayouts:self->_layouts];
  [v3 setSuggestionIdentifier:self->_suggestionIdentifier];
  [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setStartDate:");
  [(NSDate *)self->_endDate timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setEndDate:");
  [v3 setClientModelId:self->_clientModelId];
  [v3 setConfidenceLevel:self->_confidenceLevel];
  uint64_t v4 = [v3 setSourceIdentifier:self->_sourceIdentifier];
  if (self->_intentDescription)
  {
    id v5 = (void *)MEMORY[0x1B3E6F520](v4);
    intentDescription = self->_intentDescription;
    id v27 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:intentDescription requiringSecureCoding:1 error:&v27];
    id v8 = v27;
    [v3 setArchivedIntentDescription:v7];

    if (v8)
    {
      id v9 = __atxlog_handle_gi();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ATXInfoSuggestion proto]();
      }
    }
  }
  uint64_t v10 = self;
  objc_sync_enter(v10);
  if (v10->_intentProtoData)
  {
    objc_msgSend(v3, "setArchivedIntent:");
  }
  else if (!self->_intentDescription)
  {
    uint64_t v11 = [(ATXInfoSuggestion *)v10 intent];

    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x1B3E6F520]();
      uint64_t v13 = (void *)MEMORY[0x1E4F28DB0];
      id v14 = [(ATXInfoSuggestion *)v10 intent];
      id v26 = 0;
      uint64_t v15 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v26];
      id v16 = v26;
      [v3 setArchivedIntent:v15];

      if (v16)
      {
        uint64_t v17 = __atxlog_handle_gi();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[ATXInfoSuggestion proto]();
        }
      }
    }
  }
  objc_sync_exit(v10);

  if (v10->_metadata)
  {
    uint64_t v18 = (void *)MEMORY[0x1B3E6F520]();
    metadata = v10->_metadata;
    id v25 = 0;
    uint64_t v20 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:metadata requiringSecureCoding:1 error:&v25];
    id v21 = v25;
    [v3 setArchivedMetadata:v20];

    if (v21)
    {
      unint64_t v22 = __atxlog_handle_gi();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ATXInfoSuggestion proto]();
      }
    }
  }
  relevanceScore = v10->_relevanceScore;
  if (relevanceScore)
  {
    [(NSNumber *)relevanceScore doubleValue];
    objc_msgSend(v3, "setRelevanceScore:");
  }
  else
  {
    [v3 setHasRelevanceScore:0];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXInfoSuggestion *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXInfoSuggestion *)self isEqualToATXInfoSuggestion:v5];

  return v6;
}

- (BOOL)isEqualToATXInfoSuggestion:(id)a3
{
  id v5 = a3;
  appBundleIdentifier = self->_appBundleIdentifier;
  uint64_t v7 = [v5 appBundleIdentifier];
  if (![(NSString *)appBundleIdentifier isEqualToString:v7]) {
    goto LABEL_11;
  }
  widgetBundleIdentifier = self->_widgetBundleIdentifier;
  id v9 = [v5 widgetBundleIdentifier];
  if (![widgetBundleIdentifier isEqualToString:v9])
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  widgetKind = self->_widgetKind;
  uint64_t v11 = widgetKind;
  if (!widgetKind)
  {
    widgetBundleIdentifier = [v5 widgetKind];
    if (!widgetBundleIdentifier)
    {
      int v12 = 0;
      goto LABEL_15;
    }
    uint64_t v11 = self->_widgetKind;
  }
  id v3 = [v5 widgetKind];
  if (![(NSString *)v11 isEqualToString:v3])
  {

    if (!widgetKind) {
    goto LABEL_10;
    }
  }
  int v12 = 1;
LABEL_15:
  criterion = self->_criterion;
  id v16 = [v5 criterion];
  if (![(NSString *)criterion isEqualToString:v16]
    || (int64_t confidenceLevel = self->_confidenceLevel, confidenceLevel != [v5 confidenceLevel])
    || (unint64_t layouts = self->_layouts, layouts != [v5 layouts]))
  {

    BOOL v21 = 0;
    if ((v12 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  suggestionIdentifier = self->_suggestionIdentifier;
  v66 = suggestionIdentifier;
  if (!suggestionIdentifier)
  {
    uint64_t v20 = [v5 suggestionIdentifier];
    if (!v20)
    {
      v61 = 0;
      int v64 = 0;
      goto LABEL_45;
    }
    v61 = (void *)v20;
    suggestionIdentifier = self->_suggestionIdentifier;
  }
  v65 = [v5 suggestionIdentifier];
  if (!-[NSString isEqualToString:](suggestionIdentifier, "isEqualToString:"))
  {
    BOOL v21 = 0;
    goto LABEL_99;
  }
  int v64 = 1;
LABEL_45:
  startDate = self->_startDate;
  v63 = startDate;
  if (!startDate)
  {
    uint64_t v30 = [v5 startDate];
    if (!v30)
    {
      id v57 = 0;
      int v60 = 0;
      goto LABEL_52;
    }
    id v57 = (void *)v30;
    startDate = self->_startDate;
  }
  v62 = [v5 startDate];
  -[NSDate timeIntervalSinceDate:](startDate, "timeIntervalSinceDate:");
  if (fabs(v31) >= 1.0)
  {
    BOOL v21 = 0;
    goto LABEL_96;
  }
  int v60 = 1;
LABEL_52:
  endDate = self->_endDate;
  v59 = endDate;
  if (!endDate)
  {
    uint64_t v33 = [v5 endDate];
    if (!v33)
    {
      uint64_t v53 = 0;
      int v56 = 0;
      goto LABEL_64;
    }
    uint64_t v53 = (void *)v33;
    endDate = self->_endDate;
  }
  v58 = [v5 endDate];
  -[NSDate timeIntervalSinceDate:](endDate, "timeIntervalSinceDate:");
  if (fabs(v34) >= 1.0)
  {
    BOOL v21 = 0;
    goto LABEL_93;
  }
  int v56 = 1;
LABEL_64:
  metadata = self->_metadata;
  objc_super v55 = metadata;
  if (!metadata)
  {
    uint64_t v39 = [v5 metadata];
    if (!v39)
    {
      uint64_t v50 = 0;
      int v52 = 0;
      goto LABEL_77;
    }
    uint64_t v50 = (void *)v39;
    metadata = self->_metadata;
  }
  uint64_t v54 = [v5 metadata];
  if (!-[NSDictionary isEqualToDictionary:](metadata, "isEqualToDictionary:"))
  {
    BOOL v21 = 0;
LABEL_89:
    id v46 = (void *)v54;
    goto LABEL_90;
  }
  int v52 = 1;
LABEL_77:
  relevanceScore = self->_relevanceScore;
  if (!relevanceScore)
  {
    uint64_t v45 = [v5 relevanceScore];
    if (!v45)
    {
      id v47 = 0;
      BOOL v21 = 1;
      goto LABEL_88;
    }
    id v47 = (void *)v45;
    if (!self->_relevanceScore)
    {
      BOOL v21 = 0;
      goto LABEL_88;
    }
  }
  uint64_t v51 = relevanceScore;
  uint64_t v41 = [v5 relevanceScore];
  if (v41)
  {
    uint64_t v49 = (void *)v41;
    [(NSNumber *)self->_relevanceScore doubleValue];
    double v43 = v42;
    uint64_t v48 = [v5 relevanceScore];
    [v48 doubleValue];
    BOOL v21 = vabdd_f64(v43, v44) < 0.00000011920929;
  }
  else
  {
    BOOL v21 = 0;
  }
  if (!v51)
  {
LABEL_88:

    if ((v52 & 1) == 0) {
      goto LABEL_91;
    }
    goto LABEL_89;
  }
  id v46 = (void *)v54;
  if (v52) {
LABEL_90:
  }

LABEL_91:
  if (v55)
  {
    if (!v56) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }

  if (v56) {
LABEL_93:
  }

LABEL_94:
  if (v59)
  {
    if (!v60) {
      goto LABEL_97;
    }
    goto LABEL_96;
  }

  if (v60) {
LABEL_96:
  }

LABEL_97:
  if (v63)
  {
    if (!v64) {
      goto LABEL_100;
    }
    goto LABEL_99;
  }

  if (v64) {
LABEL_99:
  }

LABEL_100:
  if (!v66) {

  }
  if (v12) {
LABEL_24:
  }

LABEL_25:
  if (!widgetKind)
  {

    if (v21) {
      goto LABEL_29;
    }
LABEL_12:
    char v13 = 0;
    goto LABEL_13;
  }

  if (!v21) {
    goto LABEL_12;
  }
LABEL_29:
  intentIndexingHash = (void *)self->_intentIndexingHash;
  if (intentIndexingHash)
  {
LABEL_30:
    if ([v5 intentIndexingHash])
    {
      uint64_t v23 = [v5 intentIndexingHash];
    }
    else
    {
      id v25 = [v5 intent];
      uint64_t v23 = objc_msgSend(v25, "atx_indexingHash");
    }
    char v13 = intentIndexingHash == (void *)v23;
    goto LABEL_13;
  }
  if ([v5 intentIndexingHash])
  {
    intentIndexingHash = (void *)self->_intentIndexingHash;
    if (!intentIndexingHash)
    {
      id v24 = [(ATXInfoSuggestion *)self intent];
      intentIndexingHash = objc_msgSend(v24, "atx_indexingHash");
    }
    goto LABEL_30;
  }
  intentDescription = self->_intentDescription;
  id v27 = intentDescription;
  if (!intentDescription)
  {
    intentIndexingHash = [v5 intentDescription];
    if (!intentIndexingHash)
    {
      int v28 = 0;
      goto LABEL_59;
    }
    id v27 = self->_intentDescription;
  }
  id v9 = [v5 intentDescription];
  if ([(ATXCustomIntentDescription *)v27 isEqual:v9])
  {
    int v28 = 1;
LABEL_59:
    uint64_t v35 = [(ATXInfoSuggestion *)self intent];
    if (v35 || ([v5 intent], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v36 = [(ATXInfoSuggestion *)self intent];
      uint64_t v37 = [v5 intent];
      char v13 = objc_msgSend(v36, "atx_isEqualToIntent:", v37);

      if (v35) {
        goto LABEL_72;
      }
    }
    else
    {
      char v13 = 1;
    }

LABEL_72:
    if (!v28) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
  char v13 = 0;
LABEL_73:

LABEL_74:
  if (!intentDescription) {

  }
LABEL_13:
  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appBundleIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_widgetBundleIdentifier hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_widgetKind hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_criterion hash];
  unint64_t v7 = self->_layouts - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  NSUInteger v8 = [(NSString *)self->_suggestionIdentifier hash] - v7 + 32 * v7;
  return [(NSDictionary *)self->_metadata hash] - v8 + 32 * v8;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSString)widgetBundleIdentifier
{
  return self->_widgetBundleIdentifier;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (NSString)criterion
{
  return self->_criterion;
}

- (int64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (void)setConfidenceLevel:(int64_t)a3
{
  self->_int64_t confidenceLevel = a3;
}

- (NSNumber)relevanceScore
{
  return self->_relevanceScore;
}

- (unint64_t)layouts
{
  return self->_layouts;
}

- (void)setLayouts:(unint64_t)a3
{
  self->_unint64_t layouts = a3;
}

- (NSString)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (void)setSuggestionIdentifier:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (ATXCustomIntentDescription)intentDescription
{
  return self->_intentDescription;
}

- (int64_t)intentIndexingHash
{
  return self->_intentIndexingHash;
}

- (void)setIntentIndexingHash:(int64_t)a3
{
  self->_intentIndexingHash = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_intentDescription, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_relevanceScore, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_intentProtoData, 0);
}

- (void)initWithData:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "error deserializing info suggestion: %@", v2, v3, v4, v5, v6);
}

- (void)_dictionaryRepresentationAvoidingLoadingIntentIfPossible:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AE67F000, v0, v1, "Avoiding loading full intent for info suggestion dictionary", v2, v3, v4, v5, v6);
}

- (void)data
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "error serializing info suggestion: %@", v2, v3, v4, v5, v6);
}

- (void)initWithProactiveSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1AE67F000, v0, v1, "Error converting ATXProactiveSuggestion to ATXInfoSuggestion.", v2, v3, v4, v5, v6);
}

+ (void)infoSuggestionFromProactiveSuggestion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_FAULT, "Found nil ATXInfoSuggestion from ATXProactiveSuggestion with executable type Widget", v1, 2u);
}

+ (void)infoSuggestionFromProactiveSuggestion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_FAULT, "executableClassString is not ATXInfoSuggestion for ATXProactiveSuggestion with executable type Widget", v1, 2u);
}

- (void)_verifyAndReturnDecodedObject:(void *)a1 ofClass:(NSObject *)a2 forKey:withCoder:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "ATXInfoSuggestion: error initWithCoder: %@", v4, 0xCu);
}

- (void)_verifyAndReturnDecodedObject:ofClass:forKey:withCoder:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "ATXInfoSuggestion: %@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1AE67F000, v0, v1, "ATXInfoSuggestion decoding: no applicable layouts", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1AE67F000, v1, OS_LOG_TYPE_FAULT, "ATXInfoSuggestion: could not make intent for %@: %@", v2, 0x16u);
}

- (void)initWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1AE67F000, v0, v1, "ATXInfoSuggestion decoding: appBundleID, widgetBundleID, widgetKind, and criterion must not be nil", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "Could not unarchive metadata for info suggestion: %@", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1AE67F000, v0, OS_LOG_TYPE_DEBUG, "Unarchived intent description: %@", v1, 0xCu);
}

- (void)initWithProto:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "Could not unarchive intent description: %@", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AE67F000, v0, v1, "No intent proto data, but we have an intent description", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AE67F000, v0, v1, "Located intent proto data but not loading it just yet", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1AE67F000, v0, v1, "ATXInfoSuggestion decoding: appBundleID, widgetBundleID, and criterion must not be nil", v2, v3, v4, v5, v6);
}

- (void)initWithProto:(uint64_t)a1 .cold.7(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", v5, 0xCu);
}

- (void)intent
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "ATXInfoSuggestion: could not make intent for %@: %@", (uint8_t *)&v4, 0x16u);
}

- (void)proto
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "Could not archive intent description: %@", v2, v3, v4, v5, v6);
}

@end