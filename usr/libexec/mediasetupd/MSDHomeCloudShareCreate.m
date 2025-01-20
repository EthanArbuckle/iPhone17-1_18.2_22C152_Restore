@interface MSDHomeCloudShareCreate
+ (id)cloudShareForHome:(id)a3;
+ (void)acceptInvitation:(id)a3 completion:(id)a4;
- (HMHome)home;
- (MSDHomeCloudShareCreate)initWithHome:(id)a3;
- (void)_handleMultiplePeopleOnShare:(id)a3 completion:(id)a4;
- (void)_saveRecordAndShare:(id)a3 completion:(id)a4;
- (void)setupShareForHomeParticipant:(id)a3 completion:(id)a4;
- (void)shareRecordWithOwner:(id)a3 completion:(id)a4;
@end

@implementation MSDHomeCloudShareCreate

+ (id)cloudShareForHome:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithHome:v4];

  return v5;
}

- (MSDHomeCloudShareCreate)initWithHome:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSDHomeCloudShareCreate;
  v6 = [(MSDHomeCloudShareCreate *)&v10 self];

  if (!v6) {
    goto LABEL_4;
  }
  if (v5)
  {
    objc_storeStrong(v6 + 1, a3);
LABEL_4:
    v7 = v6;
    goto LABEL_8;
  }
  v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10001198C();
  }

  v7 = 0;
LABEL_8:

  return v7;
}

+ (void)acceptInvitation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_100031A80();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v5 shareToken];
    v9 = [v5 shareURL];
    objc_super v10 = [v5 user];
    v11 = [v5 fromUser];
    *(_DWORD *)buf = 138478595;
    v22 = v8;
    __int16 v23 = 2113;
    v24 = v9;
    __int16 v25 = 2113;
    v26 = v10;
    __int16 v27 = 2113;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Invitation details shareToken %{private}@, shareURL %{private}@, ToUSer %{private}@, fromUSer %{private}@", buf, 0x2Au);
  }
  v12 = [v5 containerID];
  v13 = +[CKContainer containerWithIdentifier:v12];

  v14 = [v5 shareURL];
  v15 = [v5 shareToken];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000108A4;
  v18[3] = &unk_10004D360;
  id v19 = v13;
  id v20 = v6;
  id v16 = v6;
  id v17 = v13;
  [v17 fetchShareMetadataForShareURL:v14 withShareToken:v15 completion:v18];
}

- (void)setupShareForHomeParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100031A80();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 recordID];
    home = self->_home;
    *(_DWORD *)buf = 136315651;
    v38 = "-[MSDHomeCloudShareCreate setupShareForHomeParticipant:completion:]";
    __int16 v39 = 2113;
    v40 = v9;
    __int16 v41 = 2113;
    v42 = home;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s for recordID %{private}@ and home %{private}@", buf, 0x20u);
  }
  if (v7)
  {
    v11 = [v6 recordType];
    if ([v11 isEqualToString:MSServiceAccountRecordType])
    {

LABEL_9:
      id v22 = objc_alloc((Class)CKShare);
      __int16 v23 = [v6 recordID];
      v24 = [v23 zoneID];
      id v25 = [v22 initWithRecordZoneID:v24];

      v26 = sub_100031A80();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v27 = [v25 recordID];
        *(_DWORD *)buf = 138477827;
        v38 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Created CKShare with recordID %{private}@", buf, 0xCu);
      }
      v28 = +[CKContainer MSDCloudKitContainer];
      v12 = [v28 privateCloudDatabase];

      v29 = objc_alloc_init(MSDFetchCKDataOptions);
      [(MSDFetchCKDataOptions *)v29 setUserInitiatedRequest:0];
      v30 = [v25 recordID];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100010E74;
      v33[3] = &unk_10004D388;
      id v34 = v25;
      v35 = self;
      id v36 = v7;
      id v31 = v25;
      [v12 fetchRecordWithID:v30 withOptions:v29 completion:v33];

      goto LABEL_15;
    }
    id v20 = [v6 recordType];
    unsigned __int8 v21 = [v20 isEqualToString:MSDefaultServiceRecordType];

    if (v21) {
      goto LABEL_9;
    }
    v32 = sub_100031A80();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100011B08();
    }

    v12 = +[NSError errorWithDomain:MSErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v12);
  }
  else
  {
    v12 = sub_100031A80();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100011A90(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
LABEL_15:
}

- (void)shareRecordWithOwner:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = sub_100031A80();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        home = self->_home;
        *(_DWORD *)buf = 136315651;
        v24 = "-[MSDHomeCloudShareCreate shareRecordWithOwner:completion:]";
        __int16 v25 = 2113;
        id v26 = v6;
        __int16 v27 = 2113;
        v28 = home;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s for record %{private}@ home %{private}@", buf, 0x20u);
      }

      v11 = self->_home;
      v12 = +[CKContainer MSDCloudKitContainer];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000112EC;
      v21[3] = &unk_10004D3B0;
      id v22 = v7;
      [(HMHome *)v11 establishShareWithHomeOwner:v6 container:v12 allowWriteAccess:1 completionHandler:v21];

      uint64_t v13 = v22;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100011CCC();
      }

      uint64_t v13 = +[NSError errorWithDomain:CKErrorDomain code:12 userInfo:0];
      (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v13);
    }
  }
  else
  {
    uint64_t v13 = sub_100031A80();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100011C54(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)_handleMultiplePeopleOnShare:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 participants];
    v9 = [v8 na_firstObjectPassingTest:&stru_10004D3F0];

    if (v9)
    {
      id v10 = [v9 permission];
      id v11 = [v9 acceptanceStatus];
      v12 = sub_100031A80();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = CKStringFromParticipantAcceptanceStatus();
        uint64_t v14 = CKStringFromParticipantPermission();
        int v18 = 138412546;
        uint64_t v19 = v13;
        __int16 v20 = 2112;
        unsigned __int8 v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Current Participant status: Acceptance: %@ Permission: %@", (uint8_t *)&v18, 0x16u);
      }
      if (v11 == (id)2 && v10 == (id)3)
      {
        uint64_t v15 = sub_100031A80();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "All Participants in share have accepted with permission read/write", (uint8_t *)&v18, 2u);
        }

        if (v7) {
          (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
        }
        goto LABEL_21;
      }
      if (v10 == (id)2)
      {
        [v9 setPermission:3];
        [v6 addParticipant:v9];
        [(MSDHomeCloudShareCreate *)self _saveRecordAndShare:v6 completion:v7];
        goto LABEL_21;
      }
      if (v10 != (id)3 || v11 == (id)2) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v17 = sub_100031A80();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100011D9C();
      }
    }
    [(MSDHomeCloudShareCreate *)self shareRecordWithOwner:v6 completion:v7];
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v16 = sub_100031A80();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100011D68();
  }

  if (v7)
  {
    v9 = +[NSError errorWithDomain:MSErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    goto LABEL_21;
  }
LABEL_22:
}

- (void)_saveRecordAndShare:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[CKContainer MSDCloudKitContainer];
  v9 = [v8 privateCloudDatabase];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000117C0;
  v11[3] = &unk_10004D100;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 saveRecord:v7 withOptions:0 completion:v11];
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end