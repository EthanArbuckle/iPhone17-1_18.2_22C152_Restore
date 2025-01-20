@interface GEORPFeedbackUserInfo
+ (id)userCredentialsForContactBackEmailAddress:(id)a3 userEnteredEmailAddress:(id)a4 pushToken:(id)a5;
@end

@implementation GEORPFeedbackUserInfo

+ (id)userCredentialsForContactBackEmailAddress:(id)a3 userEnteredEmailAddress:(id)a4 pushToken:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)GEORPFeedbackUserInfo);
  [v8 setUserEmail:v7];

  [v8 setPreferredEmail:v6];
  v9 = +[GEORPUserCredentials _credentialsForPrimaryICloudAccount];
  [v8 setUserCredentials:v9];

  return v8;
}

@end