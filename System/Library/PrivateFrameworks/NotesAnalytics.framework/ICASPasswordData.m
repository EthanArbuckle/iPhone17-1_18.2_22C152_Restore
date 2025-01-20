@interface ICASPasswordData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPasswordData)initWithPasswordType:(id)a3 hasHint:(id)a4;
- (ICASPasswordType)passwordType;
- (NSNumber)hasHint;
- (id)toDict;
@end

@implementation ICASPasswordData

- (ICASPasswordData)initWithPasswordType:(id)a3 hasHint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASPasswordData;
  v9 = [(ICASPasswordData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passwordType, a3);
    objc_storeStrong((id *)&v10->_hasHint, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"PasswordData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"passwordType";
  v3 = [(ICASPasswordData *)self passwordType];
  if (v3)
  {
    uint64_t v4 = [(ICASPasswordData *)self passwordType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"hasHint";
  v12[0] = v4;
  v6 = [(ICASPasswordData *)self hasHint];
  if (v6)
  {
    uint64_t v7 = [(ICASPasswordData *)self hasHint];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (ICASPasswordType)passwordType
{
  return self->_passwordType;
}

- (NSNumber)hasHint
{
  return self->_hasHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasHint, 0);
  objc_storeStrong((id *)&self->_passwordType, 0);
}

@end