@interface ATXSpotlightSuggestionCollection
+ (BOOL)supportsSecureCoding;
- (ATXSpotlightSuggestionCollection)initWithCoder:(id)a3;
- (ATXSpotlightSuggestionCollection)initWithProto:(id)a3;
- (ATXSpotlightSuggestionCollection)initWithProtoData:(id)a3;
- (ATXSpotlightSuggestionCollection)initWithSuggestions:(id)a3 contextTitle:(id)a4 sectionIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXSpotlightSuggestionCollection:(id)a3;
- (NSArray)suggestions;
- (NSString)contextTitle;
- (NSString)sectionIdentifier;
- (id)encodeAsProto;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXSpotlightSuggestionCollection

- (ATXSpotlightSuggestionCollection)initWithSuggestions:(id)a3 contextTitle:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXSpotlightSuggestionCollection;
  v11 = [(ATXSpotlightSuggestionCollection *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    suggestions = v11->_suggestions;
    v11->_suggestions = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    contextTitle = v11->_contextTitle;
    v11->_contextTitle = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    sectionIdentifier = v11->_sectionIdentifier;
    v11->_sectionIdentifier = (NSString *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXSpotlightSuggestionCollection *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXSpotlightSuggestionCollection *)self isEqualToATXSpotlightSuggestionCollection:v5];

  return v6;
}

- (BOOL)isEqualToATXSpotlightSuggestionCollection:(id)a3
{
  v4 = (id *)a3;
  contextTitle = self->_contextTitle;
  BOOL v6 = (NSString *)v4[1];
  if (contextTitle == v6)
  {
  }
  else
  {
    v7 = v6;
    id v8 = contextTitle;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  suggestions = self->_suggestions;
  v11 = (NSArray *)v4[3];
  if (suggestions == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    v13 = suggestions;
    char v14 = [(NSArray *)v13 isEqual:v12];

    if ((v14 & 1) == 0)
    {
LABEL_7:
      char v15 = 0;
      goto LABEL_13;
    }
  }
  uint64_t v16 = self->_sectionIdentifier;
  v17 = v16;
  if (v16 == v4[2]) {
    char v15 = 1;
  }
  else {
    char v15 = -[NSString isEqual:](v16, "isEqual:");
  }

LABEL_13:
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXSpotlightSuggestionCollection *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXSpotlightSuggestionCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  BOOL v6 = [(ATXSpotlightSuggestionCollection *)self initWithProtoData:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXSpotlightSuggestionCollection *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXSpotlightSuggestionCollection)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXLightweightClientModelCacheUpdate initWithProto:]((uint64_t)self, v11);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  BOOL v6 = [v5 contextTitle];
  v7 = [v5 suggestions];
  id v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_16);

  char v9 = [v5 sectionIdentifier];

  self = [(ATXSpotlightSuggestionCollection *)self initWithSuggestions:v8 contextTitle:v6 sectionIdentifier:v9];
  id v10 = self;
LABEL_8:

  return v10;
}

ATXProactiveSuggestion *__50__ATXSpotlightSuggestionCollection_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[ATXProactiveSuggestion alloc] initWithProto:v2];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __50__ATXSpotlightSuggestionCollection_initWithProto___block_invoke_cold_1(v5);
    }
  }
  return v3;
}

- (ATXSpotlightSuggestionCollection)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBSuggestionCollection alloc] initWithData:v4];

    self = [(ATXSpotlightSuggestionCollection *)self initWithProto:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setContextTitle:self->_contextTitle];
  [v3 setSectionIdentifier:self->_sectionIdentifier];
  id v4 = +[ATXProactiveSuggestion protoSuggestionsFromSuggestions:self->_suggestions];
  [v3 setSuggestions:v4];

  return v3;
}

- (NSString)contextTitle
{
  return self->_contextTitle;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_contextTitle, 0);
}

void __50__ATXSpotlightSuggestionCollection_initWithProto___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Attempting to decode ATXSpotlightSuggestionCollection from proto failed because the recovered PBCodable had an unrecoverable ATXProactiveSuggestion.", v1, 2u);
}

@end