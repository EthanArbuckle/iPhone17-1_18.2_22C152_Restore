@interface SMReceiverContact
- (SMCache)phoneCache;
- (SMCache)watchCache;
- (SMReceiverContact)initWithIdentifier:(id)a3 syncDate:(id)a4 phoneCache:(id)a5 watchCache:(id)a6 sessionStatus:(id)a7 allowReadToken:(id)a8 safetyCacheKey:(id)a9 shareURL:(id)a10 participantID:(id)a11 sharingInvitationData:(id)a12 numCacheDownloads:(int64_t)a13 numSuccessfulCacheDownloads:(int64_t)a14 maxPhoneCacheSize:(int64_t)a15 maxWatchCacheSize:(int64_t)a16 maxLocationsInPhoneCacheTrace:(int64_t)a17 maxLocationsInWatchCacheTrace:(int64_t)a18 timeTillCacheRelease:(double)a19 timeTillFirstSuccessfulCacheDownload:(double)a20 sessionID:(id)a21 firstDetailViewSessionState:(int64_t)a22 lastDetailViewSessionState:(int64_t)a23 phoneMaxWorkoutEvents:(int64_t)a24 watchMaxWorkoutEvents:(int64_t)a25;
- (SMReceiverSessionStatus)sessionStatus;
- (double)timeTillCacheRelease;
- (double)timeTillFirstSuccessfulCacheDownload;
- (id)description;
- (int64_t)firstDetailViewSessionState;
- (int64_t)lastDetailViewSessionState;
- (int64_t)maxLocationsInPhoneCacheTrace;
- (int64_t)maxLocationsInWatchCacheTrace;
- (int64_t)maxPhoneCacheSize;
- (int64_t)maxWatchCacheSize;
- (int64_t)numCacheDownloads;
- (int64_t)numSuccessfulCacheDownloads;
- (int64_t)phoneMaxWorkoutEvents;
- (int64_t)watchMaxWorkoutEvents;
- (void)setFirstDetailViewSessionState:(int64_t)a3;
- (void)setLastDetailViewSessionState:(int64_t)a3;
- (void)setMaxLocationsInPhoneCacheTrace:(int64_t)a3;
- (void)setMaxLocationsInWatchCacheTrace:(int64_t)a3;
- (void)setMaxPhoneCacheSize:(int64_t)a3;
- (void)setMaxWatchCacheSize:(int64_t)a3;
- (void)setNumCacheDownloads:(int64_t)a3;
- (void)setNumSuccessfulCacheDownloads:(int64_t)a3;
- (void)setPhoneCache:(id)a3;
- (void)setPhoneMaxWorkoutEvents:(int64_t)a3;
- (void)setSessionStatus:(id)a3;
- (void)setTimeTillCacheRelease:(double)a3;
- (void)setTimeTillFirstSuccessfulCacheDownload:(double)a3;
- (void)setWatchCache:(id)a3;
- (void)setWatchMaxWorkoutEvents:(int64_t)a3;
@end

@implementation SMReceiverContact

- (SMReceiverContact)initWithIdentifier:(id)a3 syncDate:(id)a4 phoneCache:(id)a5 watchCache:(id)a6 sessionStatus:(id)a7 allowReadToken:(id)a8 safetyCacheKey:(id)a9 shareURL:(id)a10 participantID:(id)a11 sharingInvitationData:(id)a12 numCacheDownloads:(int64_t)a13 numSuccessfulCacheDownloads:(int64_t)a14 maxPhoneCacheSize:(int64_t)a15 maxWatchCacheSize:(int64_t)a16 maxLocationsInPhoneCacheTrace:(int64_t)a17 maxLocationsInWatchCacheTrace:(int64_t)a18 timeTillCacheRelease:(double)a19 timeTillFirstSuccessfulCacheDownload:(double)a20 sessionID:(id)a21 firstDetailViewSessionState:(int64_t)a22 lastDetailViewSessionState:(int64_t)a23 phoneMaxWorkoutEvents:(int64_t)a24 watchMaxWorkoutEvents:(int64_t)a25
{
  id v32 = a3;
  id v54 = a4;
  id v50 = a5;
  id v49 = a6;
  id v33 = a7;
  id v53 = a8;
  id v34 = a9;
  id v35 = a10;
  id v36 = a11;
  id v37 = a12;
  id v38 = a21;
  v52 = v35;
  if (!v32)
  {
    v45 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v42 = 0;
    v44 = v49;
    v43 = v50;
    goto LABEL_12;
  }
  if (!v33)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v44 = v49;
    v43 = v50;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionStatus", buf, 2u);
    }

    v42 = 0;
LABEL_12:
    v41 = self;
    goto LABEL_13;
  }
  v55.receiver = self;
  v55.super_class = (Class)SMReceiverContact;
  id v51 = v34;
  v39 = [(SMContact *)&v55 initWithIdentifier:v32 sessionID:v38 allowReadToken:v53 safetyCacheKey:v34 syncDate:v54 sharingInvitationData:v37 shareURL:v35 participantID:v36];
  v40 = v39;
  if (v39)
  {
    objc_storeStrong((id *)&v39->_phoneCache, a5);
    objc_storeStrong((id *)&v40->_watchCache, a6);
    objc_storeStrong((id *)&v40->_sessionStatus, a7);
    v40->_numCacheDownloads = a13;
    v40->_numSuccessfulCacheDownloads = a14;
    v40->_maxPhoneCacheSize = a15;
    v40->_maxWatchCacheSize = a16;
    v40->_maxLocationsInPhoneCacheTrace = a17;
    v40->_maxLocationsInWatchCacheTrace = a18;
    v40->_timeTillCacheRelease = a19;
    v40->_timeTillFirstSuccessfulCacheDownload = a20;
    v40->_firstDetailViewSessionState = a22;
    v40->_lastDetailViewSessionState = a23;
    v40->_phoneMaxWorkoutEvents = a24;
    v40->_watchMaxWorkoutEvents = a25;
  }
  v41 = v40;
  v42 = v41;
  v44 = v49;
  v43 = v50;
  id v34 = v51;
LABEL_13:

  return v42;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SMContact *)self sessionUUID];
  v5 = [(SMContact *)self identifier];
  v6 = [(SMReceiverContact *)self sessionStatus];
  v7 = [v6 initiatorHandle];
  v8 = [v7 primaryHandle];
  v9 = [(SMContact *)self syncDate];
  v10 = [v9 stringFromDate];
  v11 = [(SMContact *)self allowReadToken];
  v12 = [(SMContact *)self safetyCacheKey];
  v13 = [v3 stringWithFormat:@"sessionID,%@,identifier,%@,initiatorHandle,%@,syncDate,%@,allowReadToken,%@,safetyCacheKey,%@", v4, v5, v8, v10, v11, v12];

  return v13;
}

- (SMCache)phoneCache
{
  return self->_phoneCache;
}

- (void)setPhoneCache:(id)a3
{
}

- (SMCache)watchCache
{
  return self->_watchCache;
}

- (void)setWatchCache:(id)a3
{
}

- (SMReceiverSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (int64_t)numCacheDownloads
{
  return self->_numCacheDownloads;
}

- (void)setNumCacheDownloads:(int64_t)a3
{
  self->_numCacheDownloads = a3;
}

- (int64_t)numSuccessfulCacheDownloads
{
  return self->_numSuccessfulCacheDownloads;
}

- (void)setNumSuccessfulCacheDownloads:(int64_t)a3
{
  self->_numSuccessfulCacheDownloads = a3;
}

- (int64_t)maxPhoneCacheSize
{
  return self->_maxPhoneCacheSize;
}

- (void)setMaxPhoneCacheSize:(int64_t)a3
{
  self->_maxPhoneCacheSize = a3;
}

- (int64_t)maxWatchCacheSize
{
  return self->_maxWatchCacheSize;
}

- (void)setMaxWatchCacheSize:(int64_t)a3
{
  self->_maxWatchCacheSize = a3;
}

- (int64_t)maxLocationsInPhoneCacheTrace
{
  return self->_maxLocationsInPhoneCacheTrace;
}

- (void)setMaxLocationsInPhoneCacheTrace:(int64_t)a3
{
  self->_maxLocationsInPhoneCacheTrace = a3;
}

- (int64_t)maxLocationsInWatchCacheTrace
{
  return self->_maxLocationsInWatchCacheTrace;
}

- (void)setMaxLocationsInWatchCacheTrace:(int64_t)a3
{
  self->_maxLocationsInWatchCacheTrace = a3;
}

- (double)timeTillCacheRelease
{
  return self->_timeTillCacheRelease;
}

- (void)setTimeTillCacheRelease:(double)a3
{
  self->_timeTillCacheRelease = a3;
}

- (double)timeTillFirstSuccessfulCacheDownload
{
  return self->_timeTillFirstSuccessfulCacheDownload;
}

- (void)setTimeTillFirstSuccessfulCacheDownload:(double)a3
{
  self->_timeTillFirstSuccessfulCacheDownload = a3;
}

- (int64_t)firstDetailViewSessionState
{
  return self->_firstDetailViewSessionState;
}

- (void)setFirstDetailViewSessionState:(int64_t)a3
{
  self->_firstDetailViewSessionState = a3;
}

- (int64_t)lastDetailViewSessionState
{
  return self->_lastDetailViewSessionState;
}

- (void)setLastDetailViewSessionState:(int64_t)a3
{
  self->_lastDetailViewSessionState = a3;
}

- (int64_t)phoneMaxWorkoutEvents
{
  return self->_phoneMaxWorkoutEvents;
}

- (void)setPhoneMaxWorkoutEvents:(int64_t)a3
{
  self->_phoneMaxWorkoutEvents = a3;
}

- (int64_t)watchMaxWorkoutEvents
{
  return self->_watchMaxWorkoutEvents;
}

- (void)setWatchMaxWorkoutEvents:(int64_t)a3
{
  self->_watchMaxWorkoutEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_watchCache, 0);
  objc_storeStrong((id *)&self->_phoneCache, 0);
}

@end