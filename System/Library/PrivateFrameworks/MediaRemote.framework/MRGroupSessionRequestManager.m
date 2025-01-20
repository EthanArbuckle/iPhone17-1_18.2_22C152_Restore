@interface MRGroupSessionRequestManager
+ (id)sharedManager;
- (BOOL)hasPopulatedIdentity;
- (BOOL)updateGroupSessionEligibility:(id)a3;
- (MRGroupSessionEligibilityStatus)eligibilityStatus;
- (MRGroupSessionInfo)groupSessionInfo;
- (MRGroupSessionRequestManager)init;
- (MRUserIdentity)localUserIdentity;
- (os_unfair_lock_s)lock;
- (void)augmentLocalCommandOptions:(id)a3;
- (void)handleGroupSessionNearbyContactDiscoveryDidChange:(id)a3;
- (void)registerObservers;
- (void)restoreState;
- (void)setEligibilityStatus:(id)a3;
- (void)setHasPopulatedIdentity:(BOOL)a3;
- (void)setLocalUserIdentity:(id)a3;
- (void)updateGroupSessionInfo:(id)a3;
- (void)updateLocalIdentity:(id)a3;
@end

@implementation MRGroupSessionRequestManager

void __45__MRGroupSessionRequestManager_sharedManager__block_invoke()
{
  id v2 = +[MRSharedSettings currentSettings];
  if ([v2 supportGroupSession]) {
    v0 = objc_alloc_init(MRGroupSessionRequestManager);
  }
  else {
    v0 = 0;
  }
  v1 = (void *)sharedManager___shared;
  sharedManager___shared = (uint64_t)v0;
}

- (MRGroupSessionRequestManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MRGroupSessionRequestManager;
  id v2 = [(MRGroupSessionRequestManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    [(MRGroupSessionRequestManager *)v2 registerObservers];
  }
  return v3;
}

- (void)registerObservers
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v3 = +[MRUserSettings currentSettings];
  v4 = [v3 groupSessionNearbyContactDiscoveryDidChangeNotification];
  [v5 addObserver:self selector:sel_handleGroupSessionNearbyContactDiscoveryDidChange_ name:v4 object:0];
}

- (MRGroupSessionEligibilityStatus)eligibilityStatus
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_eligibilityStatus;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)updateGroupSessionEligibility:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  eligibilityStatus = self->_eligibilityStatus;
  p_eligibilityStatus = &self->_eligibilityStatus;
  v7 = eligibilityStatus;
  v10 = (MRGroupSessionEligibilityStatus *)v5;
  v11 = v10;
  if (eligibilityStatus == v10) {
    char v12 = 1;
  }
  else {
    char v12 = [(MRGroupSessionEligibilityStatus *)v10 isEqual:v7];
  }

  objc_storeStrong((id *)p_eligibilityStatus, a3);
  os_unfair_lock_unlock(p_lock);
  if ((v12 & 1) == 0)
  {
    v13 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionRequestManager] Updating group session eligibility: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v12 ^ 1;
}

- (void)updateGroupSessionInfo:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = (MRGroupSessionInfo *)a3;
  id v5 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionRequestManager] Updating group session info: %@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  groupSessionInfo = self->_groupSessionInfo;
  self->_groupSessionInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_17);
  }
  id v2 = (void *)sharedManager___shared;

  return v2;
}

- (MRGroupSessionInfo)groupSessionInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_groupSessionInfo;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)restoreState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasPopulatedIdentity = 0;
  localUserIdentity = self->_localUserIdentity;
  self->_localUserIdentity = 0;

  eligibilityStatus = self->_eligibilityStatus;
  self->_eligibilityStatus = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)augmentLocalCommandOptions:(id)a3
{
  id v4 = a3;
  id v6 = [(MRGroupSessionRequestManager *)self localUserIdentity];
  id v5 = +[MRPlaybackQueueParticipant expectedIdentifierForUserIdentity:v6 withRandomData:0];
  [v4 setObject:v5 forKeyedSubscript:@"kMRMediaRemoteOptionAssociatedParticipantIdentifier"];
}

- (MRUserIdentity)localUserIdentity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  localUserIdentity = self->_localUserIdentity;
  if (!localUserIdentity)
  {
    if (self->_hasPopulatedIdentity)
    {
      localUserIdentity = 0;
    }
    else
    {
      id v5 = MRGetSharedService();
      id v6 = [v5 applicationUserIdentity];
      int v7 = self->_localUserIdentity;
      self->_localUserIdentity = v6;

      self->_hasPopulatedIdentity = 1;
      localUserIdentity = self->_localUserIdentity;
    }
  }
  v8 = localUserIdentity;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)updateLocalIdentity:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (MRUserIdentity *)a3;
  id v5 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionRequestManager] Updating local identity: %@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  localUserIdentity = self->_localUserIdentity;
  self->_localUserIdentity = v4;

  self->_hasPopulatedIdentity = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)handleGroupSessionNearbyContactDiscoveryDidChange:(id)a3
{
  v3 = _MRLogForCategory(0xCuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionRequestManager] Nearby contact discovery preference changed.", v5, 2u);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MRGroupSessionNearbyContactDiscoveryPreferenceDidChangeNotification" object:0];
}

- (void)setLocalUserIdentity:(id)a3
{
}

- (void)setEligibilityStatus:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)hasPopulatedIdentity
{
  return self->_hasPopulatedIdentity;
}

- (void)setHasPopulatedIdentity:(BOOL)a3
{
  self->_hasPopulatedIdentity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibilityStatus, 0);
  objc_storeStrong((id *)&self->_localUserIdentity, 0);

  objc_storeStrong((id *)&self->_groupSessionInfo, 0);
}

@end