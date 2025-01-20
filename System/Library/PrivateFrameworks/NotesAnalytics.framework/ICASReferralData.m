@interface ICASReferralData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASReferralData)initWithReferringApplication:(id)a3 referringInboundUrl:(id)a4;
- (NSString)referringApplication;
- (NSString)referringInboundUrl;
- (id)toDict;
@end

@implementation ICASReferralData

- (ICASReferralData)initWithReferringApplication:(id)a3 referringInboundUrl:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASReferralData;
  v9 = [(ICASReferralData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_referringApplication, a3);
    objc_storeStrong((id *)&v10->_referringInboundUrl, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"ReferralData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"referringApplication";
  v3 = [(ICASReferralData *)self referringApplication];
  if (v3)
  {
    uint64_t v4 = [(ICASReferralData *)self referringApplication];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"referringInboundUrl";
  v12[0] = v4;
  v6 = [(ICASReferralData *)self referringInboundUrl];
  if (v6)
  {
    uint64_t v7 = [(ICASReferralData *)self referringInboundUrl];
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

- (NSString)referringApplication
{
  return self->_referringApplication;
}

- (NSString)referringInboundUrl
{
  return self->_referringInboundUrl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referringInboundUrl, 0);
  objc_storeStrong((id *)&self->_referringApplication, 0);
}

@end