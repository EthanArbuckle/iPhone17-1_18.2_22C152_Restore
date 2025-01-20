@interface CKRecord
+ (id)createRecordWithName:(id)a3 recordType:(id)a4 recordZone:(id)a5;
- (id)createMediaServiceObjectFromRecord;
- (id)recordFieldForKey:(id)a3;
- (void)_attemptToLoadPublicInfoAgain;
- (void)populateCKRecordInfo:(id)a3 userInfo:(id)a4 recordType:(id)a5;
- (void)setRecordFieldForKey:(id)a3 value:(id)a4;
@end

@implementation CKRecord

+ (id)createRecordWithName:(id)a3 recordType:(id)a4 recordZone:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)CKRecordID) initWithRecordName:v9 zoneID:v7];

  id v11 = [objc_alloc((Class)CKRecord) initWithRecordType:v8 recordID:v10];

  return v11;
}

- (id)recordFieldForKey:(id)a3
{
  id v4 = a3;
  v5 = [(CKRecord *)self encryptedValues];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setRecordFieldForKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKRecord *)self encryptedValues];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (void)populateCKRecordInfo:(id)a3 userInfo:(id)a4 recordType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100031A80();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138478339;
    id v39 = v10;
    __int16 v40 = 2113;
    id v41 = v8;
    __int16 v42 = 2113;
    id v43 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Creating record RecordType: %{private}@ and ServiceInfo: %{private}@ \n and UserInfo %{private}@", (uint8_t *)&v38, 0x20u);
  }

  if ([v10 isEqualToString:MSServiceAccountRecordType])
  {
    uint64_t v12 = MSHomeParticipantHomeIdentifier;
    v13 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeIDKey];
    [(CKRecord *)self setRecordFieldForKey:v12 value:v13];

    uint64_t v14 = MSHomeParticipantHomeUserIdentifier;
    v15 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    [(CKRecord *)self setRecordFieldForKey:v14 value:v15];

    uint64_t v16 = MediaServiceIdentifier;
    v17 = [v8 serviceID];
    v18 = [v17 UUIDString];
    [(CKRecord *)self setRecordFieldForKey:v16 value:v18];

    uint64_t v19 = MediaServiceAccountName;
    v20 = [v8 accountName];
    [(CKRecord *)self setRecordFieldForKey:v19 value:v20];

    uint64_t v21 = MediaServiceConfigurationURL;
    v22 = [v8 configURL];
    v23 = [v22 absoluteString];
    [(CKRecord *)self setRecordFieldForKey:v21 value:v23];

    uint64_t v24 = MediaServiceUpdateListeningHistory;
    v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 updateListeningHistoryEnabled]);
    [(CKRecord *)self setRecordFieldForKey:v24 value:v25];

    uint64_t v26 = MediaServiceAuthFatalError;
    v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 authFatalError]);
    [(CKRecord *)self setRecordFieldForKey:v26 value:v27];

    v28 = [v8 authConfiguration];

    if (v28)
    {
      v29 = [v8 authConfiguration];
      v30 = +[NSKeyedArchiver archivedDataWithRootObject:v29 requiringSecureCoding:1 error:0];

      if (v30) {
        [(CKRecord *)self setRecordFieldForKey:MediaServiceAuthConfiguration value:v30];
      }
    }
    v31 = [v8 authCredential];

    if (v31)
    {
      v32 = [v8 authCredential];
      v33 = +[NSKeyedArchiver archivedDataWithRootObject:v32 requiringSecureCoding:1 error:0];

      if (v33) {
        [(CKRecord *)self setRecordFieldForKey:MediaServiceAuthCredential value:v33];
      }
      goto LABEL_13;
    }
  }
  else if ([v10 isEqualToString:MSDefaultServiceRecordType])
  {
    uint64_t v34 = MSHomeParticipantHomeUserIdentifier;
    v35 = [v9 objectForKey:kCKDatabaseAccessUserInfoHomeUserIDKey];
    [(CKRecord *)self setRecordFieldForKey:v34 value:v35];

    uint64_t v36 = MediaServiceIdentifier;
    v33 = [v8 serviceID];
    v37 = [v33 UUIDString];
    [(CKRecord *)self setRecordFieldForKey:v36 value:v37];

LABEL_13:
  }
}

- (id)createMediaServiceObjectFromRecord
{
  uint64_t v3 = MediaServiceIdentifier;
  id v4 = [(CKRecord *)self recordFieldForKey:MediaServiceIdentifier];
  if (!v4)
  {
    v5 = sub_100031A80();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100024368(v5, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_23;
  }
  v5 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:v4];
  if (!v5)
  {
    [(CKRecord *)self _attemptToLoadPublicInfoAgain];
    v5 = +[MSDPublicDBManager getCachedPublicInfoForServiceID:v4];
    id v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000244BC((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }

    if (!v5)
    {
      v5 = sub_100031A80();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000243E0(v5);
      }
LABEL_23:
      id v16 = 0;
      goto LABEL_24;
    }
  }
  v13 = [(CKRecord *)self recordType];
  unsigned int v14 = [v13 isEqualToString:MSServiceAccountRecordType];

  if (!v14)
  {
    __int16 v42 = [(CKRecord *)self recordType];
    unsigned int v43 = [v42 isEqualToString:MSDefaultServiceRecordType];

    if (v43)
    {
      id v16 = [objc_alloc((Class)MediaService) initWithMediaServiceIdentifier:v4];
      goto LABEL_24;
    }
    v44 = sub_100031A80();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100024424(self, v44);
    }

    goto LABEL_23;
  }
  v15 = [(CKRecord *)self recordFieldForKey:v3];
  id v16 = [objc_alloc((Class)MediaService) initWithMediaServiceIdentifier:v15];
  v17 = [(CKRecord *)self recordFieldForKey:MediaServiceUpdateListeningHistory];
  [v16 setUpdateListeningHistoryEnabled:[v17 BOOLValue]];

  v18 = [(CKRecord *)self recordFieldForKey:MediaServiceAccountName];
  [v16 setAccountName:v18];

  uint64_t v19 = [(CKRecord *)self recordFieldForKey:MediaServiceConfigurationURL];
  v20 = +[NSURL URLWithString:v19];
  [v16 setConfigURL:v20];

  uint64_t v21 = [(CKRecord *)self recordFieldForKey:MediaServiceAuthFatalError];
  [v16 setAuthFatalError:[v21 BOOLValue]];

  v22 = [(CKRecord *)self recordFieldForKey:MediaServiceAuthConfiguration];
  v23 = [(CKRecord *)self recordFieldForKey:MediaServiceAuthCredential];
  if (v22)
  {
    uint64_t v24 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v22 error:0];
    [v16 setAuthConfiguration:v24];

    v25 = [v16 authConfiguration];

    if (!v25)
    {
      uint64_t v26 = +[CMSAuthenticationConfiguration authConfigurationFromMSAuthData:v22];
      [v16 setAuthConfiguration:v26];
    }
  }
  if (v23)
  {
    v27 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v23 error:0];
    [v16 setAuthCredential:v27];

    v28 = [v16 authCredential];

    if (!v28)
    {
      v29 = +[CMSAuthenticationCredential authCredentialFromMSAuthData:v23];
      [v16 setAuthCredential:v29];
    }
  }
  v30 = +[MSDTransactionTask createTransactionWithIdentifier:@"com.apple.mediasetupd.imageCaching"];
  v31 = [MSDArtworkManager alloc];
  v32 = [v5 serviceIconPath];
  v33 = [(MSDArtworkManager *)v31 initWithServiceID:v15 remoteImageURL:v32];

  uint64_t v34 = [(MSDArtworkManager *)v33 getLocalCachedImageURL];
  [v16 setIconImageURL:v34];

  [v30 releaseTransaction];
LABEL_24:

  return v16;
}

- (void)_attemptToLoadPublicInfoAgain
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = +[MSDPublicDBManager shared];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000242FC;
  v14[3] = &unk_10004D4E0;
  id v4 = v2;
  v15 = v4;
  [v3 syncDataWithCloudKit:v14];

  dispatch_time_t v5 = dispatch_time(0, 1000000000 * MSMaxWaitInSecondsForFetchDataFromCloudKit);
  if (dispatch_semaphore_wait(v4, v5))
  {
    id v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100024528(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

@end