@interface NSPConfigurationStats
- (BOOL)appMetricsEnabled;
- (BOOL)appTrackersEnabled;
- (BOOL)appleCertificatesEnabled;
- (BOOL)brandedCallingEnabled;
- (BOOL)configurationEnabled;
- (BOOL)dnsEnabled;
- (BOOL)exposureNotificationsEnabled;
- (BOOL)knownTrackersEnabled;
- (BOOL)launchWarningDetailsEnabled;
- (BOOL)mailTrackersEnabled;
- (BOOL)metricsUploadEnabled;
- (BOOL)networkToolsEnabled;
- (BOOL)newsEmbeddedContentEnabled;
- (BOOL)newsURLResolutionEnabled;
- (BOOL)passwordManagerIconFetchEnabled;
- (BOOL)postbackFetchEnabled;
- (BOOL)promotedContentEnabled;
- (BOOL)safariAllEnabled;
- (BOOL)safariDNSEnabled;
- (BOOL)safariHTTPEnabled;
- (BOOL)safariMetricsEnabled;
- (BOOL)safariPrivateAllEnabled;
- (BOOL)safariPrivateDNSEnabled;
- (BOOL)safariPrivateUnencryptedEnabled;
- (BOOL)safariTrackersEnabled;
- (BOOL)safariUnencryptedEnabled;
- (BOOL)tokenFetchEnabled;
- (BOOL)unencryptedEnabled;
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)configurationVersion;
- (void)setAppMetricsEnabled:(BOOL)a3;
- (void)setAppTrackersEnabled:(BOOL)a3;
- (void)setAppleCertificatesEnabled:(BOOL)a3;
- (void)setBrandedCallingEnabled:(BOOL)a3;
- (void)setConfigurationEnabled:(BOOL)a3;
- (void)setConfigurationVersion:(unint64_t)a3;
- (void)setDnsEnabled:(BOOL)a3;
- (void)setExposureNotificationsEnabled:(BOOL)a3;
- (void)setKnownTrackersEnabled:(BOOL)a3;
- (void)setLaunchWarningDetailsEnabled:(BOOL)a3;
- (void)setMailTrackersEnabled:(BOOL)a3;
- (void)setMetricsUploadEnabled:(BOOL)a3;
- (void)setNetworkToolsEnabled:(BOOL)a3;
- (void)setNewsEmbeddedContentEnabled:(BOOL)a3;
- (void)setNewsURLResolutionEnabled:(BOOL)a3;
- (void)setPasswordManagerIconFetchEnabled:(BOOL)a3;
- (void)setPostbackFetchEnabled:(BOOL)a3;
- (void)setPromotedContentEnabled:(BOOL)a3;
- (void)setSafariAllEnabled:(BOOL)a3;
- (void)setSafariDNSEnabled:(BOOL)a3;
- (void)setSafariHTTPEnabled:(BOOL)a3;
- (void)setSafariMetricsEnabled:(BOOL)a3;
- (void)setSafariPrivateAllEnabled:(BOOL)a3;
- (void)setSafariPrivateDNSEnabled:(BOOL)a3;
- (void)setSafariPrivateUnencryptedEnabled:(BOOL)a3;
- (void)setSafariTrackersEnabled:(BOOL)a3;
- (void)setSafariUnencryptedEnabled:(BOOL)a3;
- (void)setTierType:(id)a3;
- (void)setTokenFetchEnabled:(BOOL)a3;
- (void)setUnencryptedEnabled:(BOOL)a3;
@end

@implementation NSPConfigurationStats

- (id)eventName
{
  return @"com.apple.nsp.configurationStats";
}

- (id)analyticsDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[NSNumber numberWithUnsignedInteger:[(NSPConfigurationStats *)self configurationVersion]];
  [v3 setObject:v4 forKeyedSubscript:@"ConfigurationVersion"];

  v5 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self configurationEnabled]];
  [v3 setObject:v5 forKeyedSubscript:@"ConfigurationEnabled"];

  v6 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self tokenFetchEnabled]];
  [v3 setObject:v6 forKeyedSubscript:@"TokenFetchEnabled"];

  v7 = [(NSPConfigurationStats *)self tierType];
  [v3 setObject:v7 forKeyedSubscript:@"TierType"];

  v8 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self safariUnencryptedEnabled]];
  [v3 setObject:v8 forKeyedSubscript:@"SafariUnencryptedEnabled"];

  v9 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self safariDNSEnabled]];
  [v3 setObject:v9 forKeyedSubscript:@"SafariDNSEnabled"];

  v10 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self safariTrackersEnabled]];
  [v3 setObject:v10 forKeyedSubscript:@"SafariTrackersEnabled"];

  v11 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self safariAllEnabled]];
  [v3 setObject:v11 forKeyedSubscript:@"SafariAllEnabled"];

  v12 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self safariHTTPEnabled]];
  [v3 setObject:v12 forKeyedSubscript:@"SafariHTTPEnabled"];

  v13 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self safariPrivateUnencryptedEnabled]];
  [v3 setObject:v13 forKeyedSubscript:@"SafariPrivateUnencryptedEnabled"];

  v14 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self safariPrivateDNSEnabled]];
  [v3 setObject:v14 forKeyedSubscript:@"SafariPrivateDNSEnabled"];

  v15 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self safariPrivateAllEnabled]];
  [v3 setObject:v15 forKeyedSubscript:@"SafariPrivateAllEnabled"];

  v16 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self safariMetricsEnabled]];
  [v3 setObject:v16 forKeyedSubscript:@"SafariMetricsEnabled"];

  v17 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self mailTrackersEnabled]];
  [v3 setObject:v17 forKeyedSubscript:@"MailTrackersEnabled"];

  v18 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self unencryptedEnabled]];
  [v3 setObject:v18 forKeyedSubscript:@"UnencryptedEnabled"];

  v19 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self dnsEnabled]];
  [v3 setObject:v19 forKeyedSubscript:@"DNSEnabled"];

  v20 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self knownTrackersEnabled]];
  [v3 setObject:v20 forKeyedSubscript:@"KnownTrackersEnabled"];

  v21 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self appTrackersEnabled]];
  [v3 setObject:v21 forKeyedSubscript:@"AppTrackersEnabled"];

  v22 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self newsURLResolutionEnabled]];
  [v3 setObject:v22 forKeyedSubscript:@"NewsURLResolutionEnabled"];

  v23 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self exposureNotificationsEnabled]];
  [v3 setObject:v23 forKeyedSubscript:@"ExposureNotificationsEnabled"];

  v24 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self appleCertificatesEnabled]];
  [v3 setObject:v24 forKeyedSubscript:@"AppleCertificatesEnabled"];

  v25 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self networkToolsEnabled]];
  [v3 setObject:v25 forKeyedSubscript:@"NetworkToolsEnabled"];

  v26 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self metricsUploadEnabled]];
  [v3 setObject:v26 forKeyedSubscript:@"MetricsUploadEnabled"];

  v27 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self newsEmbeddedContentEnabled]];
  [v3 setObject:v27 forKeyedSubscript:@"NewsEmbeddedContentEnabled"];

  v28 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self appMetricsEnabled]];
  [v3 setObject:v28 forKeyedSubscript:@"AppMetricsEnabled"];

  v29 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self promotedContentEnabled]];
  [v3 setObject:v29 forKeyedSubscript:@"PromotedContentEnabled"];

  v30 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self brandedCallingEnabled]];
  [v3 setObject:v30 forKeyedSubscript:@"BrandedCallingEnabled"];

  v31 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self postbackFetchEnabled]];
  [v3 setObject:v31 forKeyedSubscript:@"PostbackFetchEnabled"];

  v32 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self passwordManagerIconFetchEnabled]];
  [v3 setObject:v32 forKeyedSubscript:@"PasswordManagerIconFetchEnabled"];

  v33 = +[NSNumber numberWithBool:[(NSPConfigurationStats *)self launchWarningDetailsEnabled]];
  [v3 setObject:v33 forKeyedSubscript:@"LaunchWarningDetailsEnabled"];

  return v3;
}

- (unint64_t)configurationVersion
{
  return self->_configurationVersion;
}

- (void)setConfigurationVersion:(unint64_t)a3
{
  self->_configurationVersion = a3;
}

- (BOOL)configurationEnabled
{
  return self->_configurationEnabled;
}

- (void)setConfigurationEnabled:(BOOL)a3
{
  self->_configurationEnabled = a3;
}

- (BOOL)tokenFetchEnabled
{
  return self->_tokenFetchEnabled;
}

- (void)setTokenFetchEnabled:(BOOL)a3
{
  self->_tokenFetchEnabled = a3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (BOOL)safariUnencryptedEnabled
{
  return self->_safariUnencryptedEnabled;
}

- (void)setSafariUnencryptedEnabled:(BOOL)a3
{
  self->_safariUnencryptedEnabled = a3;
}

- (BOOL)safariDNSEnabled
{
  return self->_safariDNSEnabled;
}

- (void)setSafariDNSEnabled:(BOOL)a3
{
  self->_safariDNSEnabled = a3;
}

- (BOOL)safariTrackersEnabled
{
  return self->_safariTrackersEnabled;
}

- (void)setSafariTrackersEnabled:(BOOL)a3
{
  self->_safariTrackersEnabled = a3;
}

- (BOOL)safariAllEnabled
{
  return self->_safariAllEnabled;
}

- (void)setSafariAllEnabled:(BOOL)a3
{
  self->_safariAllEnabled = a3;
}

- (BOOL)safariHTTPEnabled
{
  return self->_safariHTTPEnabled;
}

- (void)setSafariHTTPEnabled:(BOOL)a3
{
  self->_safariHTTPEnabled = a3;
}

- (BOOL)safariPrivateUnencryptedEnabled
{
  return self->_safariPrivateUnencryptedEnabled;
}

- (void)setSafariPrivateUnencryptedEnabled:(BOOL)a3
{
  self->_safariPrivateUnencryptedEnabled = a3;
}

- (BOOL)safariPrivateDNSEnabled
{
  return self->_safariPrivateDNSEnabled;
}

- (void)setSafariPrivateDNSEnabled:(BOOL)a3
{
  self->_safariPrivateDNSEnabled = a3;
}

- (BOOL)safariPrivateAllEnabled
{
  return self->_safariPrivateAllEnabled;
}

- (void)setSafariPrivateAllEnabled:(BOOL)a3
{
  self->_safariPrivateAllEnabled = a3;
}

- (BOOL)safariMetricsEnabled
{
  return self->_safariMetricsEnabled;
}

- (void)setSafariMetricsEnabled:(BOOL)a3
{
  self->_safariMetricsEnabled = a3;
}

- (BOOL)mailTrackersEnabled
{
  return self->_mailTrackersEnabled;
}

- (void)setMailTrackersEnabled:(BOOL)a3
{
  self->_mailTrackersEnabled = a3;
}

- (BOOL)unencryptedEnabled
{
  return self->_unencryptedEnabled;
}

- (void)setUnencryptedEnabled:(BOOL)a3
{
  self->_unencryptedEnabled = a3;
}

- (BOOL)dnsEnabled
{
  return self->_dnsEnabled;
}

- (void)setDnsEnabled:(BOOL)a3
{
  self->_dnsEnabled = a3;
}

- (BOOL)knownTrackersEnabled
{
  return self->_knownTrackersEnabled;
}

- (void)setKnownTrackersEnabled:(BOOL)a3
{
  self->_knownTrackersEnabled = a3;
}

- (BOOL)appTrackersEnabled
{
  return self->_appTrackersEnabled;
}

- (void)setAppTrackersEnabled:(BOOL)a3
{
  self->_appTrackersEnabled = a3;
}

- (BOOL)newsURLResolutionEnabled
{
  return self->_newsURLResolutionEnabled;
}

- (void)setNewsURLResolutionEnabled:(BOOL)a3
{
  self->_newsURLResolutionEnabled = a3;
}

- (BOOL)exposureNotificationsEnabled
{
  return self->_exposureNotificationsEnabled;
}

- (void)setExposureNotificationsEnabled:(BOOL)a3
{
  self->_exposureNotificationsEnabled = a3;
}

- (BOOL)appleCertificatesEnabled
{
  return self->_appleCertificatesEnabled;
}

- (void)setAppleCertificatesEnabled:(BOOL)a3
{
  self->_appleCertificatesEnabled = a3;
}

- (BOOL)networkToolsEnabled
{
  return self->_networkToolsEnabled;
}

- (void)setNetworkToolsEnabled:(BOOL)a3
{
  self->_networkToolsEnabled = a3;
}

- (BOOL)metricsUploadEnabled
{
  return self->_metricsUploadEnabled;
}

- (void)setMetricsUploadEnabled:(BOOL)a3
{
  self->_metricsUploadEnabled = a3;
}

- (BOOL)brandedCallingEnabled
{
  return self->_brandedCallingEnabled;
}

- (void)setBrandedCallingEnabled:(BOOL)a3
{
  self->_brandedCallingEnabled = a3;
}

- (BOOL)newsEmbeddedContentEnabled
{
  return self->_newsEmbeddedContentEnabled;
}

- (void)setNewsEmbeddedContentEnabled:(BOOL)a3
{
  self->_newsEmbeddedContentEnabled = a3;
}

- (BOOL)appMetricsEnabled
{
  return self->_appMetricsEnabled;
}

- (void)setAppMetricsEnabled:(BOOL)a3
{
  self->_appMetricsEnabled = a3;
}

- (BOOL)promotedContentEnabled
{
  return self->_promotedContentEnabled;
}

- (void)setPromotedContentEnabled:(BOOL)a3
{
  self->_promotedContentEnabled = a3;
}

- (BOOL)postbackFetchEnabled
{
  return self->_postbackFetchEnabled;
}

- (void)setPostbackFetchEnabled:(BOOL)a3
{
  self->_postbackFetchEnabled = a3;
}

- (BOOL)passwordManagerIconFetchEnabled
{
  return self->_passwordManagerIconFetchEnabled;
}

- (void)setPasswordManagerIconFetchEnabled:(BOOL)a3
{
  self->_passwordManagerIconFetchEnabled = a3;
}

- (BOOL)launchWarningDetailsEnabled
{
  return self->_launchWarningDetailsEnabled;
}

- (void)setLaunchWarningDetailsEnabled:(BOOL)a3
{
  self->_launchWarningDetailsEnabled = a3;
}

- (void).cxx_destruct
{
}

@end