@interface ATXProactiveSuggestionLayoutConfig
+ (BOOL)supportsSecureCoding;
+ (id)layoutConfigurationsForLayoutOptions:(unint64_t)a3;
- (ATXProactiveSuggestionLayoutConfig)initWithApplicableSuggestionLayout:(int64_t)a3;
- (ATXProactiveSuggestionLayoutConfig)initWithCoder:(id)a3;
- (ATXProactiveSuggestionLayoutConfig)initWithProto:(id)a3;
- (ATXProactiveSuggestionLayoutConfig)initWithProtoData:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProto;
- (id)proto;
- (int64_t)applicableLayoutType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXProactiveSuggestionLayoutConfig

- (ATXProactiveSuggestionLayoutConfig)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXProactiveSuggestionUISpecification initWithProto:]();
    }

    goto LABEL_8;
  }
  uint64_t v5 = -[ATXPBProactiveSuggestionLayoutConfig applicableLayoutType]((uint64_t)v4);
  if (v5 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E5F015C8[(int)v5];
  }
  v9 = v6;
  if ([(__CFString *)v9 isEqualToString:@"Unknown"])
  {
    uint64_t v10 = 0;
  }
  else if ([(__CFString *)v9 isEqualToString:@"_1Row1Column"])
  {
    uint64_t v10 = 1;
  }
  else if ([(__CFString *)v9 isEqualToString:@"_1Row2Columns"])
  {
    uint64_t v10 = 2;
  }
  else if ([(__CFString *)v9 isEqualToString:@"_2Rows2Columns"])
  {
    uint64_t v10 = 3;
  }
  else if ([(__CFString *)v9 isEqualToString:@"_2Rows4Columns"])
  {
    uint64_t v10 = 4;
  }
  else if ([(__CFString *)v9 isEqualToString:@"_1Row4Columns"])
  {
    uint64_t v10 = 5;
  }
  else if ([(__CFString *)v9 isEqualToString:@"_4Rows4Columns"])
  {
    uint64_t v10 = 6;
  }
  else if ([(__CFString *)v9 isEqualToString:@"_4Rows8Columns"])
  {
    uint64_t v10 = 7;
  }
  else if ([(__CFString *)v9 isEqualToString:@"Max"])
  {
    uint64_t v10 = 8;
  }
  else
  {
    uint64_t v10 = 0;
  }

  self = [(ATXProactiveSuggestionLayoutConfig *)self initWithApplicableSuggestionLayout:v10];
  v8 = self;
LABEL_30:

  return v8;
}

- (ATXProactiveSuggestionLayoutConfig)initWithApplicableSuggestionLayout:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXProactiveSuggestionLayoutConfig;
  result = [(ATXProactiveSuggestionLayoutConfig *)&v5 init];
  if (result) {
    result->_applicableLayoutType = a3;
  }
  return result;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"Layout type: %ld", self->_applicableLayoutType);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXProactiveSuggestionLayoutConfig allocWithZone:a3];
  int64_t applicableLayoutType = self->_applicableLayoutType;
  return [(ATXProactiveSuggestionLayoutConfig *)v4 initWithApplicableSuggestionLayout:applicableLayoutType];
}

- (unint64_t)hash
{
  return self->_applicableLayoutType;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXProactiveSuggestionLayoutConfig *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(ATXProactiveSuggestionLayoutConfig *)v4 applicableLayoutType] == self->_applicableLayoutType;
  }

  return v5;
}

+ (id)layoutConfigurationsForLayoutOptions:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_opt_new();
  if ((v3 & 2) != 0)
  {
    v7 = [[ATXProactiveSuggestionLayoutConfig alloc] initWithApplicableSuggestionLayout:1];
    [v4 addObject:v7];

    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = [[ATXProactiveSuggestionLayoutConfig alloc] initWithApplicableSuggestionLayout:2];
  [v4 addObject:v8];

  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = [[ATXProactiveSuggestionLayoutConfig alloc] initWithApplicableSuggestionLayout:3];
  [v4 addObject:v9];

  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = [[ATXProactiveSuggestionLayoutConfig alloc] initWithApplicableSuggestionLayout:4];
  [v4 addObject:v10];

  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = [[ATXProactiveSuggestionLayoutConfig alloc] initWithApplicableSuggestionLayout:5];
  [v4 addObject:v11];

  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v12 = [[ATXProactiveSuggestionLayoutConfig alloc] initWithApplicableSuggestionLayout:6];
  [v4 addObject:v12];

  if (v3 < 0)
  {
LABEL_8:
    BOOL v5 = [[ATXProactiveSuggestionLayoutConfig alloc] initWithApplicableSuggestionLayout:7];
    [v4 addObject:v5];
  }
LABEL_9:
  return v4;
}

- (id)encodeAsProto
{
  v2 = [(ATXProactiveSuggestionLayoutConfig *)self proto];
  char v3 = [v2 data];

  return v3;
}

- (ATXProactiveSuggestionLayoutConfig)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [[ATXPBProactiveSuggestionLayoutConfig alloc] initWithData:v4];

    self = [(ATXProactiveSuggestionLayoutConfig *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  char v3 = objc_opt_new();
  unint64_t applicableLayoutType = self->_applicableLayoutType;
  if (applicableLayoutType >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %li)", self->_applicableLayoutType);
    BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v5 = off_1E5F015C8[applicableLayoutType];
  }
  v6 = v5;
  if ([(__CFString *)v6 isEqualToString:@"Unknown"])
  {
    int v7 = 0;
  }
  else if ([(__CFString *)v6 isEqualToString:@"_1Row1Column"])
  {
    int v7 = 1;
  }
  else if ([(__CFString *)v6 isEqualToString:@"_1Row2Columns"])
  {
    int v7 = 2;
  }
  else if ([(__CFString *)v6 isEqualToString:@"_2Rows2Columns"])
  {
    int v7 = 3;
  }
  else if ([(__CFString *)v6 isEqualToString:@"_2Rows4Columns"])
  {
    int v7 = 4;
  }
  else if ([(__CFString *)v6 isEqualToString:@"_1Row4Columns"])
  {
    int v7 = 5;
  }
  else if ([(__CFString *)v6 isEqualToString:@"_4Rows4Columns"])
  {
    int v7 = 6;
  }
  else if ([(__CFString *)v6 isEqualToString:@"_4Rows8Columns"])
  {
    int v7 = 7;
  }
  else if ([(__CFString *)v6 isEqualToString:@"Max"])
  {
    int v7 = 8;
  }
  else
  {
    int v7 = 0;
  }

  -[ATXPBProactiveSuggestionLayoutConfig setApplicableLayoutType:]((uint64_t)v3, v7);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v5 = [(ATXProactiveSuggestionLayoutConfig *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXProactiveSuggestionLayoutConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXProactiveSuggestionLayoutConfig *)self initWithProtoData:v5];
  return v6;
}

- (int64_t)applicableLayoutType
{
  return self->_applicableLayoutType;
}

@end