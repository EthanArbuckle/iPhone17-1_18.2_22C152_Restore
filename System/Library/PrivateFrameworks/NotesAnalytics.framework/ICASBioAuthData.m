@interface ICASBioAuthData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASBioAuthData)initWithBioAuthType:(id)a3;
- (ICASBioAuthType)bioAuthType;
- (id)toDict;
@end

@implementation ICASBioAuthData

- (ICASBioAuthData)initWithBioAuthType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASBioAuthData;
  v6 = [(ICASBioAuthData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bioAuthType, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"BioAuthData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"bioAuthType";
  v3 = [(ICASBioAuthData *)self bioAuthType];
  if (v3)
  {
    uint64_t v4 = [(ICASBioAuthData *)self bioAuthType];
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

- (ICASBioAuthType)bioAuthType
{
  return self->_bioAuthType;
}

- (void).cxx_destruct
{
}

@end