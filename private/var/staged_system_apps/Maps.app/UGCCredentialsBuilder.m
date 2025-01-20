@interface UGCCredentialsBuilder
+ (BOOL)isUserLoggedInForICloud;
+ (id)buildICloudUserCredentialsWithError:(id *)a3;
+ (void)fetchCommunityIDWithMUID:(unint64_t)a3 identifierHistory:(id)a4 CompletionHandler:(id)a5;
+ (void)fetchCommunityIDWithMUID:(unint64_t)a3 identifierHistory:(id)a4 shouldIncreaseCount:(BOOL)a5 CompletionHandler:(id)a6;
@end

@implementation UGCCredentialsBuilder

+ (BOOL)isUserLoggedInForICloud
{
  uint64_t v5 = 0;
  v2 = +[UGCCredentialsBuilder buildICloudUserCredentialsWithError:&v5];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)buildICloudUserCredentialsWithError:(id *)a3
{
  id v4 = objc_alloc_init((Class)GEORPFeedbackUserInfo);
  uint64_t v5 = +[GEORPUserCredentials _credentialsForPrimaryICloudAccount];
  [v4 setUserCredentials:v5];

  v6 = sub_100109EF8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v4 userCredentials];
    v8 = [v7 icloudUserPersonId];
    v9 = [v4 userCredentials];
    v10 = [v9 icloudUserMapsAuthToken];
    int v20 = 138412546;
    v21 = v8;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "UGCCredentialsBuilder icloud person id %@ and auth token %@", (uint8_t *)&v20, 0x16u);
  }
  v11 = [v4 userCredentials];
  v12 = [v11 icloudUserPersonId];
  id v13 = [v12 length];

  if (v13)
  {
    v14 = [v4 userCredentials];
    v15 = [v14 icloudUserMapsAuthToken];
    id v16 = [v15 length];

    if (v16)
    {
      id v17 = v4;
      goto LABEL_12;
    }
    if (a3)
    {
      CFStringRef v18 = @"NoAuthToken";
      goto LABEL_10;
    }
  }
  else if (a3)
  {
    CFStringRef v18 = @"NoDSID";
LABEL_10:
    +[NSError errorWithDomain:v18 code:-1 userInfo:0];
    id v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  id v17 = 0;
LABEL_12:

  return v17;
}

+ (void)fetchCommunityIDWithMUID:(unint64_t)a3 identifierHistory:(id)a4 CompletionHandler:(id)a5
{
}

+ (void)fetchCommunityIDWithMUID:(unint64_t)a3 identifierHistory:(id)a4 shouldIncreaseCount:(BOOL)a5 CompletionHandler:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)GEORPFeedbackUserInfo);
  id v12 = objc_alloc_init((Class)GEORPTdmInfo);
  [v11 setTdmUserInfo:v12];

  id v13 = +[FeedbackCommunityIDManager shared];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1007A6F18;
  v16[3] = &unk_1012F88D0;
  id v17 = v11;
  id v18 = v9;
  id v14 = v11;
  id v15 = v9;
  [v13 fetchAuthenticationInfoForReviewedPlaceWithMuid:a3 identifierHistory:v10 shouldIncreaseCount:v6 completion:v16];
}

@end