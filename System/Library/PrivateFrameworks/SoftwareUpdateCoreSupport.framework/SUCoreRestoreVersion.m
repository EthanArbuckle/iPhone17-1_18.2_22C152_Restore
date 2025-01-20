@interface SUCoreRestoreVersion
+ (BOOL)_enableVerboseLogging;
+ (BOOL)supportsSecureCoding;
+ (id)_stringForNSComparisonResult:(int64_t)a3;
- (BOOL)_isStringOnlyNumbers:(id)a3;
- (BOOL)isComparable:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)parsedVersion;
- (NSString)restoreVersionString;
- (SUCoreRestoreVersion)initWithCoder:(id)a3;
- (SUCoreRestoreVersion)initWithRestoreVersion:(id)a3;
- (id)description;
- (id)summary;
- (int64_t)buildGroup;
- (int64_t)buildVersion;
- (int64_t)compare:(id)a3;
- (int64_t)majorVersion;
- (int64_t)minorVersion;
- (int64_t)suffixVersion;
- (int64_t)syncedVersion;
- (void)_parseRestoreVersionString;
- (void)encodeWithCoder:(id)a3;
- (void)setBuildGroup:(int64_t)a3;
- (void)setParsedVersion:(id)a3;
- (void)setRestoreVersionString:(id)a3;
@end

@implementation SUCoreRestoreVersion

- (SUCoreRestoreVersion)initWithRestoreVersion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = +[SUCoreLog sharedLogger];
    v15 = [v14 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SUCoreRestoreVersion initWithRestoreVersion:](v15);
    }
    goto LABEL_11;
  }
  v18.receiver = self;
  v18.super_class = (Class)SUCoreRestoreVersion;
  v6 = [(SUCoreRestoreVersion *)&v18 init];
  self = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_restoreVersionString, a3);
    [(SUCoreRestoreVersion *)self _parseRestoreVersionString];
    parsedVersion = self->_parsedVersion;
    if (parsedVersion && [(NSArray *)parsedVersion count] == 5)
    {
      v8 = [(NSArray *)self->_parsedVersion objectAtIndexedSubscript:0];
      self->_majorVersion = [v8 integerValue];

      v9 = [(NSArray *)self->_parsedVersion objectAtIndexedSubscript:1];
      self->_minorVersion = [v9 integerValue];

      v10 = [(NSArray *)self->_parsedVersion objectAtIndexedSubscript:2];
      self->_buildVersion = [v10 integerValue];

      v11 = [(NSArray *)self->_parsedVersion objectAtIndexedSubscript:3];
      self->_syncedVersion = [v11 integerValue];

      v12 = [(NSArray *)self->_parsedVersion objectAtIndexedSubscript:4];
      self->_suffixVersion = [v12 integerValue];

      goto LABEL_6;
    }
    v16 = +[SUCoreLog sharedLogger];
    v15 = [v16 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SUCoreRestoreVersion initWithRestoreVersion:]();
    }
LABEL_11:

    v13 = 0;
    goto LABEL_12;
  }
LABEL_6:
  self = self;
  v13 = self;
LABEL_12:

  return v13;
}

- (void)_parseRestoreVersionString
{
  OUTLINED_FUNCTION_2();
  v1 = [v0 summary];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B4EC2000, v2, v3, "[RestoreVersion] (%{public}@) Parse: invalid build group found: %{public}@", v4, v5, v6, v7, v8);
}

- (BOOL)_isStringOnlyNumbers:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  uint64_t v5 = [v3 decimalDigitCharacterSet];
  uint64_t v6 = [v5 invertedSet];
  uint64_t v7 = [v4 rangeOfCharacterFromSet:v6];

  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isComparable:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (int64_t v5 = -[SUCoreRestoreVersion buildGroup](self, "buildGroup"), v5 == [v4 buildGroup]))
  {
    uint64_t v6 = [(SUCoreRestoreVersion *)self parsedVersion];
    if ([v6 count] == 5)
    {
      uint64_t v7 = [v4 parsedVersion];
      BOOL v8 = [v7 count] == 5;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  if (+[SUCoreRestoreVersion _enableVerboseLogging])
  {
    v9 = +[SUCoreLog sharedLogger];
    v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(SUCoreRestoreVersion *)self summary];
      uint64_t v12 = [v4 summary];
      v13 = (void *)v12;
      v14 = @"NO";
      int v16 = 138543874;
      v17 = v11;
      __int16 v18 = 2114;
      if (v8) {
        v14 = @"YES";
      }
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1B4EC2000, v10, OS_LOG_TYPE_DEFAULT, "[RestoreVersion] Comparable: self=%{public}@ to=%{public}@ | valid=%{public}@", (uint8_t *)&v16, 0x20u);
    }
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SUCoreRestoreVersion *)self isComparable:v4])
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = [(SUCoreRestoreVersion *)self parsedVersion];
      uint64_t v7 = [v6 objectAtIndex:v5];
      BOOL v8 = [v4 parsedVersion];
      v9 = [v8 objectAtIndex:v5];
      int64_t v10 = [v7 compare:v9];

      if (v10) {
        break;
      }
    }
    while (v5++ != 4);
    if (+[SUCoreRestoreVersion _enableVerboseLogging])
    {
      uint64_t v12 = +[SUCoreLog sharedLogger];
      v13 = [v12 oslog];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [(SUCoreRestoreVersion *)self summary];
        v15 = [v4 summary];
        int v16 = +[SUCoreRestoreVersion _stringForNSComparisonResult:v10];
        int v19 = 138543874;
        __int16 v20 = v14;
        __int16 v21 = 2114;
        uint64_t v22 = v15;
        __int16 v23 = 2114;
        v24 = v16;
        _os_log_impl(&dword_1B4EC2000, v13, OS_LOG_TYPE_DEFAULT, "[RestoreVersion] Compare: self=%{public}@ to=%{public}@ | result=%{public}@", (uint8_t *)&v19, 0x20u);
      }
    }
  }
  else
  {
    v17 = +[SUCoreDiag sharedDiag];
    [v17 trackAnomaly:@"RestoreVersion" forReason:@"Compare called on restore version when other version is not compatible" withResult:8116 withError:0];

    int64_t v10 = 0;
  }

  return v10;
}

+ (id)_stringForNSComparisonResult:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 2) {
    return 0;
  }
  else {
    return off_1E60B6A50[a3 + 1];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCoreRestoreVersion *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(SUCoreRestoreVersion *)self restoreVersionString];
      uint64_t v7 = [(SUCoreRestoreVersion *)v5 restoreVersionString];

      BOOL v8 = +[SUCore stringIsEqual:v6 to:v7];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)summary
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(SUCoreRestoreVersion *)self restoreVersionString];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(SUCoreRestoreVersion *)self restoreVersionString];
  uint64_t v5 = [(SUCoreRestoreVersion *)self parsedVersion];
  uint64_t v6 = [v5 componentsJoinedByString:@"."];
  uint64_t v7 = [v3 stringWithFormat:@"SUCoreRestoreVersion(restoreVersionString:%@|parsedVersion:%@|buildGroup:%ld)", v4, v6, -[SUCoreRestoreVersion buildGroup](self, "buildGroup")];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreRestoreVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RestoreVersionString"];

  uint64_t v6 = [(SUCoreRestoreVersion *)self initWithRestoreVersion:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreRestoreVersion *)self restoreVersionString];
  [v4 encodeObject:v5 forKey:@"RestoreVersionString"];
}

+ (BOOL)_enableVerboseLogging
{
  if (_enableVerboseLogging_restoreVersionEnableVerboseLoggingOnceToken != -1) {
    dispatch_once(&_enableVerboseLogging_restoreVersionEnableVerboseLoggingOnceToken, &__block_literal_global_3);
  }
  return _enableVerboseLogging___verboseLoggingEnabled;
}

void __45__SUCoreRestoreVersion__enableVerboseLogging__block_invoke()
{
  id v0 = [[SUCoreConfig alloc] initWithProjectName:@"SoftwareUpdateCore"];
  _enableVerboseLogging___verboseLoggingEnabled = [(SUCoreConfig *)v0 getBoolConfigForKey:@"VerboseLogging"];
}

- (NSString)restoreVersionString
{
  return self->_restoreVersionString;
}

- (void)setRestoreVersionString:(id)a3
{
}

- (NSArray)parsedVersion
{
  return self->_parsedVersion;
}

- (void)setParsedVersion:(id)a3
{
}

- (int64_t)buildGroup
{
  return self->_buildGroup;
}

- (void)setBuildGroup:(int64_t)a3
{
  self->_buildGroup = a3;
}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (int64_t)buildVersion
{
  return self->_buildVersion;
}

- (int64_t)syncedVersion
{
  return self->_syncedVersion;
}

- (int64_t)suffixVersion
{
  return self->_suffixVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedVersion, 0);
  objc_storeStrong((id *)&self->_restoreVersionString, 0);
}

- (void)initWithRestoreVersion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B4EC2000, log, OS_LOG_TYPE_ERROR, "[RestoreVersion] Init: failed to create restore version when no version string was provided", v1, 2u);
}

- (void)initWithRestoreVersion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  v1 = [v0 summary];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B4EC2000, v2, v3, "[RestoreVersion] (%{public}@) Init: failed to create a valid parsed restore version from string %{public}@", v4, v5, v6, v7, v8);
}

@end