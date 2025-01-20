@interface ICASOnboardingScreenData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASOnboardingScreenData)initWithOnboardingScreenType:(id)a3 onboardingUserAction:(id)a4;
- (ICASOnboardingScreenType)onboardingScreenType;
- (ICASOnboardingUserAction)onboardingUserAction;
- (id)toDict;
@end

@implementation ICASOnboardingScreenData

- (ICASOnboardingScreenData)initWithOnboardingScreenType:(id)a3 onboardingUserAction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASOnboardingScreenData;
  v9 = [(ICASOnboardingScreenData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_onboardingScreenType, a3);
    objc_storeStrong((id *)&v10->_onboardingUserAction, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"OnboardingScreenData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"onboardingScreenType";
  v3 = [(ICASOnboardingScreenData *)self onboardingScreenType];
  if (v3)
  {
    uint64_t v4 = [(ICASOnboardingScreenData *)self onboardingScreenType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"onboardingUserAction";
  v12[0] = v4;
  v6 = [(ICASOnboardingScreenData *)self onboardingUserAction];
  if (v6)
  {
    uint64_t v7 = [(ICASOnboardingScreenData *)self onboardingUserAction];
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

- (ICASOnboardingScreenType)onboardingScreenType
{
  return self->_onboardingScreenType;
}

- (ICASOnboardingUserAction)onboardingUserAction
{
  return self->_onboardingUserAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingUserAction, 0);
  objc_storeStrong((id *)&self->_onboardingScreenType, 0);
}

@end