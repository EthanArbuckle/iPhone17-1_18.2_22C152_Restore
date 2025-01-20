@interface ICASTagAddData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASTagAddApproach)tagAddApproach;
- (ICASTagAddData)initWithIsExistingTag:(id)a3 tagAddApproach:(id)a4 isAutoConversionEnabled:(id)a5;
- (NSNumber)isAutoConversionEnabled;
- (NSNumber)isExistingTag;
- (id)toDict;
@end

@implementation ICASTagAddData

- (ICASTagAddData)initWithIsExistingTag:(id)a3 tagAddApproach:(id)a4 isAutoConversionEnabled:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASTagAddData;
  v12 = [(ICASTagAddData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_isExistingTag, a3);
    objc_storeStrong((id *)&v13->_tagAddApproach, a4);
    objc_storeStrong((id *)&v13->_isAutoConversionEnabled, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"TagAddData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"isExistingTag";
  v3 = [(ICASTagAddData *)self isExistingTag];
  if (v3)
  {
    uint64_t v4 = [(ICASTagAddData *)self isExistingTag];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"tagAddApproach";
  v6 = [(ICASTagAddData *)self tagAddApproach];
  if (v6)
  {
    uint64_t v7 = [(ICASTagAddData *)self tagAddApproach];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"isAutoConversionEnabled";
  id v9 = [(ICASTagAddData *)self isAutoConversionEnabled];
  if (v9)
  {
    uint64_t v10 = [(ICASTagAddData *)self isAutoConversionEnabled];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (NSNumber)isExistingTag
{
  return self->_isExistingTag;
}

- (ICASTagAddApproach)tagAddApproach
{
  return self->_tagAddApproach;
}

- (NSNumber)isAutoConversionEnabled
{
  return self->_isAutoConversionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isAutoConversionEnabled, 0);
  objc_storeStrong((id *)&self->_tagAddApproach, 0);
  objc_storeStrong((id *)&self->_isExistingTag, 0);
}

@end