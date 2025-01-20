@interface ATXShortcutsEditorEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXShortcutsEditorEvent)initWithAbsoluteDate:(double)a3 eventType:(unint64_t)a4 blendingCacheUUID:(id)a5 suggestionUUIDs:(id)a6 metadata:(id)a7;
- (ATXShortcutsEditorEvent)initWithCoder:(id)a3;
- (ATXShortcutsEditorEvent)initWithDate:(id)a3 eventType:(unint64_t)a4 blendingCacheUUID:(id)a5 suggestionUUIDs:(id)a6 metadata:(id)a7;
- (ATXShortcutsEditorEvent)initWithProto:(id)a3;
- (ATXShortcutsEditorEvent)initWithProtoData:(id)a3;
- (ATXShortcutsEditorEventMetadata)metadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXShortcutsEditorEvent:(id)a3;
- (NSArray)suggestionUUIDs;
- (NSDate)date;
- (NSString)description;
- (NSUUID)blendingCacheUUID;
- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
- (id)sessionProcessingOptionsForSessionType:(int64_t)a3;
- (unint64_t)eventType;
- (unint64_t)hash;
- (unsigned)consumerSubType;
- (unsigned)consumerSubTypeForUIStream;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setBlendingCacheUUID:(id)a3;
- (void)setDate:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setSuggestionUUIDs:(id)a3;
- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
@end

@implementation ATXShortcutsEditorEvent

- (ATXShortcutsEditorEvent)initWithDate:(id)a3 eventType:(unint64_t)a4 blendingCacheUUID:(id)a5 suggestionUUIDs:(id)a6 metadata:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  [a3 timeIntervalSince1970];
  v15 = -[ATXShortcutsEditorEvent initWithAbsoluteDate:eventType:blendingCacheUUID:suggestionUUIDs:metadata:](self, "initWithAbsoluteDate:eventType:blendingCacheUUID:suggestionUUIDs:metadata:", a4, v14, v13, v12);

  return v15;
}

- (ATXShortcutsEditorEvent)initWithAbsoluteDate:(double)a3 eventType:(unint64_t)a4 blendingCacheUUID:(id)a5 suggestionUUIDs:(id)a6 metadata:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2 && (unint64_t)[v14 count] >= 2)
  {
    v16 = __atxlog_handle_blending();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[ATXShortcutsEditorEvent initWithAbsoluteDate:eventType:blendingCacheUUID:suggestionUUIDs:metadata:]((uint64_t)v14, a4, v16);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)ATXShortcutsEditorEvent;
  v17 = [(ATXShortcutsEditorEvent *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_absoluteDate = a3;
    v17->_eventType = a4;
    objc_storeStrong((id *)&v17->_blendingCacheUUID, a5);
    objc_storeStrong((id *)&v18->_suggestionUUIDs, a6);
    objc_storeStrong((id *)&v18->_metadata, a7);
  }

  return v18;
}

- (NSDate)date
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_absoluteDate];
  return (NSDate *)v2;
}

- (void)setDate:(id)a3
{
  [a3 timeIntervalSince1970];
  self->_absoluteDate = v4;
}

- (unsigned)consumerSubTypeForUIStream
{
  return 43;
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  unint64_t eventType = self->_eventType;
  if (eventType > 5) {
    return &unk_1F0628038;
  }
  else {
    return (id)qword_1E5F00A00[eventType];
  }
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  return self->_blendingCacheUUID;
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  return (id)[MEMORY[0x1E4F4B680] stringForConsumerSubtype:a4];
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  id v20 = a3;
  [v20 updateConsumerSubTypeIfUnset:43];
  [v20 updateBlendingUICacheUpdateUUIDIfUnset:self->_blendingCacheUUID];
  v5 = [v20 sessionMetadata];
  if (!v5)
  {
    v5 = [[ATXShortcutsEditorSessionMetadata alloc] initWithNumStepsInShortcutAtStart:[(ATXShortcutsEditorEventMetadata *)self->_metadata numStepsInShortcut]];
    [v20 updateSessionMetadataIfUnset:v5];
  }
  switch(self->_eventType)
  {
    case 1uLL:
      suggestionUUIDs = self->_suggestionUUIDs;
      v7 = v20;
      v8 = 0;
      goto LABEL_8;
    case 2uLL:
      v9 = [v20 mutableRejectedUUIDs];
      v10 = [(NSArray *)self->_suggestionUUIDs firstObject];
      int v11 = [v9 containsObject:v10];

      if (v11)
      {
        id v12 = [v20 mutableRejectedUUIDs];
        id v13 = [(NSArray *)self->_suggestionUUIDs firstObject];
        [v12 removeObject:v13];
      }
      v8 = self->_suggestionUUIDs;
      v7 = v20;
      suggestionUUIDs = 0;
LABEL_8:
      [v7 updateEngagedUUIDs:v8 rejectedUUIDs:0 shownUUIDs:suggestionUUIDs];
      break;
    case 3uLL:
      id v14 = [v20 mutableEngagedUUIDs];
      id v15 = [(NSArray *)self->_suggestionUUIDs firstObject];
      int v16 = [v14 containsObject:v15];

      if (v16)
      {
        v17 = [v20 mutableEngagedUUIDs];
        v18 = [(NSArray *)self->_suggestionUUIDs firstObject];
        [v17 removeObject:v18];
      }
      [v20 updateEngagedUUIDs:0 rejectedUUIDs:self->_suggestionUUIDs shownUUIDs:0];
      v19 = [v20 sessionMetadata];
      [v19 setIsLastSession:1];

      break;
    case 4uLL:
      [(ATXShortcutsEditorSessionMetadata *)v5 setStepWasManuallyAdded:1];
      break;
    case 5uLL:
      [v20 updateEngagedUUIDs:0 rejectedUUIDs:0 shownUUIDs:self->_suggestionUUIDs];
      [(ATXShortcutsEditorSessionMetadata *)v5 setNumStepsInShortcutAtEnd:[(ATXShortcutsEditorEventMetadata *)self->_metadata numStepsInShortcut]];
      [(ATXShortcutsEditorSessionMetadata *)v5 setIsLastSession:1];
      break;
    default:
      break;
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  double v4 = [(ATXShortcutsEditorEvent *)self jsonDict];
  v5 = (void *)[v3 initWithFormat:@"%@", v4];

  return (NSString *)v5;
}

- (id)jsonDict
{
  v15[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(NSArray *)self->_suggestionUUIDs _pas_mappedArrayWithTransform:&__block_literal_global_1];
  v14[0] = @"date";
  double v4 = NSNumber;
  v5 = [(ATXShortcutsEditorEvent *)self date];
  [v5 timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v15[0] = v6;
  v14[1] = @"eventType";
  v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", self->_eventType);
  v15[1] = v7;
  v14[2] = @"blendingCacheUUID";
  uint64_t v8 = [(NSUUID *)self->_blendingCacheUUID UUIDString];
  v9 = (void *)v8;
  v10 = @"nil";
  if (v8) {
    int v11 = (__CFString *)v8;
  }
  else {
    int v11 = @"nil";
  }
  v14[3] = @"suggestionUUIDs";
  if (v3) {
    v10 = v3;
  }
  v15[2] = v11;
  v15[3] = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v12;
}

uint64_t __35__ATXShortcutsEditorEvent_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(ATXShortcutsEditorEvent *)self jsonDict];
  double v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXShortcutsEditorEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXShortcutsEditorEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXShortcutsEditorEvent *)self initWithProtoData:v5];
  return v6;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v5 = a3;
    v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXShortcutsEditorEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXShortcutsEditorEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_10:
    id v13 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[ATXShortcutsEditorEvent initWithProto:]((uint64_t)self, v12);
    }

    goto LABEL_10;
  }
  id v5 = v4;
  if ([v5 hasDate]
    && ([v5 date], double v7 = v6, objc_msgSend(v5, "hasEventType")))
  {
    uint64_t v8 = [v5 eventType];
    if ([v5 hasBlendingCacheId])
    {
      id v9 = objc_alloc(MEMORY[0x1E4F29128]);
      v10 = [v5 blendingCacheId];
      int v11 = (void *)[v9 initWithUUIDString:v10];
    }
    else
    {
      int v11 = 0;
    }
    id v14 = [v5 suggestionUUIDs];
    id v15 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_51);

    int v16 = [ATXShortcutsEditorEventMetadata alloc];
    v17 = [v5 metadata];
    v18 = [(ATXShortcutsEditorEventMetadata *)v16 initWithProto:v17];

    self = [(ATXShortcutsEditorEvent *)self initWithAbsoluteDate:v8 eventType:v11 blendingCacheUUID:v15 suggestionUUIDs:v18 metadata:v7];
    id v13 = self;
  }
  else
  {
    id v13 = 0;
  }

LABEL_15:
  return v13;
}

id __41__ATXShortcutsEditorEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (ATXShortcutsEditorEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBShortcutsEditorEvent alloc] initWithData:v4];

    self = [(ATXShortcutsEditorEvent *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  [v3 setDate:self->_absoluteDate];
  [v3 setEventType:self->_eventType];
  blendingCacheUUID = self->_blendingCacheUUID;
  if (blendingCacheUUID)
  {
    id v5 = [(NSUUID *)blendingCacheUUID UUIDString];
    [v3 setBlendingCacheId:v5];
  }
  if (self->_suggestionUUIDs)
  {
    double v6 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v7 = self->_suggestionUUIDs;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "UUIDString", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setSuggestionUUIDs:v6];
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_eventType - (unint64_t)self->_absoluteDate + 32 * (unint64_t)self->_absoluteDate;
  uint64_t v4 = [(NSUUID *)self->_blendingCacheUUID hash] - v3 + 32 * v3;
  return [(NSArray *)self->_suggestionUUIDs hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXShortcutsEditorEvent *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXShortcutsEditorEvent *)self isEqualToATXShortcutsEditorEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXShortcutsEditorEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  double v6 = self->_absoluteDate - *((double *)v4 + 1);
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  if (v6 > 2.22044605e-16 || self->_eventType != *((void *)v4 + 3)) {
    goto LABEL_7;
  }
  blendingCacheUUID = self->_blendingCacheUUID;
  uint64_t v8 = (NSUUID *)*((id *)v4 + 4);
  if (blendingCacheUUID == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    uint64_t v10 = blendingCacheUUID;
    char v11 = [(NSUUID *)v10 isEqual:v9];

    if ((v11 & 1) == 0)
    {
LABEL_7:
      char v12 = 0;
      goto LABEL_8;
    }
  }
  long long v14 = self->_suggestionUUIDs;
  long long v15 = v14;
  if (v14 == (NSArray *)v5[5]) {
    char v12 = 1;
  }
  else {
    char v12 = -[NSArray isEqual:](v14, "isEqual:");
  }

LABEL_8:
  return v12;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_unint64_t eventType = a3;
}

- (NSUUID)blendingCacheUUID
{
  return self->_blendingCacheUUID;
}

- (void)setBlendingCacheUUID:(id)a3
{
}

- (NSArray)suggestionUUIDs
{
  return self->_suggestionUUIDs;
}

- (void)setSuggestionUUIDs:(id)a3
{
}

- (ATXShortcutsEditorEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_suggestionUUIDs, 0);
  objc_storeStrong((id *)&self->_blendingCacheUUID, 0);
}

- (void)initWithAbsoluteDate:(os_log_t)log eventType:blendingCacheUUID:suggestionUUIDs:metadata:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Encountered more than 1 suggestionUUID for event type %lu. Expected 1, received: %@", (uint8_t *)&v3, 0x16u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBShortcutsEditorEvent proto", (uint8_t *)&v5, 0xCu);
}

@end