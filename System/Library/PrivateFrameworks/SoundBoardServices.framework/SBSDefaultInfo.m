@interface SBSDefaultInfo
+ (BOOL)supportsSecureCoding;
+ (id)defaultsName:(id)a3 asBool:(id)a4;
+ (id)defaultsName:(id)a3 asBool:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6;
+ (id)defaultsName:(id)a3 asDouble:(id)a4;
+ (id)defaultsName:(id)a3 asDouble:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6;
+ (id)defaultsName:(id)a3 asDouble:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6 userInfo:(id)a7 requiresReinit:(BOOL)a8;
+ (id)defaultsName:(id)a3 asDouble:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6;
+ (id)defaultsName:(id)a3 asInt:(id)a4;
+ (id)defaultsName:(id)a3 asInt:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6;
+ (id)defaultsName:(id)a3 asInt:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6 userInfo:(id)a7 requiresReinit:(BOOL)a8;
+ (id)defaultsName:(id)a3 asInt:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6;
+ (id)defaultsName:(id)a3 asString:(id)a4;
+ (id)defaultsName:(id)a3 asString:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6;
- (BOOL)isBool;
- (BOOL)isDouble;
- (BOOL)requiresReinit;
- (NSNumber)rangeMax;
- (NSNumber)rangeMin;
- (NSObject)defaultValue;
- (NSString)stringForUserDefault;
- (NSString)userDescription;
- (NSString)valueType;
- (SBSDefaultInfo)initWithCoder:(id)a3;
- (id)getHumanReadable:(id)a3 isDefaultSet:(BOOL)a4;
- (unint64_t)defaultType;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultType:(unint64_t)a3;
@end

@implementation SBSDefaultInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeMax, 0);
  objc_storeStrong((id *)&self->_rangeMin, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_stringForUserDefault, 0);
}

- (void)setDefaultType:(unint64_t)a3
{
  self->_defaultType = a3;
}

- (unint64_t)defaultType
{
  return self->_defaultType;
}

- (BOOL)requiresReinit
{
  return self->_requiresReinit;
}

- (NSNumber)rangeMax
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)rangeMin
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isDouble
{
  return self->_isDouble;
}

- (BOOL)isBool
{
  return self->_isBool;
}

- (NSObject)defaultValue
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSString)userDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)stringForUserDefault
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)getHumanReadable:(id)a3 isDefaultSet:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(SBSDefaultInfo *)self stringForUserDefault];
  [v7 getCString:v45 maxLength:128 encoding:1];

  v8 = [(SBSDefaultInfo *)self defaultValue];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (__CFString *)v6;
    }
    else
    {
      v10 = [v6 stringValue];
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  v12 = [(SBSDefaultInfo *)self defaultValue];
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();

  if (v13)
  {
    if ([(SBSDefaultInfo *)self isBool])
    {
      int v14 = [v6 BOOLValue];
      v15 = @"NO";
      if (v14) {
        v15 = @"YES";
      }
      v16 = v15;
      goto LABEL_17;
    }
    BOOL v17 = [(SBSDefaultInfo *)self isDouble];
    v18 = NSString;
    if (v17)
    {
      [v6 doubleValue];
      objc_msgSend(v18, "stringWithFormat:", @"%-4.2f", v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v21 = [(SBSDefaultInfo *)self rangeMax];

      if (v21)
      {
        v22 = NSString;
        v11 = [(SBSDefaultInfo *)self rangeMin];
        [(__CFString *)v11 doubleValue];
        uint64_t v24 = v23;
        v25 = [(SBSDefaultInfo *)self rangeMax];
        [v25 doubleValue];
        v16 = [v22 stringWithFormat:@"%@ [%.2f..%.2f]", v20, v24, v26];

LABEL_17:
        v11 = v16;
        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%-4ld", objc_msgSend(v6, "integerValue"));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v27 = [(SBSDefaultInfo *)self rangeMax];

      if (v27)
      {
        v28 = NSString;
        v11 = [(SBSDefaultInfo *)self rangeMin];
        uint64_t v29 = [(__CFString *)v11 integerValue];
        v30 = [(SBSDefaultInfo *)self rangeMax];
        v16 = [v28 stringWithFormat:@"%@ [%ld..%ld]", v20, v29, objc_msgSend(v30, "integerValue")];

        goto LABEL_17;
      }
    }
    v11 = v20;
  }
LABEL_18:
  v31 = [(SBSDefaultInfo *)self defaultValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v32 = [(SBSDefaultInfo *)self isBool];

    if (!v32) {
      goto LABEL_24;
    }
    int v33 = [v6 BOOLValue];
    v34 = @"NO";
    if (v33) {
      v34 = @"YES";
    }
    v31 = v11;
    v11 = v34;
  }

LABEL_24:
  [(__CFString *)v11 getCString:v44 maxLength:128 encoding:1];
  v35 = [(SBSDefaultInfo *)self stringForUserDefault];
  v36 = [(SBSDefaultInfo *)self userDescription];
  int v37 = [v35 isEqualToString:v36];

  v38 = NSString;
  if (v4) {
    v39 = "*";
  }
  else {
    v39 = "";
  }
  if (v4) {
    v40 = "";
  }
  else {
    v40 = " ";
  }
  if (v37)
  {
    v41 = [NSString stringWithFormat:@"%s%-40s%s : %-16s%@%@", v39, v45, v40, v44, &stru_26E55DF90, &stru_26E55DF90];
  }
  else
  {
    v42 = [(SBSDefaultInfo *)self userDescription];
    v41 = [v38 stringWithFormat:@"%s%-40s%s : %-16s%@%@", v39, v45, v40, v44, @" : ", v42];
  }
  return v41;
}

- (NSString)valueType
{
  if ([(SBSDefaultInfo *)self isBool]) {
    return (NSString *)@"BOOL";
  }
  if ([(SBSDefaultInfo *)self isDouble]) {
    return (NSString *)@"float";
  }
  unint64_t v4 = [(SBSDefaultInfo *)self defaultType];
  if (v4 < 4) {
    return &off_264BA4338[v4]->isa;
  }
  v5 = [(SBSDefaultInfo *)self defaultValue];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return (NSString *)@"array";
  }
  v7 = [(SBSDefaultInfo *)self defaultValue];
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  if (v8) {
    return (NSString *)@"dictionary";
  }
  else {
    return (NSString *)&stru_26E55DF90;
  }
}

- (SBSDefaultInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBSDefaultInfo;
  v5 = [(SBSDefaultInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringForUserDefault"];
    stringForUserDefault = v5->_stringForUserDefault;
    v5->_stringForUserDefault = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDescription"];
    userDescription = v5->_userDescription;
    v5->_userDescription = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultType"];
    v5->_defaultType = [v10 unsignedIntegerValue];

    switch(v5->_defaultType)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 3uLL:
        uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValue"];
        defaultValue = v5->_defaultValue;
        v5->_defaultValue = v11;

        break;
      default:
        break;
    }
    char v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isBool"];
    v5->_isBool = [v13 BOOLValue];

    int v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isDouble"];
    v5->_isDouble = [v14 BOOLValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rangeMin"];
    rangeMin = v5->_rangeMin;
    v5->_rangeMin = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rangeMax"];
    rangeMax = v5->_rangeMax;
    v5->_rangeMax = (NSNumber *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiresReinit"];
    v5->_requiresReinit = [v19 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SBSDefaultInfo *)self stringForUserDefault];
  [v4 encodeObject:v5 forKey:@"stringForUserDefault"];

  uint64_t v6 = [(SBSDefaultInfo *)self userDescription];
  [v4 encodeObject:v6 forKey:@"userDescription"];

  v7 = [(SBSDefaultInfo *)self defaultValue];
  [v4 encodeObject:v7 forKey:@"defaultValue"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SBSDefaultInfo isBool](self, "isBool"));
  [v4 encodeObject:v8 forKey:@"isBool"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[SBSDefaultInfo isDouble](self, "isDouble"));
  [v4 encodeObject:v9 forKey:@"isDouble"];

  v10 = [(SBSDefaultInfo *)self rangeMin];
  [v4 encodeObject:v10 forKey:@"rangeMin"];

  uint64_t v11 = [(SBSDefaultInfo *)self rangeMax];
  [v4 encodeObject:v11 forKey:@"rangeMax"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SBSDefaultInfo requiresReinit](self, "requiresReinit"));
  [v4 encodeObject:v12 forKey:@"requiresReinit"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBSDefaultInfo defaultType](self, "defaultType"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v13 forKey:@"defaultType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultsName:(id)a3 asString:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_opt_new();
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    int v14 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = v13;

    uint64_t v15 = [v11 copy];
    v16 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = v15;

    uint64_t v17 = [v10 copy];
    v18 = *(void **)(v12 + 32);
    *(void *)(v12 + 32) = v17;

    *(unsigned char *)(v12 + 8) = 0;
    *(unsigned char *)(v12 + 10) = a6;
    *(void *)(v12 + 56) = 1;
    id v19 = (id)v12;
  }

  return (id)v12;
}

+ (id)defaultsName:(id)a3 asString:(id)a4
{
  return +[SBSDefaultInfo defaultsName:a3 asString:a4 userInfo:a3 requiresReinit:0];
}

+ (id)defaultsName:(id)a3 asDouble:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6 userInfo:(id)a7 requiresReinit:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = objc_opt_new();
  if (v18)
  {
    uint64_t v19 = [v13 copy];
    v20 = *(void **)(v18 + 16);
    *(void *)(v18 + 16) = v19;

    uint64_t v21 = [v17 copy];
    v22 = *(void **)(v18 + 24);
    *(void *)(v18 + 24) = v21;

    objc_storeStrong((id *)(v18 + 32), a4);
    objc_storeStrong((id *)(v18 + 40), a5);
    objc_storeStrong((id *)(v18 + 48), a6);
    *(unsigned char *)(v18 + 9) = 1;
    *(unsigned char *)(v18 + 10) = a8;
    *(void *)(v18 + 56) = 2;
    id v23 = (id)v18;
  }

  return (id)v18;
}

+ (id)defaultsName:(id)a3 asDouble:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6
{
  return +[SBSDefaultInfo defaultsName:a3 asDouble:a4 rangeMin:0 rangeMax:0 userInfo:a5 requiresReinit:a6];
}

+ (id)defaultsName:(id)a3 asDouble:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6
{
  return +[SBSDefaultInfo defaultsName:a3 asDouble:a4 rangeMin:a5 rangeMax:a6 userInfo:a3 requiresReinit:0];
}

+ (id)defaultsName:(id)a3 asDouble:(id)a4
{
  return +[SBSDefaultInfo defaultsName:a3 asDouble:a4 rangeMin:0 rangeMax:0 userInfo:a3 requiresReinit:0];
}

+ (id)defaultsName:(id)a3 asInt:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6 userInfo:(id)a7 requiresReinit:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = objc_opt_new();
  if (v18)
  {
    uint64_t v19 = [v13 copy];
    v20 = *(void **)(v18 + 16);
    *(void *)(v18 + 16) = v19;

    uint64_t v21 = [v17 copy];
    v22 = *(void **)(v18 + 24);
    *(void *)(v18 + 24) = v21;

    objc_storeStrong((id *)(v18 + 32), a4);
    objc_storeStrong((id *)(v18 + 40), a5);
    objc_storeStrong((id *)(v18 + 48), a6);
    *(unsigned char *)(v18 + 10) = a8;
    *(void *)(v18 + 56) = 2;
    id v23 = (id)v18;
  }

  return (id)v18;
}

+ (id)defaultsName:(id)a3 asInt:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6
{
  return +[SBSDefaultInfo defaultsName:a3 asInt:a4 rangeMin:0 rangeMax:0 userInfo:a5 requiresReinit:a6];
}

+ (id)defaultsName:(id)a3 asInt:(id)a4 rangeMin:(id)a5 rangeMax:(id)a6
{
  return +[SBSDefaultInfo defaultsName:a3 asInt:a4 rangeMin:a5 rangeMax:a6 userInfo:a3 requiresReinit:0];
}

+ (id)defaultsName:(id)a3 asInt:(id)a4
{
  return +[SBSDefaultInfo defaultsName:a3 asInt:a4 rangeMin:0 rangeMax:0 userInfo:a3 requiresReinit:0];
}

+ (id)defaultsName:(id)a3 asBool:(id)a4 userInfo:(id)a5 requiresReinit:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_opt_new();
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    id v14 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = v13;

    uint64_t v15 = [v11 copy];
    id v16 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = v15;

    objc_storeStrong((id *)(v12 + 32), a4);
    *(unsigned char *)(v12 + 8) = 1;
    *(unsigned char *)(v12 + 10) = a6;
    *(void *)(v12 + 56) = 2;
    id v17 = (id)v12;
  }

  return (id)v12;
}

+ (id)defaultsName:(id)a3 asBool:(id)a4
{
  return +[SBSDefaultInfo defaultsName:a3 asBool:a4 userInfo:a3 requiresReinit:0];
}

@end