@interface ICASStyleData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASStyleData)initWithStyleType:(id)a3;
- (ICASStyleType)styleType;
- (id)toDict;
@end

@implementation ICASStyleData

- (ICASStyleData)initWithStyleType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASStyleData;
  v6 = [(ICASStyleData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_styleType, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"StyleData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"styleType";
  v3 = [(ICASStyleData *)self styleType];
  if (v3)
  {
    uint64_t v4 = [(ICASStyleData *)self styleType];
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

- (ICASStyleType)styleType
{
  return self->_styleType;
}

- (void).cxx_destruct
{
}

@end