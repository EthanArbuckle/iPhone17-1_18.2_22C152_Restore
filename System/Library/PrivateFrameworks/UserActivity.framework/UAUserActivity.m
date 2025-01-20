@interface UAUserActivity
+ (BOOL)checkWebpageURL:(id)a3 actionType:(unint64_t)a4 throwIfFailed:(BOOL)a5;
+ (BOOL)currentUserActivityProxiesWithOptions:(id)a3 matching:(id)a4 completionHandler:(id)a5;
+ (BOOL)currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4;
+ (BOOL)determineIfUserActivityIsCurrent:(id)a3 completionHandler:(id)a4;
+ (BOOL)isIndexPendingForUUID:(id)a3;
+ (BOOL)registerAsProxyForApplication:(int)a3 options:(id)a4 completionBlock:(id)a5;
+ (BOOL)supportsUserActivityAppLinks;
+ (BOOL)userActivityContinuationSupported;
+ (id)_decodeFromEntireString:(id)a3;
+ (id)_decodeFromScanner:(id)a3;
+ (id)_decodeFromString:(id)a3;
+ (id)_encodeKeyAndValueIntoString:(id)a3 value:(id)a4;
+ (id)_encodeToString:(id)a3;
+ (id)allowedWebpageURLSchemes;
+ (id)currentUserActivityUUID;
+ (id)fetchUserActivityWithUUID:(id)a3 intervalToWaitForDocumentSynchronizationToComplete:(double)a4 completionHandler:(id)a5;
+ (id)mainBundleIdentifier;
+ (id)registerForSuggestedActionNudgeOfType:(unint64_t)a3 withOptions:(id)a4 block:(id)a5;
+ (id)userActivityFromUUID:(id)a3 timeout:(double)a4 withError:(id *)a5;
+ (id)userActivityFromUUID:(id)a3 withError:(id *)a4;
+ (void)addDynamicUserActivity:(id)a3 matching:(id)a4;
+ (void)addUserActivityObserver:(id)a3;
+ (void)deleteAllSavedUserActivitiesWithCompletionHandler:(id)a3;
+ (void)deleteSavedUserActivitiesWithPersistentIdentifiers:(id)a3 completionHandler:(id)a4;
+ (void)fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4;
+ (void)removeDynamicUserActivity:(id)a3 matching:(id)a4;
+ (void)removeUserActivityObserver:(id)a3;
+ (void)setIndexPending:(BOOL)a3 forUUID:(id)a4;
+ (void)unregisterForSuggestedActionNudgeOfType:(id)a3;
- (BOOL)_encodeIntoUserActivityStringWithSave:(BOOL)a3 options:(id)a4 completionHandler:(id)a5;
- (BOOL)activityHasBeenSentToServer;
- (BOOL)archiveURL:(id)a3 completionHandler:(id)a4;
- (BOOL)canCreateStreams;
- (BOOL)createUserActivityDataWithSaving:(BOOL)a3 options:(id)a4 completionHandler:(id)a5;
- (BOOL)createUserActivityStringsWithSaving:(BOOL)a3 options:(id)a4 completionHandler:(id)a5;
- (BOOL)createsNewUUIDIfSaved;
- (BOOL)dirty;
- (BOOL)encodedContainsUnsynchronizedCloudDocument;
- (BOOL)encodedFileProviderURL;
- (BOOL)finishUserInfoUpdate;
- (BOOL)forceImmediateSendToServer;
- (BOOL)forwardToCoreSpotlightIndexer;
- (BOOL)isCurrent;
- (BOOL)isEligibleForHandoff;
- (BOOL)isEligibleForPrediction;
- (BOOL)isEligibleForPublicIndexing;
- (BOOL)isEligibleForReminders;
- (BOOL)isEligibleForSearch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalidated;
- (BOOL)isPayloadDirty:(id)a3;
- (BOOL)isUniversalLink;
- (BOOL)needsSave;
- (BOOL)sendToServerPending;
- (BOOL)supportsContinuationStreams;
- (BOOL)userInfoContainsFileURLs;
- (CSSearchableItemAttributeSet)contentAttributeSet;
- (NSData)cachedEncodedUserInfo;
- (NSData)streamsData;
- (NSDate)expirationDate;
- (NSDate)madeCurrentDate;
- (NSDate)madeCurrentEndDate;
- (NSDate)madeInitiallyCurrentDate;
- (NSDate)sentToIndexerDate;
- (NSDictionary)options;
- (NSDictionary)userInfo;
- (NSError)decodeUserInfoError;
- (NSMutableDictionary)payloadDataCache;
- (NSMutableDictionary)payloadObjects;
- (NSMutableDictionary)payloadUpdateBlocks;
- (NSMutableSet)dirtyPayloadIdentifiers;
- (NSSet)keywords;
- (NSSet)requiredUserInfoKeys;
- (NSString)contentIdentifier;
- (NSString)contentUserAction;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)dynamicIdentifier;
- (NSString)persistentIdentifier;
- (NSString)subtitle;
- (NSString)targetContentIdentifier;
- (NSString)teamIdentifier;
- (NSString)title;
- (NSString)typeIdentifier;
- (NSURL)referrerURL;
- (NSURL)webpageURL;
- (NSUUID)originalUniqueIdentifier;
- (NSUUID)uniqueIdentifier;
- (NSUserActivity)parentUserActivity;
- (OS_dispatch_queue)willCallSaveSerializationQueue;
- (UAUserActivity)init;
- (UAUserActivity)initWithManager:(id)a3 userActivityInfo:(id)a4;
- (UAUserActivity)initWithTypeIdentifier:(id)a3;
- (UAUserActivity)initWithTypeIdentifier:(id)a3 dynamicIdentifier:(id)a4 options:(id)a5;
- (UAUserActivity)initWithTypeIdentifier:(id)a3 options:(id)a4;
- (UAUserActivity)initWithTypeIdentifier:(id)a3 suggestedActionType:(unint64_t)a4 options:(id)a5;
- (UAUserActivity)initWithUserActivityData:(id)a3 options:(id)a4;
- (UAUserActivity)initWithUserActivityStrings:(id)a3 optionalString:(id)a4 tertiaryData:(id)a5 options:(id)a6;
- (UAUserActivityDelegate)delegate;
- (UAUserActivityManager)manager;
- (double)madeCurrentInterval;
- (id)_encodeIntoUserActivityDataWithSave:(BOOL)a3 options:(id)a4 error:(id *)a5;
- (id)_encodeIntoUserActivityStringWithSave:(BOOL)a3 options:(id)a4 optionalString:(id *)a5 optionalData:(id *)a6 error:(id *)a7;
- (id)archiver:(id)a3 willEncodeObject:(id)a4;
- (id)callWillSaveDelegateIfDirtyAndPackageUpData:(BOOL)a3 options:(id)a4 clearDirty:(BOOL)a5;
- (id)callWillSaveDelegateIfDirtyAndPackageUpData:(BOOL)a3 options:(id)a4 clearDirty:(BOOL)a5 completionHandler:(id)a6;
- (id)contentAttributes;
- (id)contentType;
- (id)copyWithNewUUID:(BOOL)a3;
- (id)createUserActivityDataWithSaving:(BOOL)a3 options:(id)a4 error:(id *)a5;
- (id)createUserActivityStringsWithSaving:(BOOL)a3 options:(id)a4 optionalString:(id *)a5 data:(id *)a6 error:(id *)a7;
- (id)decodeUserInfo:(id)a3;
- (id)decodeUserInfo:(id)a3 options:(id)a4;
- (id)determineMatchingApplicationBundleIdentfierWithOptions:(id)a3;
- (id)encodeUserInfo:(id)a3;
- (id)encodeUserInfo:(id)a3 error:(id *)a4;
- (id)encodeUserInfo:(id)a3 options:(id)a4 error:(id *)a5;
- (id)initDynamicActivityWithTypeIdentifier:(id)a3 dynamicIdentifier:(id)a4 suggestedActionType:(unint64_t)a5 options:(id)a6;
- (id)objectForIdentifier:(id)a3;
- (id)payloadForIdentifier:(id)a3;
- (id)payloadIdentifiers;
- (id)payloadUpdateBlockForIdentifier:(id)a3;
- (id)stateString;
- (id)unarchiveURL:(id)a3 error:(id *)a4;
- (id)unarchiver:(id)a3 didDecodeObject:(id)a4;
- (id)userActivityInfoForSelfWithPayload:(BOOL)a3 options:(id)a4;
- (int64_t)priority;
- (unint64_t)beginUserInfoUpdate:(id)a3;
- (unint64_t)hash;
- (unint64_t)os_state_handler;
- (unint64_t)suggestedActionType;
- (unint64_t)userInfoChangeCount;
- (void)_setWebpageURL:(id)a3 throwOnFailure:(BOOL)a4;
- (void)addContentAttribute:(id)a3 forKey:(id)a4;
- (void)addKeywordsFromArray:(id)a3;
- (void)addUserInfoEntriesFromDictionary:(id)a3;
- (void)advertiser:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5;
- (void)becomeCurrent;
- (void)dealloc;
- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4;
- (void)didSynchronizeUserActivity;
- (void)getContinuationStreamsWithCompletionHandler:(id)a3;
- (void)indexActivity:(double)a3 forceIndexing:(BOOL)a4;
- (void)invalidate;
- (void)pinUserActivityWithCompletionHandler:(id)a3;
- (void)prepareUserActivityForLaunchingWithOptions:(id)a3 completionHandler:(id)a4;
- (void)removeContentAttribute:(id)a3;
- (void)resignCurrent;
- (void)scheduleSendUserActivityInfoToLSUserActivityd;
- (void)sendToCoreSpotlightIndexer;
- (void)sendUserActivityInfoToLSUserActivityd:(BOOL)a3 onAsyncQueue:(BOOL)a4;
- (void)setCachedEncodedUserInfo:(id)a3;
- (void)setCanCreateStreams:(BOOL)a3;
- (void)setContentAttributeSet:(id)a3;
- (void)setContentAttributes:(id)a3;
- (void)setContentType:(id)a3;
- (void)setContentUserAction:(id)a3;
- (void)setCreatesNewUUIDIfSaved:(BOOL)a3;
- (void)setDecodeUserInfoError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setDirty:(BOOL)a3 identifier:(id)a4;
- (void)setDirtyPayloadIdentifiers:(id)a3;
- (void)setDynamicIdentifier:(id)a3;
- (void)setEligibleForHandoff:(BOOL)a3;
- (void)setEligibleForPrediction:(BOOL)a3;
- (void)setEligibleForPublicIndexing:(BOOL)a3;
- (void)setEligibleForReminders:(BOOL)a3;
- (void)setEligibleForSearch:(BOOL)a3;
- (void)setEncodedContainsUnsynchronizedCloudDocument:(BOOL)a3;
- (void)setEncodedFileProviderURL:(BOOL)a3;
- (void)setExpirationDate:(id)a3;
- (void)setForceImmediateSendToServer:(BOOL)a3;
- (void)setKeywords:(id)a3;
- (void)setMadeCurrentDate:(id)a3;
- (void)setMadeCurrentEndDate:(id)a3;
- (void)setNeedsSave:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setParentUserActivity:(id)a3;
- (void)setPayload:(id)a3 object:(id)a4 identifier:(id)a5;
- (void)setPayload:(id)a3 object:(id)a4 identifier:(id)a5 dirty:(BOOL)a6;
- (void)setPayloadDataCache:(id)a3;
- (void)setPayloadIdentifier:(id)a3 object:(id)a4 withBlock:(id)a5;
- (void)setPayloadObjects:(id)a3;
- (void)setPayloadUpdateBlocks:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setReferrerURL:(id)a3;
- (void)setRequiredUserInfoKeys:(id)a3;
- (void)setSendToServerPending:(BOOL)a3;
- (void)setSentToIndexerDate:(id)a3;
- (void)setStreamsData:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSupportsContinuationStreams:(BOOL)a3;
- (void)setTargetContentIdentifier:(id)a3;
- (void)setTeamIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)setUniversalLink:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoContainsFileURLs:(BOOL)a3;
- (void)setWebpageURL:(id)a3;
- (void)synchronouslyEncodeUserInfo:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)tellDaemonAboutNewLSUserActivity;
- (void)updateForwardToCoreSpotlightIndexer:(char)a3;
- (void)willSynchronizeUserActivityWithHandler:(id)a3;
@end

@implementation UAUserActivity

- (id)copyWithNewUUID:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v5 = [UAUserActivity alloc];
  v6 = [(UAUserActivity *)self typeIdentifier];
  v7 = [(UAUserActivity *)self dynamicIdentifier];
  unint64_t v8 = [(UAUserActivity *)self suggestedActionType];
  v9 = [(UAUserActivity *)self options];
  v10 = [(UAUserActivity *)v5 initDynamicActivityWithTypeIdentifier:v6 dynamicIdentifier:v7 suggestedActionType:v8 options:v9];

  if ([(UAUserActivity *)self isInvalidated])
  {
    v11 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [(UAUserActivity *)self uniqueIdentifier];
      v13 = [v12 UUIDString];
      *(_DWORD *)buf = 138543362;
      v83 = v13;
      _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_ERROR, "copyWithNewUUID:%{public}@, unable to copy because this object has been invalidated.", buf, 0xCu);
    }
    v14 = 0;
LABEL_40:

    return v14;
  }
  if ([(UAUserActivity *)self needsSave]
    || ([(UAUserActivity *)self dirtyPayloadIdentifiers],
        v15 = objc_claimAutoreleasedReturnValue(),
        uint64_t v16 = [v15 count],
        v15,
        v16))
  {
    v17 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (v3) {
        v18 = "-callDelegate-";
      }
      else {
        v18 = "-noDelegateCall-";
      }
      v19 = [(UAUserActivity *)self uniqueIdentifier];
      v20 = [v19 UUIDString];
      *(_DWORD *)buf = 136446466;
      v83 = v18;
      __int16 v84 = 2114;
      v85 = v20;
      _os_log_impl(&dword_1B3DF6000, v17, OS_LOG_TYPE_DEBUG, "copyWithNewUUID:%{public}s (%{public}@), calling delegate because .needSave == YES or it has dirty payloads", buf, 0x16u);
    }
    v21 = self;
    objc_sync_enter(v21);
    BOOL needsSave = v21->_needsSave;
    *(_WORD *)&v21->_BOOL needsSave = 0;
    objc_sync_exit(v21);

    uint64_t v23 = [(UAUserActivity *)v21 delegate];
    v24 = (void *)v23;
    if (v3)
    {
      if (needsSave && v23 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v25 = [(UAUserActivity *)v21 willCallSaveSerializationQueue];
        dispatch_assert_queue_not_V2(v25);

        v26 = [(UAUserActivity *)v21 willCallSaveSerializationQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __44__UAUserActivity_Internal__copyWithNewUUID___block_invoke;
        block[3] = &unk_1E6082DA8;
        block[4] = v21;
        id v80 = v24;
        dispatch_sync(v26, block);
      }
    }
    else
    {

      v10 = 0;
    }
  }
  if (v10)
  {
    v10 = v10;
    objc_sync_enter(v10);
    v27 = self;
    objc_sync_enter(v27);
    v28 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = [(UAUserActivity *)v27 uniqueIdentifier];
      v30 = [v29 UUIDString];
      v31 = [v10 uniqueIdentifier];
      v32 = [v31 UUIDString];
      *(_DWORD *)buf = 138543618;
      v83 = v30;
      __int16 v84 = 2114;
      v85 = v32;
      _os_log_impl(&dword_1B3DF6000, v28, OS_LOG_TYPE_DEBUG, "copyWithNewUUID(%{public}@), copying all properties over to new object %{public}@", buf, 0x16u);
    }
    v33 = [(UAUserActivity *)v27 originalUniqueIdentifier];
    v34 = v33;
    if (v33)
    {
      id v35 = v33;
    }
    else
    {
      id v35 = [(UAUserActivity *)v27 uniqueIdentifier];
    }
    v36 = (void *)*((void *)v10 + 44);
    *((void *)v10 + 44) = v35;

    v37 = [(UAUserActivity *)v27 title];
    uint64_t v38 = [v37 copy];
    v39 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v38;

    v40 = [(UAUserActivity *)v27 userInfo];
    if (v40)
    {
      v41 = [(UAUserActivity *)v27 userInfo];
      BOOL v42 = [v41 count] == 0;

      if (!v42)
      {
        v43 = [(UAUserActivity *)v27 userInfo];
        uint64_t v44 = [v43 copy];
        v45 = (void *)*((void *)v10 + 36);
        *((void *)v10 + 36) = v44;
      }
    }
    uint64_t v46 = [(NSURL *)v27->_webpageURL copy];
    v47 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = v46;

    uint64_t v48 = [(NSURL *)v27->_referrerURL copy];
    v49 = (void *)*((void *)v10 + 4);
    *((void *)v10 + 4) = v48;

    v10[235] = 0;
    v10[109] = 0;
    *(_WORD *)(v10 + 107) = 0;
    v10[180] = [(UAUserActivity *)v27 isEligibleForHandoff];
    v10[183] = [(UAUserActivity *)v27 isEligibleForPublicIndexing];
    v10[181] = [(UAUserActivity *)v27 isEligibleForSearch];
    v10[182] = [(UAUserActivity *)v27 isEligibleForReminders];
    v10[184] = [(UAUserActivity *)v27 isEligibleForPrediction];
    uint64_t v50 = [(UAUserActivity *)v27 persistentIdentifier];
    v51 = (void *)*((void *)v10 + 24);
    *((void *)v10 + 24) = v50;

    v52 = [(UAUserActivity *)v27 keywords];
    uint64_t v53 = [v52 copy];
    v54 = (void *)*((void *)v10 + 16);
    *((void *)v10 + 16) = v53;

    v55 = [(UAUserActivity *)v27 requiredUserInfoKeys];
    uint64_t v56 = [v55 copy];
    v57 = (void *)*((void *)v10 + 19);
    *((void *)v10 + 19) = v56;

    v10[234] = [(UAUserActivity *)v27 isUniversalLink];
    v58 = [(UAUserActivity *)v27 contentUserAction];
    uint64_t v59 = [v58 copy];
    v60 = (void *)*((void *)v10 + 18);
    *((void *)v10 + 18) = v59;

    v61 = [(UAUserActivity *)v27 expirationDate];
    uint64_t v62 = [v61 copy];
    v63 = (void *)*((void *)v10 + 17);
    *((void *)v10 + 17) = v62;

    uint64_t v64 = [(UAUserActivity *)v27 madeCurrentDate];
    v65 = (void *)*((void *)v10 + 30);
    *((void *)v10 + 30) = v64;

    uint64_t v66 = [(UAUserActivity *)v27 madeCurrentEndDate];
    v67 = (void *)*((void *)v10 + 31);
    *((void *)v10 + 31) = v66;

    *((void *)v10 + 32) = *(void *)&v27->_madeCurrentInterval;
    objc_storeStrong((id *)v10 + 33, v27->_madeInitiallyCurrentDate);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v68 = [(UAUserActivity *)v27 payloadIdentifiers];
    uint64_t v69 = [v68 countByEnumeratingWithState:&v75 objects:v81 count:16];
    if (v69)
    {
      uint64_t v70 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v69; ++i)
        {
          if (*(void *)v76 != v70) {
            objc_enumerationMutation(v68);
          }
          v72 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          if (([v72 isEqual:@"UAUserActivityUserInfoPayload"] & 1) == 0
            && ([v72 isEqual:@"UAUserActivityStreamsPayload"] & 1) == 0)
          {
            v73 = [(UAUserActivity *)v27 payloadForIdentifier:v72];
            [v10 setPayload:v73 object:0 identifier:v72 dirty:0];
          }
        }
        uint64_t v69 = [v68 countByEnumeratingWithState:&v75 objects:v81 count:16];
      }
      while (v69);
    }

    *((void *)v10 + 25) = 0;
    v10[104] = 0;
    v10[106] = 0;
    objc_sync_exit(v27);

    objc_sync_exit(v10);
    v14 = v10;
    goto LABEL_40;
  }
  return 0;
}

- (NSDictionary)userInfo
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)[(NSDictionary *)v2->_userInfo copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (NSMutableSet)dirtyPayloadIdentifiers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 344, 1);
}

- (BOOL)forwardToCoreSpotlightIndexer
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_forwardToCoreSpotlightIndexerCount > 0 || [(UAUserActivity *)v2 isEligibleForSearch]) {
    char v3 = 1;
  }
  else {
    char v3 = [(UAUserActivity *)v2 isEligibleForPrediction];
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEligibleForSearch
{
  return self->_eligibleForSearch;
}

- (BOOL)isEligibleForPrediction
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL eligibleForPrediction = v2->_eligibleForPrediction;
  objc_sync_exit(v2);

  return eligibleForPrediction;
}

- (NSString)persistentIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (void *)[(NSString *)v2->_persistentIdentifier copy];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (NSString)title
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_title;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)userInfoContainsFileURLs
{
  return self->_userInfoContainsFileURLs;
}

- (BOOL)isEligibleForPublicIndexing
{
  return self->_eligibleForPublicIndexing;
}

- (NSSet)keywords
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (void *)[(NSSet *)v2->_keywords copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (NSDate)expirationDate
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_expirationDate;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEligibleForHandoff
{
  return self->_eligibleForHandoff;
}

- (NSSet)requiredUserInfoKeys
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (void *)[(NSSet *)v2->_requiredUserInfoKeys copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)isEligibleForReminders
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_eligibleForReminders || v2->_eligibleForSearch;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)contentUserAction
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_contentUserAction;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isUniversalLink
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL universalLink = v2->_universalLink;
  objc_sync_exit(v2);

  return universalLink;
}

- (NSString)teamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (BOOL)encodedFileProviderURL
{
  return self->_encodedFileProviderURL;
}

- (NSData)cachedEncodedUserInfo
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (NSUUID)originalUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 352, 1);
}

- (NSDate)madeCurrentEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
}

- (NSDate)madeCurrentDate
{
  return (NSDate *)objc_getProperty(self, a2, 240, 1);
}

- (UAUserActivity)initWithTypeIdentifier:(id)a3 suggestedActionType:(unint64_t)a4 options:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    trimmedString(v8, 0x80u);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = suggestedActionTypeString(a4);
    v13 = userActivityInfoOptionsDictionaryString(v9);
    int v17 = 138478339;
    id v18 = v11;
    __int16 v19 = 2114;
    v20 = v12;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_DEBUG, "CREATING UAUserActivity/initWithTypeIdentifier:%{private}@ type:%{public}@ options=%{public}@)", (uint8_t *)&v17, 0x20u);
  }
  if (!v8 || ![v8 length])
  {
    v14 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1B3DF6000, v14, OS_LOG_TYPE_ERROR, "*** UserActivity: passed nil or the empty string for activityType, which is an error.", (uint8_t *)&v17, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Caller did not provide an activityType, and this process does not have a NSUserActivityTypes in its Info.plist." format];
  }
  v15 = [(UAUserActivity *)self initDynamicActivityWithTypeIdentifier:v8 dynamicIdentifier:0 suggestedActionType:a4 options:v9];

  return v15;
}

- (void)setUserInfo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = (objc_object *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (differ((objc_object *)v5->_userInfo, v4))
  {
    ++v5->_userInfoChangeCount;
    savedUserInfo = v5->_savedUserInfo;
    v5->_savedUserInfo = 0;

    v7 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [(UAUserActivity *)v5 uniqueIdentifier];
      id v9 = [v8 UUIDString];
      unsigned int userInfoChangeCount = v5->_userInfoChangeCount;
      *(_DWORD *)buf = 138543875;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v25) = userInfoChangeCount;
      _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_DEBUG, "UAUserActivity:%{public}@/%{private}@, updating userInfoChangeCount to %d", buf, 0x1Cu);
    }
    if (v4)
    {
      if ((recurse(v4, &__block_literal_global) & 1) == 0 && dyld_program_sdk_at_least())
      {
        id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"userInfo contained an invalid object type" userInfo:0];
        objc_exception_throw(v19);
      }
      uint64_t v11 = [(objc_object *)v4 copy];
      userInfo = v5->_userInfo;
      v5->_userInfo = (NSDictionary *)v11;

      uint64_t v20 = 0;
      __int16 v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 0;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___ZL25dictionaryContainsFileURLP12NSDictionary_block_invoke;
      v25 = &unk_1E6082F60;
      v26 = &v20;
      recurse(v4, buf);
      int v13 = *((unsigned __int8 *)v21 + 24);
      _Block_object_dispose(&v20, 8);
      if ((v13 != 0) != [(UAUserActivity *)v5 userInfoContainsFileURLs])
      {
        [(UAUserActivity *)v5 setUserInfoContainsFileURLs:v13 != 0];
        if (!v5->_inWillSaveCallback) {
          [(UAUserActivity *)v5 sendUserActivityInfoToLSUserActivityd:1 onAsyncQueue:1];
        }
      }
      v14 = biomeInfoLogging();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = [(UAUserActivity *)v5 uniqueIdentifier];
        uint64_t v16 = [(objc_object *)v4 count];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v25) = v13;
        _os_log_impl(&dword_1B3DF6000, v14, OS_LOG_TYPE_INFO, "%{public}@ SET-USERINFO\tcount=%{public}ld %{BOOL}d", buf, 0x1Cu);
      }
      [(UAUserActivity *)v5 setDirty:1];
    }
    else
    {
      int v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      id v18 = v5->_userInfo;
      v5->_userInfo = v17;
    }
  }
  objc_sync_exit(v5);
}

- (id)initDynamicActivityWithTypeIdentifier:(id)a3 dynamicIdentifier:(id)a4 suggestedActionType:(unint64_t)a5 options:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v53 = a4;
  id v52 = a6;
  v10 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    trimmedString(v54, 0x80u);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      trimmedString(v53, 0x10u);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = &stru_1F0CB4508;
    }
    int v13 = suggestedActionTypeString(a5);
    v14 = userActivityInfoOptionsDictionaryString(v52);
    *(_DWORD *)buf = 138544131;
    id v60 = v11;
    __int16 v61 = 2113;
    uint64_t v62 = v12;
    __int16 v63 = 2114;
    uint64_t v64 = v13;
    __int16 v65 = 2114;
    uint64_t v66 = v14;
    _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_DEBUG, "CREATING UAUserActivity/(%{public}@-%{private}@ %{public}@ options=%{public}@)", buf, 0x2Au);
    if (v53) {
  }
    }
  if (!v54 || ![v54 length])
  {
    v15 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3DF6000, v15, OS_LOG_TYPE_ERROR, "*** UserActivity: passed nil or the empty string for activityType, which is an error.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Caller did not provide an activityType, and this process does not have a NSUserActivityTypes in its Info.plist." format];
  }
  v58.receiver = self;
  v58.super_class = (Class)UAUserActivity;
  uint64_t v16 = [(UAUserActivity *)&v58 init];
  if (v16)
  {
    id obj = [MEMORY[0x1E4F29128] UUID];
    int v17 = +[UAUserActivityManager defaultManager];
    objc_initWeak(&location, v17);

    id v18 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v16->_manager, v18);

    objc_initWeak(&from, v16);
    id v19 = dispatch_get_global_queue(0, 0);
    uint64_t v48 = &v55;
    objc_copyWeak(&v55, &from);
    id v20 = obj;
    uint64_t v21 = os_state_add_handler();

    v16->_os_state_handler = v21;
    uint64_t v22 = uaUserActivityObjectsMap();
    objc_sync_enter(v22);
    char v23 = uaUserActivityObjectsMap();
    id v24 = objc_loadWeakRetained(&from);
    [v23 setObject:v24 forKey:v20];

    objc_sync_exit(v22);
    v25 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    userInfo = v16->_userInfo;
    v16->_userInfo = v25;

    objc_storeStrong((id *)&v16->_uniqueIdentifier, obj);
    v16->_suggestedActionType = a5;
    uint64_t v27 = [v54 copy];
    typeIdentifier = v16->_typeIdentifier;
    v16->_typeIdentifier = (NSString *)v27;

    if (v53)
    {
      uint64_t v29 = objc_msgSend(v53, "copy", &v55);
      dynamicIdentifier = v16->_dynamicIdentifier;
      v16->_dynamicIdentifier = (NSString *)v29;
    }
    else
    {
      dynamicIdentifier = v16->_dynamicIdentifier;
      v16->_dynamicIdentifier = 0;
    }

    *(_WORD *)&v16->_BOOL needsSave = 1;
    v16->_sendToServerPending = 0;
    if (v52) {
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
    }
    else {
    uint64_t v50 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v31 = objc_msgSend(v50, "copy", v48);
    options = v16->_options;
    v16->_options = (NSDictionary *)v31;

    advertiser = v16->_advertiser;
    v16->_advertiser = 0;

    v16->_canCreateStreams = 0;
    resumerAdvertiser = v16->_resumerAdvertiser;
    v16->_resumerAdvertiser = 0;

    v16->_supportsContinuationStreams = 0;
    *(_WORD *)&v16->_BOOL needsSave = 1;
    v16->_sendToServerPending = 0;
    v16->_eligibleForHandoff = 1;
    id v35 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = [(UAUserActivity *)v16 typeIdentifier];
      trimmedString(v36, 0x80u);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = [(UAUserActivity *)v16 dynamicIdentifier];
      trimmedString(v38, 0x80u);
      v39 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v40 = [(UAUserActivity *)v16 uniqueIdentifier];
      v41 = [v40 UUIDString];
      BOOL v42 = suggestedActionTypeString([(UAUserActivity *)v16 suggestedActionType]);
      *(_DWORD *)buf = 138478595;
      id v60 = v37;
      __int16 v61 = 2113;
      uint64_t v62 = v39;
      __int16 v63 = 2114;
      uint64_t v64 = v41;
      __int16 v65 = 2114;
      uint64_t v66 = v42;
      _os_log_impl(&dword_1B3DF6000, v35, OS_LOG_TYPE_INFO, "initUAUserActivity:%{private}@-%{private}@ %{public}@ %{public}@", buf, 0x2Au);
    }
    v43 = biomeInfoLogging();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      uint64_t v44 = [(UAUserActivity *)v16 uniqueIdentifier];
      v45 = [(UAUserActivity *)v16 typeIdentifier];
      uint64_t v46 = [(UAUserActivity *)v16 dynamicIdentifier];
      *(_DWORD *)buf = 138543874;
      id v60 = v44;
      __int16 v61 = 2112;
      uint64_t v62 = v45;
      __int16 v63 = 2112;
      uint64_t v64 = v46;
      _os_log_impl(&dword_1B3DF6000, v43, OS_LOG_TYPE_INFO, "%{public}@ CREATED %@/%@", buf, 0x20u);
    }
    objc_destroyWeak(v49);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v16;
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (NSString)dynamicIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (unint64_t)suggestedActionType
{
  return self->_suggestedActionType;
}

- (void)setDirty:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v4 = self;
  objc_sync_enter(v4);
  BOOL dirty = v4->_dirty;
  if (v4->_inWillSaveCallback)
  {
    uint64_t v32 = 0;
    goto LABEL_31;
  }
  v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(UAUserActivity *)v4 uniqueIdentifier];
    uint64_t v7 = [v6 UUIDString];
    id v8 = (void *)v7;
    id v9 = @"NO";
    BOOL v10 = v4->_dirty;
    if (v3) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v38 = v7;
    __int16 v39 = 2114;
    if (v10) {
      id v9 = @"YES";
    }
    *(void *)v40 = v11;
    *(_WORD *)&v40[8] = 2114;
    uint64_t v41 = (uint64_t)v9;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "setDirty:(%{public}@) => %{public}@ (is currently %{public}@)", buf, 0x20u);
  }
  if ([(UAUserActivity *)v4 forceImmediateSendToServer])
  {
    BOOL v12 = 1;
  }
  else
  {
    if (!v4->_activityHasBeenSentToServer)
    {
      HIDWORD(v32) = 0;
      if (v3) {
        goto LABEL_15;
      }
LABEL_30:
      LODWORD(v32) = 0;
      goto LABEL_31;
    }
    BOOL v12 = v4->_dirty != v3;
  }
  HIDWORD(v32) = v12;
  if (!v3) {
    goto LABEL_30;
  }
LABEL_15:
  v4->_BOOL dirty = 1;
  [(UAUserActivity *)v4 setCachedEncodedUserInfo:0];
  if ([(UAUserActivity *)v4 forwardToCoreSpotlightIndexer])
  {
    int v13 = [(UAUserActivity *)v4 manager];
    LODWORD(v32) = [v13 userActivityIsActive:v4];
  }
  else
  {
    LODWORD(v32) = 0;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v14 = getUserActivityObserversCopy();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v19 = [(UAUserActivity *)v4 parentUserActivity];
        if (v19)
        {
          char v20 = objc_opt_respondsToSelector();

          if (v20)
          {
            uint64_t v21 = [(UAUserActivity *)v4 parentUserActivity];
            [v18 userActivityWasMadeDirty:v21];
          }
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v15);
  }

LABEL_31:
  objc_sync_exit(v4);

  uint64_t v22 = biomeInfoLogging();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    char v23 = [(UAUserActivity *)v4 uniqueIdentifier];
    BOOL v24 = [(UAUserActivity *)v4 forceImmediateSendToServer];
    *(_DWORD *)buf = 138544386;
    uint64_t v38 = (uint64_t)v23;
    __int16 v39 = 1024;
    *(_DWORD *)v40 = dirty;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = v24;
    LOWORD(v41) = 1024;
    *(_DWORD *)((char *)&v41 + 2) = HIDWORD(v32);
    HIWORD(v41) = 1024;
    int v42 = v32;
    _os_log_impl(&dword_1B3DF6000, v22, OS_LOG_TYPE_INFO, "%{public}@ SET-DIRTY\twasDirty=%{BOOL}d force=%{BOOL}d informServer=%{BOOL}d informIndex=%{BOOL}d", buf, 0x24u);
  }
  if (HIDWORD(v32))
  {
    if (v4->_createsNewUUIDIfSaved)
    {
      [(UAUserActivity *)v4 tellDaemonAboutNewLSUserActivity];
    }
    else
    {
      if ([(UAUserActivity *)v4 forceImmediateSendToServer])
      {
        [(UAUserActivity *)v4 setForceImmediateSendToServer:0];
        uint64_t v25 = 1;
      }
      else
      {
        uint64_t v25 = [(UAUserActivity *)v4 encodedContainsUnsynchronizedCloudDocument];
      }
      v26 = [(UAUserActivity *)v4 manager];
      [v26 markUserActivityAsDirty:v4 forceImmediate:v25];
    }
  }
  if (v32)
  {
    uint64_t v27 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = [(UAUserActivity *)v4 typeIdentifier];
      uint64_t v29 = [(UAUserActivity *)v4 uniqueIdentifier];
      v30 = [v29 UUIDString];
      *(_DWORD *)buf = 138478339;
      uint64_t v38 = (uint64_t)v28;
      __int16 v39 = 2114;
      *(void *)v40 = v30;
      *(_WORD *)&v40[8] = 2048;
      uint64_t v41 = 0x403E000000000000;
      _os_log_impl(&dword_1B3DF6000, v27, OS_LOG_TYPE_DEBUG, "sending %{private}@/%{public}@ to indexer within %f seconds because it is dirty.", buf, 0x20u);
    }
    [(UAUserActivity *)v4 indexActivity:1 forceIndexing:30.0];
  }
}

- (unint64_t)hash
{
  v2 = [(UAUserActivity *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (NSUserActivity)parentUserActivity
{
  unint64_t v3 = getUAUserActivityToNSUserActivityMap();
  objc_sync_enter(v3);
  v4 = [v3 objectForKey:self];
  objc_sync_exit(v3);

  return (NSUserActivity *)v4;
}

- (BOOL)forceImmediateSendToServer
{
  return self->_forceImmediateSendToServer;
}

- (UAUserActivityManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (UAUserActivityManager *)WeakRetained;
}

- (void)setCachedEncodedUserInfo:(id)a3
{
}

- (UAUserActivity)initWithTypeIdentifier:(id)a3 options:(id)a4
{
  return [(UAUserActivity *)self initWithTypeIdentifier:a3 suggestedActionType:1 options:a4];
}

+ (BOOL)supportsUserActivityAppLinks
{
  return 1;
}

- (double)madeCurrentInterval
{
  v2 = self;
  objc_sync_enter(v2);
  double madeCurrentInterval = v2->_madeCurrentInterval;
  objc_sync_exit(v2);

  return madeCurrentInterval;
}

- (void)invalidate
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(UAUserActivity *)self uniqueIdentifier];
    v5 = [v4 UUIDString];
    v6 = [(UAUserActivity *)self description];
    BOOL v7 = [(UAUserActivity *)self isInvalidated];
    id v8 = &stru_1F0CB4508;
    *(_DWORD *)buf = 138543875;
    long long v33 = v5;
    if (v7) {
      id v8 = @" (was already invalidated)";
    }
    __int16 v34 = 2113;
    *(void *)long long v35 = v6;
    *(_WORD *)&v35[8] = 2114;
    long long v36 = v8;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "Invalidate activity %{public}@ (%{private}@)%{public}@", buf, 0x20u);
  }
  if (![(UAUserActivity *)self isInvalidated])
  {
    id v9 = biomeInfoLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = [(UAUserActivity *)self uniqueIdentifier];
      id v11 = [(UAUserActivity *)self manager];
      int v12 = [v11 userActivityIsActive:self];
      BOOL needsSave = self->_needsSave;
      BOOL dirty = self->_dirty;
      BOOL activityHasBeenSentToServer = self->_activityHasBeenSentToServer;
      *(_DWORD *)buf = 138544386;
      long long v33 = v10;
      __int16 v34 = 1024;
      *(_DWORD *)long long v35 = v12;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = needsSave;
      LOWORD(v36) = 1024;
      *(_DWORD *)((char *)&v36 + 2) = dirty;
      HIWORD(v36) = 1024;
      BOOL v37 = activityHasBeenSentToServer;
      _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_INFO, "%{public}@ INVALIDATE\twasCurrent=%{BOOL}d needsSave=%{BOOL}d dirty=%{BOOL}d sendToServer=%{BOOL}d", buf, 0x24u);
    }
    uint64_t v16 = self;
    objc_sync_enter(v16);
    v16->_invalidated = 1;
    objc_sync_exit(v16);

    [(UAUserActivity *)v16 setDelegate:0];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    int v17 = getUserActivityObserversCopy();
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v27 + 1) + 8 * v20);
          uint64_t v22 = [(UAUserActivity *)v16 parentUserActivity];
          if (v22)
          {
            char v23 = objc_opt_respondsToSelector();

            if (v23)
            {
              BOOL v24 = [(UAUserActivity *)v16 parentUserActivity];
              [v21 userActivityWasInvalidated:v24];
            }
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }

    uint64_t v25 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__UAUserActivity_invalidate__block_invoke;
    block[3] = &unk_1E6082B60;
    block[4] = v16;
    dispatch_async(v25, block);
  }
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)finishUserInfoUpdate
{
  v2 = self;
  objc_sync_enter(v2);
  savedUserInfo = v2->_savedUserInfo;
  if (savedUserInfo)
  {
    objc_storeStrong((id *)&v2->_userInfo, v2->_savedUserInfo);
    v4 = v2->_savedUserInfo;
    v2->_savedUserInfo = 0;
  }
  objc_sync_exit(v2);

  return savedUserInfo == 0;
}

- (unint64_t)beginUserInfoUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_savedUserInfo)
  {
    objc_storeStrong((id *)&v5->_savedUserInfo, v5->_userInfo);
    if (v4) {
      uint64_t v6 = [v4 copy];
    }
    else {
      uint64_t v6 = 0;
    }
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v6;
  }
  unint64_t userInfoChangeCount = v5->_userInfoChangeCount;
  objc_sync_exit(v5);

  return userInfoChangeCount;
}

- (void)setContentAttributeSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = [(UAUserActivity *)v5 uniqueIdentifier];
    id v8 = [v7 UUIDString];
    int v17 = 138543619;
    uint64_t v18 = v8;
    __int16 v19 = 2113;
    id v20 = v4;
    _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_INFO, "setContentAttributeSet(%{public}@,%{private}@))", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v9 = [(UAUserActivity *)v5 objectForIdentifier:@"UAUserActivityContentAttributeSetPayloadKey"];
  BOOL v10 = (void *)v9;
  if (v4 || !v9)
  {
    if (v4 && !v9 || v4 && ([v4 isEqual:v9] & 1) == 0)
    {
      id v11 = biomeInfoLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = [(UAUserActivity *)v5 uniqueIdentifier];
        int v17 = 138543362;
        uint64_t v18 = v12;
        _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_INFO, "%{public}@ SETCONTENTATTRIBUTESET", (uint8_t *)&v17, 0xCu);
      }
      int v13 = (void *)[v4 copy];
      [(UAUserActivity *)v5 setPayloadIdentifier:@"UAUserActivityContentAttributeSetPayloadKey" object:v13 withBlock:&__block_literal_global_0];

      [(UAUserActivity *)v5 setDirty:1];
    }
  }
  else
  {
    [(UAUserActivity *)v5 setPayload:0 object:0 identifier:@"UAUserActivityContentAttributeSetPayloadKey"];
  }

  objc_sync_exit(v5);
  v14 = [(UAUserActivity *)v5 manager];
  int v15 = [v14 userActivityIsActive:v5];

  if (v15)
  {
    uint64_t v16 = [(UAUserActivity *)v5 manager];
    [v16 registerForApplicationDeactivateIfNecessary];

    [(UAUserActivity *)v5 indexActivity:1 forceIndexing:0.5];
  }
}

- (void)setTitle:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_object *)a3;
  v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(UAUserActivity *)self uniqueIdentifier];
    BOOL v7 = [v6 UUIDString];
    int v15 = 138543362;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "setTitle(%{public}@)", (uint8_t *)&v15, 0xCu);
  }
  id v8 = self;
  objc_sync_enter(v8);
  if (differ(v4, (objc_object *)v8->_title))
  {
    uint64_t v9 = biomeInfoLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = [(UAUserActivity *)v8 uniqueIdentifier];
      int v15 = 138543362;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_INFO, "%{public}@ SET-TITLE", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v11 = copyNSStringOrSubclass((NSString *)&v4->isa);
    title = v8->_title;
    v8->_title = (NSString *)v11;

    [(UAUserActivity *)v8 setDirty:1];
    int v13 = [(UAUserActivity *)v8 manager];
    int v14 = [v13 userActivityIsActive:v8];

    if (v14) {
      [(UAUserActivity *)v8 indexActivity:1 forceIndexing:0.5];
    }
  }
  objc_sync_exit(v8);
}

- (void)setParentUserActivity:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getUAUserActivityToNSUserActivityMap();
  objc_sync_enter(v5);
  [v5 setObject:v4 forKey:self];
  objc_sync_exit(v5);
  if (v4)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    if (!v6->_userActivityWasCreatedSent)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      BOOL v7 = getUserActivityObserversCopy();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v13;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v11, "userActivityWasCreated:", v4, (void)v12);
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
    objc_sync_exit(v6);
  }
}

- (void)setPayloadIdentifier:(id)a3 object:(id)a4 withBlock:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v23)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    if (v9)
    {
      if (v8)
      {
        uint64_t v11 = [(UAUserActivity *)v10 payloadObjects];

        if (!v11)
        {
          long long v12 = [MEMORY[0x1E4F1CA60] dictionary];
          [(UAUserActivity *)v10 setPayloadObjects:v12];
        }
        long long v13 = [(UAUserActivity *)v10 payloadObjects];
        [v13 setObject:v8 forKey:v23];
      }
      else
      {
        long long v13 = [(UAUserActivity *)v10 payloadObjects];
        [v13 removeObjectForKey:v23];
      }

      __int16 v19 = [(UAUserActivity *)v10 payloadUpdateBlocks];

      if (!v19)
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(UAUserActivity *)v10 setPayloadUpdateBlocks:v20];
      }
      uint64_t v21 = [(UAUserActivity *)v10 payloadUpdateBlocks];
      uint64_t v22 = _Block_copy(v9);
      [v21 setObject:v22 forKey:v23];

      [(UAUserActivity *)v10 setDirty:1 identifier:v23];
    }
    else
    {
      long long v14 = [(UAUserActivity *)v10 payloadObjects];
      [v14 removeObjectForKey:v23];

      long long v15 = [(UAUserActivity *)v10 payloadUpdateBlocks];
      uint64_t v16 = [v15 objectForKey:v23];

      if (v16)
      {
        uint64_t v17 = [(UAUserActivity *)v10 payloadUpdateBlocks];
        [v17 removeObjectForKey:v23];
      }
      uint64_t v18 = [(UAUserActivity *)v10 dirtyPayloadIdentifiers];
      [v18 removeObject:v23];
    }
    objc_sync_exit(v10);
  }
}

- (CSSearchableItemAttributeSet)contentAttributeSet
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(UAUserActivity *)v2 objectForIdentifier:@"UAUserActivityContentAttributeSetPayloadKey"];
  if (!v3)
  {
    id v4 = [(UAUserActivity *)v2 payloadForIdentifier:@"UAUserActivityContentAttributeSetPayloadKey"];
    if (v4)
    {
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
      getCSSearchableItemAttributeSetClass();
      unint64_t v3 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];

      if (v3) {
        [(UAUserActivity *)v2 setContentAttributeSet:v3];
      }
    }
    else
    {
      unint64_t v3 = 0;
    }
  }
  objc_sync_exit(v2);

  return (CSSearchableItemAttributeSet *)v3;
}

- (id)objectForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(UAUserActivity *)v5 payloadObjects];
  BOOL v7 = [v6 objectForKey:v4];

  objc_sync_exit(v5);

  return v7;
}

- (NSMutableDictionary)payloadObjects
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 360, 1);
}

- (id)payloadIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(UAUserActivity *)v2 payloadUpdateBlocks];
  v5 = [v4 allKeys];
  uint64_t v6 = [v3 setWithArray:v5];

  BOOL v7 = [(UAUserActivity *)v2 payloadDataCache];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = [(UAUserActivity *)v2 payloadDataCache];
    uint64_t v10 = [v9 allKeys];
    uint64_t v11 = [v6 setByAddingObjectsFromArray:v10];

    uint64_t v6 = (void *)v11;
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)payloadForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__4;
  __int16 v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(UAUserActivity *)v5 payloadUpdateBlocks];
    BOOL v7 = [v6 objectForKey:v4];

    if (v7)
    {
      uint64_t v8 = [(UAUserActivity *)v5 objectForIdentifier:v4];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __77__UAUserActivity_UAUserActivityPayloadServicesSupport__payloadForIdentifier___block_invoke;
      v14[3] = &unk_1E6083B20;
      v14[4] = v5;
      v14[5] = &v15;
      ((void (**)(void, UAUserActivity *, void *, id, void *))v7)[2](v7, v5, v8, v4, v14);
    }
    else
    {
      uint64_t v8 = [(UAUserActivity *)v5 payloadDataCache];
      uint64_t v10 = [v8 objectForKey:v4];
      uint64_t v11 = (void *)v16[5];
      v16[5] = v10;
    }
    objc_sync_exit(v5);

    id v9 = (void *)v16[5];
  }
  else
  {
    id v9 = 0;
  }
  id v12 = v9;
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (NSMutableDictionary)payloadUpdateBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 368, 1);
}

- (NSMutableDictionary)payloadDataCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 376, 1);
}

+ (BOOL)checkWebpageURL:(id)a3 actionType:(unint64_t)a4 throwIfFailed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = v8;
  uint64_t v10 = 0;
  char v11 = 1;
  if (v8 && a4 != 10)
  {
    id v12 = [v8 scheme];
    long long v13 = [v12 lowercaseString];
    uint64_t v10 = (void *)[v13 copy];

    if (v10)
    {
      long long v14 = [a1 allowedWebpageURLSchemes];
      char v11 = [v14 containsObject:v10];

      if (v11) {
        goto LABEL_8;
      }
    }
    else
    {
      char v11 = 0;
    }
    if (v5)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = [NSString stringWithFormat:@"NSUserActivity.webpageURL scheme \"%@\" is not allowed.", v10];
      id v18 = [v16 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];

      objc_exception_throw(v18);
    }
  }
LABEL_8:

  return v11;
}

void __85__UAUserActivity_UAUserActivityCoreSpotlightIndexingSupport__setContentAttributeSet___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v12 encodeObject:v9 forKey:*MEMORY[0x1E4F284E8]];
  [v12 finishEncoding];
  long long v13 = [v12 encodedData];
  (*((void (**)(id, id, void *, void, void))v11 + 2))(v11, v10, v13, 0, 0);
}

void __77__UAUserActivity_UAUserActivityPayloadServicesSupport__payloadForIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v12 = a2;
  id v9 = a3;
  if (!a4 || !*a4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  id v10 = [*(id *)(a1 + 32) dirtyPayloadIdentifiers];
  id v11 = v10;
  if (a5) {
    [v10 addObject:v12];
  }
  else {
    [v10 removeObject:v12];
  }
}

- (void)setDirty:(BOOL)a3 identifier:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (v4)
  {
    BOOL v7 = [(UAUserActivity *)v6 dirtyPayloadIdentifiers];

    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F1CA80] set];
      [(UAUserActivity *)v6 setDirtyPayloadIdentifiers:v8];
    }
    id v9 = [(UAUserActivity *)v6 dirtyPayloadIdentifiers];
    [v9 addObject:v10];
  }
  else
  {
    id v9 = [(UAUserActivity *)v6 dirtyPayloadIdentifiers];
    [v9 removeObject:v10];
  }

  objc_sync_exit(v6);
}

- (void)setPayloadUpdateBlocks:(id)a3
{
}

- (void)setPayloadObjects:(id)a3
{
}

- (void)setDirtyPayloadIdentifiers:(id)a3
{
}

- (NSString)targetContentIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_targetContentIdentifier;
  objc_sync_exit(v2);

  return v3;
}

+ (void)addUserActivityObserver:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    if (getUserActivityObservers(BOOL)::sOnce != -1) {
      dispatch_once(&getUserActivityObservers(BOOL)::sOnce, &__block_literal_global_904);
    }
    id v4 = (id)getUserActivityObservers(BOOL)::sResult;
    objc_sync_enter(v4);
    [v4 addObject:v5];
    objc_sync_exit(v4);

    id v3 = v5;
  }
}

- (BOOL)createUserActivityStringsWithSaving:(BOOL)a3 options:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6 && [(UAUserActivity *)self needsSave])
  {
    id v10 = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __112__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityStringsWithSaving_options_completionHandler___block_invoke;
    v13[3] = &unk_1E6082F38;
    v13[4] = self;
    BOOL v16 = v6;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v10, v13);

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = [(UAUserActivity *)self _encodeIntoUserActivityStringWithSave:0 options:v8 completionHandler:v9];
  }

  return v11;
}

- (void)sendToCoreSpotlightIndexer
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  getCSSearchableIndexClass();
  if (objc_opt_respondsToSelector())
  {
    id v3 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(UAUserActivity *)self uniqueIdentifier];
      id v5 = [v4 UUIDString];
      BOOL v6 = [(UAUserActivity *)self typeIdentifier];
      BOOL v7 = [(UAUserActivity *)self payloadForIdentifier:@"UAUserActivityContentAttributeSetPayloadKey"];
      if (v7)
      {
        id v8 = [(UAUserActivity *)self payloadForIdentifier:@"UAUserActivityContentAttributeSetPayloadKey"];
        trimmedHexStringForData(v8, 64);
      }
      else
      {
        id v8 = [(UAUserActivity *)self contentAttributeSet];
        stringForContentSet(v8);
      id v9 = };
      int v15 = 138543875;
      BOOL v16 = v5;
      __int16 v17 = 2113;
      id v18 = v6;
      __int16 v19 = 2113;
      id v20 = v9;
      _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_INFO, "INDEXING:%{public}@/%{private}@, attrs=%{private}@", (uint8_t *)&v15, 0x20u);
    }
    id v10 = biomeInfoLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = [(UAUserActivity *)self uniqueIdentifier];
      int v15 = 138543362;
      BOOL v16 = v11;
      _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_INFO, "%{public}@ SENDTOCORESPOTLIGHT", (uint8_t *)&v15, 0xCu);
    }
    id v12 = [(id)getCSSearchableIndexClass() defaultSearchableIndex];
    if (objc_opt_respondsToSelector())
    {
      long long v13 = (void *)[objc_alloc((Class)getNSUserActivityClass()) initWithInternalUserActivity:self];
      [v12 indexUserActivity:v13];
      id v14 = [(UAUserActivity *)self manager];
      [v14 registerForApplicationDeactivateIfNecessary];
    }
  }
}

+ (id)_encodeKeyAndValueIntoString:(id)a3 value:(id)a4
{
  id v6 = a3;
  BOOL v7 = [a1 _encodeToString:a4];
  id v8 = [a1 _encodeToString:v6];
  id v9 = v8;
  id v10 = &stru_1F0CB4508;
  if (v8 && v7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s=%s", objc_msgSend(v8, "UTF8String"), objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)_encodeToString:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  if (v46)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      id v5 = NSString;
      id v6 = [v46 stringByAddingPercentEncodingWithAllowedCharacters:v4];
      uint64_t v7 = [v5 stringWithFormat:@"'%@'", v6];
LABEL_4:
      id v8 = (__CFString *)v7;

LABEL_5:
      goto LABEL_44;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v10 = v46;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v61 count:16];
      if (v11)
      {
        char v12 = 0;
        uint64_t v13 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v56 != v13) {
              objc_enumerationMutation(v10);
            }
            int v15 = +[UAUserActivity _encodeToString:*(void *)(*((void *)&v55 + 1) + 8 * i)];
            if (v12) {
              [v9 appendString:@","];
            }
            [v9 appendString:v15];

            char v12 = 1;
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v61 count:16];
        }
        while (v11);
      }

      [v9 appendString:@""]);
      id v8 = (__CFString *)[v9 copy];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v16 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"{(");
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        __int16 v17 = [v46 allObjects];
        id v18 = sortedArrayIfSameClass(v17);

        uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v19)
        {
          char v20 = 0;
          uint64_t v21 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v52 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = [a1 _encodeToString:*(void *)(*((void *)&v51 + 1) + 8 * j)];
              if (v20) {
                [v16 appendString:@","];
              }
              [v16 appendString:v23];

              char v20 = 1;
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v60 count:16];
          }
          while (v19);
        }

        [v16 appendString:@"}"]);
        id v8 = (__CFString *)[v16 copy];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v24 = [MEMORY[0x1E4F28E78] stringWithString:@"{"];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          uint64_t v25 = [v46 allKeys];
          v26 = sortedArrayIfSameClass(v25);

          id obj = v26;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v59 count:16];
          if (v27)
          {
            char v28 = 0;
            uint64_t v29 = *(void *)v48;
            do
            {
              for (uint64_t k = 0; k != v27; ++k)
              {
                if (*(void *)v48 != v29) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v31 = *(void *)(*((void *)&v47 + 1) + 8 * k);
                uint64_t v32 = [v46 objectForKey:v31];
                if (v28) {
                  [v24 appendString:@","];
                }
                long long v33 = [a1 _encodeToString:v32];
                id v34 = [a1 _encodeToString:v31];
                uint64_t v35 = [v34 UTF8String];
                id v36 = v33;
                objc_msgSend(v24, "appendFormat:", @"%s=%s", v35, objc_msgSend(v36, "UTF8String"));

                char v28 = 1;
              }
              v26 = obj;
              uint64_t v27 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
            }
            while (v27);
          }

          [v24 appendString:@"}"];
          id v8 = (__CFString *)[v24 copy];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v8 = [v46 stringValue];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              BOOL v37 = NSString;
              id v38 = [v46 base64EncodedStringWithOptions:0];
              objc_msgSend(v37, "stringWithFormat:", @"$%s$", objc_msgSend(v38, "UTF8String"));
              id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
                [v4 setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
                v40 = NSString;
                id v6 = [v4 stringFromDate:v46];
                uint64_t v7 = [v40 stringWithFormat:@"^d%@^", v6];
                goto LABEL_4;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v4 = [v46 absoluteString];
                uint64_t v41 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789."];
                int v42 = NSString;
                v43 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v41];
                id v8 = [v42 stringWithFormat:@"^url^%@%%%%^", v43];

                goto LABEL_5;
              }
              id v44 = [MEMORY[0x1E4F1CA98] null];

              if (v44 == v46) {
                id v8 = @"--";
              }
              else {
                id v8 = 0;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_44:

  return v8;
}

- (void)setOptions:(id)a3
{
}

- (void)setEncodedContainsUnsynchronizedCloudDocument:(BOOL)a3
{
  self->_encodedContainsUnsynchronizedCloudDocument = a3;
}

- (NSDate)sentToIndexerDate
{
  return (NSDate *)objc_getProperty(self, a2, 272, 1);
}

- (NSDate)madeInitiallyCurrentDate
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setNeedsSave:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  if (!v4->_inWillSaveCallback)
  {
    if ([(UAUserActivity *)v4 forceImmediateSendToServer])
    {
      char v12 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = [(UAUserActivity *)v4 uniqueIdentifier];
        id v14 = [v13 UUIDString];
        *(_DWORD *)char v28 = 138543362;
        *(void *)&v28[4] = v14;
        _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_DEBUG, "setNeedsSave:(%{public}@), since self.forceImmediateSendToServer == YES doing an immediate call to the server to mark this item as dirty.", v28, 0xCu);
      }
      int v15 = biomeInfoLogging();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        BOOL v16 = [(UAUserActivity *)v4 uniqueIdentifier];
        BOOL needsSave = v4->_needsSave;
        *(_DWORD *)char v28 = 138544130;
        *(void *)&v28[4] = v16;
        *(_WORD *)&v28[12] = 1024;
        *(_DWORD *)&v28[14] = v3;
        *(_WORD *)&v28[18] = 1024;
        *(_DWORD *)&v28[20] = needsSave;
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = 1;
        _os_log_impl(&dword_1B3DF6000, v15, OS_LOG_TYPE_INFO, "%{public}@ SET-NEEDSSAVE\t%{BOOL}d was=%{BOOL}d force=%{BOOL}d", v28, 0x1Eu);
      }
      v4->_BOOL needsSave = v3;
      [(UAUserActivity *)v4 setForceImmediateSendToServer:0];
    }
    else
    {
      if (v4->_needsSave == v3) {
        goto LABEL_29;
      }
      id v18 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = [(UAUserActivity *)v4 uniqueIdentifier];
        uint64_t v20 = [v19 UUIDString];
        uint64_t v21 = (void *)v20;
        uint64_t v22 = "NO";
        BOOL v23 = v4->_needsSave;
        if (v3) {
          BOOL v24 = "YES";
        }
        else {
          BOOL v24 = "NO";
        }
        *(_DWORD *)char v28 = 138543874;
        *(void *)&v28[4] = v20;
        *(_WORD *)&v28[12] = 2082;
        if (v23) {
          uint64_t v22 = "YES";
        }
        *(void *)&v28[14] = v24;
        *(_WORD *)&v28[22] = 2082;
        uint64_t v29 = v22;
        _os_log_impl(&dword_1B3DF6000, v18, OS_LOG_TYPE_DEBUG, "setNeedsSave:(%{public}@ => %{public}s, (was %{public}s) and .BOOL dirty = YES", v28, 0x20u);
      }
      uint64_t v25 = biomeInfoLogging();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = [(UAUserActivity *)v4 uniqueIdentifier];
        BOOL v27 = v4->_needsSave;
        *(_DWORD *)char v28 = 138543874;
        *(void *)&v28[4] = v26;
        *(_WORD *)&v28[12] = 1024;
        *(_DWORD *)&v28[14] = v3;
        *(_WORD *)&v28[18] = 1024;
        *(_DWORD *)&v28[20] = v27;
        _os_log_impl(&dword_1B3DF6000, v25, OS_LOG_TYPE_INFO, "%{public}@ SET-NEEDSSAVE\t%{BOOL}d was=%{BOOL}d", v28, 0x18u);
      }
      v4->_BOOL needsSave = v3;
    }
    -[UAUserActivity setDirty:](v4, "setDirty:", 1, *(_OWORD *)v28);
    goto LABEL_29;
  }
  id v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(UAUserActivity *)v4 uniqueIdentifier];
    uint64_t v7 = [v6 UUIDString];
    id v8 = (void *)v7;
    id v9 = "NO";
    needsSaveValueAtEndOfWillSaveCallbacuint64_t k = v4->_needsSaveValueAtEndOfWillSaveCallback;
    if (v3) {
      uint64_t v11 = "YES";
    }
    else {
      uint64_t v11 = "NO";
    }
    *(_DWORD *)char v28 = 138543874;
    *(void *)&v28[4] = v7;
    *(_WORD *)&v28[12] = 2082;
    if (needsSaveValueAtEndOfWillSaveCallback) {
      id v9 = "YES";
    }
    *(void *)&v28[14] = v11;
    *(_WORD *)&v28[22] = 2082;
    uint64_t v29 = v9;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "setNeedsSave:(%{public}@) => %{public}s, but in willSave callback, so setting _needsSaveValueAtEndOfWillSaveCallback (was %{public}s", v28, 0x20u);
  }
  if (v3) {
    v4->_needsSaveValueAtEndOfWillSaveCallbacuint64_t k = 1;
  }
LABEL_29:
  objc_sync_exit(v4);
}

- (void)resignCurrent
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(UAUserActivity *)self uniqueIdentifier];
    id v5 = [v4 UUIDString];
    id v6 = [(UAUserActivity *)self manager];
    int v7 = [v6 userActivityIsActive:self];
    BOOL v8 = [(UAUserActivity *)self isInvalidated];
    id v9 = &stru_1F0CB4508;
    id v10 = @" (was current)";
    if (!v7) {
      id v10 = &stru_1F0CB4508;
    }
    *(_DWORD *)buf = 138543874;
    id v37 = v5;
    __int16 v38 = 2114;
    *(void *)__int16 v39 = v10;
    if (v8) {
      id v9 = @"(invalidated)";
    }
    *(_WORD *)&v39[8] = 2114;
    v40 = v9;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "uuid=%{public}@%{public}@%{public}@", buf, 0x20u);
  }
  uint64_t v11 = self;
  objc_sync_enter(v11);
  char v12 = [(UAUserActivity *)v11 manager];
  int v13 = [v12 userActivityIsActive:v11];

  id v14 = biomeInfoLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = [(UAUserActivity *)v11 uniqueIdentifier];
    BOOL needsSave = v11->_needsSave;
    BOOL dirty = v11->_dirty;
    BOOL activityHasBeenSentToServer = v11->_activityHasBeenSentToServer;
    *(_DWORD *)buf = 138544386;
    id v37 = v15;
    __int16 v38 = 1024;
    *(_DWORD *)__int16 v39 = v13;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = needsSave;
    LOWORD(v40) = 1024;
    *(_DWORD *)((char *)&v40 + 2) = dirty;
    HIWORD(v40) = 1024;
    BOOL v41 = activityHasBeenSentToServer;
    _os_log_impl(&dword_1B3DF6000, v14, OS_LOG_TYPE_INFO, "%{public}@ RESIGNCURRENT\twas=%{BOOL}d needsSave=%{BOOL}d dirty=%{BOOL}d sendToServer=%{BOOL}d", buf, 0x24u);
  }
  if (v13)
  {
    uint64_t v19 = objc_opt_new();
    madeCurrentEndDate = v11->_madeCurrentEndDate;
    v11->_madeCurrentEndDate = (NSDate *)v19;

    [(NSDate *)v11->_madeCurrentEndDate timeIntervalSinceDate:v11->_madeInitiallyCurrentDate];
    v11->_double madeCurrentInterval = v21 + v11->_madeCurrentInterval;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v22 = getUserActivityObserversCopy();
    uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v22);
          }
          v26 = *(void **)(*((void *)&v31 + 1) + 8 * v25);
          BOOL v27 = [(UAUserActivity *)v11 parentUserActivity];
          if (v27)
          {
            char v28 = objc_opt_respondsToSelector();

            if (v28)
            {
              uint64_t v29 = [(UAUserActivity *)v11 parentUserActivity];
              [v26 userActivityDidBecomeCurrent:v29 current:0];
            }
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v23);
    }
  }
  uint64_t v30 = [(UAUserActivity *)v11 manager];
  [v30 makeInactive:v11];

  objc_sync_exit(v11);
}

- (void)setExpirationDate:(id)a3
{
  int v7 = (objc_object *)a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (differ(v7, (objc_object *)v4->_expirationDate))
  {
    uint64_t v5 = [(objc_object *)v7 copy];
    expirationDate = v4->_expirationDate;
    v4->_expirationDate = (NSDate *)v5;

    [(UAUserActivity *)v4 setForceImmediateSendToServer:1];
    [(UAUserActivity *)v4 setDirty:1];
  }
  objc_sync_exit(v4);
}

void __79__UAUserActivity_Internal__sendUserActivityInfoToLSUserActivityd_onAsyncQueue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1B3EC6EB0]();
  [*(id *)(a1 + 32) sendUserActivityInfoToLSUserActivityd:*(unsigned __int8 *)(a1 + 40) onAsyncQueue:0];
}

- (void)setEligibleForSearch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_eligibleForSearch != v3)
  {
    uint64_t v5 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [(UAUserActivity *)v4 uniqueIdentifier];
      uint64_t v7 = [v6 UUIDString];
      BOOL v8 = (void *)v7;
      id v9 = "NO";
      if (v3) {
        id v9 = "YES";
      }
      int v12 = 138543618;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      int v15 = v9;
      _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "setEligibleForSearch(%{public}@)=%s", (uint8_t *)&v12, 0x16u);
    }
    v4->_eligibleForSearch = v3;
  }
  if (v3)
  {
    id v10 = [(UAUserActivity *)v4 manager];
    int v11 = [v10 userActivityIsActive:v4];

    if (v11) {
      [(UAUserActivity *)v4 indexActivity:1 forceIndexing:0.0];
    }
  }
  objc_sync_exit(v4);
}

+ (id)currentUserActivityUUID
{
  v2 = +[UAUserActivityManager defaultManager];
  BOOL v3 = [v2 activeUserActivityUUID];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UAUserActivity *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(UAUserActivity *)self uniqueIdentifier];
    uint64_t v7 = [(UAUserActivity *)v5 uniqueIdentifier];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

void __90__UAUserActivity_UAUserActivityCoreSpotlightIndexingSupport__indexActivity_forceIndexing___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1B3EC6EB0]();
  if (+[UAUserActivity isIndexPendingForUUID:*(void *)(a1 + 32)])
  {
    BOOL v3 = [*(id *)(a1 + 40) userActivityForUUID:*(void *)(a1 + 32)];
    id v4 = v3;
    if (v3
      && ([v3 isInvalidated] & 1) == 0
      && [v4 forwardToCoreSpotlightIndexer]
      && [*(id *)(a1 + 40) userActivityIsActive:v4])
    {
      v4[114] = 1;
      uint64_t v5 = (void *)[v4 copyWithNewUUID:1];
      [v5 setEligibleForHandoff:0];
      v4[114] = 0;
      id v6 = biomeInfoLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [*(id *)(a1 + 48) uniqueIdentifier];
        char v8 = [v5 uniqueIdentifier];
        int v10 = 138543618;
        int v11 = v7;
        __int16 v12 = 2114;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_INFO, "%{public}@ COPYFORINDEXING %{public}@", (uint8_t *)&v10, 0x16u);
      }
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v5 setSentToIndexerDate:v9];

      [v5 sendToCoreSpotlightIndexer];
    }
  }
  +[UAUserActivity setIndexPending:0 forUUID:*(void *)(a1 + 32)];
}

- (void)setEligibleForHandoff:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_eligibleForHandoff != v3)
  {
    obj->_eligibleForHandoff = v3;
    [(UAUserActivity *)obj setDirty:1];
    [(UAUserActivity *)obj setForceImmediateSendToServer:1];
    id v4 = [(UAUserActivity *)obj manager];
    int v5 = [v4 userActivityIsActive:obj];

    if (v5) {
      [(UAUserActivity *)obj scheduleSendUserActivityInfoToLSUserActivityd];
    }
  }
  objc_sync_exit(obj);
}

- (void)setForceImmediateSendToServer:(BOOL)a3
{
  self->_forceImmediateSendToServer = a3;
}

- (void)dealloc
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = biomeInfoLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(UAUserActivity *)self uniqueIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v4;
    __int16 v25 = 2050;
    unint64_t v26 = [(UAUserActivity *)self userInfoChangeCount];
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_INFO, "%{public}@ RELEASED changeCount=%{public}ld", buf, 0x16u);
  }
  int v5 = [(UAUserActivity *)self manager];
  [v5 removeUserActivity:self];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = getUserActivityObserversCopy();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        int v11 = [(UAUserActivity *)self parentUserActivity];
        if (v11)
        {
          char v12 = objc_opt_respondsToSelector();

          if (v12)
          {
            uint64_t v13 = [(UAUserActivity *)self parentUserActivity];
            [v10 userActivityWillBeDestroyed:v13];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  setIndexPendingForUUID(0, self->_uniqueIdentifier);
  uint64_t v14 = self;
  objc_sync_enter(v14);
  int v15 = uaUserActivityObjectsMap();
  objc_sync_enter(v15);
  uint64_t v16 = uaUserActivityObjectsMap();
  [v16 removeObjectForKey:self->_uniqueIdentifier];

  objc_sync_exit(v15);
  objc_sync_exit(v14);

  if (v14->_os_state_handler)
  {
    os_state_remove_handler();
    v14->_os_state_handler = 0;
  }
  objc_storeWeak((id *)&v14->_manager, 0);
  v14->_delegate = 0;
  v17.receiver = v14;
  v17.super_class = (Class)UAUserActivity;
  [(UAUserActivity *)&v17 dealloc];
}

- (void)indexActivity:(double)a3 forceIndexing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [(UAUserActivity *)self uniqueIdentifier];
    uint64_t v9 = [v8 UUIDString];
    int v10 = "NO";
    *(_DWORD *)buf = 138543874;
    v40 = v9;
    if (v4) {
      int v10 = "YES";
    }
    __int16 v41 = 2048;
    double v42 = a3;
    __int16 v43 = 2082;
    id v44 = v10;
    _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_INFO, "indexActivity(%{public}@} delay=%f forceIndexing:%{public}s", buf, 0x20u);
  }
  if (self->_indexInProcess)
  {
    int v11 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      char v12 = [(UAUserActivity *)self uniqueIdentifier];
      uint64_t v13 = [v12 UUIDString];
      *(_DWORD *)buf = 138543362;
      v40 = v13;
      _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_DEBUG, "indexActivity: %{public}@, _indexInProcess == YES so doing nothing.,", buf, 0xCu);
    }
  }
  else if ([(UAUserActivity *)self forwardToCoreSpotlightIndexer] {
         && (v4
  }
          || [(UAUserActivity *)self dirty]
          && (a3 <= 0.0
           || ([(UAUserActivity *)self uniqueIdentifier],
               unint64_t v26 = objc_claimAutoreleasedReturnValue(),
               BOOL v27 = +[UAUserActivity isIndexPendingForUUID:v26], v26, !v27))))
  {
    int v11 = [(UAUserActivity *)self manager];
    uint64_t v14 = [(UAUserActivity *)self uniqueIdentifier];
    if ([(UAUserActivity *)self needsSave]
      || [(UAUserActivity *)self dirty]
      || ([(UAUserActivity *)self dirtyPayloadIdentifiers],
          int v15 = objc_claimAutoreleasedReturnValue(),
          BOOL v16 = [v15 count] == 0,
          v15,
          !v16))
    {
      +[UAUserActivity setIndexPending:1 forUUID:v14];
      objc_super v17 = biomeInfoLogging();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        long long v18 = [(UAUserActivity *)self uniqueIdentifier];
        *(_DWORD *)buf = 138543362;
        v40 = v18;
        _os_log_impl(&dword_1B3DF6000, v17, OS_LOG_TYPE_INFO, "%{public}@ INDEX-UPDATEUSERINFO", buf, 0xCu);
      }
      long long v19 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        long long v20 = [(UAUserActivity *)self uniqueIdentifier];
        long long v21 = [v20 UUIDString];
        *(_DWORD *)buf = 138543618;
        v40 = v21;
        __int16 v41 = 2048;
        double v42 = a3;
        _os_log_impl(&dword_1B3DF6000, v19, OS_LOG_TYPE_DEBUG, "indexActivity: %{public}@, Deferred %g seconds, because .dirty == YES", buf, 0x16u);
      }
      double v22 = a3 * 1000000000.0;
      if (a3 < 0.0) {
        double v22 = 0.0;
      }
      dispatch_time_t v23 = dispatch_time(0, (uint64_t)v22);
      if (getDeferredIndexingQueue(void)::sOnce != -1) {
        dispatch_once(&getDeferredIndexingQueue(void)::sOnce, &__block_literal_global_34);
      }
      uint64_t v24 = getDeferredIndexingQueue(void)::sQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __90__UAUserActivity_UAUserActivityCoreSpotlightIndexingSupport__indexActivity_forceIndexing___block_invoke;
      block[3] = &unk_1E6082E20;
      id v36 = v14;
      id v37 = v11;
      __int16 v38 = self;
      dispatch_after(v23, v24, block);

      __int16 v25 = v36;
    }
    else
    {
      __int16 v25 = self;
      objc_sync_enter(v25);
      self->_indexInProcess = 1;
      uint64_t v30 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        long long v31 = [(UAUserActivity *)v25 uniqueIdentifier];
        long long v32 = [v31 UUIDString];
        *(_DWORD *)buf = 138543362;
        v40 = v32;
        _os_log_impl(&dword_1B3DF6000, v30, OS_LOG_TYPE_DEBUG, "indexActivity: Immediate, %{public}@ because .needsSave == NO", buf, 0xCu);
      }
      id v33 = [(UAUserActivity *)v25 copyWithNewUUID:0];
      self->_indexInProcess = 0;
      if (v33)
      {
        long long v34 = objc_opt_new();
        [v33 setSentToIndexerDate:v34];

        [v33 sendToCoreSpotlightIndexer];
      }

      objc_sync_exit(v25);
    }
  }
  else
  {
    int v11 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      char v28 = [(UAUserActivity *)self uniqueIdentifier];
      uint64_t v29 = [v28 UUIDString];
      *(_DWORD *)buf = 138543362;
      v40 = v29;
      _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_DEBUG, "indexActivity: Ignoring, because this activity %{public}@ doesn't seem to need indexing", buf, 0xCu);
    }
  }
}

+ (void)setIndexPending:(BOOL)a3 forUUID:(id)a4
{
}

void __28__UAUserActivity_invalidate__block_invoke(uint64_t a1)
{
  v2 = *(id **)(a1 + 32);
  if (v2[6])
  {
    [v2[6] stop];
    v2 = *(id **)(a1 + 32);
  }
  id v3 = [v2 manager];
  [v3 removeUserActivity:*(void *)(a1 + 32)];
}

- (void)becomeCurrent
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v4 = [(UAUserActivity *)self uniqueIdentifier];
    id v5 = [v4 UUIDString];
    id v6 = [(UAUserActivity *)self manager];
    int v7 = [v6 userActivityIsActive:self];
    BOOL v8 = [(UAUserActivity *)self isInvalidated];
    uint64_t v9 = &stru_1F0CB4508;
    int v10 = @" (already current)";
    if (!v7) {
      int v10 = &stru_1F0CB4508;
    }
    *(_DWORD *)buf = 138543874;
    id v36 = v5;
    __int16 v37 = 2114;
    *(void *)__int16 v38 = v10;
    if (v8) {
      uint64_t v9 = @"(invalidated)";
    }
    *(_WORD *)&v38[8] = 2114;
    __int16 v39 = v9;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "-becomeCurrent, uuid=%{public}@%{public}@%{public}@", buf, 0x20u);
  }
  if (loadSynapseObserverWhenFirstUserActivityIsMadeCurrent(void)::sOnce != -1) {
    dispatch_once(&loadSynapseObserverWhenFirstUserActivityIsMadeCurrent(void)::sOnce, &__block_literal_global_885);
  }
  if (![(UAUserActivity *)self isInvalidated])
  {
    int v11 = [(UAUserActivity *)self manager];
    int v29 = [v11 userActivityIsActive:self];

    char v12 = biomeInfoLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [(UAUserActivity *)self uniqueIdentifier];
      BOOL needsSave = self->_needsSave;
      BOOL dirty = self->_dirty;
      BOOL activityHasBeenSentToServer = self->_activityHasBeenSentToServer;
      *(_DWORD *)buf = 138544386;
      id v36 = v13;
      __int16 v37 = 1024;
      *(_DWORD *)__int16 v38 = v29;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = needsSave;
      LOWORD(v39) = 1024;
      *(_DWORD *)((char *)&v39 + 2) = dirty;
      HIWORD(v39) = 1024;
      BOOL v40 = activityHasBeenSentToServer;
      _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_INFO, "%{public}@ BECOMECURRENT\twas=%{BOOL}d needsSave=%{BOOL}d dirty=%{BOOL}d sendToServer=%{BOOL}d", buf, 0x24u);
    }
    objc_super v17 = [MEMORY[0x1E4F1C9C8] now];
    if (v29)
    {
      madeCurrentDate = self->_madeCurrentDate;
      self->_madeCurrentDate = v17;
    }
    else
    {
      madeInitiallyCurrentDate = self->_madeInitiallyCurrentDate;
      self->_madeInitiallyCurrentDate = v17;

      objc_storeStrong((id *)&self->_madeCurrentDate, self->_madeInitiallyCurrentDate);
      if (![(UAUserActivity *)self activityHasBeenSentToServer]) {
        [(UAUserActivity *)self tellDaemonAboutNewLSUserActivity];
      }
      long long v20 = [(UAUserActivity *)self manager];
      [v20 makeActive:self];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      madeCurrentDate = getUserActivityObserversCopy();
      uint64_t v21 = [madeCurrentDate countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(madeCurrentDate);
            }
            uint64_t v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            __int16 v25 = [(UAUserActivity *)self parentUserActivity];
            if (v25)
            {
              char v26 = objc_opt_respondsToSelector();

              if (v26)
              {
                BOOL v27 = [(UAUserActivity *)self parentUserActivity];
                [v24 userActivityDidBecomeCurrent:v27 current:1];
              }
            }
          }
          uint64_t v21 = [madeCurrentDate countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v21);
      }
    }

    if ([(UAUserActivity *)self isEligibleForSearch]
      || [(UAUserActivity *)self forwardToCoreSpotlightIndexer])
    {
      double v28 = 0.1;
      if (v29) {
        double v28 = 1.0;
      }
      [(UAUserActivity *)self indexActivity:1 forceIndexing:v28];
    }
    if (v29) {
      [(UAUserActivity *)self scheduleSendUserActivityInfoToLSUserActivityd];
    }
    else {
      [(UAUserActivity *)self sendUserActivityInfoToLSUserActivityd:1 onAsyncQueue:1];
    }
  }
}

+ (void)fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = +[UAUserActivityManager defaultManager];
  int v7 = [v6 fetchUUID:v8 intervalToWaitForDocumentSynchonization:v5 withCompletionHandler:3.40282347e38];
}

- (BOOL)activityHasBeenSentToServer
{
  return self->_activityHasBeenSentToServer;
}

- (unint64_t)userInfoChangeCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v4 = [(UAUserActivity *)v2 uniqueIdentifier];
    id v5 = [v4 UUIDString];
    unsigned int userInfoChangeCount = v2->_userInfoChangeCount;
    int v9 = 138543875;
    int v10 = v5;
    __int16 v11 = 2113;
    char v12 = v2;
    __int16 v13 = 1024;
    unsigned int v14 = userInfoChangeCount;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "UAUserActivity:%{public}@/%{private}@, unsigned int userInfoChangeCount = %d", (uint8_t *)&v9, 0x1Cu);
  }
  unint64_t v7 = v2->_userInfoChangeCount;
  objc_sync_exit(v2);

  return v7;
}

- (void)tellDaemonAboutNewLSUserActivity
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v4 = [(UAUserActivity *)self uniqueIdentifier];
    id v5 = [v4 UUIDString];
    int v14 = 138543362;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "Sending activity %{public}@ information to server", (uint8_t *)&v14, 0xCu);
  }
  if (self->_createsNewUUIDIfSaved)
  {
    id v6 = [(UAUserActivity *)self manager];
    [v6 removeUserActivity:self];

    unint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    id v8 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [(NSUUID *)self->_uniqueIdentifier UUIDString];
      int v10 = [(NSUUID *)v7 UUIDString];
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      objc_super v17 = v10;
      _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_INFO, "-- Allocating a new UUID for this activity, old=%{public}@ new=%{public}@", (uint8_t *)&v14, 0x16u);
    }
    uniqueIdentifier = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v7;
  }
  char v12 = self;
  objc_sync_enter(v12);
  v12->_BOOL activityHasBeenSentToServer = 1;
  objc_sync_exit(v12);

  __int16 v13 = [(UAUserActivity *)v12 manager];
  [v13 tellDaemonAboutNewLSUserActivity:v12];
}

+ (BOOL)isIndexPendingForUUID:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  BOOL v4 = getIndexPendingQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___ZL21isIndexPendingForUUIDP6NSUUID_block_invoke;
  v7[3] = &unk_1E6082F88;
  id v8 = v3;
  int v9 = &v10;
  id v5 = v3;
  dispatch_sync(v4, v7);

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

- (void)setSentToIndexerDate:(id)a3
{
}

char *__102__UAUserActivity_initDynamicActivityWithTypeIdentifier_dynamicIdentifier_suggestedActionType_options___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1B3EC6EB0]();
  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_sync_enter(WeakRetained);
  id v5 = uaUserActivityObjectsMap();
  objc_sync_enter(v5);
  id v6 = uaUserActivityObjectsMap();
  id v7 = [v6 objectForKey:*(void *)(a1 + 32)];
  id v8 = objc_loadWeakRetained(v3);

  if (v7 == v8)
  {
    id v10 = objc_loadWeakRetained(v3);
    __int16 v11 = [v10 stateString];
    int v9 = serializedCFType(v11);
  }
  else
  {
    int v9 = 0;
  }
  objc_sync_exit(v5);

  objc_sync_exit(WeakRetained);
  return v9;
}

- (id)stateString
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  BOOL v4 = [(UAUserActivity *)self uniqueIdentifier];
  id v5 = [v4 UUIDString];
  id v6 = [(UAUserActivity *)self userInfo];
  uint64_t v7 = [v6 count];
  id v8 = [(UAUserActivity *)self delegate];
  BOOL v9 = [(UAUserActivity *)self dirty];
  id v10 = "(delegate) ";
  __int16 v11 = "";
  if (!v8) {
    id v10 = "";
  }
  if (v9) {
    __int16 v11 = "dirty ";
  }
  uint64_t v12 = [v3 stringWithFormat:@"[%@ userInfo.count=%ld %s%s", v5, v7, v10, v11];

  char v13 = (void *)[v12 copy];

  return v13;
}

- (NSURL)webpageURL
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_webpageURL;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)encodedContainsUnsynchronizedCloudDocument
{
  return self->_encodedContainsUnsynchronizedCloudDocument;
}

- (void)scheduleSendUserActivityInfoToLSUserActivityd
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(UAUserActivity *)v2 dirty])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double lastSaveTime = v2->_lastSaveTime;
    if (Current >= lastSaveTime && Current - lastSaveTime <= 30.0)
    {
      if (!v2->_saveScheduled)
      {
        v2->_saveScheduled = 1;
        dispatch_time_t v6 = dispatch_time(0, 30000000000);
        uint64_t v7 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __73__UAUserActivity_Internal__scheduleSendUserActivityInfoToLSUserActivityd__block_invoke;
        block[3] = &unk_1E6082B60;
        void block[4] = v2;
        dispatch_after(v6, v7, block);
      }
    }
    else
    {
      [(UAUserActivity *)v2 sendUserActivityInfoToLSUserActivityd:0 onAsyncQueue:1];
      v2->_saveScheduled = 0;
    }
  }
  objc_sync_exit(v2);
}

- (BOOL)dirty
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL dirty = v2->_dirty;
  objc_sync_exit(v2);

  return dirty;
}

- (UAUserActivityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (UAUserActivityDelegate *)WeakRetained;
}

- (void)sendUserActivityInfoToLSUserActivityd:(BOOL)a3 onAsyncQueue:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(UAUserActivity *)self needsSave];
  if ([(UAUserActivity *)self isInvalidated])
  {
    _uaGetLogForCategory(0);
    id v8 = (UAUserActivity *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = [(UAUserActivity *)self uniqueIdentifier];
      id v10 = [v9 UUIDString];
      *(_DWORD *)buf = 138543362;
      id v46 = v10;
      _os_log_impl(&dword_1B3DF6000, &v8->super, OS_LOG_TYPE_ERROR, "sendUserActivityToServer, called on activity %{public}@ after it had been invalidated, so doing nothing.", buf, 0xCu);
    }
  }
  else
  {
    if (!v7 && !v5) {
      return;
    }
    __int16 v11 = _uaGetLogForCategory(0);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v12)
      {
        char v13 = [(UAUserActivity *)self uniqueIdentifier];
        int v14 = [v13 UUIDString];
        if (v5) {
          uint64_t v15 = @"YES";
        }
        else {
          uint64_t v15 = @"NO";
        }
        __int16 v16 = [(UAUserActivity *)self manager];
        int v17 = [v16 userActivityIsActive:self];
        BOOL v18 = [(UAUserActivity *)self needsSave];
        long long v19 = &stru_1F0CB4508;
        *(_DWORD *)buf = 138544130;
        id v46 = v14;
        if (v17) {
          long long v19 = @" (is active)";
        }
        __int16 v47 = 2114;
        long long v48 = v15;
        if (v18) {
          long long v20 = @"YES";
        }
        else {
          long long v20 = @"NO";
        }
        __int16 v49 = 2114;
        long long v50 = v19;
        __int16 v51 = 2114;
        long long v52 = v20;
        _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_DEBUG, "--- on async queue, for %{public}@: makeActive=%{public}@%{public}@ needsSave=%{public}@", buf, 0x2Au);
      }
      id v8 = self;
      objc_sync_enter(v8);
      if (v8->_sendToServerPending)
      {
        uint64_t v21 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v22 = [(UAUserActivity *)v8 uniqueIdentifier];
          dispatch_time_t v23 = [v22 UUIDString];
          *(_DWORD *)buf = 138543362;
          id v46 = v23;
          _os_log_impl(&dword_1B3DF6000, v21, OS_LOG_TYPE_DEBUG, "skipping %{public}@ since there is already a save pending (_sendToServerPending==YES) for this user activity.", buf, 0xCu);
        }
      }
      else
      {
        v8->_sendToServerPending = 1;
        uint64_t v41 = [(UAUserActivity *)v8 manager];
        double v42 = [v41 serialQueueForSendingActivitiesToServer];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __79__UAUserActivity_Internal__sendUserActivityInfoToLSUserActivityd_onAsyncQueue___block_invoke;
        v43[3] = &unk_1E6082B10;
        v43[4] = v8;
        BOOL v44 = v5;
        dispatch_async(v42, v43);
      }
      objc_sync_exit(v8);
    }
    else
    {
      if (v12)
      {
        uint64_t v24 = [(UAUserActivity *)self uniqueIdentifier];
        __int16 v25 = [v24 UUIDString];
        if (v5) {
          char v26 = @"YES";
        }
        else {
          char v26 = @"NO";
        }
        BOOL v27 = [(UAUserActivity *)self manager];
        int v28 = [v27 userActivityIsActive:self];
        BOOL v29 = [(UAUserActivity *)self needsSave];
        long long v30 = &stru_1F0CB4508;
        *(_DWORD *)buf = 138544130;
        id v46 = v25;
        if (v28) {
          long long v30 = @" (is active)";
        }
        __int16 v47 = 2114;
        long long v48 = v26;
        if (v29) {
          long long v31 = @"YES";
        }
        else {
          long long v31 = @"NO";
        }
        __int16 v49 = 2114;
        long long v50 = v30;
        __int16 v51 = 2114;
        long long v52 = v31;
        _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_DEBUG, "--- for %{public}@: makeActive=%{public}@%{public}@ needsSave=%{public}@", buf, 0x2Au);
      }
      long long v32 = self;
      objc_sync_enter(v32);
      if (v5)
      {
        uint64_t v33 = 1;
      }
      else
      {
        long long v34 = [(UAUserActivity *)v32 manager];
        uint64_t v35 = [v34 activeUserActivityUUID];
        id v36 = [(UAUserActivity *)v32 uniqueIdentifier];
        uint64_t v33 = [v35 isEqual:v36];
      }
      v32->_double lastSaveTime = CFAbsoluteTimeGetCurrent();
      objc_sync_exit(v32);

      id v8 = [(UAUserActivity *)v32 callWillSaveDelegateIfDirtyAndPackageUpData:v5 options:0 clearDirty:1];
      __int16 v37 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        __int16 v38 = [(UAUserActivity *)v32 uniqueIdentifier];
        __int16 v39 = [v38 UUIDString];
        *(_DWORD *)buf = 138543362;
        id v46 = v39;
        _os_log_impl(&dword_1B3DF6000, v37, OS_LOG_TYPE_DEBUG, "--- clearing _sendToServerPending for %{public}@ because we're about to push this to the server.", buf, 0xCu);
      }
      v32->_sendToServerPending = 0;
      if (v8)
      {
        BOOL v40 = [(UAUserActivity *)v32 manager];
        [v40 sendUserActivityInfoToLSUserActivityd:v8 makeCurrent:v33];
      }
    }
  }
}

- (BOOL)isInvalidated
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL invalidated = v2->_invalidated;
  objc_sync_exit(v2);

  return invalidated;
}

- (BOOL)needsSave
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL needsSave = v2->_needsSave;
  objc_sync_exit(v2);

  return needsSave;
}

- (OS_dispatch_queue)willCallSaveSerializationQueue
{
  v2 = self;
  objc_sync_enter(v2);
  willCallSaveSerializationQueue = v2->_willCallSaveSerializationQueue;
  if (!willCallSaveSerializationQueue)
  {
    BOOL v4 = NSString;
    BOOL v5 = [(UAUserActivity *)v2 uniqueIdentifier];
    dispatch_time_t v6 = [v5 UUIDString];
    id v7 = [v4 stringWithFormat:@"willSaveCallback/%@", v6];
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 cStringUsingEncoding:4], 0);
    BOOL v9 = v2->_willCallSaveSerializationQueue;
    v2->_willCallSaveSerializationQueue = (OS_dispatch_queue *)v8;

    willCallSaveSerializationQueue = v2->_willCallSaveSerializationQueue;
  }
  id v10 = willCallSaveSerializationQueue;
  objc_sync_exit(v2);

  return v10;
}

- (void)setEligibleForPublicIndexing:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_eligibleForPublicIndexing != v3)
  {
    obj->_eligibleForPublicIndexing = v3;
    [(UAUserActivity *)obj setDirty:1];
  }
  objc_sync_exit(obj);
}

- (void)setEligibleForPrediction:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_eligibleForPrediction != v3) {
    obj->_BOOL eligibleForPrediction = v3;
  }
  objc_sync_exit(obj);
}

- (void)setKeywords:(id)a3
{
  BOOL v4 = (objc_object *)a3;
  if (v4)
  {
    BOOL v9 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];

      BOOL v9 = (objc_object *)v5;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  dispatch_time_t v6 = self;
  objc_sync_enter(v6);
  if (differ(v9, (objc_object *)v6->_keywords))
  {
    if (v9)
    {
      uint64_t v7 = [(objc_object *)v9 copy];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
    }
    keywords = v6->_keywords;
    v6->_keywords = (NSSet *)v7;

    [(UAUserActivity *)v6 setDirty:1];
  }
  objc_sync_exit(v6);
}

- (void)setRequiredUserInfoKeys:(id)a3
{
  dispatch_queue_t v8 = (objc_object *)a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  if (differ(v8, (objc_object *)v4->_requiredUserInfoKeys))
  {
    uint64_t v5 = (uint64_t)v8;
    if (v8) {
      uint64_t v5 = [(objc_object *)v8 copy];
    }
    requiredUserInfoKeys = v4->_requiredUserInfoKeys;
    v4->_requiredUserInfoKeys = (NSSet *)v5;

    savedUserInfo = v4->_savedUserInfo;
    v4->_savedUserInfo = 0;

    [(UAUserActivity *)v4 setDirty:1];
  }
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDataCache, 0);
  objc_storeStrong((id *)&self->_payloadUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_payloadObjects, 0);
  objc_storeStrong((id *)&self->_originalUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicIdentifier, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_cachedEncodedUserInfo, 0);
  objc_storeStrong((id *)&self->_sentToIndexerDate, 0);
  objc_storeStrong((id *)&self->_madeInitiallyCurrentDate, 0);
  objc_storeStrong((id *)&self->_madeCurrentEndDate, 0);
  objc_storeStrong((id *)&self->_madeCurrentDate, 0);
  objc_storeStrong((id *)&self->_willCallSaveSerializationQueue, 0);
  objc_storeStrong((id *)&self->_savedUserInfo, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredUserInfoKeys, 0);
  objc_storeStrong((id *)&self->_contentUserAction, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_decodeUserInfoError, 0);
  objc_storeStrong((id *)&self->_dirtyPayloadIdentifiers, 0);
  objc_storeStrong((id *)&self->_resumerAdvertiser, 0);
  objc_storeStrong((id *)&self->_advertiserCompletedGroup, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_frameworkPayload, 0);
}

- (void)addUserInfoEntriesFromDictionary:(id)a3
{
  id v8 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  if (v8 && [v8 count])
  {
    if ((recurse(v8, &__block_literal_global) & 1) != 0 || (dyld_program_sdk_at_least() & 1) == 0)
    {
      userInfo = v4->_userInfo;
      if (userInfo)
      {
        uint64_t v7 = (void *)[(NSDictionary *)userInfo mutableCopy];
        [v7 addEntriesFromDictionary:v8];
      }
      else
      {
        uint64_t v7 = (void *)[v8 copy];
      }
      [(UAUserActivity *)v4 setUserInfo:v7];
    }
    else if (dyld_program_sdk_at_least())
    {
      id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"userInfo contained an invalid object type" userInfo:0];
      objc_exception_throw(v5);
    }
  }
  objc_sync_exit(v4);
}

- (void)setPersistentIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSString *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  persistentIdentifier = v5->_persistentIdentifier;
  if (persistentIdentifier == v4)
  {
    if (!v4 || ![(NSString *)v4 isEqual:v4]) {
      goto LABEL_12;
    }
    persistentIdentifier = v5->_persistentIdentifier;
  }
  uint64_t v7 = persistentIdentifier;
  uint64_t v8 = [(NSString *)v4 copy];
  BOOL v9 = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v8;

  [(UAUserActivity *)v5 setDirty:1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = +[UAUserActivity observers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        int v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v15 = [(UAUserActivity *)v5 parentUserActivity];
          [v14 userActivityPersistentIdentifierWasChanged:v15 persistentIdentifier:v4 previousValue:v7];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

LABEL_12:
  objc_sync_exit(v5);
}

- (void)setTargetContentIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (objc_object *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  p_isa = (NSString *)&v4->isa;
  if (differ(v4, (objc_object *)v5->_targetContentIdentifier))
  {
    dispatch_time_t v6 = v5->_targetContentIdentifier;
    uint64_t v7 = copyNSStringOrSubclass((NSString *)&v4->isa);
    targetContentIdentifier = v5->_targetContentIdentifier;
    v5->_targetContentIdentifier = (NSString *)v7;

    [(UAUserActivity *)v5 setDirty:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v9 = getUserActivityObserversCopy();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          int v14 = [(UAUserActivity *)v5 parentUserActivity];
          if (v14)
          {
            char v15 = objc_opt_respondsToSelector();

            if (v15)
            {
              long long v16 = [(UAUserActivity *)v5 parentUserActivity];
              [v13 userActivityTargetContentIdentifierWasChanged:v16 targetContentIdentifier:p_isa previousValue:v6];
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  objc_sync_exit(v5);
}

- (void)setWebpageURL:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = (objc_object *)a3;
  BOOL v4 = objc_opt_class();
  unint64_t v5 = [(UAUserActivity *)self suggestedActionType];
  dispatch_time_t v6 = getenv("__UA_THROW_ON_SETWEBPAGEURL_FAILURE");
  if (v6) {
    BOOL v7 = atoi(v6) != 0;
  }
  else {
    BOOL v7 = 1;
  }
  [v4 checkWebpageURL:v22 actionType:v5 throwIfFailed:v7];
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if (differ(v22, (objc_object *)v8->_webpageURL))
  {
    BOOL v9 = v8->_webpageURL;
    uint64_t v10 = [(objc_object *)v22 copy];
    webpageURL = v8->_webpageURL;
    v8->_webpageURL = (NSURL *)v10;

    uint64_t v12 = [(UAUserActivity *)v8 manager];
    int v13 = [v12 userActivityIsActive:v8];

    if (v13)
    {
      [(UAUserActivity *)v8 setForceImmediateSendToServer:1];
      [(UAUserActivity *)v8 indexActivity:1 forceIndexing:0.5];
    }
    [(UAUserActivity *)v8 setDirty:1];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v14 = getUserActivityObserversCopy();
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          long long v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
          long long v19 = [(UAUserActivity *)v8 parentUserActivity];
          if (v19)
          {
            char v20 = objc_opt_respondsToSelector();

            if (v20)
            {
              long long v21 = [(UAUserActivity *)v8 parentUserActivity];
              [v18 userActivityWebpageURLWasChanged:v21 webpageURL:v22 previousValue:v9];
            }
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }
  }
  objc_sync_exit(v8);
}

uint64_t __44__UAUserActivity_Internal__copyWithNewUUID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  ++*(void *)(*(void *)(a1 + 32) + 120);
  objc_sync_exit(v2);

  BOOL v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    BOOL v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    unint64_t v5 = [v4 UUIDString];
    uint64_t v6 = *(void *)(a1 + 32);
    int v13 = 138543619;
    int v14 = v5;
    __int16 v15 = 2113;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "in async block, calling willSynchronizeActivity. self=%{public}@/%{private}@", (uint8_t *)&v13, 0x16u);
  }
  [*(id *)(a1 + 40) willSynchronizeActivity];
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  --*(void *)(*(void *)(a1 + 32) + 120);
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = *(unsigned char *)(*(void *)(a1 + 32) + 105);
  objc_sync_exit(v7);

  uint64_t v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BOOL v9 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v10 = [v9 UUIDString];
    uint64_t v11 = *(void *)(a1 + 32);
    int v13 = 138543619;
    int v14 = v10;
    __int16 v15 = 2113;
    uint64_t v16 = v11;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_DEBUG, "in async block, back from willSynchronizeActivity. self=%{public}@/%{private}@", (uint8_t *)&v13, 0x16u);
  }
  return 0;
}

- (void)setPayload:(id)a3 object:(id)a4 identifier:(id)a5 dirty:(BOOL)a6
{
  BOOL v26 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v28 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    [(UAUserActivity *)v10 setPayloadIdentifier:v9 object:0 withBlock:0];
    if (v28)
    {
      uint64_t v11 = [(UAUserActivity *)v10 payloadObjects];

      if (!v11)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(UAUserActivity *)v10 setPayloadObjects:v12];
      }
      int v13 = [(UAUserActivity *)v10 payloadObjects];
      [v13 setObject:v28 forKey:v9];
    }
    else
    {
      int v13 = [(UAUserActivity *)v10 payloadObjects];
      [v13 removeObjectForKey:v9];
    }

    if (v27)
    {
      int v14 = [(UAUserActivity *)v10 payloadDataCache];

      if (!v14)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(UAUserActivity *)v10 setPayloadDataCache:v15];
      }
      uint64_t v16 = [(UAUserActivity *)v10 payloadDataCache];
      uint64_t v17 = (void *)[v27 copy];
      [v16 setObject:v17 forKey:v9];
    }
    else
    {
      uint64_t v16 = [(UAUserActivity *)v10 payloadDataCache];
      [v16 removeObjectForKey:v9];
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v18 = [(id)objc_opt_class() observers];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v30;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void **)(*((void *)&v29 + 1) + 8 * v21);
          long long v23 = [(UAUserActivity *)v10 parentUserActivity];
          if (v23)
          {
            char v24 = objc_opt_respondsToSelector();

            if (v24)
            {
              long long v25 = [(UAUserActivity *)v10 parentUserActivity];
              [v22 userActivityPayloadWasChanged:v25 payloadIdentifier:v9];
            }
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }

    [(UAUserActivity *)v10 setDirty:v26 identifier:v9];
    objc_sync_exit(v10);
  }
}

- (void)setPayloadDataCache:(id)a3
{
}

+ (BOOL)userActivityContinuationSupported
{
  return +[UAUserActivityManager userActivityContinuationSupported];
}

+ (id)userActivityFromUUID:(id)a3 timeout:(double)a4 withError:(id *)a5
{
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy_;
  long long v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  char v24 = __Block_byref_object_copy_;
  long long v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__UAUserActivity_userActivityFromUUID_timeout_withError___block_invoke;
  v17[3] = &unk_1E6082AC0;
  uint64_t v19 = &v27;
  uint64_t v20 = &v21;
  id v9 = v8;
  long long v18 = v9;
  +[UAUserActivity fetchUserActivityWithUUID:v7 completionHandler:v17];

  if (a4 >= 1.84467441e19) {
    dispatch_time_t v10 = -1;
  }
  else {
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  }
  intptr_t v11 = dispatch_semaphore_wait(v9, v10);

  if (v11 && !v22[5])
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"UAContinuityErrorDomain" code:-109 userInfo:0];
    int v13 = (void *)v22[5];
    v22[5] = v12;
  }
  int v14 = (void *)v28[5];
  if (a5 && !v14)
  {
    *a5 = (id) v22[5];
    int v14 = (void *)v28[5];
  }
  id v15 = v14;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __57__UAUserActivity_userActivityFromUUID_timeout_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v10;
  }
  else
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v7 = v5;
  }
  id v8 = v7;
  id v9 = *v6;
  char *v6 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)userActivityFromUUID:(id)a3 withError:(id *)a4
{
  BOOL v4 = [a1 userActivityFromUUID:a3 timeout:a4 withError:9.5];

  return v4;
}

+ (id)fetchUserActivityWithUUID:(id)a3 intervalToWaitForDocumentSynchronizationToComplete:(double)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[UAUserActivityManager defaultManager];
  id v10 = [v9 fetchUUID:v7 intervalToWaitForDocumentSynchonization:v8 withCompletionHandler:a4];

  return v10;
}

- (UAUserActivity)init
{
  return [(UAUserActivity *)self initWithTypeIdentifier:0 suggestedActionType:1 options:0];
}

- (UAUserActivity)initWithTypeIdentifier:(id)a3
{
  return [(UAUserActivity *)self initWithTypeIdentifier:a3 suggestedActionType:1 options:0];
}

- (UAUserActivity)initWithTypeIdentifier:(id)a3 dynamicIdentifier:(id)a4 options:(id)a5
{
  return (UAUserActivity *)[(UAUserActivity *)self initDynamicActivityWithTypeIdentifier:a3 dynamicIdentifier:a4 suggestedActionType:1 options:a5];
}

- (void)_setWebpageURL:(id)a3 throwOnFailure:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = (objc_object *)a3;
  objc_msgSend((id)objc_opt_class(), "checkWebpageURL:actionType:throwIfFailed:", v22, -[UAUserActivity suggestedActionType](self, "suggestedActionType"), v4);
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (differ(v22, (objc_object *)v6->_webpageURL))
  {
    id v7 = v6->_webpageURL;
    uint64_t v8 = [(objc_object *)v22 copy];
    webpageURL = v6->_webpageURL;
    v6->_webpageURL = (NSURL *)v8;

    id v10 = biomeInfoLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      intptr_t v11 = [(UAUserActivity *)v6 uniqueIdentifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v11;
      _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_INFO, "%{public}@ SET-URL", buf, 0xCu);
    }
    uint64_t v12 = [(UAUserActivity *)v6 manager];
    int v13 = [v12 userActivityIsActive:v6];

    if (v13)
    {
      [(UAUserActivity *)v6 setForceImmediateSendToServer:1];
      [(UAUserActivity *)v6 indexActivity:1 forceIndexing:0.5];
    }
    [(UAUserActivity *)v6 setDirty:1];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v14 = getUserActivityObserversCopy();
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          long long v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
          uint64_t v19 = [(UAUserActivity *)v6 parentUserActivity];
          if (v19)
          {
            char v20 = objc_opt_respondsToSelector();

            if (v20)
            {
              uint64_t v21 = [(UAUserActivity *)v6 parentUserActivity];
              [v18 userActivityWebpageURLWasChanged:v21 webpageURL:v22 previousValue:v7];
            }
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }
  }
  objc_sync_exit(v6);
}

- (NSURL)referrerURL
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_referrerURL;
  objc_sync_exit(v2);

  return v3;
}

- (void)setReferrerURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (objc_object *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (differ(v4, (objc_object *)v5->_referrerURL))
  {
    uint64_t v6 = biomeInfoLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(UAUserActivity *)v5 uniqueIdentifier];
      int v10 = 138543362;
      intptr_t v11 = v7;
      _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_INFO, "%{public}@ SET-REFERRERURL", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v8 = [(objc_object *)v4 copy];
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSURL *)v8;

    [(UAUserActivity *)v5 setDirty:1];
  }
  objc_sync_exit(v5);
}

- (void)setUniversalLink:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_universalLink != v3)
  {
    obj->_BOOL universalLink = v3;
    [(UAUserActivity *)obj setDirty:1];
  }
  objc_sync_exit(obj);
}

- (BOOL)supportsContinuationStreams
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL supportsContinuationStreams = v2->_supportsContinuationStreams;
  objc_sync_exit(v2);

  return supportsContinuationStreams;
}

- (NSData)streamsData
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_supportsContinuationStreams) {
    goto LABEL_6;
  }
  BOOL v3 = [(UAUserActivity *)v2 payloadForIdentifier:@"UAUserActivityStreamsPayload"];
  BOOL v4 = (void *)[v3 copy];

  if (!v4)
  {
    advertiserCompletedGroup = v2->_advertiserCompletedGroup;
    if (advertiserCompletedGroup)
    {
      id v5 = advertiserCompletedGroup;
LABEL_7:
      BOOL v4 = 0;
      goto LABEL_8;
    }
LABEL_6:
    id v5 = 0;
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_8:
  objc_sync_exit(v2);

  if (v5 && !v4)
  {
    id v7 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_INFO, "UserActivity: Before waiting for completion group to finish.", (uint8_t *)&v15, 2u);
    }

    dispatch_time_t v8 = dispatch_time(0, 750000000);
    intptr_t v9 = dispatch_group_wait(v5, v8);
    int v10 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      intptr_t v11 = "NO";
      if (!v9) {
        intptr_t v11 = "YES";
      }
      int v15 = 136446210;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_INFO, "UserActivity: After waiting for completion group to finish, success = %{public}s.", (uint8_t *)&v15, 0xCu);
    }

    if (v9)
    {
      uint64_t v12 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_INFO, "UserActivity: Failed getting streamsData from sharingd, so continuation streams are broken even though we think they are needed.", (uint8_t *)&v15, 2u);
      }
      BOOL v4 = 0;
    }
    else
    {
      uint64_t v12 = v2;
      objc_sync_enter(v12);
      int v13 = [v12 payloadForIdentifier:@"UAUserActivityStreamsPayload"];
      BOOL v4 = (void *)[v13 copy];

      objc_sync_exit(v12);
    }
  }

  return (NSData *)v4;
}

- (void)setStreamsData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = biomeInfoLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(UAUserActivity *)v5 uniqueIdentifier];
    int v9 = 138543618;
    int v10 = v7;
    __int16 v11 = 1024;
    BOOL v12 = v4 != 0;
    _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_INFO, "%{public}@ SET-STREAMSDATA hasStream=%{BOOL}d", (uint8_t *)&v9, 0x12u);
  }
  v5->_BOOL supportsContinuationStreams = v4 != 0;
  dispatch_time_t v8 = (void *)[v4 copy];
  [(UAUserActivity *)v5 setPayload:v8 object:0 identifier:@"UAUserActivityStreamsPayload" dirty:0];

  objc_sync_exit(v5);
}

- (void)setSupportsContinuationStreams:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (getSFCompanionAdvertiserClass())
  {
    id v5 = self;
    objc_sync_enter(v5);
    if (v5->_supportsContinuationStreams != v3)
    {
      v5->_BOOL supportsContinuationStreams = v3;
      if (v5->_advertiser)
      {
        uint64_t v6 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          id v7 = "YES";
          advertiser = v5->_advertiser;
          if (!v5->_supportsContinuationStreams) {
            id v7 = "NO";
          }
          *(_DWORD *)buf = 136446722;
          long long v25 = (void *)v7;
          __int16 v26 = 2114;
          uint64_t v27 = v5;
          __int16 v28 = 2114;
          uint64_t v29 = advertiser;
          _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_INFO, "Changing supportsContinuationStreams to %{public}s on %{public}@ advertiser=%{public}@", buf, 0x20u);
        }

        advertiserCompletedGroup = v5->_advertiserCompletedGroup;
        int v10 = getSupportsContinuationStreamsQueue();
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __49__UAUserActivity_setSupportsContinuationStreams___block_invoke_125;
        v20[3] = &unk_1E6082B10;
        v20[4] = v5;
        BOOL v21 = v3;
        __int16 v11 = v20;
LABEL_15:
        dispatch_group_async(advertiserCompletedGroup, v10, v11);

        goto LABEL_16;
      }
      if (v3)
      {
        id v12 = objc_alloc((Class)getSFCompanionAdvertiserClass());
        uint64_t v13 = [(NSUUID *)v5->_uniqueIdentifier UUIDString];
        uint64_t v14 = [v12 initWithServiceType:v13];
        int v15 = v5->_advertiser;
        v5->_advertiser = (SFCompanionAdvertiser *)v14;

        uint64_t v16 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = v5->_advertiser;
          *(_DWORD *)buf = 138543618;
          long long v25 = v5;
          __int16 v26 = 2114;
          uint64_t v27 = (UAUserActivity *)v17;
          _os_log_impl(&dword_1B3DF6000, v16, OS_LOG_TYPE_INFO, "Creating SFCompanionAdvertiser, since the client is setting .supportsContinuationStreams == YES for the first time on %{public}@ advertiser=%{public}@", buf, 0x16u);
        }

        advertiserCompletedGroup = v5->_advertiserCompletedGroup;
        if (!advertiserCompletedGroup)
        {
          dispatch_group_t v18 = dispatch_group_create();
          uint64_t v19 = v5->_advertiserCompletedGroup;
          v5->_advertiserCompletedGroup = (OS_dispatch_group *)v18;

          advertiserCompletedGroup = v5->_advertiserCompletedGroup;
        }
        int v10 = getSupportsContinuationStreamsQueue();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__UAUserActivity_setSupportsContinuationStreams___block_invoke;
        block[3] = &unk_1E6082B10;
        void block[4] = v5;
        BOOL v23 = v3;
        __int16 v11 = block;
        goto LABEL_15;
      }
    }
LABEL_16:
    objc_sync_exit(v5);
  }
}

void __49__UAUserActivity_setSupportsContinuationStreams___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "UserActivity: In group, setting up advertiser.", (uint8_t *)&v12, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = *(id *)(*(void *)(a1 + 32) + 48);
  [v4 setSupportsStreams:*(unsigned __int8 *)(a1 + 40)];
  [v4 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setPayload:0 object:0 identifier:@"UAUserActivityStreamsPayload"];
  id v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 48);
    int v12 = 138543618;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_INFO, "Calling _start on advertiser and getting serviceEndpointData, %{public}@ advertiser=%{public}@", (uint8_t *)&v12, 0x16u);
  }

  objc_sync_exit(v3);
  [v4 start];
  dispatch_time_t v8 = [v4 serviceEndpointData];
  int v9 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 48);
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_INFO, "Finished calling _start on advertiser and getting serviceEndpointData, %{public}@ advertiser=%{public}@ data=%{public}@", (uint8_t *)&v12, 0x20u);
  }

  [*(id *)(a1 + 32) setStreamsData:v8];
  [*(id *)(a1 + 32) setDirty:1];
}

void __49__UAUserActivity_setSupportsContinuationStreams___block_invoke_125(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 40)) {
      id v4 = "YES";
    }
    else {
      id v4 = "NO";
    }
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 48);
    int v7 = 136446722;
    dispatch_time_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_INFO, "Telling _advertiser that supportsStreams = %{public}s on %{public}@ advertiser=%{public}@", (uint8_t *)&v7, 0x20u);
  }

  [*(id *)(*(void *)(a1 + 32) + 48) setSupportsStreams:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) setDirty:1];
  objc_sync_exit(v2);
}

- (void)getContinuationStreamsWithCompletionHandler:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "getContinuationStreamsWithCompletionHandler", buf, 2u);
  }

  if (!v4)
  {
    BOOL v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = [NSString stringWithFormat:@"getContinuationStreamsWithCompletionHandler called with a nil completionHandler argument."];
    id v23 = [v21 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];

    objc_exception_throw(v23);
  }
  if (getSFCompanionAdvertiserClass())
  {
    if (self->_resumerAdvertiser)
    {
      uint64_t v6 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_DEFAULT, "getContinuationStreamsWithCompletionHandler(), activtiy stream already in progress, EALREADY", buf, 2u);
      }

      int v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      uint64_t v30 = @"Get streams already in progress";
      dispatch_time_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      __int16 v9 = [v7 errorWithDomain:*MEMORY[0x1E4F28798] code:37 userInfo:v8];
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v9);
    }
    else if (self->_canCreateStreams)
    {
      dispatch_time_t v8 = [(UAUserActivity *)self payloadForIdentifier:@"UAUserActivityStreamsPayload"];
      if (v8)
      {
        self->_BOOL supportsContinuationStreams = 0;
        uint64_t v12 = [objc_alloc((Class)getSFCompanionAdvertiserClass()) initWithServiceType:0];
        resumerAdvertiser = self->_resumerAdvertiser;
        p_resumerAdvertiser = &self->_resumerAdvertiser;
        *p_resumerAdvertiser = (SFCompanionAdvertiser *)v12;

        uint64_t v15 = *p_resumerAdvertiser;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __62__UAUserActivity_getContinuationStreamsWithCompletionHandler___block_invoke;
        v24[3] = &unk_1E6082B38;
        id v25 = v4;
        [(SFCompanionAdvertiser *)v15 getContinuationStreamsWithEndpointData:v8 completionHandler:v24];
        __int16 v9 = v25;
      }
      else
      {
        uint64_t v18 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B3DF6000, v18, OS_LOG_TYPE_DEFAULT, "getContinuationStreamsWithCompletionHandler(), no connect back token available, EOENT", buf, 2u);
        }

        uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v34[0] = @"No connect back token available";
        __int16 v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
        char v20 = [v19 errorWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:v9];
        (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v20);
      }
    }
    else
    {
      __int16 v16 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3DF6000, v16, OS_LOG_TYPE_DEFAULT, "getContinuationStreamsWithCompletionHandler(), activtiy doesn't support streams, ENOTSUP", buf, 2u);
      }

      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      id v32 = @"Activity doesn't support streams";
      dispatch_time_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      __int16 v9 = [v17 errorWithDomain:*MEMORY[0x1E4F28798] code:45 userInfo:v8];
      (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v9);
    }
  }
  else
  {
    uint64_t v10 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_DEFAULT, "getContinuationStreamsWithCompletionHandler(), failed to load Sharing.framework, ENOSYS", buf, 2u);
    }

    __int16 v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    __int16 v28 = @"Failed to load Sharing framework";
    dispatch_time_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    __int16 v9 = [v11 errorWithDomain:*MEMORY[0x1E4F28798] code:78 userInfo:v8];
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v9);
  }
}

void __62__UAUserActivity_getContinuationStreamsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_INFO, "getContinuationStreamsWithCompletionHandler(), inputStream=%{public}@ outputStream=%{public}@ error=%{public}@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isCurrent
{
  id v2 = self;
  objc_sync_enter(v2);
  if ([(UAUserActivity *)v2 isInvalidated])
  {
    char v3 = 0;
  }
  else
  {
    id v4 = [(UAUserActivity *)v2 manager];
    uint64_t v5 = [v4 activeUserActivityUUID];
    uint64_t v6 = [(UAUserActivity *)v2 uniqueIdentifier];
    char v3 = [v5 isEqual:v6];
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)archiveURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__UAUserActivity_archiveURL_completionHandler___block_invoke;
  v11[3] = &unk_1E6082B88;
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v11);

  return 1;
}

void __47__UAUserActivity_archiveURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1B3EC6EB0]();
  uint64_t v42 = a1;
  id v2 = [*(id *)(a1 + 32) absoluteURL];
  id v3 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v3 setScheme:@"x-br-file"];
  id v4 = [v2 path];
  [v3 setPath:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v2)
  {
    id v13 = 0;
    goto LABEL_26;
  }
  CFErrorRef err = 0;
  uint64_t v6 = _UABRCopyUbiquitousBookmarkDataForDocumentAtURL((const __CFURL *)v2, &err);
  id v7 = (const void *)v6;
  if (err)
  {
    id v8 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      uint64_t v45 = v2;
      __int16 v46 = 2114;
      CFErrorRef v47 = err;
      _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_DEBUG, "*** Error from _UACopyUbiquitousBookmarkDataForDocumentAtURL(%{private}@) => %{public}@", buf, 0x16u);
    }

    CFErrorDomain Domain = CFErrorGetDomain(err);
    uint64_t v10 = _UABRCloudDocsErrorDomain();
    if (CFEqual(Domain, v10))
    {
      CFIndex Code = CFErrorGetCode(err);
      if (Code == 6)
      {
        id v13 = 0;
        goto LABEL_21;
      }
      if (Code == 7)
      {
        id v12 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v45 = v2;
          _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_DEFAULT, "*** Setting self.encodedContainsUnsynchronizedCloudDocument = YES because the .userInfo contains an unsynced cloud document, %{private}@", buf, 0xCu);
        }
      }
      else
      {
        id v12 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138478083;
          uint64_t v45 = v2;
          __int16 v46 = 2114;
          CFErrorRef v47 = err;
          _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_DEBUG, "*** ERROR, BRCloudDocsErrorDomain from _UACopyUbiquitousBookmarkDataForDocumentAtURL(%{private}@) => %{public}@", buf, 0x16u);
        }
      }

      BOOL v40 = (void *)MEMORY[0x1E4F28C58];
      CFErrorDomain v22 = CFErrorGetDomain(err);
      CFIndex v23 = CFErrorGetCode(err);
      long long v24 = (void *)MEMORY[0x1E4F1C9E8];
      CFDictionaryRef v19 = CFErrorCopyUserInfo(err);
      char v20 = [v24 dictionaryWithDictionary:v19];
      uint64_t v21 = [v40 errorWithDomain:v22 code:v23 userInfo:v20];
    }
    else
    {
      __int16 v15 = (void *)MEMORY[0x1E4F28C58];
      CFErrorDomain v16 = CFErrorGetDomain(err);
      CFIndex v17 = CFErrorGetCode(err);
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      CFDictionaryRef v19 = CFErrorCopyUserInfo(err);
      char v20 = [v18 dictionaryWithDictionary:v19];
      uint64_t v21 = [v15 errorWithDomain:v16 code:v17 userInfo:v20];
    }
    id v13 = (void *)v21;

LABEL_21:
    if (!v7) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (!v6)
  {
    id v13 = 0;
    goto LABEL_25;
  }
  id v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"v" value:v6];
  [v5 addObject:v14];

  id v13 = 0;
LABEL_22:
  CFRelease(v7);
LABEL_23:
  if (err) {
    CFRelease(err);
  }
LABEL_25:
  if (![v5 count] && softLinkFPURLMightBeInFileProvider((const __CFURL *)v2))
  {
    CFErrorRef err = 0;
    uint64_t v29 = (void *)softLinkFPCreateBookmarkableStringFromDocumentURL((const __CFURL *)v2, &err);
    if (v29)
    {
      uint64_t v30 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v29;
        __int16 v46 = 2114;
        CFErrorRef v47 = (CFErrorRef)v2;
        _os_log_impl(&dword_1B3DF6000, v30, OS_LOG_TYPE_DEBUG, "*** fileProviderCookie=%{public}@ for url %{public}@", buf, 0x16u);
      }

      uint64_t v31 = [MEMORY[0x1E4F290C8] queryItemWithName:@"fp" value:v29];
      [v5 addObject:v31];

      CFRelease(v29);
    }
    else
    {
      if (!err) {
        goto LABEL_26;
      }
      id v32 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        uint64_t v45 = v2;
        __int16 v46 = 2114;
        CFErrorRef v47 = err;
        _os_log_impl(&dword_1B3DF6000, v32, OS_LOG_TYPE_ERROR, "*** Error from FPBookmarkableStringFromDocumentURL, %{private}@ -> %{public}@", buf, 0x16u);
      }

      uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
      CFErrorDomain v34 = CFErrorGetDomain(err);
      CFIndex v35 = CFErrorGetCode(err);
      id v36 = (void *)MEMORY[0x1E4F1C9E8];
      CFDictionaryRef v37 = CFErrorCopyUserInfo(err);
      __int16 v38 = [v36 dictionaryWithDictionary:v37];
      uint64_t v39 = [v33 errorWithDomain:v34 code:v35 userInfo:v38];

      id v13 = (void *)v39;
    }
    if (err) {
      CFRelease(err);
    }
  }
LABEL_26:
  if ([v5 count])
  {
    [v3 setQueryItems:v5];
    id v25 = [v3 URL];
    __int16 v26 = (void *)[v25 copy];

    uint64_t v27 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      __int16 v28 = *(__CFError **)(v42 + 32);
      *(_DWORD *)buf = 138478083;
      uint64_t v45 = v26;
      __int16 v46 = 2113;
      CFErrorRef v47 = v28;
      _os_log_impl(&dword_1B3DF6000, v27, OS_LOG_TYPE_DEBUG, "BR: Mapping file:%{private}@ from %{private}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(v42 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(v42 + 40) + 16))();
  }
}

- (id)unarchiveURL:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  if (!v32)
  {
    long long v24 = 0;
    goto LABEL_51;
  }
  uint64_t v31 = (__CFString *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v32 resolvingAgainstBaseURL:1];
  id v5 = [(__CFString *)v31 scheme];
  int v6 = [v5 isEqual:@"x-br-file"];

  if (v6)
  {
    id v7 = _uaGetLogForCategory(0);
    uint64_t v30 = a4;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [(__CFString *)v31 queryItems];
      *(_DWORD *)buf = 138478083;
      uint64_t v41 = v31;
      __int16 v42 = 2113;
      CFTypeRef v43 = v8;
      _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_DEBUG, "components=%{private}@ queryItems=%{private}@", buf, 0x16u);
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = [(__CFString *)v31 queryItems];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (!v10)
    {

      int v11 = 0;
      uint64_t v33 = 0;
      long long v24 = 0;
      CFTypeRef cf = 0;
LABEL_47:
      __int16 v28 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        uint64_t v41 = v24;
        __int16 v42 = 2113;
        CFTypeRef v43 = v32;
        _os_log_impl(&dword_1B3DF6000, v28, OS_LOG_TYPE_DEBUG, "BR:Resolved url %{private}@ from %{private}@", buf, 0x16u);
      }

      goto LABEL_50;
    }
    int v11 = 0;
    uint64_t v33 = 0;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        __int16 v15 = objc_msgSend(v14, "name", v30);
        int v16 = [v15 isEqual:@"v"];

        if (v16)
        {
          uint64_t v17 = [v14 value];

          uint64_t v33 = (__CFString *)v17;
        }
        uint64_t v18 = [v14 name];
        int v19 = [v18 isEqual:@"fp"];

        if (v19)
        {
          uint64_t v20 = [v14 value];

          int v11 = (__CFString *)v20;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v10);

    CFTypeRef cf = 0;
    if (!v11)
    {
      long long v24 = 0;
LABEL_36:
      if (v33 && !v24)
      {
        CFTypeRef v34 = 0;
        long long v24 = (__CFString *)_UABRCopyDocumentURLForUbiquitousBookmarkData(v33, (__CFError **)&v34);
        __int16 v26 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138478339;
          uint64_t v41 = v33;
          __int16 v42 = 2113;
          CFTypeRef v43 = v24;
          __int16 v44 = 2114;
          CFTypeRef v45 = v34;
          _os_log_impl(&dword_1B3DF6000, v26, OS_LOG_TYPE_DEBUG, "BRCopyDocumentURLForBookmarkData(%{private}@) = %{private}@/%{public}@", buf, 0x20u);
        }

        if (v30 && v34)
        {
          uint64_t v27 = _uaGetLogForCategory(0);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138478083;
            uint64_t v41 = v33;
            __int16 v42 = 2114;
            CFTypeRef v43 = v34;
            _os_log_impl(&dword_1B3DF6000, v27, OS_LOG_TYPE_INFO, "error decoding brCookie %{private}@, error = %{public}@", buf, 0x16u);
          }

          CFRetain(v34);
          id *v30 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v34) {
          CFRelease(v34);
        }
      }
      goto LABEL_47;
    }
    uint64_t v21 = softLinkFPCreateDocumentURLFromBookmarkableString(v11, (__CFError **)&cf);
    CFURLRef v22 = (const __CFURL *)v21;
    if (cf)
    {
      CFIndex v23 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        uint64_t v41 = v11;
        __int16 v42 = 2114;
        CFTypeRef v43 = cf;
        _os_log_impl(&dword_1B3DF6000, v23, OS_LOG_TYPE_DEBUG, "error decoding fileProvider %{private}@, error = %{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      [(__CFString *)v31 setScheme:@"file"];
      id v25 = (__CFString *)CFURLCopyPath(v22);
      [(__CFString *)v31 setPath:v25];

      long long v24 = [(__CFString *)v31 URL];
LABEL_28:
      if (v30 && cf) {
        id *v30 = (id)(id)CFRetain(cf);
      }
      if (v22) {
        CFRelease(v22);
      }
      if (cf) {
        CFRelease(cf);
      }
      CFTypeRef cf = 0;
      goto LABEL_36;
    }
    long long v24 = 0;
    goto LABEL_28;
  }
  long long v24 = 0;
LABEL_50:

LABEL_51:

  return v24;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = (id *)&v16;
  uint64_t v18 = 0x3032000000;
  int v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v7 = a4;
  id v21 = v7;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = v7;
    if ([v8 isFileURL])
    {
      id v9 = dispatch_group_create();
      dispatch_group_enter(v9);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __44__UAUserActivity_archiver_willEncodeObject___block_invoke;
      v13[3] = &unk_1E6082BB0;
      __int16 v15 = &v16;
      uint64_t v10 = v9;
      id v14 = v10;
      if ([(UAUserActivity *)self archiveURL:v8 completionHandler:v13]) {
        dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }
  else
  {
    objc_storeStrong(v17 + 5, a4);
  }
  id v11 = v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __44__UAUserActivity_archiver_willEncodeObject___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  id v7 = a4;
  id v8 = [v7 scheme];
  char v9 = [v8 isEqual:@"x-br-file"];

  if ((v9 & 1) == 0)
  {

LABEL_14:
    id v12 = a4;
    id v14 = v12;
    goto LABEL_15;
  }
  id v16 = 0;
  uint64_t v10 = [(UAUserActivity *)self unarchiveURL:v7 error:&v16];
  id v11 = v16;
  if (v11)
  {
    [(UAUserActivity *)self setDecodeUserInfoError:v11];
LABEL_6:
    id v12 = 0;
    goto LABEL_10;
  }
  if (!v10) {
    goto LABEL_6;
  }
  id v12 = v10;
LABEL_10:
  id v13 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    id v18 = v12;
    __int16 v19 = 2113;
    id v20 = v7;
    _os_log_impl(&dword_1B3DF6000, v13, OS_LOG_TYPE_DEBUG, " -- resolved url = %{private}@ from %{private}@", buf, 0x16u);
  }

  if (!v12) {
    goto LABEL_14;
  }

  id v14 = 0;
LABEL_15:

  return v12;
}

- (void)synchronouslyEncodeUserInfo:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v7 = a4;
  id v58 = a5;
  uint64_t v8 = MEMORY[0x1B3EC6EB0]();
  long long v52 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKeyedSubscript:@"UACreateUserActivityDataDoNotEncodeFileURLs"];
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      char v10 = [v9 BOOLValue];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }
  id v11 = [(UAUserActivity *)self cachedEncodedUserInfo];

  if (!v7 && v11)
  {
    id v56 = [(UAUserActivity *)self cachedEncodedUserInfo];
    context = (void *)v8;
    id v12 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(UAUserActivity *)self cachedEncodedUserInfo];
      id v14 = trimmedHexStringForData(v13, 64);
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_DEFAULT, "Returning cached encoded userInfo, %{private}@", (uint8_t *)&buf, 0xCu);
    }
    (*((void (**)(id, id, void, void))v58 + 2))(v58, v56, 0, 0);
LABEL_49:

    __int16 v49 = context;
    goto LABEL_50;
  }
  if (v53)
  {
    __int16 v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __72__UAUserActivity_synchronouslyEncodeUserInfo_options_completionHandler___block_invoke;
    v84[3] = &unk_1E6082BF8;
    char v86 = v10;
    id v56 = v15;
    id v85 = v56;
    context = (void *)v8;
    if (recurse(v53, v84))
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v95 = 0x2020000000;
      int v96 = 0;
      uint64_t v80 = 0;
      v81 = (unsigned int *)&v80;
      uint64_t v82 = 0x2020000000;
      int v83 = 0;
      uint64_t v76 = 0;
      long long v77 = (unsigned int *)&v76;
      uint64_t v78 = 0x2020000000;
      int v79 = 0;
      if ([v56 count])
      {
        id v16 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = [v56 description];
          id v18 = stringRemovingNewlines(v17);
          *(_DWORD *)v87 = 138477827;
          id v88 = v18;
          _os_log_impl(&dword_1B3DF6000, v16, OS_LOG_TYPE_INFO, "-- This .userInfo contains iCloud URLs, so beginning process to supplement them with iCloud cookie information. (%{private}@)", v87, 0xCu);
        }
        group = dispatch_group_create();
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        __int16 v19 = [v56 allKeys];
        id obj = v19;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v93 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v73 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v23 = *(void *)(*((void *)&v72 + 1) + 8 * i);
              long long v24 = dispatch_get_global_queue(0, 0);
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __72__UAUserActivity_synchronouslyEncodeUserInfo_options_completionHandler___block_invoke_182;
              block[3] = &unk_1E6082C48;
              p_long long buf = &buf;
              id v25 = group;
              uint64_t v64 = v25;
              __int16 v65 = self;
              uint64_t v66 = v23;
              id v67 = v56;
              uint64_t v70 = &v80;
              v71 = &v76;
              id v68 = v58;
              dispatch_group_async(v25, v24, block);
            }
            __int16 v19 = obj;
            uint64_t v20 = [obj countByEnumeratingWithState:&v72 objects:v93 count:16];
          }
          while (v20);
        }

        __int16 v26 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v27 = [v53 description];
          __int16 v28 = stringRemovingNewlines(v27);
          *(_DWORD *)v87 = 138477827;
          id v88 = v28;
          _os_log_impl(&dword_1B3DF6000, v26, OS_LOG_TYPE_DEBUG, "ENCODE: Waiting for replacementURLs block to complete, userInfo=%{private}@.", v87, 0xCu);
        }
        dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v29 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v30 = [v56 description];
          uint64_t v31 = stringRemovingNewlines(v30);
          *(_DWORD *)v87 = 138477827;
          id v88 = v31;
          _os_log_impl(&dword_1B3DF6000, v29, OS_LOG_TYPE_DEBUG, "ENCODE: DONE waiting for replacementURLs block to complete. replacementURLs=%{private}@", v87, 0xCu);
        }
      }
      atomic_load((unsigned int *)(*((void *)&buf + 1) + 24));
      if (!atomic_load((unsigned int *)(*((void *)&buf + 1) + 24)))
      {
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __72__UAUserActivity_synchronouslyEncodeUserInfo_options_completionHandler___block_invoke_183;
        v61[3] = &unk_1E6082C70;
        id v62 = v56;
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __72__UAUserActivity_synchronouslyEncodeUserInfo_options_completionHandler___block_invoke_2_185;
        v59[3] = &unk_1E6082C98;
        id v60 = v62;
        uint64_t v33 = (void *)_UACopyPackedDataForObjectWithSubstitution(v53, 0, v61, v59);
        v91[0] = @"UAUserActivityContainsCloudDocsKey";
        if (atomic_load(v81 + 6)) {
          uint64_t v35 = MEMORY[0x1E4F1CC38];
        }
        else {
          uint64_t v35 = MEMORY[0x1E4F1CC28];
        }
        uint64_t v36 = *MEMORY[0x1E4F224B8];
        v92[0] = v35;
        v92[1] = MEMORY[0x1E4F1CC28];
        uint64_t v37 = *MEMORY[0x1E4F224B0];
        v91[1] = v36;
        v91[2] = v37;
        LODWORD(v37) = atomic_load(v77 + 6);
        if (v37) {
          uint64_t v38 = MEMORY[0x1E4F1CC38];
        }
        else {
          uint64_t v38 = MEMORY[0x1E4F1CC28];
        }
        v92[2] = v38;
        long long v39 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v92, v91, 3, context);
        (*((void (**)(id, void *, void *, void))v58 + 2))(v58, v33, v39, 0);
        BOOL v40 = _uaGetLogForCategory(0);
        BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
        __int16 v42 = v52;
        if (v41)
        {
          trimmedHexStringForData(v33, 64);
          id v43 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v44 = [v39 description];
          CFTypeRef v45 = stringRemovingNewlines(v44);
          *(_DWORD *)v87 = 138478083;
          id v88 = v43;
          __int16 v89 = 2114;
          v90 = v45;
          _os_log_impl(&dword_1B3DF6000, v40, OS_LOG_TYPE_DEFAULT, "ENCODE: Caching encoded userInfo to use until we are marked dirty again, returning encoded result %{private}@ opts=%{public}@", v87, 0x16u);

          __int16 v42 = v52;
        }
        BOOL v46 = v42 == 0;

        if (v46) {
          uint64_t v47 = v33;
        }
        else {
          uint64_t v47 = 0;
        }
        [(UAUserActivity *)self setCachedEncodedUserInfo:v47];
      }
      _Block_object_dispose(&v76, 8);
      _Block_object_dispose(&v80, 8);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      long long v50 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-114 userInfo:0];
      (*((void (**)(id, void, void, void *))v58 + 2))(v58, 0, 0, v50);
    }
    goto LABEL_49;
  }
  uint64_t v48 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B3DF6000, v48, OS_LOG_TYPE_DEFAULT, "ENCODE: Asked to encode nil userInfo, so returning nil.", (uint8_t *)&buf, 2u);
  }

  (*((void (**)(id, void, void, void))v58 + 2))(v58, 0, 0, 0);
  __int16 v49 = (void *)v8;
LABEL_50:
}

uint64_t __72__UAUserActivity_synchronouslyEncodeUserInfo_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && objectIsOfAcceptableClassForUserInfo(v3))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(objc_object *)v4 isFileURL]
      && !*(unsigned char *)(a1 + 40))
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [MEMORY[0x1E4F1CA98] null];
      [v5 setObject:v6 forKey:v4];
    }
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __72__UAUserActivity_synchronouslyEncodeUserInfo_options_completionHandler___block_invoke_182(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  if (atomic_fetch_or((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 0))
  {
    id v3 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138477827;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "ENCODE: Skipping archiveURL for %{private}@ because another URL archive has already failed.", buf, 0xCu);
    }
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__UAUserActivity_synchronouslyEncodeUserInfo_options_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6082C20;
    uint64_t v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = v7;
    uint64_t v12 = v8;
    long long v15 = *(_OWORD *)(a1 + 80);
    id v9 = *(void **)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 72);
    id v14 = v9;
    id v13 = *(id *)(a1 + 32);
    if (([v5 archiveURL:v6 completionHandler:v10] & 1) == 0) {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }

    id v3 = v11;
  }
}

void __72__UAUserActivity_synchronouslyEncodeUserInfo_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, unsigned int a3, unsigned int a4, void *a5)
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    id v12 = *(id *)(a1 + 32);
    objc_sync_enter(v12);
    id v13 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      int v22 = 138478083;
      uint64_t v23 = v14;
      __int16 v24 = 2113;
      id v25 = v9;
      _os_log_impl(&dword_1B3DF6000, v13, OS_LOG_TYPE_INFO, "-- Replacing url %{private}@ with %{private}@", (uint8_t *)&v22, 0x16u);
    }

    [*(id *)(a1 + 32) setObject:v9 forKey:*(void *)(a1 + 40)];
    atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 24), a3);
    atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 72) + 8) + 24), a4);
    objc_sync_exit(v12);
  }
  else
  {
    if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 80) + 8) + 24), 1u)) {
      goto LABEL_7;
    }
    if (v10)
    {
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v10 forKey:*MEMORY[0x1E4F28A50]];
    }
    else
    {
      id v12 = 0;
    }
    long long v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-114 userInfo:v12];
    uint64_t v16 = *MEMORY[0x1E4F224B8];
    v30[0] = @"UAUserActivityContainsCloudDocsKey";
    v30[1] = v16;
    v31[0] = MEMORY[0x1E4F1CC38];
    v31[1] = MEMORY[0x1E4F1CC38];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    uint64_t v18 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = [v17 description];
      uint64_t v21 = stringRemovingNewlines(v20);
      int v22 = 138478595;
      uint64_t v23 = v19;
      __int16 v24 = 2114;
      id v25 = v11;
      __int16 v26 = 2114;
      uint64_t v27 = v15;
      __int16 v28 = 2114;
      uint64_t v29 = v21;
      _os_log_impl(&dword_1B3DF6000, v18, OS_LOG_TYPE_INFO, "ICLOUD: Error encoding url %{private}@, %{public}@, so failing with error %{public}@ opts=%{public}@.", (uint8_t *)&v22, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

BOOL __72__UAUserActivity_synchronouslyEncodeUserInfo_options_completionHandler___block_invoke_183(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __72__UAUserActivity_synchronouslyEncodeUserInfo_options_completionHandler___block_invoke_2_185(uint64_t a1, uint64_t a2)
{
  return objc_claimAutoreleasedReturnValue();
}

- (id)encodeUserInfo:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__UAUserActivity_encodeUserInfo_options_error___block_invoke;
  v8[3] = &unk_1E6082CC0;
  v8[4] = &v15;
  v8[5] = &v9;
  [(UAUserActivity *)self synchronouslyEncodeUserInfo:a3 options:a4 completionHandler:v8];
  if (a5) {
    *a5 = (id) v10[5];
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

void __47__UAUserActivity_encodeUserInfo_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
  id v12 = v6;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

- (id)encodeUserInfo:(id)a3 error:(id *)a4
{
  uint64_t v4 = [(UAUserActivity *)self encodeUserInfo:a3 options:0 error:a4];

  return v4;
}

- (id)encodeUserInfo:(id)a3
{
  BOOL v3 = [(UAUserActivity *)self encodeUserInfo:a3 error:0];

  return v3;
}

- (id)decodeUserInfo:(id)a3 options:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  uint64_t v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = trimmedHexStringForData(v48, 32);
    *(_DWORD *)long long buf = 138477827;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEBUG, "data=%{private}@", buf, 0xCu);
  }
  id v6 = v48;
  if (!v48)
  {
    id v25 = 0;
    goto LABEL_42;
  }
  if ((unint64_t)[v48 length] < 4
    || (id v7 = v48, *(unsigned char *)[v7 bytes] != 77)
    || (id v8 = v7, *(unsigned char *)([v8 bytes] + 1) != 80))
  {
    __int16 v26 = (void *)MEMORY[0x1E4F1CAD0];
    v66[0] = objc_opt_class();
    v66[1] = objc_opt_class();
    v66[2] = objc_opt_class();
    v66[3] = objc_opt_class();
    v66[4] = objc_opt_class();
    v66[5] = objc_opt_class();
    v66[6] = objc_opt_class();
    v66[7] = objc_opt_class();
    v66[8] = objc_opt_class();
    v66[9] = objc_opt_class();
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:10];
    BOOL v46 = [v26 setWithArray:v27];

    __int16 v28 = [objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v48 error:0];
    [v28 setDelegate:self];
    [v28 setRequiresSecureCoding:1];
    [(UAUserActivity *)self setDecodeUserInfoError:0];
    uint64_t v29 = [v28 decodeObjectOfClasses:v46 forKey:*MEMORY[0x1E4F284E8]];
    uint64_t v30 = [(UAUserActivity *)self decodeUserInfoError];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      if (v29)
      {
        id v32 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          CFTypeRef v34 = trimmedHexStringForData(v48, 64);
          *(_DWORD *)long long buf = 138478083;
          *(void *)&uint8_t buf[4] = v29;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = v34;
          _os_log_impl(&dword_1B3DF6000, v32, OS_LOG_TYPE_DEBUG, "Successfully unarchived(old) payload to %{private}@, from %{private}@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v35 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B3DF6000, v35, OS_LOG_TYPE_ERROR, "*** Failed to decode keyed object, trying unkeyed object decode", buf, 2u);
        }

        uint64_t v29 = [v28 decodeObjectOfClasses:v46 forKey:@"$$0"];
        if (!v29)
        {
          id v25 = 0;
          goto LABEL_39;
        }
        id v32 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B3DF6000, v32, OS_LOG_TYPE_INFO, "*** Unarchived(old and unkeyed) payload", buf, 2u);
        }
      }
    }
    else
    {
      id v32 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = [(UAUserActivity *)self decodeUserInfoError];
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v33;
        _os_log_impl(&dword_1B3DF6000, v32, OS_LOG_TYPE_ERROR, "*** Failed decoding archive, with error %{public}@.", buf, 0xCu);
      }
    }

    id v25 = (id)v29;
LABEL_39:
    [v28 finishDecoding];
    goto LABEL_40;
  }
  id v9 = v8;
  uint64_t v10 = _UACopyUnpackedObjectFromData([v9 bytes], objc_msgSend(v9, "length"), 0);
  BOOL v46 = v10;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __41__UAUserActivity_decodeUserInfo_options___block_invoke;
    v64[3] = &unk_1E6082CE8;
    id v12 = v11;
    __int16 v65 = v12;
    CFTypeRef v45 = v12;
    recurse(v10, v64);
    if ([v12 count])
    {
      id v13 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [v12 description];
        uint64_t v15 = stringRemovingNewlines(v14);
        *(_DWORD *)long long buf = 138477827;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_1B3DF6000, v13, OS_LOG_TYPE_INFO, "-- Converting x-br-file: NSURLs into local, iCloud URLs: %{private}@", buf, 0xCu);
      }
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", -[NSObject count](v12, "count") + 1);
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v71 = 0;
      [v16 setCancellable:1];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __41__UAUserActivity_decodeUserInfo_options___block_invoke_189;
      v63[3] = &unk_1E6082D10;
      v63[4] = buf;
      [v16 setCancellationHandler:v63];
      group = dispatch_group_create();
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v17 = v12;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v69 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v60 != v19) {
              objc_enumerationMutation(v17);
            }
            if (!*(unsigned char *)(*(void *)&buf[8] + 24))
            {
              uint64_t v21 = *(void *)(*((void *)&v59 + 1) + 8 * i);
              int v22 = dispatch_get_global_queue(0, 0);
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __41__UAUserActivity_decodeUserInfo_options___block_invoke_2;
              block[3] = &unk_1E6082D38;
              void block[4] = v21;
              id v55 = v16;
              id v56 = self;
              long long v57 = v17;
              id v58 = buf;
              dispatch_group_async(group, v22, block);
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v69 count:16];
        }
        while (v18);
      }

      uint64_t v23 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v67 = 134217984;
        uint64_t v68 = 0x402E000000000000;
        _os_log_impl(&dword_1B3DF6000, v23, OS_LOG_TYPE_INFO, "-- Waiting up to %g seconds for all iCloud x-br-file items to be converted into local iCloud NSURLs", v67, 0xCu);
      }

      dispatch_time_t v24 = dispatch_time(0, 15000000000);
      id v25 = 0;
      if (!dispatch_group_wait(group, v24))
      {
        [v16 becomeCurrentWithPendingUnitCount:1];
        if (*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          id v25 = 0;
        }
        else
        {
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __41__UAUserActivity_decodeUserInfo_options___block_invoke_190;
          v52[3] = &unk_1E6082CE8;
          id v53 = v17;
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __41__UAUserActivity_decodeUserInfo_options___block_invoke_2_191;
          v50[3] = &unk_1E6082D60;
          __int16 v51 = v53;
          id v43 = recurseAndReplace(v10, v52, v50);
          __int16 v44 = v43;
          if (v43) {
            id v25 = (id)[v43 mutableCopy];
          }
          else {
            id v25 = 0;
          }
        }
        objc_msgSend(v16, "resignCurrent", v12);
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v25 = [v10 copy];
    }
    long long v39 = v65;
  }
  else
  {
    uint64_t v37 = [(UAUserActivity *)self decodeUserInfoError];
    BOOL v38 = v37 == 0;

    if (v38)
    {
      id v25 = 0;
      goto LABEL_41;
    }
    long long v39 = _uaGetLogForCategory(0);
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
    BOOL v41 = v46;
    if (v40)
    {
      __int16 v42 = [(UAUserActivity *)self decodeUserInfoError];
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v42;
      _os_log_impl(&dword_1B3DF6000, v39, OS_LOG_TYPE_INFO, "*** Failed decoding archive, with error %{public}@, so (potentially) looping and trying again.", buf, 0xCu);

      id v25 = 0;
      BOOL v41 = v46;
    }
    else
    {
      id v25 = 0;
    }
    CFTypeRef v45 = v41;
    BOOL v46 = 0;
  }

  __int16 v28 = v45;
LABEL_40:

LABEL_41:
  id v6 = v48;
LABEL_42:
  -[UAUserActivity setDecodeUserInfoError:](self, "setDecodeUserInfoError:", 0, v45);

  return v25;
}

uint64_t __41__UAUserActivity_decodeUserInfo_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  objc_opt_class();
  uint64_t v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  id v5 = [v3 scheme];
  uint64_t v6 = [v5 compare:@"x-br-file" options:1];

  if (!v6)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
    [v7 setValue:v4 forKey:v3];
LABEL_5:
  }
  return 1;
}

uint64_t __41__UAUserActivity_decodeUserInfo_options___block_invoke_189(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __41__UAUserActivity_decodeUserInfo_options___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  id v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138477827;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "-- Converting x-br-file: NSURL %{private}@ into local, iCloud URL", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(a1 + 40) becomeCurrentWithPendingUnitCount:1];
  id v5 = [*(id *)(a1 + 48) unarchiveURL:*(void *)(a1 + 32) error:0];
  [*(id *)(a1 + 40) resignCurrent];
  uint64_t v6 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138478083;
    uint64_t v10 = v7;
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_DEBUG, "-- Converted x-br-file: NSURL %{private}@ into local, iCloud URLs: %{private}@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = *(id *)(a1 + 56);
  objc_sync_enter(v8);
  if (v5) {
    [*(id *)(a1 + 56) setObject:v5 forKey:*(void *)(a1 + 32)];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  objc_sync_exit(v8);
}

BOOL __41__UAUserActivity_decodeUserInfo_options___block_invoke_190(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectForKey:v3];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

id __41__UAUserActivity_decodeUserInfo_options___block_invoke_2_191(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:a2];

  return v2;
}

- (id)decodeUserInfo:(id)a3
{
  id v3 = [(UAUserActivity *)self decodeUserInfo:a3 options:0];

  return v3;
}

+ (void)addDynamicUserActivity:(id)a3 matching:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138478083;
    id v10 = v5;
    __int16 v11 = 2113;
    id v12 = v6;
    _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_INFO, "addDynamicUserActivity(%{private}@ matching=%{private}@)", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[UAUserActivityManager defaultManager];
  [v8 addDynamicUserActivity:v5 matching:v6];
}

+ (void)removeDynamicUserActivity:(id)a3 matching:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138478083;
    id v10 = v5;
    __int16 v11 = 2113;
    id v12 = v6;
    _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_INFO, "removeDynamicUserActivity(%{private}@ matching=%{private}@)", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[UAUserActivityManager defaultManager];
  [v8 removeDynamicUserActivity:v5 matching:v6];
}

- (void)prepareUserActivityForLaunchingWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v5 = [(UAUserActivity *)self manager];
  [v5 pinUserActivity:self withCompletionHandler:v6];
}

- (void)pinUserActivityWithCompletionHandler:(id)a3
{
}

- (id)determineMatchingApplicationBundleIdentfierWithOptions:(id)a3
{
  uint64_t v4 = [(UAUserActivity *)self typeIdentifier];
  id v5 = [(UAUserActivity *)self dynamicIdentifier];
  id v6 = [(UAUserActivity *)self teamIdentifier];
  uint64_t v7 = +[UAUserActivityManager _determineMatchingApplicationBundleIdentfierWithOptionsForActivityType:v4 dynamicType:v5 kind:1 teamIdentifier:v6];

  return v7;
}

- (NSString)description
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSDictionary *)v2->_userInfo count];
  objc_sync_exit(v2);

  uint64_t v4 = NSString;
  v17.receiver = v2;
  v17.super_class = (Class)UAUserActivity;
  uint64_t v16 = [(UAUserActivity *)&v17 description];
  id v5 = [(UAUserActivity *)v2 typeIdentifier];
  id v6 = trimmedString(v5, 0x80u);
  uint64_t v7 = [(UAUserActivity *)v2 uniqueIdentifier];
  id v8 = [v7 UUIDString];
  uint64_t v15 = [(UAUserActivity *)v2 cachedEncodedUserInfo];
  int v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld items", v3);
  BOOL v10 = [(UAUserActivity *)v2 supportsContinuationStreams];
  if (v10)
  {
    __int16 v11 = NSString;
    id v2 = [(UAUserActivity *)v2 payloadForIdentifier:@"UAUserActivityStreamsPayload"];
    id v3 = trimmedHexStringForData(v2, 16);
    [v11 stringWithFormat:@" streamData=%@", v3];
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = &stru_1F0CB4508;
  }
  uint64_t v13 = [v4 stringWithFormat:@"%@ { type = %@, UUID = %@, userInfo = %@%@ }", v16, v6, v8, v9, v12];
  if (v10)
  {
  }

  return (NSString *)v13;
}

- (NSString)debugDescription
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSDictionary *)v2->_userInfo description];
  uint64_t v4 = stringRemovingNewlines(v3);

  objc_sync_exit(v2);
  id v5 = [(UAUserActivity *)v2 payloadIdentifiers];
  if ([v5 count])
  {
    id v6 = [(UAUserActivity *)v2 payloadIdentifiers];
    uint64_t v7 = [v6 description];
    stringRemovingNewlines(v7);
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = &stru_1F0CB4508;
  }

  int v9 = NSString;
  v16.receiver = v2;
  v16.super_class = (Class)UAUserActivity;
  BOOL v10 = [(UAUserActivity *)&v16 description];
  __int16 v11 = [(UAUserActivity *)v2 typeIdentifier];
  id v12 = [(UAUserActivity *)v2 uniqueIdentifier];
  uint64_t v13 = [v12 UUIDString];
  id v14 = [v9 stringWithFormat:@"%@ { type = %@, UUID = %@, userInfo = %@ %@ }", v10, v11, v13, v4, v8];

  return (NSString *)v14;
}

+ (void)removeUserActivityObserver:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    id v4 = (id)getUserActivityObservers(BOOL)::sResult;
    objc_sync_enter(v4);
    [v4 removeObject:v5];
    objc_sync_exit(v4);

    id v3 = v5;
  }
}

- (void)setMadeCurrentDate:(id)a3
{
}

- (void)setMadeCurrentEndDate:(id)a3
{
}

- (void)setTeamIdentifier:(id)a3
{
}

- (BOOL)sendToServerPending
{
  return self->_sendToServerPending;
}

- (void)setSendToServerPending:(BOOL)a3
{
  self->_sendToServerPending = a3;
}

- (BOOL)createsNewUUIDIfSaved
{
  return self->_createsNewUUIDIfSaved;
}

- (void)setCreatesNewUUIDIfSaved:(BOOL)a3
{
  self->_createsNewUUIDIfSaved = a3;
}

- (NSError)decodeUserInfoError
{
  return (NSError *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDecodeUserInfoError:(id)a3
{
}

- (void)setEncodedFileProviderURL:(BOOL)a3
{
  self->_encodedFileProviderURL = a3;
}

- (unint64_t)os_state_handler
{
  return self->_os_state_handler;
}

- (void)setUserInfoContainsFileURLs:(BOOL)a3
{
  self->_userInfoContainsFileURLs = a3;
}

- (void)setTypeIdentifier:(id)a3
{
}

- (void)setDynamicIdentifier:(id)a3
{
}

- (BOOL)canCreateStreams
{
  return self->_canCreateStreams;
}

- (void)setCanCreateStreams:(BOOL)a3
{
  self->_canCreateStreams = a3;
}

- (NSString)subtitle
{
  if (-[UAUserActivity(Legacy) subtitle]::sOnce != -1) {
    dispatch_once(&-[UAUserActivity(Legacy) subtitle]::sOnce, &__block_literal_global_536);
  }
  return 0;
}

void __34__UAUserActivity_Legacy__subtitle__block_invoke()
{
}

- (void)setSubtitle:(id)a3
{
  id v3 = a3;
  if (-[UAUserActivity(Legacy) setSubtitle:]::sOnce != -1) {
    dispatch_once(&-[UAUserActivity(Legacy) setSubtitle:]::sOnce, &__block_literal_global_539);
  }
}

void __38__UAUserActivity_Legacy__setSubtitle___block_invoke()
{
}

- (id)contentType
{
  if (-[UAUserActivity(Legacy) contentType]::sOnce != -1) {
    dispatch_once(&-[UAUserActivity(Legacy) contentType]::sOnce, &__block_literal_global_541);
  }
  return 0;
}

void __37__UAUserActivity_Legacy__contentType__block_invoke()
{
}

- (void)setContentType:(id)a3
{
  id v3 = a3;
  if (-[UAUserActivity(Legacy) setContentType:]::sOnce != -1) {
    dispatch_once(&-[UAUserActivity(Legacy) setContentType:]::sOnce, &__block_literal_global_543);
  }
}

void __41__UAUserActivity_Legacy__setContentType___block_invoke()
{
}

- (id)contentAttributes
{
  if (-[UAUserActivity(Legacy) contentAttributes]::sOnce != -1) {
    dispatch_once(&-[UAUserActivity(Legacy) contentAttributes]::sOnce, &__block_literal_global_545);
  }
  return 0;
}

void __43__UAUserActivity_Legacy__contentAttributes__block_invoke()
{
}

- (void)setContentAttributes:(id)a3
{
  id v3 = a3;
  if (-[UAUserActivity(Legacy) setContentAttributes:]::sOnce != -1) {
    dispatch_once(&-[UAUserActivity(Legacy) setContentAttributes:]::sOnce, &__block_literal_global_547);
  }
}

void __47__UAUserActivity_Legacy__setContentAttributes___block_invoke()
{
}

- (void)addContentAttribute:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (-[UAUserActivity(Legacy) addContentAttribute:forKey:]::sOnce != -1) {
    dispatch_once(&-[UAUserActivity(Legacy) addContentAttribute:forKey:]::sOnce, &__block_literal_global_549);
  }
}

void __53__UAUserActivity_Legacy__addContentAttribute_forKey___block_invoke()
{
}

- (void)removeContentAttribute:(id)a3
{
  id v3 = a3;
  if (-[UAUserActivity(Legacy) removeContentAttribute:]::sOnce != -1) {
    dispatch_once(&-[UAUserActivity(Legacy) removeContentAttribute:]::sOnce, &__block_literal_global_551);
  }
}

void __49__UAUserActivity_Legacy__removeContentAttribute___block_invoke()
{
}

- (UAUserActivity)initWithManager:(id)a3 userActivityInfo:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543619;
    id v65 = v6;
    __int16 v66 = 2113;
    id v67 = v7;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_INFO, "initWithManager:%{public}@, userActivityInfo=%{private}@", buf, 0x16u);
  }

  v63.receiver = self;
  v63.super_class = (Class)UAUserActivity;
  int v9 = [(UAUserActivity *)&v63 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_manager, v6);
    __int16 v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:-1];
    [v11 becomeCurrentWithPendingUnitCount:1];
    uint64_t v12 = [v7 uuid];
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSUUID *)v12;

    v10->_suggestedActionType = [v7 type];
    id v14 = [v7 options];
    uint64_t v15 = [v14 copy];
    options = v10->_options;
    v10->_options = (NSDictionary *)v15;

    objc_super v17 = [v7 title];
    uint64_t v18 = [v17 copy];
    title = v10->_title;
    v10->_title = (NSString *)v18;

    uint64_t v20 = [v7 activityType];
    typeIdentifier = v10->_typeIdentifier;
    v10->_typeIdentifier = (NSString *)v20;

    uint64_t v22 = [v7 dynamicActivityType];
    dynamicIdentifier = v10->_dynamicIdentifier;
    v10->_dynamicIdentifier = (NSString *)v22;

    uint64_t v24 = [v7 teamIdentifier];
    teamIdentifier = v10->_teamIdentifier;
    v10->_teamIdentifier = (NSString *)v24;

    uint64_t v26 = [v7 webpageURL];
    webpageURL = v10->_webpageURL;
    v10->_webpageURL = (NSURL *)v26;

    uint64_t v28 = [v7 referrerURL];
    referrerURL = v10->_referrerURL;
    v10->_referrerURL = (NSURL *)v28;

    uint64_t v30 = [v7 targetContentIdentifier];
    targetContentIdentifier = v10->_targetContentIdentifier;
    v10->_targetContentIdentifier = (NSString *)v30;

    id v32 = [v7 payloads];
    BOOL v33 = v32 == 0;

    if (!v33)
    {
      id v34 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v35 = [v7 payloads];
      uint64_t v36 = [v34 initWithDictionary:v35];
      payloadDataCache = v10->_payloadDataCache;
      v10->_payloadDataCache = (NSMutableDictionary *)v36;

      id v38 = objc_alloc(MEMORY[0x1E4F1CA60]);
      long long v39 = [v7 payloadForIdentifier:@"UAUserActivityUserInfoPayload"];
      BOOL v40 = [(UAUserActivity *)v10 decodeUserInfo:v39];
      uint64_t v41 = [v38 initWithDictionary:v40];
      userInfo = v10->_userInfo;
      v10->_userInfo = (NSDictionary *)v41;

      [(NSMutableDictionary *)v10->_payloadDataCache removeObjectForKey:@"UAUserActivityUserInfoPayload"];
    }
    frameworkPayload = v10->_frameworkPayload;
    v10->_frameworkPayload = 0;

    advertiser = v10->_advertiser;
    v10->_advertiser = 0;

    resumerAdvertiser = v10->_resumerAdvertiser;
    v10->_resumerAdvertiser = 0;

    v10->_BOOL needsSave = 1;
    BOOL v46 = [(UAUserActivity *)v10 payloadForIdentifier:@"UAUserActivityStreamsPayload"];
    BOOL v47 = v46 == 0;

    if (!v47)
    {
      v10->_canCreateStreams = 1;
      v10->_BOOL supportsContinuationStreams = 1;
    }
    v10->_createsNewUUIDIfSaved = 1;
    v10->_eligibleForHandoff = [v7 eligibleForHandoff];
    v10->_eligibleForPublicIndexing = [v7 eligibleForPublicIndexing];
    v10->_eligibleForReminders = [v7 eligibleForReminders];
    v10->_eligibleForSearch = [v7 eligibleForSearch];
    v10->_BOOL eligibleForPrediction = [v7 eligibleForPrediction];
    uint64_t v48 = [v7 persistentIdentifier];
    persistentIdentifier = v10->_persistentIdentifier;
    v10->_persistentIdentifier = (NSString *)v48;

    long long v50 = [v7 requiredUserInfoKeys];
    if (v50)
    {
      __int16 v51 = [v7 requiredUserInfoKeys];
      uint64_t v52 = [v51 copy];
      requiredUserInfoKeys = v10->_requiredUserInfoKeys;
      v10->_requiredUserInfoKeys = (NSSet *)v52;
    }
    else
    {
      __int16 v51 = v10->_requiredUserInfoKeys;
      v10->_requiredUserInfoKeys = 0;
    }

    v10->_BOOL universalLink = [v7 isUniversalLink];
    uint64_t v54 = [v7 contentUserAction];
    contentUserAction = v10->_contentUserAction;
    v10->_contentUserAction = (NSString *)v54;

    id v56 = [v7 keywords];
    if (v56)
    {
      long long v57 = [v7 keywords];
      uint64_t v58 = [v57 copy];
      keywords = v10->_keywords;
      v10->_keywords = (NSSet *)v58;
    }
    else
    {
      long long v57 = v10->_keywords;
      v10->_keywords = 0;
    }

    uint64_t v60 = [v7 expirationDate];
    expirationDate = v10->_expirationDate;
    v10->_expirationDate = (NSDate *)v60;

    [v11 resignCurrent];
  }

  return v10;
}

- (void)willSynchronizeUserActivityWithHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(UAUserActivity *)self uniqueIdentifier];
    id v7 = [v6 UUIDString];
    int v18 = 138543619;
    uint64_t v19 = v7;
    __int16 v20 = 2113;
    uint64_t v21 = self;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "self=%{public}@/%{private}@", (uint8_t *)&v18, 0x16u);
  }
  self->_double lastSaveTime = 0.0;
  id v8 = self;
  objc_sync_enter(v8);
  BOOL v9 = [(UAUserActivity *)v8 needsSave];
  objc_sync_exit(v8);

  BOOL v10 = [(UAUserActivity *)v8 delegate];
  if ([(UAUserActivity *)v8 isInvalidated])
  {
    __int16 v11 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [(UAUserActivity *)v8 uniqueIdentifier];
      uint64_t v13 = [v12 UUIDString];
      int v18 = 138543362;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_INFO, "willSynchronize was called after the UAUserActivity %{public}@ had been invalidated.", (uint8_t *)&v18, 0xCu);
    }
    BOOL v10 = 0;
    goto LABEL_15;
  }
  if (v10) {
    BOOL v14 = v9;
  }
  else {
    BOOL v14 = 0;
  }
  if (!v14)
  {
LABEL_15:
    if (v4) {
      v4[2](v4, 0);
    }
    goto LABEL_17;
  }
  [(UAUserActivity *)v8 sendUserActivityInfoToLSUserActivityd:0 onAsyncQueue:0];
  if (v4)
  {
    uint64_t v15 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_super v16 = [(UAUserActivity *)v8 uniqueIdentifier];
      objc_super v17 = [v16 UUIDString];
      int v18 = 138543619;
      uint64_t v19 = v17;
      __int16 v20 = 2113;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1B3DF6000, v15, OS_LOG_TYPE_DEBUG, "Calling completionHandler self=%{public}@/%{private}@", (uint8_t *)&v18, 0x16u);
    }
    v4[2](v4, 0);
  }
LABEL_17:
}

- (void)didSynchronizeUserActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(UAUserActivity *)self uniqueIdentifier];
    id v5 = [v4 UUIDString];
    *(_DWORD *)long long buf = 138543619;
    int v18 = v5;
    __int16 v19 = 2113;
    __int16 v20 = self;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "self=%{public}@/%{private}@", buf, 0x16u);
  }
  id v6 = [(UAUserActivity *)self delegate];
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__UAUserActivity_Internal__didSynchronizeUserActivity__block_invoke;
    v15[3] = &unk_1E6082DA8;
    v15[4] = self;
    id v16 = v6;
    dispatch_async(v7, v15);
  }
  else
  {
    id v8 = [(UAUserActivity *)self options];
    if (v8)
    {
      BOOL v9 = [(UAUserActivity *)self options];
      BOOL v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F224C0]];
      int v11 = [v10 BOOLValue];

      if (v11)
      {
        uint64_t v12 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = [(UAUserActivity *)self uniqueIdentifier];
          BOOL v14 = [v13 UUIDString];
          *(_DWORD *)long long buf = 138543362;
          int v18 = v14;
          _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_DEBUG, "UserActivity(%{public}@) has UAUserActivityOptionInvalidateAfterFetchKey = YES, so invalidating this activity because it has been continued.", buf, 0xCu);
        }
        [(UAUserActivity *)self invalidate];
      }
    }
  }
}

void __54__UAUserActivity_Internal__didSynchronizeUserActivity__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  id v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    id v5 = [v4 UUIDString];
    uint64_t v6 = *(void *)(a1 + 32);
    int v22 = 138543619;
    uint64_t v23 = v5;
    __int16 v24 = 2113;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "(on default queue) self=%{public}@/%{private}@", (uint8_t *)&v22, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [*(id *)(a1 + 32) uniqueIdentifier];
      BOOL v9 = [v8 UUIDString];
      uint64_t v10 = *(void *)(a1 + 32);
      int v22 = 138543619;
      uint64_t v23 = v9;
      __int16 v24 = 2113;
      uint64_t v25 = v10;
      _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_DEBUG, "--- calling delegate.didSynchronizeActivity self=%{public}@/%{private}@", (uint8_t *)&v22, 0x16u);
    }
    [*(id *)(a1 + 40) didSynchronizeActivity];
    int v11 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v13 = [v12 UUIDString];
      uint64_t v14 = *(void *)(a1 + 32);
      int v22 = 138543619;
      uint64_t v23 = v13;
      __int16 v24 = 2113;
      uint64_t v25 = v14;
      _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_DEBUG, "--- after calling delegate.didSynchronizeActivity self=%{public}@/%{private}@", (uint8_t *)&v22, 0x16u);
    }
  }
  uint64_t v15 = [*(id *)(a1 + 32) options];
  if (v15)
  {
    id v16 = [*(id *)(a1 + 32) options];
    objc_super v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F224C0]];
    int v18 = [v17 BOOLValue];

    if (v18)
    {
      __int16 v19 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        __int16 v20 = [*(id *)(a1 + 32) uniqueIdentifier];
        uint64_t v21 = [v20 UUIDString];
        int v22 = 138543362;
        uint64_t v23 = v21;
        _os_log_impl(&dword_1B3DF6000, v19, OS_LOG_TYPE_DEBUG, "UserActivity(%{public}@) has UAUserActivityOptionInvalidateAfterFetchKey = YES, so invalidating this activity because it has been continued.", (uint8_t *)&v22, 0xCu);
      }
      [*(id *)(a1 + 32) invalidate];
    }
  }
}

- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4
{
  id v5 = [(UAUserActivity *)self delegate];
  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__UAUserActivity_Internal__didReceiveInputStream_outputStream___block_invoke;
    v7[3] = &unk_1E6082DA8;
    id v8 = v5;
    BOOL v9 = self;
    dispatch_async(v6, v7);
  }
}

void __63__UAUserActivity_Internal__didReceiveInputStream_outputStream___block_invoke()
{
  v0 = (void *)MEMORY[0x1B3EC6EB0]();
  objc_opt_respondsToSelector();
}

void __73__UAUserActivity_Internal__scheduleSendUserActivityInfoToLSUserActivityd__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  [*(id *)(a1 + 32) scheduleSendUserActivityInfoToLSUserActivityd];
}

- (id)userActivityInfoForSelfWithPayload:(BOOL)a3 options:(id)a4
{
  BOOL v4 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v42 = a4;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  id v7 = objc_alloc_init(UAUserActivityInfo);
  id v8 = [(UAUserActivity *)v6 uniqueIdentifier];
  [(UAUserActivityInfo *)v7 setUuid:v8];

  [(UAUserActivityInfo *)v7 setType:[(UAUserActivity *)v6 suggestedActionType]];
  BOOL v9 = [(UAUserActivity *)v6 title];
  [(UAUserActivityInfo *)v7 setTitle:v9];

  [(UAUserActivityInfo *)v7 setActivityType:v6->_typeIdentifier];
  [(UAUserActivityInfo *)v7 setDynamicActivityType:v6->_dynamicIdentifier];
  uint64_t v10 = [(UAUserActivity *)v6 teamIdentifier];
  [(UAUserActivityInfo *)v7 setTeamIdentifier:v10];

  [(UAUserActivityInfo *)v7 setWebpageURL:v6->_webpageURL];
  [(UAUserActivityInfo *)v7 setReferrerURL:v6->_referrerURL];
  [(UAUserActivityInfo *)v7 setTargetContentIdentifier:v6->_targetContentIdentifier];
  int v11 = [MEMORY[0x1E4F1C9C8] date];
  [(UAUserActivityInfo *)v7 setWhen:v11];

  uint64_t v12 = [(UAUserActivity *)v6 requiredUserInfoKeys];
  [(UAUserActivityInfo *)v7 setRequiredUserInfoKeys:v12];

  [(UAUserActivityInfo *)v7 setUniversalLink:[(UAUserActivity *)v6 isUniversalLink]];
  if (v4)
  {
    uint64_t v13 = [(UAUserActivity *)v6 cachedEncodedUserInfo];

    if (v42 || !v13)
    {
      objc_super v17 = [(UAUserActivity *)v6 userInfo];
      id v16 = deepMutableCopy(v17);
    }
    else
    {
      uint64_t v14 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B3DF6000, v14, OS_LOG_TYPE_DEFAULT, "Using cached encoded userInfo to build ActivityInfo", buf, 2u);
      }

      uint64_t v15 = [(UAUserActivity *)v6 cachedEncodedUserInfo];
      [(UAUserActivityInfo *)v7 setPayload:v15 identifier:@"UAUserActivityUserInfoPayload"];

      id v16 = 0;
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    int v18 = [(UAUserActivity *)v6 payloadIdentifiers];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v23 = [(UAUserActivity *)v6 payloadForIdentifier:v22];
          [(UAUserActivityInfo *)v7 setPayload:v23 identifier:v22];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v19);
    }

    if (v6->_supportsContinuationStreams)
    {
      __int16 v24 = [(UAUserActivity *)v6 payloadForIdentifier:@"UAUserActivityStreamsPayload"];
      BOOL v25 = v24 == 0;

      if (v25)
      {
        advertiserCompletedGroup = v6->_advertiserCompletedGroup;
        if (advertiserCompletedGroup)
        {
          if (dispatch_group_wait(advertiserCompletedGroup, 0xEE6B280uLL))
          {
            int v27 = 0;
            goto LABEL_23;
          }
          uint64_t v41 = [(UAUserActivity *)v6 payloadForIdentifier:@"UAUserActivityStreamsPayload"];
          if (v41) {
            [(UAUserActivityInfo *)v7 setPayload:v41 identifier:@"UAUserActivityStreamsPayload"];
          }
        }
      }
    }
    else
    {
      [(UAUserActivityInfo *)v7 setPayload:0 identifier:@"UAUserActivityStreamsPayload"];
    }
  }
  else
  {
    id v16 = 0;
  }
  int v27 = 1;
LABEL_23:
  uint64_t v28 = [(UAUserActivity *)v6 options];
  uint64_t v29 = (void *)MEMORY[0x1E4F1CA60];
  if (v28)
  {
    uint64_t v30 = [(UAUserActivity *)v6 options];
    BOOL v31 = [v29 dictionaryWithDictionary:v30];
  }
  else
  {
    BOOL v31 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  if ([(UAUserActivity *)v6 userInfoContainsFileURLs]) {
    [v31 setObject:MEMORY[0x1E4F1CC38] forKey:@"UAUserActivityContainsCloudDocsKey"];
  }
  if ([(UAUserActivity *)v6 encodedFileProviderURL]) {
    [v31 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F224B0]];
  }
  [(UAUserActivityInfo *)v7 setEligibleForHandoff:[(UAUserActivity *)v6 isEligibleForHandoff]];
  [(UAUserActivityInfo *)v7 setEligibleForSearch:[(UAUserActivity *)v6 isEligibleForSearch]];
  [(UAUserActivityInfo *)v7 setEligibleForPublicIndexing:[(UAUserActivity *)v6 isEligibleForPublicIndexing]];
  [(UAUserActivityInfo *)v7 setEligibleForReminders:[(UAUserActivity *)v6 isEligibleForReminders]];
  [(UAUserActivityInfo *)v7 setEligibleForPrediction:[(UAUserActivity *)v6 isEligibleForPrediction]];
  id v32 = [(UAUserActivity *)v6 persistentIdentifier];
  [(UAUserActivityInfo *)v7 setPersistentIdentifier:v32];

  BOOL v33 = [(UAUserActivity *)v6 contentUserAction];
  [(UAUserActivityInfo *)v7 setContentUserAction:v33];

  id v34 = [(UAUserActivity *)v6 keywords];
  [(UAUserActivityInfo *)v7 setKeywords:v34];

  uint64_t v35 = [(UAUserActivity *)v6 expirationDate];
  [(UAUserActivityInfo *)v7 setExpirationDate:v35];

  uint64_t v36 = (void *)[v31 copy];
  [(UAUserActivityInfo *)v7 setOptions:v36];

  [(UAUserActivityInfo *)v7 setEncodingOptions:0];
  objc_sync_exit(v6);

  if (v16) {
    int v37 = v27;
  }
  else {
    int v37 = 0;
  }
  if (v37 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v16 count])
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __71__UAUserActivity_Internal__userActivityInfoForSelfWithPayload_options___block_invoke;
        v43[3] = &unk_1E6082DD0;
        __int16 v44 = v7;
        CFTypeRef v45 = v6;
        [(UAUserActivity *)v6 synchronouslyEncodeUserInfo:v16 options:v42 completionHandler:v43];
      }
    }
  }
  if (v27) {
    id v38 = v7;
  }
  else {
    id v38 = 0;
  }
  long long v39 = v38;

  return v39;
}

void __71__UAUserActivity_Internal__userActivityInfoForSelfWithPayload_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = v7;
  [*(id *)(a1 + 32) setPayload:v7 identifier:@"UAUserActivityUserInfoPayload"];
  if (v8)
  {
    uint64_t v10 = [*(id *)(a1 + 40) options];
    int v11 = (void *)MEMORY[0x1E4F1CA60];
    if (v10)
    {
      uint64_t v12 = [*(id *)(a1 + 40) options];
      uint64_t v13 = [v11 dictionaryWithDictionary:v12];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v14 = [v8 allKeys];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v19 = [v8 objectForKeyedSubscript:v18];
          [v13 setObject:v19 forKeyedSubscript:v18];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    uint64_t v20 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F224B8]];
    objc_msgSend(*(id *)(a1 + 40), "setEncodedContainsUnsynchronizedCloudDocument:", objc_msgSend(v20, "BOOLValue"));

    uint64_t v21 = (void *)[v13 copy];
    [*(id *)(a1 + 40) setOptions:v21];
  }
  [*(id *)(a1 + 32) setEncodedUserInfoError:v9];
}

- (id)callWillSaveDelegateIfDirtyAndPackageUpData:(BOOL)a3 options:(id)a4 clearDirty:(BOOL)a5
{
  id v8 = a4;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  id v9 = [(UAUserActivity *)self willCallSaveSerializationQueue];
  dispatch_assert_queue_not_V2(v9);

  uint64_t v10 = _uaGetLogForCategory(@"signposts");
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

  uint64_t v12 = _uaGetLogForCategory(@"signposts");
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3DF6000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "callWillSaveDelegate", (const char *)&unk_1B3E40BB6, buf, 2u);
  }

  uint64_t v14 = [(UAUserActivity *)self willCallSaveSerializationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__UAUserActivity_Internal__callWillSaveDelegateIfDirtyAndPackageUpData_options_clearDirty___block_invoke;
  block[3] = &unk_1E6082DF8;
  BOOL v22 = a3;
  BOOL v23 = a5;
  uint64_t v20 = &v25;
  os_signpost_id_t v21 = v11;
  void block[4] = self;
  id v19 = v8;
  id v15 = v8;
  dispatch_sync(v14, block);

  id v16 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __91__UAUserActivity_Internal__callWillSaveDelegateIfDirtyAndPackageUpData_options_clearDirty___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (![v3 isInvalidated]) {
      goto LABEL_8;
    }
LABEL_5:
    oslog = _uaGetLogForCategory(0);
    int v60 = 1;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v6 = [v5 UUIDString];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v78 = v6;
      _os_log_impl(&dword_1B3DF6000, oslog, OS_LOG_TYPE_INFO, "Refusing to consider calling delegate for %{public}@ because it has been invalidated.", buf, 0xCu);

      int v60 = 1;
    }
    goto LABEL_49;
  }
  char v4 = [v3 needsSave];
  if ([*(id *)(a1 + 32) isInvalidated]) {
    goto LABEL_5;
  }
  if (v4)
  {
LABEL_8:
    int v7 = 1;
LABEL_9:
    id v8 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v10 = [v9 UUIDString];
      int v11 = [*(id *)(a1 + 32) needsSave];
      uint64_t v12 = @"NO";
      if (v11) {
        uint64_t v12 = @"YES";
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v78 = v10;
      __int16 v79 = 2114;
      uint64_t v80 = v12;
      _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_DEBUG, "for %{public}@: needsSave=%{public}@", buf, 0x16u);
    }
    if (*(unsigned char *)(a1 + 64)) {
      int v13 = 1000;
    }
    else {
      int v13 = 0;
    }
    if ([*(id *)(a1 + 32) needsSave]) {
      int v14 = 100;
    }
    else {
      int v14 = 0;
    }
    if ([*(id *)(a1 + 32) dirty]) {
      int v15 = 10;
    }
    else {
      int v15 = 0;
    }
    id v16 = *(id *)(a1 + 32);
    objc_sync_enter(v16);
    *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 105) = 0;
    [*(id *)(a1 + 32) setCachedEncodedUserInfo:0];
    objc_sync_exit(v16);

    oslog = [*(id *)(a1 + 32) delegate];
    int v60 = v14 + v13 + v15;
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v17 = *(id *)(a1 + 32);
      objc_sync_enter(v17);
      ++*(void *)(*(void *)(a1 + 32) + 120);
      objc_sync_exit(v17);

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v18 = getUserActivityObserversCopy();
      uint64_t v19 = [v18 countByEnumeratingWithState:&v70 objects:v76 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v71 != v20) {
              objc_enumerationMutation(v18);
            }
            BOOL v22 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            BOOL v23 = [*(id *)(a1 + 32) parentUserActivity];
            if (v23)
            {
              char v24 = objc_opt_respondsToSelector();

              if (v24)
              {
                uint64_t v25 = [*(id *)(a1 + 32) parentUserActivity];
                [v22 userActivityWillSynchronize:v25];
              }
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v70 objects:v76 count:16];
        }
        while (v19);
      }

      long long v26 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = [*(id *)(a1 + 32) uniqueIdentifier];
        uint64_t v28 = [v27 UUIDString];
        uint64_t v29 = *(__CFString **)(a1 + 32);
        *(_DWORD *)long long buf = 138543619;
        uint64_t v78 = v28;
        __int16 v79 = 2113;
        uint64_t v80 = v29;
        _os_log_impl(&dword_1B3DF6000, v26, OS_LOG_TYPE_DEBUG, "--- in async block, calling willSynchronizeActivity. self=%{public}@/%{private}@", buf, 0x16u);
      }
      [oslog willSynchronizeActivity];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v30 = getUserActivityObserversCopy();
      uint64_t v31 = [v30 countByEnumeratingWithState:&v66 objects:v75 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v67 != v32) {
              objc_enumerationMutation(v30);
            }
            id v34 = *(void **)(*((void *)&v66 + 1) + 8 * j);
            uint64_t v35 = [*(id *)(a1 + 32) parentUserActivity];
            if (v35)
            {
              char v36 = objc_opt_respondsToSelector();

              if (v36)
              {
                int v37 = [*(id *)(a1 + 32) parentUserActivity];
                [v34 userActivityWasSynchronized:v37];
              }
            }
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v66 objects:v75 count:16];
        }
        while (v31);
      }

      id v38 = *(id *)(a1 + 32);
      objc_sync_enter(v38);
      --*(void *)(*(void *)(a1 + 32) + 120);
      *(unsigned char *)(*(void *)(a1 + 32) + 104) = *(unsigned char *)(*(void *)(a1 + 32) + 105);
      objc_sync_exit(v38);

      [*(id *)(a1 + 32) displayInDtrace];
      long long v39 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        BOOL v40 = [*(id *)(a1 + 32) uniqueIdentifier];
        uint64_t v41 = [v40 UUIDString];
        id v42 = *(__CFString **)(a1 + 32);
        *(_DWORD *)long long buf = 138543619;
        uint64_t v78 = v41;
        __int16 v79 = 2113;
        uint64_t v80 = v42;
        _os_log_impl(&dword_1B3DF6000, v39, OS_LOG_TYPE_DEBUG, "--- in async block, back from willSynchronizeActivity. self=%{public}@/%{private}@", buf, 0x16u);
      }
    }
LABEL_49:

    goto LABEL_50;
  }
  int v7 = 0;
  int v60 = 0;
  if ([*(id *)(a1 + 32) dirty]) {
    goto LABEL_9;
  }
LABEL_50:
  if (*(unsigned char *)(a1 + 65))
  {
    id v43 = *(id *)(a1 + 32);
    objc_sync_enter(v43);
    *(unsigned char *)(*(void *)(a1 + 32) + 106) = 0;
    __int16 v44 = *(unsigned char **)(a1 + 32);
    if (v44[104]) {
      [v44 setDirty:1];
    }
    objc_sync_exit(v43);
  }
  CFTypeRef v45 = _uaGetLogForCategory(@"signposts");
  long long v46 = v45;
  os_signpost_id_t v47 = *(void *)(a1 + 56);
  if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v78) = v60;
    _os_signpost_emit_with_name_impl(&dword_1B3DF6000, v46, OS_SIGNPOST_INTERVAL_END, v47, "callWillSaveDelegate", "why=%{public}d enableTelemetry=YES ", buf, 8u);
  }

  uint64_t v48 = [*(id *)(a1 + 32) userActivityInfoForSelfWithPayload:1 options:*(void *)(a1 + 40)];
  uint64_t v49 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v50 = *(void **)(v49 + 40);
  *(void *)(v49 + 40) = v48;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  __int16 v51 = getUserActivityObserversCopy();
  uint64_t v52 = 0;
  uint64_t v53 = [v51 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v63;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v63 != v54) {
          objc_enumerationMutation(v51);
        }
        id v56 = *(void **)(*((void *)&v62 + 1) + 8 * k);
        long long v57 = [*(id *)(a1 + 32) parentUserActivity];
        if (v57)
        {
          char v58 = objc_opt_respondsToSelector();

          if (v58)
          {
            if (!v52)
            {
              uint64_t v52 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) archiveUserActivityInfo];
            }
            long long v59 = [*(id *)(a1 + 32) parentUserActivity];
            [v56 userActivityWasSerialized:v59 archived:v52];
          }
        }
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v53);
  }
}

- (id)callWillSaveDelegateIfDirtyAndPackageUpData:(BOOL)a3 options:(id)a4 clearDirty:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy_;
  id v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  uint64_t v10 = [(UAUserActivity *)self willCallSaveSerializationQueue];
  dispatch_assert_queue_not_V2(v10);

  int v11 = _uaGetLogForCategory(@"signposts");
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);

  int v13 = _uaGetLogForCategory(@"signposts");
  int v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3DF6000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "callWillSaveDelegate", (const char *)&unk_1B3E40BB6, buf, 2u);
  }

  int v15 = [(UAUserActivity *)self willCallSaveSerializationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__UAUserActivity_Internal__callWillSaveDelegateIfDirtyAndPackageUpData_options_clearDirty_completionHandler___block_invoke;
  block[3] = &unk_1E6082DF8;
  BOOL v23 = a3;
  BOOL v24 = a5;
  os_signpost_id_t v21 = &v26;
  os_signpost_id_t v22 = v12;
  void block[4] = self;
  id v20 = v9;
  id v16 = v9;
  dispatch_sync(v15, block);

  id v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __109__UAUserActivity_Internal__callWillSaveDelegateIfDirtyAndPackageUpData_options_clearDirty_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (![v3 isInvalidated]) {
      goto LABEL_8;
    }
LABEL_5:
    oslog = _uaGetLogForCategory(0);
    int v60 = 1;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v6 = [v5 UUIDString];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v78 = v6;
      _os_log_impl(&dword_1B3DF6000, oslog, OS_LOG_TYPE_INFO, "Refusing to consider calling delegate for %{public}@ because it has been invalidated.", buf, 0xCu);

      int v60 = 1;
    }
    goto LABEL_49;
  }
  char v4 = [v3 needsSave];
  if ([*(id *)(a1 + 32) isInvalidated]) {
    goto LABEL_5;
  }
  if (v4)
  {
LABEL_8:
    int v7 = 1;
LABEL_9:
    id v8 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v10 = [v9 UUIDString];
      int v11 = [*(id *)(a1 + 32) needsSave];
      os_signpost_id_t v12 = @"NO";
      if (v11) {
        os_signpost_id_t v12 = @"YES";
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v78 = v10;
      __int16 v79 = 2114;
      uint64_t v80 = v12;
      _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_DEBUG, "for %{public}@: needsSave=%{public}@", buf, 0x16u);
    }
    if (*(unsigned char *)(a1 + 64)) {
      int v13 = 1000;
    }
    else {
      int v13 = 0;
    }
    if ([*(id *)(a1 + 32) needsSave]) {
      int v14 = 100;
    }
    else {
      int v14 = 0;
    }
    if ([*(id *)(a1 + 32) dirty]) {
      int v15 = 10;
    }
    else {
      int v15 = 0;
    }
    id v16 = *(id *)(a1 + 32);
    objc_sync_enter(v16);
    *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 105) = 0;
    [*(id *)(a1 + 32) setCachedEncodedUserInfo:0];
    objc_sync_exit(v16);

    oslog = [*(id *)(a1 + 32) delegate];
    int v60 = v14 + v13 + v15;
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v17 = *(id *)(a1 + 32);
      objc_sync_enter(v17);
      ++*(void *)(*(void *)(a1 + 32) + 120);
      objc_sync_exit(v17);

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v18 = getUserActivityObserversCopy();
      uint64_t v19 = [v18 countByEnumeratingWithState:&v70 objects:v76 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v71 != v20) {
              objc_enumerationMutation(v18);
            }
            os_signpost_id_t v22 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            BOOL v23 = [*(id *)(a1 + 32) parentUserActivity];
            if (v23)
            {
              char v24 = objc_opt_respondsToSelector();

              if (v24)
              {
                uint64_t v25 = [*(id *)(a1 + 32) parentUserActivity];
                [v22 userActivityWillSynchronize:v25];
              }
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v70 objects:v76 count:16];
        }
        while (v19);
      }

      uint64_t v26 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = [*(id *)(a1 + 32) uniqueIdentifier];
        uint64_t v28 = [v27 UUIDString];
        uint64_t v29 = *(__CFString **)(a1 + 32);
        *(_DWORD *)long long buf = 138543619;
        uint64_t v78 = v28;
        __int16 v79 = 2113;
        uint64_t v80 = v29;
        _os_log_impl(&dword_1B3DF6000, v26, OS_LOG_TYPE_DEBUG, "--- in async block, calling willSynchronizeActivity. self=%{public}@/%{private}@", buf, 0x16u);
      }
      [oslog willSynchronizeActivity];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v30 = getUserActivityObserversCopy();
      uint64_t v31 = [v30 countByEnumeratingWithState:&v66 objects:v75 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v67 != v32) {
              objc_enumerationMutation(v30);
            }
            id v34 = *(void **)(*((void *)&v66 + 1) + 8 * j);
            uint64_t v35 = [*(id *)(a1 + 32) parentUserActivity];
            if (v35)
            {
              char v36 = objc_opt_respondsToSelector();

              if (v36)
              {
                int v37 = [*(id *)(a1 + 32) parentUserActivity];
                [v34 userActivityWasSynchronized:v37];
              }
            }
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v66 objects:v75 count:16];
        }
        while (v31);
      }

      id v38 = *(id *)(a1 + 32);
      objc_sync_enter(v38);
      --*(void *)(*(void *)(a1 + 32) + 120);
      *(unsigned char *)(*(void *)(a1 + 32) + 104) = *(unsigned char *)(*(void *)(a1 + 32) + 105);
      objc_sync_exit(v38);

      [*(id *)(a1 + 32) displayInDtrace];
      long long v39 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        BOOL v40 = [*(id *)(a1 + 32) uniqueIdentifier];
        uint64_t v41 = [v40 UUIDString];
        id v42 = *(__CFString **)(a1 + 32);
        *(_DWORD *)long long buf = 138543619;
        uint64_t v78 = v41;
        __int16 v79 = 2113;
        uint64_t v80 = v42;
        _os_log_impl(&dword_1B3DF6000, v39, OS_LOG_TYPE_DEBUG, "--- in async block, back from willSynchronizeActivity. self=%{public}@/%{private}@", buf, 0x16u);
      }
    }
LABEL_49:

    goto LABEL_50;
  }
  int v7 = 0;
  int v60 = 0;
  if ([*(id *)(a1 + 32) dirty]) {
    goto LABEL_9;
  }
LABEL_50:
  if (*(unsigned char *)(a1 + 65))
  {
    id v43 = *(id *)(a1 + 32);
    objc_sync_enter(v43);
    *(unsigned char *)(*(void *)(a1 + 32) + 106) = 0;
    __int16 v44 = *(unsigned char **)(a1 + 32);
    if (v44[104]) {
      [v44 setDirty:1];
    }
    objc_sync_exit(v43);
  }
  CFTypeRef v45 = _uaGetLogForCategory(@"signposts");
  long long v46 = v45;
  os_signpost_id_t v47 = *(void *)(a1 + 56);
  if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v78) = v60;
    _os_signpost_emit_with_name_impl(&dword_1B3DF6000, v46, OS_SIGNPOST_INTERVAL_END, v47, "callWillSaveDelegate", "why=%{public}d enableTelemetry=YES ", buf, 8u);
  }

  uint64_t v48 = [*(id *)(a1 + 32) userActivityInfoForSelfWithPayload:1 options:*(void *)(a1 + 40)];
  uint64_t v49 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v50 = *(void **)(v49 + 40);
  *(void *)(v49 + 40) = v48;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  __int16 v51 = getUserActivityObserversCopy();
  uint64_t v52 = 0;
  uint64_t v53 = [v51 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v63;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v63 != v54) {
          objc_enumerationMutation(v51);
        }
        id v56 = *(void **)(*((void *)&v62 + 1) + 8 * k);
        long long v57 = [*(id *)(a1 + 32) parentUserActivity];
        if (v57)
        {
          char v58 = objc_opt_respondsToSelector();

          if (v58)
          {
            if (!v52)
            {
              uint64_t v52 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) archiveUserActivityInfo];
            }
            long long v59 = [*(id *)(a1 + 32) parentUserActivity];
            [v56 userActivityWasSerialized:v59 archived:v52];
          }
        }
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v53);
  }
}

- (int64_t)priority
{
  id v3 = [(UAUserActivity *)self options];
  char v4 = [v3 allKeys];
  int v5 = [v4 containsObject:@"UserActivityPriority"];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = [(UAUserActivity *)self options];
  int v7 = [v6 objectForKeyedSubscript:@"UserActivityPriority"];
  int64_t v8 = [v7 integerValue];

  return v8;
}

+ (id)allowedWebpageURLSchemes
{
  if (+[UAUserActivity(Internal) allowedWebpageURLSchemes]::once != -1) {
    dispatch_once(&+[UAUserActivity(Internal) allowedWebpageURLSchemes]::once, &__block_literal_global_579);
  }
  int v2 = (void *)+[UAUserActivity(Internal) allowedWebpageURLSchemes]::result;

  return v2;
}

void __52__UAUserActivity_Internal__allowedWebpageURLSchemes__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"http", @"https", 0);
  v1 = (void *)+[UAUserActivity(Internal) allowedWebpageURLSchemes]::result;
  +[UAUserActivity(Internal) allowedWebpageURLSchemes]::result = v0;
}

- (void)advertiser:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(UAUserActivity *)self delegate];
  if (v9)
  {
    uint64_t v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__UAUserActivity_Internal__advertiser_didReceiveInputStream_outputStream___block_invoke;
    block[3] = &unk_1E6082E20;
    id v12 = v9;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(v10, block);
  }
}

void __74__UAUserActivity_Internal__advertiser_didReceiveInputStream_outputStream___block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1B3EC6EB0]();
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) didReceiveInputStream:*(void *)(a1 + 40) outputStream:*(void *)(a1 + 48)];
  }
}

+ (id)registerForSuggestedActionNudgeOfType:(unint64_t)a3 withOptions:(id)a4 block:(id)a5
{
  id v5 = a5;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v6 = suggestedActionNudgesQueue();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__UAUserActivity_Nudges__registerForSuggestedActionNudgeOfType_withOptions_block___block_invoke;
  v10[3] = &unk_1E6082E48;
  id v11 = v5;
  id v12 = &v13;
  id v7 = v5;
  dispatch_sync(v6, v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __82__UAUserActivity_Nudges__registerForSuggestedActionNudgeOfType_withOptions_block___block_invoke(uint64_t a1)
{
  if (!suggestedActionNudges)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v3 = (void *)suggestedActionNudges;
    suggestedActionNudges = (uint64_t)v2;
  }
  uint64_t v4 = _ZZZ82__UAUserActivity_Nudges__registerForSuggestedActionNudgeOfType_withOptions_block__EUb_E7sNextID++;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if ([(id)suggestedActionNudges count]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = springBoardEventToken == 0;
  }
  if (v8)
  {
    id v9 = suggestedActionNudgesQueue();
    notify_register_dispatch("com.apple.sharing.SpringBoard.startDiscovery", &springBoardEventToken, v9, &__block_literal_global_914);
  }
  uint64_t v10 = (void *)suggestedActionNudges;
  id v11 = _Block_copy(*(const void **)(a1 + 32));
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v10 setObject:v11 forKey:v12];
}

+ (void)unregisterForSuggestedActionNudgeOfType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = suggestedActionNudgesQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__UAUserActivity_Nudges__unregisterForSuggestedActionNudgeOfType___block_invoke;
  block[3] = &unk_1E6082B60;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

uint64_t __66__UAUserActivity_Nudges__unregisterForSuggestedActionNudgeOfType___block_invoke(uint64_t a1)
{
  id v2 = (const void *)[(id)suggestedActionNudges objectForKey:*(void *)(a1 + 32)];
  if (v2) {
    _Block_release(v2);
  }
  [(id)suggestedActionNudges removeObjectForKey:*(void *)(a1 + 32)];
  uint64_t result = [(id)suggestedActionNudges count];
  if (!result)
  {
    uint64_t result = springBoardEventToken;
    if (springBoardEventToken)
    {
      uint64_t result = notify_cancel(springBoardEventToken);
      springBoardEventToken = 0;
    }
  }
  return result;
}

+ (BOOL)currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UAUserActivityManager defaultManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__UAUserActivity_UAUserActivityReminders__currentUserActivityUUIDWithOptions_completionHandler___block_invoke;
  v11[3] = &unk_1E6082E70;
  id v8 = v6;
  id v12 = v8;
  char v9 = [v7 currentUserActivityUUIDWithOptions:v5 completionHandler:v11];

  return v9;
}

uint64_t __96__UAUserActivity_UAUserActivityReminders__currentUserActivityUUIDWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)determineIfUserActivityIsCurrent:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UAUserActivityManager defaultManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__UAUserActivity_UAUserActivityReminders__determineIfUserActivityIsCurrent_completionHandler___block_invoke;
  v11[3] = &unk_1E6082E98;
  id v8 = v6;
  id v12 = v8;
  char v9 = [v7 determineIfUserActivityIsCurrent:v5 completionHandler:v11];

  return v9;
}

uint64_t __94__UAUserActivity_UAUserActivityReminders__determineIfUserActivityIsCurrent_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)currentUserActivityProxiesWithOptions:(id)a3 matching:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = +[UAUserActivityManager defaultManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __108__UAUserActivity_UAUserActivityReminders__currentUserActivityProxiesWithOptions_matching_completionHandler___block_invoke;
    v12[3] = &unk_1E6082EC0;
    id v13 = v9;
    [v10 currentUserActivityProxiesWithOptions:v7 predicate:v8 completionHandler:v12];
  }
  return v9 != 0;
}

void __108__UAUserActivity_UAUserActivityReminders__currentUserActivityProxiesWithOptions_matching_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v5 description];
      id v9 = stringRemovingNewlines(v8);
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_ERROR, " proxies=%{public}@ error=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setContentUserAction:(id)a3
{
  id v7 = (objc_object *)a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (differ(v7, (objc_object *)v4->_contentUserAction))
  {
    uint64_t v5 = [(objc_object *)v7 copy];
    contentUserAction = v4->_contentUserAction;
    v4->_contentUserAction = (NSString *)v5;

    [(UAUserActivity *)v4 setDirty:1];
  }
  objc_sync_exit(v4);
}

- (NSString)contentIdentifier
{
  return 0;
}

- (void)addKeywordsFromArray:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    id v6 = [MEMORY[0x1E4F1CA80] setWithSet:v5->_keywords];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    __int16 v12 = __63__UAUserActivity_UAUserActivityAppLinks__addKeywordsFromArray___block_invoke;
    id v13 = &unk_1E6082EE8;
    id v7 = v6;
    id v14 = v7;
    uint64_t v15 = &v16;
    [v4 enumerateObjectsUsingBlock:&v10];
    if (*((unsigned char *)v17 + 24))
    {
      uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
      keywords = v5->_keywords;
      v5->_keywords = (NSSet *)v8;

      [(UAUserActivity *)v5 setDirty:1];
    }

    _Block_object_dispose(&v16, 8);
    objc_sync_exit(v5);
  }
}

void __63__UAUserActivity_UAUserActivityAppLinks__addKeywordsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
    {
      [*(id *)(a1 + 32) addObject:v3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (void)setEligibleForReminders:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_eligibleForReminders != v3)
  {
    obj->_eligibleForReminders = v3;
    [(UAUserActivity *)obj setDirty:1];
  }
  objc_sync_exit(obj);
}

- (UAUserActivity)initWithUserActivityStrings:(id)a3 optionalString:(id)a4 tertiaryData:(id)a5 options:(id)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v56 = a4;
  id v54 = a5;
  id v55 = a6;
  long long v59 = v10;
  long long v62 = self;
  if (([v10 hasPrefix:@"v1/"] & 1) == 0
    && (![v10 hasPrefix:@"v1."]
     || ![v10 containsString:@"/"]))
  {
    long long v64 = 0;
    long long v65 = 0;
    int v60 = 0;
    long long v61 = 0;
    id obj = 0;
    long long v57 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = self;
LABEL_79:
    long long v62 = 0;
    goto LABEL_90;
  }
  uint64_t v11 = [MEMORY[0x1E4F28FE8] scannerWithString:v10];
  id v75 = 0;
  [v11 scanUpToString:@"/" intoString:&v75];
  id v66 = v75;
  [v11 scanString:@"/" intoString:0];
  id v74 = 0;
  int v12 = [v11 scanUpToString:@"/" intoString:&v74];
  id v13 = v74;
  long long v65 = v13;
  if (v12)
  {
    uint64_t v14 = [v13 stringByRemovingPercentEncoding];

    long long v65 = (void *)v14;
    [v11 scanString:@"/" intoString:0];
  }
  LODWORD(v52) = 0;
  long long v57 = 0;
  int v60 = 0;
  long long v61 = 0;
  id obj = 0;
  long long v64 = 0;
  while ((objc_msgSend(v11, "isAtEnd", v52, v54) & 1) == 0
       && ([v11 scanString:@"/" intoString:0] & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"=&/"];
    id v73 = 0;
    int v16 = [v11 scanUpToCharactersFromSet:v15 intoString:&v73];
    id v17 = v73;

    if (!v16) {
      goto LABEL_34;
    }
    if (![v11 scanString:@"=" intoString:0]) {
      goto LABEL_34;
    }
    uint64_t v18 = +[UAUserActivity _decodeFromScanner:v11];
    if (!v18) {
      goto LABEL_34;
    }
    if ([v17 isEqual:@"t"]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v19 = v18;

      id obj = v19;
    }
    else if ([v17 isEqual:@"u"] {
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    }
    {
      id v20 = v18;

      long long v64 = v20;
    }
    else if ([v17 isEqual:@"url"] {
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    }
    {
      os_signpost_id_t v21 = v18;

      long long v61 = v21;
    }
    else if ([v17 isEqual:@"referrer"] {
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    }
    {
      id v22 = v18;

      int v60 = v22;
    }
    else if ([v17 isEqual:@"targetIdentifier"] {
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    }
    {
      id v23 = v18;

      long long v57 = v23;
    }
    else if ([v17 isEqual:@"universalLink"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        LODWORD(v52) = [v18 BOOLValue];
      }
    }

    if ([v11 isAtEnd])
    {
LABEL_34:

      break;
    }
    char v24 = [v11 scanString:@"&" intoString:0];

    if ((v24 & 1) == 0) {
      break;
    }
  }
  if (v64)
  {
    uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = [v64 allKeys];
    uint64_t v25 = [v27 setWithArray:v28];
  }
  else
  {
    uint64_t v25 = 0;
  }

  if (!v56 || !v65)
  {
    uint64_t v26 = v61;
    if (!v65)
    {
      long long v65 = 0;
      uint64_t v26 = self;
      goto LABEL_79;
    }
    if (!v61) {
      goto LABEL_72;
    }
LABEL_65:
    uint64_t v41 = v62;
    uint64_t v26 = (UAUserActivity *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v26];
    if (v26
      && ![(id)objc_opt_class() checkWebpageURL:v26 actionType:1 throwIfFailed:0])
    {
      goto LABEL_90;
    }
    goto LABEL_73;
  }
  long long v67 = [MEMORY[0x1E4F28FE8] scannerWithString:v56];
  while ((objc_msgSend(v67, "isAtEnd", v52) & 1) == 0)
  {
    if ([v67 isAtEnd])
    {
      id v31 = 0;
LABEL_70:

      break;
    }
    uint64_t v29 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"=&/"];
    id v72 = 0;
    int v30 = [v67 scanUpToCharactersFromSet:v29 intoString:&v72];
    id v31 = v72;

    if (!v30) {
      goto LABEL_70;
    }
    if ([v67 scanString:@"=" intoString:0])
    {
      char v58 = +[UAUserActivity _decodeFromScanner:v67];
      if ([v31 isEqual:@"ue"])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v64) {
            objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
          }
          else {
          uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          id v33 = v58;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v34 = [v33 allKeys];
          uint64_t v35 = [v34 countByEnumeratingWithState:&v68 objects:v76 count:16];
          if (v35)
          {
            uint64_t v36 = *(void *)v69;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v69 != v36) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v38 = *(void *)(*((void *)&v68 + 1) + 8 * i);
                if (([v25 containsObject:v38] & 1) == 0)
                {
                  long long v39 = [v33 objectForKeyedSubscript:v38];
                  [v32 setObject:v39 forKeyedSubscript:v38];
                }
              }
              uint64_t v35 = [v34 countByEnumeratingWithState:&v68 objects:v76 count:16];
            }
            while (v35);
          }

          [(UAUserActivity *)v62 setRequiredUserInfoKeys:v25];
          uint64_t v40 = [v32 copy];

          long long v64 = (void *)v40;
        }
      }
    }
    if (([v67 scanString:@"&" intoString:0] & 1) == 0) {
      goto LABEL_70;
    }
  }
  uint64_t v26 = v61;
  if (v61) {
    goto LABEL_65;
  }
LABEL_72:
  uint64_t v41 = v62;
LABEL_73:
  if (objc_msgSend(v55, "count", v52)) {
    id v42 = v55;
  }
  else {
    id v42 = 0;
  }
  uint64_t v43 = [(UAUserActivity *)v41 initDynamicActivityWithTypeIdentifier:v65 dynamicIdentifier:0 suggestedActionType:1 options:v42];
  __int16 v44 = (UAUserActivity *)v43;
  if (!v43) {
    goto LABEL_79;
  }
  objc_storeStrong((id *)(v43 + 16), obj);
  if (v64)
  {
    uint64_t v45 = [v64 copy];
  }
  else
  {
    uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  userInfo = v44->_userInfo;
  v44->_userInfo = (NSDictionary *)v45;

  [(UAUserActivity *)v44 setWebpageURL:v26];
  if (v60) {
    os_signpost_id_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v60];
  }
  else {
    os_signpost_id_t v47 = 0;
  }
  [(UAUserActivity *)v44 setReferrerURL:v47];
  if (v60) {

  }
  if (v25)
  {
    uint64_t v48 = [v25 copy];
  }
  else
  {
    uint64_t v48 = [MEMORY[0x1E4F1CAD0] set];
  }
  requiredUserInfoKeys = v44->_requiredUserInfoKeys;
  v44->_requiredUserInfoKeys = (NSSet *)v48;

  [(UAUserActivity *)v44 setTargetContentIdentifier:v57];
  [(UAUserActivity *)v44 setUniversalLink:v53 & 1];
  long long v62 = v44;
LABEL_90:

  long long v50 = v62;
  return v50;
}

- (UAUserActivity)initWithUserActivityData:(id)a3 options:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = *MEMORY[0x1E4F284E8];
    id v15 = 0;
    id v9 = [v6 decodeTopLevelObjectOfClass:v7 forKey:v8 error:&v15];
    id v10 = v15;
    if (v9)
    {
      uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
      [v9 setUuid:v11];

      int v12 = +[UAUserActivityManager defaultManager];
      id v13 = [(UAUserActivity *)self initWithManager:v12 userActivityInfo:v9];
    }
    else
    {
      int v12 = self;
      id v13 = 0;
    }

    [v6 finishDecoding];
  }
  else
  {

    id v13 = 0;
  }

  return v13;
}

- (id)_encodeIntoUserActivityStringWithSave:(BOOL)a3 options:(id)a4 optionalString:(id *)a5 optionalData:(id *)a6 error:(id *)a7
{
  id v10 = [(UAUserActivity *)self callWillSaveDelegateIfDirtyAndPackageUpData:a3 options:a4 clearDirty:a3];
  if (!v10)
  {
    uint64_t v14 = 0;
    goto LABEL_23;
  }
  uint64_t v11 = [MEMORY[0x1E4F28E78] string];
  if (!a5)
  {
    int v12 = 0;
    if (a6) {
      goto LABEL_4;
    }
LABEL_7:
    id v13 = 0;
    goto LABEL_8;
  }
  int v12 = [MEMORY[0x1E4F28E78] string];
  if (!a6) {
    goto LABEL_7;
  }
LABEL_4:
  id v13 = [MEMORY[0x1E4F1CA58] data];
LABEL_8:
  [v10 _createUserActivityStrings:v11 secondaryString:v12 optionalData:v13];
  if (!v11 || ![v11 length])
  {
    if (a7)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-114 userInfo:0];
      uint64_t v14 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v14 = 0;
    }
    goto LABEL_22;
  }
  uint64_t v14 = (void *)[v11 copy];
  if (!a5)
  {
LABEL_13:
    if (a6) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
  if ([v12 length])
  {
    id v15 = (id) [v12 copy];
    *a5 = v15;

    goto LABEL_13;
  }
  *a5 = 0;
  if (a6)
  {
LABEL_14:
    if ([v13 length])
    {
      id v16 = (id) [v13 copy];
      *a6 = v16;
    }
    else
    {
      *a6 = 0;
    }
  }
LABEL_22:

LABEL_23:

  return v14;
}

- (BOOL)_encodeIntoUserActivityStringWithSave:(BOOL)a3 options:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(UAUserActivity *)self callWillSaveDelegateIfDirtyAndPackageUpData:v6 options:a4 clearDirty:v6];
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F28E78] string];
    uint64_t v11 = [MEMORY[0x1E4F28E78] string];
    int v12 = [MEMORY[0x1E4F1CA58] data];
    [v9 _createUserActivityStrings:v10 secondaryString:v11 optionalData:v12];
    if (!v10 || ![v10 length])
    {
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-114 userInfo:0];
      (*((void (**)(id, void, void, void, void *))v8 + 2))(v8, 0, 0, 0, v13);
LABEL_15:

      goto LABEL_16;
    }
    id v13 = (void *)[v10 copy];
    if (v11 && [v11 length])
    {
      uint64_t v14 = (void *)[v11 copy];
      int v15 = 1;
      if (!v12)
      {
LABEL_7:
        id v16 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      int v15 = 0;
      uint64_t v14 = 0;
      if (!v12) {
        goto LABEL_7;
      }
    }
    if ([v12 length]) {
      id v16 = v12;
    }
    else {
      id v16 = 0;
    }
LABEL_13:
    (*((void (**)(id, void *, void *, void *, void))v8 + 2))(v8, v13, v14, v16, 0);
    if (v15) {

    }
    goto LABEL_15;
  }
LABEL_16:

  return v9 != 0;
}

- (id)createUserActivityStringsWithSaving:(BOOL)a3 options:(id)a4 optionalString:(id *)a5 data:(id *)a6 error:(id *)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  BOOL v13 = v10 && [(UAUserActivity *)self needsSave];
  id v23 = 0;
  id v24 = 0;
  id v22 = 0;
  id v21 = [(UAUserActivity *)self _encodeIntoUserActivityStringWithSave:v13 options:v12 optionalString:&v24 optionalData:&v23 error:&v22];
  id v14 = v24;
  id v15 = v24;
  id v16 = v23;
  id v17 = v23;
  id v18 = v22;
  id v19 = v22;
  if (a5) {
    objc_storeStrong(a5, v14);
  }
  if (a6) {
    objc_storeStrong(a6, v16);
  }
  if (a7) {
    objc_storeStrong(a7, v18);
  }

  return v21;
}

void __112__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityStringsWithSaving_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __112__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityStringsWithSaving_options_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6082F10;
  id v7 = *(id *)(a1 + 48);
  if (([v4 _encodeIntoUserActivityStringWithSave:v3 options:v5 completionHandler:v6] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __112__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityStringsWithSaving_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_encodeIntoUserActivityDataWithSave:(BOOL)a3 options:(id)a4 error:(id *)a5
{
  BOOL v5 = a3;
  id v7 = a4;
  if (v5) {
    [(UAUserActivity *)self callWillSaveDelegateIfDirtyAndPackageUpData:1 options:v7 clearDirty:0];
  }
  else {
  id v8 = [(UAUserActivity *)self userActivityInfoForSelfWithPayload:1 options:v7];
  }
  [v8 setUuid:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v9 encodeObject:v8 forKey:*MEMORY[0x1E4F284E8]];
  [v9 finishEncoding];
  BOOL v10 = [v9 encodedData];

  return v10;
}

- (id)createUserActivityDataWithSaving:(BOOL)a3 options:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  BOOL v9 = v6 && [(UAUserActivity *)self needsSave];
  BOOL v10 = [(UAUserActivity *)self _encodeIntoUserActivityDataWithSave:v9 options:v8 error:a5];

  return v10;
}

- (BOOL)createUserActivityDataWithSaving:(BOOL)a3 options:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6 && [(UAUserActivity *)self needsSave])
  {
    BOOL v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityDataWithSaving_options_completionHandler___block_invoke;
    block[3] = &unk_1E6082F38;
    void block[4] = self;
    BOOL v18 = v6;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v10, block);
  }
  else
  {
    id v14 = 0;
    uint64_t v11 = [(UAUserActivity *)self _encodeIntoUserActivityDataWithSave:0 options:v8 error:&v14];
    id v12 = v14;
    (*((void (**)(id, void *, id))v9 + 2))(v9, v11, v12);
  }
  return 1;
}

void __109__UAUserActivity_UAUserActivityAppLinksEncoding__createUserActivityDataWithSaving_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = 0;
  BOOL v6 = [v4 _encodeIntoUserActivityDataWithSave:v3 options:v5 error:&v8];
  id v7 = v8;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)_decodeFromScanner:(id)a3
{
  id v4 = a3;
  if ([v4 scanString:@"--" intoString:0])
  {
    id v5 = 0;
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
LABEL_3:
    id v7 = (__CFString *)v6;
    goto LABEL_51;
  }
  if (![v4 scanString:@"'" intoString:0])
  {
    if ([v4 scanString:@"$" intoString:0])
    {
      id v9 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"$"];
      id v32 = 0;
      int v10 = [v4 scanUpToCharactersFromSet:v9 intoString:&v32];
      id v11 = v32;

      if (v10) {
        id v7 = (__CFString *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v11 options:0];
      }
      else {
        id v7 = 0;
      }
      [v4 scanString:@"$" intoString:0];
      goto LABEL_50;
    }
    if ([v4 scanString:@"{(" intoString:0)]
    {
      id v11 = [MEMORY[0x1E4F1CA80] set];
      if (v11)
      {
LABEL_15:
        if ((objc_msgSend(v4, "scanString:intoString:", @"}"), 0) & 1) == 0)
        {
          while (1)
          {
            id v12 = [a1 _decodeFromScanner:v4];
            if (!v12) {
              break;
            }
            [v11 addObject:v12];

            if (([v4 scanString:@"," intoString:0] & 1) == 0) {
              goto LABEL_15;
            }
          }

          id v11 = 0;
        }
      }
LABEL_49:
      id v7 = (__CFString *)[v11 copy];
LABEL_50:

      id v5 = 0;
      goto LABEL_51;
    }
    if ([v4 scanString:@"(" intoString:0)]
    {
      id v11 = [MEMORY[0x1E4F1CA48] array];
      if (v11)
      {
LABEL_24:
        if (([v4 isAtEnd] & 1) == 0
          && (objc_msgSend(v4, "scanString:intoString:", @""), 0) & 1) == 0)
        {
          while (1)
          {
            BOOL v13 = [a1 _decodeFromScanner:v4];
            if (!v13) {
              break;
            }
            [v11 addObject:v13];

            if (([v4 scanString:@"," intoString:0] & 1) == 0) {
              goto LABEL_24;
            }
          }

          id v11 = 0;
        }
      }
      goto LABEL_49;
    }
    if ([v4 scanString:@"{" intoString:0])
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
      if (v11)
      {
LABEL_35:
        if (([v4 isAtEnd] & 1) == 0
          && ([v4 scanString:@"}" intoString:0] & 1) == 0)
        {
          while (1)
          {
            id v14 = [a1 _decodeFromScanner:v4];
            if (!v14) {
              break;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            if (![v4 scanString:@"=" intoString:0]) {
              break;
            }
            id v15 = [a1 _decodeFromScanner:v4];
            if (!v15) {
              break;
            }
            [v11 setObject:v15 forKey:v14];

            if (([v4 scanString:@"," intoString:0] & 1) == 0) {
              goto LABEL_35;
            }
          }

          id v11 = 0;
        }
      }
      goto LABEL_49;
    }
    id v16 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789.-"];
    id v31 = 0;
    int v17 = [v4 scanCharactersFromSet:v16 intoString:&v31];
    id v5 = v31;

    if (v17)
    {
      if (![v5 containsString:@"."])
      {
        if ([v5 containsString:@"-"])
        {
          uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
        }
        else
        {
          uint64_t v27 = 0;
          for (unint64_t i = 0; i < [v5 length]; ++i)
            uint64_t v27 = 10 * v27 + [v5 characterAtIndex:i] - 48;
          uint64_t v6 = [NSNumber numberWithUnsignedLongLong:v27];
        }
        goto LABEL_3;
      }
      id v18 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      id v7 = [v18 numberFromString:v5];
      goto LABEL_63;
    }
    if ([v4 scanString:@"^d" intoString:0])
    {
      id v20 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789-"];
      id v30 = 0;
      int v21 = [v4 scanCharactersFromSet:v20 intoString:&v30];
      id v18 = v30;

      if (v21)
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v22 setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
        id v7 = [v22 dateFromString:v18];
        [v4 scanString:@"^" intoString:0];

LABEL_63:
        goto LABEL_51;
      }
    }
    else
    {
      if (![v4 scanString:@"^url^" intoString:0]) {
        goto LABEL_12;
      }
      id v29 = 0;
      int v23 = [v4 scanUpToString:@"%%^" intoString:&v29];
      id v24 = v29;
      id v18 = v24;
      if (v23)
      {
        uint64_t v25 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v26 = [v24 stringByRemovingPercentEncoding];
        id v7 = [v25 URLWithString:v26];

        [v4 scanString:@"%%^" intoString:0];
        goto LABEL_63;
      }
    }
    id v7 = 0;
    goto LABEL_63;
  }
  id v33 = 0;
  int v8 = [v4 scanUpToString:@"'" intoString:&v33];
  id v5 = v33;
  if (v8)
  {
    if ([v4 scanString:@"'" intoString:0])
    {
      uint64_t v6 = [v5 stringByRemovingPercentEncoding];
      goto LABEL_3;
    }
    goto LABEL_12;
  }
  if ([v4 isAtEnd])
  {
LABEL_12:
    id v7 = 0;
    goto LABEL_51;
  }
  if ([v4 scanString:@"'" intoString:0]) {
    id v7 = &stru_1F0CB4508;
  }
  else {
    id v7 = 0;
  }
LABEL_51:

  return v7;
}

+ (id)_decodeFromString:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F28FE8] scannerWithString:a3];
  id v4 = +[UAUserActivity _decodeFromScanner:v3];

  return v4;
}

+ (id)_decodeFromEntireString:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F28FE8] scannerWithString:a3];
  id v4 = +[UAUserActivity _decodeFromScanner:v3];
  if (v4 && ([v3 isAtEnd] & 1) == 0)
  {

    id v4 = 0;
  }

  return v4;
}

+ (BOOL)registerAsProxyForApplication:(int)a3 options:(id)a4 completionBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = +[UAUserActivityManager defaultManager];
  LOBYTE(v6) = [v9 registerAsProxyForApplication:v6 options:v7 completionBlock:v8];

  return v6;
}

- (void)updateForwardToCoreSpotlightIndexer:(char)a3
{
  int v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  int v4 = obj->_forwardToCoreSpotlightIndexerCount + v3;
  obj->_forwardToCoreSpotlightIndexerCount = v4;
  if (v4)
  {
    id v5 = [(UAUserActivity *)obj manager];
    char v6 = [v5 userActivityIsActive:obj];

    id v7 = [(UAUserActivity *)obj manager];
    [v7 registerForApplicationDeactivateIfNecessary];

    objc_sync_exit(obj);
    if (v6)
    {
      [(UAUserActivity *)obj indexActivity:1 forceIndexing:0.0];
    }
  }
  else
  {
    objc_sync_exit(obj);
  }
}

+ (id)mainBundleIdentifier
{
  if (mainBundleIdentifier_sOnce != -1) {
    dispatch_once(&mainBundleIdentifier_sOnce, &__block_literal_global_10);
  }
  id v2 = (void *)mainBundleIdentifier_bundleIdentifier;

  return v2;
}

void __65__UAUserActivity_UAUserActivitySiriActions__mainBundleIdentifier__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  v1 = (void *)mainBundleIdentifier_bundleIdentifier;
  mainBundleIdentifier_bundleIdentifier = v0;
}

+ (void)deleteSavedUserActivitiesWithPersistentIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_INFO, "Deleting saved user activities with persistent identifiers: %@", buf, 0xCu);
  }

  getCSSearchableIndexClass();
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(objc_class *)getCSSearchableIndexClass() defaultSearchableIndex];
    int v10 = [a1 mainBundleIdentifier];
    if (objc_opt_respondsToSelector())
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __114__UAUserActivity_UAUserActivitySiriActions__deleteSavedUserActivitiesWithPersistentIdentifiers_completionHandler___block_invoke;
      v13[3] = &unk_1E6083220;
      id v14 = v7;
      [v9 deleteUserActivitiesWithPersistentIdentifiers:v6 bundleID:v10 completionHandler:v13];
    }
    else
    {
      id v12 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_ERROR, "INDEX: CSSearchableIndex @selector() not implemented.", buf, 2u);
      }

      v7[2](v7);
    }
  }
  else
  {
    id v11 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_ERROR, "INDEX: CSSearchableIndex @selector() not implemented.", buf, 2u);
    }

    v7[2](v7);
  }
}

void __114__UAUserActivity_UAUserActivitySiriActions__deleteSavedUserActivitiesWithPersistentIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _uaGetLogForCategory(0);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v3;
      id v6 = "Error deleting saved items: %{public}@";
      id v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_1B3DF6000, v7, v8, v6, (uint8_t *)&v11, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    id v6 = "Deleted saved user activities";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v10);
}

+ (void)deleteAllSavedUserActivitiesWithCompletionHandler:(id)a3
{
  int v4 = (void (**)(void))a3;
  getCSSearchableIndexClass();
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(objc_class *)getCSSearchableIndexClass() defaultSearchableIndex];
    id v6 = [a1 mainBundleIdentifier];
    id v7 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_INFO, "Deleting all saved useractivities", buf, 2u);
    }

    if (objc_opt_respondsToSelector())
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __95__UAUserActivity_UAUserActivitySiriActions__deleteAllSavedUserActivitiesWithCompletionHandler___block_invoke;
      v10[3] = &unk_1E6083220;
      int v11 = v4;
      [v5 deleteAllUserActivities:v6 completionHandler:v10];
    }
    else
    {
      uint32_t v9 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_ERROR, "INDEX: CSSearchableIndex @selector() not implemented.", buf, 2u);
      }

      v4[2](v4);
    }
  }
  else
  {
    os_log_type_t v8 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_ERROR, "INDEX: CSSearchableIndex @selector() not implemented.", buf, 2u);
    }

    v4[2](v4);
  }
}

void __95__UAUserActivity_UAUserActivitySiriActions__deleteAllSavedUserActivitiesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _uaGetLogForCategory(0);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v3;
      id v6 = "Error deleting saved items: %{public}@";
      id v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_1B3DF6000, v7, v8, v6, (uint8_t *)&v11, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    id v6 = "Deleted saved user activities";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v10);
}

- (void)setPayload:(id)a3 object:(id)a4 identifier:(id)a5
{
}

- (id)payloadUpdateBlockForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UAUserActivity *)self payloadUpdateBlocks];

    if (v5)
    {
      id v6 = self;
      objc_sync_enter(v6);
      id v7 = [(UAUserActivity *)v6 payloadUpdateBlocks];
      id v5 = [v7 objectForKey:v4];

      objc_sync_exit(v6);
    }
  }
  else
  {
    id v5 = 0;
  }
  os_log_type_t v8 = _Block_copy(v5);

  return v8;
}

- (BOOL)isPayloadDirty:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UAUserActivity *)self dirtyPayloadIdentifiers];

    if (v5)
    {
      id v6 = self;
      objc_sync_enter(v6);
      if ([(NSMutableSet *)v6->_dirtyPayloadIdentifiers containsObject:v4]) {
        goto LABEL_4;
      }
      if (![v4 isEqual:@"UAUserActivityUserInfoPayload"])
      {
        LOBYTE(v5) = 0;
        goto LABEL_10;
      }
      if ([(UAUserActivity *)v6 needsSave]) {
LABEL_4:
      }
        LOBYTE(v5) = 1;
      else {
        LOBYTE(v5) = [(UAUserActivity *)v6 dirty];
      }
LABEL_10:
      objc_sync_exit(v6);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

@end