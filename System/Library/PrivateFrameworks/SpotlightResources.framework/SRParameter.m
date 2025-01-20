@interface SRParameter
+ (id)BOOLNil;
+ (id)BOOLNo;
+ (id)BOOLYes;
+ (id)doubleMin;
+ (id)doubleNil;
+ (id)filePathNil;
+ (id)longNil;
+ (id)longZero;
+ (id)nilParameterWithType:(int64_t)a3;
+ (id)parameterWithBoolean:(BOOL)a3 name:(id)a4;
+ (id)parameterWithDouble:(double)a3 name:(id)a4;
+ (id)parameterWithFilePath:(id)a3 name:(id)a4;
+ (id)parameterWithLong:(int64_t)a3 name:(id)a4;
+ (id)parameterWithString:(id)a3 name:(id)a4;
+ (id)stringNil;
+ (id)typeStringFromParameterType:(int64_t)a3;
- (BOOL)isBool;
- (BOOL)isDouble;
- (BOOL)isFilePath;
- (BOOL)isLong;
- (BOOL)isNil;
- (BOOL)isPositiveLong;
- (BOOL)isString;
- (BOOL)updateWithBoolean:(BOOL)a3;
- (BOOL)updateWithDouble:(double)a3;
- (BOOL)updateWithFilePath:(id)a3;
- (BOOL)updateWithLong:(int64_t)a3;
- (BOOL)updateWithString:(id)a3;
- (NSObject)value;
- (NSString)irisName;
- (NSString)name;
- (SRParameter)initWithBoolean:(BOOL)a3 flags:(int64_t)a4 name:(id)a5;
- (SRParameter)initWithDouble:(double)a3 flags:(int64_t)a4 name:(id)a5;
- (SRParameter)initWithFilePath:(id)a3 flags:(int64_t)a4 name:(id)a5;
- (SRParameter)initWithLong:(int64_t)a3 flags:(int64_t)a4 name:(id)a5;
- (SRParameter)initWithString:(id)a3 flags:(int64_t)a4 name:(id)a5;
- (SRParameter)initWithType:(int64_t)a3 flags:(int64_t)a4 name:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getBooleanValue;
- (id)getDoubleValue;
- (id)getFilePathNameValue;
- (id)getFilePathValue;
- (id)getLongValue;
- (id)getStringValue;
- (id)typeString;
- (int64_t)flag;
- (int64_t)type;
- (void)getBooleanValue;
- (void)getDoubleValue;
- (void)getFilePathValue;
- (void)getLongValue;
- (void)getStringValue;
- (void)isNil;
- (void)makeNil;
- (void)setFlag:(int64_t)a3;
- (void)setIrisName:(id)a3;
- (void)setName:(id)a3;
- (void)setNumber:(id)a3;
- (void)setString:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SRParameter

- (SRParameter)initWithType:(int64_t)a3 flags:(int64_t)a4 name:(id)a5
{
  id v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SRParameter;
  v9 = [(SRParameter *)&v18 init];
  v10 = v9;
  if (!v9)
  {
    value = SRLogCategoryGeneral();
    if (os_log_type_enabled(value, OS_LOG_TYPE_ERROR)) {
      -[SRParameter initWithType:flags:name:]();
    }
    goto LABEL_7;
  }
  v9->_type = a3;
  v9->_flag = a4;
  uint64_t v11 = [v8 copy];
  name = v10->_name;
  v10->_name = (NSString *)v11;

  irisName = v10->_irisName;
  v10->_irisName = 0;

  if ((unint64_t)a3 < 3 || (unint64_t)(a3 - 3) < 2)
  {
    value = v10->_value;
    v10->_value = 0;
LABEL_7:

    v15 = v10;
    goto LABEL_8;
  }
  v17 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SRParameter initWithType:flags:name:]();
  }

  v15 = 0;
LABEL_8:

  return v15;
}

- (SRParameter)initWithBoolean:(BOOL)a3 flags:(int64_t)a4 name:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SRParameter;
  v9 = [(SRParameter *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = 0;
    v9->_flag = a4;
    uint64_t v11 = [NSNumber numberWithBool:v6];
    value = v10->_value;
    v10->_value = v11;

    uint64_t v13 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v13;
  }
  else
  {
    name = SRLogCategoryGeneral();
    if (os_log_type_enabled(name, OS_LOG_TYPE_ERROR)) {
      -[SRParameter initWithBoolean:flags:name:]();
    }
  }

  return v10;
}

- (SRParameter)initWithLong:(int64_t)a3 flags:(int64_t)a4 name:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SRParameter;
  v9 = [(SRParameter *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = 1;
    v9->_flag = a4;
    uint64_t v11 = [NSNumber numberWithLong:a3];
    value = v10->_value;
    v10->_value = v11;

    uint64_t v13 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v13;
  }
  else
  {
    name = SRLogCategoryGeneral();
    if (os_log_type_enabled(name, OS_LOG_TYPE_ERROR)) {
      -[SRParameter initWithLong:flags:name:]();
    }
  }

  return v10;
}

- (SRParameter)initWithDouble:(double)a3 flags:(int64_t)a4 name:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SRParameter;
  v9 = [(SRParameter *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = 2;
    v9->_flag = a4;
    uint64_t v11 = [NSNumber numberWithDouble:a3];
    value = v10->_value;
    v10->_value = v11;

    uint64_t v13 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v13;
  }
  else
  {
    name = SRLogCategoryGeneral();
    if (os_log_type_enabled(name, OS_LOG_TYPE_ERROR)) {
      -[SRParameter initWithDouble:flags:name:]();
    }
  }

  return v10;
}

- (SRParameter)initWithString:(id)a3 flags:(int64_t)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SRParameter;
  v10 = [(SRParameter *)&v17 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_type = 3;
    v10->_flag = a4;
    uint64_t v12 = [NSString stringWithString:v8];
    value = v11->_value;
    v11->_value = v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;
  }
  else
  {
    name = SRLogCategoryGeneral();
    if (os_log_type_enabled(name, OS_LOG_TYPE_ERROR)) {
      -[SRParameter initWithString:flags:name:]();
    }
  }

  return v11;
}

- (SRParameter)initWithFilePath:(id)a3 flags:(int64_t)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SRParameter;
  v10 = [(SRParameter *)&v17 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_type = 4;
    v10->_flag = a4;
    uint64_t v12 = [NSString stringWithString:v8];
    value = v11->_value;
    v11->_value = v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;
  }
  else
  {
    name = SRLogCategoryGeneral();
    if (os_log_type_enabled(name, OS_LOG_TYPE_ERROR)) {
      -[SRParameter initWithFilePath:flags:name:]();
    }
  }

  return v11;
}

+ (id)nilParameterWithType:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithType:a3 flags:0 name:@"Unknown"];
  return v3;
}

+ (id)parameterWithBoolean:(BOOL)a3 name:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithBoolean:v4 flags:0 name:v6];

  return v7;
}

+ (id)parameterWithLong:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithLong:a3 flags:0 name:v6];

  return v7;
}

+ (id)parameterWithDouble:(double)a3 name:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithDouble:0 flags:v6 name:a3];

  return v7;
}

+ (id)parameterWithString:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithString:v7 flags:0 name:v6];

  return v8;
}

+ (id)parameterWithFilePath:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithFilePath:v7 flags:0 name:v6];

  return v8;
}

+ (id)typeStringFromParameterType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_2655233C8[a3];
  }
}

- (id)typeString
{
  return +[SRParameter typeStringFromParameterType:self->_type];
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setFlag:(int64_t)a3
{
  self->_flag = a3;
}

- (void)setNumber:(id)a3
{
  BOOL v4 = a3;
  id v6 = v4;
  if (v4) {
    BOOL v4 = v4;
  }
  value = self->_value;
  self->_value = v4;
}

- (void)setString:(id)a3
{
  if (a3)
  {
    self->_value = objc_msgSend(NSString, "stringWithString:");
  }
  else
  {
    self->_value = 0;
  }
  MEMORY[0x270F9A758]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (!v4)
  {
    v5 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SRParameter copyWithZone:]();
    }
  }
  p_type = &self->_type;
  [v4 setType:self->_type];
  [v4 setName:self->_name];
  irisName = self->_irisName;
  if (irisName)
  {
    id v8 = (void *)[(NSString *)irisName copy];
    [v4 setIrisName:v8];
  }
  else
  {
    [v4 setIrisName:0];
  }
  if ((unint64_t)*p_type < 3)
  {
    [v4 setNumber:self->_value];
LABEL_12:
    id v9 = v4;
    goto LABEL_13;
  }
  if ((unint64_t)(*p_type - 3) < 2)
  {
    [v4 setString:self->_value];
    goto LABEL_12;
  }
  uint64_t v11 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[SRParameter copyWithZone:]();
  }

  id v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)isNil
{
  if (self->_type <= 4uLL) {
    return self->_value == 0;
  }
  v3 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[SRParameter isNil]();
  }

  return 1;
}

- (void)makeNil
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "makeNil for SRParameter with invalid type %ld", v2, v3, v4, v5, v6);
}

- (BOOL)isBool
{
  return self->_type == 0;
}

- (BOOL)isLong
{
  return self->_type == 1;
}

- (BOOL)isPositiveLong
{
  if (self->_type == 1)
  {
    value = self->_value;
    if (value) {
      LOBYTE(value) = [value longValue] > 0;
    }
  }
  else
  {
    LOBYTE(value) = 0;
  }
  return (char)value;
}

- (BOOL)isDouble
{
  return self->_type == 2;
}

- (BOOL)isString
{
  return self->_type == 3;
}

- (BOOL)isFilePath
{
  return self->_type == 4;
}

- (id)description
{
  switch(self->_type)
  {
    case 0:
      uint64_t v2 = NSString;
      value = self->_value;
      if (value)
      {
        int v4 = [value BOOLValue];
        uint64_t v5 = @"NO";
        if (v4) {
          uint64_t v5 = @"YES";
        }
      }
      else
      {
        uint64_t v5 = @"nil";
      }
      objc_super v17 = v5;
      uint64_t v13 = @"type = Boolean, value = %@";
      goto LABEL_23;
    case 1:
      uint64_t v2 = NSString;
      id v7 = self->_value;
      if (v7)
      {
        id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[NSObject longValue](v7, "longValue"));
        [v2 stringWithFormat:@"type = Long, value = %@", v8];
        goto LABEL_11;
      }
      objc_super v17 = @"nil";
      uint64_t v13 = @"type = Long, value = %@";
      goto LABEL_23;
    case 2:
      uint64_t v2 = NSString;
      id v9 = self->_value;
      if (v9)
      {
        [v9 doubleValue];
        id v8 = objc_msgSend(v2, "stringWithFormat:", @"%.10e", v10);
        [v2 stringWithFormat:@"type = Double, value = %@", v8];
LABEL_11:
        uint8_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v17 = @"nil";
        uint64_t v13 = @"type = Double, value = %@";
LABEL_23:
        v15 = v2;
LABEL_24:
        objc_msgSend(v15, "stringWithFormat:", v13, v17);
        uint8_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
LABEL_25:
      return v6;
    case 3:
      uint64_t v11 = NSString;
      uint64_t v12 = self->_value;
      if (!v12) {
        uint64_t v12 = @"nil";
      }
      objc_super v17 = (__CFString *)v12;
      uint64_t v13 = @"type = String, value = %@";
      goto LABEL_18;
    case 4:
      uint64_t v11 = NSString;
      uint64_t v14 = self->_value;
      if (!v14) {
        uint64_t v14 = @"nil";
      }
      objc_super v17 = (__CFString *)v14;
      uint64_t v13 = @"type = FilePath, value = %@";
LABEL_18:
      v15 = v11;
      goto LABEL_24;
    default:
      uint8_t v6 = &stru_270B18FF0;
      goto LABEL_25;
  }
}

+ (id)BOOLNo
{
  if (BOOLNo_onceToken != -1) {
    dispatch_once(&BOOLNo_onceToken, &__block_literal_global_3);
  }
  uint64_t v2 = (void *)BOOLNo_paramBoolNo;
  return v2;
}

uint64_t __21__SRParameter_BOOLNo__block_invoke()
{
  BOOLNo_paramBoolNo = +[SRParameter parameterWithBoolean:0 name:@"Unknown"];
  return MEMORY[0x270F9A758]();
}

+ (id)BOOLYes
{
  if (BOOLYes_onceToken != -1) {
    dispatch_once(&BOOLYes_onceToken, &__block_literal_global_53_0);
  }
  uint64_t v2 = (void *)BOOLYes_paramBoolYes;
  return v2;
}

uint64_t __22__SRParameter_BOOLYes__block_invoke()
{
  BOOLYes_paramBoolYes = +[SRParameter parameterWithBoolean:1 name:@"Unknown"];
  return MEMORY[0x270F9A758]();
}

+ (id)longZero
{
  if (longZero_onceToken != -1) {
    dispatch_once(&longZero_onceToken, &__block_literal_global_55_0);
  }
  uint64_t v2 = (void *)longZero_paramLongZero;
  return v2;
}

uint64_t __23__SRParameter_longZero__block_invoke()
{
  longZero_paramLongZero = +[SRParameter parameterWithLong:0 name:@"Unknown"];
  return MEMORY[0x270F9A758]();
}

+ (id)doubleMin
{
  if (doubleMin_onceToken != -1) {
    dispatch_once(&doubleMin_onceToken, &__block_literal_global_57_0);
  }
  uint64_t v2 = (void *)doubleMin_paramDoubleMin;
  return v2;
}

uint64_t __24__SRParameter_doubleMin__block_invoke()
{
  doubleMin_paramDoubleMin = +[SRParameter parameterWithDouble:@"Unknown" name:2.22507386e-308];
  return MEMORY[0x270F9A758]();
}

+ (id)BOOLNil
{
  if (BOOLNil_onceToken != -1) {
    dispatch_once(&BOOLNil_onceToken, &__block_literal_global_59_0);
  }
  uint64_t v2 = (void *)BOOLNil_paramBoolNil;
  return v2;
}

uint64_t __22__SRParameter_BOOLNil__block_invoke()
{
  BOOLNil_paramBoolNil = +[SRParameter nilParameterWithType:0];
  return MEMORY[0x270F9A758]();
}

+ (id)longNil
{
  if (longNil_onceToken != -1) {
    dispatch_once(&longNil_onceToken, &__block_literal_global_61);
  }
  uint64_t v2 = (void *)longNil_paramLongNil;
  return v2;
}

uint64_t __22__SRParameter_longNil__block_invoke()
{
  longNil_paramLongNil = +[SRParameter nilParameterWithType:1];
  return MEMORY[0x270F9A758]();
}

+ (id)doubleNil
{
  if (doubleNil_onceToken != -1) {
    dispatch_once(&doubleNil_onceToken, &__block_literal_global_63);
  }
  uint64_t v2 = (void *)doubleNil_paramDoubleNil;
  return v2;
}

uint64_t __24__SRParameter_doubleNil__block_invoke()
{
  doubleNil_paramDoubleNil = +[SRParameter nilParameterWithType:2];
  return MEMORY[0x270F9A758]();
}

+ (id)stringNil
{
  if (stringNil_onceToken != -1) {
    dispatch_once(&stringNil_onceToken, &__block_literal_global_65);
  }
  uint64_t v2 = (void *)stringNil_paramStringNil;
  return v2;
}

uint64_t __24__SRParameter_stringNil__block_invoke()
{
  stringNil_paramStringNil = +[SRParameter nilParameterWithType:3];
  return MEMORY[0x270F9A758]();
}

+ (id)filePathNil
{
  if (filePathNil_onceToken != -1) {
    dispatch_once(&filePathNil_onceToken, &__block_literal_global_67);
  }
  uint64_t v2 = (void *)filePathNil_paramFilePathNil;
  return v2;
}

uint64_t __26__SRParameter_filePathNil__block_invoke()
{
  filePathNil_paramFilePathNil = +[SRParameter nilParameterWithType:4];
  return MEMORY[0x270F9A758]();
}

- (id)getBooleanValue
{
  if ([(SRParameter *)self isBool])
  {
    uint64_t v3 = self->_value;
  }
  else
  {
    int v4 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SRParameter getBooleanValue]();
    }

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)getLongValue
{
  if ([(SRParameter *)self isLong])
  {
    uint64_t v3 = self->_value;
  }
  else
  {
    int v4 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SRParameter getLongValue]();
    }

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)getDoubleValue
{
  if ([(SRParameter *)self isDouble])
  {
    uint64_t v3 = self->_value;
  }
  else
  {
    int v4 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SRParameter getDoubleValue]();
    }

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)getStringValue
{
  if ([(SRParameter *)self isString])
  {
    uint64_t v3 = self->_value;
  }
  else
  {
    int v4 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SRParameter getStringValue]();
    }

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)getFilePathValue
{
  if ([(SRParameter *)self isFilePath])
  {
    uint64_t v3 = self->_value;
  }
  else
  {
    int v4 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SRParameter getFilePathValue]();
    }

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)getFilePathNameValue
{
  if ([(SRParameter *)self isFilePath])
  {
    uint64_t v3 = [NSURL URLWithString:self->_value];
    int v4 = [v3 lastPathComponent];
  }
  else
  {
    uint64_t v5 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SRParameter getFilePathValue]();
    }

    int v4 = 0;
  }
  return v4;
}

- (BOOL)updateWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SRParameter *)self isBool];
  if (v5)
  {
    uint8_t v6 = [NSNumber numberWithBool:v3];
    value = self->_value;
    self->_value = v6;
  }
  else
  {
    id v8 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SRParameter updateWithBoolean:]();
    }
  }
  return v5;
}

- (BOOL)updateWithLong:(int64_t)a3
{
  BOOL v5 = [(SRParameter *)self isLong];
  if (v5)
  {
    uint8_t v6 = [NSNumber numberWithLong:a3];
    value = self->_value;
    self->_value = v6;
  }
  else
  {
    id v8 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SRParameter updateWithLong:]();
    }
  }
  return v5;
}

- (BOOL)updateWithDouble:(double)a3
{
  BOOL v5 = [(SRParameter *)self isDouble];
  if (v5)
  {
    uint8_t v6 = [NSNumber numberWithDouble:a3];
    value = self->_value;
    self->_value = v6;
  }
  else
  {
    id v8 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SRParameter updateWithDouble:]();
    }
  }
  return v5;
}

- (BOOL)updateWithString:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SRParameter *)self isString];
  if (v5)
  {
    uint8_t v6 = [NSString stringWithString:v4];
    value = self->_value;
    self->_value = v6;
  }
  else
  {
    id v8 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SRParameter updateWithString:]();
    }
  }
  return v5;
}

- (BOOL)updateWithFilePath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SRParameter *)self isFilePath];
  if (v5)
  {
    uint8_t v6 = [NSString stringWithString:v4];
    value = self->_value;
    self->_value = v6;
  }
  else
  {
    id v8 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SRParameter updateWithFilePath:]();
    }
  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)flag
{
  return self->_flag;
}

- (NSString)name
{
  return self->_name;
}

- (NSObject)value
{
  return self->_value;
}

- (NSString)irisName
{
  return self->_irisName;
}

- (void)setIrisName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irisName, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithType:flags:name:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_25E378000, v0, v1, "initWithType for SRParameter returns nil self", v2, v3, v4, v5, v6);
}

- (void)initWithType:flags:name:.cold.2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "initWithType for SRParameter with invalid type: %ld", v2, v3, v4, v5, v6);
}

- (void)initWithBoolean:flags:name:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_25E378000, v0, v1, "initWithBoolean for SRParameter returns nil self", v2, v3, v4, v5, v6);
}

- (void)initWithLong:flags:name:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_25E378000, v0, v1, "initWithLong for SRParameter returns nil self", v2, v3, v4, v5, v6);
}

- (void)initWithDouble:flags:name:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_25E378000, v0, v1, "initWithDouble for SRParameter returns nil self", v2, v3, v4, v5, v6);
}

- (void)initWithString:flags:name:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_25E378000, v0, v1, "initWithString for SRParameter returns nil self", v2, v3, v4, v5, v6);
}

- (void)initWithFilePath:flags:name:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_25E378000, v0, v1, "initWithFilePath for SRParameter returns nil self", v2, v3, v4, v5, v6);
}

- (void)copyWithZone:.cold.1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "copyWithZone for SRParameter with invalid type %ld", v2, v3, v4, v5, v6);
}

- (void)copyWithZone:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_25E378000, v0, v1, "copyWithZone for SRParameter returning nil self", v2, v3, v4, v5, v6);
}

- (void)isNil
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "isNil for SRParameter with invalid type %ld", v2, v3, v4, v5, v6);
}

- (void)getBooleanValue
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SRParameter getBooleanValue called for type %ld", v2, v3, v4, v5, v6);
}

- (void)getLongValue
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SRParameter getLongValue called for type %ld", v2, v3, v4, v5, v6);
}

- (void)getDoubleValue
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SRParameter getDoubleValue called for type %ld", v2, v3, v4, v5, v6);
}

- (void)getStringValue
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SRParameter getStringValue called for type %ld", v2, v3, v4, v5, v6);
}

- (void)getFilePathValue
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SRParameter getFilePathValue called for type %ld", v2, v3, v4, v5, v6);
}

- (void)updateWithBoolean:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SRParameter updateWithBoolean called for type %ld", v2, v3, v4, v5, v6);
}

- (void)updateWithLong:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SRParameter updateWithLong called for type %ld", v2, v3, v4, v5, v6);
}

- (void)updateWithDouble:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SRParameter updateWithDouble called for type %ld", v2, v3, v4, v5, v6);
}

- (void)updateWithString:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SRParameter updateWithString called for type %ld", v2, v3, v4, v5, v6);
}

- (void)updateWithFilePath:.cold.1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SRParameter updateWithFilePath called for type %ld", v2, v3, v4, v5, v6);
}

@end