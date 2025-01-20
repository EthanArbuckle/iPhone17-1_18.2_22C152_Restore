@interface ATXProactiveSuggestionExecutableSpecification
+ (BOOL)supportsSecureCoding;
+ (id)stringForExecutableType:(int64_t)a3;
- (ATXProactiveSuggestionExecutableSpecification)initWithCoder:(id)a3;
- (ATXProactiveSuggestionExecutableSpecification)initWithExecutable:(id)a3 executableObjectHash:(unint64_t)a4 expectedExecutableClassString:(id)a5 executableDescription:(id)a6 executableIdentifier:(id)a7 suggestionExecutableType:(int64_t)a8;
- (ATXProactiveSuggestionExecutableSpecification)initWithExecutable:(id)a3 expectedExecutableClassString:(id)a4 executableDescription:(id)a5 executableIdentifier:(id)a6;
- (ATXProactiveSuggestionExecutableSpecification)initWithExecutable:(id)a3 expectedExecutableClassString:(id)a4 executableDescription:(id)a5 executableIdentifier:(id)a6 suggestionExecutableType:(int64_t)a7;
- (ATXProactiveSuggestionExecutableSpecification)initWithExecutableObject:(id)a3 executableDescription:(id)a4 executableIdentifier:(id)a5 suggestionExecutableType:(int64_t)a6;
- (ATXProactiveSuggestionExecutableSpecification)initWithProto:(id)a3;
- (ATXProactiveSuggestionExecutableSpecification)initWithProtoData:(id)a3;
- (ATXSuggestionExecutableProtocol)executableObject;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSUInteger:(unint64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)fuzzyIsEqualToExecutableSpecification:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)executable;
- (NSString)executableClassString;
- (NSString)executableDescription;
- (NSString)executableIdentifier;
- (id)allowedExecutableClasses;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProto;
- (id)executableDataFromExecutableObject:(id)a3 executableClassStringFromObject:(id)a4;
- (id)executableObjectFromData:(id)a3 executableClassString:(id)a4;
- (id)jsonRawData;
- (id)proto;
- (int64_t)executableType;
- (unint64_t)executableObjectHash;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXProactiveSuggestionExecutableSpecification

- (int64_t)executableType
{
  return self->_executableType;
}

- (ATXSuggestionExecutableProtocol)executableObject
{
  v2 = self;
  objc_sync_enter(v2);
  executableObject = v2->_executableObject;
  if (!executableObject)
  {
    uint64_t v4 = [(ATXProactiveSuggestionExecutableSpecification *)v2 executableObjectFromData:v2->_executable executableClassString:v2->_executableClassString];
    v5 = v2->_executableObject;
    v2->_executableObject = (ATXSuggestionExecutableProtocol *)v4;

    executableObject = v2->_executableObject;
  }
  v6 = executableObject;
  objc_sync_exit(v2);

  return v6;
}

- (id)executableObjectFromData:(id)a3 executableClassString:(id)a4
{
  id v6 = a3;
  v7 = (NSString *)a4;
  v8 = [(ATXProactiveSuggestionExecutableSpecification *)self allowedExecutableClasses];
  char v9 = [v8 containsObject:v7];

  if (v9)
  {
    v10 = NSClassFromString(v7);
    if (v10)
    {
      if ([(NSString *)v7 isEqualToString:@"NSString"])
      {
        v10 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
      }
      else
      {
        v12 = (void *)MEMORY[0x1B3E6F520]();
        id v16 = 0;
        v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:v10 fromData:v6 error:&v16];
        id v13 = v16;
        if (!v10 && v13)
        {
          v14 = __atxlog_handle_blending();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[ATXProactiveSuggestionExecutableSpecification executableObjectFromData:executableClassString:]();
          }
        }
      }
    }
  }
  else
  {
    v11 = __atxlog_handle_blending();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXProactiveSuggestionExecutableSpecification initWithExecutable:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:]();
    }

    v10 = 0;
  }

  return v10;
}

- (id)allowedExecutableClasses
{
  v2 = (void *)MEMORY[0x1B3E6F520](self, a2);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ATXAction", @"NSString", @"ATXHeroData", @"ATXInfoSuggestion", @"_PSSuggestion", @"CAXContextualAction", @"ATXSpotlightAction", @"ATXShortcutsAction", @"ATXLinkActionContainer", 0);
  return v3;
}

- (ATXProactiveSuggestionExecutableSpecification)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[ATXProactiveSuggestion initWithProto:].cold.7();
    }

    goto LABEL_8;
  }
  id v5 = v4;
  id v6 = -[ATXPBProactiveSuggestionExecutableSpecification executable]((uint64_t)v5);
  uint64_t v7 = -[ATXPBProactiveSuggestionExecutableSpecification executableObjectHash]((uint64_t)v5);
  v8 = -[ATXPBProactiveSuggestionExecutableSpecification executableClassString]((uint64_t)v5);
  char v9 = -[ATXPBProactiveSuggestionExecutableSpecification executableDescription]((uint64_t)v5);
  v10 = -[ATXPBProactiveSuggestionExecutableSpecification executableIdentifier]((uint64_t)v5);
  uint64_t v11 = -[ATXPBProactiveSuggestionExecutableSpecification executableType]((uint64_t)v5);
  if (v11 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E5F013B8[(int)v11];
  }
  v15 = v12;
  if ([(__CFString *)v15 isEqualToString:@"Unknown"])
  {
    uint64_t v16 = 0;
  }
  else if ([(__CFString *)v15 isEqualToString:@"App"])
  {
    uint64_t v16 = 1;
  }
  else if ([(__CFString *)v15 isEqualToString:@"Action"])
  {
    uint64_t v16 = 2;
  }
  else if ([(__CFString *)v15 isEqualToString:@"Widget"])
  {
    uint64_t v16 = 3;
  }
  else if ([(__CFString *)v15 isEqualToString:@"Tip"])
  {
    uint64_t v16 = 4;
  }
  else if ([(__CFString *)v15 isEqualToString:@"AppClip"])
  {
    uint64_t v16 = 5;
  }
  else if ([(__CFString *)v15 isEqualToString:@"Interaction"])
  {
    uint64_t v16 = 6;
  }
  else if ([(__CFString *)v15 isEqualToString:@"ContextualAction"])
  {
    uint64_t v16 = 7;
  }
  else if ([(__CFString *)v15 isEqualToString:@"SpotlightAction"])
  {
    uint64_t v16 = 8;
  }
  else if ([(__CFString *)v15 isEqualToString:@"ShortcutsAction"])
  {
    uint64_t v16 = 9;
  }
  else if ([(__CFString *)v15 isEqualToString:@"LinkAction"])
  {
    uint64_t v16 = 10;
  }
  else if ([(__CFString *)v15 isEqualToString:@"Max"])
  {
    uint64_t v16 = 11;
  }
  else
  {
    uint64_t v16 = 0;
  }

  self = [(ATXProactiveSuggestionExecutableSpecification *)self initWithExecutable:v6 executableObjectHash:v7 expectedExecutableClassString:v8 executableDescription:v9 executableIdentifier:v10 suggestionExecutableType:v16];
  v14 = self;
LABEL_36:

  return v14;
}

- (ATXProactiveSuggestionExecutableSpecification)initWithExecutable:(id)a3 executableObjectHash:(unint64_t)a4 expectedExecutableClassString:(id)a5 executableDescription:(id)a6 executableIdentifier:(id)a7 suggestionExecutableType:(int64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ATXProactiveSuggestionExecutableSpecification;
  v18 = [(ATXProactiveSuggestionExecutableSpecification *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    executable = v18->_executable;
    v18->_executable = (NSData *)v19;

    v18->_executableObjectHash = a4;
    uint64_t v21 = [v15 copy];
    executableClassString = v18->_executableClassString;
    v18->_executableClassString = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    executableDescription = v18->_executableDescription;
    v18->_executableDescription = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    executableIdentifier = v18->_executableIdentifier;
    v18->_executableIdentifier = (NSString *)v25;

    v18->_executableType = a8;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableIdentifier, 0);
  objc_storeStrong((id *)&self->_executableDescription, 0);
  objc_storeStrong((id *)&self->_executableClassString, 0);
  objc_storeStrong((id *)&self->_executable, 0);
  objc_storeStrong((id *)&self->_executableObject, 0);
}

+ (id)stringForExecutableType:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %li)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5F01410[a3];
  }
  return v3;
}

- (ATXProactiveSuggestionExecutableSpecification)initWithExecutable:(id)a3 expectedExecutableClassString:(id)a4 executableDescription:(id)a5 executableIdentifier:(id)a6
{
  return [(ATXProactiveSuggestionExecutableSpecification *)self initWithExecutable:a3 expectedExecutableClassString:a4 executableDescription:a5 executableIdentifier:a6 suggestionExecutableType:0];
}

- (ATXProactiveSuggestionExecutableSpecification)initWithExecutable:(id)a3 expectedExecutableClassString:(id)a4 executableDescription:(id)a5 executableIdentifier:(id)a6 suggestionExecutableType:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(ATXProactiveSuggestionExecutableSpecification *)self allowedExecutableClasses];
  char v17 = [v16 containsObject:v13];

  if (v17)
  {
    self = [(ATXProactiveSuggestionExecutableSpecification *)self initWithExecutable:v12 executableObjectHash:0 expectedExecutableClassString:v13 executableDescription:v14 executableIdentifier:v15 suggestionExecutableType:a7];
    v18 = self;
  }
  else
  {
    uint64_t v19 = __atxlog_handle_blending();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ATXProactiveSuggestionExecutableSpecification initWithExecutable:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:]();
    }

    v18 = 0;
  }

  return v18;
}

- (ATXProactiveSuggestionExecutableSpecification)initWithExecutableObject:(id)a3 executableDescription:(id)a4 executableIdentifier:(id)a5 suggestionExecutableType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  objc_opt_isKindOfClass();
  id v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  id v15 = [(ATXProactiveSuggestionExecutableSpecification *)self allowedExecutableClasses];
  int v16 = [v15 containsObject:v14];

  if (v16)
  {
    char v17 = [(ATXProactiveSuggestionExecutableSpecification *)self executableDataFromExecutableObject:v10 executableClassStringFromObject:v14];
    self = -[ATXProactiveSuggestionExecutableSpecification initWithExecutable:executableObjectHash:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:](self, "initWithExecutable:executableObjectHash:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:", v17, [v10 hash], v14, v11, v12, a6);

    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)executableDataFromExecutableObject:(id)a3 executableClassStringFromObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"NSString"])
  {
    uint64_t v7 = [v5 dataUsingEncoding:4];
  }
  else
  {
    v8 = (void *)MEMORY[0x1B3E6F520]();
    id v12 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
    id v9 = v12;
    if (!v7)
    {
      id v10 = __atxlog_handle_blending();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXProactiveSuggestionExecutableSpecification executableDataFromExecutableObject:executableClassStringFromObject:]();
      }
    }
  }

  return v7;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"Executable class: %@   Executable description: %@   Executable identifier: %@   Executable type: %ld   ", self->_executableClassString, self->_executableDescription, self->_executableIdentifier, self->_executableType];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXProactiveSuggestionExecutableSpecification allocWithZone:a3];
  id v5 = (void *)[(NSData *)self->_executable copy];
  unint64_t executableObjectHash = self->_executableObjectHash;
  uint64_t v7 = (void *)[(NSString *)self->_executableClassString copy];
  v8 = (void *)[(NSString *)self->_executableDescription copy];
  id v9 = (void *)[(NSString *)self->_executableIdentifier copy];
  id v10 = [(ATXProactiveSuggestionExecutableSpecification *)v4 initWithExecutable:v5 executableObjectHash:executableObjectHash expectedExecutableClassString:v7 executableDescription:v8 executableIdentifier:v9 suggestionExecutableType:self->_executableType];

  id v11 = self;
  objc_sync_enter(v11);
  objc_storeStrong(v10 + 1, v11->_executableObject);
  objc_sync_exit(v11);

  return v10;
}

- (unint64_t)hash
{
  unint64_t executableObjectHash = self->_executableObjectHash;
  NSUInteger v4 = [(NSString *)self->_executableClassString hash] - executableObjectHash + 32 * executableObjectHash;
  NSUInteger v5 = [(NSString *)self->_executableIdentifier hash];
  return self->_executableType - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATXProactiveSuggestionExecutableSpecification *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      executable = self->_executable;
      uint64_t v7 = (NSData *)v5[2];
      if (executable == v7)
      {
      }
      else
      {
        v8 = v7;
        id v9 = executable;
        char v10 = [(NSData *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_20;
        }
      }
      unint64_t executableObjectHash = self->_executableObjectHash;
      if (executableObjectHash == [v5 executableObjectHash])
      {
        executableClassString = self->_executableClassString;
        id v14 = (NSString *)v5[4];
        if (executableClassString == v14)
        {
        }
        else
        {
          id v15 = v14;
          int v16 = executableClassString;
          char v17 = [(NSString *)v16 isEqual:v15];

          if ((v17 & 1) == 0) {
            goto LABEL_20;
          }
        }
        executableDescription = self->_executableDescription;
        uint64_t v19 = (NSString *)v5[5];
        if (executableDescription == v19)
        {
        }
        else
        {
          v20 = v19;
          uint64_t v21 = executableDescription;
          char v22 = [(NSString *)v21 isEqual:v20];

          if ((v22 & 1) == 0) {
            goto LABEL_20;
          }
        }
        executableIdentifier = self->_executableIdentifier;
        v24 = (NSString *)v5[6];
        if (executableIdentifier == v24)
        {
        }
        else
        {
          uint64_t v25 = v24;
          v26 = executableIdentifier;
          char v27 = [(NSString *)v26 isEqual:v25];

          if ((v27 & 1) == 0) {
            goto LABEL_20;
          }
        }
        int64_t executableType = self->_executableType;
        BOOL v11 = executableType == [v5 executableType];
        goto LABEL_21;
      }
LABEL_20:
      BOOL v11 = 0;
LABEL_21:

      goto LABEL_22;
    }
    BOOL v11 = 0;
  }
LABEL_22:

  return v11;
}

- (BOOL)fuzzyIsEqualToExecutableSpecification:(id)a3
{
  NSUInteger v4 = (ATXProactiveSuggestionExecutableSpecification *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    unint64_t executableObjectHash = self->_executableObjectHash;
    if (executableObjectHash != [(ATXProactiveSuggestionExecutableSpecification *)v4 executableObjectHash])goto LABEL_11; {
    executableClassString = self->_executableClassString;
    }
    uint64_t v7 = v4->_executableClassString;
    if (executableClassString == v7)
    {
    }
    else
    {
      v8 = v7;
      id v9 = executableClassString;
      char v10 = [(NSString *)v9 isEqual:v8];

      if ((v10 & 1) == 0) {
        goto LABEL_11;
      }
    }
    executableIdentifier = self->_executableIdentifier;
    id v13 = v4->_executableIdentifier;
    if (executableIdentifier == v13)
    {
    }
    else
    {
      id v14 = v13;
      id v15 = executableIdentifier;
      char v16 = [(NSString *)v15 isEqual:v14];

      if ((v16 & 1) == 0)
      {
LABEL_11:
        BOOL v11 = 0;
        goto LABEL_12;
      }
    }
    int64_t executableType = self->_executableType;
    BOOL v11 = executableType == [(ATXProactiveSuggestionExecutableSpecification *)v4 executableType];
    goto LABEL_12;
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (id)jsonRawData
{
  v11[5] = *MEMORY[0x1E4F143B8];
  int64_t executableType = self->_executableType;
  v11[0] = self->_executableIdentifier;
  v10[0] = @"executableIdentifier";
  v10[1] = @"executableType";
  NSUInteger v4 = [NSNumber numberWithInteger:executableType];
  unint64_t executableObjectHash = self->_executableObjectHash;
  executableClassString = self->_executableClassString;
  v11[1] = v4;
  v11[2] = executableClassString;
  v10[2] = @"executableClassString";
  v10[3] = @"executableDescription";
  v11[3] = self->_executableDescription;
  v10[4] = @"executableObjectHash";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:executableObjectHash];
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)encodeAsProto
{
  v2 = [(ATXProactiveSuggestionExecutableSpecification *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXProactiveSuggestionExecutableSpecification)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    NSUInteger v5 = [[ATXPBProactiveSuggestionExecutableSpecification alloc] initWithData:v4];

    self = [(ATXProactiveSuggestionExecutableSpecification *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  -[ATXPBProactiveSuggestionExecutableSpecification setExecutable:]((uint64_t)v3, self->_executable);
  -[ATXPBProactiveSuggestionExecutableSpecification setExecutableObjectHash:]((uint64_t)v3, self->_executableObjectHash);
  -[ATXPBProactiveSuggestionExecutableSpecification setExecutableClassString:]((uint64_t)v3, self->_executableClassString);
  -[ATXPBProactiveSuggestionExecutableSpecification setExecutableDescription:]((uint64_t)v3, self->_executableDescription);
  -[ATXPBProactiveSuggestionExecutableSpecification setExecutableIdentifier:]((uint64_t)v3, self->_executableIdentifier);
  unint64_t executableType = self->_executableType;
  if (executableType >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %li)", self->_executableType);
    NSUInteger v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSUInteger v5 = off_1E5F01410[executableType];
  }
  id v6 = v5;
  if ([(__CFString *)v6 isEqualToString:@"Unknown"])
  {
    int v7 = 0;
  }
  else if ([(__CFString *)v6 isEqualToString:@"App"])
  {
    int v7 = 1;
  }
  else if ([(__CFString *)v6 isEqualToString:@"Action"])
  {
    int v7 = 2;
  }
  else if ([(__CFString *)v6 isEqualToString:@"Widget"])
  {
    int v7 = 3;
  }
  else if ([(__CFString *)v6 isEqualToString:@"Tip"])
  {
    int v7 = 4;
  }
  else if ([(__CFString *)v6 isEqualToString:@"AppClip"])
  {
    int v7 = 5;
  }
  else if ([(__CFString *)v6 isEqualToString:@"Interaction"])
  {
    int v7 = 6;
  }
  else if ([(__CFString *)v6 isEqualToString:@"ContextualAction"])
  {
    int v7 = 7;
  }
  else if ([(__CFString *)v6 isEqualToString:@"SpotlightAction"])
  {
    int v7 = 8;
  }
  else if ([(__CFString *)v6 isEqualToString:@"ShortcutsAction"])
  {
    int v7 = 9;
  }
  else if ([(__CFString *)v6 isEqualToString:@"LinkAction"])
  {
    int v7 = 10;
  }
  else
  {
    int v7 = 0;
  }

  -[ATXPBProactiveSuggestionExecutableSpecification setExecutableType:]((uint64_t)v3, v7);
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
    id v15 = [v12 error];

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
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
    id v15 = [v12 error];

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
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSUInteger:(unint64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    id v15 = [v12 error];

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
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
  id v5 = [(ATXProactiveSuggestionExecutableSpecification *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXProactiveSuggestionExecutableSpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  id v6 = [(ATXProactiveSuggestionExecutableSpecification *)self initWithProtoData:v5];
  return v6;
}

- (NSData)executable
{
  return self->_executable;
}

- (unint64_t)executableObjectHash
{
  return self->_executableObjectHash;
}

- (NSString)executableClassString
{
  return self->_executableClassString;
}

- (NSString)executableDescription
{
  return self->_executableDescription;
}

- (NSString)executableIdentifier
{
  return self->_executableIdentifier;
}

- (void)initWithExecutable:expectedExecutableClassString:executableDescription:executableIdentifier:suggestionExecutableType:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "Executable object in ATXProactiveSuggestion's executableSpec was of unsupported type. Type: %@", v2, v3, v4, v5, v6);
}

- (void)executableDataFromExecutableObject:executableClassStringFromObject:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "Unable to archive executable object from ATXProactiveSuggestion. Error: %@", v2, v3, v4, v5, v6);
}

- (void)executableObjectFromData:executableClassString:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1AE67F000, v0, v1, "Unable to unarchive executable object from ATXProactiveSuggestion. Error: %@", v2, v3, v4, v5, v6);
}

@end