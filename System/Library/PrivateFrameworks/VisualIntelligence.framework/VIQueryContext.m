@interface VIQueryContext
+ (VIQueryContext)contextWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)includeLowConfidenceRegions;
- (CLLocation)location;
- (MTLDevice)preferredMetalDevice;
- (NSArray)catalogIDs;
- (NSDictionary)customDetectorThreshold;
- (NSString)applicationIdentifier;
- (NSString)countryCode;
- (NSString)description;
- (NSString)engagementSuggestionType;
- (NSString)featureIdentifier;
- (NSString)locale;
- (NSString)teamID;
- (NSURL)imageURL;
- (NSURL)referralURL;
- (VIQueryContext)initWithQueryID:(unint64_t)a3 applicationIdentifier:(id)a4 uiScale:(double)a5 teamID:(id)a6 catalogIDs:(id)a7 frameTimestamp:(double)a8 lastSearchTimestamp:(double)a9 location:(id)a10 imageURL:(id)a11 referralURL:(id)a12 imageType:(int64_t)a13 featureIdentifier:(id)a14 engagementSuggestionType:(id)a15 locale:(id)a16 countryCode:(id)a17 preferredMetalDevice:(id)a18 includeLowConfidenceRegions:(BOOL)a19 customDetectorThreshold:(id)a20;
- (double)frameTimestamp;
- (double)lastSearchTimestamp;
- (double)uiScale;
- (int64_t)imageType;
- (unint64_t)queryID;
@end

@implementation VIQueryContext

- (VIQueryContext)initWithQueryID:(unint64_t)a3 applicationIdentifier:(id)a4 uiScale:(double)a5 teamID:(id)a6 catalogIDs:(id)a7 frameTimestamp:(double)a8 lastSearchTimestamp:(double)a9 location:(id)a10 imageURL:(id)a11 referralURL:(id)a12 imageType:(int64_t)a13 featureIdentifier:(id)a14 engagementSuggestionType:(id)a15 locale:(id)a16 countryCode:(id)a17 preferredMetalDevice:(id)a18 includeLowConfidenceRegions:(BOOL)a19 customDetectorThreshold:(id)a20
{
  id v63 = a4;
  id v61 = a6;
  id v62 = a7;
  id v64 = a10;
  id v27 = a11;
  id v28 = a12;
  id v29 = a14;
  id v30 = a15;
  id v31 = a16;
  id v32 = a17;
  v33 = v28;
  id v34 = a18;
  id v35 = a20;
  v65.receiver = self;
  v65.super_class = (Class)VIQueryContext;
  v36 = [(VIQueryContext *)&v65 init];
  v37 = v36;
  if (v36)
  {
    v36->_queryID = a3;
    uint64_t v38 = [v63 copy];
    applicationIdentifier = v37->_applicationIdentifier;
    v37->_applicationIdentifier = (NSString *)v38;

    v37->_uiScale = a5;
    uint64_t v40 = [v61 copy];
    teamID = v37->_teamID;
    v37->_teamID = (NSString *)v40;

    uint64_t v42 = [v62 copy];
    catalogIDs = v37->_catalogIDs;
    v37->_catalogIDs = (NSArray *)v42;

    v37->_frameTimestamp = a8;
    v37->_lastSearchTimestamp = a9;
    uint64_t v44 = [v64 copy];
    location = v37->_location;
    v37->_location = (CLLocation *)v44;

    uint64_t v46 = [v27 copy];
    imageURL = v37->_imageURL;
    v37->_imageURL = (NSURL *)v46;

    uint64_t v48 = [v33 copy];
    referralURL = v37->_referralURL;
    v37->_referralURL = (NSURL *)v48;

    v37->_imageType = a13;
    uint64_t v50 = [v29 copy];
    featureIdentifier = v37->_featureIdentifier;
    v37->_featureIdentifier = (NSString *)v50;

    uint64_t v52 = [v30 copy];
    engagementSuggestionType = v37->_engagementSuggestionType;
    v37->_engagementSuggestionType = (NSString *)v52;

    uint64_t v54 = [v31 copy];
    locale = v37->_locale;
    v37->_locale = (NSString *)v54;

    uint64_t v56 = [v32 copy];
    countryCode = v37->_countryCode;
    v37->_countryCode = (NSString *)v56;

    objc_storeStrong((id *)&v37->_preferredMetalDevice, a18);
    v37->_includeLowConfidenceRegions = a19;
    objc_storeStrong((id *)&v37->_customDetectorThreshold, a20);
  }

  return v37;
}

+ (VIQueryContext)contextWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.query_id"];

  if (!v6)
  {
    uint64_t v9 = 0;
LABEL_6:
    v10 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.application_id"];

    if (!v10) {
      goto LABEL_10;
    }
    v11 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.application_id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.application_id"];

      if (v12)
      {
        v10 = (void *)[v12 copy];

LABEL_10:
        v13 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.uiScale"];

        if (v13)
        {
          v14 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.uiScale"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.uiScale"];

            if (v15)
            {
              [v15 doubleValue];
              double v17 = v16;

              goto LABEL_22;
            }
          }
          else
          {
          }
          if (a4)
          {
            v51 = @"VIQueryContextUIScaleKey";
            uint64_t v52 = @"NSNumber";
LABEL_64:
            _VIQueryContextMapperError((uint64_t)v51, v52);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_178:

          goto LABEL_179;
        }
        double v17 = 0.0;
LABEL_22:
        v21 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.team_id"];

        if (!v21) {
          goto LABEL_26;
        }
        v22 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.team_id"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v23 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.team_id"];

          if (v23)
          {
            v21 = (void *)[v23 copy];

LABEL_26:
            v24 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.catalog_ids"];

            if (!v24) {
              goto LABEL_38;
            }
            v25 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.catalog_ids"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v26 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.catalog_ids"];

              if (v26)
              {
                v96 = v21;
                long long v99 = 0u;
                long long v100 = 0u;
                long long v97 = 0u;
                long long v98 = 0u;
                id v27 = v26;
                uint64_t v28 = [v27 countByEnumeratingWithState:&v97 objects:v101 count:16];
                if (v28)
                {
                  uint64_t v29 = v28;
                  uint64_t v30 = *(void *)v98;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v29; ++i)
                    {
                      if (*(void *)v98 != v30) {
                        objc_enumerationMutation(v27);
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (a4)
                        {
                          _VIQueryContextMapperError(@"VIQueryContextCatalogIDsKey", @"NSArray<NSString *>");
                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                        }

                        v21 = v96;
                        goto LABEL_177;
                      }
                    }
                    uint64_t v29 = [v27 countByEnumeratingWithState:&v97 objects:v101 count:16];
                    if (v29) {
                      continue;
                    }
                    break;
                  }
                }

                v24 = (void *)[v27 copy];
                v21 = v96;
LABEL_38:
                id v32 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.frame_timestamp"];

                double v33 = 0.0;
                double v34 = 0.0;
                if (v32)
                {
                  id v35 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.frame_timestamp"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v36 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.frame_timestamp"];

                    if (v36)
                    {
                      [v36 doubleValue];
                      double v34 = v37;

                      goto LABEL_42;
                    }
                  }
                  else
                  {
                  }
                  if (!a4) {
                    goto LABEL_176;
                  }
                  v53 = @"VIQueryContextFrameTimestampKey";
                  goto LABEL_77;
                }
LABEL_42:
                uint64_t v38 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.last_search_timestamp"];

                if (!v38) {
                  goto LABEL_46;
                }
                v39 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.last_search_timestamp"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v40 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.last_search_timestamp"];

                  if (v40)
                  {
                    [v40 doubleValue];
                    double v33 = v41;

LABEL_46:
                    uint64_t v42 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.location"];

                    if (!v42) {
                      goto LABEL_50;
                    }
                    v43 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.location"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v44 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.location"];

                      if (v44)
                      {
                        uint64_t v42 = (void *)[v44 copy];

LABEL_50:
                        v45 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.image_url"];

                        if (!v45) {
                          goto LABEL_54;
                        }
                        uint64_t v46 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.image_url"];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v47 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.image_url"];

                          if (v47)
                          {
                            v45 = (void *)[v47 copy];

LABEL_54:
                            uint64_t v48 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.referral_url"];

                            if (v48)
                            {
                              v49 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.referral_url"];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                uint64_t v50 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.referral_url"];

                                if (v50)
                                {
                                  v95 = (void *)[v50 copy];

                                  goto LABEL_86;
                                }
                              }
                              else
                              {
                              }
                              if (a4)
                              {
                                _VIQueryContextMapperError(@"VIQueryContextReferralURLKey", @"NSURL");
                                *a4 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              goto LABEL_174;
                            }
                            v95 = 0;
LABEL_86:
                            v55 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.image_type"];

                            if (v55)
                            {
                              uint64_t v56 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.image_type"];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v57 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.image_type"];

                                if (v57
                                  && ([v57 intValue] & 0x80000000) == 0
                                  && (int)[v57 intValue] < 4)
                                {
                                  uint64_t v93 = (int)[v57 intValue];

                                  goto LABEL_96;
                                }
                              }
                              else
                              {

                                v57 = 0;
                              }
                              if (a4)
                              {
                                _VIQueryContextMapperError(@"VIQueryContextImageTypeKey", @"NSNumber(VIQueryContextImageType)");
                                *a4 = (id)objc_claimAutoreleasedReturnValue();
                              }

                              goto LABEL_173;
                            }
                            uint64_t v93 = 0;
LABEL_96:
                            v58 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.feature_identifier"];

                            if (v58)
                            {
                              v59 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.feature_identifier"];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v60 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.feature_identifier"];

                                if (v60)
                                {
                                  v94 = (void *)[v60 copy];

                                  goto LABEL_105;
                                }
                              }
                              else
                              {
                              }
                              if (a4)
                              {
                                _VIQueryContextMapperError(@"VIQueryContextFeatureIdentifierKey", @"NSString");
                                *a4 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              goto LABEL_173;
                            }
                            v94 = 0;
LABEL_105:
                            id v61 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.engagement_suggestion_type"];

                            if (v61)
                            {
                              id v62 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.engagement_suggestion_type"];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v63 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.engagement_suggestion_type"];

                                if (v63)
                                {
                                  uint64_t v64 = [v63 copy];

                                  objc_super v65 = (void *)v64;
                                  goto LABEL_113;
                                }
                              }
                              else
                              {
                              }
                              if (a4)
                              {
                                _VIQueryContextMapperError(@"VIAEngagementSuggesionTypeKey", @"VISuggestionType");
                                *a4 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              goto LABEL_172;
                            }
                            objc_super v65 = 0;
LABEL_113:
                            v66 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.preferred_metal_device"];

                            v92 = v65;
                            if (v66)
                            {
                              v67 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.preferred_metal_device"];
                              if (([v67 conformsToProtocol:&unk_1F3863B60] & 1) == 0)
                              {

                                goto LABEL_126;
                              }
                              uint64_t v68 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.preferred_metal_device"];

                              v91 = (void *)v68;
                              if (!v68)
                              {
LABEL_126:
                                if (a4)
                                {
                                  _VIQueryContextMapperError(@"VIQueryContextPreferredMetalDeviceKey", @"MTLDevice");
                                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                                }
                                goto LABEL_171;
                              }
                            }
                            else
                            {
                              v91 = 0;
                            }
                            v69 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.include_low_confidence_region"];

                            if (v69)
                            {
                              v70 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.include_low_confidence_region"];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v71 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.include_low_confidence_region"];

                                if (v71)
                                {
                                  char v90 = [v71 BOOLValue];

                                  goto LABEL_129;
                                }
                              }
                              else
                              {
                              }
                              if (a4)
                              {
                                _VIQueryContextMapperError(@"_VIQueryContextIncludeLowConfidenceRegionKey", @"NSNumber");
                                *a4 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              goto LABEL_170;
                            }
                            char v90 = 0;
LABEL_129:
                            v72 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.locale"];

                            if (!v72)
                            {
                              v89 = 0;
LABEL_139:
                              v75 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.country_code"];

                              if (!v75)
                              {
                                v88 = 0;
                                goto LABEL_149;
                              }
                              v76 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.country_code"];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v77 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.country_code"];

                                if (v77)
                                {
                                  if ([v77 length] == 2)
                                  {
                                    v88 = (void *)[v77 copy];

LABEL_149:
                                    v79 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.custom_detector_thresholds"];

                                    if (!v79)
                                    {
                                      v82 = 0;
                                      goto LABEL_162;
                                    }
                                    v80 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.custom_detector_thresholds"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v81 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.custom_detector_thresholds"];

                                      if (v81)
                                      {
                                        v82 = (void *)[v81 copy];

LABEL_162:
                                        v87 = [VIQueryContext alloc];
                                        v84 = _VITeamIDToUse(v21, v24, v10);
                                        LOBYTE(v86) = v90;
                                        v20 = -[VIQueryContext initWithQueryID:applicationIdentifier:uiScale:teamID:catalogIDs:frameTimestamp:lastSearchTimestamp:location:imageURL:referralURL:imageType:featureIdentifier:engagementSuggestionType:locale:countryCode:preferredMetalDevice:includeLowConfidenceRegions:customDetectorThreshold:](v87, "initWithQueryID:applicationIdentifier:uiScale:teamID:catalogIDs:frameTimestamp:lastSearchTimestamp:location:imageURL:referralURL:imageType:featureIdentifier:engagementSuggestionType:locale:countryCode:preferredMetalDevice:includeLowConfidenceRegions:customDetectorThreshold:", v9, v10, v84, v24, v42, v45, v17, v34, v33, v95, v93, v94, v92, v89,
                                                v88,
                                                v91,
                                                v86,
                                                v82);

                                        goto LABEL_180;
                                      }
                                    }
                                    else
                                    {
                                    }
                                    if (a4)
                                    {
                                      _VIQueryContextMapperError(@"VIQueryContextCustomDetectorThresholds", @"NSDictionary");
                                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                                    }

                                    goto LABEL_169;
                                  }
                                  if (!a4)
                                  {
LABEL_164:

LABEL_169:
                                    goto LABEL_170;
                                  }
                                  v83 = _VIQueryContextMapperStringValueParseError(@"VIQueryContextCountryCodeKey");
LABEL_160:
                                  *a4 = v83;
                                  goto LABEL_164;
                                }
                              }
                              else
                              {
                              }
                              if (!a4)
                              {
                                v77 = 0;
                                goto LABEL_164;
                              }
                              v83 = _VIQueryContextMapperError(@"VIQueryContextCountryCodeKey", @"NSString");
                              v77 = 0;
                              goto LABEL_160;
                            }
                            v73 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.locale"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v74 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.locale"];

                              if (v74)
                              {
                                if ([v74 length] == 5
                                  && [v74 characterAtIndex:2] == 95)
                                {
                                  v89 = (void *)[v74 copy];

                                  goto LABEL_139;
                                }
                                if (a4)
                                {
                                  v78 = _VIQueryContextMapperStringValueParseError(@"VIQueryContextLocaleKey");
                                  goto LABEL_155;
                                }
                                goto LABEL_156;
                              }
                            }
                            else
                            {
                            }
                            if (a4)
                            {
                              v78 = _VIQueryContextMapperError(@"VIQueryContextLocaleKey", @"NSString");
                              v74 = 0;
LABEL_155:
                              *a4 = v78;
                              goto LABEL_156;
                            }
                            v74 = 0;
LABEL_156:

LABEL_170:
LABEL_171:

LABEL_172:
LABEL_173:

LABEL_174:
LABEL_175:

                            goto LABEL_176;
                          }
                        }
                        else
                        {
                        }
                        if (a4)
                        {
                          _VIQueryContextMapperError(@"VIQueryContextImageURLKey", @"NSURL");
                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        goto LABEL_175;
                      }
                    }
                    else
                    {
                    }
                    if (a4)
                    {
                      v53 = @"VIQueryContextLocationKey";
                      uint64_t v54 = @"CLLocation";
                      goto LABEL_78;
                    }
LABEL_176:

LABEL_177:
                    goto LABEL_178;
                  }
                }
                else
                {
                }
                if (!a4) {
                  goto LABEL_176;
                }
                v53 = @"VIQueryContextLastSearchTimestampKey";
LABEL_77:
                uint64_t v54 = @"NSNumber";
LABEL_78:
                _VIQueryContextMapperError((uint64_t)v53, v54);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_176;
              }
            }
            else
            {
            }
            if (a4)
            {
              _VIQueryContextMapperError(@"VIQueryContextCatalogIDsKey", @"NSArray<NSString *>");
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_177;
          }
        }
        else
        {
        }
        if (a4)
        {
          v51 = @"VIQueryContextTeamIDKey";
          uint64_t v52 = @"NSString";
          goto LABEL_64;
        }
        goto LABEL_178;
      }
    }
    else
    {
    }
    if (a4)
    {
      v18 = @"VIQueryContextApplicationIdentifierKey";
      v19 = @"NSString";
      goto LABEL_20;
    }
    goto LABEL_179;
  }
  v7 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.query_id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v5 objectForKeyedSubscript:@"com.apple.argos.query_context_key.query_id"];

    if (v8)
    {
      uint64_t v9 = [v8 unsignedLongLongValue];

      goto LABEL_6;
    }
  }
  else
  {
  }
  if (a4)
  {
    v18 = @"VIQueryContextQueryIDKey";
    v19 = @"NSNumber";
LABEL_20:
    _VIQueryContextMapperError((uint64_t)v18, v19);
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_180;
  }
LABEL_179:
  v20 = 0;
LABEL_180:

  return v20;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (double)uiScale
{
  return self->_uiScale;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSArray)catalogIDs
{
  return self->_catalogIDs;
}

- (double)frameTimestamp
{
  return self->_frameTimestamp;
}

- (double)lastSearchTimestamp
{
  return self->_lastSearchTimestamp;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSURL)referralURL
{
  return self->_referralURL;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)engagementSuggestionType
{
  return self->_engagementSuggestionType;
}

- (MTLDevice)preferredMetalDevice
{
  return self->_preferredMetalDevice;
}

- (BOOL)includeLowConfidenceRegions
{
  return self->_includeLowConfidenceRegions;
}

- (NSDictionary)customDetectorThreshold
{
  return self->_customDetectorThreshold;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_customDetectorThreshold, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_referralURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_catalogIDs, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

- (NSString)description
{
  return (NSString *)sub_1DCF16018(self, (uint64_t)a2, (void (*)(void))VIQueryContext.description.getter);
}

@end