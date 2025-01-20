@interface _ICQAppLaunchLink
+ (BOOL)supportsSecureCoding;
- (BOOL)isEligible;
- (ICQLink)link;
- (NSNumber)minDisplayIntervalDays;
- (NSString)appId;
- (_ICQAppLaunchLink)initWithCoder:(id)a3;
- (_ICQAppLaunchLink)initWithServerDictionary:(id)a3;
- (void)cacheLiftUIContentIfNeeded;
- (void)encodeWithCoder:(id)a3;
- (void)isEligible;
@end

@implementation _ICQAppLaunchLink

- (_ICQAppLaunchLink)initWithServerDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_ICQAppLaunchLink;
  v5 = [(_ICQAppLaunchLink *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"appId"];
    appId = v5->_appId;
    v5->_appId = (NSString *)v6;

    v8 = [v4 objectForKeyedSubscript:@"action"];
    uint64_t v9 = _ICQActionForServerActionString(v8);

    v10 = [v4 objectForKeyedSubscript:@"actParams"];
    v11 = _ICQActionParametersForServerActionParameters(v9, v10, 0);

    v12 = [[ICQLink alloc] initWithText:0 action:v9 parameters:v11];
    link = v5->_link;
    v5->_link = v12;

    v5->_minDisplayIntervalDays = (NSNumber *)(id)[v4 objectForKeyedSubscript:@"minDisplayIntervalDays"];
  }

  return v5;
}

- (BOOL)isEligible
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[_ICQAppLaunchLink isEligible].cold.5();
  }

  id v4 = +[ICQAppLaunchLinkTracker shared];
  uint64_t v5 = [v4 daysSinceLastShownForBundleID:self->_appId];

  if (v5 == +[ICQAppLaunchLinkTracker neverShown])
  {
    uint64_t v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_ICQAppLaunchLink isEligible]();
    }
    BOOL v7 = 1;
  }
  else
  {
    NSInteger v8 = [(NSNumber *)self->_minDisplayIntervalDays integerValue];
    BOOL v7 = v5 >= v8;
    uint64_t v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(_ICQAppLaunchLink *)v5 >= v8 isEligible];
    }
  }

  uint64_t v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v7;
    _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "App launch time eligible: %d", (uint8_t *)v14, 8u);
  }

  if (!v7 || !+[_ICQPhotosInfo isPhotosSyncOverQuota]) {
    goto LABEL_20;
  }
  v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_ICQAppLaunchLink isEligible]();
  }

  if (v5 == +[ICQAppLaunchLinkTracker neverShown]
    || +[_ICQPhotosInfo hasPhotoBulkCreation])
  {
    v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "App launch link is valid", (uint8_t *)v14, 2u);
    }
    BOOL v12 = 1;
  }
  else
  {
LABEL_20:
    v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_ICQAppLaunchLink isEligible]();
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)cacheLiftUIContentIfNeeded
{
  v3 = [(_ICQAppLaunchLink *)self link];
  if ([v3 action] == 121)
  {
  }
  else
  {
    id v4 = [(_ICQAppLaunchLink *)self link];
    uint64_t v5 = [v4 action];

    if (v5 != 115) {
      return;
    }
  }
  id v8 = +[ICQLiftUICache sharedCache];
  uint64_t v6 = [(_ICQAppLaunchLink *)self link];
  BOOL v7 = [v6 serverUIURL];
  [v8 cacheResponseFromURL:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_ICQAppLaunchLink *)self appId];
  [v4 encodeObject:v5 forKey:@"appId"];

  uint64_t v6 = [(_ICQAppLaunchLink *)self link];
  [v4 encodeObject:v6 forKey:@"link"];

  id v7 = [(_ICQAppLaunchLink *)self minDisplayIntervalDays];
  [v4 encodeObject:v7 forKey:@"minDisplayIntervalDays"];
}

- (_ICQAppLaunchLink)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_ICQAppLaunchLink *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appId"];
    appId = v5->_appId;
    v5->_appId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"link"];
    link = v5->_link;
    v5->_link = (ICQLink *)v8;

    v5->_minDisplayIntervalDays = (NSNumber *)(id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"minDisplayIntervalDays"];
  }

  return v5;
}

- (NSString)appId
{
  return self->_appId;
}

- (ICQLink)link
{
  return self->_link;
}

- (NSNumber)minDisplayIntervalDays
{
  return self->_minDisplayIntervalDays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

- (void)isEligible
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1D5851000, v0, v1, "Checking AppLaunchLink eligibility", v2, v3, v4, v5, v6);
}

@end