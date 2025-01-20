@interface NSPConfiguration
+ (BOOL)supportsSecureCoding;
+ (BOOL)validatePrivacyProxyConfiguration:(id)a3;
+ (id)defaultConfiguration;
+ (id)proxyAccountTypeToString:(id)a3;
+ (id)proxyTrafficStateToString:(id)a3;
+ (void)verifyConfigurationSignature:(id)a3 configuration:(id)a4 host:(id)a5 validateCert:(BOOL)a6 completionHandler:(id)a7;
- (BOOL)evaluateEnableRatios;
- (BOOL)fetchDateIsWithinStart:(id)a3 end:(id)a4;
- (BOOL)ignoreInvalidCerts;
- (BOOL)isDead;
- (BOOL)resetStaleEdgeSets;
- (BOOL)saveToPreferences;
- (NSArray)appRules;
- (NSData)proxyConfigurationData;
- (NSDate)anyAppEnabledDate;
- (NSDate)configurationFetchDate;
- (NSDate)dayPassExpirationDate;
- (NSDate)earliestEnableCheckDate;
- (NSDate)resetTomorrowDate;
- (NSDate)resurrectionDate;
- (NSDictionary)edgeSets;
- (NSNumber)cloudSubscriptionCheckEnabled;
- (NSNumber)configServerEnabled;
- (NSNumber)configServerPort;
- (NSNumber)enabled;
- (NSNumber)epoch;
- (NSNumber)geohashSharingEnabledStatus;
- (NSNumber)inProcessFlowDivert;
- (NSNumber)persistMetrics;
- (NSNumber)preferredPathRoutingEnabledStatus;
- (NSNumber)privateAccessTokensAllowTools;
- (NSNumber)privateAccessTokensEnabledStatus;
- (NSNumber)proxyAccountType;
- (NSNumber)proxyAccountUnlimited;
- (NSNumber)proxyTrafficState;
- (NSNumber)subscriberEnabledFromNonSettingsApp;
- (NSNumber)timestamp;
- (NSNumber)trialConfigVersion;
- (NSNumber)urlRequestTimeout;
- (NSNumber)userPreferredTier;
- (NSNumber)userTier;
- (NSNumber)version;
- (NSNumber)waldoRevocationFailClosed;
- (NSNumber)willResetSubscriberTierTomorrow;
- (NSPConfiguration)initWithCoder:(id)a3;
- (NSPConfiguration)initWithTimestamp:(id)a3 fromDictionary:(id)a4 waldoSource:(int64_t)a5;
- (NSPPrivacyProxyConfiguration)proxyConfiguration;
- (NSString)configServerHost;
- (NSString)configServerPath;
- (NSString)etag;
- (NSString)geohashOverride;
- (NSString)lastPrivateCloudComputeEnvironment;
- (NSString)waldoLeafOID;
- (NSURLSession)privacyProxyURLSession;
- (id)copyAgentResultsForAppRule:(id)a3;
- (id)copyTLVData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createConfigFetchURLWithPath:(id)a3 timestamp:(id)a4;
- (id)description;
- (id)diagnostics;
- (id)getCurrentKeyBagForAppRule:(id)a3;
- (id)getEdgeSetForAppRule:(id)a3;
- (id)getEdgeSetForSigningIdentifier:(id)a3;
- (id)initFromKeychain;
- (id)initFromPreferences;
- (id)initFromTLVs:(id)a3;
- (id)tierToString;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateEdgeSetsWithBlock:(id)a3;
- (void)incrementSessionCountersOnFirstLaunch;
- (void)merge:(id)a3;
- (void)removeFromKeychain;
- (void)saveToKeychain;
- (void)setAnyAppEnabledDate:(id)a3;
- (void)setAppRules:(id)a3;
- (void)setCloudSubscriptionCheckEnabled:(id)a3;
- (void)setConfigServerEnabled:(id)a3;
- (void)setConfigServerHost:(id)a3;
- (void)setConfigServerPath:(id)a3;
- (void)setConfigServerPort:(id)a3;
- (void)setConfigurationFetchDate:(id)a3;
- (void)setEdgeSets:(id)a3;
- (void)setEnabled:(id)a3;
- (void)setEpoch:(id)a3;
- (void)setEtag:(id)a3;
- (void)setGeohashOverride:(id)a3;
- (void)setGeohashSharingEnabledStatus:(id)a3;
- (void)setIgnoreInvalidCerts:(BOOL)a3;
- (void)setInProcessFlowDivert:(id)a3;
- (void)setLastPrivateCloudComputeEnvironment:(id)a3;
- (void)setPersistMetrics:(id)a3;
- (void)setPreferredPathRoutingEnabledStatus:(id)a3;
- (void)setPrivacyProxyURLSession:(id)a3;
- (void)setPrivateAccessTokensAllowTools:(id)a3;
- (void)setPrivateAccessTokensEnabledStatus:(id)a3;
- (void)setProxyAccountType:(id)a3;
- (void)setProxyAccountUnlimited:(id)a3;
- (void)setProxyConfiguration:(id)a3;
- (void)setProxyConfigurationData:(id)a3;
- (void)setProxyTrafficState:(id)a3;
- (void)setResetTomorrowDate:(id)a3;
- (void)setResurrectionDate:(id)a3;
- (void)setSubscriberEnabledFromNonSettingsApp:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrialConfigVersion:(id)a3;
- (void)setUrlRequestTimeout:(id)a3;
- (void)setUserPreferredTier:(id)a3;
- (void)setUserTier:(id)a3;
- (void)setWaldoLeafOID:(id)a3;
- (void)setWaldoRevocationFailClosed:(id)a3;
- (void)setWillResetSubscriberTierTomorrow:(id)a3;
- (void)setup;
- (void)setupNSURLSession;
- (void)teardown;
- (void)updateNetworkAgents;
@end

@implementation NSPConfiguration

- (NSNumber)userTier
{
  return self->_userTier;
}

- (NSNumber)proxyAccountUnlimited
{
  return self->_proxyAccountUnlimited;
}

- (NSNumber)proxyAccountType
{
  return self->_proxyAccountType;
}

- (NSNumber)willResetSubscriberTierTomorrow
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (NSNumber)proxyTrafficState
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

+ (id)proxyTrafficStateToString:(id)a3
{
  int v3 = [a3 unsignedLongLongValue];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = v4;
  if (v3)
  {
    [v4 addObject:@"Safari Unencrypted"];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"Safari DNS"];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v5 addObject:@"Safari Trackers"];
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v5 addObject:@"Safari All"];
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v5 addObject:@"Safari HTTP"];
  if ((v3 & 0x40000) == 0)
  {
LABEL_7:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v5 addObject:@"Safari Unencrypted (Private)"];
  if ((v3 & 0x80000) == 0)
  {
LABEL_8:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v5 addObject:@"Safari DNS (Private)"];
  if ((v3 & 0x100000) == 0)
  {
LABEL_9:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v5 addObject:@"Safari All (Private)"];
  if ((v3 & 0x200000) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v5 addObject:@"Safari Metrics"];
  if ((v3 & 0x20) == 0)
  {
LABEL_11:
    if ((v3 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v5 addObject:@"Mail Trackers"];
  if ((v3 & 0x40) == 0)
  {
LABEL_12:
    if ((v3 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v5 addObject:@"Any Unencrypted"];
  if ((v3 & 0x80) == 0)
  {
LABEL_13:
    if ((v3 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v5 addObject:@"Any DNS"];
  if ((v3 & 0x100) == 0)
  {
LABEL_14:
    if ((v3 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v5 addObject:@"Known Trackers"];
  if ((v3 & 0x200) == 0)
  {
LABEL_15:
    if ((v3 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v5 addObject:@"Any App Trackers"];
  if ((v3 & 0x400) == 0)
  {
LABEL_16:
    if ((v3 & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v5 addObject:@"News URL Resolution"];
  if ((v3 & 0x800) == 0)
  {
LABEL_17:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v5 addObject:@"Exposure Notifications"];
  if ((v3 & 0x1000) == 0)
  {
LABEL_18:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v5 addObject:@"Apple Certificates"];
  if ((v3 & 0x2000) == 0)
  {
LABEL_19:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v5 addObject:@"Network Tools"];
  if ((v3 & 0x4000) == 0)
  {
LABEL_20:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v5 addObject:@"Metrics Upload"];
  if ((v3 & 0x8000) == 0)
  {
LABEL_21:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v5 addObject:@"Branded Calling"];
  if ((v3 & 0x10000) == 0)
  {
LABEL_22:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v5 addObject:@"News Embedded Content"];
  if ((v3 & 0x20000) == 0)
  {
LABEL_23:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v5 addObject:@"App Metrics"];
  if ((v3 & 0x400000) == 0)
  {
LABEL_24:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v5 addObject:@"Promoted Content"];
  if ((v3 & 0x800000) == 0)
  {
LABEL_25:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v5 addObject:@"Postback Fetch"];
  if ((v3 & 0x1000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_55:
  [v5 addObject:@"Password Manager Icon Fetching"];
  if ((v3 & 0x2000000) != 0) {
LABEL_27:
  }
    [v5 addObject:@"Launch Warning Details"];
LABEL_28:
  return v5;
}

+ (id)proxyAccountTypeToString:(id)a3
{
  id v3 = a3;
  if ([v3 unsignedIntegerValue] == 1)
  {
    id v4 = @"Free";
  }
  else if ([v3 unsignedIntegerValue] == 2)
  {
    id v4 = @"Subscriber";
  }
  else
  {
    id v4 = @"Unknown";
  }

  return v4;
}

- (id)diagnostics
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = (void *)MEMORY[0x1E4F28C10];
  v5 = [(NSPConfiguration *)self resurrectionDate];
  v6 = [v4 localizedStringFromDate:v5 dateStyle:1 timeStyle:2];
  [v3 setObject:v6 forKeyedSubscript:@"resurrectionDate"];

  v7 = [(NSPConfiguration *)self etag];
  [v3 setObject:v7 forKeyedSubscript:@"Etag"];

  v8 = [(NSPConfiguration *)self epoch];
  [v3 setObject:v8 forKeyedSubscript:@"Epoch"];

  v9 = [(NSPConfiguration *)self proxyTrafficState];
  v10 = +[NSPConfiguration proxyTrafficStateToString:v9];
  [v3 setObject:v10 forKeyedSubscript:@"ProxyTrafficState"];

  v11 = (void *)MEMORY[0x1E4F28C10];
  v12 = [(NSPConfiguration *)self anyAppEnabledDate];
  v13 = [v11 localizedStringFromDate:v12 dateStyle:1 timeStyle:2];
  [v3 setObject:v13 forKeyedSubscript:@"AnyAppEnabledDate"];

  v14 = (void *)MEMORY[0x1E4F28C10];
  v15 = [(NSPConfiguration *)self configurationFetchDate];
  v16 = [v14 localizedStringFromDate:v15 dateStyle:1 timeStyle:2];
  [v3 setObject:v16 forKeyedSubscript:@"PrivacyProxyConfigurationFetchDate"];

  v17 = [(NSPConfiguration *)self willResetSubscriberTierTomorrow];
  [v3 setObject:v17 forKeyedSubscript:@"WillResetSubscriberTierTomorrow"];

  v18 = (void *)MEMORY[0x1E4F28C10];
  v19 = [(NSPConfiguration *)self resetTomorrowDate];
  v20 = [v18 localizedStringFromDate:v19 dateStyle:1 timeStyle:2];
  [v3 setObject:v20 forKeyedSubscript:@"ResetTomorrowDate"];

  v21 = [(NSPConfiguration *)self geohashSharingEnabledStatus];
  [v3 setObject:v21 forKeyedSubscript:@"GeohashSharingEnabled"];

  v22 = [(NSPConfiguration *)self preferredPathRoutingEnabledStatus];
  [v3 setObject:v22 forKeyedSubscript:@"PreferredPathRoutingEnabled"];

  v23 = [(NSPConfiguration *)self privateAccessTokensEnabledStatus];
  [v3 setObject:v23 forKeyedSubscript:@"PrivateAccessTokensEnabled"];

  v24 = [(NSPConfiguration *)self privateAccessTokensAllowTools];
  [v3 setObject:v24 forKeyedSubscript:@"PrivateAccessTokensAllowTools"];

  v25 = [(NSPConfiguration *)self inProcessFlowDivert];
  [v3 setObject:v25 forKeyedSubscript:@"InProcessFlowDivert"];

  v26 = [(NSPConfiguration *)self configServerEnabled];
  [v3 setObject:v26 forKeyedSubscript:@"PrivacyProxyConfigurationServerEnabled"];

  v27 = [(NSPConfiguration *)self configServerHost];
  [v3 setObject:v27 forKeyedSubscript:@"PrivacyProxyConfigurationServerHost"];

  v28 = [(NSPConfiguration *)self userTier];
  uint64_t v29 = [v28 intValue];
  if (v29 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v29);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = off_1E5A3C640[(int)v29];
  }
  [v3 setObject:v30 forKeyedSubscript:@"UserTier"];

  v31 = [(NSPConfiguration *)self proxyAccountType];
  v32 = +[NSPConfiguration proxyAccountTypeToString:v31];
  [v3 setObject:v32 forKeyedSubscript:@"ProxyAccountType"];

  v33 = [(NSPConfiguration *)self proxyAccountUnlimited];
  [v3 setObject:v33 forKeyedSubscript:@"ProxyAccountUnlimited"];

  v34 = NSNumber;
  v35 = [(NSPConfiguration *)self proxyConfiguration];
  v36 = objc_msgSend(v34, "numberWithBool:", objc_msgSend(v35, "enabled"));
  [v3 setObject:v36 forKeyedSubscript:@"TokenFetchEnabled"];

  v37 = [(NSPConfiguration *)self enabled];
  [v3 setObject:v37 forKeyedSubscript:@"enabled"];

  v38 = [(NSPConfiguration *)self version];
  [v3 setObject:v38 forKeyedSubscript:@"version"];

  v39 = [(NSPConfiguration *)self userPreferredTier];
  uint64_t v40 = [v39 intValue];
  if (v40 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v40);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = off_1E5A3C640[(int)v40];
  }
  [v3 setObject:v41 forKeyedSubscript:@"UserPreferredTier"];

  v42 = [(NSPConfiguration *)self subscriberEnabledFromNonSettingsApp];
  [v3 setObject:v42 forKeyedSubscript:@"SubscriberEnabledFromNonSettingsApp"];

  v43 = [(NSPConfiguration *)self trialConfigVersion];
  [v3 setObject:v43 forKeyedSubscript:@"TrialConfigVersion"];

  return v3;
}

- (id)description
{
  if (self)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
    id v4 = [(NSPConfiguration *)self version];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v4, @"Configuration Version", 0, 14);

    v5 = [(NSPConfiguration *)self enabled];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v5, @"Enabled", 0, 14);

    v6 = [(NSPConfiguration *)self userTier];
    uint64_t v7 = [v6 intValue];
    if (v7 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E5A3C640[(int)v7];
    }
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v8, @"User Tier", 0, 14);

    v9 = [(NSPConfiguration *)self configServerHost];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v9, @"Configuration Server", 0, 14);

    v10 = [(NSPConfiguration *)self resurrectionDate];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v10, @"Resurrection Date", 0, 14);

    v11 = [(NSPConfiguration *)self configServerEnabled];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v11, @"Config Server Enabled", 0, 14);

    v12 = [(NSPConfiguration *)self urlRequestTimeout];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v12, @"Waldo Request timeout", 0, 14);

    -[NSMutableString appendPrettyBOOL:withName:andIndent:options:](v3, [(NSPConfiguration *)self ignoreInvalidCerts], @"Ignore Invalid Certs", 0, 14);
    v13 = [(NSPConfiguration *)self proxyConfigurationData];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v13, @"Proxy configuration received data", 0, 14);

    v14 = [(NSPConfiguration *)self proxyConfiguration];
    v15 = [v14 data];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v15, @"Proxy configuration stored data", 0, 14);

    v16 = [(NSPConfiguration *)self proxyConfiguration];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v16, @"Proxy configuration", 0, 14);

    v17 = [(NSPConfiguration *)self etag];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v17, @"ETag", 0, 14);

    v18 = [(NSPConfiguration *)self epoch];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v18, @"Epoch", 0, 14);

    v19 = [(NSPConfiguration *)self proxyTrafficState];
    v20 = +[NSPConfiguration proxyTrafficStateToString:v19];

    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v20, @"Proxy Traffic", 0, 14);
    v21 = (void *)MEMORY[0x1E4F28C10];
    v22 = [(NSPConfiguration *)self anyAppEnabledDate];
    v23 = [v21 localizedStringFromDate:v22 dateStyle:1 timeStyle:2];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v23, @"Any App Enabled Date", 0, 14);

    v24 = (void *)MEMORY[0x1E4F28C10];
    v25 = [(NSPConfiguration *)self configurationFetchDate];
    v26 = [v24 localizedStringFromDate:v25 dateStyle:1 timeStyle:2];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v26, @"Configuration Fetch Date", 0, 14);

    v27 = [(NSPConfiguration *)self willResetSubscriberTierTomorrow];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v27, @"Will Reset Subscriber Tier Tomorrow", 0, 14);

    v28 = (void *)MEMORY[0x1E4F28C10];
    uint64_t v29 = [(NSPConfiguration *)self resetTomorrowDate];
    v30 = [v28 localizedStringFromDate:v29 dateStyle:1 timeStyle:2];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v30, @"Tomorrow Reset Date", 0, 14);

    v31 = [(NSPConfiguration *)self cloudSubscriptionCheckEnabled];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v31, @"Cloud Subscription Check Enabled", 0, 14);

    v32 = [(NSPConfiguration *)self geohashSharingEnabledStatus];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v32, @"Geohash Sharing Enabled", 0, 14);

    v33 = [(NSPConfiguration *)self geohashOverride];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v33, @"Geohash Override", 0, 14);

    v34 = [(NSPConfiguration *)self preferredPathRoutingEnabledStatus];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v34, @"Preferred Path Routing Enabled", 0, 14);

    v35 = [(NSPConfiguration *)self privateAccessTokensEnabledStatus];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v35, @"Private Access Tokens Enabled", 0, 14);

    v36 = [(NSPConfiguration *)self privateAccessTokensAllowTools];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v36, @"Private Access Tokens Allow Tools", 0, 14);

    v37 = [(NSPConfiguration *)self inProcessFlowDivert];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v37, @"In-Process Flow Divert", 0, 14);

    v38 = [(NSPConfiguration *)self proxyAccountType];
    v39 = +[NSPConfiguration proxyAccountTypeToString:v38];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v39, @"Proxy Account Type", 0, 14);

    uint64_t v40 = [(NSPConfiguration *)self proxyAccountUnlimited];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v40, @"Proxy Account Unlimited", 0, 14);

    v41 = [(NSPConfiguration *)self userPreferredTier];
    uint64_t v42 = [v41 intValue];
    if (v42 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v42);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = off_1E5A3C640[(int)v42];
    }
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v43, @"User preferred Tier", 0, 14);

    v44 = [(NSPConfiguration *)self subscriberEnabledFromNonSettingsApp];
    -[NSMutableString appendPrettyBOOL:withName:andIndent:options:](v3, [v44 BOOLValue], @"Subscriber Enabled from Non-Settings App", 0, 14);

    v45 = [(NSPConfiguration *)self trialConfigVersion];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v45, @"Trial Config Version", 0, 14);

    v46 = [(NSPConfiguration *)self lastPrivateCloudComputeEnvironment];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v46, @"Last PrivateCloudCompute environment", 0, 14);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

+ (id)defaultConfiguration
{
  if (qword_1EB53BF30 != -1) {
    dispatch_once(&qword_1EB53BF30, &__block_literal_global_13);
  }
  v2 = (void *)_MergedGlobals_39;
  return v2;
}

void __40__NSPConfiguration_defaultConfiguration__block_invoke()
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v41 = (id)[objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:@"/System/Library/PrivateFrameworks/NetworkServiceProxy.framework"];
  v0 = [v41 objectForInfoDictionaryKey:@"NSPDefaults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v1 = [[NSPConfiguration alloc] initWithTimestamp:0 fromDictionary:v0 waldoSource:0];
    if (!v1)
    {
LABEL_48:

      goto LABEL_49;
    }
    v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v49 = 0;
    id v3 = [v2 contentsOfDirectoryAtPath:@"/System/Library/NetworkServiceProxy" error:&v49];
    id v4 = v49;

    if (v4)
    {
      v5 = nplog_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v54 = 138412546;
        v55 = @"/System/Library/NetworkServiceProxy";
        __int16 v56 = 2112;
        id v57 = v4;
        _os_log_error_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_ERROR, "Failed to read the contents of %@: %@", v54, 0x16u);
      }
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v8 = v3;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        v35 = v3;
        v36 = v0;
        v38 = v1;
        id v42 = 0;
        id v4 = 0;
        uint64_t v11 = *(void *)v46;
        v12 = v8;
        id v43 = v8;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v46 != v11) {
              objc_enumerationMutation(v12);
            }
            v14 = [@"/System/Library/NetworkServiceProxy" stringByAppendingFormat:@"/%@", *(void *)(*((void *)&v45 + 1) + 8 * i)];
            v15 = [MEMORY[0x1E4F1CA10] inputStreamWithFileAtPath:v14];
            v16 = v15;
            if (v15)
            {
              [v15 open];
              v17 = [v16 streamError];

              if (v17)
              {
                v18 = nplog_obj();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  v33 = [v16 streamError];
                  *(_DWORD *)buf = 138412546;
                  v51 = v14;
                  __int16 v52 = 2112;
                  id v53 = v33;
                  _os_log_error_impl(&dword_1A0FEE000, v18, OS_LOG_TYPE_ERROR, "Failed to open an input stream for %@: %@", buf, 0x16u);
                }
                id v19 = v4;
              }
              else
              {
                id v44 = 0;
                v18 = [MEMORY[0x1E4F28F98] propertyListWithStream:v16 options:0 format:0 error:&v44];
                id v19 = v44;

                if (v18)
                {
                  v21 = [[NSPAppRule alloc] initFromDictionary:v18];
                  v22 = v21;
                  if (v21)
                  {
                    v23 = [v21 useCustomProtocol];
                    char v24 = [v23 BOOLValue];

                    if (v24)
                    {
                      v12 = v43;
                    }
                    else
                    {
                      id v25 = v42;
                      if (!v42) {
                        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                      }
                      id v42 = v25;
                      [v25 addObject:v22];
                      v26 = [v22 edgeSetIdentifier];

                      v12 = v43;
                      if (!v26)
                      {
                        v27 = [v18 objectForKeyedSubscript:@"edgeSet"];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v39 = [NPWaldo alloc];
                          v28 = [v22 matchSigningIdentifier];
                          uint64_t v29 = v39;
                          uint64_t v40 = v27;
                          v30 = [(NPWaldo *)v29 initWithIdentifier:v28 timestamp:&unk_1EF43BDC0 fromDictionary:v27 source:0];

                          if (v30)
                          {
                            [(NPWaldo *)v30 setEdgesGeneration:&unk_1EF43BDC0];
                            [(NPWaldo *)v30 setUsedEdgesGeneration:&unk_1EF43BDC0];
                            v31 = [(NSPConfiguration *)v38 edgeSets];

                            if (v31)
                            {
                              v32 = [(NSPConfiguration *)v38 edgeSets];
                              id v37 = (id)[v32 mutableCopy];
                            }
                            else
                            {
                              id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                            }
                            v34 = [(NPWaldo *)v30 identifier];
                            [v37 setObject:v30 forKeyedSubscript:v34];

                            [(NSPConfiguration *)v38 setEdgeSets:v37];
                          }

                          v12 = v43;
                          v27 = v40;
                        }
                      }
                    }
                  }
                }
                else
                {
                  v22 = nplog_obj();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v51 = v14;
                    __int16 v52 = 2112;
                    id v53 = v19;
                    _os_log_error_impl(&dword_1A0FEE000, v22, OS_LOG_TYPE_ERROR, "Failed to read a rule dictionary from %@: %@", buf, 0x16u);
                  }
                }
              }
              [v16 close];
              id v4 = v19;
            }
            else
            {
              v20 = nplog_obj();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v14;
                _os_log_error_impl(&dword_1A0FEE000, v20, OS_LOG_TYPE_ERROR, "Failed to create a stream for %@", buf, 0xCu);
              }
            }
          }
          uint64_t v10 = [v12 countByEnumeratingWithState:&v45 objects:v54 count:16];
        }
        while (v10);

        v6 = v42;
        if (v42)
        {
          uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithArray:v42];
        }
        else
        {
          uint64_t v7 = 0;
        }
        id v3 = v35;
        v0 = v36;
        v1 = v38;
        goto LABEL_47;
      }

      id v4 = 0;
    }
    v6 = 0;
    uint64_t v7 = 0;
LABEL_47:

    [(NSPConfiguration *)v1 setAppRules:v7];
    objc_storeStrong((id *)&_MergedGlobals_39, v1);
    goto LABEL_48;
  }
LABEL_49:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)NSPConfiguration;
  v5 = [(NSPConfiguration *)&v82 init];
  if (v5)
  {
    v5->_diskVersion = [v4 decodeIntegerForKey:@"diskVersion"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enabled"];
    enabled = v5->_enabled;
    v5->_enabled = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resurrectionDate"];
    resurrectionDate = v5->_resurrectionDate;
    v5->_resurrectionDate = (NSDate *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"appRules"];
    appRules = v5->_appRules;
    v5->_appRules = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyConfigurationServerEnabled"];
    configServerEnabled = v5->_configServerEnabled;
    v5->_configServerEnabled = (NSNumber *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyConfigurationServerHost"];
    configServerHost = v5->_configServerHost;
    v5->_configServerHost = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyConfigurationServerPort"];
    configServerPort = v5->_configServerPort;
    v5->_configServerPort = (NSNumber *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyConfigurationServerPath"];
    configServerPath = v5->_configServerPath;
    v5->_configServerPath = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlRequestTimeout"];
    urlRequestTimeout = v5->_urlRequestTimeout;
    v5->_urlRequestTimeout = (NSNumber *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"waldoLeafOID"];
    waldoLeafOID = v5->_waldoLeafOID;
    v5->_waldoLeafOID = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"waldoRevocationFailClosed"];
    waldoRevocationFailClosed = v5->_waldoRevocationFailClosed;
    v5->_waldoRevocationFailClosed = (NSNumber *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persist-metrics"];
    persistMetrics = v5->_persistMetrics;
    v5->_persistMetrics = (NSNumber *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyConfiguration"];
    proxyConfiguration = v5->_proxyConfiguration;
    v5->_proxyConfiguration = (NSPPrivacyProxyConfiguration *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyConfigurationData"];
    proxyConfigurationData = v5->_proxyConfigurationData;
    v5->_proxyConfigurationData = (NSData *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserTier"];
    userTier = v5->_userTier;
    v5->_userTier = (NSNumber *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Etag"];
    etag = v5->_etag;
    v5->_etag = (NSString *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Epoch"];
    epoch = v5->_epoch;
    v5->_epoch = (NSNumber *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyTrafficState"];
    proxyTrafficState = v5->_proxyTrafficState;
    v5->_proxyTrafficState = (NSNumber *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnyAppEnabledDate"];
    anyAppEnabledDate = v5->_anyAppEnabledDate;
    v5->_anyAppEnabledDate = (NSDate *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyConfigurationFetchDate"];
    configurationFetchDate = v5->_configurationFetchDate;
    v5->_configurationFetchDate = (NSDate *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ResetTomorrowDate"];
    resetTomorrowDate = v5->_resetTomorrowDate;
    v5->_resetTomorrowDate = (NSDate *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WillResetSubscriberTierTomorrow"];
    willResetSubscriberTierTomorrow = v5->_willResetSubscriberTierTomorrow;
    v5->_willResetSubscriberTierTomorrow = (NSNumber *)v53;

    if (os_variant_allows_internal_security_policies())
    {
      v5->_ignoreInvalidCerts = [v4 decodeBoolForKey:@"IgnoreInvalidCerts"];
      uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CloudSubscriptionCheckEnabled"];
      cloudSubscriptionCheckEnabled = v5->_cloudSubscriptionCheckEnabled;
      v5->_cloudSubscriptionCheckEnabled = (NSNumber *)v55;
    }
    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GeohashSharingEnabled"];
    geohashSharingEnabledStatus = v5->_geohashSharingEnabledStatus;
    v5->_geohashSharingEnabledStatus = (NSNumber *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GeohashOverride"];
    geohashOverride = v5->_geohashOverride;
    v5->_geohashOverride = (NSString *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreferredPathRoutingEnabled"];
    preferredPathRoutingEnabledStatus = v5->_preferredPathRoutingEnabledStatus;
    v5->_preferredPathRoutingEnabledStatus = (NSNumber *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivateAccessTokensEnabled"];
    privateAccessTokensEnabledStatus = v5->_privateAccessTokensEnabledStatus;
    v5->_privateAccessTokensEnabledStatus = (NSNumber *)v63;

    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivateAccessTokensAllowTools"];
    privateAccessTokensAllowTools = v5->_privateAccessTokensAllowTools;
    v5->_privateAccessTokensAllowTools = (NSNumber *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InProcessFlowDivert"];
    inProcessFlowDivert = v5->_inProcessFlowDivert;
    v5->_inProcessFlowDivert = (NSNumber *)v67;

    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyAccountType"];
    proxyAccountType = v5->_proxyAccountType;
    v5->_proxyAccountType = (NSNumber *)v69;

    uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxyAccountUnlimited"];
    proxyAccountUnlimited = v5->_proxyAccountUnlimited;
    v5->_proxyAccountUnlimited = (NSNumber *)v71;

    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserPreferredTier"];
    userPreferredTier = v5->_userPreferredTier;
    v5->_userPreferredTier = (NSNumber *)v73;

    uint64_t v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SubscriberEnabledFromNonSettingsApp"];
    subscriberEnabledFromNonSettingsApp = v5->_subscriberEnabledFromNonSettingsApp;
    v5->_subscriberEnabledFromNonSettingsApp = (NSNumber *)v75;

    uint64_t v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TrialConfigVersion"];
    trialConfigVersion = v5->_trialConfigVersion;
    v5->_trialConfigVersion = (NSNumber *)v77;

    if (os_variant_has_internal_content())
    {
      uint64_t v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastPrivateCloudComputeEnvironment"];
      lastPrivateCloudComputeEnvironment = v5->_lastPrivateCloudComputeEnvironment;
      v5->_lastPrivateCloudComputeEnvironment = (NSString *)v79;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v71 = a3;
  [v71 encodeInteger:20 forKey:@"diskVersion"];
  id v4 = [(NSPConfiguration *)self version];
  [v71 encodeObject:v4 forKey:@"version"];

  v5 = [(NSPConfiguration *)self timestamp];
  [v71 encodeObject:v5 forKey:@"timestamp"];

  uint64_t v7 = [(NSPConfiguration *)self enabled];
  if (self) {
    id Property = objc_getProperty(self, v6, 328, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v9 = [Property enabled];
  char IsEqual = myIsEqual(v7, v9);

  if ((IsEqual & 1) == 0)
  {
    uint64_t v11 = [(NSPConfiguration *)self enabled];
    [v71 encodeObject:v11 forKey:@"enabled"];
  }
  uint64_t v12 = [(NSPConfiguration *)self resurrectionDate];
  [v71 encodeObject:v12 forKey:@"resurrectionDate"];

  v13 = [(NSPConfiguration *)self appRules];
  [v71 encodeObject:v13 forKey:@"appRules"];

  v14 = [(NSPConfiguration *)self configServerEnabled];
  [v71 encodeObject:v14 forKey:@"PrivacyProxyConfigurationServerEnabled"];

  if (!self
    || (id v16 = objc_getProperty(self, v15, 328, 1)) == 0
    || (v18 = v16,
        configServerHost = self->_configServerHost,
        v20 = (void **)objc_getProperty(self, v17, 328, 1),
        LOBYTE(configServerHost) = myIsEqual(configServerHost, v20[1]),
        v18,
        (configServerHost & 1) == 0))
  {
    [v71 encodeObject:self->_configServerHost forKey:@"PrivacyProxyConfigurationServerHost"];
  }
  id v22 = objc_getProperty(self, v21, 328, 1);
  if (!v22
    || (char v24 = v22,
        configServerPort = self->_configServerPort,
        v26 = (void **)objc_getProperty(self, v23, 328, 1),
        LOBYTE(configServerPort) = myIsEqual(configServerPort, v26[11]),
        v24,
        (configServerPort & 1) == 0))
  {
    [v71 encodeObject:self->_configServerPort forKey:@"PrivacyProxyConfigurationServerPort"];
  }
  uint64_t v27 = [(NSPConfiguration *)self configServerPath];
  uint64_t v29 = objc_msgSend(objc_getProperty(self, v28, 328, 1), "configServerPath");
  char v30 = myIsEqual(v27, v29);

  if ((v30 & 1) == 0)
  {
    uint64_t v31 = [(NSPConfiguration *)self configServerPath];
    [v71 encodeObject:v31 forKey:@"PrivacyProxyConfigurationServerPath"];
  }
  v32 = [(NSPConfiguration *)self urlRequestTimeout];
  v34 = objc_msgSend(objc_getProperty(self, v33, 328, 1), "urlRequestTimeout");
  char v35 = myIsEqual(v32, v34);

  if ((v35 & 1) == 0)
  {
    v36 = [(NSPConfiguration *)self urlRequestTimeout];
    [v71 encodeObject:v36 forKey:@"urlRequestTimeout"];
  }
  uint64_t v37 = [(NSPConfiguration *)self waldoLeafOID];
  uint64_t v39 = objc_msgSend(objc_getProperty(self, v38, 328, 1), "waldoLeafOID");
  char v40 = myIsEqual(v37, v39);

  if ((v40 & 1) == 0)
  {
    uint64_t v41 = [(NSPConfiguration *)self waldoLeafOID];
    [v71 encodeObject:v41 forKey:@"waldoLeafOID"];
  }
  id v42 = [(NSPConfiguration *)self waldoRevocationFailClosed];
  id v44 = objc_msgSend(objc_getProperty(self, v43, 328, 1), "waldoRevocationFailClosed");
  char v45 = myIsEqual(v42, v44);

  if ((v45 & 1) == 0)
  {
    long long v46 = [(NSPConfiguration *)self waldoRevocationFailClosed];
    [v71 encodeObject:v46 forKey:@"waldoRevocationFailClosed"];
  }
  uint64_t v47 = [(NSPConfiguration *)self persistMetrics];
  [v71 encodeObject:v47 forKey:@"persist-metrics"];

  long long v48 = [(NSPConfiguration *)self proxyConfiguration];
  [v71 encodeObject:v48 forKey:@"ProxyConfiguration"];

  uint64_t v49 = [(NSPConfiguration *)self proxyConfigurationData];
  [v71 encodeObject:v49 forKey:@"ProxyConfigurationData"];

  v50 = [(NSPConfiguration *)self userTier];
  [v71 encodeObject:v50 forKey:@"UserTier"];

  uint64_t v51 = [(NSPConfiguration *)self proxyTrafficState];
  [v71 encodeObject:v51 forKey:@"ProxyTrafficState"];

  __int16 v52 = [(NSPConfiguration *)self anyAppEnabledDate];
  [v71 encodeObject:v52 forKey:@"AnyAppEnabledDate"];

  uint64_t v53 = [(NSPConfiguration *)self etag];
  [v71 encodeObject:v53 forKey:@"Etag"];

  v54 = [(NSPConfiguration *)self epoch];
  [v71 encodeObject:v54 forKey:@"Epoch"];

  uint64_t v55 = [(NSPConfiguration *)self configurationFetchDate];
  [v71 encodeObject:v55 forKey:@"PrivacyProxyConfigurationFetchDate"];

  __int16 v56 = [(NSPConfiguration *)self resetTomorrowDate];
  [v71 encodeObject:v56 forKey:@"ResetTomorrowDate"];

  uint64_t v57 = [(NSPConfiguration *)self willResetSubscriberTierTomorrow];
  [v71 encodeObject:v57 forKey:@"WillResetSubscriberTierTomorrow"];

  if (os_variant_allows_internal_security_policies())
  {
    objc_msgSend(v71, "encodeBool:forKey:", -[NSPConfiguration ignoreInvalidCerts](self, "ignoreInvalidCerts"), @"IgnoreInvalidCerts");
    uint64_t v58 = [(NSPConfiguration *)self cloudSubscriptionCheckEnabled];
    [v71 encodeObject:v58 forKey:@"CloudSubscriptionCheckEnabled"];
  }
  uint64_t v59 = [(NSPConfiguration *)self geohashSharingEnabledStatus];
  [v71 encodeObject:v59 forKey:@"GeohashSharingEnabled"];

  v60 = [(NSPConfiguration *)self geohashOverride];
  [v71 encodeObject:v60 forKey:@"GeohashOverride"];

  uint64_t v61 = [(NSPConfiguration *)self preferredPathRoutingEnabledStatus];
  [v71 encodeObject:v61 forKey:@"PreferredPathRoutingEnabled"];

  v62 = [(NSPConfiguration *)self privateAccessTokensEnabledStatus];
  [v71 encodeObject:v62 forKey:@"PrivateAccessTokensEnabled"];

  uint64_t v63 = [(NSPConfiguration *)self privateAccessTokensAllowTools];
  [v71 encodeObject:v63 forKey:@"PrivateAccessTokensAllowTools"];

  v64 = [(NSPConfiguration *)self inProcessFlowDivert];
  [v71 encodeObject:v64 forKey:@"InProcessFlowDivert"];

  uint64_t v65 = [(NSPConfiguration *)self proxyAccountType];
  [v71 encodeObject:v65 forKey:@"ProxyAccountType"];

  v66 = [(NSPConfiguration *)self proxyAccountUnlimited];
  [v71 encodeObject:v66 forKey:@"ProxyAccountUnlimited"];

  uint64_t v67 = [(NSPConfiguration *)self userPreferredTier];
  [v71 encodeObject:v67 forKey:@"UserPreferredTier"];

  v68 = [(NSPConfiguration *)self subscriberEnabledFromNonSettingsApp];
  [v71 encodeObject:v68 forKey:@"SubscriberEnabledFromNonSettingsApp"];

  uint64_t v69 = [(NSPConfiguration *)self trialConfigVersion];
  [v71 encodeObject:v69 forKey:@"TrialConfigVersion"];

  if (os_variant_has_internal_content())
  {
    v70 = [(NSPConfiguration *)self lastPrivateCloudComputeEnvironment];
    [v71 encodeObject:v70 forKey:@"LastPrivateCloudComputeEnvironment"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPConfiguration allocWithZone:a3] init];
  v5 = v4;
  if (self) {
    int64_t diskVersion = self->_diskVersion;
  }
  else {
    int64_t diskVersion = 0;
  }
  v4->_int64_t diskVersion = diskVersion;
  uint64_t v7 = [(NSPConfiguration *)self version];
  objc_setProperty_atomic(v5, v8, v7, 24);

  uint64_t v9 = [(NSPConfiguration *)self timestamp];
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSNumber *)v9;

  uint64_t v11 = [(NSPConfiguration *)self enabled];
  [(NSPConfiguration *)v5 setEnabled:v11];

  uint64_t v12 = [(NSPConfiguration *)self resurrectionDate];
  [(NSPConfiguration *)v5 setResurrectionDate:v12];

  v13 = [(NSPConfiguration *)self appRules];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v15 = [(NSPConfiguration *)self appRules];
    id v16 = (void *)[v14 initWithArray:v15 copyItems:1];
    [(NSPConfiguration *)v5 setAppRules:v16];
  }
  objc_storeStrong((id *)&v5->_configServerHost, self->_configServerHost);
  objc_storeStrong((id *)&v5->_configServerPort, self->_configServerPort);
  uint64_t v17 = [(NSPConfiguration *)self configServerPath];
  [(NSPConfiguration *)v5 setConfigServerPath:v17];

  v18 = [(NSPConfiguration *)self urlRequestTimeout];
  [(NSPConfiguration *)v5 setUrlRequestTimeout:v18];

  uint64_t v19 = [(NSPConfiguration *)self waldoLeafOID];
  [(NSPConfiguration *)v5 setWaldoLeafOID:v19];

  v20 = [(NSPConfiguration *)self waldoRevocationFailClosed];
  [(NSPConfiguration *)v5 setWaldoRevocationFailClosed:v20];

  uint64_t v21 = [(NSPConfiguration *)self configServerEnabled];
  [(NSPConfiguration *)v5 setConfigServerEnabled:v21];

  id v22 = [(NSPConfiguration *)self edgeSets];

  if (v22)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F1CA60]);
    char v24 = [(NSPConfiguration *)self edgeSets];
    uint64_t v25 = (void *)[v23 initWithDictionary:v24 copyItems:1];
    [(NSPConfiguration *)v5 setEdgeSets:v25];
  }
  [(NSPConfiguration *)v5 setIgnoreInvalidCerts:[(NSPConfiguration *)self ignoreInvalidCerts]];
  v26 = [(NSPConfiguration *)self persistMetrics];
  [(NSPConfiguration *)v5 setPersistMetrics:v26];

  uint64_t v27 = [(NSPConfiguration *)self proxyConfiguration];
  [(NSPConfiguration *)v5 setProxyConfiguration:v27];

  SEL v28 = [(NSPConfiguration *)self userTier];
  [(NSPConfiguration *)v5 setUserTier:v28];

  uint64_t v29 = [(NSPConfiguration *)self proxyTrafficState];
  [(NSPConfiguration *)v5 setProxyTrafficState:v29];

  char v30 = [(NSPConfiguration *)self anyAppEnabledDate];
  [(NSPConfiguration *)v5 setAnyAppEnabledDate:v30];

  uint64_t v31 = [(NSPConfiguration *)self etag];
  [(NSPConfiguration *)v5 setEtag:v31];

  v32 = [(NSPConfiguration *)self epoch];
  [(NSPConfiguration *)v5 setEpoch:v32];

  SEL v33 = [(NSPConfiguration *)self configurationFetchDate];
  [(NSPConfiguration *)v5 setConfigurationFetchDate:v33];

  v34 = [(NSPConfiguration *)self resetTomorrowDate];
  [(NSPConfiguration *)v5 setResetTomorrowDate:v34];

  char v35 = [(NSPConfiguration *)self willResetSubscriberTierTomorrow];
  [(NSPConfiguration *)v5 setWillResetSubscriberTierTomorrow:v35];

  v36 = [(NSPConfiguration *)self cloudSubscriptionCheckEnabled];
  [(NSPConfiguration *)v5 setCloudSubscriptionCheckEnabled:v36];

  uint64_t v37 = [(NSPConfiguration *)self geohashSharingEnabledStatus];
  [(NSPConfiguration *)v5 setGeohashSharingEnabledStatus:v37];

  SEL v38 = [(NSPConfiguration *)self geohashOverride];
  [(NSPConfiguration *)v5 setGeohashOverride:v38];

  uint64_t v39 = [(NSPConfiguration *)self preferredPathRoutingEnabledStatus];
  [(NSPConfiguration *)v5 setPreferredPathRoutingEnabledStatus:v39];

  char v40 = [(NSPConfiguration *)self privateAccessTokensEnabledStatus];
  [(NSPConfiguration *)v5 setPrivateAccessTokensEnabledStatus:v40];

  uint64_t v41 = [(NSPConfiguration *)self privateAccessTokensAllowTools];
  [(NSPConfiguration *)v5 setPrivateAccessTokensAllowTools:v41];

  id v42 = [(NSPConfiguration *)self inProcessFlowDivert];
  [(NSPConfiguration *)v5 setInProcessFlowDivert:v42];

  SEL v43 = [(NSPConfiguration *)self proxyAccountType];
  [(NSPConfiguration *)v5 setProxyAccountType:v43];

  id v44 = [(NSPConfiguration *)self proxyAccountUnlimited];
  [(NSPConfiguration *)v5 setProxyAccountUnlimited:v44];

  char v45 = [(NSPConfiguration *)self userPreferredTier];
  [(NSPConfiguration *)v5 setUserPreferredTier:v45];

  long long v46 = [(NSPConfiguration *)self subscriberEnabledFromNonSettingsApp];
  [(NSPConfiguration *)v5 setSubscriberEnabledFromNonSettingsApp:v46];

  uint64_t v47 = [(NSPConfiguration *)self trialConfigVersion];
  [(NSPConfiguration *)v5 setTrialConfigVersion:v47];

  long long v48 = [(NSPConfiguration *)self lastPrivateCloudComputeEnvironment];
  [(NSPConfiguration *)v5 setLastPrivateCloudComputeEnvironment:v48];

  return v5;
}

- (void)merge:(id)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 version];

  if (v5)
  {
    uint64_t v6 = [v4 version];
    version = self->_version;
    self->_version = v6;
  }
  SEL v8 = [v4 timestamp];

  if (v8)
  {
    uint64_t v9 = [v4 timestamp];
    timestamp = self->_timestamp;
    self->_timestamp = v9;
  }
  self->_ignoreInvalidCerts = [v4 ignoreInvalidCerts];
  uint64_t v11 = [v4 enabled];

  if (v11)
  {
    uint64_t v12 = [v4 enabled];
    enabled = self->_enabled;
    self->_enabled = v12;
  }
  id v14 = [v4 resurrectionDate];

  if (v14)
  {
    uint64_t v15 = [v4 resurrectionDate];
    [(NSPConfiguration *)self setResurrectionDate:v15];
  }
  v96 = self;
  id v16 = [v4 appRules];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = [(NSPConfiguration *)self appRules];
    v99 = (void *)[v18 mutableCopy];

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v95 = v4;
    obuint64_t j = [v4 appRules];
    uint64_t v100 = [obj countByEnumeratingWithState:&v106 objects:v111 count:16];
    if (v100)
    {
      uint64_t v98 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v100; ++i)
        {
          if (*(void *)v107 != v98) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          long long v102 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          id v21 = v99;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v102 objects:v110 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v103;
            while (2)
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v103 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = *(void **)(*((void *)&v102 + 1) + 8 * j);
                uint64_t v27 = [v20 matchSigningIdentifier];
                SEL v28 = [v26 matchSigningIdentifier];
                int v29 = [v27 isEqualToString:v28];

                if (v29)
                {
                  [v26 merge:v20];

                  goto LABEL_25;
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v102 objects:v110 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          [v21 addObject:v20];
LABEL_25:
          ;
        }
        uint64_t v100 = [obj countByEnumeratingWithState:&v106 objects:v111 count:16];
      }
      while (v100);
    }

    [(NSPConfiguration *)v96 setAppRules:v99];
    id v4 = v95;
  }
  char v30 = [v4 configServerHost];

  uint64_t v31 = v4;
  if (v30)
  {
    v32 = [v4 configServerHost];
    [(NSPConfiguration *)v96 setConfigServerHost:v32];
  }
  SEL v33 = [v4 configServerPort];

  if (v33)
  {
    v34 = [v4 configServerPort];
    [(NSPConfiguration *)v96 setConfigServerPort:v34];
  }
  char v35 = [v4 configServerPath];

  if (v35)
  {
    v36 = [v4 configServerPath];
    [(NSPConfiguration *)v96 setConfigServerPath:v36];
  }
  uint64_t v37 = [v4 urlRequestTimeout];

  if (v37)
  {
    SEL v38 = [v4 urlRequestTimeout];
    [(NSPConfiguration *)v96 setUrlRequestTimeout:v38];
  }
  uint64_t v39 = [v4 waldoLeafOID];

  if (v39)
  {
    char v40 = [v4 waldoLeafOID];
    [(NSPConfiguration *)v96 setWaldoLeafOID:v40];
  }
  uint64_t v41 = [v4 waldoRevocationFailClosed];

  if (v41)
  {
    id v42 = [v4 waldoRevocationFailClosed];
    [(NSPConfiguration *)v96 setWaldoRevocationFailClosed:v42];
  }
  SEL v43 = [v4 configServerEnabled];

  if (v43)
  {
    id v44 = [v4 configServerEnabled];
    [(NSPConfiguration *)v96 setConfigServerEnabled:v44];
  }
  char v45 = [v4 edgeSets];
  uint64_t v46 = [v45 count];

  if (v46)
  {
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __26__NSPConfiguration_merge___block_invoke;
    v101[3] = &unk_1E5A3C518;
    v101[4] = v96;
    [v31 enumerateEdgeSetsWithBlock:v101];
    uint64_t v47 = [(NSPConfiguration *)v96 edgeSets];
    long long v48 = (void *)[v47 mutableCopy];

    uint64_t v49 = [v31 edgeSets];
    [v48 addEntriesFromDictionary:v49];

    [(NSPConfiguration *)v96 setEdgeSets:v48];
  }
  v50 = [v31 persistMetrics];

  if (v50)
  {
    uint64_t v51 = [v31 persistMetrics];
    [(NSPConfiguration *)v96 setPersistMetrics:v51];
  }
  __int16 v52 = [v31 proxyConfiguration];

  if (v52)
  {
    uint64_t v53 = [v31 proxyConfiguration];
    [(NSPConfiguration *)v96 setProxyConfiguration:v53];
  }
  v54 = [v31 proxyConfigurationData];

  if (v54)
  {
    uint64_t v55 = [v31 proxyConfigurationData];
    [(NSPConfiguration *)v96 setProxyConfigurationData:v55];
  }
  __int16 v56 = [v31 userTier];

  if (v56)
  {
    uint64_t v57 = [v31 userTier];
    [(NSPConfiguration *)v96 setUserTier:v57];
  }
  uint64_t v58 = [v31 proxyTrafficState];

  if (v58)
  {
    uint64_t v59 = [v31 proxyTrafficState];
    [(NSPConfiguration *)v96 setProxyTrafficState:v59];
  }
  v60 = [v31 anyAppEnabledDate];

  if (v60)
  {
    uint64_t v61 = [v31 anyAppEnabledDate];
    [(NSPConfiguration *)v96 setAnyAppEnabledDate:v61];
  }
  v62 = [v31 etag];

  if (v62)
  {
    uint64_t v63 = [v31 etag];
    [(NSPConfiguration *)v96 setEtag:v63];
  }
  v64 = [v31 epoch];

  if (v64)
  {
    uint64_t v65 = [v31 epoch];
    [(NSPConfiguration *)v96 setEpoch:v65];
  }
  v66 = [v31 configurationFetchDate];

  if (v66)
  {
    uint64_t v67 = [v31 configurationFetchDate];
    [(NSPConfiguration *)v96 setConfigurationFetchDate:v67];
  }
  v68 = [v31 willResetSubscriberTierTomorrow];

  if (v68)
  {
    uint64_t v69 = [v31 willResetSubscriberTierTomorrow];
    [(NSPConfiguration *)v96 setWillResetSubscriberTierTomorrow:v69];

    v70 = [v31 resetTomorrowDate];
    [(NSPConfiguration *)v96 setResetTomorrowDate:v70];
  }
  id v71 = [v31 cloudSubscriptionCheckEnabled];

  if (v71)
  {
    v72 = [v31 cloudSubscriptionCheckEnabled];
    [(NSPConfiguration *)v96 setCloudSubscriptionCheckEnabled:v72];
  }
  uint64_t v73 = [v31 geohashSharingEnabledStatus];

  if (v73)
  {
    v74 = [v31 geohashSharingEnabledStatus];
    [(NSPConfiguration *)v96 setGeohashSharingEnabledStatus:v74];
  }
  uint64_t v75 = [v31 geohashOverride];
  [(NSPConfiguration *)v96 setGeohashOverride:v75];

  v76 = [v31 preferredPathRoutingEnabledStatus];

  if (v76)
  {
    uint64_t v77 = [v31 preferredPathRoutingEnabledStatus];
    [(NSPConfiguration *)v96 setPreferredPathRoutingEnabledStatus:v77];
  }
  v78 = [v31 privateAccessTokensEnabledStatus];

  if (v78)
  {
    uint64_t v79 = [v31 privateAccessTokensEnabledStatus];
    [(NSPConfiguration *)v96 setPrivateAccessTokensEnabledStatus:v79];
  }
  v80 = [v31 privateAccessTokensAllowTools];

  if (v80)
  {
    v81 = [v31 privateAccessTokensAllowTools];
    [(NSPConfiguration *)v96 setPrivateAccessTokensAllowTools:v81];
  }
  objc_super v82 = [v31 inProcessFlowDivert];

  if (v82)
  {
    v83 = [v31 inProcessFlowDivert];
    [(NSPConfiguration *)v96 setInProcessFlowDivert:v83];
  }
  v84 = [v31 proxyAccountType];

  if (v84)
  {
    v85 = [v31 proxyAccountType];
    [(NSPConfiguration *)v96 setProxyAccountType:v85];
  }
  v86 = [v31 proxyAccountUnlimited];

  if (v86)
  {
    v87 = [v31 proxyAccountUnlimited];
    [(NSPConfiguration *)v96 setProxyAccountUnlimited:v87];
  }
  v88 = [v31 userPreferredTier];

  if (v88)
  {
    v89 = [v31 userPreferredTier];
    [(NSPConfiguration *)v96 setUserPreferredTier:v89];
  }
  v90 = [v31 subscriberEnabledFromNonSettingsApp];

  if (v90)
  {
    v91 = [v31 subscriberEnabledFromNonSettingsApp];
    [(NSPConfiguration *)v96 setSubscriberEnabledFromNonSettingsApp:v91];
  }
  v92 = [v31 trialConfigVersion];

  if (v92)
  {
    v93 = [v31 trialConfigVersion];
    [(NSPConfiguration *)v96 setTrialConfigVersion:v93];
  }
  v94 = [v31 lastPrivateCloudComputeEnvironment];
  [(NSPConfiguration *)v96 setLastPrivateCloudComputeEnvironment:v94];
}

uint64_t __26__NSPConfiguration_merge___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__NSPConfiguration_merge___block_invoke_2;
  v7[3] = &unk_1E5A3C518;
  id v8 = v3;
  id v5 = v3;
  [v4 enumerateEdgeSetsWithBlock:v7];

  return 1;
}

uint64_t __26__NSPConfiguration_merge___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 32) identifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    [*(id *)(a1 + 32) merge:v3 missingSettingsOnly:1];
  }

  return v6 ^ 1u;
}

- (NSPConfiguration)initWithTimestamp:(id)a3 fromDictionary:(id)a4 waldoSource:(int64_t)a5
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v107.receiver = self;
  v107.super_class = (Class)NSPConfiguration;
  uint64_t v10 = [(NSPConfiguration *)&v107 init];

  if (!v10) {
    goto LABEL_107;
  }
  objc_storeStrong((id *)&v10->_timestamp, a3);
  uint64_t v11 = [v9 objectForKeyedSubscript:@"version"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v13 = [v9 objectForKeyedSubscript:@"version"];
    version = v10->_version;
    v10->_version = (NSNumber *)v13;
  }
  uint64_t v15 = [v9 objectForKeyedSubscript:@"global"];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  if (v16)
  {
    uint64_t v17 = [v9 objectForKeyedSubscript:@"global"];
    v18 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"kill");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 doubleValue];
      if (v19 > 0.0)
      {
        id v20 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [v18 doubleValue];
        id v21 = objc_msgSend(v20, "initWithTimeIntervalSince1970:");
        [v21 timeIntervalSinceNow];
        if (v22 > 0.0) {
          objc_storeStrong((id *)&v10->_resurrectionDate, v21);
        }
      }
    }
    v87 = v18;
    if (a5 != 1)
    {
      uint64_t v23 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"enabled");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v10->_enabled, v23);
      }
      uint64_t v24 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"waldoLeafOID");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v10->_waldoLeafOID, v24);
      }
      uint64_t v25 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"waldoRevocationFailClosed");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v10->_waldoRevocationFailClosed, v25);
      }
      v26 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"PrivacyProxyConfigurationServerEnabled");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v10->_configServerEnabled, v26);
      }
    }
    uint64_t v27 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"PrivacyProxyConfigurationServerHost");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_configServerHost, v27);
    }
    SEL v28 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"PrivacyProxyConfigurationServerPort");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_configServerPort, v28);
    }
    v86 = v28;
    int v29 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"PrivacyProxyConfigurationServerPath");
    objc_opt_class();
    obuint64_t j = v29;
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_configServerPath, v29);
    }
    char v30 = [(NSDictionary *)v17 objectForPlatformSpecificKey:@"urlRequestTimeout"];
    objc_opt_class();
    id v93 = v30;
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_urlRequestTimeout, v30);
    }
    uint64_t v31 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"UserTier");
    objc_opt_class();
    v91 = v31;
    if (objc_opt_isKindOfClass())
    {
      id v32 = v31;
      SEL v33 = v27;
      if ([v32 isEqualToString:@"UNKNOWN"])
      {
        uint64_t v34 = 0;
      }
      else if ([v32 isEqualToString:@"FREE"])
      {
        uint64_t v34 = 1;
      }
      else if ([v32 isEqualToString:@"SUBSCRIBER"])
      {
        uint64_t v34 = 2;
      }
      else
      {
        uint64_t v34 = 0;
      }

      uint64_t v35 = [NSNumber numberWithInt:v34];
      userTier = v10->_userTier;
      v10->_userTier = (NSNumber *)v35;

      uint64_t v37 = [NSNumber numberWithInt:v34];
      userPreferredTier = v10->_userPreferredTier;
      v10->_userPreferredTier = (NSNumber *)v37;

      uint64_t v27 = v33;
    }
    uint64_t v39 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"SubscriberEnabledFromNonSettingsApp");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_subscriberEnabledFromNonSettingsApp, v39);
    }
    char v40 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"GeohashSharingEnabled");
    objc_opt_class();
    id v89 = v40;
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_geohashSharingEnabledStatus, v40);
    }
    uint64_t v41 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"GeohashOverride");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_geohashOverride, v41);
    }
    id v42 = v8;
    SEL v43 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"PrivateAccessTokensEnabled");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_preferredPathRoutingEnabledStatus, v43);
    }
    id v44 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"PrivateAccessTokensEnabled");
    objc_opt_class();
    id v88 = v44;
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_privateAccessTokensEnabledStatus, v44);
    }
    v85 = v39;
    char v45 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"PrivateAccessTokensAllowTools");
    objc_opt_class();
    id v8 = v42;
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_privateAccessTokensAllowTools, v45);
    }
    uint64_t v46 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"InProcessFlowDivert");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v10->_inProcessFlowDivert, v46);
    }
    v84 = v46;
    uint64_t v47 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"ProxyAccountType");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_57;
    }
    if ([v47 isEqualToString:@"Free"])
    {
      long long v48 = NSNumber;
      uint64_t v49 = 1;
    }
    else
    {
      if (![v47 isEqualToString:@"Subscriber"])
      {
LABEL_57:
        __int16 v52 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"ProxyAccountUnlimited");
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v10->_proxyAccountUnlimited, v52);
        }
        if (os_variant_has_internal_content())
        {
          v83 = v45;
          uint64_t v53 = v43;
          v54 = v41;
          id v55 = v8;
          __int16 v56 = v27;
          uint64_t v57 = -[NSDictionary objectForPlatformSpecificKey:](v17, @"LastPrivateCloudComputeEnvironment");
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)&v10->_lastPrivateCloudComputeEnvironment, v57);
          }

          uint64_t v27 = v56;
          id v8 = v55;
          uint64_t v41 = v54;
          SEL v43 = v53;
          char v45 = v83;
        }

        goto LABEL_64;
      }
      long long v48 = NSNumber;
      uint64_t v49 = 2;
    }
    uint64_t v50 = [v48 numberWithUnsignedInteger:v49];
    proxyAccountType = v10->_proxyAccountType;
    v10->_proxyAccountType = (NSNumber *)v50;

    goto LABEL_57;
  }
LABEL_64:
  uint64_t v58 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", 66977004, v83);
  proxyTrafficState = v10->_proxyTrafficState;
  v10->_proxyTrafficState = (NSNumber *)v58;

  v60 = [v9 objectForKeyedSubscript:@"apps"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v60 count])
  {
    id v94 = v60;
    obja = v10;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v61 = v60;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v103 objects:v109 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      id v64 = v9;
      id v65 = v8;
      id v66 = 0;
      uint64_t v67 = *(void *)v104;
      do
      {
        for (uint64_t i = 0; i != v63; ++i)
        {
          if (*(void *)v104 != v67) {
            objc_enumerationMutation(v61);
          }
          uint64_t v69 = *(void *)(*((void *)&v103 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v70 = [[NSPAppRule alloc] initFromDictionary:v69];
            if (v70)
            {
              if (!v66) {
                id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v66 addObject:v70];
            }
          }
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v103 objects:v109 count:16];
      }
      while (v63);
    }
    else
    {
      id v64 = v9;
      id v65 = v8;
      id v66 = 0;
    }

    id v8 = v65;
    id v9 = v64;
    uint64_t v10 = obja;
    if ([v66 count]) {
      objc_storeStrong((id *)&obja->_appRules, v66);
    }

    v60 = v94;
  }
  id v71 = [v9 objectForKeyedSubscript:@"edgeSets"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v71 count])
  {
    objb = v10;
    id v90 = v71;
    id v92 = v9;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v72 = v71;
    uint64_t v73 = [v72 countByEnumeratingWithState:&v99 objects:v108 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      id v75 = 0;
      uint64_t v76 = *(void *)v100;
      do
      {
        for (uint64_t j = 0; j != v74; ++j)
        {
          if (*(void *)v100 != v76) {
            objc_enumerationMutation(v72);
          }
          uint64_t v78 = *(void *)(*((void *)&v99 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v79 = [v72 objectForKeyedSubscript:v78];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v80 = [[NPWaldo alloc] initWithIdentifier:v78 timestamp:0 fromDictionary:v79 source:a5];
              if (v80)
              {
                if (!v75) {
                  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                }
                [v75 setObject:v80 forKeyedSubscript:v78];
              }
            }
          }
        }
        uint64_t v74 = [v72 countByEnumeratingWithState:&v99 objects:v108 count:16];
      }
      while (v74);
    }
    else
    {
      id v75 = 0;
    }

    uint64_t v10 = objb;
    if ([v75 count]) {
      objc_storeStrong((id *)&objb->_edgeSets, v75);
    }

    id v71 = v90;
    id v9 = v92;
  }
  v81 = v10;

LABEL_107:
  return v10;
}

- (id)initFromKeychain
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = +[NPUtilities copyDataFromKeychainWithIdentifier:@"com.apple.NetworkServiceProxy.Configuration" accountName:@"configuration"];
  if (v3)
  {
    id v51 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v51];
    id v5 = v51;
    if (v4)
    {
      int v6 = [(NSPConfiguration *)self initWithCoder:v4];
      if (v6)
      {
        self = v6;
        if (v6->_diskVersion == 9)
        {
          SEL v38 = v4;
          uint64_t v39 = v5;
          id v40 = v3;
          id v7 = +[NPUtilities copyItemIdentifiersFromKeychainWithAccountName:@"waldo"];
          id v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          uint64_t v41 = self;
          id v9 = [(NSPConfiguration *)self appRules];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v48;
            unint64_t v13 = 0x1E4F29000uLL;
            id v14 = @"com.apple.NetworkServiceProxy.WaldoInfo";
            do
            {
              uint64_t v15 = 0;
              uint64_t v42 = v11;
              do
              {
                if (*(void *)v48 != v12) {
                  objc_enumerationMutation(v9);
                }
                char v16 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
                uint64_t v17 = [v16 edgeSetIdentifier];
                if (v17
                  || ([v16 matchSigningIdentifier],
                      (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  if ([v7 count])
                  {
                    v18 = (void *)[objc_alloc(*(Class *)(v13 + 24)) initWithFormat:@"%@.%@", v14, v17];
                    [v7 removeObject:v18];
                  }
                  double v19 = [(NSDictionary *)v8 objectForKeyedSubscript:v17];

                  if (!v19)
                  {
                    id v20 = [[NPWaldo alloc] initFromKeychainWithIdentifier:v17];
                    id v21 = v20;
                    if (v20)
                    {
                      id v22 = v7;
                      uint64_t v23 = v12;
                      uint64_t v24 = v9;
                      uint64_t v25 = v14;
                      unint64_t v26 = v13;
                      uint64_t v27 = [v20 hostname];

                      if (!v27)
                      {
                        SEL v28 = [(NSPConfiguration *)v41 configServerHost];
                        [v21 setHostname:v28];
                      }
                      [(NSDictionary *)v8 setObject:v21 forKeyedSubscript:v17];
                      unint64_t v13 = v26;
                      id v14 = v25;
                      id v9 = v24;
                      uint64_t v12 = v23;
                      id v7 = v22;
                      uint64_t v11 = v42;
                    }
                  }
                }

                ++v15;
              }
              while (v11 != v15);
              uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
            }
            while (v11);
          }

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          int v29 = v7;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v44 != v32) {
                  objc_enumerationMutation(v29);
                }
                +[NPUtilities removeDataFromKeychainWithIdentifier:*(void *)(*((void *)&v43 + 1) + 8 * i)];
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v43 objects:v52 count:16];
            }
            while (v31);
          }

          edgeSets = v41->_edgeSets;
          v41->_edgeSets = v8;

          self = v41;
          uint64_t v35 = self;
          id v5 = v39;
          id v3 = v40;
          id v4 = v38;
          goto LABEL_41;
        }
        int v29 = nplog_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          int64_t diskVersion = self->_diskVersion;
          *(_DWORD *)buf = 134218240;
          int64_t v55 = diskVersion;
          __int16 v56 = 2048;
          uint64_t v57 = 9;
          _os_log_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_INFO, "Saved disk version of configuration (%ld) does not match latest supported version (%ld)", buf, 0x16u);
        }
      }
      else
      {
        int v29 = nplog_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_ERROR, "Failed to decode the NSP configuration from the keychain", buf, 2u);
        }
        self = 0;
      }
    }
    else
    {
      int v29 = nplog_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v55 = (int64_t)v5;
        _os_log_error_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the NSP configuration: %@", buf, 0xCu);
      }
    }
    uint64_t v35 = 0;
LABEL_41:

    goto LABEL_42;
  }
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "No Waldo info in the keychain", buf, 2u);
  }
  uint64_t v35 = 0;
LABEL_42:

  return v35;
}

- (void)saveToKeychain
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = +[NSPConfiguration defaultConfiguration];
  if (self) {
    objc_setProperty_atomic(self, v3, v4, 328);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = [(NSPConfiguration *)self appRules];
  uint64_t v30 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v41;
    int v29 = self;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v40 + 1) + 8 * v6);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        if (self) {
          id Property = objc_getProperty(self, v5, 328, 1);
        }
        else {
          id Property = 0;
        }
        id v9 = [Property appRules];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v37;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v37 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              uint64_t v15 = [v7 matchSigningIdentifier];
              char v16 = [v14 matchSigningIdentifier];
              int v17 = [v15 isEqualToString:v16];

              if (v17)
              {
                [v7 setDefaults:v14];
                goto LABEL_20;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_20:

        ++v6;
        self = v29;
      }
      while (v6 != v30);
      uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      uint64_t v30 = v18;
    }
    while (v18);
  }

  double v19 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(NSPConfiguration *)self encodeWithCoder:v19];
  id v20 = [v19 encodedData];
  +[NPUtilities saveDataToKeychain:v20 withIdentifier:@"com.apple.NetworkServiceProxy.Configuration" accountName:@"configuration"];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __34__NSPConfiguration_saveToKeychain__block_invoke;
  v35[3] = &unk_1E5A3C518;
  v35[4] = self;
  [(NSPConfiguration *)self enumerateEdgeSetsWithBlock:v35];
  if (self) {
    objc_setProperty_atomic(self, v21, 0, 328);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v22 = [(NSPConfiguration *)self appRules];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * j) setDefaults:0];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v24);
  }
}

uint64_t __34__NSPConfiguration_saveToKeychain__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setShouldSave:1];
  id v4 = [*(id *)(a1 + 32) configServerHost];
  [v3 setHostname:v4];

  [v3 saveToKeychain];
  return 1;
}

- (void)removeFromKeychain
{
  +[NPUtilities removeDataFromKeychainWithIdentifier:@"com.apple.NetworkServiceProxy.Configuration"];
  [(NSPConfiguration *)self enumerateEdgeSetsWithBlock:&__block_literal_global_415];
}

uint64_t __38__NSPConfiguration_removeFromKeychain__block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (id)copyTLVData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  int v7 = 0;
  id v4 = [(NSPConfiguration *)self persistMetrics];
  int v5 = [v4 BOOLValue];

  if (v5) {
    int v7 = 4;
  }
  -[NSMutableData appendType:length:value:](v3, 2, 4u, (uint64_t)&v7);
  return v3;
}

- (id)initFromTLVs:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NSPConfiguration;
  int v5 = [(NSPConfiguration *)&v10 init];
  if (v5)
  {
    uint64_t v6 = (void *)[v4 mutableCopy];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __33__NSPConfiguration_initFromTLVs___block_invoke;
    v8[3] = &unk_1E5A3BB00;
    id v9 = v5;
    -[NSMutableData enumerateTLVsUsingBlock:](v6, v8);
  }
  return v5;
}

uint64_t __33__NSPConfiguration_initFromTLVs___block_invoke(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  BOOL v4 = a2 == 2 && a3 == 4;
  uint64_t v5 = !v4;
  if (v4)
  {
    if ((*a4 & 4) != 0) {
      uint64_t v6 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F1CC28];
    }
    [*(id *)(a1 + 32) setPersistMetrics:v6];
  }
  return v5;
}

- (void)enumerateEdgeSetsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (uint64_t (**)(id, void *))a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(NSPConfiguration *)self edgeSets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
      uint64_t v11 = [(NSPConfiguration *)self edgeSets];
      uint64_t v12 = [v11 objectForKeyedSubscript:v10];
      int v13 = v4[2](v4, v12);

      if (!v13) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)copyAgentResultsForAppRule:(id)a3
{
  id v4 = a3;
  id v5 = [v4 agent];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F38D30];
    uint64_t v7 = [v4 agent];
    uint64_t v8 = [v7 agentUUID];
    uint64_t v9 = [v6 netAgentUUID:v8];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v5 addObject:v9];
    uint64_t v10 = [v4 edgeSetIdentifier];

    if (v10)
    {
      uint64_t v11 = [(NSPConfiguration *)self edgeSets];
      uint64_t v12 = [v4 edgeSetIdentifier];
      int v13 = [v11 objectForKeyedSubscript:v12];

      if (v13) {
        goto LABEL_5;
      }
    }
    long long v14 = [(NSPConfiguration *)self edgeSets];
    long long v15 = [v4 matchSigningIdentifier];
    int v13 = [v14 objectForKeyedSubscript:v15];

    if (v13)
    {
LABEL_5:
      long long v16 = [v13 agent];
      long long v17 = [v16 agentUUID];

      if (v17)
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F38D30];
        uint64_t v19 = [v13 agent];
        id v20 = [v19 agentUUID];
        id v21 = [v18 netAgentUUID:v20];

        [v5 addObject:v21];
      }
    }
  }
  else
  {
    int v13 = 0;
  }

  return v5;
}

- (void)updateNetworkAgents
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = [(NSPConfiguration *)self appRules];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    char v7 = 0;
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v5 = 138412290;
    long long v24 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "agent", v24);

        if (!v11)
        {
          uint64_t v12 = objc_alloc_init(NSPNetworkAgent);
          [v10 setAgent:v12];

          int v13 = [v10 agent];
          [v13 setAppRule:v10];

          long long v14 = [v10 agent];
          [v14 setConfiguration:self];

          id v15 = objc_alloc(MEMORY[0x1E4F38C00]);
          long long v16 = [v10 agent];
          long long v17 = (void *)[v15 initWithNetworkAgentClass:objc_opt_class()];
          [v10 setAgentRegistration:v17];
        }
        uint64_t v18 = [v10 enabled];
        int v19 = [v18 BOOLValue];

        if (v19)
        {
          id v20 = [v10 configurationIdentifier];
          BOOL v21 = v20 == 0;

          v7 |= v21;
          if (([v10 updateNetworkAgent] & 1) == 0)
          {
            id v22 = nplog_obj();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = [v10 matchSigningIdentifier];
              *(_DWORD *)buf = v24;
              uint64_t v30 = v23;
              _os_log_error_impl(&dword_1A0FEE000, v22, OS_LOG_TYPE_ERROR, "Failed to update the network agent for %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);

    if (v7) {
      [(NSPConfiguration *)self saveToKeychain];
    }
  }
  else
  {
  }
}

- (void)setupNSURLSession
{
  BOOL v21 = objc_alloc_init(NSURLSessionDelegate);
  id v3 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
  uint64_t v4 = [v3 _socketStreamProperties];
  long long v5 = (void *)MEMORY[0x1E4F1CA60];
  if (v4)
  {
    uint64_t v6 = [v3 _socketStreamProperties];
    char v7 = [v5 dictionaryWithDictionary:v6];
  }
  else
  {
    char v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F18F00]];
  objc_msgSend(v3, "set_socketStreamProperties:", v7);
  uint64_t v8 = [(NSPConfiguration *)self urlRequestTimeout];
  [v8 doubleValue];
  double v10 = v9;

  if (v10 <= 0.0)
  {
    [v3 setTimeoutIntervalForResource:30.0];
  }
  else
  {
    uint64_t v11 = [(NSPConfiguration *)self urlRequestTimeout];
    [v11 doubleValue];
    objc_msgSend(v3, "setTimeoutIntervalForResource:");
  }
  uint64_t v12 = [(NSPConfiguration *)self configServerHost];
  [(NSURLSessionDelegate *)v21 setValidationHostname:v12];

  int v13 = [(NSPConfiguration *)self waldoLeafOID];
  [(NSURLSessionDelegate *)v21 setLeafOID:v13];

  [(NSURLSessionDelegate *)v21 setIgnoreInvalidCerts:[(NSPConfiguration *)self ignoreInvalidCerts]];
  long long v14 = [(NSPConfiguration *)self waldoRevocationFailClosed];
  -[NSURLSessionDelegate setRevocationFailClosed:](v21, "setRevocationFailClosed:", [v14 BOOLValue]);

  id v15 = [(NSPConfiguration *)self privacyProxyURLSession];

  if (v15)
  {
    long long v16 = [(NSPConfiguration *)self privacyProxyURLSession];
    [v16 invalidateAndCancel];
  }
  long long v17 = (void *)MEMORY[0x1E4F290E0];
  uint64_t v18 = [MEMORY[0x1E4F28F08] mainQueue];
  int v19 = [v17 sessionWithConfiguration:v3 delegate:v21 delegateQueue:v18];
  [(NSPConfiguration *)self setPrivacyProxyURLSession:v19];

  id v20 = [(NSPConfiguration *)self privacyProxyURLSession];
  [v20 setSessionDescription:@"PrivacyProxy"];
}

- (void)setup
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(NSPConfiguration *)self setupNSURLSession];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = [(NSPConfiguration *)self appRules];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        char v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = [v7 edgeSetIdentifier];
        if (v8
          || ([v7 matchSigningIdentifier], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          double v9 = [(NSPConfiguration *)self edgeSets];
          double v10 = [v9 objectForKeyedSubscript:v8];

          if (v10)
          {
            uint64_t v11 = [v7 connectionIdleTimeout];

            uint64_t v12 = [v10 connectionIdleTimeoutMaximum];
            if (!v11) {
              goto LABEL_12;
            }
            int v13 = [v7 connectionIdleTimeout];
            uint64_t v14 = [v12 compare:v13];

            if (v14 == -1)
            {
              uint64_t v12 = [v10 connectionIdleTimeoutMaximum];
LABEL_12:
              [v7 setConnectionIdleTimeout:v12];
            }
          }
        }
        id v15 = [v7 connectionIdleTimeout];

        if (!v15) {
          [v7 setConnectionIdleTimeout:&unk_1EF43BDD8];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

- (NSDate)earliestEnableCheckDate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(NSPConfiguration *)self appRules];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v9 = [v8 enableCheckDate];

        if (v9)
        {
          uint64_t v10 = [v8 enableCheckDate];
          uint64_t v11 = (void *)v10;
          if (v5)
          {
            uint64_t v12 = [v5 earlierDate:v10];

            uint64_t v5 = (void *)v12;
          }
          else
          {
            uint64_t v5 = (void *)v10;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSDate *)v5;
}

- (BOOL)evaluateEnableRatios
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSPConfiguration *)self isDead];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v4 = [(NSPConfiguration *)self appRules];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v30;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = [v10 disabledByRatio];
        uint64_t v12 = [v10 enableRatio];
        if (!v12) {
          goto LABEL_11;
        }
        int v13 = (void *)v12;
        long long v14 = [v10 enableRatio];
        [v14 doubleValue];
        double v16 = v15;

        char v17 = v16 >= 1.0 || v3;
        if (v17)
        {
LABEL_11:
          [v10 setEnableCheckDate:0];
          if (([v10 disabledByRatio] & 1) == 0) {
            continue;
          }
          uint64_t v11 = 0;
LABEL_19:
          [v10 setDisabledByRatio:v11];
          char v7 = 1;
          continue;
        }
        uint64_t v18 = [v10 enableCheckDate];
        if (!v18
          || (uint64_t v19 = (void *)v18,
              [v10 enableCheckDate],
              long long v20 = objc_claimAutoreleasedReturnValue(),
              [v20 timeIntervalSinceNow],
              double v22 = v21,
              v20,
              v19,
              v22 < 0.0))
        {
          uint64_t v23 = [v10 reenableInterval];
          [v23 doubleValue];
          double v25 = v24;

          long long v26 = [v10 enableRatio];
          uint64_t v11 = +[NPUtilities rollDiceWithSuccessRatio:v26] ^ 1;

          if (v25 == 0.0) {
            double v25 = 3600.0;
          }
          long long v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:v25];
          [v10 setEnableCheckDate:v27];
        }
        if (v11 != [v10 disabledByRatio]) {
          goto LABEL_19;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v6) {
        goto LABEL_24;
      }
    }
  }
  char v7 = 0;
LABEL_24:

  return v7 & 1;
}

- (void)teardown
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(NSPConfiguration *)self appRules];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) teardownNetworkAgent];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSPConfiguration *)self enumerateEdgeSetsWithBlock:&__block_literal_global_431];
}

uint64_t __28__NSPConfiguration_teardown__block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (NSDate)dayPassExpirationDate
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  long long v8 = __Block_byref_object_copy__5;
  long long v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__NSPConfiguration_dayPassExpirationDate__block_invoke;
  v4[3] = &unk_1E5A3C560;
  v4[4] = &v5;
  [(NSPConfiguration *)self enumerateEdgeSetsWithBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

uint64_t __41__NSPConfiguration_dayPassExpirationDate__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 expirationDate];
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    if (v5)
    {
      uint64_t v6 = [v5 laterDate:v3];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      long long v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    else
    {
      id v9 = v3;
      long long v8 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v9;
    }
  }
  return 1;
}

- (id)createConfigFetchURLWithPath:(id)a3 timestamp:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(NSPConfiguration *)self configServerHost];
  uint64_t v7 = [(NSPConfiguration *)self configServerPort];
  id v8 = [NSString alloc];
  id v9 = v8;
  if (v7)
  {
    if (v5)
    {
      uint64_t v10 = [v8 initWithFormat:@"https://%@:%@/%@", v6, v7, v5];
LABEL_6:
      long long v11 = (void *)v10;
      goto LABEL_10;
    }
    uint64_t v12 = [(NSPConfiguration *)self configServerPath];
    uint64_t v13 = [v9 initWithFormat:@"https://%@:%@/%@", v6, v7, v12];
  }
  else
  {
    if (v5)
    {
      uint64_t v10 = [v8 initWithFormat:@"https://%@/%@", v6, v5, v16];
      goto LABEL_6;
    }
    uint64_t v12 = [(NSPConfiguration *)self configServerPath];
    uint64_t v13 = [v9 initWithFormat:@"https://%@/%@", v6, v12, v16];
  }
  long long v11 = (void *)v13;

LABEL_10:
  long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v11];

  return v14;
}

- (id)getEdgeSetForSigningIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(NSPConfiguration *)self appRules];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      long long v11 = [v10 matchSigningIdentifier];
      int v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    id v13 = [v10 edgeSetIdentifier];
    if (v13 || (id v13 = v4) != 0)
    {
      long long v14 = [(NSPConfiguration *)self edgeSets];
      double v15 = [v14 objectForKeyedSubscript:v13];

      goto LABEL_14;
    }
  }
LABEL_13:
  double v15 = 0;
LABEL_14:

  return v15;
}

- (id)getEdgeSetForAppRule:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (([v4 edgeSetIdentifier], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
     || ([v5 matchSigningIdentifier], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    uint64_t v7 = [(NSPConfiguration *)self edgeSets];
    uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)getCurrentKeyBagForAppRule:(id)a3
{
  id v4 = a3;
  id v5 = [(NSPConfiguration *)self edgeSets];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(NSPConfiguration *)self getEdgeSetForAppRule:v4];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 keybag];

      if (v9)
      {
        uint64_t v9 = [v8 keybag];
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isDead
{
  BOOL v3 = [(NSPConfiguration *)self resurrectionDate];
  if (v3)
  {
    id v4 = [(NSPConfiguration *)self resurrectionDate];
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 > 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setConfigServerHost:(id)a3
{
}

- (NSString)configServerHost
{
  id v2 = self->_configServerHost;
  if ([(__CFString *)v2 isEqualToString:@"mask-api.icloud.com"]
    && os_variant_has_internal_content())
  {

    id v2 = @"mask-api.icloud.com";
  }
  return (NSString *)v2;
}

- (BOOL)resetStaleEdgeSets
{
  BOOL v3 = +[NSPConfiguration defaultConfiguration];
  id v4 = [(NSPConfiguration *)self configServerHost];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __38__NSPConfiguration_resetStaleEdgeSets__block_invoke;
  long long v14 = &unk_1E5A3C588;
  id v5 = v4;
  long long v18 = &v19;
  id v15 = v5;
  uint64_t v16 = self;
  id v6 = v3;
  id v17 = v6;
  [(NSPConfiguration *)self enumerateEdgeSetsWithBlock:&v11];
  uint64_t v7 = v20[5];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v9 = objc_msgSend(v8, "initWithDictionary:", v20[5], v11, v12, v13, v14, v15, v16);
    [(NSPConfiguration *)self setEdgeSets:v9];
  }
  _Block_object_dispose(&v19, 8);

  return v7 != 0;
}

uint64_t __38__NSPConfiguration_resetStaleEdgeSets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 source] == 1)
  {
    uint64_t v4 = [v3 hostname];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [v3 hostname];
      char v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

      if ((v7 & 1) == 0)
      {
        [v3 removeDayPassesFromKernel];
        [v3 teardownNetworkAgent];
        if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          id v8 = [*(id *)(a1 + 40) edgeSets];
          uint64_t v9 = [v8 mutableCopy];
          uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v11 = *(void **)(v10 + 40);
          *(void *)(v10 + 40) = v9;
        }
        uint64_t v12 = [*(id *)(a1 + 48) edgeSets];
        id v13 = [v3 identifier];
        long long v14 = [v12 objectForKeyedSubscript:v13];

        if (v14)
        {
          id v15 = (void *)[v14 copy];
          uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          id v17 = [v3 identifier];
          [v16 setObject:v15 forKeyedSubscript:v17];
        }
        else
        {
          [v3 removeFromKeychain];
          long long v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          id v15 = [v3 identifier];
          [v18 setObject:0 forKeyedSubscript:v15];
        }
      }
    }
  }

  return 1;
}

- (void)incrementSessionCountersOnFirstLaunch
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v3 = [MEMORY[0x1E4F38CD8] sharedMaintainer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__NSPConfiguration_incrementSessionCountersOnFirstLaunch__block_invoke;
  v6[3] = &unk_1E5A3C5B0;
  v6[4] = &v7;
  [v3 iterateFileHandlesWithBlock:v6];

  if (!*((unsigned char *)v8 + 24))
  {
    uint64_t v4 = nplog_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_DEFAULT, "First launch after boot, incrementing session counters", v5, 2u);
    }

    [(NSPConfiguration *)self enumerateEdgeSetsWithBlock:&__block_literal_global_446];
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __57__NSPConfiguration_incrementSessionCountersOnFirstLaunch__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

uint64_t __57__NSPConfiguration_incrementSessionCountersOnFirstLaunch__block_invoke_444(uint64_t a1, void *a2)
{
  return 1;
}

+ (BOOL)validatePrivacyProxyConfiguration:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v113 = "+[NSPConfiguration validatePrivacyProxyConfiguration:]";
      _os_log_fault_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_FAULT, "%s called with null configuration", buf, 0xCu);
    }
    goto LABEL_34;
  }
  if ([v3 version] != 1)
  {
    uint64_t v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v113 = [v4 version];
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Configuration version %u not supported", buf, 8u);
    }
    goto LABEL_34;
  }
  if (![v4 enabled])
  {
    BOOL v15 = 1;
    goto LABEL_36;
  }
  id v5 = [v4 authInfo];
  if (![v5 authType])
  {

LABEL_14:
    uint64_t v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v4 authInfo];
      uint64_t v17 = [v16 authType];
      if (v17 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
        long long v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v18 = off_1E5A3C5F8[(int)v17];
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v113 = v18;
      _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Configuration has bad authentication type: %@", buf, 0xCu);
    }
    goto LABEL_34;
  }
  id v6 = [v4 authInfo];
  int v7 = [v6 authType];

  if (v7 >= 4) {
    goto LABEL_14;
  }
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v9 = [v4 authInfo];
  char v10 = [v9 authURL];
  uint64_t v11 = [v8 URLWithString:v10];

  if (!v11) {
    goto LABEL_32;
  }
  uint64_t v12 = [v11 host];
  if (!v12) {
    goto LABEL_32;
  }
  id v13 = (void *)v12;
  long long v14 = [v11 scheme];
  if ([v14 isEqualToString:@"https"])
  {

    goto LABEL_18;
  }
  uint64_t v19 = [v11 scheme];
  char v20 = [v19 isEqualToString:@"http"];

  if ((v20 & 1) == 0)
  {
LABEL_32:
    uint64_t v23 = nplog_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v113 = v11;
    uint64_t v34 = "Bad authentication url format %@";
    long long v37 = v23;
    uint32_t v38 = 12;
    goto LABEL_48;
  }
LABEL_18:
  uint64_t v21 = [v4 policyTierMaps];
  uint64_t v22 = [v21 count];

  if (v22 != 2)
  {
    uint64_t v23 = nplog_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    long long v36 = [v4 policyTierMaps];
    *(_DWORD *)buf = 134217984;
    *(void *)v113 = [v36 count];
    _os_log_error_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_ERROR, "Invalid policy tier count %lu", buf, 0xCu);
    goto LABEL_40;
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  uint64_t v23 = [v4 policyTierMaps];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v108 objects:v114 count:16];
  if (!v24)
  {

LABEL_44:
    uint64_t v23 = nplog_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    uint64_t v34 = "configuration should contain policies for both tiers";
LABEL_46:
    long long v37 = v23;
    uint32_t v38 = 2;
LABEL_48:
    _os_log_error_impl(&dword_1A0FEE000, v37, OS_LOG_TYPE_ERROR, v34, buf, v38);
    goto LABEL_33;
  }
  uint64_t v25 = v24;
  int v26 = 0;
  int v27 = 0;
  uint64_t v28 = *(void *)v109;
  do
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v109 != v28) {
        objc_enumerationMutation(v23);
      }
      long long v30 = *(void **)(*((void *)&v108 + 1) + 8 * i);
      if (![v30 tier] || (int)objc_msgSend(v30, "tier") >= 3)
      {
        long long v36 = nplog_obj();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        uint64_t v39 = [v30 tier];
        if (v39 >= 3)
        {
          long long v40 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v39);
        }
        else
        {
          long long v40 = off_1E5A3C640[(int)v39];
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v113 = v40;
        long long v41 = "bad policy tier type %@";
        long long v42 = v36;
LABEL_55:
        uint32_t v43 = 12;
        goto LABEL_56;
      }
      int v31 = [v30 tier];
      v26 |= v31 != 1;
      v27 |= v31 == 1;
    }
    uint64_t v25 = [v23 countByEnumeratingWithState:&v108 objects:v114 count:16];
  }
  while (v25);

  if ((v27 & v26 & 1) == 0) {
    goto LABEL_44;
  }
  long long v32 = [v4 proxies];
  unint64_t v33 = [v32 count];

  if (v33 < 2)
  {
    uint64_t v23 = nplog_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    uint64_t v34 = "bad configuration need atleast two proxies";
    goto LABEL_46;
  }
  if (![v4 proxiesCount])
  {
LABEL_105:
    uint64_t v23 = nplog_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    uint64_t v34 = "configuratio should contain both ingress and egress proxy";
    goto LABEL_46;
  }
  uint64_t v106 = 0;
  uint64_t v107 = 0;
  while (2)
  {
    uint64_t v23 = [v4 proxiesAtIndex:v107];
    if (![v23 proxyHop] && (int)[v23 proxyHop] >= 3)
    {
      long long v36 = nplog_obj();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v89 = [v23 proxyHop];
        if (v89 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v89);
          id v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v90 = off_1E5A3C620[(int)v89];
        }
        *(_DWORD *)buf = 134218242;
        *(void *)v113 = v107;
        *(_WORD *)&v113[8] = 2112;
        *(void *)&v113[10] = v90;
        _os_log_error_impl(&dword_1A0FEE000, v36, OS_LOG_TYPE_ERROR, "proxy hop at %lu has invalid hop type %@", buf, 0x16u);
      }
      goto LABEL_40;
    }
    int v44 = [v23 proxyHop];
    BOOL v45 = v44 == 1;
    BOOL v46 = v44 != 1;
    uint64_t v47 = (void *)MEMORY[0x1E4F1CB10];
    long long v48 = [v23 proxyURL];
    long long v36 = [v47 URLWithString:v48];

    if (!v36) {
      goto LABEL_107;
    }
    uint64_t v49 = [v36 host];
    if (!v49
      || (long long v50 = (void *)v49,
          [v36 scheme],
          id v51 = objc_claimAutoreleasedReturnValue(),
          char v52 = [v51 isEqualToString:@"https"],
          v51,
          v50,
          (v52 & 1) == 0))
    {
LABEL_107:
      long long v40 = nplog_obj();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v113 = v36;
        long long v41 = "Bad proxy url format %@";
        goto LABEL_113;
      }
LABEL_57:

LABEL_40:
      goto LABEL_33;
    }
    uint64_t v53 = [v23 proxyKeyInfos];
    uint64_t v54 = [v53 count];

    if (!v54)
    {
      long long v40 = nplog_obj();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        goto LABEL_57;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v113 = v36;
      long long v41 = "Proxy %@ needs proxy keys";
LABEL_113:
      long long v42 = v40;
      goto LABEL_55;
    }
    int64_t v55 = [v23 proxyKeyInfos];
    uint64_t v56 = [v55 count];

    if (v56)
    {
      unint64_t v57 = 0;
      while (1)
      {
        uint64_t v58 = [v23 proxyKeyInfoAtIndex:v57];

        if (!v58) {
          break;
        }
        ++v57;
        uint64_t v59 = [v23 proxyKeyInfos];
        unint64_t v60 = [v59 count];

        if (v57 >= v60) {
          goto LABEL_70;
        }
      }
      long long v40 = nplog_obj();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        goto LABEL_57;
      }
      *(_DWORD *)buf = 134218242;
      *(void *)v113 = v57;
      *(_WORD *)&v113[8] = 2112;
      *(void *)&v113[10] = v36;
      long long v41 = "proxy key info for index %lu is nil for proxy %@";
      long long v42 = v40;
      uint32_t v43 = 22;
LABEL_56:
      _os_log_error_impl(&dword_1A0FEE000, v42, OS_LOG_TYPE_ERROR, v41, buf, v43);
      goto LABEL_57;
    }
LABEL_70:
    id v61 = [v23 tokenKeyInfo];

    if (!v61)
    {
      long long v40 = nplog_obj();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        goto LABEL_57;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v113 = v36;
      long long v41 = "token issuance key is nil for proxy %@";
      goto LABEL_113;
    }
    LODWORD(v106) = v46 | v106;
    HIDWORD(v106) |= v45;

    if (++v107 < (unint64_t)[v4 proxiesCount]) {
      continue;
    }
    break;
  }
  if ((HIDWORD(v106) & v106 & 1) == 0) {
    goto LABEL_105;
  }
  uint64_t v62 = [v4 pathWeights];
  uint64_t v63 = [v62 count];

  if (!v63)
  {
    uint64_t v23 = nplog_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    uint64_t v34 = "configuration should contain atleast one proxy path weight";
    goto LABEL_46;
  }
  id v64 = [v4 pathWeights];
  uint64_t v65 = [v64 count];

  if (!v65)
  {
LABEL_83:
    uint64_t v73 = [v4 fallbackPathWeights];
    uint64_t v74 = [v73 count];

    if (v74)
    {
      unint64_t v75 = 0;
      while (1)
      {
        uint64_t v23 = [v4 fallbackPathWeightsAtIndex:v75];
        if ([v23 weight] >= 0x65)
        {
          uint64_t v69 = nplog_obj();
          if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
            goto LABEL_156;
          }
          *(_DWORD *)buf = 134217984;
          *(void *)v113 = v75;
          v91 = "Bad path weight at index %lu";
          goto LABEL_141;
        }
        if ([v23 proxiesCount] != 2)
        {
          uint64_t v69 = nplog_obj();
          if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
            goto LABEL_156;
          }
          *(_DWORD *)buf = 134217984;
          *(void *)v113 = v75;
          v91 = "Bad fallback proxy count for path weight at index %lu";
          goto LABEL_141;
        }
        unsigned int v76 = [v23 proxiesAtIndex:0];
        unsigned int v77 = [v23 proxiesAtIndex:1];
        if ([v4 proxiesCount] < (unint64_t)v76)
        {
          uint64_t v69 = nplog_obj();
          if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
            goto LABEL_156;
          }
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v76;
          *(_WORD *)&v113[4] = 2048;
          *(void *)&v113[6] = v75;
          v91 = "Bad fallback proxy index %u at path weight index %lu";
          goto LABEL_146;
        }
        if ([v4 proxiesCount] < (unint64_t)v77) {
          break;
        }
        uint64_t v69 = [v4 proxiesAtIndex:v76];
        if ([v69 proxyHop] != 1)
        {
          id v70 = nplog_obj();
          if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            goto LABEL_151;
          }
          *(_WORD *)buf = 0;
          long long v99 = "first fallback proxy index in path weight should be ingress only";
          long long v100 = v70;
          uint32_t v101 = 2;
LABEL_160:
          _os_log_error_impl(&dword_1A0FEE000, v100, OS_LOG_TYPE_ERROR, v99, buf, v101);
          goto LABEL_151;
        }
        if (([v69 supportsFallback] & 1) == 0)
        {
          id v70 = nplog_obj();
          if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            goto LABEL_151;
          }
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v76;
          *(_WORD *)&v113[4] = 2048;
          *(void *)&v113[6] = v75;
          long long v99 = "ingress fallback proxy does not have fallback capability for index %u at path weight index %lu";
          long long v100 = v70;
          uint32_t v101 = 18;
          goto LABEL_160;
        }
        uint64_t v78 = [v4 proxiesAtIndex:v77];
        if ([v78 proxyHop] != 2)
        {
          long long v102 = nplog_obj();
          if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
LABEL_155:

            goto LABEL_156;
          }
          *(_WORD *)buf = 0;
          long long v103 = "second fallback proxy index in path weight should be egress only";
          long long v104 = v102;
          uint32_t v105 = 2;
LABEL_162:
          _os_log_error_impl(&dword_1A0FEE000, v104, OS_LOG_TYPE_ERROR, v103, buf, v105);
          goto LABEL_155;
        }
        if (([v78 supportsFallback] & 1) == 0)
        {
          long long v102 = nplog_obj();
          if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
            goto LABEL_155;
          }
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v77;
          *(_WORD *)&v113[4] = 2048;
          *(void *)&v113[6] = v75;
          long long v103 = "egress fallback proxy does not have fallback capability for index %u at path weight index %lu";
          long long v104 = v102;
          uint32_t v105 = 18;
          goto LABEL_162;
        }

        ++v75;
        uint64_t v79 = [v4 fallbackPathWeights];
        unint64_t v80 = [v79 count];

        if (v75 >= v80) {
          goto LABEL_94;
        }
      }
      uint64_t v69 = nplog_obj();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        goto LABEL_156;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v113 = v77;
      *(_WORD *)&v113[4] = 2048;
      *(void *)&v113[6] = v75;
      v91 = "Bad fallback proxy index %u at path weight index %lu";
      goto LABEL_146;
    }
LABEL_94:
    if ([v4 resolversCount])
    {
      unint64_t v81 = 0;
      while (1)
      {
        uint64_t v23 = [v4 resolversAtIndex:v81];
        objc_super v82 = (void *)MEMORY[0x1E4F1CB10];
        v83 = [v23 dohURL];
        uint64_t v69 = [v82 URLWithString:v83];

        if (!v69) {
          break;
        }
        uint64_t v84 = [v69 host];
        if (!v84) {
          break;
        }
        v85 = (void *)v84;
        v86 = [v69 scheme];
        if ([v86 isEqualToString:@"https"])
        {
        }
        else
        {
          v87 = [v69 scheme];
          char v88 = [v87 isEqualToString:@"http"];

          if ((v88 & 1) == 0) {
            break;
          }
        }

        ++v81;
        BOOL v15 = 1;
        if (v81 >= [v4 resolversCount]) {
          goto LABEL_35;
        }
      }
      id v92 = nplog_obj();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v113 = v69;
        id v93 = "Bad resolver url format %@";
        id v94 = v92;
        uint32_t v95 = 12;
        goto LABEL_158;
      }
LABEL_130:

      goto LABEL_156;
    }
    BOOL v15 = 1;
    goto LABEL_35;
  }
  unint64_t v66 = 0;
  while (2)
  {
    uint64_t v23 = [v4 pathWeightsAtIndex:v66];
    if ([v23 weight] >= 0x65)
    {
      uint64_t v69 = nplog_obj();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        goto LABEL_156;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)v113 = v66;
      v91 = "Bad path weight at index %lu";
LABEL_141:
      v97 = v69;
      uint32_t v98 = 12;
      goto LABEL_147;
    }
    if ([v23 proxiesCount] != 2)
    {
      uint64_t v69 = nplog_obj();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        goto LABEL_156;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)v113 = v66;
      v91 = "Bad proxy count for path weight at index %lu";
      goto LABEL_141;
    }
    unsigned int v67 = [v23 proxiesAtIndex:0];
    unsigned int v68 = [v23 proxiesAtIndex:1];
    if ([v4 proxiesCount] < (unint64_t)v67)
    {
      uint64_t v69 = nplog_obj();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        goto LABEL_156;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v113 = v67;
      *(_WORD *)&v113[4] = 2048;
      *(void *)&v113[6] = v66;
      v91 = "Bad proxy index %u at path weight index %lu";
      goto LABEL_146;
    }
    if ([v4 proxiesCount] >= (unint64_t)v68)
    {
      uint64_t v69 = [v4 proxiesAtIndex:v67];
      if ([v69 proxyHop] != 1)
      {
        id v92 = nplog_obj();
        if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
          goto LABEL_130;
        }
        *(_WORD *)buf = 0;
        id v93 = "first proxy index in path weight should be ingress only";
        id v94 = v92;
        uint32_t v95 = 2;
LABEL_158:
        _os_log_error_impl(&dword_1A0FEE000, v94, OS_LOG_TYPE_ERROR, v93, buf, v95);
        goto LABEL_130;
      }
      id v70 = [v4 proxiesAtIndex:v68];
      if ([v70 proxyHop] != 2)
      {
        v96 = nplog_obj();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A0FEE000, v96, OS_LOG_TYPE_ERROR, "second proxy index in path weight should be egress only", buf, 2u);
        }

LABEL_151:
        goto LABEL_156;
      }

      ++v66;
      id v71 = [v4 pathWeights];
      unint64_t v72 = [v71 count];

      if (v66 >= v72) {
        goto LABEL_83;
      }
      continue;
    }
    break;
  }
  uint64_t v69 = nplog_obj();
  if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
    goto LABEL_156;
  }
  *(_DWORD *)buf = 67109376;
  *(_DWORD *)v113 = v68;
  *(_WORD *)&v113[4] = 2048;
  *(void *)&v113[6] = v66;
  v91 = "Bad proxy index %u at path weight index %lu";
LABEL_146:
  v97 = v69;
  uint32_t v98 = 18;
LABEL_147:
  _os_log_error_impl(&dword_1A0FEE000, v97, OS_LOG_TYPE_ERROR, v91, buf, v98);
LABEL_156:

LABEL_33:
LABEL_34:
  BOOL v15 = 0;
LABEL_35:

LABEL_36:
  return v15;
}

+ (void)verifyConfigurationSignature:(id)a3 configuration:(id)a4 host:(id)a5 validateCert:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v46 = a6;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v49 = a7;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v14 = [v10 certificates];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v57;
    CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    *(void *)&long long v16 = 138412290;
    long long v44 = v16;
    id v47 = v12;
    id v48 = v11;
    while (2)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v57 != v18) {
          objc_enumerationMutation(v14);
        }
        SecCertificateRef v21 = SecCertificateCreateWithData(v19, *(CFDataRef *)(*((void *)&v56 + 1) + 8 * v20));
        uint64_t v22 = nplog_obj();
        uint64_t v23 = v22;
        if (!v21)
        {
          id v12 = v47;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_ERROR, "SecCertificateCreateWithData failed", buf, 2u);
          }

          id v11 = v48;
          goto LABEL_32;
        }
        BOOL v24 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

        if (v24)
        {
          CFAbsoluteTimeGetCurrent();
          uint64_t v25 = (const void *)SecCertificateCopySummaryProperties();
          int v26 = nplog_obj();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v44;
            *(void *)&uint8_t buf[4] = v25;
            _os_log_debug_impl(&dword_1A0FEE000, v26, OS_LOG_TYPE_DEBUG, "Certificate Properties:\n%@", buf, 0xCu);
          }

          if (v25) {
            CFRelease(v25);
          }
        }
        if (+[NPUtilities certificateDateIsValid:](NPUtilities, "certificateDateIsValid:", v21, v44) != 1)
        {
          long long v37 = nplog_obj();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1A0FEE000, v37, OS_LOG_TYPE_ERROR, "Certificate did not fall within valid dates", buf, 2u);
          }

          CFRelease(v21);
          id v12 = v47;
          id v11 = v48;
LABEL_32:
          uint64_t v28 = v49;
          (*((void (**)(id, void))v49 + 2))(v49, 0);

          goto LABEL_48;
        }
        [v13 addObject:v21];
        CFRelease(v21);
        ++v20;
      }
      while (v17 != v20);
      uint64_t v17 = [v14 countByEnumeratingWithState:&v56 objects:v63 count:16];
      id v12 = v47;
      id v11 = v48;
      if (v17) {
        continue;
      }
      break;
    }
  }

  if (![v13 count])
  {
    uint32_t v38 = nplog_obj();
    uint64_t v28 = v49;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v38, OS_LOG_TYPE_ERROR, "No valid certificates to verify signed configuration", buf, 2u);
    }
    goto LABEL_35;
  }
  ApplePinned = (const void *)SecPolicyCreateApplePinned();
  uint64_t v28 = v49;
  if (!ApplePinned)
  {
    uint32_t v38 = nplog_obj();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v12;
    uint64_t v39 = "SecPolicyCreateApplePinned failed for %@ host";
    long long v40 = buf;
    long long v41 = v38;
    uint32_t v42 = 12;
LABEL_50:
    _os_log_error_impl(&dword_1A0FEE000, v41, OS_LOG_TYPE_ERROR, v39, v40, v42);
LABEL_35:

    (*((void (**)(id, void))v49 + 2))(v49, 0);
    goto LABEL_48;
  }
  long long v29 = ApplePinned;
  *(void *)buf = 0;
  OSStatus v30 = SecTrustCreateWithCertificates(v13, ApplePinned, (SecTrustRef *)buf);
  int v31 = *(__SecTrust **)buf;
  if (v30 || !*(void *)buf)
  {
    if (*(void *)buf)
    {
      CFRelease(*(CFTypeRef *)buf);
      *(void *)buf = 0;
    }
    CFRelease(v29);
    uint32_t v38 = nplog_obj();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    *(_WORD *)unint64_t v60 = 0;
    uint64_t v39 = "SecTrustCreateWithCertificates failed";
    long long v40 = v60;
    long long v41 = v38;
    uint32_t v42 = 2;
    goto LABEL_50;
  }
  if (!v46)
  {
    uint32_t v43 = nplog_obj();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v60 = 0;
      _os_log_impl(&dword_1A0FEE000, v43, OS_LOG_TYPE_INFO, "Ignoring validation for Signed configuration", v60, 2u);
    }

    (*((void (**)(id, uint64_t))v49 + 2))(v49, 1);
    if (*(void *)buf)
    {
      CFRelease(*(CFTypeRef *)buf);
      *(void *)buf = 0;
    }
    goto LABEL_47;
  }
  id v32 = v12;
  unint64_t v33 = NPGetInternalQueue();
  result[0] = MEMORY[0x1E4F143A8];
  result[1] = 3221225472;
  result[2] = __99__NSPConfiguration_verifyConfigurationSignature_configuration_host_validateCert_completionHandler___block_invoke;
  result[3] = &unk_1E5A3C5D8;
  uint64_t v54 = *(void *)buf;
  id v55 = a1;
  id v51 = v10;
  id v52 = v11;
  id v34 = v49;
  id v53 = v34;
  OSStatus v35 = SecTrustEvaluateAsyncWithError(v31, v33, result);

  if (!v35)
  {

    id v12 = v32;
LABEL_47:
    CFRelease(v29);
    goto LABEL_48;
  }
  long long v36 = nplog_obj();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)unint64_t v60 = 67109120;
    OSStatus v61 = v35;
    _os_log_error_impl(&dword_1A0FEE000, v36, OS_LOG_TYPE_ERROR, "SecTrustEvaluateAsync returned an error: %d", v60, 8u);
  }

  if (*(void *)buf)
  {
    CFRelease(*(CFTypeRef *)buf);
    *(void *)buf = 0;
  }
  (*((void (**)(id, void))v34 + 2))(v34, 0);

  id v12 = v32;
LABEL_48:
}

void __99__NSPConfiguration_verifyConfigurationSignature_configuration_host_validateCert_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v7 = nplog_obj();
  id v8 = v7;
  if (!a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)cf = 138412290;
      *(void *)&cf[4] = a4;
      _os_log_error_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_ERROR, "SecTrustEvaluateAsyncWithError failed with %@", cf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_26;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)cf = 0;
    _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_INFO, "SecTrustEvaluateAsyncWithError success", cf, 2u);
  }

  uint64_t v9 = SecTrustCopyKey(*(SecTrustRef *)(a1 + 56));
  if (v9)
  {
    id v10 = *(void **)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    CFDataRef v12 = v10;
    self;
    if (v11)
    {
      if (v12)
      {
        if ([v11 signatureAlgorithm] == 1)
        {
          *(void *)cf = 0;
          CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F3BA70];
          CFDataRef v14 = [v11 signature];
          int v15 = SecKeyVerifySignature(v9, v13, v12, v14, (CFErrorRef *)cf);

          if (*(void *)cf) {
            CFRelease(*(CFTypeRef *)cf);
          }

          if (v15 == 1)
          {
            long long v16 = nplog_obj();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)cf = 0;
              _os_log_impl(&dword_1A0FEE000, v16, OS_LOG_TYPE_INFO, "Configuration Signature validated", cf, 2u);
            }

            uint64_t v17 = nplog_large_obj();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              uint64_t v18 = *(void *)(a1 + 40);
              *(_DWORD *)cf = 138412290;
              *(void *)&cf[4] = v18;
              _os_log_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_INFO, "Validated configuration %@", cf, 0xCu);
            }

            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_25:
            CFRelease(v9);
            goto LABEL_26;
          }
          goto LABEL_22;
        }
        CFAllocatorRef v19 = nplog_obj();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = [v11 signatureAlgorithm];
          *(_DWORD *)cf = 134217984;
          *(void *)&cf[4] = v22;
          _os_log_error_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_ERROR, "validate signature, bad signature algorithm: %lu", cf, 0xCu);
        }
        goto LABEL_21;
      }
      CFAllocatorRef v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)cf = 136315138;
        *(void *)&cf[4] = "+[NSPConfiguration validateSignature:publicKey:signedData:]";
        uint64_t v23 = "%s called with null signedData";
        goto LABEL_33;
      }
    }
    else
    {
      CFAllocatorRef v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)cf = 136315138;
        *(void *)&cf[4] = "+[NSPConfiguration validateSignature:publicKey:signedData:]";
        uint64_t v23 = "%s called with null signatureInfo";
LABEL_33:
        _os_log_fault_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_FAULT, v23, cf, 0xCu);
      }
    }
LABEL_21:
  }
LABEL_22:
  uint64_t v20 = nplog_obj();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)cf = 0;
    _os_log_error_impl(&dword_1A0FEE000, v20, OS_LOG_TYPE_ERROR, "Configuration Signature failed validation", cf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v9) {
    goto LABEL_25;
  }
LABEL_26:
  SecCertificateRef v21 = *(const void **)(a1 + 56);
  if (v21)
  {
    CFRelease(v21);
    *(void *)(a1 + 56) = 0;
  }
}

- (BOOL)saveToPreferences
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  if (!v3)
  {
    id v10 = nplog_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      BOOL v11 = 0;
      goto LABEL_9;
    }
    __int16 v17 = 0;
    CFDataRef v12 = "NSKeyedArchiver initialize failed";
    CFStringRef v13 = (uint8_t *)&v17;
LABEL_11:
    _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_8;
  }
  uint64_t v4 = self->_proxyConfiguration;
  proxyConfiguration = self->_proxyConfiguration;
  self->_proxyConfiguration = 0;

  [(NSPConfiguration *)self encodeWithCoder:v3];
  id v6 = self->_proxyConfiguration;
  self->_proxyConfiguration = v4;

  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
  _CFPreferencesSetFileProtectionClass();
  id v8 = [v3 encodedData];
  CFPreferencesSetAppValue(@"NSPConfiguration", v8, v7);

  LODWORD(v8) = CFPreferencesAppSynchronize(v7);
  uint64_t v9 = nplog_obj();
  id v10 = v9;
  if (!v8)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    CFDataRef v12 = "Failed to write nsp configuration to preference file";
    CFStringRef v13 = buf;
    goto LABEL_11;
  }
  BOOL v11 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v15 = 0;
    _os_log_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_INFO, "Saved configuration to preference file", v15, 2u);
  }
LABEL_9:

  return v11;
}

- (id)initFromPreferences
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"NSPConfiguration", (CFStringRef)*MEMORY[0x1E4F1D3D8]);
  if (v3)
  {
    uint64_t v4 = v3;
    id v25 = 0;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v25];
    id v6 = v25;
    CFStringRef v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8)
    {
      uint64_t v9 = nplog_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v27 = (int64_t)v7;
        _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the NSP configuration: %@", buf, 0xCu);
      }

      CFRelease(v4);
LABEL_9:
      id v10 = 0;
LABEL_46:

      goto LABEL_47;
    }
    CFRelease(v4);
    v24.receiver = self;
    v24.super_class = (Class)NSPConfiguration;
    BOOL v11 = [(NSPConfiguration *)&v24 init];
    if (v11)
    {
      CFDataRef v12 = [(NSPConfiguration *)v11 initWithCoder:v5];
      if (!v12)
      {
        int v15 = nplog_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_ERROR, "Failed to decode the NSP configuration", buf, 2u);
        }

        self = 0;
        goto LABEL_9;
      }
      self = v12;
      unint64_t diskVersion = v12->_diskVersion;
      if (diskVersion - 21 <= 0xFFFFFFFFFFFFFFF3)
      {
        CFDataRef v14 = nplog_obj();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int64_t v23 = self->_diskVersion;
          *(_DWORD *)buf = 134218240;
          int64_t v27 = v23;
          __int16 v28 = 2048;
          uint64_t v29 = 20;
          _os_log_error_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_ERROR, "Saved disk version of configuration (%ld) does not match latest supported version (%ld)", buf, 0x16u);
        }

        goto LABEL_9;
      }
      if (diskVersion <= 9) {
        objc_storeStrong((id *)&v12->_userPreferredTier, v12->_userTier);
      }
      unint64_t v16 = [(NSNumber *)self->_proxyTrafficState unsignedLongLongValue];
      int64_t v17 = self->_diskVersion;
      uint64_t v18 = v16 | 0x7000;
      if (v17 >= 11) {
        uint64_t v18 = v16;
      }
      if (v17 < 12) {
        v18 |= 0x8000uLL;
      }
      if (v17 < 13) {
        v18 |= 0x10000uLL;
      }
      if (v17 < 14) {
        v18 |= 0x1C0000uLL;
      }
      if (v17 < 15) {
        v18 |= 0x200000uLL;
      }
      if (v17 < 16) {
        v18 |= 0x400000uLL;
      }
      if (v17 < 17) {
        v18 |= 0x800000uLL;
      }
      if (v17 < 18) {
        v18 |= 0x1000000uLL;
      }
      if (v17 >= 19) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = v18 | 0x2000000;
      }
      uint64_t v20 = [NSNumber numberWithUnsignedLongLong:v19];
      proxyTrafficState = self->_proxyTrafficState;
      self->_proxyTrafficState = v20;
    }
    else
    {
      self = 0;
    }
    self = self;
    id v10 = self;
    goto LABEL_46;
  }
  CFStringRef v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_INFO, "no saved configuration", buf, 2u);
  }
  id v10 = 0;
LABEL_47:

  return v10;
}

- (id)tierToString
{
  id v2 = [(NSPConfiguration *)self userTier];
  uint64_t v3 = [v2 intValue];
  if (v3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = off_1E5A3C640[(int)v3];
  }

  return v4;
}

- (BOOL)fetchDateIsWithinStart:(id)a3 end:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(NSPConfiguration *)self configurationFetchDate];
  uint64_t v9 = v8;
  if (!v8)
  {
    int v15 = nplog_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      SecCertificateRef v21 = [(NSPConfiguration *)self etag];
      int v22 = 138412290;
      int64_t v23 = v21;
      _os_log_error_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_ERROR, "Configuration (etag %@) has no fetch time, so cannot check validity", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_7;
  }
  [v8 timeIntervalSinceDate:v6];
  double v11 = v10;
  [v7 timeIntervalSinceDate:v9];
  double v13 = v12;
  if (v11 < 0.0 || v12 < 0.0)
  {
    if (v11 < 0.0 && v11 > -600.0)
    {
      int v15 = nplog_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        unint64_t v16 = "Configuration fetch date before start, but within 10 minute grace period";
LABEL_16:
        _os_log_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    int64_t v17 = nplog_obj();
    int v15 = v17;
    if (v13 < 0.0 && v13 > -600.0)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        unint64_t v16 = "Configuration fetch date after end, but within 10 minute grace period";
        goto LABEL_16;
      }
LABEL_17:
      BOOL v14 = 1;
      goto LABEL_18;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [(NSPConfiguration *)self configurationFetchDate];
      uint64_t v20 = [(NSPConfiguration *)self etag];
      int v22 = 138413058;
      int64_t v23 = v19;
      __int16 v24 = 2112;
      id v25 = v20;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_error_impl(&dword_1A0FEE000, v15, OS_LOG_TYPE_ERROR, "Configuration fetch time %@ (etag %@) is not within start time (%@) and end time (%@)", (uint8_t *)&v22, 0x2Au);
    }
LABEL_7:
    BOOL v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)timestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)enabled
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEnabled:(id)a3
{
}

- (NSString)etag
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEtag:(id)a3
{
}

- (NSNumber)epoch
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEpoch:(id)a3
{
}

- (NSDate)resurrectionDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResurrectionDate:(id)a3
{
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppRules:(id)a3
{
}

- (NSNumber)configServerEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConfigServerEnabled:(id)a3
{
}

- (NSNumber)configServerPort
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfigServerPort:(id)a3
{
}

- (NSString)configServerPath
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConfigServerPath:(id)a3
{
}

- (NSNumber)urlRequestTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUrlRequestTimeout:(id)a3
{
}

- (NSString)waldoLeafOID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWaldoLeafOID:(id)a3
{
}

- (NSNumber)waldoRevocationFailClosed
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWaldoRevocationFailClosed:(id)a3
{
}

- (NSURLSession)privacyProxyURLSession
{
  return self->_privacyProxyURLSession;
}

- (void)setPrivacyProxyURLSession:(id)a3
{
}

- (BOOL)ignoreInvalidCerts
{
  return self->_ignoreInvalidCerts;
}

- (void)setIgnoreInvalidCerts:(BOOL)a3
{
  self->_ignoreInvalidCerts = a3;
}

- (NSDictionary)edgeSets
{
  return self->_edgeSets;
}

- (void)setEdgeSets:(id)a3
{
}

- (NSNumber)persistMetrics
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPersistMetrics:(id)a3
{
}

- (NSPPrivacyProxyConfiguration)proxyConfiguration
{
  return (NSPPrivacyProxyConfiguration *)objc_getProperty(self, a2, 152, 1);
}

- (void)setProxyConfiguration:(id)a3
{
}

- (NSData)proxyConfigurationData
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setProxyConfigurationData:(id)a3
{
}

- (void)setUserTier:(id)a3
{
}

- (void)setProxyTrafficState:(id)a3
{
}

- (NSDate)configurationFetchDate
{
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (void)setConfigurationFetchDate:(id)a3
{
}

- (NSDate)resetTomorrowDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (void)setResetTomorrowDate:(id)a3
{
}

- (NSDate)anyAppEnabledDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAnyAppEnabledDate:(id)a3
{
}

- (void)setWillResetSubscriberTierTomorrow:(id)a3
{
}

- (NSNumber)cloudSubscriptionCheckEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCloudSubscriptionCheckEnabled:(id)a3
{
}

- (NSNumber)geohashSharingEnabledStatus
{
  return self->_geohashSharingEnabledStatus;
}

- (void)setGeohashSharingEnabledStatus:(id)a3
{
}

- (NSString)geohashOverride
{
  return self->_geohashOverride;
}

- (void)setGeohashOverride:(id)a3
{
}

- (NSNumber)preferredPathRoutingEnabledStatus
{
  return self->_preferredPathRoutingEnabledStatus;
}

- (void)setPreferredPathRoutingEnabledStatus:(id)a3
{
}

- (NSNumber)privateAccessTokensEnabledStatus
{
  return self->_privateAccessTokensEnabledStatus;
}

- (void)setPrivateAccessTokensEnabledStatus:(id)a3
{
}

- (NSNumber)privateAccessTokensAllowTools
{
  return self->_privateAccessTokensAllowTools;
}

- (void)setPrivateAccessTokensAllowTools:(id)a3
{
}

- (NSNumber)inProcessFlowDivert
{
  return self->_inProcessFlowDivert;
}

- (void)setInProcessFlowDivert:(id)a3
{
}

- (void)setProxyAccountType:(id)a3
{
}

- (void)setProxyAccountUnlimited:(id)a3
{
}

- (NSNumber)userPreferredTier
{
  return self->_userPreferredTier;
}

- (void)setUserPreferredTier:(id)a3
{
}

- (NSNumber)subscriberEnabledFromNonSettingsApp
{
  return self->_subscriberEnabledFromNonSettingsApp;
}

- (void)setSubscriberEnabledFromNonSettingsApp:(id)a3
{
}

- (NSNumber)trialConfigVersion
{
  return self->_trialConfigVersion;
}

- (void)setTrialConfigVersion:(id)a3
{
}

- (NSString)lastPrivateCloudComputeEnvironment
{
  return self->_lastPrivateCloudComputeEnvironment;
}

- (void)setLastPrivateCloudComputeEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_lastPrivateCloudComputeEnvironment, 0);
  objc_storeStrong((id *)&self->_trialConfigVersion, 0);
  objc_storeStrong((id *)&self->_subscriberEnabledFromNonSettingsApp, 0);
  objc_storeStrong((id *)&self->_userPreferredTier, 0);
  objc_storeStrong((id *)&self->_proxyAccountUnlimited, 0);
  objc_storeStrong((id *)&self->_proxyAccountType, 0);
  objc_storeStrong((id *)&self->_inProcessFlowDivert, 0);
  objc_storeStrong((id *)&self->_privateAccessTokensAllowTools, 0);
  objc_storeStrong((id *)&self->_privateAccessTokensEnabledStatus, 0);
  objc_storeStrong((id *)&self->_preferredPathRoutingEnabledStatus, 0);
  objc_storeStrong((id *)&self->_geohashOverride, 0);
  objc_storeStrong((id *)&self->_geohashSharingEnabledStatus, 0);
  objc_storeStrong((id *)&self->_cloudSubscriptionCheckEnabled, 0);
  objc_storeStrong((id *)&self->_willResetSubscriberTierTomorrow, 0);
  objc_storeStrong((id *)&self->_anyAppEnabledDate, 0);
  objc_storeStrong((id *)&self->_resetTomorrowDate, 0);
  objc_storeStrong((id *)&self->_configurationFetchDate, 0);
  objc_storeStrong((id *)&self->_proxyTrafficState, 0);
  objc_storeStrong((id *)&self->_userTier, 0);
  objc_storeStrong((id *)&self->_proxyConfigurationData, 0);
  objc_storeStrong((id *)&self->_proxyConfiguration, 0);
  objc_storeStrong((id *)&self->_persistMetrics, 0);
  objc_storeStrong((id *)&self->_edgeSets, 0);
  objc_storeStrong((id *)&self->_privacyProxyURLSession, 0);
  objc_storeStrong((id *)&self->_waldoRevocationFailClosed, 0);
  objc_storeStrong((id *)&self->_waldoLeafOID, 0);
  objc_storeStrong((id *)&self->_urlRequestTimeout, 0);
  objc_storeStrong((id *)&self->_configServerPath, 0);
  objc_storeStrong((id *)&self->_configServerPort, 0);
  objc_storeStrong((id *)&self->_configServerEnabled, 0);
  objc_storeStrong((id *)&self->_appRules, 0);
  objc_storeStrong((id *)&self->_resurrectionDate, 0);
  objc_storeStrong((id *)&self->_epoch, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_configServerHost, 0);
}

@end