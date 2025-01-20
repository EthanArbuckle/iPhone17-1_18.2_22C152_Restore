@interface NDOWarranty
+ (BOOL)supportsSecureCoding;
+ (NDOWarranty)warrantyWithDictionary:(id)a3;
+ (id)_legacyWarrantyPath;
+ (id)_warrantyPathForSerialNumberFormat;
+ (id)cachedWarrantyForSerialNumber:(id)a3;
+ (id)migrateLegacyCachedWarrantyIfNeededForSerialNumber:(id)a3;
- (BOOL)acOfferDisplay;
- (BOOL)acOfferEligible;
- (BOOL)acOfferSettingsAppBadge;
- (BOOL)acOfferSettingsRowBadge;
- (BOOL)coverageHasACLogo;
- (BOOL)covered;
- (BOOL)displayRepairAndSupport;
- (BOOL)isACServicesPartner;
- (BOOL)isAPSSupported;
- (BOOL)isCoveragePlanSubscriptionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)scIntervalFollowupEligible;
- (BOOL)scIntervalPairedDeviceAllowed;
- (BOOL)showNotificationToggle;
- (NDOWarranty)initWithCoder:(id)a3;
- (NDOWarranty)initWithDictionary:(id)a3;
- (NSArray)acOfferToggle;
- (NSArray)benefitDetailsArray;
- (NSArray)coverageDetailsArray;
- (NSDate)acOfferConversionDate;
- (NSDate)acOfferDisplayDate;
- (NSDate)acOfferEligibleUntil;
- (NSDate)acOfferFollowupDisplayDate;
- (NSDate)coverageEndDate;
- (NSDate)coverageValidityDate;
- (NSDictionary)coverageBenefitsDictionary;
- (NSDictionary)coverageDetailsDictionary;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)scIntervalInDays;
- (NSString)acLocalizedGroupedOfferCTA;
- (NSString)acLocalizedGroupedOfferFooterLabel;
- (NSString)acLocalizedNotificationOfferDesc;
- (NSString)acLocalizedOfferCTA;
- (NSString)acLocalizedOfferDesc;
- (NSString)acLocalizedOfferDetails;
- (NSString)acLocalizedOfferDetailsEligibility;
- (NSString)acLocalizedOfferDetailsPluralEligibilityFormat;
- (NSString)acLocalizedOfferDetailsSingularEligibility;
- (NSString)acLocalizedOfferLabel;
- (NSString)acLocalizedOfferLongLabel;
- (NSString)acLocalizedOfferPluralDescFormat;
- (NSString)acLocalizedOfferSingularDesc;
- (NSString)acLocalizedOfferStatusLabel;
- (NSString)acLocalizedUnlinkedPlanLabel;
- (NSString)acLocalizedUnlinkedPlanStatusLabel;
- (NSString)acNotificationLocalizedOfferLabel;
- (NSString)acNotificationLocalizedOfferPluralDescFormat;
- (NSString)acNotificationLocalizedOfferSingularDesc;
- (NSString)acOfferIdentifier;
- (NSString)acOfferPromoFormat;
- (NSString)acOfferPromoNew;
- (NSString)agsULURL;
- (NSString)agsURL;
- (NSString)coverageLocalizedDesc;
- (NSString)coverageLocalizedDescLong;
- (NSString)coverageLocalizedExpirationLabel;
- (NSString)coverageLocalizedLabel;
- (NSString)description;
- (NSString)deviceDesc;
- (NSString)deviceImageUrl;
- (NSString)eligibilityEventId;
- (NSString)footer1FormatString;
- (NSString)footer1LinkLabel;
- (NSString)footer1LinkURL;
- (NSString)footer2FormatString;
- (NSString)footer2LinkLabel;
- (NSString)footer2LinkURL;
- (NSString)getSupportURL;
- (NSString)localizedBenefitLabelKey;
- (NSString)localizedBenefitValueKey;
- (NSString)localizedBenefitsCardFooter;
- (NSString)localizedBenefitsCardSubTitle;
- (NSString)localizedBenefitsCardTitle;
- (NSString)localizedCoverageDetailsLabel;
- (NSString)localizedCoverageDetailsTitle;
- (NSString)localizedCoverageDetailsValue;
- (NSString)localizedCoverageFooterFormatString;
- (NSString)localizedCoverageFooterLinkLabel;
- (NSString)localizedCoverageSubTitleForServicesPartnerString;
- (NSString)localizedCoveredDeviceDateLabelFormat;
- (NSString)localizedManagePlanLabel;
- (NSString)localizedSupportAppFooter;
- (NSString)localizedSupportAppLabel;
- (NSString)mySupportURL;
- (NSString)parentId;
- (NSString)pfcId;
- (NSString)pgfId;
- (NSString)sgId;
- (NSString)supportAppURL;
- (double)acOfferBadgeDurationBeforeEndDate;
- (double)acOfferDurationBeforeEndDate;
- (double)cacheValidityDuration;
- (double)showNotificationBeforeEndDate;
- (unsigned)daysEligible;
- (void)acLocalizedNotificationOfferDesc;
- (void)acLocalizedOfferDesc;
- (void)acLocalizedOfferDetailsEligibility;
- (void)cache;
- (void)cacheWarranty:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAcLocalizedGroupedOfferCTA:(id)a3;
- (void)setAcLocalizedGroupedOfferFooterLabel:(id)a3;
- (void)setAcLocalizedOfferCTA:(id)a3;
- (void)setAcLocalizedOfferDetails:(id)a3;
- (void)setAcLocalizedOfferDetailsPluralEligibilityFormat:(id)a3;
- (void)setAcLocalizedOfferDetailsSingularEligibility:(id)a3;
- (void)setAcLocalizedOfferLabel:(id)a3;
- (void)setAcLocalizedOfferLongLabel:(id)a3;
- (void)setAcLocalizedOfferPluralDescFormat:(id)a3;
- (void)setAcLocalizedOfferSingularDesc:(id)a3;
- (void)setAcLocalizedOfferStatusLabel:(id)a3;
- (void)setAcLocalizedUnlinkedPlanLabel:(id)a3;
- (void)setAcLocalizedUnlinkedPlanStatusLabel:(id)a3;
- (void)setAcNotificationLocalizedOfferLabel:(id)a3;
- (void)setAcNotificationLocalizedOfferPluralDescFormat:(id)a3;
- (void)setAcNotificationLocalizedOfferSingularDesc:(id)a3;
- (void)setAcOfferBadgeDurationBeforeEndDate:(double)a3;
- (void)setAcOfferConversionDate:(id)a3;
- (void)setAcOfferDisplay:(BOOL)a3;
- (void)setAcOfferDisplayDate:(id)a3;
- (void)setAcOfferDurationBeforeEndDate:(double)a3;
- (void)setAcOfferEligible:(BOOL)a3;
- (void)setAcOfferEligibleUntil:(id)a3;
- (void)setAcOfferFollowupDisplayDate:(id)a3;
- (void)setAcOfferIdentifier:(id)a3;
- (void)setAcOfferPromoFormat:(id)a3;
- (void)setAcOfferPromoNew:(id)a3;
- (void)setAcOfferSettingsAppBadge:(BOOL)a3;
- (void)setAcOfferSettingsRowBadge:(BOOL)a3;
- (void)setAcOfferToggle:(id)a3;
- (void)setAgsULURL:(id)a3;
- (void)setAgsURL:(id)a3;
- (void)setBenefitDetailsArray:(id)a3;
- (void)setCacheValidityDuration:(double)a3;
- (void)setCoverageBenefitsDictionary:(id)a3;
- (void)setCoverageDetailsArray:(id)a3;
- (void)setCoverageDetailsDictionary:(id)a3;
- (void)setCoverageEndDate:(id)a3;
- (void)setCoverageHasACLogo:(BOOL)a3;
- (void)setCoverageLocalizedDesc:(id)a3;
- (void)setCoverageLocalizedDescLong:(id)a3;
- (void)setCoverageLocalizedExpirationLabel:(id)a3;
- (void)setCoverageLocalizedLabel:(id)a3;
- (void)setCoverageValidityDate:(id)a3;
- (void)setCovered:(BOOL)a3;
- (void)setDeviceDesc:(id)a3;
- (void)setDeviceImageUrl:(id)a3;
- (void)setDictionaryRepresentation:(id)a3;
- (void)setDisplayRepairAndSupport:(BOOL)a3;
- (void)setEligibilityEventId:(id)a3;
- (void)setFooter1FormatString:(id)a3;
- (void)setFooter1LinkLabel:(id)a3;
- (void)setFooter1LinkURL:(id)a3;
- (void)setFooter2FormatString:(id)a3;
- (void)setFooter2LinkLabel:(id)a3;
- (void)setFooter2LinkURL:(id)a3;
- (void)setGetSupportURL:(id)a3;
- (void)setIsACServicesPartner:(BOOL)a3;
- (void)setIsAPSSupported:(BOOL)a3;
- (void)setIsCoveragePlanSubscriptionType:(BOOL)a3;
- (void)setLocalizedBenefitLabelKey:(id)a3;
- (void)setLocalizedBenefitValueKey:(id)a3;
- (void)setLocalizedBenefitsCardFooter:(id)a3;
- (void)setLocalizedBenefitsCardSubTitle:(id)a3;
- (void)setLocalizedBenefitsCardTitle:(id)a3;
- (void)setLocalizedCoverageDetailsLabel:(id)a3;
- (void)setLocalizedCoverageDetailsTitle:(id)a3;
- (void)setLocalizedCoverageDetailsValue:(id)a3;
- (void)setLocalizedCoverageFooterFormatString:(id)a3;
- (void)setLocalizedCoverageFooterLinkLabel:(id)a3;
- (void)setLocalizedCoverageSubTitleForServicesPartnerString:(id)a3;
- (void)setLocalizedCoveredDeviceDateLabelFormat:(id)a3;
- (void)setLocalizedManagePlanLabel:(id)a3;
- (void)setLocalizedSupportAppFooter:(id)a3;
- (void)setLocalizedSupportAppLabel:(id)a3;
- (void)setMySupportURL:(id)a3;
- (void)setParentId:(id)a3;
- (void)setPfcId:(id)a3;
- (void)setPgfId:(id)a3;
- (void)setScIntervalFollowupEligible:(BOOL)a3;
- (void)setScIntervalInDays:(id)a3;
- (void)setScIntervalPairedDeviceAllowed:(BOOL)a3;
- (void)setSgId:(id)a3;
- (void)setShowNotificationBeforeEndDate:(double)a3;
- (void)setShowNotificationToggle:(BOOL)a3;
- (void)setSupportAppURL:(id)a3;
@end

@implementation NDOWarranty

+ (id)_legacyWarrantyPath
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"Library/Application Support/com.apple.NewDeviceOutreach/Warranty.plist"];

  return v3;
}

+ (id)_warrantyPathForSerialNumberFormat
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"Library/Application Support/com.apple.NewDeviceOutreach/%@_Warranty.plist"];

  return v3;
}

+ (NDOWarranty)warrantyWithDictionary:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [[NDOWarranty alloc] initWithDictionary:v3];

  v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "+[NDOWarranty warrantyWithDictionary:]";
    __int16 v9 = 1024;
    BOOL v10 = v4 != 0;
    _os_log_impl(&dword_23C013000, v5, OS_LOG_TYPE_DEFAULT, "%s : %d", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

+ (id)migrateLegacyCachedWarrantyIfNeededForSerialNumber:(id)a3
{
  id v4 = a3;
  v5 = NSDictionary;
  v6 = [a1 _legacyWarrantyPath];
  int v7 = [v5 dictionaryWithContentsOfFile:v6];
  v8 = [a1 warrantyWithDictionary:v7];

  if (v8)
  {
    __int16 v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C013000, v9, OS_LOG_TYPE_DEFAULT, "Migrating legacy warranty..", buf, 2u);
    }

    [v8 cacheWarranty:v4];
    BOOL v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v11 = [v10 objectForKey:@"CachedWarrantyValidityDuration"];
    [v11 doubleValue];
    double v13 = v12;

    if (v13 > 0.0)
    {
      v14 = NSString;
      v15 = [v4 sha256Hash];
      v16 = [v14 stringWithFormat:@"%@_CachedWarrantyValidityDuration", v15];
      [v10 setDouble:v16 forKey:v13];

      [v10 removeObjectForKey:@"CachedWarrantyValidityDuration"];
    }
    v17 = [v10 objectForKey:@"CachedWarrantyLastUpdatedDate"];
    if (v17)
    {
      v18 = NSString;
      v19 = [v4 sha256Hash];
      v20 = [v18 stringWithFormat:@"%@_CachedWarrantyLastUpdatedDate", v19];
      [v10 setObject:v17 forKey:v20];

      [v10 removeObjectForKey:@"CachedWarrantyLastUpdatedDate"];
    }
    v21 = [v10 objectForKey:@"CachedWarrantyLocale"];
    if (v21)
    {
      v22 = NSString;
      v23 = [v4 sha256Hash];
      v24 = [v22 stringWithFormat:@"%@_CachedWarrantyLocale", v23];
      [v10 setObject:v21 forKey:v24];

      [v10 removeObjectForKey:@"CachedWarrantyLocale"];
      v25 = [v10 objectForKey:@"CachedWarrantyVersion"];
      v26 = NSString;
      v27 = [v4 sha256Hash];
      v28 = [v26 stringWithFormat:@"%@_CachedWarrantyVersion", v27];
      [v10 setObject:v25 forKey:v28];

      [v10 removeObjectForKey:@"CachedWarrantyVersion"];
    }
    else
    {
      v25 = [v10 objectForKey:@"CachedWarrantyVersion"];
    }
    v29 = [MEMORY[0x263F08850] defaultManager];
    v30 = [a1 _legacyWarrantyPath];
    [v29 removeItemAtPath:v30 error:0];
  }
  return v8;
}

+ (id)cachedWarrantyForSerialNumber:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = NSString;
    v6 = [a1 _warrantyPathForSerialNumberFormat];
    int v7 = [v4 sha256Hash];
    v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }
  else
  {
    v8 = [a1 _legacyWarrantyPath];
  }
  __int16 v9 = _NDOLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "+[NDOWarranty cachedWarrantyForSerialNumber:]";
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_23C013000, v9, OS_LOG_TYPE_DEFAULT, "%s : warrantyPath : %@", buf, 0x16u);
  }

  BOOL v10 = [NSDictionary dictionaryWithContentsOfFile:v8];
  uint64_t v11 = [a1 warrantyWithDictionary:v10];

  return v11;
}

- (NDOWarranty)initWithDictionary:(id)a3
{
  id v4 = a3;
  v120.receiver = self;
  v120.super_class = (Class)NDOWarranty;
  v5 = [(NDOWarranty *)&v120 init];
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      v47 = v5;
      v6 = 0;
LABEL_17:

      goto LABEL_18;
    }
    [(NDOWarranty *)v5 setDictionaryRepresentation:v4];
    int v7 = [v4 objectForKeyedSubscript:@"covered"];
    -[NDOWarranty setCovered:](v6, "setCovered:", [v7 BOOLValue]);

    v8 = [v4 objectForKeyedSubscript:@"coverageEndDate"];
    __int16 v9 = +[NDOUtilities dateWithEpochNumber:v8];
    [(NDOWarranty *)v6 setCoverageEndDate:v9];

    BOOL v10 = [v4 objectForKeyedSubscript:@"localizedCoveredDeviceDateLabelFormat"];
    [(NDOWarranty *)v6 setLocalizedCoveredDeviceDateLabelFormat:v10];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"coverageLocalizedLabel"];
    [(NDOWarranty *)v6 setCoverageLocalizedLabel:v11];

    double v12 = [v4 objectForKeyedSubscript:@"coverageLocalizedDesc"];
    [(NDOWarranty *)v6 setCoverageLocalizedDesc:v12];

    double v13 = [v4 objectForKeyedSubscript:@"coverageLocalizedDescLong"];
    [(NDOWarranty *)v6 setCoverageLocalizedDescLong:v13];

    v14 = [v4 objectForKeyedSubscript:@"coverageLocalizedExpirationLabel"];
    [(NDOWarranty *)v6 setCoverageLocalizedExpirationLabel:v14];

    __int16 v15 = [v4 objectForKeyedSubscript:@"footer1FormatString"];
    [(NDOWarranty *)v6 setFooter1FormatString:v15];

    v16 = [v4 objectForKeyedSubscript:@"footer1LinkLabel"];
    [(NDOWarranty *)v6 setFooter1LinkLabel:v16];

    uint64_t v17 = [v4 objectForKeyedSubscript:@"footer1LinkURL"];
    [(NDOWarranty *)v6 setFooter1LinkURL:v17];

    v18 = [v4 objectForKeyedSubscript:@"footer2FormatString"];
    [(NDOWarranty *)v6 setFooter2FormatString:v18];

    v19 = [v4 objectForKeyedSubscript:@"footer2LinkLabel"];
    [(NDOWarranty *)v6 setFooter2LinkLabel:v19];

    v20 = [v4 objectForKeyedSubscript:@"footer2LinkURL"];
    [(NDOWarranty *)v6 setFooter2LinkURL:v20];

    v21 = [v4 objectForKeyedSubscript:@"acOfferEligible"];
    -[NDOWarranty setAcOfferEligible:](v6, "setAcOfferEligible:", [v21 BOOLValue]);

    v22 = [v4 objectForKeyedSubscript:@"acOfferEligibleUntil"];
    v23 = +[NDOUtilities dateWithEpochNumber:v22];
    [(NDOWarranty *)v6 setAcOfferEligibleUntil:v23];

    v24 = [v4 objectForKeyedSubscript:@"acOfferFollowupDisplayDate"];
    v25 = +[NDOUtilities dateWithEpochNumber:v24];
    [(NDOWarranty *)v6 setAcOfferFollowupDisplayDate:v25];

    v26 = [v4 objectForKeyedSubscript:@"acOfferDisplayDate"];
    v27 = +[NDOUtilities dateWithEpochNumber:v26];
    [(NDOWarranty *)v6 setAcOfferDisplayDate:v27];

    uint64_t v28 = [v4 objectForKeyedSubscript:@"acOfferIdentifier"];
    v29 = (void *)v28;
    if (v28) {
      v30 = (__CFString *)v28;
    }
    else {
      v30 = &stru_26EF9F650;
    }
    [(NDOWarranty *)v6 setAcOfferIdentifier:v30];

    v31 = [v4 objectForKeyedSubscript:@"acLocalizedOfferLabel"];
    [(NDOWarranty *)v6 setAcLocalizedOfferLabel:v31];

    v32 = [v4 objectForKeyedSubscript:@"acLocalizedOfferLongLabel"];
    [(NDOWarranty *)v6 setAcLocalizedOfferLongLabel:v32];

    v33 = [v4 objectForKeyedSubscript:@"acLocalizedGroupedOfferFooterLabel"];
    [(NDOWarranty *)v6 setAcLocalizedGroupedOfferFooterLabel:v33];

    v34 = [v4 objectForKeyedSubscript:@"acLocalizedOfferStatusLabel"];
    [(NDOWarranty *)v6 setAcLocalizedOfferStatusLabel:v34];

    v35 = [v4 objectForKeyedSubscript:@"acLocalizedOfferPluralDescFormat"];
    [(NDOWarranty *)v6 setAcLocalizedOfferPluralDescFormat:v35];

    v36 = [v4 objectForKeyedSubscript:@"acLocalizedOfferSingularDesc"];
    [(NDOWarranty *)v6 setAcLocalizedOfferSingularDesc:v36];

    v37 = [v4 objectForKeyedSubscript:@"acNotificationLocalizedOfferLabel"];
    [(NDOWarranty *)v6 setAcNotificationLocalizedOfferLabel:v37];

    v38 = [v4 objectForKeyedSubscript:@"acNotificationLocalizedOfferPluralDescFormat"];
    [(NDOWarranty *)v6 setAcNotificationLocalizedOfferPluralDescFormat:v38];

    v39 = [v4 objectForKeyedSubscript:@"acNotificationLocalizedOfferSingularDesc"];
    [(NDOWarranty *)v6 setAcNotificationLocalizedOfferSingularDesc:v39];

    v40 = [v4 objectForKeyedSubscript:@"acLocalizedOfferCTA"];
    [(NDOWarranty *)v6 setAcLocalizedOfferCTA:v40];

    v41 = [v4 objectForKeyedSubscript:@"acLocalizedGroupedOfferCTA"];
    [(NDOWarranty *)v6 setAcLocalizedGroupedOfferCTA:v41];

    v42 = [v4 objectForKeyedSubscript:@"acLocalizedOfferDetails"];
    [(NDOWarranty *)v6 setAcLocalizedOfferDetails:v42];

    v43 = [v4 objectForKeyedSubscript:@"acLocalizedOfferDetailsPluralEligibilityFormat"];
    [(NDOWarranty *)v6 setAcLocalizedOfferDetailsPluralEligibilityFormat:v43];

    v44 = [v4 objectForKeyedSubscript:@"acLocalizedOfferDetailsSingularEligibility"];
    [(NDOWarranty *)v6 setAcLocalizedOfferDetailsSingularEligibility:v44];

    v45 = [v4 objectForKeyedSubscript:@"acLocalizedUnlinkedPlanLabel"];
    [(NDOWarranty *)v6 setAcLocalizedUnlinkedPlanLabel:v45];

    v46 = [v4 objectForKeyedSubscript:@"acLocalizedUnlinkedPlanStatusLabel"];
    [(NDOWarranty *)v6 setAcLocalizedUnlinkedPlanStatusLabel:v46];

    v47 = [v4 objectForKeyedSubscript:@"featureToggleParameters"];
    v48 = [v47 objectForKeyedSubscript:@"acOfferDisplay"];
    -[NDOWarranty setAcOfferDisplay:](v6, "setAcOfferDisplay:", [v48 BOOLValue]);

    v49 = [v47 objectForKeyedSubscript:@"acOfferSettingsAppBadge"];
    -[NDOWarranty setAcOfferSettingsAppBadge:](v6, "setAcOfferSettingsAppBadge:", [v49 BOOLValue]);

    v50 = [v47 objectForKeyedSubscript:@"acOfferSettingsRowBadge"];
    -[NDOWarranty setAcOfferSettingsRowBadge:](v6, "setAcOfferSettingsRowBadge:", [v50 BOOLValue]);

    v51 = [v4 objectForKeyedSubscript:@"acOfferPromoFormat"];
    [(NDOWarranty *)v6 setAcOfferPromoFormat:v51];

    v52 = [v4 objectForKeyedSubscript:@"acOfferPromoNew"];
    [(NDOWarranty *)v6 setAcOfferPromoNew:v52];

    v53 = [v47 objectForKeyedSubscript:@"acOfferDurationDaysBeforeEndDate"];
    [v53 doubleValue];
    [(NDOWarranty *)v6 setAcOfferDurationBeforeEndDate:v54 * 86400.0];

    v55 = [v47 objectForKeyedSubscript:@"acOfferToggle"];
    [(NDOWarranty *)v6 setAcOfferToggle:v55];

    v56 = [v4 objectForKeyedSubscript:@"acOfferBadgeBeforeEndDate"];
    [v56 doubleValue];
    [(NDOWarranty *)v6 setAcOfferBadgeDurationBeforeEndDate:v57 * 86400.0];

    v58 = [v4 objectForKeyedSubscript:@"acLogoToggle"];
    -[NDOWarranty setCoverageHasACLogo:](v6, "setCoverageHasACLogo:", [v58 BOOLValue]);

    v59 = [v4 objectForKeyedSubscript:@"acServicesPartner"];
    [(NDOWarranty *)v6 setLocalizedCoverageSubTitleForServicesPartnerString:v59];

    v60 = [v4 objectForKeyedSubscript:@"localizedSupportAppLabel"];
    [(NDOWarranty *)v6 setLocalizedSupportAppLabel:v60];

    v61 = [v4 objectForKeyedSubscript:@"localizedSupportAppFooter"];
    [(NDOWarranty *)v6 setLocalizedSupportAppFooter:v61];

    v62 = [v4 objectForKeyedSubscript:@"localizedManagePlanLabel"];
    [(NDOWarranty *)v6 setLocalizedManagePlanLabel:v62];

    v63 = [v4 objectForKeyedSubscript:@"isAcSubscription"];
    -[NDOWarranty setIsCoveragePlanSubscriptionType:](v6, "setIsCoveragePlanSubscriptionType:", [v63 BOOLValue]);

    v64 = [v4 objectForKeyedSubscript:@"isAcServicesPartner"];
    -[NDOWarranty setIsACServicesPartner:](v6, "setIsACServicesPartner:", [v64 BOOLValue]);

    v65 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v66 = [v65 objectForKey:@"ConversionDate"];
    v67 = +[NDOUtilities dateWithEpochNumber:v66];

    if (v67)
    {
      [(NDOWarranty *)v6 setAcOfferConversionDate:v67];
LABEL_16:
      v77 = [v4 objectForKeyedSubscript:@"scIntervalInDays"];
      [(NDOWarranty *)v6 setScIntervalInDays:v77];

      v78 = [v4 objectForKeyedSubscript:@"eligibilityEventId"];
      [(NDOWarranty *)v6 setEligibilityEventId:v78];

      v79 = [v4 objectForKeyedSubscript:@"scIntervalFollowupEligible"];
      -[NDOWarranty setScIntervalFollowupEligible:](v6, "setScIntervalFollowupEligible:", [v79 BOOLValue]);

      v80 = [v4 objectForKeyedSubscript:@"scIntervalPairedDeviceAllowed"];
      -[NDOWarranty setScIntervalPairedDeviceAllowed:](v6, "setScIntervalPairedDeviceAllowed:", [v80 BOOLValue]);

      v81 = [v4 objectForKeyedSubscript:@"coverage"];
      [(NDOWarranty *)v6 setCoverageDetailsDictionary:v81];

      v82 = [(NDOWarranty *)v6 coverageDetailsDictionary];
      v83 = [v82 objectForKeyedSubscript:@"localizedCoverageTitle"];
      [(NDOWarranty *)v6 setLocalizedCoverageDetailsTitle:v83];

      v84 = [(NDOWarranty *)v6 coverageDetailsDictionary];
      v85 = [v84 objectForKeyedSubscript:@"coverageDetails"];
      [(NDOWarranty *)v6 setCoverageDetailsArray:v85];

      v86 = [(NDOWarranty *)v6 coverageDetailsDictionary];
      v87 = [v86 objectForKeyedSubscript:@"localizedCoverageFooterFormatString"];
      [(NDOWarranty *)v6 setLocalizedCoverageFooterFormatString:v87];

      v88 = [(NDOWarranty *)v6 coverageDetailsDictionary];
      v89 = [v88 objectForKeyedSubscript:@"localizedCoverageFooterLinkLabel"];
      [(NDOWarranty *)v6 setLocalizedCoverageFooterLinkLabel:v89];

      v90 = [(NDOWarranty *)v6 coverageDetailsDictionary];
      v91 = [v90 objectForKeyedSubscript:@"benefitsCard"];
      [(NDOWarranty *)v6 setCoverageBenefitsDictionary:v91];

      v92 = [(NDOWarranty *)v6 coverageBenefitsDictionary];
      v93 = [v92 objectForKeyedSubscript:@"localizedBenefitsCardTitle"];
      [(NDOWarranty *)v6 setLocalizedBenefitsCardTitle:v93];

      v94 = [(NDOWarranty *)v6 coverageBenefitsDictionary];
      v95 = [v94 objectForKeyedSubscript:@"localizedBenefitsCardSubTitle"];
      [(NDOWarranty *)v6 setLocalizedBenefitsCardSubTitle:v95];

      v96 = [(NDOWarranty *)v6 coverageBenefitsDictionary];
      v97 = [v96 objectForKeyedSubscript:@"benefitDetails"];
      [(NDOWarranty *)v6 setBenefitDetailsArray:v97];

      v98 = [(NDOWarranty *)v6 coverageBenefitsDictionary];
      v99 = [v98 objectForKeyedSubscript:@"localizedBenefitsCardFooter"];
      [(NDOWarranty *)v6 setLocalizedBenefitsCardFooter:v99];

      v100 = [v4 objectForKeyedSubscript:@"displayRepairAndSupport"];
      -[NDOWarranty setDisplayRepairAndSupport:](v6, "setDisplayRepairAndSupport:", [v100 BOOLValue]);

      v101 = [v4 objectForKeyedSubscript:@"agsURL"];
      [(NDOWarranty *)v6 setAgsURL:v101];

      v102 = [v4 objectForKeyedSubscript:@"agsULURL"];
      [(NDOWarranty *)v6 setAgsULURL:v102];

      v103 = [v4 objectForKeyedSubscript:@"supportAppURL"];
      [(NDOWarranty *)v6 setSupportAppURL:v103];

      v104 = [v4 objectForKeyedSubscript:@"cacheTtlMinutes"];
      [v104 doubleValue];
      [(NDOWarranty *)v6 setCacheValidityDuration:v105 * 60.0];

      v106 = [v4 objectForKeyedSubscript:@"showNotificationToggle"];
      -[NDOWarranty setShowNotificationToggle:](v6, "setShowNotificationToggle:", [v106 BOOLValue]);

      v107 = [v4 objectForKeyedSubscript:@"showNotificationBeforeEndDate"];
      [v107 doubleValue];
      [(NDOWarranty *)v6 setShowNotificationBeforeEndDate:v108 * 86400.0];

      v109 = [v4 objectForKeyedSubscript:@"deviceInfo"];
      v110 = [v109 objectForKeyedSubscript:@"deviceImageUrl"];
      [(NDOWarranty *)v6 setDeviceImageUrl:v110];

      v111 = [v109 objectForKeyedSubscript:@"deviceDesc"];
      [(NDOWarranty *)v6 setDeviceDesc:v111];

      v112 = [v109 objectForKeyedSubscript:@"sgId"];
      [(NDOWarranty *)v6 setSgId:v112];

      v113 = [v109 objectForKeyedSubscript:@"pfcId"];
      [(NDOWarranty *)v6 setPfcId:v113];

      v114 = [v109 objectForKeyedSubscript:@"pgfId"];
      [(NDOWarranty *)v6 setPgfId:v114];

      v115 = [v109 objectForKeyedSubscript:@"parentId"];
      [(NDOWarranty *)v6 setParentId:v115];

      v116 = [v4 objectForKeyedSubscript:@"getSupportURL"];
      [(NDOWarranty *)v6 setGetSupportURL:v116];

      v117 = [v4 objectForKeyedSubscript:@"mySupportURL"];
      [(NDOWarranty *)v6 setMySupportURL:v117];

      v118 = [v4 objectForKeyedSubscript:@"isAPSSupported"];
      -[NDOWarranty setIsAPSSupported:](v6, "setIsAPSSupported:", [v118 BOOLValue]);

      goto LABEL_17;
    }
    v68 = [v4 objectForKeyedSubscript:@"acOfferConversionDate"];
    v69 = v68;
    if (v68)
    {
      [v68 doubleValue];
      if (v70 == 0.0)
      {
        [(NDOWarranty *)v6 setAcOfferConversionDate:0];
        goto LABEL_15;
      }
      v71 = +[NDOUtilities dateWithEpochNumber:v69];
      [(NDOWarranty *)v6 setAcOfferConversionDate:v71];
    }
    else
    {
      v72 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v73 = [v72 objectForKey:@"OneDayInterval"];
      [v73 doubleValue];
      double v75 = v74;

      v71 = [(NDOWarranty *)v6 coverageEndDate];
      v76 = [v71 dateByAddingTimeInterval:v75];
      [(NDOWarranty *)v6 setAcOfferConversionDate:v76];
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_18:

  return v6;
}

- (void)cacheWarranty:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = NSString;
    v6 = [(id)objc_opt_class() _warrantyPathForSerialNumberFormat];
    int v7 = [v4 sha256Hash];
    v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }
  else
  {
    v8 = [(id)objc_opt_class() _legacyWarrantyPath];
  }
  __int16 v9 = _NDOLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[NDOWarranty cacheWarranty:]";
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_23C013000, v9, OS_LOG_TYPE_DEFAULT, "%s -> %@", buf, 0x16u);
  }

  BOOL v10 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v11 = [v8 stringByDeletingLastPathComponent];
  [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];

  double v12 = [(NDOWarranty *)self dictionaryRepresentation];
  [v12 writeToFile:v8 atomically:1];
}

- (void)cache
{
}

- (NSString)description
{
  v2 = NSString;
  id v3 = [(NDOWarranty *)self dictionaryRepresentation];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

- (NSString)acLocalizedOfferDesc
{
  uint64_t v3 = [(NDOWarranty *)self daysEligible];
  if (v3 > 1)
  {
    uint64_t v5 = v3;
    v6 = [(NDOWarranty *)self acLocalizedOfferPluralDescFormat];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = NSString;
      __int16 v9 = [(NDOWarranty *)self acLocalizedOfferPluralDescFormat];
      BOOL v10 = (void *)MEMORY[0x263F08A30];
      uint64_t v11 = [NSNumber numberWithUnsignedInt:v5];
      double v12 = [v10 localizedStringFromNumber:v11 numberStyle:1];
      id v4 = objc_msgSend(v8, "stringWithFormat:", v9, v12);
    }
    else
    {
      double v13 = _NDOLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(NDOWarranty *)v13 acLocalizedOfferDesc];
      }

      id v4 = 0;
    }
  }
  else
  {
    id v4 = [(NDOWarranty *)self acLocalizedOfferSingularDesc];
  }
  return (NSString *)v4;
}

- (NSString)acLocalizedNotificationOfferDesc
{
  uint64_t v3 = [(NDOWarranty *)self daysEligible];
  if (v3 > 1)
  {
    uint64_t v5 = v3;
    v6 = [(NDOWarranty *)self acNotificationLocalizedOfferPluralDescFormat];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = NSString;
      __int16 v9 = [(NDOWarranty *)self acNotificationLocalizedOfferPluralDescFormat];
      BOOL v10 = (void *)MEMORY[0x263F08A30];
      uint64_t v11 = [NSNumber numberWithUnsignedInt:v5];
      double v12 = [v10 localizedStringFromNumber:v11 numberStyle:1];
      id v4 = objc_msgSend(v8, "stringWithFormat:", v9, v12);
    }
    else
    {
      double v13 = _NDOLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(NDOWarranty *)v13 acLocalizedNotificationOfferDesc];
      }

      id v4 = 0;
    }
  }
  else
  {
    id v4 = [(NDOWarranty *)self acNotificationLocalizedOfferSingularDesc];
  }
  return (NSString *)v4;
}

- (NSString)acLocalizedOfferDetailsEligibility
{
  uint64_t v3 = [(NDOWarranty *)self daysEligible];
  if (v3 > 1)
  {
    uint64_t v5 = v3;
    v6 = [(NDOWarranty *)self acLocalizedOfferDetailsPluralEligibilityFormat];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = NSString;
      __int16 v9 = [(NDOWarranty *)self acLocalizedOfferDetailsPluralEligibilityFormat];
      BOOL v10 = (void *)MEMORY[0x263F08A30];
      uint64_t v11 = [NSNumber numberWithUnsignedInt:v5];
      double v12 = [v10 localizedStringFromNumber:v11 numberStyle:1];
      id v4 = objc_msgSend(v8, "stringWithFormat:", v9, v12);
    }
    else
    {
      double v13 = _NDOLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(NDOWarranty *)v13 acLocalizedOfferDetailsEligibility];
      }

      id v4 = 0;
    }
  }
  else
  {
    id v4 = [(NDOWarranty *)self acLocalizedOfferDetailsSingularEligibility];
  }
  return (NSString *)v4;
}

- (unsigned)daysEligible
{
  v2 = [(NDOWarranty *)self acOfferEligibleUntil];
  unsigned int v3 = +[NDOUtilities daysFromDate:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NDOWarranty *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"DictionaryRepresentation"];
}

- (NDOWarranty)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  BOOL v10 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  uint64_t v11 = [v5 decodeObjectOfClasses:v10 forKey:@"DictionaryRepresentation"];

  double v12 = [(NDOWarranty *)self initWithDictionary:v11];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 dictionaryRepresentation];

    uint64_t v6 = [(NDOWarranty *)self dictionaryRepresentation];
    unsigned __int8 v7 = [v5 isEqualToDictionary:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NDOWarranty;
    unsigned __int8 v7 = [(NDOWarranty *)&v9 isEqual:v4];
  }
  return v7;
}

- (BOOL)covered
{
  return self->_covered;
}

- (void)setCovered:(BOOL)a3
{
  self->_covered = a3;
}

- (NSDate)coverageEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoverageEndDate:(id)a3
{
}

- (NSString)localizedCoveredDeviceDateLabelFormat
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalizedCoveredDeviceDateLabelFormat:(id)a3
{
}

- (NSString)coverageLocalizedLabel
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCoverageLocalizedLabel:(id)a3
{
}

- (NSString)coverageLocalizedDesc
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoverageLocalizedDesc:(id)a3
{
}

- (NSString)coverageLocalizedDescLong
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCoverageLocalizedDescLong:(id)a3
{
}

- (NSString)coverageLocalizedExpirationLabel
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCoverageLocalizedExpirationLabel:(id)a3
{
}

- (NSString)footer1FormatString
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFooter1FormatString:(id)a3
{
}

- (NSString)footer1LinkLabel
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFooter1LinkLabel:(id)a3
{
}

- (NSString)footer1LinkURL
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFooter1LinkURL:(id)a3
{
}

- (NSString)footer2FormatString
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFooter2FormatString:(id)a3
{
}

- (NSString)footer2LinkLabel
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFooter2LinkLabel:(id)a3
{
}

- (NSString)footer2LinkURL
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFooter2LinkURL:(id)a3
{
}

- (BOOL)acOfferEligible
{
  return self->_acOfferEligible;
}

- (void)setAcOfferEligible:(BOOL)a3
{
  self->_acOfferEligible = a3;
}

- (NSDate)acOfferEligibleUntil
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAcOfferEligibleUntil:(id)a3
{
}

- (NSDate)acOfferFollowupDisplayDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAcOfferFollowupDisplayDate:(id)a3
{
}

- (NSDate)acOfferDisplayDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAcOfferDisplayDate:(id)a3
{
}

- (NSString)acOfferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAcOfferIdentifier:(id)a3
{
}

- (NSString)acLocalizedOfferLabel
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAcLocalizedOfferLabel:(id)a3
{
}

- (NSString)acLocalizedOfferLongLabel
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAcLocalizedOfferLongLabel:(id)a3
{
}

- (NSString)acLocalizedGroupedOfferFooterLabel
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAcLocalizedGroupedOfferFooterLabel:(id)a3
{
}

- (NSString)acLocalizedOfferStatusLabel
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAcLocalizedOfferStatusLabel:(id)a3
{
}

- (NSString)acLocalizedOfferPluralDescFormat
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAcLocalizedOfferPluralDescFormat:(id)a3
{
}

- (NSString)acLocalizedOfferSingularDesc
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAcLocalizedOfferSingularDesc:(id)a3
{
}

- (NSString)acNotificationLocalizedOfferLabel
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAcNotificationLocalizedOfferLabel:(id)a3
{
}

- (NSString)acNotificationLocalizedOfferSingularDesc
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAcNotificationLocalizedOfferSingularDesc:(id)a3
{
}

- (NSString)acNotificationLocalizedOfferPluralDescFormat
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAcNotificationLocalizedOfferPluralDescFormat:(id)a3
{
}

- (NSString)acLocalizedOfferCTA
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAcLocalizedOfferCTA:(id)a3
{
}

- (NSString)acLocalizedGroupedOfferCTA
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setAcLocalizedGroupedOfferCTA:(id)a3
{
}

- (NSString)acLocalizedOfferDetails
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAcLocalizedOfferDetails:(id)a3
{
}

- (NSString)acLocalizedOfferDetailsPluralEligibilityFormat
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setAcLocalizedOfferDetailsPluralEligibilityFormat:(id)a3
{
}

- (NSString)acLocalizedOfferDetailsSingularEligibility
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setAcLocalizedOfferDetailsSingularEligibility:(id)a3
{
}

- (NSString)acLocalizedUnlinkedPlanLabel
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAcLocalizedUnlinkedPlanLabel:(id)a3
{
}

- (NSString)acLocalizedUnlinkedPlanStatusLabel
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setAcLocalizedUnlinkedPlanStatusLabel:(id)a3
{
}

- (BOOL)acOfferDisplay
{
  return self->_acOfferDisplay;
}

- (void)setAcOfferDisplay:(BOOL)a3
{
  self->_acOfferDisplay = a3;
}

- (BOOL)acOfferSettingsAppBadge
{
  return self->_acOfferSettingsAppBadge;
}

- (void)setAcOfferSettingsAppBadge:(BOOL)a3
{
  self->_acOfferSettingsAppBadge = a3;
}

- (BOOL)acOfferSettingsRowBadge
{
  return self->_acOfferSettingsRowBadge;
}

- (void)setAcOfferSettingsRowBadge:(BOOL)a3
{
  self->_acOfferSettingsRowBadge = a3;
}

- (double)acOfferDurationBeforeEndDate
{
  return self->_acOfferDurationBeforeEndDate;
}

- (void)setAcOfferDurationBeforeEndDate:(double)a3
{
  self->_acOfferDurationBeforeEndDate = a3;
}

- (NSArray)acOfferToggle
{
  return (NSArray *)objc_getProperty(self, a2, 288, 1);
}

- (void)setAcOfferToggle:(id)a3
{
}

- (NSString)acOfferPromoFormat
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setAcOfferPromoFormat:(id)a3
{
}

- (NSString)acOfferPromoNew
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setAcOfferPromoNew:(id)a3
{
}

- (double)acOfferBadgeDurationBeforeEndDate
{
  return self->_acOfferBadgeDurationBeforeEndDate;
}

- (void)setAcOfferBadgeDurationBeforeEndDate:(double)a3
{
  self->_acOfferBadgeDurationBeforeEndDate = a3;
}

- (BOOL)coverageHasACLogo
{
  return self->_coverageHasACLogo;
}

- (void)setCoverageHasACLogo:(BOOL)a3
{
  self->_coverageHasACLogo = a3;
}

- (NSString)localizedCoverageSubTitleForServicesPartnerString
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setLocalizedCoverageSubTitleForServicesPartnerString:(id)a3
{
}

- (NSString)localizedCoverageFooterFormatString
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setLocalizedCoverageFooterFormatString:(id)a3
{
}

- (NSString)localizedCoverageFooterLinkLabel
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setLocalizedCoverageFooterLinkLabel:(id)a3
{
}

- (NSString)localizedSupportAppLabel
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setLocalizedSupportAppLabel:(id)a3
{
}

- (NSString)localizedSupportAppFooter
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setLocalizedSupportAppFooter:(id)a3
{
}

- (BOOL)isCoveragePlanSubscriptionType
{
  return self->_isCoveragePlanSubscriptionType;
}

- (void)setIsCoveragePlanSubscriptionType:(BOOL)a3
{
  self->_isCoveragePlanSubscriptionType = a3;
}

- (NSString)localizedManagePlanLabel
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)setLocalizedManagePlanLabel:(id)a3
{
}

- (BOOL)isACServicesPartner
{
  return self->_isACServicesPartner;
}

- (void)setIsACServicesPartner:(BOOL)a3
{
  self->_isACServicesPartner = a3;
}

- (NSDate)acOfferConversionDate
{
  return (NSDate *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAcOfferConversionDate:(id)a3
{
}

- (NSDictionary)coverageDetailsDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCoverageDetailsDictionary:(id)a3
{
}

- (NSString)localizedCoverageDetailsTitle
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setLocalizedCoverageDetailsTitle:(id)a3
{
}

- (NSArray)coverageDetailsArray
{
  return (NSArray *)objc_getProperty(self, a2, 392, 1);
}

- (void)setCoverageDetailsArray:(id)a3
{
}

- (NSString)localizedCoverageDetailsLabel
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setLocalizedCoverageDetailsLabel:(id)a3
{
}

- (NSString)localizedCoverageDetailsValue
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setLocalizedCoverageDetailsValue:(id)a3
{
}

- (NSDictionary)coverageBenefitsDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 416, 1);
}

- (void)setCoverageBenefitsDictionary:(id)a3
{
}

- (NSString)localizedBenefitsCardTitle
{
  return (NSString *)objc_getProperty(self, a2, 424, 1);
}

- (void)setLocalizedBenefitsCardTitle:(id)a3
{
}

- (NSString)localizedBenefitsCardSubTitle
{
  return (NSString *)objc_getProperty(self, a2, 432, 1);
}

- (void)setLocalizedBenefitsCardSubTitle:(id)a3
{
}

- (NSArray)benefitDetailsArray
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setBenefitDetailsArray:(id)a3
{
}

- (NSString)localizedBenefitsCardFooter
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setLocalizedBenefitsCardFooter:(id)a3
{
}

- (BOOL)displayRepairAndSupport
{
  return self->_displayRepairAndSupport;
}

- (void)setDisplayRepairAndSupport:(BOOL)a3
{
  self->_displayRepairAndSupport = a3;
}

- (NSString)agsURL
{
  return (NSString *)objc_getProperty(self, a2, 456, 1);
}

- (void)setAgsURL:(id)a3
{
}

- (NSString)agsULURL
{
  return (NSString *)objc_getProperty(self, a2, 464, 1);
}

- (void)setAgsULURL:(id)a3
{
}

- (NSString)deviceImageUrl
{
  return (NSString *)objc_getProperty(self, a2, 472, 1);
}

- (void)setDeviceImageUrl:(id)a3
{
}

- (NSString)deviceDesc
{
  return (NSString *)objc_getProperty(self, a2, 480, 1);
}

- (void)setDeviceDesc:(id)a3
{
}

- (NSString)sgId
{
  return (NSString *)objc_getProperty(self, a2, 488, 1);
}

- (void)setSgId:(id)a3
{
}

- (NSString)pfcId
{
  return (NSString *)objc_getProperty(self, a2, 496, 1);
}

- (void)setPfcId:(id)a3
{
}

- (NSString)pgfId
{
  return (NSString *)objc_getProperty(self, a2, 504, 1);
}

- (void)setPgfId:(id)a3
{
}

- (NSString)parentId
{
  return (NSString *)objc_getProperty(self, a2, 512, 1);
}

- (void)setParentId:(id)a3
{
}

- (NSString)supportAppURL
{
  return (NSString *)objc_getProperty(self, a2, 520, 1);
}

- (void)setSupportAppURL:(id)a3
{
}

- (double)cacheValidityDuration
{
  return self->_cacheValidityDuration;
}

- (void)setCacheValidityDuration:(double)a3
{
  self->_cacheValidityDuration = a3;
}

- (BOOL)showNotificationToggle
{
  return self->_showNotificationToggle;
}

- (void)setShowNotificationToggle:(BOOL)a3
{
  self->_showNotificationToggle = a3;
}

- (double)showNotificationBeforeEndDate
{
  return self->_showNotificationBeforeEndDate;
}

- (void)setShowNotificationBeforeEndDate:(double)a3
{
  self->_showNotificationBeforeEndDate = a3;
}

- (NSString)getSupportURL
{
  return (NSString *)objc_getProperty(self, a2, 544, 1);
}

- (void)setGetSupportURL:(id)a3
{
}

- (NSString)mySupportURL
{
  return (NSString *)objc_getProperty(self, a2, 552, 1);
}

- (void)setMySupportURL:(id)a3
{
}

- (BOOL)isAPSSupported
{
  return self->_isAPSSupported;
}

- (void)setIsAPSSupported:(BOOL)a3
{
  self->_isAPSSupported = a3;
}

- (NSNumber)scIntervalInDays
{
  return (NSNumber *)objc_getProperty(self, a2, 560, 1);
}

- (void)setScIntervalInDays:(id)a3
{
}

- (NSString)eligibilityEventId
{
  return (NSString *)objc_getProperty(self, a2, 568, 1);
}

- (void)setEligibilityEventId:(id)a3
{
}

- (BOOL)scIntervalFollowupEligible
{
  return self->_scIntervalFollowupEligible;
}

- (void)setScIntervalFollowupEligible:(BOOL)a3
{
  self->_scIntervalFollowupEligible = a3;
}

- (BOOL)scIntervalPairedDeviceAllowed
{
  return self->_scIntervalPairedDeviceAllowed;
}

- (void)setScIntervalPairedDeviceAllowed:(BOOL)a3
{
  self->_scIntervalPairedDeviceAllowed = a3;
}

- (NSDate)coverageValidityDate
{
  return (NSDate *)objc_getProperty(self, a2, 576, 1);
}

- (void)setCoverageValidityDate:(id)a3
{
}

- (NSString)localizedBenefitLabelKey
{
  return (NSString *)objc_getProperty(self, a2, 584, 1);
}

- (void)setLocalizedBenefitLabelKey:(id)a3
{
}

- (NSString)localizedBenefitValueKey
{
  return (NSString *)objc_getProperty(self, a2, 592, 1);
}

- (void)setLocalizedBenefitValueKey:(id)a3
{
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 600, 1);
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_localizedBenefitValueKey, 0);
  objc_storeStrong((id *)&self->_localizedBenefitLabelKey, 0);
  objc_storeStrong((id *)&self->_coverageValidityDate, 0);
  objc_storeStrong((id *)&self->_eligibilityEventId, 0);
  objc_storeStrong((id *)&self->_scIntervalInDays, 0);
  objc_storeStrong((id *)&self->_mySupportURL, 0);
  objc_storeStrong((id *)&self->_getSupportURL, 0);
  objc_storeStrong((id *)&self->_supportAppURL, 0);
  objc_storeStrong((id *)&self->_parentId, 0);
  objc_storeStrong((id *)&self->_pgfId, 0);
  objc_storeStrong((id *)&self->_pfcId, 0);
  objc_storeStrong((id *)&self->_sgId, 0);
  objc_storeStrong((id *)&self->_deviceDesc, 0);
  objc_storeStrong((id *)&self->_deviceImageUrl, 0);
  objc_storeStrong((id *)&self->_agsULURL, 0);
  objc_storeStrong((id *)&self->_agsURL, 0);
  objc_storeStrong((id *)&self->_localizedBenefitsCardFooter, 0);
  objc_storeStrong((id *)&self->_benefitDetailsArray, 0);
  objc_storeStrong((id *)&self->_localizedBenefitsCardSubTitle, 0);
  objc_storeStrong((id *)&self->_localizedBenefitsCardTitle, 0);
  objc_storeStrong((id *)&self->_coverageBenefitsDictionary, 0);
  objc_storeStrong((id *)&self->_localizedCoverageDetailsValue, 0);
  objc_storeStrong((id *)&self->_localizedCoverageDetailsLabel, 0);
  objc_storeStrong((id *)&self->_coverageDetailsArray, 0);
  objc_storeStrong((id *)&self->_localizedCoverageDetailsTitle, 0);
  objc_storeStrong((id *)&self->_coverageDetailsDictionary, 0);
  objc_storeStrong((id *)&self->_acOfferConversionDate, 0);
  objc_storeStrong((id *)&self->_localizedManagePlanLabel, 0);
  objc_storeStrong((id *)&self->_localizedSupportAppFooter, 0);
  objc_storeStrong((id *)&self->_localizedSupportAppLabel, 0);
  objc_storeStrong((id *)&self->_localizedCoverageFooterLinkLabel, 0);
  objc_storeStrong((id *)&self->_localizedCoverageFooterFormatString, 0);
  objc_storeStrong((id *)&self->_localizedCoverageSubTitleForServicesPartnerString, 0);
  objc_storeStrong((id *)&self->_acOfferPromoNew, 0);
  objc_storeStrong((id *)&self->_acOfferPromoFormat, 0);
  objc_storeStrong((id *)&self->_acOfferToggle, 0);
  objc_storeStrong((id *)&self->_acLocalizedUnlinkedPlanStatusLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedUnlinkedPlanLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferDetailsSingularEligibility, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferDetailsPluralEligibilityFormat, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferDetails, 0);
  objc_storeStrong((id *)&self->_acLocalizedGroupedOfferCTA, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferCTA, 0);
  objc_storeStrong((id *)&self->_acNotificationLocalizedOfferPluralDescFormat, 0);
  objc_storeStrong((id *)&self->_acNotificationLocalizedOfferSingularDesc, 0);
  objc_storeStrong((id *)&self->_acNotificationLocalizedOfferLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferSingularDesc, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferPluralDescFormat, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferStatusLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedGroupedOfferFooterLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferLongLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferLabel, 0);
  objc_storeStrong((id *)&self->_acOfferIdentifier, 0);
  objc_storeStrong((id *)&self->_acOfferDisplayDate, 0);
  objc_storeStrong((id *)&self->_acOfferFollowupDisplayDate, 0);
  objc_storeStrong((id *)&self->_acOfferEligibleUntil, 0);
  objc_storeStrong((id *)&self->_footer2LinkURL, 0);
  objc_storeStrong((id *)&self->_footer2LinkLabel, 0);
  objc_storeStrong((id *)&self->_footer2FormatString, 0);
  objc_storeStrong((id *)&self->_footer1LinkURL, 0);
  objc_storeStrong((id *)&self->_footer1LinkLabel, 0);
  objc_storeStrong((id *)&self->_footer1FormatString, 0);
  objc_storeStrong((id *)&self->_coverageLocalizedExpirationLabel, 0);
  objc_storeStrong((id *)&self->_coverageLocalizedDescLong, 0);
  objc_storeStrong((id *)&self->_coverageLocalizedDesc, 0);
  objc_storeStrong((id *)&self->_coverageLocalizedLabel, 0);
  objc_storeStrong((id *)&self->_localizedCoveredDeviceDateLabelFormat, 0);
  objc_storeStrong((id *)&self->_coverageEndDate, 0);
}

- (void)acLocalizedOfferDesc
{
}

- (void)acLocalizedNotificationOfferDesc
{
}

- (void)acLocalizedOfferDetailsEligibility
{
}

@end