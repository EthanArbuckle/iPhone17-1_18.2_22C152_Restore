@interface CKContainer
+ (id)MSDCloudKitContainer;
+ (id)MSDCloudKitContainerID;
+ (id)MSDPublicCloudKitContainer;
+ (id)MSDPublicCloudKitContainerID;
- (void)acceptShareWithShareMetadata:(id)a3 completion:(id)a4;
- (void)fetchShareMetadataForShareURL:(id)a3 withShareToken:(id)a4 completion:(id)a5;
@end

@implementation CKContainer

+ (id)MSDCloudKitContainer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000246AC;
  block[3] = &unk_10004C8C0;
  block[4] = a1;
  if (qword_1000567C0 != -1) {
    dispatch_once(&qword_1000567C0, block);
  }
  v2 = (void *)qword_1000567B8;

  return v2;
}

+ (id)MSDCloudKitContainerID
{
  return kMediaSetupCloudKitContainerIdentifier;
}

+ (id)MSDPublicCloudKitContainer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024818;
  block[3] = &unk_10004C8C0;
  block[4] = a1;
  if (qword_1000567D0 != -1) {
    dispatch_once(&qword_1000567D0, block);
  }
  v2 = (void *)qword_1000567C8;

  return v2;
}

+ (id)MSDPublicCloudKitContainerID
{
  return kMediaSetupPublicCloudKitContainerIdentifier;
}

- (void)acceptShareWithShareMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315395;
    v23 = "-[CKContainer(MSDCloudDataContainer) acceptShareWithShareMetadata:completion:]";
    __int16 v24 = 2113;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s shareMetaData %{private}@", buf, 0x16u);
  }

  if (v6)
  {
    id v9 = objc_alloc((Class)CKAcceptSharesOperation);
    id v19 = v6;
    v10 = +[NSArray arrayWithObjects:&v19 count:1];
    id v11 = [v9 initWithShareMetadatas:v10];

    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100024AF4;
    v17 = &unk_10004DF08;
    id v18 = v7;
    [v11 setPerShareCompletionBlock:&v14];
    [v11 setQualityOfService:17 v14, v15, v16, v17];
    [(CKContainer *)self addOperation:v11];
    v12 = v18;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v13 = MSErrorDomain;
    uint64_t v20 = MSUserInfoErrorStringKey;
    CFStringRef v21 = @"Failed to accept share for Nil ShareMetaData";
    id v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v12 = +[NSError errorWithDomain:v13 code:1 userInfo:v11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)fetchShareMetadataForShareURL:(id)a3 withShareToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100031A80();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315651;
    v28 = "-[CKContainer(MSDCloudDataContainer) fetchShareMetadataForShareURL:withShareToken:completion:]";
    __int16 v29 = 2113;
    id v30 = v8;
    __int16 v31 = 2113;
    id v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s URL %{private}@ shareToken  %{private}@", buf, 0x20u);
  }

  if (v8)
  {
    id v12 = objc_alloc((Class)CKFetchShareMetadataOperation);
    if (v9)
    {
      id v24 = v8;
      uint64_t v13 = +[NSArray arrayWithObjects:&v24 count:1];
      id v22 = v8;
      id v23 = v9;
      v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v15 = [v12 initWithShareURLs:v13 invitationTokensByShareURL:v14];
    }
    else
    {
      id v21 = v8;
      uint64_t v13 = +[NSArray arrayWithObjects:&v21 count:1];
      id v15 = [v12 initWithShareURLs:v13];
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100024E88;
    v19[3] = &unk_10004DF30;
    id v20 = v10;
    [v15 setPerShareMetadataBlock:v19];
    [v15 setFetchShareMetadataCompletionBlock:&stru_10004DF50];
    [v15 setQualityOfService:17];
    [(CKContainer *)self addOperation:v15];
    id v18 = v20;
    goto LABEL_12;
  }
  v16 = sub_100031A80();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100025054(v16);
  }

  if (v10)
  {
    uint64_t v17 = MSErrorDomain;
    uint64_t v25 = MSUserInfoErrorStringKey;
    CFStringRef v26 = @"Failed to fetchShareMetadata for Nil Share URL";
    id v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v18 = +[NSError errorWithDomain:v17 code:1 userInfo:v15];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
LABEL_12:
  }
}

@end