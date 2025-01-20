@interface ICASDrawingConversionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASConversionMethod)conversionMethod;
- (ICASDrawingConversionData)initWithConversionMethod:(id)a3;
- (id)toDict;
@end

@implementation ICASDrawingConversionData

- (ICASDrawingConversionData)initWithConversionMethod:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASDrawingConversionData;
  v6 = [(ICASDrawingConversionData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_conversionMethod, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"DrawingConversionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"conversionMethod";
  v3 = [(ICASDrawingConversionData *)self conversionMethod];
  if (v3)
  {
    uint64_t v4 = [(ICASDrawingConversionData *)self conversionMethod];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (void *)v4;
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (ICASConversionMethod)conversionMethod
{
  return self->_conversionMethod;
}

- (void).cxx_destruct
{
}

@end