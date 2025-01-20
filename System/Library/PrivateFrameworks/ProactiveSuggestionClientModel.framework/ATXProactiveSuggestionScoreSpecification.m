@interface ATXProactiveSuggestionScoreSpecification
+ (BOOL)supportsSecureCoding;
+ (id)stringForSuggestedConfidenceCategory:(int64_t)a3;
- (ATXProactiveSuggestionScoreSpecification)initWithCoder:(id)a3;
- (ATXProactiveSuggestionScoreSpecification)initWithProto:(id)a3;
- (ATXProactiveSuggestionScoreSpecification)initWithProtoData:(id)a3;
- (ATXProactiveSuggestionScoreSpecification)initWithRawScore:(double)a3 suggestedConfidenceCategory:(int64_t)a4;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)fuzzyIsEqualToScoreSpecification:(id)a3;
- (BOOL)isEqual:(id)a3;
- (double)rawScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProto;
- (id)jsonRawData;
- (id)proto;
- (int64_t)suggestedConfidenceCategory;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRawScore:(double)a3;
- (void)setSuggestedConfidenceCategory:(int64_t)a3;
@end

@implementation ATXProactiveSuggestionScoreSpecification

- (ATXProactiveSuggestionScoreSpecification)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXProactiveSuggestionUISpecification initWithProto:]();
    }

    goto LABEL_8;
  }
  id v5 = v4;
  double v6 = -[ATXPBProactiveSuggestionScoreSpecification rawScore]((uint64_t)v5);
  uint64_t v7 = -[ATXPBProactiveSuggestionScoreSpecification suggestedConfidenceCategory]((uint64_t)v5);
  if (v7 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E5F01610[(int)v7];
  }
  v11 = v8;
  if ([(__CFString *)v11 isEqualToString:@"Unknown"])
  {
    uint64_t v12 = 0;
  }
  else if ([(__CFString *)v11 isEqualToString:@"Fallback"])
  {
    uint64_t v12 = 1;
  }
  else if ([(__CFString *)v11 isEqualToString:@"LowConfidence"])
  {
    uint64_t v12 = 2;
  }
  else if ([(__CFString *)v11 isEqualToString:@"MediumConfidence"])
  {
    uint64_t v12 = 3;
  }
  else if ([(__CFString *)v11 isEqualToString:@"HighConfidence"])
  {
    uint64_t v12 = 4;
  }
  else
  {
    uint64_t v12 = 0;
  }

  self = [(ATXProactiveSuggestionScoreSpecification *)self initWithRawScore:v12 suggestedConfidenceCategory:v6];
  v10 = self;
LABEL_22:

  return v10;
}

- (ATXProactiveSuggestionScoreSpecification)initWithRawScore:(double)a3 suggestedConfidenceCategory:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ATXProactiveSuggestionScoreSpecification;
  result = [(ATXProactiveSuggestionScoreSpecification *)&v7 init];
  if (result)
  {
    result->_rawScore = a3;
    result->_suggestedConfidenceCategory = a4;
  }
  return result;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"Raw score: %.2f   Confidence category: %ld    ", *(void *)&self->_rawScore, self->_suggestedConfidenceCategory];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXProactiveSuggestionScoreSpecification allocWithZone:a3];
  double rawScore = self->_rawScore;
  int64_t suggestedConfidenceCategory = self->_suggestedConfidenceCategory;
  return [(ATXProactiveSuggestionScoreSpecification *)v4 initWithRawScore:suggestedConfidenceCategory suggestedConfidenceCategory:rawScore];
}

- (unint64_t)hash
{
  return self->_suggestedConfidenceCategory;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXProactiveSuggestionScoreSpecification *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      [(ATXProactiveSuggestionScoreSpecification *)v5 rawScore];
      BOOL v7 = v6 == self->_rawScore
        && [(ATXProactiveSuggestionScoreSpecification *)v5 suggestedConfidenceCategory] == self->_suggestedConfidenceCategory;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)fuzzyIsEqualToScoreSpecification:(id)a3
{
  id v4 = (ATXProactiveSuggestionScoreSpecification *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(ATXProactiveSuggestionScoreSpecification *)v4 suggestedConfidenceCategory] == self->_suggestedConfidenceCategory;
  }

  return v5;
}

+ (id)stringForSuggestedConfidenceCategory:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %li)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5F01610[a3];
  }
  return v3;
}

- (void)setSuggestedConfidenceCategory:(int64_t)a3
{
  self->_int64_t suggestedConfidenceCategory = a3;
}

- (id)encodeAsProto
{
  v2 = [(ATXProactiveSuggestionScoreSpecification *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXProactiveSuggestionScoreSpecification)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [[ATXPBProactiveSuggestionScoreSpecification alloc] initWithData:v4];

    self = [(ATXProactiveSuggestionScoreSpecification *)self initWithProto:v5];
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
  v3 = objc_opt_new();
  -[ATXPBProactiveSuggestionScoreSpecification setRawScore:]((uint64_t)v3, self->_rawScore);
  unint64_t suggestedConfidenceCategory = self->_suggestedConfidenceCategory;
  if (suggestedConfidenceCategory >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %li)", self->_suggestedConfidenceCategory);
    BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v5 = off_1E5F01610[suggestedConfidenceCategory];
  }
  double v6 = v5;
  if ([(__CFString *)v6 isEqualToString:@"Unknown"])
  {
    int v7 = 0;
  }
  else if ([(__CFString *)v6 isEqualToString:@"Fallback"])
  {
    int v7 = 1;
  }
  else if ([(__CFString *)v6 isEqualToString:@"LowConfidence"])
  {
    int v7 = 2;
  }
  else if ([(__CFString *)v6 isEqualToString:@"MediumConfidence"])
  {
    int v7 = 3;
  }
  else if ([(__CFString *)v6 isEqualToString:@"HighConfidence"])
  {
    int v7 = 4;
  }
  else
  {
    int v7 = 0;
  }

  -[ATXPBProactiveSuggestionScoreSpecification setSuggestedConfidenceCategory:]((uint64_t)v3, v7);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 0.0)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
  id v5 = [(ATXProactiveSuggestionScoreSpecification *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXProactiveSuggestionScoreSpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  double v6 = [(ATXProactiveSuggestionScoreSpecification *)self initWithProtoData:v5];
  return v6;
}

- (id)jsonRawData
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"rawScore";
  v3 = [NSNumber numberWithDouble:self->_rawScore];
  v7[1] = @"suggestedConfidence";
  v8[0] = v3;
  id v4 = [NSNumber numberWithInteger:self->_suggestedConfidenceCategory];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (double)rawScore
{
  return self->_rawScore;
}

- (void)setRawScore:(double)a3
{
  self->_double rawScore = a3;
}

- (int64_t)suggestedConfidenceCategory
{
  return self->_suggestedConfidenceCategory;
}

@end