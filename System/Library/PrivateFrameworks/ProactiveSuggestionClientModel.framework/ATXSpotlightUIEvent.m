@interface ATXSpotlightUIEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)stringForATXSpotlightUIEventType:(int64_t)a3;
- (ATXSpotlightUIEvent)initWithProto:(id)a3;
- (ATXSpotlightUIEvent)initWithProtoData:(id)a3;
- (ATXSpotlightUIEvent)initWithType:(int64_t)a3 suggestionUniqueId:(id)a4 suggestionType:(id)a5 suggestionSubtype:(id)a6 suggestionContext:(id)a7;
- (NSString)suggestionContext;
- (NSString)suggestionSubtype;
- (NSString)suggestionType;
- (NSString)suggestionUniqueId;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDictionary;
- (id)proto;
- (int64_t)eventType;
- (unsigned)dataVersion;
- (void)setEventType:(int64_t)a3;
- (void)setSuggestionContext:(id)a3;
- (void)setSuggestionSubtype:(id)a3;
- (void)setSuggestionType:(id)a3;
- (void)setSuggestionUniqueId:(id)a3;
@end

@implementation ATXSpotlightUIEvent

- (ATXSpotlightUIEvent)initWithType:(int64_t)a3 suggestionUniqueId:(id)a4 suggestionType:(id)a5 suggestionSubtype:(id)a6 suggestionContext:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)ATXSpotlightUIEvent;
  v16 = [(ATXSpotlightUIEvent *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_eventType = a3;
    uint64_t v18 = [v12 copy];
    suggestionUniqueId = v17->_suggestionUniqueId;
    v17->_suggestionUniqueId = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    suggestionType = v17->_suggestionType;
    v17->_suggestionType = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    suggestionSubtype = v17->_suggestionSubtype;
    v17->_suggestionSubtype = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    suggestionContext = v17->_suggestionContext;
    v17->_suggestionContext = (NSString *)v24;
  }
  return v17;
}

+ (id)stringForATXSpotlightUIEventType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return off_1E5F01958[a3 - 1];
  }
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)jsonDictionary
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"eventType";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXSpotlightUIEvent eventType](self, "eventType"));
  v15[0] = v3;
  v14[1] = @"suggestionUniqueId";
  v4 = [(ATXSpotlightUIEvent *)self suggestionUniqueId];
  id v5 = v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v5;
  v14[2] = @"suggestionType";
  v6 = [(ATXSpotlightUIEvent *)self suggestionType];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v7;
  v14[3] = @"suggestionSubtype";
  v8 = [(ATXSpotlightUIEvent *)self suggestionSubtype];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v9;
  v14[4] = @"suggestionContext";
  v10 = [(ATXSpotlightUIEvent *)self suggestionContext];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[4] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  if (!v10) {

  }
  if (!v8) {
  if (!v6)
  }

  if (!v4) {
  return v12;
  }
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXSpotlightUIEvent *)self jsonDictionary];
  v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXSpotlightUIEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBSpotlightUIEvent alloc] initWithData:v4];

    self = [(ATXSpotlightUIEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXSpotlightUIEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXSpotlightUIEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [v5 eventType];
    v7 = [v5 suggestionUniqueId];
    v8 = [v5 suggestionType];
    v9 = [v5 suggestionSubtype];
    v10 = [v5 suggestionContext];

    self = [(ATXSpotlightUIEvent *)self initWithType:v6 suggestionUniqueId:v7 suggestionType:v8 suggestionSubtype:v9 suggestionContext:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(ATXSpotlightUIEvent *)self suggestionUniqueId];
  [v3 setSuggestionUniqueId:v4];

  id v5 = [(ATXSpotlightUIEvent *)self suggestionType];
  [v3 setSuggestionType:v5];

  uint64_t v6 = [(ATXSpotlightUIEvent *)self suggestionSubtype];
  [v3 setSuggestionSubtype:v6];

  v7 = [(ATXSpotlightUIEvent *)self suggestionContext];
  [v3 setSuggestionContext:v7];

  objc_msgSend(v3, "setEventType:", (int)-[ATXSpotlightUIEvent eventType](self, "eventType"));
  return v3;
}

- (NSString)suggestionUniqueId
{
  return self->_suggestionUniqueId;
}

- (void)setSuggestionUniqueId:(id)a3
{
}

- (NSString)suggestionType
{
  return self->_suggestionType;
}

- (void)setSuggestionType:(id)a3
{
}

- (NSString)suggestionSubtype
{
  return self->_suggestionSubtype;
}

- (void)setSuggestionSubtype:(id)a3
{
}

- (NSString)suggestionContext
{
  return self->_suggestionContext;
}

- (void)setSuggestionContext:(id)a3
{
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionContext, 0);
  objc_storeStrong((id *)&self->_suggestionSubtype, 0);
  objc_storeStrong((id *)&self->_suggestionType, 0);
  objc_storeStrong((id *)&self->_suggestionUniqueId, 0);
}

@end