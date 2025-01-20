@interface SRSVoiceProfileManager
- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3;
- (BOOL)isSATEnrolledForSiriProfileId:(id)a3 languageCode:(id)a4;
- (SRSVoiceProfileManager)init;
- (void)deleteUserVoiceProfile:(id)a3;
- (void)markSATEnrollmentSuccessForVoiceProfile:(id)a3;
@end

@implementation SRSVoiceProfileManager

- (SRSVoiceProfileManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSVoiceProfileManager;
  v2 = [(SRSVoiceProfileManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F78BB8] sharedInstance];
    voiceProfileManager = v2->_voiceProfileManager;
    v2->_voiceProfileManager = (SSRVoiceProfileManager *)v3;
  }
  return v2;
}

- (BOOL)isSATEnrolledForSiriProfileId:(id)a3 languageCode:(id)a4
{
  return [(SSRVoiceProfileManager *)self->_voiceProfileManager isSATEnrolledForSiriProfileId:a3 forLanguageCode:a4];
}

- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3
{
  return [(SSRVoiceProfileManager *)self->_voiceProfileManager hasVoiceProfileIniCloudForLanguageCode:a3];
}

- (void)markSATEnrollmentSuccessForVoiceProfile:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = (id)[(SSRVoiceProfileManager *)self->_voiceProfileManager markSATEnrollmentSuccessForVoiceProfile:v5];
  }
}

- (void)deleteUserVoiceProfile:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = (id)[(SSRVoiceProfileManager *)self->_voiceProfileManager deleteUserVoiceProfile:v5];
  }
}

- (void).cxx_destruct
{
}

@end