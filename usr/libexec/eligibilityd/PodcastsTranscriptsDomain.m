@interface PodcastsTranscriptsDomain
+ (BOOL)supportsSecureCoding;
- (PodcastsTranscriptsDomain)init;
- (PodcastsTranscriptsDomain)initWithCoder:(id)a3;
- (id)domainChangeNotificationName;
- (id)status;
- (unint64_t)domain;
@end

@implementation PodcastsTranscriptsDomain

- (id)status
{
  v2 = objc_opt_new();
  v3 = +[InputManager sharedInstance];
  v4 = +[MobileAssetManager sharedInstance];
  v5 = [v4 podcastsTranscriptsAsset];
  v6 = [v5 billingCountryCodes];
  v7 = [v5 regionSKUs];
  v29 = [v5 countryCodes];
  v8 = [v3 objectForInputValue:2];
  v9 = v8;
  if (v8
    && ([v8 countryCode], v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    v11 = [v9 countryCode];
    unsigned int v12 = [v6 containsObject:v11];

    if (v12) {
      v13 = &off_10003C540;
    }
    else {
      v13 = &off_10003C558;
    }
    [v2 setObject:v13 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"];
  }
  else
  {
    v14 = [v3 objectForInputValue:6, v7];
    v15 = v14;
    if (!v14) {
      goto LABEL_11;
    }
    uint64_t v16 = [v14 deviceRegionCode];
    if (!v16) {
      goto LABEL_11;
    }
    v17 = (void *)v16;
    v18 = [v15 deviceRegionCode];
    unsigned int v19 = [v28 containsObject:v18];

    if (v19)
    {
      [v2 setObject:&off_10003C540 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE"];
    }
    else
    {
LABEL_11:
      v20 = [v3 objectForInputValue:1];
      v21 = v20;
      if (v20
        && ([v20 countryCodes], v22 = objc_claimAutoreleasedReturnValue(), v22, v22))
      {
        v23 = [v21 countryCodes];
        if ([v29 intersectsSet:v23]) {
          uint64_t v24 = 2;
        }
        else {
          uint64_t v24 = 3;
        }
        v25 = +[NSNumber numberWithUnsignedLongLong:v24];
        [v2 setObject:v25 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"];
      }
      else
      {
        v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v21 status]);
        [v2 setObject:v23 forKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"];
      }
    }
    v7 = v28;
  }
  id v26 = [v2 copy];

  return v26;
}

- (PodcastsTranscriptsDomain)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PodcastsTranscriptsDomain;
  v3 = [(EligibilityDomain *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PodcastsTranscriptsDomain *)v3 _internal_doInit];
  }
  return v4;
}

- (PodcastsTranscriptsDomain)init
{
  v5.receiver = self;
  v5.super_class = (Class)PodcastsTranscriptsDomain;
  v2 = [(EligibilityDomain *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PodcastsTranscriptsDomain *)v2 _internal_doInit];
  }
  return v3;
}

- (id)domainChangeNotificationName
{
  return @"com.apple.os-eligibility-domain.change.podcasts-transcripts";
}

- (unint64_t)domain
{
  return 121;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end