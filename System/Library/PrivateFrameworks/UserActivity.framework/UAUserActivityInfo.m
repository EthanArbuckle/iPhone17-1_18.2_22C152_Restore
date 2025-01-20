@interface UAUserActivityInfo
+ (BOOL)supportsSecureCoding;
+ (id)encodedInfoToOldEncodedInfo:(id)a3;
- (BOOL)active;
- (BOOL)eligibleForHandoff;
- (BOOL)eligibleForPrediction;
- (BOOL)eligibleForPublicIndexing;
- (BOOL)eligibleForReminders;
- (BOOL)eligibleForSearch;
- (BOOL)eligibleToAdvertise;
- (BOOL)eligibleToAlwaysAdvertise;
- (BOOL)isDirty;
- (BOOL)isPayloadAvailable;
- (BOOL)isPayloadRequested;
- (BOOL)isUniversalLink;
- (BOOL)requestPayloadWithCompletionHandler:(id)a3;
- (BOOL)requestPayloadWithCompletionHandlerEvenIfClean:(BOOL)a3 withCompletionHandler:(id)a4;
- (BOOL)setPayload:(id)a3 identifier:(id)a4;
- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3;
- (NSDate)expirationDate;
- (NSDate)lastInterestingTime;
- (NSDate)when;
- (NSDictionary)encodingOptions;
- (NSDictionary)options;
- (NSDictionary)payloads;
- (NSError)encodedUserInfoError;
- (NSError)error;
- (NSSet)keywords;
- (NSSet)requiredUserInfoKeys;
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (NSString)contentUserAction;
- (NSString)dynamicActivityType;
- (NSString)peerDeviceType;
- (NSString)persistentIdentifier;
- (NSString)targetContentIdentifier;
- (NSString)teamIdentifier;
- (NSString)title;
- (NSURL)referrerURL;
- (NSURL)webpageURL;
- (NSUUID)uuid;
- (SFPeerDevice)peerDevice;
- (UAUserActivityAnalyticsInfo)wasContinuedInfo;
- (UAUserActivityInfo)initWithArchivedUserActivityInfo:(id)a3;
- (UAUserActivityInfo)initWithCoder:(id)a3;
- (UAUserActivityInfo)initWithUUID:(id)a3 type:(unint64_t)a4 options:(id)a5;
- (UAUserActivityInfo)initWithUserActivityInfo:(id)a3;
- (id)archiveUserActivityInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)logString;
- (id)optionalUserActivityData;
- (id)payloadForIdentifier:(id)a3;
- (id)payloadIdentifiers;
- (id)provenance;
- (id)secondaryUserActivityString;
- (id)statusString;
- (id)userActivityString;
- (unint64_t)type;
- (void)_createUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5;
- (void)clearPayload;
- (void)encodeWithCoder:(id)a3;
- (void)fetchAllNearbyAppSuggestions:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setActivityType:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setContentUserAction:(id)a3;
- (void)setDynamicActivityType:(id)a3;
- (void)setEligibleForHandoff:(BOOL)a3;
- (void)setEligibleForPrediction:(BOOL)a3;
- (void)setEligibleForPublicIndexing:(BOOL)a3;
- (void)setEligibleForReminders:(BOOL)a3;
- (void)setEligibleForSearch:(BOOL)a3;
- (void)setEncodedUserInfoError:(id)a3;
- (void)setEncodingOptions:(id)a3;
- (void)setError:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setLastInterestingTime:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPayloadAvailable:(BOOL)a3;
- (void)setPayloadRequested:(BOOL)a3;
- (void)setPayloads:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setPeerDeviceType:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setReferrerURL:(id)a3;
- (void)setRequiredUserInfoKeys:(id)a3;
- (void)setTargetContentIdentifier:(id)a3;
- (void)setTeamIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUniversalLink:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)setWasContinuedInfo:(id)a3;
- (void)setWebpageURL:(id)a3;
- (void)setWhen:(id)a3;
@end

@implementation UAUserActivityInfo

- (void)setWhen:(id)a3
{
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setWebpageURL:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setTargetContentIdentifier:(id)a3
{
}

- (void)setReferrerURL:(id)a3
{
}

- (void)setPersistentIdentifier:(id)a3
{
}

- (void)setOptions:(id)a3
{
}

- (void)setEligibleForSearch:(BOOL)a3
{
  self->_eligibleForSearch = a3;
}

- (void)setEligibleForPublicIndexing:(BOOL)a3
{
  self->_eligibleForPublicIndexing = a3;
}

- (void)setEligibleForHandoff:(BOOL)a3
{
  self->_eligibleForHandoff = a3;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

- (void)setUniversalLink:(BOOL)a3
{
  self->_universalLink = a3;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setRequiredUserInfoKeys:(id)a3
{
}

- (void)setKeywords:(id)a3
{
}

- (void)setEncodingOptions:(id)a3
{
}

- (void)setEligibleForReminders:(BOOL)a3
{
  self->_eligibleForReminders = a3;
}

- (void)setEligibleForPrediction:(BOOL)a3
{
  self->_eligibleForPrediction = a3;
}

- (void)setDynamicActivityType:(id)a3
{
}

- (void)setContentUserAction:(id)a3
{
}

- (void)setActivityType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wasContinuedInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_peerDeviceType, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_contentUserAction, 0);
  objc_storeStrong((id *)&self->_encodingOptions, 0);
  objc_storeStrong((id *)&self->_lastInterestingTime, 0);
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_requiredUserInfoKeys, 0);
  objc_storeStrong((id *)&self->_encodedUserInfoError, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicActivityType, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_payloads, 0);
}

- (void)setPayloads:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v7)
  {
    uint64_t v5 = [v7 mutableCopy];
    payloads = v4->_payloads;
    v4->_payloads = (NSMutableDictionary *)v5;
  }
  else
  {
    payloads = v4->_payloads;
    v4->_payloads = 0;
  }

  objc_sync_exit(v4);
}

- (UAUserActivityInfo)initWithUserActivityInfo:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)UAUserActivityInfo;
  uint64_t v5 = [(UAUserActivityInfo *)&v60 init];
  if (v5)
  {
    uint64_t v6 = [v4 when];
    when = v5->_when;
    v5->_when = (NSDate *)v6;

    v8 = [v4 uuid];
    if (v8) {
      [v4 uuid];
    }
    else {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    }
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v9;

    v5->_type = [v4 type];
    v11 = [v4 options];
    uint64_t v12 = [v11 copy];
    options = v5->_options;
    v5->_options = (NSDictionary *)v12;

    v14 = [v4 activityType];
    uint64_t v15 = [v14 copy];
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v15;

    v17 = [v4 dynamicActivityType];
    uint64_t v18 = [v17 copy];
    dynamicActivityType = v5->_dynamicActivityType;
    v5->_dynamicActivityType = (NSString *)v18;

    v20 = [v4 teamIdentifier];
    uint64_t v21 = [v20 copy];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v21;

    v23 = [v4 bundleIdentifier];
    uint64_t v24 = [v23 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v24;

    v26 = [v4 title];
    uint64_t v27 = [v26 copy];
    title = v5->_title;
    v5->_title = (NSString *)v27;

    uint64_t v29 = [v4 webpageURL];
    webpageURL = v5->_webpageURL;
    v5->_webpageURL = (NSURL *)v29;

    uint64_t v31 = [v4 referrerURL];
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSURL *)v31;

    uint64_t v33 = [v4 targetContentIdentifier];
    targetContentIdentifier = v5->_targetContentIdentifier;
    v5->_targetContentIdentifier = (NSString *)v33;

    v35 = [v4 payloads];
    if (v35)
    {
      v36 = [v4 payloads];
      uint64_t v37 = [v36 mutableCopy];
      payloads = v5->_payloads;
      v5->_payloads = (NSMutableDictionary *)v37;
    }
    else
    {
      v36 = v5->_payloads;
      v5->_payloads = 0;
    }

    v39 = [v4 encodedUserInfoError];
    uint64_t v40 = [v39 copy];
    encodedUserInfoError = v5->_encodedUserInfoError;
    v5->_encodedUserInfoError = (NSError *)v40;

    v5->_eligibleForHandoff = [v4 eligibleForHandoff];
    v5->_eligibleForSearch = [v4 eligibleForSearch];
    v5->_eligibleForPublicIndexing = [v4 eligibleForPublicIndexing];
    v5->_eligibleForReminders = [v4 eligibleForReminders];
    v42 = [v4 contentUserAction];
    uint64_t v43 = [v42 copy];
    contentUserAction = v5->_contentUserAction;
    v5->_contentUserAction = (NSString *)v43;

    v45 = [v4 keywords];
    uint64_t v46 = [v45 copy];
    keywords = v5->_keywords;
    v5->_keywords = (NSSet *)v46;

    v48 = [v4 expirationDate];
    uint64_t v49 = [v48 copy];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v49;

    v5->_eligibleForPrediction = [v4 eligibleForPrediction];
    uint64_t v51 = [v4 persistentIdentifier];
    persistentIdentifier = v5->_persistentIdentifier;
    v5->_persistentIdentifier = (NSString *)v51;

    v53 = [v4 peerDeviceType];
    uint64_t v54 = [v53 copy];
    peerDeviceType = v5->_peerDeviceType;
    v5->_peerDeviceType = (NSString *)v54;

    v56 = [v4 peerDevice];
    uint64_t v57 = [v56 copy];
    peerDevice = v5->_peerDevice;
    v5->_peerDevice = (SFPeerDevice *)v57;

    v5->_active = [v4 active];
    v5->_universalLink = [v4 isUniversalLink];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v46 = a3;
  [v46 encodeInt32:1 forKey:@"version"];
  id v4 = [(UAUserActivityInfo *)self error];

  if (v4)
  {
    uint64_t v5 = [(UAUserActivityInfo *)self error];
    [v46 encodeObject:v5 forKey:@"error"];
  }
  else
  {
    uint64_t v6 = [(UAUserActivityInfo *)self uuid];
    id v7 = v46;
    uint64_t v8 = objc_opt_class();
    encodeObjectOfType(v7, v6, v8, @"uuid");

    objc_msgSend(v7, "encodeInteger:forKey:", -[UAUserActivityInfo type](self, "type"), @"type");
    uint64_t v9 = [(UAUserActivityInfo *)self options];
    encodeDictionary(v7, v9, @"options");

    v10 = [(UAUserActivityInfo *)self title];
    encodeString(v7, v10, @"title");

    v11 = [(UAUserActivityInfo *)self webpageURL];
    encodeURL(v7, v11, @"webpageURL");

    uint64_t v12 = [(UAUserActivityInfo *)self referrerURL];
    encodeURL(v7, v12, @"referrerURL");

    v13 = [(UAUserActivityInfo *)self targetContentIdentifier];
    encodeString(v7, v13, @"targetContentIdentifier");

    v14 = [(UAUserActivityInfo *)self activityType];
    encodeString(v7, v14, @"activityType");

    uint64_t v15 = [(UAUserActivityInfo *)self dynamicActivityType];
    encodeString(v7, v15, @"dynamicActivityType");

    v16 = [(UAUserActivityInfo *)self teamIdentifier];
    encodeString(v7, v16, @"teamIdentifier");

    v17 = [(UAUserActivityInfo *)self bundleIdentifier];
    encodeString(v7, v17, @"bundleIdentifier");

    uint64_t v18 = [(UAUserActivityInfo *)self peerDevice];
    Class SFPeerDeviceClass = getSFPeerDeviceClass();
    encodeObjectOfType(v7, v18, (uint64_t)SFPeerDeviceClass, @"peerDevice");

    v20 = [(UAUserActivityInfo *)self peerDeviceType];
    encodeString(v7, v20, @"peerDeviceType");

    uint64_t v21 = [(UAUserActivityInfo *)self when];
    uint64_t v22 = objc_opt_class();
    encodeObjectOfType(v7, v21, v22, @"when");

    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo active](self, "active"), @"isActive");
    v23 = [(UAUserActivityInfo *)self encodingOptions];
    uint64_t v24 = [v23 objectForKey:@"NSUserActivityMinimalExtraInfo"];
    int v25 = [v24 BOOLValue];

    v26 = [(UAUserActivityInfo *)self encodingOptions];
    uint64_t v27 = [v26 objectForKey:@"NSUserActivityDontEncodePayload"];
    char v28 = [v27 BOOLValue];

    if (v25)
    {
      uint64_t v29 = [(UAUserActivityInfo *)self encodingOptions];
      v30 = [v29 objectForKey:@"NSUserActivityDontEncodeContentAttributes"];
      int v31 = [v30 BOOLValue];
    }
    else
    {
      int v31 = 1;
    }
    v32 = [(UAUserActivityInfo *)self payloads];
    uint64_t v5 = (void *)[v32 mutableCopy];

    uint64_t v33 = [v5 objectForKey:@"UAUserActivityStreamsPayload"];

    if (v33)
    {
      v34 = [v5 objectForKey:@"UAUserActivityStreamsPayload"];
      encodeData(v7, v34, @"streamsData");

      [v5 removeObjectForKey:@"UAUserActivityStreamsPayload"];
    }
    if (v31)
    {
      v35 = [(UAUserActivityInfo *)self contentUserAction];
      encodeString(v7, v35, @"contentAction");

      v36 = [(UAUserActivityInfo *)self keywords];
      encodeSet(v7, v36, @"keywords");
    }
    uint64_t v37 = [v5 objectForKey:@"UAUserActivityContentAttributeSetPayloadKey"];

    if (v37)
    {
      v38 = [v5 objectForKey:@"UAUserActivityContentAttributeSetPayloadKey"];
      encodeData(v7, v38, @"contentAttributeSetData");

      if (v31) {
        [v5 removeObjectForKey:@"UAUserActivityContentAttributeSetPayloadKey"];
      }
    }
    if ((v28 & 1) == 0)
    {
      v39 = [(UAUserActivityInfo *)self payloadForIdentifier:@"UAUserActivityUserInfoPayload"];
      if (v39)
      {
        encodeData(v7, v39, @"payload");
        [v5 removeObjectForKey:@"UAUserActivityUserInfoPayload"];
      }
      uint64_t v40 = [(UAUserActivityInfo *)self encodedUserInfoError];
      uint64_t v41 = objc_opt_class();
      encodeObjectOfType(v7, v40, v41, @"payloadError");
    }
    if ([v5 count]) {
      encodeDictionary(v7, v5, @"payloads");
    }
    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo eligibleForHandoff](self, "eligibleForHandoff"), @"eligibleForHandoff");
    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo eligibleForSearch](self, "eligibleForSearch"), @"eligibleForSearch");
    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo eligibleForPublicIndexing](self, "eligibleForPublicIndexing"), @"eligibleForPublicIndexing");
    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo eligibleForReminders](self, "eligibleForReminders"), @"eligibleForReminders");
    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo eligibleForPrediction](self, "eligibleForPrediction"), @"eligibleForPrediction");
    v42 = [(UAUserActivityInfo *)self persistentIdentifier];
    [v7 encodeObject:v42 forKey:@"persistentIdentifier"];

    uint64_t v43 = [(UAUserActivityInfo *)self expirationDate];
    uint64_t v44 = objc_opt_class();
    encodeObjectOfType(v7, v43, v44, @"expirationDate");

    requiredUserInfoKeys = self->_requiredUserInfoKeys;
    if (requiredUserInfoKeys) {
      encodeSet(v7, requiredUserInfoKeys, @"requiredKeys");
    }
    if ([(UAUserActivityInfo *)self isUniversalLink]) {
      encodeObject(v7, MEMORY[0x1E4F1CC38], @"universalLink");
    }
  }
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSURL)webpageURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (NSDictionary)payloads
{
  v2 = self;
  objc_sync_enter(v2);
  payloads = v2->_payloads;
  if (payloads) {
    id v4 = (void *)[(NSMutableDictionary *)payloads copy];
  }
  else {
    id v4 = 0;
  }
  objc_sync_exit(v2);

  return (NSDictionary *)v4;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (BOOL)eligibleForHandoff
{
  return self->_eligibleForHandoff;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)targetContentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSURL)referrerURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (NSDate)when
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)persistentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)eligibleForSearch
{
  return self->_eligibleForSearch;
}

- (BOOL)eligibleForPublicIndexing
{
  return self->_eligibleForPublicIndexing;
}

- (NSDictionary)encodingOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (id)payloadForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    payloads = v5->_payloads;
    if (payloads)
    {
      id v7 = [(NSMutableDictionary *)payloads objectForKey:v4];
    }
    else
    {
      id v7 = 0;
    }
    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)isUniversalLink
{
  return self->_universalLink;
}

- (NSString)dynamicActivityType
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)teamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (SFPeerDevice)peerDevice
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)peerDeviceType
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (NSSet)keywords
{
  return (NSSet *)objc_getProperty(self, a2, 160, 1);
}

- (NSError)encodedUserInfoError
{
  return (NSError *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)eligibleForReminders
{
  return self->_eligibleForReminders;
}

- (BOOL)eligibleForPrediction
{
  return self->_eligibleForPrediction;
}

- (NSString)contentUserAction
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (BOOL)active
{
  return self->_active;
}

- (UAUserActivityInfo)initWithCoder:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)UAUserActivityInfo;
  uint64_t v5 = [(UAUserActivityInfo *)&v71 init];
  if (!v5) {
    goto LABEL_28;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  [(UAUserActivityInfo *)v5 setError:v6];

  id v7 = [(UAUserActivityInfo *)v5 error];

  if (v7) {
    goto LABEL_28;
  }
  if (initWithCoder__sOnce != -1) {
    dispatch_once(&initWithCoder__sOnce, &__block_literal_global_1);
  }
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v8;

  v5->_type = [v4 decodeIntegerForKey:@"type"];
  uint64_t v10 = [v4 decodeObjectOfClasses:initWithCoder__sAcceptableObjects forKey:@"options"];
  options = v5->_options;
  v5->_options = (NSDictionary *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  title = v5->_title;
  v5->_title = (NSString *)v12;

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webpageURL"];
  if (+[UAUserActivity checkWebpageURL:v14 actionType:[(UAUserActivityInfo *)v5 type] throwIfFailed:0])
  {
    objc_storeStrong((id *)&v5->_webpageURL, v14);
  }
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerURL"];
  referrerURL = v5->_referrerURL;
  v5->_referrerURL = (NSURL *)v15;

  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetContentIdentifier"];
  targetContentIdentifier = v5->_targetContentIdentifier;
  v5->_targetContentIdentifier = (NSString *)v17;

  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  payloads = v5->_payloads;
  v5->_payloads = v19;

  uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"streamsData"];
  [(UAUserActivityInfo *)v5 setPayload:v21 identifier:@"UAUserActivityStreamsPayload"];

  uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  [(UAUserActivityInfo *)v5 setPayload:v22 identifier:@"UAUserActivityUserInfoPayload"];

  v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
  uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"payloads"];

  if (v27)
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    char v28 = [v27 allKeys];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v67 objects:v72 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      v65 = v14;
      id v66 = v4;
      uint64_t v31 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v68 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v27)
            {
              v34 = [v27 objectForKeyedSubscript:v33];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass) {
                continue;
              }
            }
          }

          uint64_t v27 = 0;
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v67 objects:v72 count:16];
      }
      while (v30);

      v14 = v65;
      id v4 = v66;
      if (!v27) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    [(NSMutableDictionary *)v5->_payloads addEntriesFromDictionary:v27];
  }
LABEL_23:
  uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"when"];
  when = v5->_when;
  v5->_when = (NSDate *)v36;

  v5->_active = [v4 decodeBoolForKey:@"isActive"];
  uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerDeviceType"];
  peerDeviceType = v5->_peerDeviceType;
  v5->_peerDeviceType = (NSString *)v38;

  getSFPeerDeviceClass();
  uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerDevice"];
  peerDevice = v5->_peerDevice;
  v5->_peerDevice = (SFPeerDevice *)v40;

  uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v42;

  uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityType"];
  activityType = v5->_activityType;
  v5->_activityType = (NSString *)v44;

  uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dynamicActivityType"];
  dynamicActivityType = v5->_dynamicActivityType;
  v5->_dynamicActivityType = (NSString *)v46;

  uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamIdentifier"];
  teamIdentifier = v5->_teamIdentifier;
  v5->_teamIdentifier = (NSString *)v48;

  uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadError"];
  encodedUserInfoError = v5->_encodedUserInfoError;
  v5->_encodedUserInfoError = (NSError *)v50;

  v5->_eligibleForHandoff = [v4 decodeBoolForKey:@"eligibleForHandoff"];
  v5->_eligibleForSearch = [v4 decodeBoolForKey:@"eligibleForSearch"];
  v5->_eligibleForPublicIndexing = [v4 decodeBoolForKey:@"eligibleForPublicIndexing"];
  v5->_eligibleForReminders = [v4 decodeBoolForKey:@"eligibleForReminders"];
  if (initWithCoder__sKeywordsOnce != -1) {
    dispatch_once(&initWithCoder__sKeywordsOnce, &__block_literal_global_94);
  }
  uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentActions"];
  contentUserAction = v5->_contentUserAction;
  v5->_contentUserAction = (NSString *)v52;

  uint64_t v54 = [v4 decodeObjectOfClasses:initWithCoder__sKeywordsAcceptableObjects forKey:@"keywords"];
  keywords = v5->_keywords;
  v5->_keywords = (NSSet *)v54;

  uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v56;

  v5->_eligibleForPrediction = [v4 decodeBoolForKey:@"eligibleForPrediction"];
  uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentIdentifier"];
  persistentIdentifier = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v58;

  objc_super v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentAttributeSetData"];
  if (v60) {
    [(NSMutableDictionary *)v5->_payloads setObject:v60 forKey:@"UAUserActivityContentAttributeSetPayloadKey"];
  }
  uint64_t v61 = [v4 decodeObjectOfClasses:initWithCoder__sKeywordsAcceptableObjects forKey:@"requiredKeys"];
  requiredUserInfoKeys = v5->_requiredUserInfoKeys;
  v5->_requiredUserInfoKeys = (NSSet *)v61;

  v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"universalLink"];
  v5->_universalLink = [v63 BOOLValue];

LABEL_28:
  return v5;
}

- (BOOL)setPayload:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = self;
    objc_sync_enter(v8);
    payloads = v8->_payloads;
    if (v6)
    {
      if (payloads)
      {
        uint64_t v10 = [(NSMutableDictionary *)payloads objectForKey:v7];
        char v11 = [v6 isEqual:v10];

        [(NSMutableDictionary *)v8->_payloads setObject:v6 forKey:v7];
LABEL_11:
        objc_sync_exit(v8);

        goto LABEL_12;
      }
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v6 forKey:v7];
      v13 = v8->_payloads;
      v8->_payloads = (NSMutableDictionary *)v12;
    }
    else
    {
      if (!payloads)
      {
        char v11 = 0;
        goto LABEL_11;
      }
      [(NSMutableDictionary *)payloads removeObjectForKey:v7];
    }
    char v11 = 1;
    goto LABEL_11;
  }
  char v11 = 0;
LABEL_12:

  return v11;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 184, 1);
}

- (void)setError:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_createUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(UAUserActivityInfo *)self payloads];
  uint64_t v10 = [v9 objectForKey:@"UAUserActivityUserInfoPayload"];

  id v11 = v10;
  v13 = id v12 = _UACopyUnpackedObjectFromData([v11 bytes], objc_msgSend(v11, "length"), 0);
  v14 = (void *)v13;
  if (v7)
  {
    v96 = (void *)v13;
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    v16 = [(UAUserActivityInfo *)self dynamicActivityType];

    if (v16)
    {
      uint64_t v17 = NSString;
      uint64_t v18 = [(UAUserActivityInfo *)self dynamicActivityType];
      v19 = +[UAUserActivity _encodeToString:v18];
      v20 = [v17 stringWithFormat:@"dt=%@", v19];
      [v15 addObject:v20];
    }
    uint64_t v21 = [(UAUserActivityInfo *)self title];
    if (v21)
    {
      uint64_t v22 = (void *)v21;
      v23 = [(UAUserActivityInfo *)self title];
      uint64_t v24 = [v23 length];

      if (v24)
      {
        uint64_t v25 = NSString;
        v26 = [(UAUserActivityInfo *)self title];
        uint64_t v27 = +[UAUserActivity _encodeToString:v26];
        char v28 = [v25 stringWithFormat:@"t=%@", v27];
        [v15 addObject:v28];
      }
    }
    if ([(UAUserActivityInfo *)self type] != 1)
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"type=%ld", -[UAUserActivityInfo type](self, "type"));
      [v15 addObject:v29];
    }
    uint64_t v30 = [(UAUserActivityInfo *)self webpageURL];

    if (v30)
    {
      uint64_t v31 = NSString;
      v32 = [(UAUserActivityInfo *)self webpageURL];
      [v32 absoluteString];
      v34 = uint64_t v33 = self;
      v35 = +[UAUserActivity _encodeToString:v34];
      uint64_t v36 = [v31 stringWithFormat:@"url=%@", v35];
      [v15 addObject:v36];

      self = v33;
    }
    uint64_t v37 = [(UAUserActivityInfo *)self referrerURL];

    if (v37)
    {
      uint64_t v38 = NSString;
      v39 = [(UAUserActivityInfo *)self referrerURL];
      [v39 absoluteString];
      v41 = uint64_t v40 = self;
      uint64_t v42 = +[UAUserActivity _encodeToString:v41];
      uint64_t v43 = [v38 stringWithFormat:@"referrer=%@", v42];
      [v15 addObject:v43];

      self = v40;
    }
    uint64_t v44 = [(UAUserActivityInfo *)self targetContentIdentifier];

    if (v44)
    {
      v45 = NSString;
      uint64_t v46 = [(UAUserActivityInfo *)self targetContentIdentifier];
      v47 = +[UAUserActivity _encodeToString:v46];
      uint64_t v48 = [v45 stringWithFormat:@"targetIdentifier=%@", v47];
      [v15 addObject:v48];
    }
    if (v12)
    {
      uint64_t v49 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v50 = [(UAUserActivityInfo *)self requiredUserInfoKeys];
      id v90 = v11;
      id v92 = v7;
      v89 = self;
      v94 = v15;
      if (v50)
      {
        uint64_t v51 = [(UAUserActivityInfo *)self requiredUserInfoKeys];
        uint64_t v52 = [v51 allObjects];
      }
      else
      {
        uint64_t v52 = [v12 allKeys];
      }

      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      v87 = v52;
      v53 = sortedArrayOfNSStringValues(v52);
      uint64_t v54 = [v53 countByEnumeratingWithState:&v103 objects:v108 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v104;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v104 != v56) {
              objc_enumerationMutation(v53);
            }
            uint64_t v58 = *(void *)(*((void *)&v103 + 1) + 8 * i);
            v59 = [v12 objectForKey:v58];
            objc_super v60 = +[UAUserActivity _encodeKeyAndValueIntoString:v58 value:v59];
            [v49 addObject:v60];
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v103 objects:v108 count:16];
        }
        while (v55);
      }

      if ([v49 count])
      {
        uint64_t v61 = NSString;
        v62 = [v49 componentsJoinedByString:@","];
        v63 = [v61 stringWithFormat:@"u={%@}", v62, v87];
        [v94 addObject:v63];
      }
      id v11 = v90;
      id v7 = v92;
      self = v89;
      uint64_t v15 = v94;
    }
    if ([(UAUserActivityInfo *)self isUniversalLink]) {
      [v15 addObject:@"universalLink=1"];
    }
    v64 = [(UAUserActivityInfo *)self activityType];
    v14 = v96;
    [v64 stringByAddingPercentEncodingWithAllowedCharacters:v96];
    id v66 = v65 = v15;
    [v7 appendFormat:@"v1.0/%@/", v66];

    if ([v65 count])
    {
      long long v67 = [v65 componentsJoinedByString:@"&"];
      [v7 appendFormat:@"%@", v67];
    }
  }
  if (v8)
  {
    v95 = [MEMORY[0x1E4F1CA48] array];
    if ([v12 count])
    {
      uint64_t v68 = [(UAUserActivityInfo *)self requiredUserInfoKeys];
      if (v68)
      {
        long long v69 = (void *)v68;
        long long v70 = [(UAUserActivityInfo *)self requiredUserInfoKeys];
        uint64_t v71 = [v70 count];

        if (v71)
        {
          v97 = v14;
          id v98 = v8;
          id v91 = v11;
          id v93 = v7;
          v72 = [MEMORY[0x1E4F1CA48] array];
          [v12 allKeys];
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          v88 = long long v102 = 0u;
          uint64_t v73 = sortedArrayOfNSStringValues(v88);
          uint64_t v74 = [v73 countByEnumeratingWithState:&v99 objects:v107 count:16];
          if (v74)
          {
            uint64_t v75 = v74;
            uint64_t v76 = *(void *)v100;
            do
            {
              for (uint64_t j = 0; j != v75; ++j)
              {
                if (*(void *)v100 != v76) {
                  objc_enumerationMutation(v73);
                }
                uint64_t v78 = *(void *)(*((void *)&v99 + 1) + 8 * j);
                v79 = [(UAUserActivityInfo *)self requiredUserInfoKeys];
                char v80 = [v79 containsObject:v78];

                if ((v80 & 1) == 0)
                {
                  v81 = [v12 objectForKey:v78];
                  v82 = +[UAUserActivity _encodeKeyAndValueIntoString:v78 value:v81];
                  [v72 addObject:v82];
                }
              }
              uint64_t v75 = [v73 countByEnumeratingWithState:&v99 objects:v107 count:16];
            }
            while (v75);
          }

          if ([v72 count])
          {
            v83 = NSString;
            v84 = [v72 componentsJoinedByString:@","];
            v85 = [v83 stringWithFormat:@"ue={%@}", v84, v88];
            [v95 addObject:v85];
          }
          id v11 = v91;
          id v7 = v93;
          v14 = v97;
          id v8 = v98;
        }
      }
    }
    if ([v95 count])
    {
      v86 = [v95 componentsJoinedByString:@"&"];
      [v8 appendFormat:@"%@", v86];
    }
  }
}

- (NSSet)requiredUserInfoKeys
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEncodedUserInfoError:(id)a3
{
}

- (UAUserActivityInfo)initWithUUID:(id)a3 type:(unint64_t)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)UAUserActivityInfo;
  uint64_t v10 = [(UAUserActivityInfo *)&v18 init];
  if (v10)
  {
    if (v8) {
      id v11 = (NSUUID *)[v8 copy];
    }
    else {
      id v11 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    }
    uuid = v10->_uuid;
    v10->_uuid = v11;

    v10->_type = a4;
    uint64_t v13 = [v9 copy];
    options = v10->_options;
    v10->_options = (NSDictionary *)v13;

    v10->_active = 1;
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    when = v10->_when;
    v10->_when = (NSDate *)v15;
  }
  return v10;
}

- (UAUserActivityInfo)initWithArchivedUserActivityInfo:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initForReadingFromData:v5 error:0];

  id v7 = [(UAUserActivityInfo *)self initWithCoder:v6];
  [v6 finishDecoding];

  return v7;
}

void __36__UAUserActivityInfo_initWithCoder___block_invoke()
{
  v4[10] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 initWithArray:v1];
  v3 = (void *)initWithCoder__sAcceptableObjects;
  initWithCoder__sAcceptableObjects = v2;
}

void __36__UAUserActivityInfo_initWithCoder___block_invoke_2()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 initWithArray:v1];
  v3 = (void *)initWithCoder__sKeywordsAcceptableObjects;
  initWithCoder__sKeywordsAcceptableObjects = v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[UAUserActivityInfo allocWithZone:a3] init];
  if (v4)
  {
    uint64_t v5 = [(UAUserActivityInfo *)self uuid];
    uuid = v4->_uuid;
    v4->_uuid = (NSUUID *)v5;

    [(UAUserActivityInfo *)v4 setType:[(UAUserActivityInfo *)self type]];
    id v7 = [(UAUserActivityInfo *)self options];
    [(UAUserActivityInfo *)v4 setOptions:v7];

    id v8 = [(UAUserActivityInfo *)self title];
    [(UAUserActivityInfo *)v4 setTitle:v8];

    id v9 = [(UAUserActivityInfo *)self activityType];
    [(UAUserActivityInfo *)v4 setActivityType:v9];

    uint64_t v10 = [(UAUserActivityInfo *)self dynamicActivityType];
    [(UAUserActivityInfo *)v4 setDynamicActivityType:v10];

    id v11 = [(UAUserActivityInfo *)self teamIdentifier];
    [(UAUserActivityInfo *)v4 setTeamIdentifier:v11];

    id v12 = [(UAUserActivityInfo *)self webpageURL];
    [(UAUserActivityInfo *)v4 setWebpageURL:v12];

    uint64_t v13 = [(UAUserActivityInfo *)self referrerURL];
    [(UAUserActivityInfo *)v4 setReferrerURL:v13];

    v14 = [(UAUserActivityInfo *)self targetContentIdentifier];
    [(UAUserActivityInfo *)v4 setTargetContentIdentifier:v14];

    uint64_t v15 = [(UAUserActivityInfo *)self payloads];
    if (v15)
    {
      v16 = [(UAUserActivityInfo *)self payloads];
      uint64_t v17 = [v16 mutableCopy];
      payloads = v4->_payloads;
      v4->_payloads = (NSMutableDictionary *)v17;
    }
    else
    {
      v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v16 = v4->_payloads;
      v4->_payloads = v19;
    }

    v20 = [(UAUserActivityInfo *)self encodedUserInfoError];
    [(UAUserActivityInfo *)v4 setEncodedUserInfoError:v20];

    uint64_t v21 = [(UAUserActivityInfo *)self requiredUserInfoKeys];
    [(UAUserActivityInfo *)v4 setRequiredUserInfoKeys:v21];

    [(UAUserActivityInfo *)v4 setUniversalLink:[(UAUserActivityInfo *)self isUniversalLink]];
    [(UAUserActivityInfo *)v4 setEligibleForHandoff:[(UAUserActivityInfo *)self eligibleForHandoff]];
    [(UAUserActivityInfo *)v4 setEligibleForSearch:[(UAUserActivityInfo *)self eligibleForSearch]];
    [(UAUserActivityInfo *)v4 setEligibleForPublicIndexing:[(UAUserActivityInfo *)self eligibleForPublicIndexing]];
    uint64_t v22 = [(UAUserActivityInfo *)self contentUserAction];
    [(UAUserActivityInfo *)v4 setContentUserAction:v22];

    v23 = [(UAUserActivityInfo *)self keywords];
    [(UAUserActivityInfo *)v4 setKeywords:v23];

    uint64_t v24 = [(UAUserActivityInfo *)self expirationDate];
    [(UAUserActivityInfo *)v4 setExpirationDate:v24];

    uint64_t v25 = [(UAUserActivityInfo *)self when];
    [(UAUserActivityInfo *)v4 setWhen:v25];

    [(UAUserActivityInfo *)v4 setActive:[(UAUserActivityInfo *)self active]];
    [(UAUserActivityInfo *)v4 setEligibleForPrediction:[(UAUserActivityInfo *)self eligibleForPrediction]];
    v26 = [(UAUserActivityInfo *)self persistentIdentifier];
    [(UAUserActivityInfo *)v4 setPersistentIdentifier:v26];

    uint64_t v27 = [(UAUserActivityInfo *)self error];
    [(UAUserActivityInfo *)v4 setError:v27];
  }
  return v4;
}

- (id)payloadIdentifiers
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  payloads = v2->_payloads;
  if (payloads)
  {
    id v4 = [(NSMutableDictionary *)payloads allKeys];
  }
  else
  {
    id v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)userActivityString
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(UAUserActivityInfo *)self _createUserActivityStrings:v3 secondaryString:0 optionalData:0];
  if (v3 && [v3 length]) {
    id v4 = (void *)[v3 copy];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)secondaryUserActivityString
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(UAUserActivityInfo *)self _createUserActivityStrings:0 secondaryString:v3 optionalData:0];
  if (v3 && [v3 length]) {
    id v4 = (void *)[v3 copy];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)optionalUserActivityData
{
  v3 = [MEMORY[0x1E4F1CA58] data];
  [(UAUserActivityInfo *)self _createUserActivityStrings:0 secondaryString:0 optionalData:v3];
  if (v3 && [v3 length]) {
    id v4 = (void *)[v3 copy];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)requestPayloadWithCompletionHandler:(id)a3
{
  return [(UAUserActivityInfo *)self requestPayloadWithCompletionHandlerEvenIfClean:0 withCompletionHandler:a3];
}

- (void)fetchAllNearbyAppSuggestions:(id)a3
{
}

- (BOOL)requestPayloadWithCompletionHandlerEvenIfClean:(BOOL)a3 withCompletionHandler:(id)a4
{
  return 1;
}

- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3
{
  return 1;
}

- (void)clearPayload
{
}

- (id)archiveUserActivityInfo
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  [v3 finishEncoding];
  id v4 = [v3 encodedData];

  return v4;
}

+ (id)encodedInfoToOldEncodedInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  uint64_t v5 = [v3 length];

  id v6 = _UACopyUnpackedObjectFromData(v4, v5, 0);
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v8 encodeObject:v7 forKey:*MEMORY[0x1E4F284E8]];
    [v8 finishEncoding];
    id v9 = [v8 encodedData];
    CFRelease(v7);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)logString
{
  id v3 = [(UAUserActivityInfo *)self error];

  uint64_t v4 = NSString;
  if (v3)
  {
    uint64_t v5 = [(UAUserActivityInfo *)self error];
    id v6 = [v4 stringWithFormat:@"UAUserActivityInfo: error=%@", v5];
  }
  else
  {
    uint64_t v5 = suggestedActionTypeString([(UAUserActivityInfo *)self type]);
    uint64_t v27 = [(UAUserActivityInfo *)self uuid];
    v26 = [v27 UUIDString];
    uint64_t v30 = [(UAUserActivityInfo *)self activityType];
    uint64_t v25 = [(UAUserActivityInfo *)self dynamicActivityType];
    if (v25)
    {
      id v7 = NSString;
      uint64_t v22 = [(UAUserActivityInfo *)self dynamicActivityType];
      uint64_t v29 = [v7 stringWithFormat:@":%@", v22];
    }
    else
    {
      uint64_t v29 = &stru_1F0CB4508;
    }
    uint64_t v24 = [(UAUserActivityInfo *)self teamIdentifier];
    if (v24)
    {
      id v8 = NSString;
      uint64_t v21 = [(UAUserActivityInfo *)self teamIdentifier];
      char v28 = [v8 stringWithFormat:@"(%@)", v21];
    }
    else
    {
      char v28 = &stru_1F0CB4508;
    }
    id v9 = [(UAUserActivityInfo *)self encodedUserInfoError];
    if (v9)
    {
      v23 = [(UAUserActivityInfo *)self encodedUserInfoError];
      [v23 description];
    }
    else
    {
      v23 = [(UAUserActivityInfo *)self payloads];
      v20 = [v23 objectForKey:@"UAUserActivityUserInfoPayload"];
      trimmedHexStringForData(v20, 16);
    uint64_t v10 = };
    id v11 = NSString;
    id v12 = [(UAUserActivityInfo *)self webpageURL];
    uint64_t v13 = @"webPageURL=<private>";
    if (!v12) {
      uint64_t v13 = &stru_1F0CB4508;
    }
    v14 = [v11 stringWithFormat:@"%@", v13];
    uint64_t v15 = NSString;
    v16 = [(UAUserActivityInfo *)self referrerURL];
    uint64_t v17 = @"referrer=<private>";
    if (!v16) {
      uint64_t v17 = &stru_1F0CB4508;
    }
    objc_super v18 = [v15 stringWithFormat:@"%@", v17];
    objc_msgSend(v4, "stringWithFormat:", @"UAInfo:{ %@ %@%@%@ %@; userInfo=%@/%@%@}",
      v5,
      v26,
      v30,
      v29,
      v28,
      v10,
      v14,
    id v6 = v18);

    if (!v9)
    {

      uint64_t v10 = v20;
    }

    if (v24)
    {
    }
    if (v25)
    {
    }
  }

  return v6;
}

- (id)description
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(UAUserActivityInfo *)self error];

  uint64_t v5 = 0x1E4F29000uLL;
  id v6 = NSString;
  if (v4)
  {
    id v7 = [(UAUserActivityInfo *)self error];
    id v8 = [v6 stringWithFormat:@"UAUserActivityInfo: error=%@", v7];

    goto LABEL_47;
  }
  id v9 = suggestedActionTypeString([(UAUserActivityInfo *)self type]);
  uint64_t v10 = [(UAUserActivityInfo *)self uuid];
  uint64_t v11 = [v10 UUIDString];
  v59 = [(UAUserActivityInfo *)self activityType];
  uint64_t v58 = [(UAUserActivityInfo *)self dynamicActivityType];
  uint64_t v57 = [(UAUserActivityInfo *)self teamIdentifier];
  uint64_t v51 = [(UAUserActivityInfo *)self persistentIdentifier];
  if (v51)
  {
    uint64_t v55 = [(UAUserActivityInfo *)self persistentIdentifier];
  }
  else
  {
    uint64_t v55 = @"-";
  }
  uint64_t v50 = [(UAUserActivityInfo *)self payloads];
  uint64_t v49 = [v50 objectForKey:@"UAUserActivityUserInfoPayload"];
  uint64_t v56 = trimmedHexStringForData(v49, 64);
  uint64_t v12 = [(UAUserActivityInfo *)self webpageURL];
  uint64_t v13 = @" webPageURL=<private>";
  v14 = &stru_1F0CB4508;
  v47 = (void *)v12;
  if (!v12) {
    uint64_t v13 = &stru_1F0CB4508;
  }
  uint64_t v43 = v13;
  uint64_t v15 = [(UAUserActivityInfo *)self referrerURL];
  v16 = @" referrerURL=<private>";
  uint64_t v46 = (void *)v15;
  if (!v15) {
    v16 = &stru_1F0CB4508;
  }
  uint64_t v42 = v16;
  v45 = [(UAUserActivityInfo *)self payloads];
  uint64_t v44 = [v45 objectForKey:@"UAUserActivityStreamsPayload"];
  uint64_t v48 = v6;
  if (v44)
  {
    uint64_t v17 = NSString;
    uint64_t v40 = [(UAUserActivityInfo *)self payloads];
    v39 = [v40 objectForKey:@"UAUserActivityStreamsPayload"];
    uint64_t v38 = trimmedHexStringForData(v39, 16);
    [v17 stringWithFormat:@" streamData=%@", v38];
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v54 = v14;
  [(UAUserActivityInfo *)self payloadForIdentifier:@"UAUserActivityContentAttributeSetPayloadKey"];
  v41 = objc_super v18 = &stru_1F0CB4508;
  if (v41)
  {
    uint64_t v2 = &stru_1F0CB4508;
    v19 = NSString;
    uint64_t v37 = [(UAUserActivityInfo *)self payloadForIdentifier:@"UAUserActivityContentAttributeSetPayloadKey"];
    uint64_t v36 = trimmedHexStringForData(v37, 16);
    v20 = v19;
    objc_super v18 = &stru_1F0CB4508;
    [v20 stringWithFormat:@" contentAttr=%@", v36];
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = &stru_1F0CB4508;
  }
  uint64_t v52 = (void *)v11;
  uint64_t v21 = self;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v22 = [(UAUserActivityInfo *)v21 payloadIdentifiers];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v23)
  {
    uint64_t v2 = (__CFString *)v23;
    v35 = v21;
    id v24 = 0;
    uint64_t v25 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (__CFString *)((char *)i + 1))
      {
        if (*(void *)v61 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if (([v27 isEqual:@"UAUserActivityStreamsPayload"] & 1) == 0
          && ([v27 isEqual:@"UAUserActivityUserInfoPayload"] & 1) == 0
          && ([v27 isEqual:@"UAUserActivityContentAttributeSetPayloadKey"] & 1) == 0)
        {
          if (v24)
          {
            [v24 appendFormat:@" %@", v27];
          }
          else
          {
            id v24 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            objc_msgSend(v24, "appendFormat:", @"(%@"), v27;
          }
        }
      }
      uint64_t v2 = (__CFString *)[v22 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v2);

    if (!v24)
    {
      char v28 = 0;
      uint64_t v5 = 0x1E4F29000uLL;
      objc_super v18 = &stru_1F0CB4508;
      uint64_t v21 = v35;
      goto LABEL_33;
    }
    [v24 appendFormat:@""]);
    char v28 = (__CFString *)[v24 copy];
    uint64_t v22 = v24;
    uint64_t v5 = 0x1E4F29000;
    objc_super v18 = &stru_1F0CB4508;
    uint64_t v21 = v35;
  }
  else
  {
    char v28 = 0;
  }

LABEL_33:
  if (v28) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = &stru_1F0CB4508;
  }
  uint64_t v30 = [(UAUserActivityInfo *)v21 options];
  if (v30)
  {
    uint64_t v31 = *(void **)(v5 + 24);
    uint64_t v2 = [(UAUserActivityInfo *)v21 options];
    uint64_t v5 = userActivityInfoOptionsDictionaryString(v2);
    [v31 stringWithFormat:@" opts=%@", v5];
    objc_super v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v32 = [(UAUserActivityInfo *)v21 when];
  objc_msgSend(v48, "stringWithFormat:", @"UAUserActivityInfo:{ type = %@; uuid = %@; activityType = \"%@\"; dynamicActivityType = \"%@\"; teamID=%@; %@ userInfo = %@%@%@%@ - %@ - %@ %@; when = %@ }",
    v9,
    v52,
    v59,
    v58,
    v57,
    v55,
    v56,
    v43,
    v42,
    v54,
    v53,
    v29,
    v18,
    v32);
  v8 = uint64_t v33 = v18;

  if (v30)
  {
  }
  if (v41)
  {
  }
  if (v44)
  {
  }
  if (v51) {

  }
LABEL_47:

  return v8;
}

- (id)statusString
{
  id v3 = [(UAUserActivityInfo *)self payloads];
  uint64_t v4 = [v3 objectForKey:@"UAUserActivityUserInfoPayload"];
  v19 = trimmedHexStringForData(v4, 16);

  objc_super v18 = NSString;
  uint64_t v5 = suggestedActionTypeString([(UAUserActivityInfo *)self type]);
  id v6 = [(UAUserActivityInfo *)self uuid];
  id v7 = [v6 UUIDString];
  id v8 = [(UAUserActivityInfo *)self activityType];
  id v9 = [(UAUserActivityInfo *)self dynamicActivityType];
  if (v9)
  {
    uint64_t v10 = NSString;
    uint64_t v17 = [(UAUserActivityInfo *)self dynamicActivityType];
    uint64_t v11 = [v10 stringWithFormat:@":%@", v17];
  }
  else
  {
    uint64_t v11 = &stru_1F0CB4508;
  }
  unint64_t v12 = [(UAUserActivityInfo *)self type];
  uint64_t v13 = [(UAUserActivityInfo *)self webpageURL];
  if (v13) {
    v14 = @" webPageURL=<private>";
  }
  else {
    v14 = &stru_1F0CB4508;
  }
  uint64_t v15 = [v18 stringWithFormat:@"UAInfo:%@%@ %@%@ type=%ld %@%@", v5, v7, v8, v11, v12, v19, v14];

  if (v9)
  {
  }

  return v15;
}

- (id)provenance
{
  id v3 = NSString;
  uint64_t v4 = [(UAUserActivityInfo *)self uuid];
  uint64_t v5 = [(UAUserActivityInfo *)self activityType];
  uint64_t v6 = [(UAUserActivityInfo *)self dynamicActivityType];
  id v7 = (void *)v6;
  id v8 = &stru_1F0CB4508;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  id v9 = [v3 stringWithFormat:@"UAx:%@/%@-%@", v4, v5, v8];

  return v9;
}

- (NSDate)lastInterestingTime
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastInterestingTime:(id)a3
{
}

- (BOOL)eligibleToAdvertise
{
  return self->_eligibleToAdvertise;
}

- (BOOL)eligibleToAlwaysAdvertise
{
  return self->_eligibleToAlwaysAdvertise;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (BOOL)isPayloadAvailable
{
  return self->_payloadAvailable;
}

- (void)setPayloadAvailable:(BOOL)a3
{
  self->_payloadAvailable = a3;
}

- (BOOL)isPayloadRequested
{
  return self->_payloadRequested;
}

- (void)setPayloadRequested:(BOOL)a3
{
  self->_payloadRequested = a3;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)setPeerDevice:(id)a3
{
}

- (void)setPeerDeviceType:(id)a3
{
}

- (UAUserActivityAnalyticsInfo)wasContinuedInfo
{
  return (UAUserActivityAnalyticsInfo *)objc_getProperty(self, a2, 216, 1);
}

- (void)setWasContinuedInfo:(id)a3
{
}

@end