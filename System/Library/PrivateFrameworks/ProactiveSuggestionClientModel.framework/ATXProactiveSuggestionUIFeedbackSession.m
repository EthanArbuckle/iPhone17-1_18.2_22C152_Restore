@interface ATXProactiveSuggestionUIFeedbackSession
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestionUIFeedbackSession)initWithCoder:(id)a3;
- (ATXProactiveSuggestionUIFeedbackSession)initWithSessionIdentifier:(id)a3;
- (ATXProactiveSuggestionUIFeedbackSession)initWithSessionUUID:(id)a3 sessionIdentifier:(id)a4 consumerSubType:(unsigned __int8)a5 sessionStartDate:(id)a6 sessionEndDate:(id)a7 blendingUICacheUpdateUUID:(id)a8 engagedUUIDs:(id)a9 rejectedUUIDs:(id)a10 shownUUIDs:(id)a11 sessionMetadata:(id)a12;
- (ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol)sessionMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXProactiveSuggestionUIFeedbackSession:(id)a3;
- (BOOL)isValidSession;
- (NSDate)sessionEndDate;
- (NSDate)sessionStartDate;
- (NSOrderedSet)engagedUUIDs;
- (NSOrderedSet)rejectedUUIDs;
- (NSOrderedSet)shownUUIDs;
- (NSString)sessionIdentifier;
- (NSUUID)blendingUICacheUpdateUUID;
- (NSUUID)sessionUUID;
- (id)mutableEngagedUUIDs;
- (id)mutableRejectedUUIDs;
- (id)mutableShownUUIDs;
- (id)validSessionMetadataClassNames;
- (unint64_t)hash;
- (unsigned)consumerSubType;
- (void)encodeWithCoder:(id)a3;
- (void)updateBlendingUICacheUpdateUUIDIfUnset:(id)a3;
- (void)updateConsumerSubTypeIfUnset:(unsigned __int8)a3;
- (void)updateEngagedUUIDs:(id)a3 rejectedUUIDs:(id)a4 shownUUIDs:(id)a5;
- (void)updateSessionEndDateIfUnset:(id)a3;
- (void)updateSessionMetadataIfUnset:(id)a3;
- (void)updateSessionStartDateIfUnset:(id)a3;
@end

@implementation ATXProactiveSuggestionUIFeedbackSession

- (ATXProactiveSuggestionUIFeedbackSession)initWithSessionIdentifier:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  v9 = [(ATXProactiveSuggestionUIFeedbackSession *)self initWithSessionUUID:v5 sessionIdentifier:v4 consumerSubType:0 sessionStartDate:0 sessionEndDate:0 blendingUICacheUpdateUUID:0 engagedUUIDs:v6 rejectedUUIDs:v7 shownUUIDs:v8 sessionMetadata:0];

  return v9;
}

- (ATXProactiveSuggestionUIFeedbackSession)initWithSessionUUID:(id)a3 sessionIdentifier:(id)a4 consumerSubType:(unsigned __int8)a5 sessionStartDate:(id)a6 sessionEndDate:(id)a7 blendingUICacheUpdateUUID:(id)a8 engagedUUIDs:(id)a9 rejectedUUIDs:(id)a10 shownUUIDs:(id)a11 sessionMetadata:(id)a12
{
  id v36 = a3;
  id v35 = a4;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v37.receiver = self;
  v37.super_class = (Class)ATXProactiveSuggestionUIFeedbackSession;
  v22 = [(ATXProactiveSuggestionUIFeedbackSession *)&v37 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_sessionUUID, a3);
    objc_storeStrong((id *)&v23->_sessionIdentifier, a4);
    v23->_consumerSubType = a5;
    objc_storeStrong((id *)&v23->_sessionStartDate, a6);
    objc_storeStrong((id *)&v23->_sessionEndDate, a7);
    objc_storeStrong((id *)&v23->_blendingUICacheUpdateUUID, a8);
    uint64_t v24 = [v18 mutableCopy];
    engagedUUIDs = v23->_engagedUUIDs;
    v23->_engagedUUIDs = (NSMutableOrderedSet *)v24;

    uint64_t v26 = [v19 mutableCopy];
    rejectedUUIDs = v23->_rejectedUUIDs;
    v23->_rejectedUUIDs = (NSMutableOrderedSet *)v26;

    uint64_t v28 = [v20 mutableCopy];
    shownUUIDs = v23->_shownUUIDs;
    v23->_shownUUIDs = (NSMutableOrderedSet *)v28;

    objc_storeStrong((id *)&v23->_sessionMetadata, a12);
  }

  return v23;
}

- (void)updateConsumerSubTypeIfUnset:(unsigned __int8)a3
{
  if (!self->_consumerSubType) {
    self->_consumerSubType = a3;
  }
}

- (void)updateSessionStartDateIfUnset:(id)a3
{
  id v5 = a3;
  sessionStartDate = self->_sessionStartDate;
  p_sessionStartDate = &self->_sessionStartDate;
  if (!sessionStartDate)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_sessionStartDate, a3);
    id v5 = v8;
  }
}

- (void)updateBlendingUICacheUpdateUUIDIfUnset:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
    p_blendingUICacheUpdateUUID = &self->_blendingUICacheUpdateUUID;
    if (!blendingUICacheUpdateUUID)
    {
      id v8 = v5;
      objc_storeStrong((id *)p_blendingUICacheUpdateUUID, a3);
      id v5 = v8;
    }
  }
}

- (void)updateEngagedUUIDs:(id)a3 rejectedUUIDs:(id)a4 shownUUIDs:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v10) {
    [(NSMutableOrderedSet *)self->_engagedUUIDs addObjectsFromArray:v10];
  }
  if (v8) {
    [(NSMutableOrderedSet *)self->_rejectedUUIDs addObjectsFromArray:v8];
  }
  if (v9) {
    [(NSMutableOrderedSet *)self->_shownUUIDs addObjectsFromArray:v9];
  }
}

- (void)updateSessionMetadataIfUnset:(id)a3
{
  id v5 = a3;
  sessionMetadata = self->_sessionMetadata;
  p_sessionMetadata = &self->_sessionMetadata;
  if (!sessionMetadata)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_sessionMetadata, a3);
    id v5 = v8;
  }
}

- (void)updateSessionEndDateIfUnset:(id)a3
{
  id v5 = a3;
  sessionEndDate = self->_sessionEndDate;
  p_sessionEndDate = &self->_sessionEndDate;
  if (!sessionEndDate)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_sessionEndDate, a3);
    id v5 = v8;
  }
}

- (BOOL)isValidSession
{
  v2 = self;
  LOBYTE(self) = 0;
  if (v2->_consumerSubType)
  {
    if (v2->_consumerSubType != 48)
    {
      self = (ATXProactiveSuggestionUIFeedbackSession *)v2->_sessionStartDate;
      if (self) {
        LOBYTE(self) = v2->_sessionEndDate
      }
                    && ([(ATXProactiveSuggestionUIFeedbackSession *)self timeIntervalSince1970],
                        double v4 = v3,
                        [(NSDate *)v2->_sessionEndDate timeIntervalSince1970],
                        v4 <= v5)
                    && v2->_blendingUICacheUpdateUUID
                    && ((unint64_t v6 = [MEMORY[0x1E4F4B680] consumerTypeForSubType:v2->_consumerSubType],
                         v6 > 0xF)
                     || ((1 << v6) & 0xC002) == 0
                     || v2->_sessionMetadata);
    }
  }
  return (char)self;
}

- (id)validSessionMetadataClassNames
{
  v2 = (void *)MEMORY[0x1B3E6F520](self, a2);
  double v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ATXSpotlightSessionMetadata", @"ATXFakeSessionMetadata", @"ATXHomeScreenSessionMetadata", @"ATXAppDirectorySessionMetadata", 0);
  return v3;
}

- (NSOrderedSet)engagedUUIDs
{
  v2 = (void *)[(NSMutableOrderedSet *)self->_engagedUUIDs copy];
  return (NSOrderedSet *)v2;
}

- (NSOrderedSet)rejectedUUIDs
{
  v2 = (void *)[(NSMutableOrderedSet *)self->_rejectedUUIDs copy];
  return (NSOrderedSet *)v2;
}

- (NSOrderedSet)shownUUIDs
{
  v2 = (void *)[(NSMutableOrderedSet *)self->_shownUUIDs copy];
  return (NSOrderedSet *)v2;
}

- (id)mutableEngagedUUIDs
{
  return self->_engagedUUIDs;
}

- (id)mutableRejectedUUIDs
{
  return self->_engagedUUIDs;
}

- (id)mutableShownUUIDs
{
  return self->_engagedUUIDs;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeObject:self->_sessionUUID forKey:@"sessionUUID"];
  [v7 encodeObject:self->_sessionIdentifier forKey:@"sessionidentifier"];
  double v4 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  [v7 encodeObject:v4 forKey:@"consumersubtype"];

  [v7 encodeObject:self->_sessionStartDate forKey:@"startdate"];
  [v7 encodeObject:self->_sessionEndDate forKey:@"enddate"];
  [v7 encodeObject:self->_blendingUICacheUpdateUUID forKey:@"blendinguuid"];
  [v7 encodeObject:self->_engagedUUIDs forKey:@"engaged"];
  [v7 encodeObject:self->_rejectedUUIDs forKey:@"rejected"];
  [v7 encodeObject:self->_shownUUIDs forKey:@"shown"];
  [v7 encodeObject:self->_sessionMetadata forKey:@"metadata"];
  if (self->_sessionMetadata)
  {
    double v5 = (objc_class *)objc_opt_class();
    unint64_t v6 = NSStringFromClass(v5);
  }
  else
  {
    unint64_t v6 = 0;
  }
  [v7 encodeObject:v6 forKey:@"metadataClassName"];
}

- (ATXProactiveSuggestionUIFeedbackSession)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_blending_ecosystem();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"sessionUUID" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v7];

  if (v8)
  {
    id v9 = [v4 error];

    if (!v9)
    {
      v11 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v12 = objc_opt_class();
      v13 = __atxlog_handle_blending_ecosystem();
      v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"sessionidentifier" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v13];

      if (!v14
        || ([v4 error], v15 = objc_claimAutoreleasedReturnValue(), v15, v15))
      {
        id v10 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      id v18 = __atxlog_handle_blending_ecosystem();
      id v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"consumersubtype" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v18];

      if (!v19
        || ([v4 error],
            id v10 = (ATXProactiveSuggestionUIFeedbackSession *)objc_claimAutoreleasedReturnValue(),
            v10,
            v10))
      {
        id v10 = 0;
LABEL_10:

        goto LABEL_11;
      }
      char v71 = 0;
      unsigned int v21 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:v19 found:&v71];
      if (!v71 || v21 == 48) {
        goto LABEL_10;
      }
      unsigned int v69 = v21;
      v70 = v19;
      v22 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = __atxlog_handle_blending_ecosystem();
      v25 = [v22 robustDecodeObjectOfClass:v23 forKey:@"startdate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v24];

      uint64_t v26 = [v4 error];

      if (v26)
      {
        id v10 = 0;
        id v19 = v70;
LABEL_49:

        goto LABEL_10;
      }
      v67 = v25;
      v27 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v28 = objc_opt_class();
      v29 = __atxlog_handle_blending_ecosystem();
      v68 = [v27 robustDecodeObjectOfClass:v28 forKey:@"enddate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v29];

      v30 = [v4 error];

      if (v30)
      {
        id v10 = 0;
        id v19 = v70;
        v25 = v67;
LABEL_48:

        goto LABEL_49;
      }
      v31 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v32 = objc_opt_class();
      id v33 = __atxlog_handle_blending_ecosystem();
      v66 = [v31 robustDecodeObjectOfClass:v32 forKey:@"blendinguuid" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v33];

      id v34 = [v4 error];

      if (v34)
      {
        id v10 = 0;
        id v19 = v70;
        v25 = v67;
LABEL_47:

        goto LABEL_48;
      }
      id v35 = (void *)MEMORY[0x1B3E6F520]();
      id v36 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = objc_msgSend(v36, "initWithObjects:", v37, objc_opt_class(), 0);
      v39 = (void *)MEMORY[0x1E4F93B90];
      v40 = __atxlog_handle_blending_ecosystem();
      id v10 = [v39 robustDecodeObjectOfClasses:v38 forKey:@"engaged" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v40];

      v41 = v10;
      v65 = (void *)v38;
      if (!v10)
      {
        id v19 = v70;
        goto LABEL_25;
      }
      v42 = [v4 error];

      id v19 = v70;
      if (v42)
      {
        id v10 = 0;
LABEL_25:
        v25 = v67;
LABEL_46:

        goto LABEL_47;
      }
      v64 = v41;
      v43 = (void *)MEMORY[0x1E4F93B90];
      v44 = __atxlog_handle_blending_ecosystem();
      v45 = [v43 robustDecodeObjectOfClasses:v38 forKey:@"rejected" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v44];

      if (!v45
        || ([v4 error], v46 = objc_claimAutoreleasedReturnValue(), v46, v46))
      {
        id v10 = 0;
LABEL_45:

        id v19 = v70;
        v25 = v67;
        v41 = v64;
        goto LABEL_46;
      }
      v47 = (void *)MEMORY[0x1E4F93B90];
      v48 = __atxlog_handle_blending_ecosystem();
      v49 = [v47 robustDecodeObjectOfClasses:v38 forKey:@"shown" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v48];

      if (!v49
        || ([v4 error], v50 = objc_claimAutoreleasedReturnValue(), v50, v50))
      {
        id v10 = 0;
LABEL_44:

        goto LABEL_45;
      }
      v51 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v52 = objc_opt_class();
      v53 = __atxlog_handle_blending_ecosystem();
      aClassName = [v51 robustDecodeObjectOfClass:v52 forKey:@"metadataClassName" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v53];

      v54 = [v4 error];

      if (v54)
      {
        id v10 = 0;
LABEL_43:

        goto LABEL_44;
      }
      if (aClassName
        && (-[ATXProactiveSuggestionUIFeedbackSession validSessionMetadataClassNames](self, "validSessionMetadataClassNames"), v55 = objc_claimAutoreleasedReturnValue(), int v56 = [v55 containsObject:aClassName], v55, v56)&& (v57 = NSClassFromString(aClassName)) != 0)
      {
        Class v58 = v57;
        v59 = (void *)MEMORY[0x1E4F93B90];
        v60 = __atxlog_handle_blending_ecosystem();
        v61 = [v59 robustDecodeObjectOfClass:v58 forKey:@"metadata" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionUIFeedbackSession" errorCode:-1 logHandle:v60];

        if (!v61
          || ([v4 error], v62 = objc_claimAutoreleasedReturnValue(), v62, v62))
        {
          id v10 = 0;
LABEL_42:

          goto LABEL_43;
        }
      }
      else
      {
        v61 = 0;
      }
      self = [(ATXProactiveSuggestionUIFeedbackSession *)self initWithSessionUUID:v8 sessionIdentifier:v14 consumerSubType:v69 sessionStartDate:v67 sessionEndDate:v68 blendingUICacheUpdateUUID:v66 engagedUUIDs:v64 rejectedUUIDs:v45 shownUUIDs:v49 sessionMetadata:v61];
      id v10 = self;
      goto LABEL_42;
    }
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_sessionUUID hash];
  NSUInteger v4 = [(NSString *)self->_sessionIdentifier hash];
  uint64_t v5 = self->_consumerSubType - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  uint64_t v6 = [(NSDate *)self->_sessionStartDate hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSDate *)self->_sessionEndDate hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSUUID *)self->_blendingUICacheUpdateUUID hash] - v7 + 32 * v7;
  uint64_t v9 = [(NSMutableOrderedSet *)self->_engagedUUIDs hash] - v8 + 32 * v8;
  uint64_t v10 = [(NSMutableOrderedSet *)self->_rejectedUUIDs hash] - v9 + 32 * v9;
  uint64_t v11 = [(NSMutableOrderedSet *)self->_shownUUIDs hash] - v10 + 32 * v10;
  return [(ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol *)self->_sessionMetadata hash]
       - v11
       + 32 * v11;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATXProactiveSuggestionUIFeedbackSession *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXProactiveSuggestionUIFeedbackSession *)self isEqualToATXProactiveSuggestionUIFeedbackSession:v5];

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionUIFeedbackSession:(id)a3
{
  NSUInteger v4 = (id *)a3;
  sessionUUID = self->_sessionUUID;
  BOOL v6 = (NSUUID *)v4[5];
  if (sessionUUID == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = sessionUUID;
    char v9 = [(NSUUID *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_32;
    }
  }
  sessionIdentifier = self->_sessionIdentifier;
  uint64_t v11 = (NSString *)v4[6];
  if (sessionIdentifier == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    v13 = sessionIdentifier;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_32;
    }
  }
  if (self->_consumerSubType != *((unsigned __int8 *)v4 + 32))
  {
LABEL_32:
    char v45 = 0;
    goto LABEL_33;
  }
  sessionStartDate = self->_sessionStartDate;
  v16 = (NSDate *)v4[7];
  if (sessionStartDate == v16)
  {
  }
  else
  {
    uint64_t v17 = v16;
    id v18 = sessionStartDate;
    char v19 = [(NSDate *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_32;
    }
  }
  sessionEndDate = self->_sessionEndDate;
  unsigned int v21 = (NSDate *)v4[8];
  if (sessionEndDate == v21)
  {
  }
  else
  {
    v22 = v21;
    uint64_t v23 = sessionEndDate;
    char v24 = [(NSDate *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_32;
    }
  }
  blendingUICacheUpdateUUID = self->_blendingUICacheUpdateUUID;
  uint64_t v26 = (NSUUID *)v4[9];
  if (blendingUICacheUpdateUUID == v26)
  {
  }
  else
  {
    v27 = v26;
    uint64_t v28 = blendingUICacheUpdateUUID;
    char v29 = [(NSUUID *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_32;
    }
  }
  engagedUUIDs = self->_engagedUUIDs;
  v31 = (NSMutableOrderedSet *)v4[1];
  if (engagedUUIDs == v31)
  {
  }
  else
  {
    uint64_t v32 = v31;
    id v33 = engagedUUIDs;
    char v34 = [(NSMutableOrderedSet *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_32;
    }
  }
  rejectedUUIDs = self->_rejectedUUIDs;
  id v36 = (NSMutableOrderedSet *)v4[2];
  if (rejectedUUIDs == v36)
  {
  }
  else
  {
    uint64_t v37 = v36;
    uint64_t v38 = rejectedUUIDs;
    char v39 = [(NSMutableOrderedSet *)v38 isEqual:v37];

    if ((v39 & 1) == 0) {
      goto LABEL_32;
    }
  }
  shownUUIDs = self->_shownUUIDs;
  v41 = (NSMutableOrderedSet *)v4[3];
  if (shownUUIDs == v41)
  {
  }
  else
  {
    v42 = v41;
    v43 = shownUUIDs;
    char v44 = [(NSMutableOrderedSet *)v43 isEqual:v42];

    if ((v44 & 1) == 0) {
      goto LABEL_32;
    }
  }
  v47 = self->_sessionMetadata;
  v48 = v47;
  if (v47 == v4[10]) {
    char v45 = 1;
  }
  else {
    char v45 = -[ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol isEqual:](v47, "isEqual:");
  }

LABEL_33:
  return v45;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSDate)sessionEndDate
{
  return self->_sessionEndDate;
}

- (NSUUID)blendingUICacheUpdateUUID
{
  return self->_blendingUICacheUpdateUUID;
}

- (ATXProactiveSuggestionUIFeedbackSessionMetadataProtocol)sessionMetadata
{
  return self->_sessionMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionMetadata, 0);
  objc_storeStrong((id *)&self->_blendingUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_shownUUIDs, 0);
  objc_storeStrong((id *)&self->_rejectedUUIDs, 0);
  objc_storeStrong((id *)&self->_engagedUUIDs, 0);
}

@end