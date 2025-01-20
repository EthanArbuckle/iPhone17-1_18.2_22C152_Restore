@interface SSRVoiceProfileMetaContext
- (NSDate)dateAdded;
- (NSNumber)pitch;
- (NSNumber)version;
- (NSString)appDomain;
- (NSString)homeId;
- (NSString)languageCode;
- (NSString)productCategory;
- (NSString)profileId;
- (NSString)sharedSiriId;
- (NSString)userName;
- (SSRVoiceProfileMetaContext)initWithSharedSiriId:(id)a3 languageCode:(id)a4 productCategory:(id)a5 version:(id)a6;
- (SSRVoiceProfileMetaContext)initWithVoiceProfile:(id)a3;
- (id)description;
- (void)setAppDomain:(id)a3;
- (void)setDateAdded:(id)a3;
- (void)setHomeId:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setPitch:(id)a3;
- (void)setProductCategory:(id)a3;
- (void)setProfileId:(id)a3;
- (void)setSharedSiriId:(id)a3;
- (void)setUserName:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SSRVoiceProfileMetaContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_homeId, 0);
  objc_storeStrong((id *)&self->_sharedSiriId, 0);
  objc_storeStrong((id *)&self->_pitch, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_profileId, 0);

  objc_storeStrong((id *)&self->_appDomain, 0);
}

- (void)setUserName:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setHomeId:(id)a3
{
}

- (NSString)homeId
{
  return self->_homeId;
}

- (void)setSharedSiriId:(id)a3
{
}

- (NSString)sharedSiriId
{
  return self->_sharedSiriId;
}

- (void)setPitch:(id)a3
{
}

- (NSNumber)pitch
{
  return self->_pitch;
}

- (void)setDateAdded:(id)a3
{
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (void)setVersion:(id)a3
{
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setProductCategory:(id)a3
{
}

- (NSString)productCategory
{
  return self->_productCategory;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setProfileId:(id)a3
{
}

- (NSString)profileId
{
  return self->_profileId;
}

- (void)setAppDomain:(id)a3
{
}

- (NSString)appDomain
{
  return self->_appDomain;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[profileId: %@, language: %@, product: %@, version: %@, homeId: %@, name: %@, pitch:%@ Hz]", self->_sharedSiriId, self->_languageCode, self->_productCategory, self->_version, self->_homeId, self->_userName, self->_pitch];
}

- (SSRVoiceProfileMetaContext)initWithSharedSiriId:(id)a3 languageCode:(id)a4 productCategory:(id)a5 version:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SSRVoiceProfileMetaContext;
  v15 = [(SSRVoiceProfileMetaContext *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sharedSiriId, a3);
    objc_storeStrong((id *)&v16->_languageCode, a4);
    objc_storeStrong((id *)&v16->_productCategory, a5);
    objc_storeStrong((id *)&v16->_version, a6);
  }

  return v16;
}

- (SSRVoiceProfileMetaContext)initWithVoiceProfile:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v23.receiver = self;
    v23.super_class = (Class)SSRVoiceProfileMetaContext;
    v5 = [(SSRVoiceProfileMetaContext *)&v23 init];
    if (v5)
    {
      uint64_t v6 = [v4 appDomain];
      appDomain = v5->_appDomain;
      v5->_appDomain = (NSString *)v6;

      uint64_t v8 = [v4 profileID];
      profileId = v5->_profileId;
      v5->_profileId = (NSString *)v8;

      uint64_t v10 = [v4 siriProfileId];
      sharedSiriId = v5->_sharedSiriId;
      v5->_sharedSiriId = (NSString *)v10;

      uint64_t v12 = [v4 locale];
      languageCode = v5->_languageCode;
      v5->_languageCode = (NSString *)v12;

      uint64_t v14 = [v4 userName];
      userName = v5->_userName;
      v5->_userName = (NSString *)v14;

      uint64_t v16 = [v4 dateAdded];
      dateAdded = v5->_dateAdded;
      v5->_dateAdded = (NSDate *)v16;

      uint64_t v18 = [v4 profilePitch];
      pitch = v5->_pitch;
      v5->_pitch = (NSNumber *)v18;
    }
    self = v5;
    v20 = self;
  }
  else
  {
    v21 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[SSRVoiceProfileMetaContext initWithVoiceProfile:]";
      _os_log_error_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_ERROR, "%s ERR: voiceProfile is nil - Bailing out", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

@end