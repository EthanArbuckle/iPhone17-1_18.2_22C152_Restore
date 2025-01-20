@interface SSRVoiceProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSATMarkedWithMarker:(id)a3;
- (BOOL)_markSATEnrollmentWithMarker:(id)a3;
- (BOOL)deleteModelForSpidType:(unint64_t)a3 recognizerType:(unint64_t)a4;
- (BOOL)isMarkedSATEnrolled;
- (BOOL)isMarkedSATMigrated;
- (BOOL)isValidForRPIWithError:(id *)a3;
- (BOOL)markSATEnrollmentMigrated;
- (BOOL)markSATEnrollmentSuccess;
- (BOOL)profileLocallyAvailable;
- (BOOL)updatePruningCookie:(id)a3;
- (NSDate)dateAdded;
- (NSMutableArray)donationIds;
- (NSNumber)profilePitch;
- (NSString)appDomain;
- (NSString)enrollmentId;
- (NSString)locale;
- (NSString)profileBasePath;
- (NSString)profileBasePathExclave;
- (NSString)profileID;
- (NSString)pruningCookie;
- (NSString)siriProfileId;
- (NSString)userName;
- (NSString)voiceProfileBasePath;
- (NSString)voiceProfileIdentity;
- (NSString)voiceProfileImplicitCacheDirPath;
- (SSRVoiceProfile)initWithCoder:(id)a3;
- (SSRVoiceProfile)initWithDictionary:(id)a3;
- (id)_getProfileVersionFilePath;
- (id)_voiceProfilePathForSpidType:(unint64_t)a3;
- (id)addUtterances:(id)a3 spIdType:(unint64_t)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exclaveVoiceProfileModelFilePathForRecognizerType:(unint64_t)a3 spIdType:(unint64_t)a4;
- (id)getDonationIds;
- (id)getEnrollmentUtterancesForModelType:(unint64_t)a3;
- (id)getExplicitEnrollmentUtterancesForType:(unint64_t)a3;
- (id)getExplicitMarkedEnrollmentUtterancesForType:(unint64_t)a3;
- (id)getImplicitEnrollmentUtterancesForType:(unint64_t)a3;
- (id)getImplicitEnrollmentUtterancesPriorTo:(id)a3 forType:(unint64_t)a4;
- (id)importVoiceProfileAtPath:(id)a3;
- (id)initNewVoiceProfileWithLocale:(id)a3 withAppDomain:(id)a4;
- (id)voiceProfileAudioDirPathForSpidType:(unint64_t)a3;
- (id)voiceProfileModelDirForSpidType:(unint64_t)a3 recognizerType:(unint64_t)a4;
- (id)voiceProfileModelFilePathForRecognizerType:(unint64_t)a3 spIdType:(unint64_t)a4;
- (id)voiceProfilePathExclave;
- (unint64_t)_copyExplicitAudio:(id)a3 withSpIdType:(unint64_t)a4;
- (unint64_t)copyTDAudioToTDTI;
- (unint64_t)getTDAudioCount;
- (unint64_t)productCategory;
- (unint64_t)voiceProfileVersion;
- (void)_updateVoiceProfileVersionFile;
- (void)addDonationId:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDonationIds:(id)a3;
- (void)setProfileBasePath:(id)a3;
- (void)setProfileBasePathExclave:(id)a3;
- (void)setProfilePitch:(id)a3;
- (void)setSharedSiriProfileId:(id)a3;
- (void)setUserName:(id)a3;
- (void)updateVoiceProfilePathExclave:(id)a3;
@end

@implementation SSRVoiceProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_profilePitch, 0);
  objc_storeStrong((id *)&self->_donationIds, 0);
  objc_storeStrong((id *)&self->_profileBasePathExclave, 0);
  objc_storeStrong((id *)&self->_profileBasePath, 0);
  objc_storeStrong((id *)&self->_enrollmentId, 0);
  objc_storeStrong((id *)&self->_siriProfileId, 0);
  objc_storeStrong((id *)&self->_profileID, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_appDomain, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)setUserName:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setProfilePitch:(id)a3
{
}

- (NSNumber)profilePitch
{
  return self->_profilePitch;
}

- (void)setDonationIds:(id)a3
{
}

- (NSMutableArray)donationIds
{
  return self->_donationIds;
}

- (void)setProfileBasePathExclave:(id)a3
{
}

- (NSString)profileBasePathExclave
{
  return self->_profileBasePathExclave;
}

- (void)setProfileBasePath:(id)a3
{
}

- (NSString)profileBasePath
{
  return self->_profileBasePath;
}

- (NSString)enrollmentId
{
  return self->_enrollmentId;
}

- (NSString)siriProfileId
{
  return self->_siriProfileId;
}

- (NSString)profileID
{
  return self->_profileID;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (NSString)appDomain
{
  return self->_appDomain;
}

- (NSString)locale
{
  return self->_locale;
}

- (id)voiceProfilePathExclave
{
  return self->_profileBasePathExclave;
}

- (void)updateVoiceProfilePathExclave:(id)a3
{
}

- (BOOL)updatePruningCookie:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = [(SSRVoiceProfile *)self _getProfileVersionFilePath];
  v7 = +[SSRUtils readJsonFileAtPath:v6];
  v8 = v7;
  char v26 = 0;
  if (v7)
  {
    v9 = (void *)[v7 mutableCopy];
    [v9 setObject:v4 forKeyedSubscript:@"VoiceProfilePruningCookie"];
    v10 = (void *)MEMORY[0x263F08900];
    v11 = (void *)[v9 copy];
    id v25 = 0;
    v12 = [v10 dataWithJSONObject:v11 options:1 error:&v25];
    id v13 = v25;

    if (v12) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    if (!v14)
    {
      v15 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v28 = "-[SSRVoiceProfile updatePruningCookie:]";
        __int16 v29 = 2112;
        v30 = v8;
        __int16 v31 = 2112;
        id v32 = v13;
        v16 = "%s ERR: error updating updatedVoiceProfileJsonData from: %@, err: %@";
LABEL_21:
        _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    if ([v5 fileExistsAtPath:v6 isDirectory:&v26])
    {
      id v24 = 0;
      char v19 = [v5 removeItemAtPath:v6 error:&v24];
      id v13 = v24;
      if ((v19 & 1) == 0)
      {
        v15 = *MEMORY[0x263F38100];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v28 = "-[SSRVoiceProfile updatePruningCookie:]";
          __int16 v29 = 2112;
          v30 = v6;
          __int16 v31 = 2112;
          id v32 = v13;
          v16 = "%s ERR: error removing voice profile version file at: %@, err: %@";
          goto LABEL_21;
        }
LABEL_22:
        BOOL v18 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      id v13 = 0;
    }
    v20 = v13;
    id v23 = v13;
    int v21 = [v12 writeToFile:v6 options:0 error:&v23];
    id v13 = v23;

    if (v21 && !v13)
    {
      BOOL v18 = 1;
LABEL_23:

      goto LABEL_24;
    }
    v15 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[SSRVoiceProfile updatePruningCookie:]";
      __int16 v29 = 2112;
      v30 = v6;
      __int16 v31 = 2112;
      id v32 = v13;
      v16 = "%s ERR: Error writing voice profile version file at: %@, err:%@";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v17 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[SSRVoiceProfile updatePruningCookie:]";
    _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s ERR: Profile dict is nil - Bailing out", buf, 0xCu);
  }
  id v13 = 0;
  v9 = 0;
  BOOL v18 = 0;
LABEL_24:

  return v18;
}

- (NSString)pruningCookie
{
  v2 = [(SSRVoiceProfile *)self _getProfileVersionFilePath];
  v3 = +[SSRUtils readJsonFileAtPath:v2];

  id v4 = [v3 objectForKeyedSubscript:@"VoiceProfilePruningCookie"];

  if (v4)
  {
    id v4 = [v3 objectForKeyedSubscript:@"VoiceProfilePruningCookie"];
  }

  return (NSString *)v4;
}

- (void)_updateVoiceProfileVersionFile
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v2 = [(SSRVoiceProfile *)self _getProfileVersionFilePath];
  v3 = [MEMORY[0x263F08850] defaultManager];
  char v37 = 0;
  id v4 = [MEMORY[0x263F380D0] deviceProductType];
  if (!v4
    || (unint64_t v5 = +[SSRUtils deviceCategoryForDeviceProductType:v4]) == 0)
  {
    v6 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
      __int16 v42 = 2114;
      v43 = v4;
      _os_log_error_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_ERROR, "%s ERR: Unknown device-category for device: %{public}@", buf, 0x16u);
    }
    unint64_t v5 = 0;
  }
  if ([v3 fileExistsAtPath:v2 isDirectory:&v37]) {
    BOOL v7 = v37 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    v38[0] = @"VoiceProfileCompatabiltyVersion";
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 1);
    v39[0] = v8;
    v38[1] = @"VoiceProfileProductType";
    v9 = [MEMORY[0x263F380D0] deviceProductType];
    v39[1] = v9;
    v38[2] = @"VoiceProfileSWVersion";
    v10 = [MEMORY[0x263F380D0] deviceBuildVersion];
    v39[2] = v10;
    v38[3] = @"VoiceProfileCategoryType";
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v5);
    v39[3] = v11;
    v38[4] = @"VoiceProfileIdentifier";
    v12 = [MEMORY[0x263F08C38] UUID];
    id v13 = [v12 UUIDString];
    v39[4] = v13;
    BOOL v14 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];

LABEL_15:
    id v35 = 0;
    id v23 = [MEMORY[0x263F08900] dataWithJSONObject:v14 options:1 error:&v35];
    id v24 = v35;
    id v25 = v24;
    if (!v23 || v24)
    {
      __int16 v29 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
        __int16 v42 = 2112;
        v43 = v14;
        __int16 v44 = 2112;
        id v45 = v25;
        v30 = "%s ERR: error creating updatedVoiceProfileJsonData from: %@, err: %@";
        goto LABEL_36;
      }
    }
    else if (![v3 fileExistsAtPath:v2 isDirectory:&v37] {
           || v37
    }
           || (id v34 = 0,
               char v26 = [v3 removeItemAtPath:v2 error:&v34],
               id v25 = v34,
               (v26 & 1) != 0))
    {
      v27 = v25;
      id v33 = v25;
      int v28 = [v23 writeToFile:v2 options:0 error:&v33];
      id v25 = v33;

      if (v28 && !v25) {
        goto LABEL_26;
      }
      __int16 v29 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
        __int16 v42 = 2112;
        v43 = v2;
        __int16 v44 = 2112;
        id v45 = v25;
        v30 = "%s ERR: Error writing voice profile version file at: %@, err:%@";
LABEL_36:
        _os_log_error_impl(&dword_21C8A5000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);
      }
    }
    else
    {
      __int16 v29 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
        __int16 v42 = 2112;
        v43 = v2;
        __int16 v44 = 2112;
        id v45 = v25;
        v30 = "%s ERR: error removing voice profile version file at: %@, err: %@";
        goto LABEL_36;
      }
    }

LABEL_26:
    goto LABEL_32;
  }
  uint64_t v15 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v2];
  if (v15)
  {
    v16 = (void *)v15;
    id v36 = 0;
    v9 = [MEMORY[0x263F08900] JSONObjectWithData:v15 options:0 error:&v36];
    id v17 = v36;
    BOOL v18 = v17;
    if (v9 && !v17)
    {

      v8 = (void *)[v9 mutableCopy];
      char v19 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 1);
      [v8 setValue:v19 forKey:@"VoiceProfileCompatabiltyVersion"];

      v20 = [MEMORY[0x263F380D0] deviceProductType];
      [v8 setValue:v20 forKey:@"VoiceProfileProductType"];

      int v21 = [MEMORY[0x263F380D0] deviceBuildVersion];
      [v8 setValue:v21 forKey:@"VoiceProfileSWVersion"];

      v22 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v5);
      [v8 setValue:v22 forKey:@"VoiceProfileCategoryType"];

      BOOL v14 = (void *)[v8 copy];
      goto LABEL_15;
    }
    id v32 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
      __int16 v42 = 2112;
      v43 = v2;
      __int16 v44 = 2112;
      id v45 = v18;
      _os_log_error_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_ERROR, "%s Could not read existing %@ file: err: %@", buf, 0x20u);
    }
  }
  else
  {
    __int16 v31 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
      __int16 v42 = 2112;
      v43 = v2;
      _os_log_error_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_ERROR, "%s Unable to read data from file: %@", buf, 0x16u);
    }
  }
LABEL_32:
}

- (id)_getProfileVersionFilePath
{
  return [(NSString *)self->_profileBasePath stringByAppendingPathComponent:@"enrollment_version.json"];
}

- (BOOL)_markSATEnrollmentWithMarker:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = self->_profileBasePath;
    v6 = [MEMORY[0x263F08850] defaultManager];
    if ([v6 fileExistsAtPath:v5 isDirectory:0])
    {
      BOOL v7 = [(NSString *)v5 stringByAppendingPathComponent:v4];
      char v8 = [v6 createFileAtPath:v7 contents:0 attributes:0];
      v9 = *MEMORY[0x263F38100];
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315650;
          BOOL v14 = "-[SSRVoiceProfile _markSATEnrollmentWithMarker:]";
          __int16 v15 = 2114;
          id v16 = v4;
          __int16 v17 = 2114;
          BOOL v18 = v7;
          _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Marked SAT enrollment %{public}@ at path %{public}@", (uint8_t *)&v13, 0x20u);
        }

        BOOL v10 = 1;
        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315650;
        BOOL v14 = "-[SSRVoiceProfile _markSATEnrollmentWithMarker:]";
        __int16 v15 = 2114;
        id v16 = v4;
        __int16 v17 = 2114;
        BOOL v18 = v7;
        _os_log_error_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_ERROR, "%s Coudn't mark SAT enrollment %{public}@ at path %{public}@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      v11 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        BOOL v14 = "-[SSRVoiceProfile _markSATEnrollmentWithMarker:]";
        __int16 v15 = 2114;
        id v16 = v4;
        _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s We can't mark SAT %{public}@ when there is no audio directory", (uint8_t *)&v13, 0x16u);
      }
    }
    BOOL v10 = 0;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (unint64_t)getTDAudioCount
{
  v2 = [(SSRVoiceProfile *)self getEnrollmentUtterancesForModelType:1];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)_isSATMarkedWithMarker:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  unint64_t v5 = self->_profileBasePath;
  v6 = [MEMORY[0x263F08850] defaultManager];
  if ([v6 fileExistsAtPath:v5 isDirectory:0])
  {
    BOOL v7 = [(NSString *)v5 stringByAppendingPathComponent:v4];
    if ([v6 fileExistsAtPath:v7 isDirectory:0])
    {
      if ((CSIsIOS() & 1) != 0 || CSIsCommunalDevice())
      {
        int v8 = 1;
        uint64_t v9 = 3;
      }
      else
      {
        int v8 = 0;
        uint64_t v9 = 1;
      }
      v12 = [(SSRVoiceProfile *)self voiceProfileAudioDirPathForSpidType:v9];
      int v13 = [v6 contentsOfDirectoryAtPath:v12 error:0];
      BOOL v14 = [(SSRVoiceProfile *)self getEnrollmentUtterancesForModelType:v9];
      unint64_t v15 = [v14 count];
      unint64_t v16 = v15;
      if (v8 && v15 <= 4 && CSIsIOS())
      {
        if ([(SSRVoiceProfile *)self getTDAudioCount])
        {
          __int16 v17 = [MEMORY[0x263F087C8] defaultCenter];
          [v17 postNotificationName:@"com.apple.speakerrecognition.migrateTDprofile" object:0];

          BOOL v18 = *MEMORY[0x263F38100];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            int v21 = 136315138;
            v22 = "-[SSRVoiceProfile _isSATMarkedWithMarker:]";
            _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Notification sent to trigger TD voice profile migration", (uint8_t *)&v21, 0xCu);
          }
          goto LABEL_16;
        }
      }
      else if (v16)
      {
LABEL_16:

        BOOL v11 = 1;
        goto LABEL_22;
      }
      uint64_t v19 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315906;
        v22 = "-[SSRVoiceProfile _isSATMarkedWithMarker:]";
        __int16 v23 = 2114;
        id v24 = v4;
        __int16 v25 = 1026;
        int v26 = 0;
        __int16 v27 = 2114;
        int v28 = v13;
        _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s ERR: Removing %{public}@ as explicit utterances %{public}d from audio dir - %{public}@", (uint8_t *)&v21, 0x26u);
      }
      [v6 removeItemAtPath:v7 error:0];
    }
LABEL_21:
    BOOL v11 = 0;
    goto LABEL_22;
  }
  BOOL v10 = *MEMORY[0x263F38100];
  BOOL v11 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    v22 = "-[SSRVoiceProfile _isSATMarkedWithMarker:]";
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s SAT path doesnt exist - %@", (uint8_t *)&v21, 0x16u);
    goto LABEL_21;
  }
LABEL_22:

  return v11;
}

- (BOOL)isMarkedSATEnrolled
{
  return [(SSRVoiceProfile *)self _isSATMarkedWithMarker:@"enrollment_completed"];
}

- (BOOL)isMarkedSATMigrated
{
  return [(SSRVoiceProfile *)self _isSATMarkedWithMarker:@"enrollment_migrated"];
}

- (BOOL)markSATEnrollmentMigrated
{
  return [(SSRVoiceProfile *)self _markSATEnrollmentWithMarker:@"enrollment_migrated"];
}

- (BOOL)markSATEnrollmentSuccess
{
  [(SSRVoiceProfile *)self _updateVoiceProfileVersionFile];

  return [(SSRVoiceProfile *)self _markSATEnrollmentWithMarker:@"enrollment_completed"];
}

- (unint64_t)productCategory
{
  v2 = [(SSRVoiceProfile *)self _getProfileVersionFilePath];
  unint64_t v3 = +[SSRUtils getVoiceProfileProductCategoryFromVersionFilePath:v2];

  return v3;
}

- (NSString)voiceProfileIdentity
{
  v2 = [(SSRVoiceProfile *)self _getProfileVersionFilePath];
  unint64_t v3 = +[SSRUtils getVoiceProfileIdentityFromVersionFilePath:v2];

  return (NSString *)v3;
}

- (unint64_t)voiceProfileVersion
{
  v2 = [(SSRVoiceProfile *)self _getProfileVersionFilePath];
  unint64_t v3 = +[SSRUtils readJsonFileAtPath:v2];

  unint64_t v4 = [v3 objectForKeyedSubscript:@"VoiceProfileCompatabiltyVersion"];

  if (v4)
  {
    unint64_t v5 = [v3 objectForKeyedSubscript:@"VoiceProfileCompatabiltyVersion"];
    unint64_t v4 = (int)[v5 intValue];
  }
  return v4;
}

- (BOOL)deleteModelForSpidType:(unint64_t)a3 recognizerType:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  unint64_t v4 = [(SSRVoiceProfile *)self voiceProfileModelDirForSpidType:a3 recognizerType:a4];
  unint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4 isDirectory:0];

  if (v6)
  {
    BOOL v7 = [MEMORY[0x263F08850] defaultManager];
    id v32 = 0;
    int v8 = [v7 contentsOfDirectoryAtPath:v4 error:&v32];
    id v9 = v32;

    if (v9 || !v8)
    {
      v22 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        id v24 = v22;
        __int16 v25 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315650;
        id v34 = "-[SSRVoiceProfile deleteModelForSpidType:recognizerType:]";
        __int16 v35 = 2114;
        id v36 = v4;
        __int16 v37 = 2114;
        v38 = v25;
        _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s Couldn't delete invalidated speaker model at path %{public}@ %{public}@", buf, 0x20u);
      }
    }
    else
    {
      int v26 = v8;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v39 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v29;
        BOOL v14 = (os_log_t *)MEMORY[0x263F38100];
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v10);
            }
            if (*(void *)(*((void *)&v28 + 1) + 8 * v15))
            {
              unint64_t v16 = objc_msgSend(v4, "stringByAppendingPathComponent:");
              __int16 v17 = [MEMORY[0x263F08850] defaultManager];
              id v27 = 0;
              [v17 removeItemAtPath:v16 error:&v27];
              id v18 = v27;

              if (v18)
              {
                os_log_t v19 = *v14;
                if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
                {
                  v20 = v19;
                  int v21 = [v18 localizedDescription];
                  *(_DWORD *)buf = 136315650;
                  id v34 = "-[SSRVoiceProfile deleteModelForSpidType:recognizerType:]";
                  __int16 v35 = 2114;
                  id v36 = v16;
                  __int16 v37 = 2114;
                  v38 = v21;
                  _os_log_error_impl(&dword_21C8A5000, v20, OS_LOG_TYPE_ERROR, "%s Couldn't delete invalidated speaker model at path %{public}@ %{public}@", buf, 0x20u);

                  BOOL v14 = (os_log_t *)MEMORY[0x263F38100];
                }
              }
            }
            ++v15;
          }
          while (v12 != v15);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v39 count:16];
        }
        while (v12);
      }

      id v9 = 0;
      int v8 = v26;
    }
  }
  return 1;
}

- (id)_voiceProfilePathForSpidType:(unint64_t)a3
{
  if ([MEMORY[0x263F380D0] isDarwinOS])
  {
    unint64_t v5 = self->_profileBasePath;
  }
  else
  {
    int v6 = +[SSRUtils stringForCSSpIdType:a3];
    unint64_t v5 = [(NSString *)self->_profileBasePath stringByAppendingPathComponent:v6];
  }

  return v5;
}

- (id)voiceProfileModelDirForSpidType:(unint64_t)a3 recognizerType:(unint64_t)a4
{
  unint64_t v5 = [(SSRVoiceProfile *)self _voiceProfilePathForSpidType:a3];
  int v6 = v5;
  if (a4 == 1)
  {
    BOOL v7 = @"td-sr-model";
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    BOOL v7 = @"model";
LABEL_5:
    int v8 = [v5 stringByAppendingPathComponent:v7];
    goto LABEL_7;
  }
  int v8 = 0;
LABEL_7:

  return v8;
}

- (id)voiceProfileAudioDirPathForSpidType:(unint64_t)a3
{
  unint64_t v3 = 3;
  if (a3 != 4) {
    unint64_t v3 = a3;
  }
  if (a3 == 5) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  unint64_t v5 = [(SSRVoiceProfile *)self _voiceProfilePathForSpidType:v4];
  int v6 = [v5 stringByAppendingPathComponent:@"audio"];

  return v6;
}

- (NSString)voiceProfileImplicitCacheDirPath
{
  return [(NSString *)self->_profileBasePath stringByAppendingPathComponent:@"audiocache"];
}

- (NSString)voiceProfileBasePath
{
  return self->_profileBasePath;
}

- (BOOL)profileLocallyAvailable
{
  unint64_t v3 = [(SSRVoiceProfile *)self getEnrollmentUtterancesForModelType:3];
  uint64_t v4 = [v3 count];

  if ((CSIsCommunalDevice() & 1) == 0)
  {
    unint64_t v5 = [(SSRVoiceProfile *)self getEnrollmentUtterancesForModelType:1];
    v4 += [v5 count];
  }
  return v4 != 0;
}

- (id)getImplicitEnrollmentUtterancesForType:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    unint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = -[SSRVoiceProfile voiceProfileAudioDirPathForSpidType:](self, "voiceProfileAudioDirPathForSpidType:");
    unint64_t v5 = [NSURL URLWithString:v4];
    unint64_t v3 = +[SSRUtils getImplicitEnrollmentUtterancesFromDirectory:v5];
  }

  return v3;
}

- (id)getImplicitEnrollmentUtterancesPriorTo:(id)a3 forType:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = [(SSRVoiceProfile *)self voiceProfileAudioDirPathForSpidType:a4];
    int v8 = [NSURL URLWithString:v7];
    id v9 = +[SSRUtils getImplicitEnrollmentUtterancesFromDirectory:v8];

    id v10 = (void *)MEMORY[0x263F08A98];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __66__SSRVoiceProfile_getImplicitEnrollmentUtterancesPriorTo_forType___block_invoke;
    v15[3] = &unk_264429598;
    id v16 = v6;
    uint64_t v11 = [v10 predicateWithBlock:v15];
    uint64_t v12 = [v9 filteredArrayUsingPredicate:v11];
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[SSRVoiceProfile getImplicitEnrollmentUtterancesPriorTo:forType:]";
      _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, "%s ERR: date is nil - Bailing out", buf, 0xCu);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __66__SSRVoiceProfile_getImplicitEnrollmentUtterancesPriorTo_forType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 pathExtension];
  int v5 = [v4 isEqualToString:@"wav"];

  if (!v5) {
    goto LABEL_9;
  }
  id v6 = [v3 URLByDeletingPathExtension];
  BOOL v7 = [v6 URLByAppendingPathExtension:@"json"];

  int v8 = +[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:v7];
  if (!+[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:](SSRVoiceProfileMetadataManager, "isUtteranceImplicitlyTrained:", v7)|| !v8|| ([v8 timeIntervalSinceDate:*(void *)(a1 + 32)], v9 >= 0.0))
  {

LABEL_9:
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  id v10 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    BOOL v14 = "-[SSRVoiceProfile getImplicitEnrollmentUtterancesPriorTo:forType:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Filtered %@ with enrolled date %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v11 = 1;
LABEL_10:

  return v11;
}

- (id)getEnrollmentUtterancesForModelType:(unint64_t)a3
{
  if (a3 == 4)
  {
    uint64_t v3 = 3;
    goto LABEL_5;
  }
  if (a3 == 5)
  {
    uint64_t v3 = 1;
LABEL_5:
    uint64_t v4 = [(SSRVoiceProfile *)self voiceProfileAudioDirPathForSpidType:v3];
    int v5 = [NSURL fileURLWithPath:v4];
    uint64_t v6 = +[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:v5];
    goto LABEL_7;
  }
  uint64_t v4 = -[SSRVoiceProfile voiceProfileAudioDirPathForSpidType:](self, "voiceProfileAudioDirPathForSpidType:");
  int v5 = [NSURL fileURLWithPath:v4];
  uint64_t v6 = +[SSRUtils getEnrollmentUtterancesFromDirectory:v5];
LABEL_7:
  BOOL v7 = (void *)v6;

  return v7;
}

- (id)getExplicitMarkedEnrollmentUtterancesForType:(unint64_t)a3
{
  uint64_t v3 = [(SSRVoiceProfile *)self voiceProfileAudioDirPathForSpidType:a3];
  uint64_t v4 = [NSURL fileURLWithPath:v3];
  int v5 = +[SSRUtils getExplicitMarkedEnrollmentUtterancesFromDirectory:v4];

  return v5;
}

- (id)getExplicitEnrollmentUtterancesForType:(unint64_t)a3
{
  uint64_t v3 = [(SSRVoiceProfile *)self voiceProfileAudioDirPathForSpidType:a3];
  uint64_t v4 = [NSURL fileURLWithPath:v3];
  int v5 = +[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:v4];

  return v5;
}

- (id)addUtterances:(id)a3 spIdType:(unint64_t)a4
{
  v74[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = v6;
  if (v6 && [v6 count])
  {
    v49 = self;
    uint64_t v8 = [(SSRVoiceProfile *)self voiceProfileAudioDirPathForSpidType:a4];
    double v9 = [NSURL fileURLWithPath:v8];
    v50 = (void *)v8;
    +[SSRUtils createDirectoryIfDoesNotExist:v8];
    id v10 = [MEMORY[0x263F08850] defaultManager];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v51 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v53 = 0;
      BOOL v14 = 0;
      uint64_t v55 = *(void *)v59;
      v52 = v10;
      id obj = v11;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v59 != v55) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(id *)(*((void *)&v58 + 1) + 8 * i);
          __int16 v17 = [v16 lastPathComponent];
          id v18 = [v9 URLByAppendingPathComponent:v17];

          uint64_t v19 = [v16 URLByDeletingPathExtension];
          v20 = [v19 URLByAppendingPathExtension:@"json"];

          int v21 = [v20 lastPathComponent];
          v22 = [v9 URLByAppendingPathComponent:v21];

          id v57 = v14;
          [v10 copyItemAtURL:v16 toURL:v18 error:&v57];
          id v23 = v57;

          id v24 = *MEMORY[0x263F38100];
          __int16 v25 = *MEMORY[0x263F38100];
          if (v23)
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              id v32 = v24;
              id v33 = [v23 localizedDescription];
              *(_DWORD *)buf = 136315906;
              v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
              __int16 v66 = 2114;
              id v67 = v16;
              __int16 v68 = 2114;
              uint64_t v69 = (uint64_t)v18;
              __int16 v70 = 2114;
              v71 = v33;
              _os_log_error_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_ERROR, "%s Error to copy utterance from %{public}@ to %{public}@, error: %{public}@", buf, 0x2Au);

              id v10 = v52;
            }
            BOOL v14 = v23;
          }
          else
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
              __int16 v66 = 2114;
              id v67 = v16;
              __int16 v68 = 2114;
              uint64_t v69 = (uint64_t)v18;
              _os_log_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_DEFAULT, "%s Copied Utterance from %{public}@ to %{public}@", buf, 0x20u);
            }
            int v26 = [v20 path];
            int v27 = [v10 fileExistsAtPath:v26];

            if (v27
              && (id v56 = 0,
                  [v10 copyItemAtURL:v20 toURL:v22 error:&v56],
                  (id v28 = v56) != 0))
            {
              BOOL v14 = v28;
              long long v29 = (void *)*MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
              {
                id v34 = v29;
                __int16 v35 = [v14 localizedDescription];
                *(_DWORD *)buf = 136315906;
                v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
                __int16 v66 = 2114;
                id v67 = v20;
                __int16 v68 = 2114;
                uint64_t v69 = (uint64_t)v22;
                __int16 v70 = 2114;
                v71 = v35;
                _os_log_error_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_ERROR, "%s Error to copy jsonFile from %{public}@ to %{public}@, error: %{public}@", buf, 0x2Au);
              }
              long long v30 = [v18 path];
              id v31 = +[SSRUtils removeItemAtPath:v30];

              id v10 = v52;
            }
            else
            {
              BOOL v14 = 0;
              ++v53;
            }
          }
        }
        id v11 = obj;
        uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v13);
    }
    else
    {
      v53 = 0;
      BOOL v14 = 0;
    }

    uint64_t v40 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      v41 = v40;
      uint64_t v42 = [v11 count];
      profileID = v49->_profileID;
      *(_DWORD *)buf = 136315906;
      v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
      __int16 v66 = 2050;
      id v67 = v53;
      __int16 v68 = 2050;
      uint64_t v69 = v42;
      __int16 v70 = 2114;
      v71 = profileID;
      _os_log_impl(&dword_21C8A5000, v41, OS_LOG_TYPE_DEFAULT, "%s Successfully copied %{public}lu(%{public}lu) utterances to profile %{public}@", buf, 0x2Au);
    }
    BOOL v7 = v51;
    if (v53)
    {
      v39 = 0;
    }
    else
    {
      __int16 v44 = [NSString stringWithFormat:@"Failed to copy utterances with error %@", v14];
      id v45 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
        __int16 v66 = 2114;
        id v67 = v44;
        _os_log_error_impl(&dword_21C8A5000, v45, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      uint64_t v46 = (void *)MEMORY[0x263F087E8];
      v62 = @"reason";
      v63 = v44;
      v47 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      v39 = [v46 errorWithDomain:@"com.apple.speakerrecognition" code:721 userInfo:v47];
    }
    id v36 = v50;
  }
  else
  {
    id v36 = [NSString stringWithFormat:@"utterances passed is nil!"];
    __int16 v37 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
      __int16 v66 = 2114;
      id v67 = v36;
      _os_log_error_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v38 = (void *)MEMORY[0x263F087E8];
    v73 = @"reason";
    v74[0] = v36;
    double v9 = [NSDictionary dictionaryWithObjects:v74 forKeys:&v73 count:1];
    v39 = [v38 errorWithDomain:@"com.apple.speakerrecognition" code:727 userInfo:v9];
  }

  return v39;
}

- (id)importVoiceProfileAtPath:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v41 = [NSURL fileURLWithPath:self->_profileBasePath];
  int v5 = [v41 path];
  +[SSRUtils createDirectoryIfDoesNotExist:v5];

  __int16 v37 = v4;
  +[SSRUtils getContentsOfDirectory:v4];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v39 = 0;
    unint64_t v40 = 0;
    uint64_t v9 = *(void *)v44;
    id v38 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
        uint64_t v12 = [v11 lastPathComponent];
        uint64_t v13 = +[SSRUtils stringForCSSpIdType:2];
        char v14 = [v12 isEqualToString:v13];

        if ((v14 & 1) == 0)
        {
          __int16 v15 = +[SSRUtils stringForCSSpIdType:1];
          int v16 = [v12 isEqualToString:v15];

          if (v16)
          {
            if ((CSIsCommunalDevice() & 1) == 0) {
              unint64_t v39 = [(SSRVoiceProfile *)self _copyExplicitAudio:v11 withSpIdType:1];
            }
          }
          else
          {
            __int16 v17 = +[SSRUtils stringForCSSpIdType:3];
            int v18 = [v12 isEqualToString:v17];

            if (v18)
            {
              unint64_t v40 = [(SSRVoiceProfile *)self _copyExplicitAudio:v11 withSpIdType:3];
            }
            else
            {
              uint64_t v19 = self;
              v20 = [v11 lastPathComponent];
              int v21 = [v41 URLByAppendingPathComponent:v20];

              v22 = [MEMORY[0x263F08850] defaultManager];
              id v42 = 0;
              [v22 copyItemAtURL:v11 toURL:v21 error:&v42];
              id v23 = v42;

              id v24 = *MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v50 = "-[SSRVoiceProfile importVoiceProfileAtPath:]";
                __int16 v51 = 2114;
                unint64_t v52 = (unint64_t)v11;
                __int16 v53 = 2114;
                unint64_t v54 = (unint64_t)v21;
                __int16 v55 = 2114;
                unint64_t v56 = (unint64_t)v23;
                _os_log_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_DEFAULT, "%s Copied %{public}@ to %{public}@ with error %{public}@", buf, 0x2Au);
              }
              if (v23)
              {
                id v26 = +[SSRUtils removeItemAtPath:v19->_profileBasePath];

                id v6 = v38;
                int v27 = v38;
                id v28 = v37;
                goto LABEL_21;
              }

              self = v19;
              id v6 = v38;
            }
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v25 = [v6 countByEnumeratingWithState:&v43 objects:v57 count:16];
      uint64_t v8 = v25;
    }
    while (v25);
  }
  else
  {
    unint64_t v39 = 0;
    unint64_t v40 = 0;
  }

  id v23 = 0;
  if (CSIsCommunalDevice())
  {
    id v28 = v37;
    if (v40 <= 4)
    {
      long long v30 = +[SSRUtils stringForCSSpIdType:1];
      id v31 = [v37 URLByAppendingPathComponent:v30];

      unint64_t v32 = [(SSRVoiceProfile *)self _copyExplicitAudio:v31 withSpIdType:3];
      id v33 = (os_log_t *)MEMORY[0x263F38100];
      id v34 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v50 = "-[SSRVoiceProfile importVoiceProfileAtPath:]";
        __int16 v51 = 2050;
        unint64_t v52 = v39;
        __int16 v53 = 2050;
        unint64_t v54 = v32;
        __int16 v55 = 2050;
        unint64_t v56 = v40;
        _os_log_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_DEFAULT, "%s Copied TD audio files %{public}lu to TDTI which now has %{public}lu(%{public}lu) utterances", buf, 0x2Au);
      }

      if (v32 > 2)
      {
        id v23 = 0;
      }
      else
      {
        int v27 = objc_msgSend(NSString, "stringWithFormat:", @"ERR: Too less audio files (%ld) for onboarding", v32);
        __int16 v35 = *v33;
        if (os_log_type_enabled(*v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[SSRVoiceProfile importVoiceProfileAtPath:]";
          __int16 v51 = 2114;
          unint64_t v52 = (unint64_t)v27;
          _os_log_error_impl(&dword_21C8A5000, v35, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
        }
        id v36 = (void *)MEMORY[0x263F087E8];
        v47 = @"reason";
        v48 = v27;
        uint64_t v12 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        id v23 = [v36 errorWithDomain:@"com.apple.speakerrecognition" code:733 userInfo:v12];
LABEL_21:
      }
    }
  }
  else
  {
    id v28 = v37;
  }

  return v23;
}

- (unint64_t)_copyExplicitAudio:(id)a3 withSpIdType:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 URLByAppendingPathComponent:@"audio"];
  uint64_t v8 = +[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:v7];
  uint64_t v9 = +[SSRUtils stringForCSSpIdType:a4];
  uint64_t v10 = (os_log_t *)MEMORY[0x263F38100];
  id v11 = (void *)*MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    profileID = self->_profileID;
    uint64_t v13 = v11;
    char v14 = [v6 path];
    int v27 = 136315906;
    id v28 = "-[SSRVoiceProfile _copyExplicitAudio:withSpIdType:]";
    __int16 v29 = 2114;
    long long v30 = v9;
    __int16 v31 = 2114;
    unint64_t v32 = (unint64_t)profileID;
    __int16 v33 = 2114;
    uint64_t v34 = (uint64_t)v14;
    _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Importing %{public}@ of %{public}@ from import Dir %{public}@", (uint8_t *)&v27, 0x2Au);
  }
  __int16 v15 = [(SSRVoiceProfile *)self addUtterances:v8 spIdType:a4];
  if (v15)
  {
    os_log_t v16 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = self->_profileID;
      int v18 = v16;
      uint64_t v19 = [v6 path];
      int v27 = 136315906;
      id v28 = "-[SSRVoiceProfile _copyExplicitAudio:withSpIdType:]";
      __int16 v29 = 2114;
      long long v30 = v9;
      __int16 v31 = 2114;
      unint64_t v32 = (unint64_t)v17;
      __int16 v33 = 2114;
      uint64_t v34 = (uint64_t)v19;
      _os_log_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Failed in importing %{public}@ of %{public}@ from import Dir %{public}@", (uint8_t *)&v27, 0x2Au);
    }
    unint64_t v20 = 0;
  }
  else
  {
    int v21 = [(SSRVoiceProfile *)self getExplicitEnrollmentUtterancesForType:a4];
    unint64_t v20 = [v21 count];

    os_log_t v22 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v22;
      uint64_t v24 = [v8 count];
      uint64_t v25 = self->_profileID;
      int v27 = 136316162;
      id v28 = "-[SSRVoiceProfile _copyExplicitAudio:withSpIdType:]";
      __int16 v29 = 2112;
      long long v30 = v9;
      __int16 v31 = 2050;
      unint64_t v32 = v20;
      __int16 v33 = 2050;
      uint64_t v34 = v24;
      __int16 v35 = 2114;
      id v36 = v25;
      _os_log_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Successfully imported %{publice}@ %{public}lu(%{public}lu) utterances to profile %{public}@", (uint8_t *)&v27, 0x34u);
    }
  }

  return v20;
}

- (unint64_t)copyTDAudioToTDTI
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSURL;
  id v4 = [(SSRVoiceProfile *)self _voiceProfilePathForSpidType:1];
  int v5 = [v3 URLWithString:v4];

  id v6 = (os_log_t *)MEMORY[0x263F38100];
  uint64_t v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    char v14 = "-[SSRVoiceProfile copyTDAudioToTDTI]";
    __int16 v15 = 2112;
    os_log_t v16 = v5;
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Copying TD audio files: %@ to TDTI", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v8 = [(SSRVoiceProfile *)self getEnrollmentUtterancesForModelType:3];
  uint64_t v9 = v8;
  if (v8 && (unint64_t)[v8 count] >= 5)
  {
    uint64_t v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      char v14 = "-[SSRVoiceProfile copyTDAudioToTDTI]";
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s TDTI audio files exist. Aborting copy", (uint8_t *)&v13, 0xCu);
    }
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v11 = [(SSRVoiceProfile *)self _copyExplicitAudio:v5 withSpIdType:3];
  }

  return v11;
}

- (BOOL)isValidForRPIWithError:(id *)a3
{
  if ([(NSString *)self->_appDomain isEqualToString:@"com.apple.siri"])
  {
    if (self->_donationIds) {
      return 1;
    }
    if (a3)
    {
      uint64_t v6 = 1265;
      goto LABEL_8;
    }
  }
  else if (a3)
  {
    uint64_t v6 = 1264;
LABEL_8:
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:v6 userInfo:0];
    BOOL result = 0;
    *a3 = v7;
    return result;
  }
  return 0;
}

- (id)getDonationIds
{
  return self->_donationIds;
}

- (void)addDonationId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    donationIds = self->_donationIds;
    id v8 = v4;
    if (!donationIds)
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      id v7 = self->_donationIds;
      self->_donationIds = v6;

      donationIds = self->_donationIds;
    }
    [(NSMutableArray *)donationIds addObject:v8];
  }

  MEMORY[0x270F9A758]();
}

- (id)exclaveVoiceProfileModelFilePathForRecognizerType:(unint64_t)a3 spIdType:(unint64_t)a4
{
  id v4 = [(SSRVoiceProfile *)self voiceProfileModelFilePathForRecognizerType:a3 spIdType:a4];
  int v5 = [v4 URLByAppendingPathExtension:@"exclave"];

  return v5;
}

- (id)voiceProfileModelFilePathForRecognizerType:(unint64_t)a3 spIdType:(unint64_t)a4
{
  id v4 = [(SSRVoiceProfile *)self voiceProfileModelDirForSpidType:a4 recognizerType:a3];
  int v5 = [NSURL URLWithString:v4];

  return v5;
}

- (void)setSharedSiriProfileId:(id)a3
{
}

- (id)description
{
  v2 = [(SSRVoiceProfile *)self dictionaryRepresentation];
  uint64_t v3 = [v2 description];

  return v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = NSString;
  [(NSDate *)self->_dateAdded timeIntervalSince1970];
  uint64_t v6 = objc_msgSend(v4, "stringWithFormat:", @"%f", v5);
  id v7 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v6, @"UserVoiceProfileDateTrained", self->_locale, @"UserVoiceProfileLocale", self->_profileBasePath, @"UserVoiceProfilePath", self->_profileID, @"UserVoiceProfileID", self->_appDomain, @"UserVoiceProfileAppDomain", self->_profilePitch, @"UserVoiceProfilePitch", self->_enrollmentId, @"UserVoiceProfileEnrollmentId", 0);

  siriProfileId = self->_siriProfileId;
  if (siriProfileId) {
    [v7 setObject:siriProfileId forKey:@"UserSharedSiriID"];
  }
  if (CSIsInternalBuild())
  {
    userName = self->_userName;
    if (userName) {
      [v7 setObject:userName forKey:@"UserVoiceProfileUserName"];
    }
  }
  profileBasePathExclave = self->_profileBasePathExclave;
  if (profileBasePathExclave) {
    [v7 setObject:profileBasePathExclave forKey:@"UserVoiceProfilePathExclave"];
  }
  donationIds = self->_donationIds;
  if (donationIds) {
    [v7 setObject:donationIds forKey:@"VoiceProfileEnrollmentDonationIds"];
  }
  uint64_t v12 = (void *)[v7 copy];

  return v12;
}

- (SSRVoiceProfile)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v37.receiver = self;
    v37.super_class = (Class)SSRVoiceProfile;
    self = [(SSRVoiceProfile *)&v37 init];
    if (self)
    {
      uint64_t v5 = [v4 objectForKeyedSubscript:@"UserVoiceProfileID"];
      profileID = self->_profileID;
      self->_profileID = (NSString *)&v5->super.isa;

      if (!v5)
      {
        NSLog(&cfstr_CreatingSsrvoi.isa, v4);
        goto LABEL_14;
      }
      id v7 = (void *)MEMORY[0x263EFF910];
      id v8 = [v4 objectForKeyedSubscript:@"UserVoiceProfileDateTrained"];
      [v8 doubleValue];
      objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
      uint64_t v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      dateAdded = self->_dateAdded;
      self->_dateAdded = v9;

      unint64_t v11 = [v4 objectForKeyedSubscript:@"UserVoiceProfilePath"];
      profileBasePath = self->_profileBasePath;
      self->_profileBasePath = v11;

      int v13 = [v4 objectForKeyedSubscript:@"UserVoiceProfilePathExclave"];
      profileBasePathExclave = self->_profileBasePathExclave;
      self->_profileBasePathExclave = v13;

      __int16 v15 = [v4 objectForKeyedSubscript:@"UserVoiceProfileID"];
      os_log_t v16 = self->_profileID;
      self->_profileID = v15;

      uint64_t v17 = [v4 objectForKeyedSubscript:@"UserVoiceProfileLocale"];
      locale = self->_locale;
      self->_locale = v17;

      uint64_t v19 = [v4 objectForKeyedSubscript:@"UserSharedSiriID"];
      siriProfileId = self->_siriProfileId;
      self->_siriProfileId = v19;

      int v21 = [v4 objectForKeyedSubscript:@"UserVoiceProfileAppDomain"];
      appDomain = self->_appDomain;
      self->_appDomain = v21;

      id v23 = [v4 objectForKeyedSubscript:@"UserVoiceProfileEnrollmentId"];
      enrollmentId = self->_enrollmentId;
      self->_enrollmentId = v23;

      uint64_t v25 = [v4 objectForKey:@"UserVoiceProfilePitch"];

      if (v25)
      {
        id v26 = [v4 objectForKey:@"UserVoiceProfilePitch"];
        profilePitch = self->_profilePitch;
        self->_profilePitch = v26;
      }
      if (CSIsInternalBuild())
      {
        id v28 = [v4 objectForKeyedSubscript:@"UserVoiceProfileUserName"];
        userName = self->_userName;
        self->_userName = v28;
      }
      uint64_t v30 = [v4 objectForKey:@"VoiceProfileEnrollmentDonationIds"];
      if (v30)
      {
        __int16 v31 = (void *)v30;
        unint64_t v32 = [v4 objectForKeyedSubscript:@"VoiceProfileEnrollmentDonationIds"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v34 = [v4 objectForKey:@"VoiceProfileEnrollmentDonationIds"];
          donationIds = self->_donationIds;
          self->_donationIds = v34;
        }
      }
    }
    self = self;
    uint64_t v5 = self;
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_14:

  return v5;
}

- (id)initNewVoiceProfileWithLocale:(id)a3 withAppDomain:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SSRVoiceProfile;
  uint64_t v9 = [(SSRVoiceProfile *)&v29 init];
  if (!v9) {
    goto LABEL_5;
  }
  if (v7 && v8)
  {
    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    uint64_t v11 = [v10 UUIDString];
    profileID = v9->_profileID;
    v9->_profileID = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x263EFF910] date];
    dateAdded = v9->_dateAdded;
    v9->_dateAdded = (NSDate *)v13;

    __int16 v15 = +[SSRVoiceProfileManager sharedInstance];
    os_log_t v16 = [v15 SSRSpeakerProfilesBasePath];

    uint64_t v17 = [v16 stringByAppendingPathComponent:v8];
    int v18 = [v17 stringByAppendingPathComponent:v7];
    uint64_t v19 = [v18 stringByAppendingPathComponent:v9->_profileID];
    profileBasePath = v9->_profileBasePath;
    v9->_profileBasePath = (NSString *)v19;

    objc_storeStrong((id *)&v9->_appDomain, a4);
    objc_storeStrong((id *)&v9->_locale, a3);
    uint64_t v21 = [NSNumber numberWithFloat:0.0];
    profilePitch = v9->_profilePitch;
    v9->_profilePitch = (NSNumber *)v21;

    donationIds = v9->_donationIds;
    v9->_donationIds = 0;

    uint64_t v24 = +[SSRUtils generateEnrollmentId];
    enrollmentId = v9->_enrollmentId;
    v9->_enrollmentId = (NSString *)v24;

LABEL_5:
    id v26 = v9;
    goto LABEL_9;
  }
  int v27 = *MEMORY[0x263F37FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v31 = "-[SSRVoiceProfile initNewVoiceProfileWithLocale:withAppDomain:]";
    _os_log_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_DEFAULT, "%s ERR: missing arguments to create voice profile - Bailing out", buf, 0xCu);
  }
  id v26 = 0;
LABEL_9:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  locale = self->_locale;
  id v5 = a3;
  [v5 encodeObject:locale forKey:@"UserVoiceProfileLocale"];
  [v5 encodeObject:self->_appDomain forKey:@"UserVoiceProfileAppDomain"];
  [v5 encodeObject:self->_profileID forKey:@"UserVoiceProfileID"];
  [v5 encodeObject:self->_siriProfileId forKey:@"UserSharedSiriID"];
  [v5 encodeObject:self->_dateAdded forKey:@"UserVoiceProfileDateTrained"];
  [v5 encodeObject:self->_profileBasePath forKey:@"UserVoiceProfilePath"];
  [v5 encodeObject:self->_profileBasePathExclave forKey:@"UserVoiceProfilePathExclave"];
  [v5 encodeObject:self->_profilePitch forKey:@"UserVoiceProfilePitch"];
  [v5 encodeObject:self->_donationIds forKey:@"VoiceProfileEnrollmentDonationIds"];
  [v5 encodeObject:self->_enrollmentId forKey:@"UserVoiceProfileEnrollmentId"];
}

- (SSRVoiceProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SSRVoiceProfile;
  id v5 = [(SSRVoiceProfile *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserVoiceProfileLocale"];
    locale = v5->_locale;
    v5->_locale = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserVoiceProfileAppDomain"];
    appDomain = v5->_appDomain;
    v5->_appDomain = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserVoiceProfileID"];
    profileID = v5->_profileID;
    v5->_profileID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserSharedSiriID"];
    siriProfileId = v5->_siriProfileId;
    v5->_siriProfileId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserVoiceProfileDateTrained"];
    dateAdded = v5->_dateAdded;
    v5->_dateAdded = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserVoiceProfilePath"];
    profileBasePath = v5->_profileBasePath;
    v5->_profileBasePath = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserVoiceProfilePathExclave"];
    profileBasePathExclave = v5->_profileBasePathExclave;
    v5->_profileBasePathExclave = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserVoiceProfilePitch"];
    profilePitch = v5->_profilePitch;
    v5->_profilePitch = (NSNumber *)v20;

    os_log_t v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"VoiceProfileEnrollmentDonationIds"];
    donationIds = v5->_donationIds;
    v5->_donationIds = (NSMutableArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserVoiceProfileEnrollmentId"];
    enrollmentId = v5->_enrollmentId;
    v5->_enrollmentId = (NSString *)v27;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end