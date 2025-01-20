@interface SSRVoiceProfileXPCServiceProxy
+ (id)sharedInstance;
- (BOOL)fetchEnrollmentStatusForSiriProfileId:(id)a3 forLanguageCode:(id)a4;
@end

@implementation SSRVoiceProfileXPCServiceProxy

- (BOOL)fetchEnrollmentStatusForSiriProfileId:(id)a3 forLanguageCode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[SSRVoiceProfileManager sharedInstance];
  char v8 = [v7 isSATEnrolledForSiriProfileId:v6 forLanguageCode:v5];

  return v8;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1780 != -1) {
    dispatch_once(&sharedInstance_onceToken_1780, &__block_literal_global_1781);
  }
  v2 = (void *)sharedInstance__sharedInstance;

  return v2;
}

uint64_t __48__SSRVoiceProfileXPCServiceProxy_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = objc_alloc_init(SSRVoiceProfileXPCServiceProxy);

  return MEMORY[0x270F9A758]();
}

@end