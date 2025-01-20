@interface VCUserActivityDonation
+ (id)timestampDateFormatter;
- (BOOL)isEqual:(id)a3;
- (INShortcut)shortcut;
- (NSDate)date;
- (NSDate)endDate;
- (NSString)fullDescription;
- (NSString)identifier;
- (NSString)sourceAppIdentifier;
- (NSString)sourceAppIdentifierForDisplay;
- (NSString)sourceAppIdentifierForLaunching;
- (NSString)subtitle;
- (NSString)suggestedPhrase;
- (NSString)title;
- (NSUserActivity)userActivity;
- (VCUserActivityDonation)initWithEvent:(id)a3;
- (VCUserActivityDonation)initWithUserActivity:(id)a3 identifier:(id)a4 sourceAppIdentifier:(id)a5 date:(id)a6;
- (id)dateString;
- (id)uniqueProperty;
- (unint64_t)hash;
@end

@implementation VCUserActivityDonation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)uniqueProperty
{
  v3 = [(VCUserActivityDonation *)self userActivity];
  v4 = [v3 userInfo];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(VCUserActivityDonation *)self userActivity];
  v7 = [v6 requiredUserInfoKeys];

  if (v7)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __40__VCUserActivityDonation_uniqueProperty__block_invoke;
    v20 = &unk_1E6076F40;
    id v21 = v7;
    id v22 = v5;
    [v22 enumerateKeysAndObjectsUsingBlock:&v17];
  }
  v8 = [(VCUserActivityDonation *)self sourceAppIdentifierForDisplay];
  if (v8) {
    [(VCUserActivityDonation *)self sourceAppIdentifierForDisplay];
  }
  else {
  v9 = [(VCUserActivityDonation *)self sourceAppIdentifier];
  }
  [v5 setObject:v9 forKeyedSubscript:@"VCUserActivitySourceAppIdentifier"];

  v10 = [(VCUserActivityDonation *)self userActivity];
  v11 = [v10 activityType];
  [v5 setObject:v11 forKeyedSubscript:@"VCUserActivityType"];

  v12 = [(VCUserActivityDonation *)self userActivity];
  v13 = [v12 webpageURL];

  if (v13)
  {
    v14 = [(VCUserActivityDonation *)self userActivity];
    v15 = [v14 webpageURL];
    [v5 setObject:v15 forKeyedSubscript:@"VCUserActivityWebpageURL"];
  }
  return v5;
}

void __40__VCUserActivityDonation_uniqueProperty__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (([*(id *)(a1 + 32) containsObject:v4] & 1) == 0)
    {
      v5 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315394;
        v7 = "-[VCUserActivityDonation uniqueProperty]_block_invoke";
        __int16 v8 = 2112;
        id v9 = v4;
        _os_log_impl(&dword_1B3C5C000, v5, OS_LOG_TYPE_DEFAULT, "%s %@ is not a required key; ignoring it in the donation's uniqueProperty.",
          (uint8_t *)&v6,
          0x16u);
      }

      [*(id *)(a1 + 40) removeObjectForKey:v4];
    }
  }
}

- (NSString)suggestedPhrase
{
  v2 = [(VCUserActivityDonation *)self userActivity];
  id v3 = [v2 suggestedInvocationPhrase];

  return (NSString *)v3;
}

- (NSString)fullDescription
{
  id v3 = [(VCUserActivityDonation *)self userActivity];
  v15 = NSString;
  id v4 = [v3 title];
  v5 = [v3 activityType];
  int v6 = [(VCUserActivityDonation *)self sourceAppIdentifier];
  v7 = [(VCUserActivityDonation *)self dateString];
  __int16 v8 = [v3 requiredUserInfoKeys];
  id v9 = [v3 userInfo];
  uint64_t v10 = [v3 webpageURL];
  if ([v3 _isEligibleForPrediction]) {
    v11 = @"Yes";
  }
  else {
    v11 = @"No";
  }
  v12 = [v3 interaction];
  v13 = [v15 stringWithFormat:@"Title: %@\nActivity Type: %@\nBundle Identifier: %@\nDate: %@\nRequired User Info Keys: %@\nUser Info: %@\nWeb Page URL: %@\nEligible For Prediction: %@\nInteraction: %@\n", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (NSString)subtitle
{
  id v3 = [(VCUserActivityDonation *)self sourceAppIdentifierForDisplay];
  char v4 = [v3 isEqualToString:@"com.apple.mobilenotes"];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    int v6 = [(VCUserActivityDonation *)self shortcut];
    v5 = [v6 activitySubtitle];
  }
  return (NSString *)v5;
}

- (NSString)title
{
  v2 = [(VCUserActivityDonation *)self userActivity];
  id v3 = [v2 title];

  return (NSString *)v3;
}

- (id)dateString
{
  id v3 = [(id)objc_opt_class() timestampDateFormatter];
  char v4 = [(VCUserActivityDonation *)self date];
  v5 = [v3 stringFromDate:v4];

  return v5;
}

- (NSString)sourceAppIdentifierForLaunching
{
  v2 = [(VCUserActivityDonation *)self shortcut];
  id v3 = [v2 activityBundleIdentifier];

  return (NSString *)v3;
}

- (NSString)sourceAppIdentifierForDisplay
{
  v2 = [(VCUserActivityDonation *)self shortcut];
  id v3 = [v2 activityBundleIdentifier];

  return (NSString *)v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash] ^ 0xC001F00D;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (VCUserActivityDonation *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSString *)self->_identifier isEqualToString:v4->_identifier];
  }

  return v5;
}

- (NSUserActivity)userActivity
{
  v2 = [(VCUserActivityDonation *)self shortcut];
  id v3 = [v2 userActivity];

  return (NSUserActivity *)v3;
}

- (VCUserActivityDonation)initWithEvent:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46 = v4;
  if (v4)
  {
    id v5 = v4;
    int v6 = [v5 metadata];
    v7 = [MEMORY[0x1E4F5B4A8] userActivityRequiredString];
    v50 = [v6 objectForKeyedSubscript:v7];

    if (v50)
    {
      v52 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityStrings:v50 secondaryString:0 optionalData:0];
      __int16 v8 = [v5 metadata];
      id v9 = [MEMORY[0x1E4F5B4A8] suggestedInvocationPhrase];
      uint64_t v10 = [v8 objectForKeyedSubscript:v9];
      [v52 setSuggestedInvocationPhrase:v10];

      v11 = [v5 metadata];
      v12 = [MEMORY[0x1E4F5B4A8] isEligibleForPrediction];
      v45 = [v11 objectForKeyedSubscript:v12];

      if (v45) {
        objc_msgSend(v52, "setEligibleForPrediction:", -[NSObject BOOLValue](v45, "BOOLValue"));
      }
      v13 = [v5 metadata];
      v14 = [MEMORY[0x1E4F5B4A8] itemRelatedContentURL];
      v49 = [v13 objectForKeyedSubscript:v14];

      v15 = [v5 metadata];
      v16 = [MEMORY[0x1E4F5B4A8] itemRelatedUniqueIdentifier];
      v48 = [v15 objectForKeyedSubscript:v16];

      uint64_t v17 = [v5 metadata];
      uint64_t v18 = [MEMORY[0x1E4F5B4A8] contentDescription];
      v47 = [v17 objectForKeyedSubscript:v18];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v59 = __Block_byref_object_copy_;
      v60 = __Block_byref_object_dispose_;
      id v61 = 0;
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
      v44 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
      uint64_t v20 = *MEMORY[0x1E4F23648];
      v57[0] = @"_kMDItemThumbnailDataPath";
      v57[1] = v20;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
      id v22 = [v5 source];
      v23 = [v22 bundleID];
      v24 = [v5 metadata];
      v25 = [MEMORY[0x1E4F5B4A8] itemIdentifier];
      v26 = [v24 objectForKeyedSubscript:v25];
      v56 = v26;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      uint64_t v28 = *MEMORY[0x1E4F28340];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __VCUserActivityFromEvent_block_invoke;
      v53[3] = &unk_1E6076F68;
      v55 = buf;
      v29 = v19;
      v54 = v29;
      [v44 slowFetchAttributes:v21 protectionClass:v28 bundleID:v23 identifiers:v27 completionHandler:v53];

      dispatch_time_t v30 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v29, v30);
      if (v49 || v48 || v47 || *(void *)(*(void *)&buf[8] + 40))
      {
        id v31 = objc_alloc(MEMORY[0x1E4F23850]);
        v32 = [(id)*MEMORY[0x1E4F44370] identifier];
        v33 = (void *)[v31 initWithItemContentType:v32];

        [v33 setRelatedUniqueIdentifier:v48];
        [v33 setContentURL:v49];
        [v33 setContentDescription:v47];
        [v33 setThumbnailURL:*(void *)(*(void *)&buf[8] + 40)];
        [v52 setContentAttributeSet:v33];
      }
      _Block_object_dispose(buf, 8);

      v34 = v45;
    }
    else
    {
      v34 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [v5 metadata];
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "VCUserActivityFromEvent";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v35;
        _os_log_impl(&dword_1B3C5C000, v34, OS_LOG_TYPE_DEFAULT, "%s Missing user activity required string from event.metadata=%@", buf, 0x16u);
      }
      v52 = 0;
    }

    if (v52)
    {
      v36 = [v5 UUID];
      v37 = [v36 UUIDString];
      v38 = [v5 value];
      v39 = [v38 stringValue];
      v40 = [v5 startDate];
      self = [(VCUserActivityDonation *)self initWithUserActivity:v52 identifier:v37 sourceAppIdentifier:v39 date:v40];

      v41 = self;
    }
    else
    {
      v41 = 0;
    }
  }
  else
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"VCUserActivityDonation.m", 120, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];

    v41 = 0;
  }

  return v41;
}

- (VCUserActivityDonation)initWithUserActivity:(id)a3 identifier:(id)a4 sourceAppIdentifier:(id)a5 date:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"VCUserActivityDonation.m", 98, @"Invalid parameter not satisfying: %@", @"userActivity" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_12:
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"VCUserActivityDonation.m", 100, @"Invalid parameter not satisfying: %@", @"sourceAppIdentifier" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
LABEL_13:
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"VCUserActivityDonation.m", 101, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

      goto LABEL_14;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"VCUserActivityDonation.m", 99, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v13) {
    goto LABEL_12;
  }
LABEL_4:
  if (!v14) {
    goto LABEL_13;
  }
LABEL_5:
  v15 = 0;
  if (v11 && v12 && v13)
  {
    v29.receiver = self;
    v29.super_class = (Class)VCUserActivityDonation;
    self = [(VCUserActivityDonation *)&v29 init];
    if (self)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F30738]);
      uint64_t v17 = INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity();
      uint64_t v18 = (INShortcut *)[v16 initWithUserActivity:v11 bundleIdentifier:v17];
      shortcut = self->_shortcut;
      self->_shortcut = v18;

      uint64_t v20 = (NSString *)[v12 copy];
      identifier = self->_identifier;
      self->_identifier = v20;

      id v22 = (NSString *)[v13 copy];
      sourceAppIdentifier = self->_sourceAppIdentifier;
      self->_sourceAppIdentifier = v22;

      objc_storeStrong((id *)&self->_date, a6);
      self = self;
      v15 = self;
      goto LABEL_15;
    }
LABEL_14:
    v15 = 0;
  }
LABEL_15:

  return v15;
}

+ (id)timestampDateFormatter
{
  if (timestampDateFormatter_onceToken != -1) {
    dispatch_once(&timestampDateFormatter_onceToken, &__block_literal_global_1167);
  }
  v2 = (void *)timestampDateFormatter_dateFormatter;
  return v2;
}

uint64_t __48__VCUserActivityDonation_timestampDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)timestampDateFormatter_dateFormatter;
  timestampDateFormatter_dateFormatter = (uint64_t)v0;

  [(id)timestampDateFormatter_dateFormatter setDateStyle:1];
  v2 = (void *)timestampDateFormatter_dateFormatter;
  return [v2 setTimeStyle:1];
}

@end