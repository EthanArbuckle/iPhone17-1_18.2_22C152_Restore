@interface TIKBAnalyticsMetricsContext
+ (BOOL)supportsSecureCoding;
+ (id)keyboardTypeEnumToString:(unsigned __int8)a3;
+ (id)userInterfaceIdiomToString:(int64_t)a3;
+ (int64_t)userInterfaceIdiomStringToEnum:(id)a3;
+ (unsigned)keyboardTypeStringToEnum:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)testingParameters;
- (NSString)inputVariant;
- (NSString)keyboardConfiguration;
- (NSString)layoutName;
- (NSString)secondaryLanguage;
- (NSString)secondaryRegion;
- (TIKBAnalyticsMetricsContext)initWithCoder:(id)a3;
- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 inputVariant:(id)a5 secondaryLanguage:(id)a6 secondaryRegion:(id)a7 layoutName:(id)a8 keyboardType:(unsigned __int8)a9 keyboardConfiguration:(id)a10 userInterfaceIdiom:(int64_t)a11 testingParameters:(id)a12;
- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 layoutName:(id)a5 keyboardType:(unsigned __int8)a6 keyboardConfiguration:(id)a7 userInterfaceIdiom:(int64_t)a8;
- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 layoutName:(id)a5 keyboardType:(unsigned __int8)a6 userInterfaceIdiom:(int64_t)a7;
- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 layoutName:(id)a5 keyboardType:(unsigned __int8)a6 userInterfaceIdiom:(int64_t)a7 testingParameters:(id)a8;
- (TIKBAnalyticsMetricsContext)initWithKeyboardState:(id)a3 activeInputModes:(id)a4 testingParameters:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultLanguageOrRegionFromInputMode:(id)a3;
- (int64_t)userInterfaceIdiom;
- (unint64_t)hash;
- (unsigned)keyboardType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIKBAnalyticsMetricsContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testingParameters, 0);
  objc_storeStrong((id *)&self->_keyboardConfiguration, 0);
  objc_storeStrong((id *)&self->_layoutName, 0);
  objc_storeStrong((id *)&self->_secondaryRegion, 0);
  objc_storeStrong((id *)&self->_secondaryLanguage, 0);

  objc_storeStrong((id *)&self->_inputVariant, 0);
}

- (NSDictionary)testingParameters
{
  return self->_testingParameters;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (NSString)keyboardConfiguration
{
  return self->_keyboardConfiguration;
}

- (unsigned)keyboardType
{
  return self->_keyboardType;
}

- (NSString)layoutName
{
  return self->_layoutName;
}

- (NSString)secondaryRegion
{
  return self->_secondaryRegion;
}

- (NSString)secondaryLanguage
{
  return self->_secondaryLanguage;
}

- (NSString)inputVariant
{
  return self->_inputVariant;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TIKBAnalyticsMetricsContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v15.receiver = self;
    v15.super_class = (Class)TIKBAnalyticsMetricsContext;
    if ([(TIAnalyticsMetricsContext *)&v15 isEqual:v6]
      && self->_keyboardType == v6->_keyboardType
      && self->_userInterfaceIdiom == v6->_userInterfaceIdiom
      && ((inputVariant = self->_inputVariant, !((unint64_t)inputVariant | (unint64_t)v6->_inputVariant))
       || -[NSString isEqualToString:](inputVariant, "isEqualToString:"))
      && ((secondaryLanguage = self->_secondaryLanguage,
           !((unint64_t)secondaryLanguage | (unint64_t)v6->_secondaryLanguage))
       || -[NSString isEqualToString:](secondaryLanguage, "isEqualToString:"))
      && ((secondaryRegion = self->_secondaryRegion,
           !((unint64_t)secondaryRegion | (unint64_t)v6->_secondaryRegion))
       || -[NSString isEqualToString:](secondaryRegion, "isEqualToString:"))
      && ((layoutName = self->_layoutName, !((unint64_t)layoutName | (unint64_t)v6->_layoutName))
       || -[NSString isEqualToString:](layoutName, "isEqualToString:")))
    {
      testingParameters = self->_testingParameters;
      v12 = v6->_testingParameters;
      if (testingParameters) {
        char v13 = [(NSDictionary *)testingParameters isEqual:v12];
      }
      else {
        char v13 = v12 == 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)TIKBAnalyticsMetricsContext;
  uint64_t v3 = 257 * [(TIAnalyticsMetricsContext *)&v21 hash];
  NSUInteger v4 = 257 * ([(NSString *)self->_inputVariant hash] + v3);
  NSUInteger v5 = 257 * ([(NSString *)self->_secondaryLanguage hash] + v4);
  NSUInteger v6 = 257 * ([(NSString *)self->_secondaryRegion hash] + v5);
  NSUInteger v7 = 257 * (257 * ([(NSString *)self->_layoutName hash] + v6) + self->_keyboardType);
  unint64_t v8 = 257 * (v7 + [(NSString *)self->_keyboardConfiguration hash]) + self->_userInterfaceIdiom;
  testingParameters = self->_testingParameters;
  if (testingParameters)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = [(NSDictionary *)testingParameters allKeys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_super v15 = [(NSDictionary *)self->_testingParameters objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * v14)];
          unint64_t v8 = [v15 hash] + 257 * v8;

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TIKBAnalyticsMetricsContext;
  NSUInteger v5 = -[TIAnalyticsMetricsContext copyWithZone:](&v19, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_inputVariant copyWithZone:a3];
    NSUInteger v7 = (void *)v5[4];
    v5[4] = v6;

    uint64_t v8 = [(NSString *)self->_secondaryLanguage copyWithZone:a3];
    v9 = (void *)v5[5];
    v5[5] = v8;

    uint64_t v10 = [(NSString *)self->_secondaryRegion copyWithZone:a3];
    uint64_t v11 = (void *)v5[6];
    v5[6] = v10;

    uint64_t v12 = [(NSString *)self->_layoutName copyWithZone:a3];
    uint64_t v13 = (void *)v5[7];
    v5[7] = v12;

    *((unsigned char *)v5 + 24) = self->_keyboardType;
    uint64_t v14 = [(NSString *)self->_keyboardConfiguration copyWithZone:a3];
    objc_super v15 = (void *)v5[8];
    v5[8] = v14;

    v5[9] = self->_userInterfaceIdiom;
    uint64_t v16 = [(NSDictionary *)self->_testingParameters copyWithZone:a3];
    long long v17 = (void *)v5[10];
    v5[10] = v16;
  }
  return v5;
}

- (TIKBAnalyticsMetricsContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TIKBAnalyticsMetricsContext;
  NSUInteger v5 = [(TIAnalyticsMetricsContext *)&v28 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputVariant"];
    uint64_t v7 = [v6 copy];
    inputVariant = v5->_inputVariant;
    v5->_inputVariant = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryLanguage"];
    uint64_t v10 = [v9 copy];
    secondaryLanguage = v5->_secondaryLanguage;
    v5->_secondaryLanguage = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryRegion"];
    uint64_t v13 = [v12 copy];
    secondaryRegion = v5->_secondaryRegion;
    v5->_secondaryRegion = (NSString *)v13;

    objc_super v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutName"];
    uint64_t v16 = [v15 copy];
    layoutName = v5->_layoutName;
    v5->_layoutName = (NSString *)v16;

    v5->_keyboardType = [v4 decodeIntForKey:@"keyboardType"];
    long long v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardConfiguration"];
    uint64_t v19 = [v18 copy];
    keyboardConfiguration = v5->_keyboardConfiguration;
    v5->_keyboardConfiguration = (NSString *)v19;

    v5->_userInterfaceIdiom = (int)[v4 decodeIntForKey:@"userInterfaceIdiom"];
    objc_super v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v24 = [v4 decodeObjectOfClasses:v23 forKey:@"testingParameters"];

    uint64_t v25 = _deepCopyOfStringDictionary(v24);
    testingParameters = v5->_testingParameters;
    v5->_testingParameters = (NSDictionary *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIKBAnalyticsMetricsContext;
  id v4 = a3;
  [(TIAnalyticsMetricsContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputVariant, @"inputVariant", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_secondaryLanguage forKey:@"secondaryLanguage"];
  [v4 encodeObject:self->_secondaryRegion forKey:@"secondaryRegion"];
  [v4 encodeObject:self->_layoutName forKey:@"layoutName"];
  [v4 encodeInt:self->_keyboardType forKey:@"keyboardType"];
  [v4 encodeObject:self->_keyboardConfiguration forKey:@"keyboardConfiguration"];
  [v4 encodeInt:LODWORD(self->_userInterfaceIdiom) forKey:@"userInterfaceIdiom"];
  [v4 encodeObject:self->_testingParameters forKey:@"testingParameters"];
}

- (id)defaultLanguageOrRegionFromInputMode:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 length]) {
      objc_super v5 = v4;
    }
    else {
      objc_super v5 = @"Empty";
    }
  }
  else
  {
    objc_super v5 = @"Unknown";
  }

  return v5;
}

- (TIKBAnalyticsMetricsContext)initWithKeyboardState:(id)a3 activeInputModes:(id)a4 testingParameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 inputMode];
  uint64_t v12 = TIInputModeGetLanguage();
  uint64_t v13 = TIInputModeGetRegion();
  TIInputModeGetVariant();
  uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = [(TIKBAnalyticsMetricsContext *)self defaultLanguageOrRegionFromInputMode:v11];
    if (v13) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = [(TIKBAnalyticsMetricsContext *)self defaultLanguageOrRegionFromInputMode:v11];
LABEL_3:
  objc_super v15 = @"None";
  if (!v14) {
    uint64_t v14 = @"None";
  }
  uint64_t v16 = @"None";
  v40 = v14;
  if ((unint64_t)[v9 count] >= 2)
  {
    v39 = v13;
    long long v17 = v12;
    id v18 = v10;
    uint64_t v19 = [v9 objectAtIndexedSubscript:1];
    long long v20 = [v19 normalizedIdentifier];

    TIInputModeGetLanguage();
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = TIInputModeGetRegion();
    objc_super v15 = (__CFString *)v21;
    if (v16)
    {
      if (v21)
      {
LABEL_8:

        id v10 = v18;
        uint64_t v12 = v17;
        uint64_t v13 = v39;
        uint64_t v14 = v40;
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v16 = [(TIKBAnalyticsMetricsContext *)self defaultLanguageOrRegionFromInputMode:v20];
      if (v15) {
        goto LABEL_8;
      }
    }
    objc_super v15 = [(TIKBAnalyticsMetricsContext *)self defaultLanguageOrRegionFromInputMode:v20];
    goto LABEL_8;
  }
LABEL_9:
  v41.receiver = self;
  v41.super_class = (Class)TIKBAnalyticsMetricsContext;
  uint64_t v22 = [(TIAnalyticsMetricsContext *)&v41 initWithInputLanguage:v12 inputRegion:v13];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_inputVariant, v14);
    objc_storeStrong((id *)&v23->_secondaryLanguage, v16);
    objc_storeStrong((id *)&v23->_secondaryRegion, v15);
    v24 = [v8 layoutState];
    v23->_userInterfaceIdiom = [v24 userInterfaceIdiom];

    v23->_keyboardType = 0;
    v38 = v10;
    if ([v8 hardwareKeyboardMode])
    {
      v23->_keyboardType = 5;
      uint64_t v25 = [v8 layoutState];
      v26 = [v25 hardwareLayout];
    }
    else
    {
      if ([v8 floatingKeyboardMode])
      {
        v23->_keyboardType = 3;
        v23->_userInterfaceIdiom = 1;
      }
      else
      {
        if ([v8 splitKeyboardMode])
        {
          char v27 = 4;
        }
        else if ([v8 landscapeOrientation])
        {
          char v27 = 2;
        }
        else
        {
          char v27 = 1;
        }
        v23->_keyboardType = v27;
      }
      uint64_t v25 = [v8 layoutState];
      v26 = [v25 softwareLayout];
    }
    objc_super v28 = v26;
    uint64_t v29 = [v26 copy];
    layoutName = v23->_layoutName;
    v23->_layoutName = (NSString *)v29;

    if (!v23->_layoutName) {
      v23->_layoutName = (NSString *)@"Unknown";
    }
    TIInputModeGetFullInputModeIdentifier();
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (!v31) {
      v31 = @"None";
    }
    uint64_t v33 = [(__CFString *)v31 copy];
    keyboardConfiguration = v23->_keyboardConfiguration;
    v23->_keyboardConfiguration = (NSString *)v33;

    id v10 = v38;
    uint64_t v35 = _deepCopyOfStringDictionary(v38);
    testingParameters = v23->_testingParameters;
    v23->_testingParameters = (NSDictionary *)v35;

    uint64_t v14 = v40;
  }

  return v23;
}

- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 inputVariant:(id)a5 secondaryLanguage:(id)a6 secondaryRegion:(id)a7 layoutName:(id)a8 keyboardType:(unsigned __int8)a9 keyboardConfiguration:(id)a10 userInterfaceIdiom:(int64_t)a11 testingParameters:(id)a12
{
  id v18 = (__CFString *)a5;
  uint64_t v19 = (__CFString *)a6;
  long long v20 = (__CFString *)a7;
  id v21 = a8;
  uint64_t v22 = (__CFString *)a10;
  id v23 = a12;
  v42.receiver = self;
  v42.super_class = (Class)TIKBAnalyticsMetricsContext;
  v24 = [(TIAnalyticsMetricsContext *)&v42 initWithInputLanguage:a3 inputRegion:a4];
  if (v24)
  {
    if (v18) {
      uint64_t v25 = v18;
    }
    else {
      uint64_t v25 = @"None";
    }
    uint64_t v26 = [(__CFString *)v25 copy];
    inputVariant = v24->_inputVariant;
    v24->_inputVariant = (NSString *)v26;

    if (v19) {
      objc_super v28 = v19;
    }
    else {
      objc_super v28 = @"None";
    }
    uint64_t v29 = [(__CFString *)v28 copy];
    secondaryLanguage = v24->_secondaryLanguage;
    v24->_secondaryLanguage = (NSString *)v29;

    if (v20) {
      v31 = v20;
    }
    else {
      v31 = @"None";
    }
    uint64_t v32 = [(__CFString *)v31 copy];
    secondaryRegion = v24->_secondaryRegion;
    v24->_secondaryRegion = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    layoutName = v24->_layoutName;
    v24->_layoutName = (NSString *)v34;

    v24->_keyboardType = a9;
    if (v22) {
      v36 = v22;
    }
    else {
      v36 = @"None";
    }
    uint64_t v37 = [(__CFString *)v36 copy];
    keyboardConfiguration = v24->_keyboardConfiguration;
    v24->_keyboardConfiguration = (NSString *)v37;

    v24->_userInterfaceIdiom = a11;
    uint64_t v39 = _deepCopyOfStringDictionary(v23);
    testingParameters = v24->_testingParameters;
    v24->_testingParameters = (NSDictionary *)v39;
  }
  return v24;
}

- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 layoutName:(id)a5 keyboardType:(unsigned __int8)a6 userInterfaceIdiom:(int64_t)a7 testingParameters:(id)a8
{
  LOBYTE(v9) = a6;
  return [(TIKBAnalyticsMetricsContext *)self initWithInputLanguage:a3 inputRegion:a4 inputVariant:0 secondaryLanguage:0 secondaryRegion:0 layoutName:a5 keyboardType:v9 keyboardConfiguration:0 userInterfaceIdiom:a7 testingParameters:a8];
}

- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 layoutName:(id)a5 keyboardType:(unsigned __int8)a6 keyboardConfiguration:(id)a7 userInterfaceIdiom:(int64_t)a8
{
  LOBYTE(v9) = a6;
  return [(TIKBAnalyticsMetricsContext *)self initWithInputLanguage:a3 inputRegion:a4 inputVariant:0 secondaryLanguage:0 secondaryRegion:0 layoutName:a5 keyboardType:v9 keyboardConfiguration:a7 userInterfaceIdiom:a8 testingParameters:MEMORY[0x1E4F1CC08]];
}

- (TIKBAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4 layoutName:(id)a5 keyboardType:(unsigned __int8)a6 userInterfaceIdiom:(int64_t)a7
{
  return [(TIKBAnalyticsMetricsContext *)self initWithInputLanguage:a3 inputRegion:a4 layoutName:a5 keyboardType:a6 userInterfaceIdiom:a7 testingParameters:MEMORY[0x1E4F1CC08]];
}

+ (int64_t)userInterfaceIdiomStringToEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Phone"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Pad"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"TV"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

+ (id)userInterfaceIdiomToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unspecified";
  }
  else {
    return off_1E6E2BB30[a3];
  }
}

+ (unsigned)keyboardTypeStringToEnum:(id)a3
{
  v7[6] = *MEMORY[0x1E4F143B8];
  v7[0] = @"Unknown";
  v7[1] = @"Portrait";
  v7[2] = @"Landscape";
  v7[3] = @"Floating,";
  v7[4] = @"Split";
  v7[5] = @"Hardware";
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  objc_super v5 = [v3 arrayWithObjects:v7 count:6];
  LOBYTE(v3) = [v5 indexOfObject:v4];

  return v3;
}

+ (id)keyboardTypeEnumToString:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  v7[6] = *MEMORY[0x1E4F143B8];
  id v4 = @"Unknown";
  v7[0] = @"Unknown";
  v7[1] = @"Portrait";
  v7[2] = @"Landscape";
  v7[3] = @"Floating,";
  v7[4] = @"Split";
  v7[5] = @"Hardware";
  objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];
  if ([v5 count] > (unint64_t)v3)
  {
    id v4 = [v5 objectAtIndex:v3];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end