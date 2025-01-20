@interface ATXProactiveSuggestionUISpecification
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestionUISpecification)initWithCoder:(id)a3;
- (ATXProactiveSuggestionUISpecification)initWithProto:(id)a3;
- (ATXProactiveSuggestionUISpecification)initWithProtoData:(id)a3;
- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 preferredLayoutConfigs:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomeScreen:(BOOL)a8 allowedOnSpotlight:(BOOL)a9 shouldClearOnEngagement:(BOOL)a10;
- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 preferredLayoutConfigs:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomeScreen:(BOOL)a8 allowedOnSpotlight:(BOOL)a9 shouldClearOnEngagement:(BOOL)a10 predictionReasons:(unint64_t)a11;
- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 preferredLayoutConfigs:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomeScreen:(BOOL)a8 allowedOnSpotlight:(BOOL)a9 shouldClearOnEngagement:(BOOL)a10 predictionReasons:(unint64_t)a11 contextStartDate:(id)a12 contextEndDate:(id)a13;
- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 preferredLayoutConfigs:(id)a5 allowedOnLockscreen:(BOOL)a6 allowedOnHomeScreen:(BOOL)a7 allowedOnSpotlight:(BOOL)a8;
- (BOOL)allowedOnHomeScreen;
- (BOOL)allowedOnLockscreen;
- (BOOL)allowedOnSpotlight;
- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldClearOnEngagement;
- (NSArray)preferredLayoutConfigs;
- (NSDate)contextEndDate;
- (NSDate)contextStartDate;
- (NSString)reason;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProto;
- (id)jsonRawData;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)predictionReasons;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
@end

@implementation ATXProactiveSuggestionUISpecification

- (ATXProactiveSuggestionUISpecification)initWithProto:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v7 = -[ATXPBProactiveSuggestionUISpecification preferredLayoutConfigs]((uint64_t)v5);
      v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v9 = -[ATXPBProactiveSuggestionUISpecification preferredLayoutConfigs]((uint64_t)v5);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = [[ATXProactiveSuggestionLayoutConfig alloc] initWithProto:*(void *)(*((void *)&v28 + 1) + 8 * i)];
            [v8 addObject:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v11);
      }

      v27 = -[ATXPBProactiveSuggestionUISpecification title]((uint64_t)v5);
      v15 = -[ATXPBProactiveSuggestionUISpecification subtitle]((uint64_t)v5);
      v16 = -[ATXPBProactiveSuggestionUISpecification reason]((uint64_t)v5);
      BOOL v26 = -[ATXPBProactiveSuggestionUISpecification allowedOnLockscreen]((BOOL)v5);
      BOOL v25 = -[ATXPBProactiveSuggestionUISpecification allowedOnHomeScreen]((BOOL)v5);
      BOOL v24 = -[ATXPBProactiveSuggestionUISpecification allowedOnSpotlight]((BOOL)v5);
      BOOL v17 = -[ATXPBProactiveSuggestionUISpecification shouldClearOnEngagement]((BOOL)v5);
      uint64_t v18 = -[ATXPBProactiveSuggestionUISpecification predictionReasons]((uint64_t)v5);
      if (-[ATXPBProactiveSuggestionUISpecification hasContextStartDate]((uint64_t)v5)) {
        v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:-[ATXPBProactiveSuggestionUISpecification contextStartDate]((uint64_t)v5)];
      }
      else {
        v19 = 0;
      }
      if (-[ATXPBProactiveSuggestionUISpecification hasContextEndDate]((uint64_t)v5)) {
        v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:-[ATXPBProactiveSuggestionUISpecification contextEndDate]((uint64_t)v5)];
      }
      else {
        v21 = 0;
      }
      BYTE1(v23) = v17;
      LOBYTE(v23) = v24;
      self = -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:](self, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:", v27, v15, v16, v8, v26, v25, v23, v18, v19, v21);

      v20 = self;
    }
    else
    {
      v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXProactiveSuggestionUISpecification initWithProto:]();
      }
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 preferredLayoutConfigs:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomeScreen:(BOOL)a8 allowedOnSpotlight:(BOOL)a9 shouldClearOnEngagement:(BOOL)a10 predictionReasons:(unint64_t)a11 contextStartDate:(id)a12 contextEndDate:(id)a13
{
  id v34 = a3;
  id v33 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a12;
  id v22 = a13;
  v35.receiver = self;
  v35.super_class = (Class)ATXProactiveSuggestionUISpecification;
  uint64_t v23 = [(ATXProactiveSuggestionUISpecification *)&v35 init];
  if (v23)
  {
    uint64_t v24 = [v34 copy];
    title = v23->_title;
    v23->_title = (NSString *)v24;

    uint64_t v26 = [v33 copy];
    subtitle = v23->_subtitle;
    v23->_subtitle = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    reason = v23->_reason;
    v23->_reason = (NSString *)v28;

    uint64_t v30 = [v20 copy];
    preferredLayoutConfigs = v23->_preferredLayoutConfigs;
    v23->_preferredLayoutConfigs = (NSArray *)v30;

    v23->_allowedOnLockscreen = a7;
    v23->_allowedOnHomeScreen = a8;
    v23->_allowedOnSpotlight = a9;
    v23->_shouldClearOnEngagement = a10;
    v23->_predictionReasons = a11;
    objc_storeStrong((id *)&v23->_contextStartDate, a12);
    objc_storeStrong((id *)&v23->_contextEndDate, a13);
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextEndDate, 0);
  objc_storeStrong((id *)&self->_contextStartDate, 0);
  objc_storeStrong((id *)&self->_preferredLayoutConfigs, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 preferredLayoutConfigs:(id)a5 allowedOnLockscreen:(BOOL)a6 allowedOnHomeScreen:(BOOL)a7 allowedOnSpotlight:(BOOL)a8
{
  BYTE1(v9) = 1;
  LOBYTE(v9) = a8;
  return -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:](self, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", a3, a4, 0, a5, a6, a7, v9);
}

- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 preferredLayoutConfigs:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomeScreen:(BOOL)a8 allowedOnSpotlight:(BOOL)a9 shouldClearOnEngagement:(BOOL)a10
{
  LOWORD(v11) = __PAIR16__(a10, a9);
  return -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:](self, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", a3, a4, a5, a6, a7, a8, v11, 0);
}

- (ATXProactiveSuggestionUISpecification)initWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 preferredLayoutConfigs:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomeScreen:(BOOL)a8 allowedOnSpotlight:(BOOL)a9 shouldClearOnEngagement:(BOOL)a10 predictionReasons:(unint64_t)a11
{
  LOWORD(v12) = __PAIR16__(a10, a9);
  return -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:](self, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:", a3, a4, a5, a6, a7, a8, v12, a11, 0, 0);
}

- (id)description
{
  id v3 = [NSString alloc];
  title = self->_title;
  subtitle = self->_subtitle;
  NSUInteger v6 = [(NSString *)self->_reason hash];
  v7 = @"Yes";
  if (self->_shouldClearOnEngagement) {
    v8 = @"Yes";
  }
  else {
    v8 = @"No";
  }
  if (self->_allowedOnLockscreen) {
    uint64_t v9 = @"Yes";
  }
  else {
    uint64_t v9 = @"No";
  }
  if (self->_allowedOnHomeScreen) {
    uint64_t v10 = @"Yes";
  }
  else {
    uint64_t v10 = @"No";
  }
  if (!self->_allowedOnSpotlight) {
    v7 = @"No";
  }
  uint64_t v11 = (void *)[v3 initWithFormat:@"Title: %@   Subtitle: %@   Reason.hash: %lu   Layouts: %@   Should clear on engagement: %@   Allowed on Lockscreen: %@   Allowed on HomeScreen: %@   Allowed on Spotlight: %@   Executable prediction reason: %llu   ", title, subtitle, v6, self->_preferredLayoutConfigs, v8, v9, v10, v7, self->_predictionReasons];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXProactiveSuggestionUISpecification allocWithZone:a3];
  v5 = (void *)[(NSString *)self->_title copy];
  NSUInteger v6 = (void *)[(NSString *)self->_subtitle copy];
  v7 = (void *)[(NSString *)self->_reason copy];
  v8 = (void *)[(NSArray *)self->_preferredLayoutConfigs copy];
  LOWORD(v11) = *(_WORD *)&self->_allowedOnSpotlight;
  uint64_t v9 = -[ATXProactiveSuggestionUISpecification initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:](v4, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:", v5, v6, v7, v8, self->_allowedOnLockscreen, self->_allowedOnHomeScreen, v11, self->_predictionReasons, self->_contextStartDate, self->_contextEndDate);

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_subtitle hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_reason hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_preferredLayoutConfigs hash];
  uint64_t v7 = self->_allowedOnLockscreen - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  uint64_t v8 = self->_allowedOnHomeScreen - v7 + 32 * v7;
  uint64_t v9 = self->_allowedOnSpotlight - v8 + 32 * v8;
  uint64_t v10 = self->_shouldClearOnEngagement - v9 + 32 * v9;
  unint64_t v11 = self->_predictionReasons - v10 + 32 * v10;
  uint64_t v12 = (char *)&self->_contextStartDate[4 * v11] - v11;
  return (char *)self->_contextEndDate - v12 + 32 * (void)v12;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATXProactiveSuggestionUISpecification *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      title = self->_title;
      uint64_t v7 = v5->_title;
      if (title == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        uint64_t v9 = title;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_28;
        }
      }
      subtitle = self->_subtitle;
      v13 = v5->_subtitle;
      if (subtitle == v13)
      {
      }
      else
      {
        v14 = v13;
        v15 = subtitle;
        char v16 = [(NSString *)v15 isEqual:v14];

        if ((v16 & 1) == 0) {
          goto LABEL_28;
        }
      }
      reason = self->_reason;
      uint64_t v18 = v5->_reason;
      if (reason == v18)
      {
      }
      else
      {
        id v19 = v18;
        id v20 = reason;
        char v21 = [(NSString *)v20 isEqual:v19];

        if ((v21 & 1) == 0) {
          goto LABEL_28;
        }
      }
      preferredLayoutConfigs = self->_preferredLayoutConfigs;
      uint64_t v23 = v5->_preferredLayoutConfigs;
      if (preferredLayoutConfigs == v23)
      {
      }
      else
      {
        uint64_t v24 = v23;
        BOOL v25 = preferredLayoutConfigs;
        char v26 = [(NSArray *)v25 isEqual:v24];

        if ((v26 & 1) == 0) {
          goto LABEL_28;
        }
      }
      if (self->_allowedOnLockscreen != [(ATXProactiveSuggestionUISpecification *)v5 allowedOnLockscreen]|| self->_allowedOnHomeScreen != [(ATXProactiveSuggestionUISpecification *)v5 allowedOnHomeScreen]|| self->_allowedOnSpotlight != [(ATXProactiveSuggestionUISpecification *)v5 allowedOnSpotlight]|| self->_shouldClearOnEngagement != [(ATXProactiveSuggestionUISpecification *)v5 shouldClearOnEngagement]|| [(ATXProactiveSuggestionUISpecification *)v5 predictionReasons] != self->_predictionReasons)
      {
        goto LABEL_28;
      }
      contextStartDate = self->_contextStartDate;
      uint64_t v28 = v5->_contextStartDate;
      if (contextStartDate == v28)
      {
      }
      else
      {
        long long v29 = v28;
        uint64_t v30 = contextStartDate;
        char v31 = [(NSDate *)v30 isEqual:v29];

        if ((v31 & 1) == 0)
        {
LABEL_28:
          char v11 = 0;
LABEL_29:

          goto LABEL_30;
        }
      }
      id v33 = self->_contextEndDate;
      id v34 = v33;
      if (v33 == v5->_contextEndDate) {
        char v11 = 1;
      }
      else {
        char v11 = -[NSDate isEqual:](v33, "isEqual:");
      }

      goto LABEL_29;
    }
    char v11 = 0;
  }
LABEL_30:

  return v11;
}

- (id)encodeAsProto
{
  v2 = [(ATXProactiveSuggestionUISpecification *)self proto];
  NSUInteger v3 = [v2 data];

  return v3;
}

- (ATXProactiveSuggestionUISpecification)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    NSUInteger v5 = [[ATXPBProactiveSuggestionUISpecification alloc] initWithData:v4];

    self = [(ATXProactiveSuggestionUISpecification *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = objc_opt_new();
  -[ATXPBProactiveSuggestionUISpecification setTitle:]((uint64_t)v3, self->_title);
  -[ATXPBProactiveSuggestionUISpecification setSubtitle:]((uint64_t)v3, self->_subtitle);
  -[ATXPBProactiveSuggestionUISpecification setReason:]((uint64_t)v3, self->_reason);
  -[ATXPBProactiveSuggestionUISpecification setAllowedOnLockscreen:]((uint64_t)v3, self->_allowedOnLockscreen);
  -[ATXPBProactiveSuggestionUISpecification setAllowedOnHomeScreen:]((uint64_t)v3, self->_allowedOnHomeScreen);
  -[ATXPBProactiveSuggestionUISpecification setAllowedOnSpotlight:]((uint64_t)v3, self->_allowedOnSpotlight);
  -[ATXPBProactiveSuggestionUISpecification setShouldClearOnEngagement:]((uint64_t)v3, self->_shouldClearOnEngagement);
  -[ATXPBProactiveSuggestionUISpecification setPredictionReasons:]((uint64_t)v3, self->_predictionReasons);
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_preferredLayoutConfigs, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  NSUInteger v5 = self->_preferredLayoutConfigs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = [*(id *)(*((void *)&v19 + 1) + 8 * v9) proto];
        if (v10)
        {
          [v4 addObject:v10];
        }
        else
        {
          char v11 = __atxlog_handle_blending();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            [(ATXProactiveSuggestionUISpecification *)&v17 proto];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  -[ATXPBProactiveSuggestionUISpecification setPreferredLayoutConfigs:]((uint64_t)v3, v4);
  contextStartDate = self->_contextStartDate;
  if (contextStartDate)
  {
    [(NSDate *)contextStartDate timeIntervalSinceReferenceDate];
    -[ATXPBProactiveSuggestionUISpecification setContextStartDate:]((uint64_t)v3, v13);
  }
  contextEndDate = self->_contextEndDate;
  if (contextEndDate)
  {
    [(NSDate *)contextEndDate timeIntervalSinceReferenceDate];
    -[ATXPBProactiveSuggestionUISpecification setContextEndDate:]((uint64_t)v3, v15);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    double v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      char v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      long long v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForBOOL:(BOOL)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    double v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      char v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      long long v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXProactiveSuggestionUISpecification *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXProactiveSuggestionUISpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  uint64_t v6 = [(ATXProactiveSuggestionUISpecification *)self initWithProtoData:v5];
  return v6;
}

- (id)jsonRawData
{
  v19[10] = *MEMORY[0x1E4F143B8];
  title = (__CFString *)self->_title;
  subtitle = self->_subtitle;
  if (!title) {
    title = @"nil";
  }
  v18[0] = @"title";
  v18[1] = @"subtitle";
  if (subtitle) {
    id v5 = (__CFString *)subtitle;
  }
  else {
    id v5 = @"nil";
  }
  v19[0] = title;
  v19[1] = v5;
  reason = (__CFString *)self->_reason;
  if (!reason) {
    reason = @"nil";
  }
  v19[2] = reason;
  v18[2] = @"reason";
  v18[3] = @"allowedOnLockscreen";
  uint64_t v7 = [NSNumber numberWithBool:self->_allowedOnLockscreen];
  v19[3] = v7;
  v18[4] = @"allowedOnHomeScreen";
  uint64_t v8 = [NSNumber numberWithBool:self->_allowedOnHomeScreen];
  v19[4] = v8;
  v18[5] = @"allowedOnSpotlight";
  uint64_t v9 = [NSNumber numberWithBool:self->_allowedOnSpotlight];
  v19[5] = v9;
  v18[6] = @"shouldClearOnEngagement";
  char v10 = [NSNumber numberWithBool:self->_shouldClearOnEngagement];
  v19[6] = v10;
  v18[7] = @"predictionReasons";
  id v11 = [NSNumber numberWithUnsignedLongLong:self->_predictionReasons];
  v19[7] = v11;
  v18[8] = @"contextStartDate";
  id v12 = NSNumber;
  [(NSDate *)self->_contextStartDate timeIntervalSinceReferenceDate];
  id v13 = objc_msgSend(v12, "numberWithDouble:");
  v19[8] = v13;
  v18[9] = @"contextEndDate";
  BOOL v14 = NSNumber;
  [(NSDate *)self->_contextEndDate timeIntervalSinceReferenceDate];
  double v15 = objc_msgSend(v14, "numberWithDouble:");
  v19[9] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:10];

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSArray)preferredLayoutConfigs
{
  return self->_preferredLayoutConfigs;
}

- (BOOL)allowedOnLockscreen
{
  return self->_allowedOnLockscreen;
}

- (BOOL)allowedOnHomeScreen
{
  return self->_allowedOnHomeScreen;
}

- (BOOL)allowedOnSpotlight
{
  return self->_allowedOnSpotlight;
}

- (BOOL)shouldClearOnEngagement
{
  return self->_shouldClearOnEngagement;
}

- (unint64_t)predictionReasons
{
  return self->_predictionReasons;
}

- (NSDate)contextStartDate
{
  return self->_contextStartDate;
}

- (NSDate)contextEndDate
{
  return self->_contextEndDate;
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_5();
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_1(&dword_1AE67F000, v4, v5, "Unable to construct class %@ from ProtoBuf object Protobuf object was of class: %@", v6, v7, v8, v9, v10);
}

- (void)proto
{
  OUTLINED_FUNCTION_8(a1, a2);
  _os_log_error_impl(&dword_1AE67F000, v2, OS_LOG_TYPE_ERROR, "Unable to generate inner ProtoBuf class for ATXProactiveSuggestionLayoutConfig", v3, 2u);
}

@end