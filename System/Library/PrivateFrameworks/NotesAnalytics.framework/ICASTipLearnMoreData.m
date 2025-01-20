@interface ICASTipLearnMoreData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASTipLearnMoreData)initWithLearnMoreTipName:(id)a3 tipFeature:(id)a4;
- (NSString)learnMoreTipName;
- (NSString)tipFeature;
- (id)toDict;
@end

@implementation ICASTipLearnMoreData

- (ICASTipLearnMoreData)initWithLearnMoreTipName:(id)a3 tipFeature:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASTipLearnMoreData;
  v9 = [(ICASTipLearnMoreData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_learnMoreTipName, a3);
    objc_storeStrong((id *)&v10->_tipFeature, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"TipLearnMoreData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"learnMoreTipName";
  v3 = [(ICASTipLearnMoreData *)self learnMoreTipName];
  if (v3)
  {
    uint64_t v4 = [(ICASTipLearnMoreData *)self learnMoreTipName];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"tipFeature";
  v12[0] = v4;
  v6 = [(ICASTipLearnMoreData *)self tipFeature];
  if (v6)
  {
    uint64_t v7 = [(ICASTipLearnMoreData *)self tipFeature];
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

- (NSString)learnMoreTipName
{
  return self->_learnMoreTipName;
}

- (NSString)tipFeature
{
  return self->_tipFeature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipFeature, 0);
  objc_storeStrong((id *)&self->_learnMoreTipName, 0);
}

@end