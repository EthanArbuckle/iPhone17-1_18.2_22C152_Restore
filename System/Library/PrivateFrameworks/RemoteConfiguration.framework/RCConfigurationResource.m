@interface RCConfigurationResource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpiredWithMaxTTL:(double)a3 allowedToReachEndpoint:(BOOL)a4;
- (NSArray)segmentSetIDs;
- (NSArray)treatmentIDs;
- (NSData)configurationData;
- (NSData)gzippedConfigurationData;
- (NSDate)lastFetchedDate;
- (NSNumber)endpointMaxAge;
- (NSNumber)fallbackMaxAge;
- (NSString)configurationID;
- (NSString)contentHash;
- (NSString)etag;
- (NSString)lastModifiedFallbackString;
- (NSString)lastModifiedString;
- (NSString)requestKey;
- (NSString)storefrontID;
- (NSString)userID;
- (RCConfigurationResource)initWithCoder:(id)a3;
- (RCUserSegmentationConfiguration)userSegmentationConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurationID:(id)a3;
- (void)setContentHash:(id)a3;
- (void)setEndpointMaxAge:(id)a3;
- (void)setEtag:(id)a3;
- (void)setFallbackMaxAge:(id)a3;
- (void)setGzippedConfigurationData:(id)a3;
- (void)setLastFetchedDate:(id)a3;
- (void)setLastModifiedFallbackString:(id)a3;
- (void)setLastModifiedString:(id)a3;
- (void)setRequestKey:(id)a3;
- (void)setSegmentSetIDs:(id)a3;
- (void)setStorefrontID:(id)a3;
- (void)setTreatmentIDs:(id)a3;
- (void)setUserID:(id)a3;
- (void)setUserSegmentationConfiguration:(id)a3;
@end

@implementation RCConfigurationResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)configurationData
{
  v2 = [(RCConfigurationResource *)self gzippedConfigurationData];
  v3 = objc_msgSend(v2, "rc_gzipInflate");

  return (NSData *)v3;
}

- (NSData)gzippedConfigurationData
{
  return self->_gzippedConfigurationData;
}

- (NSArray)treatmentIDs
{
  return self->_treatmentIDs;
}

- (NSArray)segmentSetIDs
{
  return self->_segmentSetIDs;
}

- (NSString)userID
{
  return self->_userID;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (BOOL)isExpiredWithMaxTTL:(double)a3 allowedToReachEndpoint:(BOOL)a4
{
  if (a4) {
    [(RCConfigurationResource *)self endpointMaxAge];
  }
  else {
  v6 = [(RCConfigurationResource *)self fallbackMaxAge];
  }
  [v6 doubleValue];
  if (v7 != 0.0)
  {
    [v6 doubleValue];
    a3 = fmax(a3, v8);
  }
  v9 = [(RCConfigurationResource *)self lastFetchedDate];
  objc_msgSend(v9, "rc_timeIntervalUntilNow");
  double v11 = v10;

  BOOL v12 = v11 < 0.0 || v11 >= a3;
  return v12;
}

- (NSDate)lastFetchedDate
{
  return self->_lastFetchedDate;
}

- (NSNumber)endpointMaxAge
{
  return self->_endpointMaxAge;
}

- (RCUserSegmentationConfiguration)userSegmentationConfiguration
{
  return self->_userSegmentationConfiguration;
}

- (NSString)requestKey
{
  return self->_requestKey;
}

- (RCConfigurationResource)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)RCConfigurationResource;
  v5 = [(RCConfigurationResource *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestKey"];
    requestKey = v5->_requestKey;
    v5->_requestKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gzippedConfigurationData"];
    gzippedConfigurationData = v5->_gzippedConfigurationData;
    v5->_gzippedConfigurationData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userSegmentationConfiguration"];
    userSegmentationConfiguration = v5->_userSegmentationConfiguration;
    v5->_userSegmentationConfiguration = (RCUserSegmentationConfiguration *)v10;

    BOOL v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"treatmentIDs"];
    treatmentIDs = v5->_treatmentIDs;
    v5->_treatmentIDs = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:v14 forKey:@"segmentSetIDs"];
    segmentSetIDs = v5->_segmentSetIDs;
    v5->_segmentSetIDs = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
    userID = v5->_userID;
    v5->_userID = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storefrontID"];
    storefrontID = v5->_storefrontID;
    v5->_storefrontID = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationID"];
    configurationID = v5->_configurationID;
    v5->_configurationID = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentHash"];
    contentHash = v5->_contentHash;
    v5->_contentHash = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedString"];
    lastModifiedString = v5->_lastModifiedString;
    v5->_lastModifiedString = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"etag"];
    etag = v5->_etag;
    v5->_etag = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedFallbackString"];
    lastModifiedFallbackString = v5->_lastModifiedFallbackString;
    v5->_lastModifiedFallbackString = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFetchedDate"];
    lastFetchedDate = v5->_lastFetchedDate;
    v5->_lastFetchedDate = (NSDate *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackMaxAge"];
    fallbackMaxAge = v5->_fallbackMaxAge;
    v5->_fallbackMaxAge = (NSNumber *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpointMaxAge"];
    endpointMaxAge = v5->_endpointMaxAge;
    v5->_endpointMaxAge = (NSNumber *)v37;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(RCConfigurationResource *)self gzippedConfigurationData];
    double v7 = [v5 gzippedConfigurationData];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = [(RCConfigurationResource *)self requestKey];
      v9 = [v5 requestKey];
      if ([v8 isEqualToString:v9])
      {
        uint64_t v10 = [(RCConfigurationResource *)self userSegmentationConfiguration];
        double v11 = [v5 userSegmentationConfiguration];
        if ([v10 isEqual:v11])
        {
          v48 = v11;
          v50 = v10;
          BOOL v12 = (void *)MEMORY[0x1E4FBA8A8];
          uint64_t v13 = [(RCConfigurationResource *)self treatmentIDs];
          v49 = [v5 treatmentIDs];
          if (objc_msgSend(v12, "rc_object:isEqualToObject:", v13))
          {
            v45 = v13;
            v14 = (void *)MEMORY[0x1E4FBA8A8];
            uint64_t v15 = [(RCConfigurationResource *)self segmentSetIDs];
            v46 = [v5 segmentSetIDs];
            v47 = (void *)v15;
            if (objc_msgSend(v14, "rc_object:isEqualToObject:", v15))
            {
              v16 = [(RCConfigurationResource *)self userID];
              v43 = [v5 userID];
              uint64_t v10 = v50;
              v44 = v16;
              if (objc_msgSend(v16, "isEqualToString:"))
              {
                uint64_t v17 = [(RCConfigurationResource *)self storefrontID];
                v41 = [v5 storefrontID];
                v42 = v17;
                if (objc_msgSend(v17, "isEqualToString:"))
                {
                  v18 = [(RCConfigurationResource *)self configurationID];
                  v39 = [v5 configurationID];
                  objc_super v40 = v18;
                  if (objc_msgSend(v18, "isEqualToString:"))
                  {
                    uint64_t v19 = [(RCConfigurationResource *)self contentHash];
                    uint64_t v37 = [v5 contentHash];
                    v38 = v19;
                    if (objc_msgSend(v19, "isEqualToString:"))
                    {
                      v20 = [(RCConfigurationResource *)self lastModifiedString];
                      uint64_t v35 = [v5 lastModifiedString];
                      v36 = v20;
                      if (objc_msgSend(v20, "isEqualToString:"))
                      {
                        uint64_t v21 = [(RCConfigurationResource *)self etag];
                        uint64_t v33 = [v5 etag];
                        v34 = v21;
                        if (objc_msgSend(v21, "isEqualToString:"))
                        {
                          v22 = [(RCConfigurationResource *)self lastModifiedFallbackString];
                          v32 = [v5 lastModifiedFallbackString];
                          if (objc_msgSend(v22, "isEqualToString:"))
                          {
                            uint64_t v23 = [(RCConfigurationResource *)self lastFetchedDate];
                            uint64_t v31 = [v5 lastFetchedDate];
                            if (objc_msgSend(v23, "isEqual:"))
                            {
                              v24 = [(RCConfigurationResource *)self fallbackMaxAge];
                              uint64_t v29 = [v5 fallbackMaxAge];
                              v30 = v24;
                              if (objc_msgSend(v24, "isEqual:"))
                              {
                                v28 = [(RCConfigurationResource *)self endpointMaxAge];
                                uint64_t v25 = [v5 endpointMaxAge];
                                char v26 = [v28 isEqual:v25];
                              }
                              else
                              {
                                char v26 = 0;
                              }
                            }
                            else
                            {
                              char v26 = 0;
                            }

                            uint64_t v10 = v50;
                          }
                          else
                          {
                            char v26 = 0;
                          }
                          uint64_t v13 = v45;
                        }
                        else
                        {
                          char v26 = 0;
                          uint64_t v13 = v45;
                        }
                        double v11 = v48;
                      }
                      else
                      {
                        char v26 = 0;
                        uint64_t v13 = v45;
                        double v11 = v48;
                      }
                    }
                    else
                    {
                      char v26 = 0;
                      uint64_t v13 = v45;
                      double v11 = v48;
                    }
                  }
                  else
                  {
                    char v26 = 0;
                    uint64_t v13 = v45;
                    double v11 = v48;
                  }
                }
                else
                {
                  char v26 = 0;
                  uint64_t v13 = v45;
                  double v11 = v48;
                }
              }
              else
              {
                char v26 = 0;
                uint64_t v13 = v45;
                double v11 = v48;
              }
            }
            else
            {
              char v26 = 0;
              uint64_t v10 = v50;
              uint64_t v13 = v45;
              double v11 = v48;
            }
          }
          else
          {
            char v26 = 0;
            double v11 = v48;
          }
        }
        else
        {
          char v26 = 0;
        }
      }
      else
      {
        char v26 = 0;
      }
    }
    else
    {
      char v26 = 0;
    }
  }
  else
  {
    char v26 = 0;
  }

  return v26;
}

- (unint64_t)hash
{
  uint64_t v33 = [(RCConfigurationResource *)self gzippedConfigurationData];
  uint64_t v3 = [v33 hash];
  v32 = [(RCConfigurationResource *)self requestKey];
  uint64_t v4 = [v32 hash] ^ v3;
  uint64_t v31 = [(RCConfigurationResource *)self userSegmentationConfiguration];
  uint64_t v5 = [v31 hash];
  v30 = [(RCConfigurationResource *)self treatmentIDs];
  uint64_t v6 = v4 ^ v5 ^ [v30 hash];
  uint64_t v29 = [(RCConfigurationResource *)self segmentSetIDs];
  uint64_t v7 = [v29 hash];
  v28 = [(RCConfigurationResource *)self userID];
  uint64_t v8 = v7 ^ [v28 hash];
  uint64_t v27 = [(RCConfigurationResource *)self storefrontID];
  uint64_t v9 = v6 ^ v8 ^ [v27 hash];
  char v26 = [(RCConfigurationResource *)self configurationID];
  uint64_t v10 = [v26 hash];
  double v11 = [(RCConfigurationResource *)self contentHash];
  uint64_t v12 = v10 ^ [v11 hash];
  uint64_t v13 = [(RCConfigurationResource *)self lastModifiedString];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = [(RCConfigurationResource *)self etag];
  uint64_t v16 = v9 ^ v14 ^ [v15 hash];
  uint64_t v17 = [(RCConfigurationResource *)self lastModifiedFallbackString];
  uint64_t v18 = [v17 hash];
  uint64_t v19 = [(RCConfigurationResource *)self lastFetchedDate];
  uint64_t v20 = v18 ^ [v19 hash];
  uint64_t v21 = [(RCConfigurationResource *)self fallbackMaxAge];
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = [(RCConfigurationResource *)self endpointMaxAge];
  unint64_t v24 = v16 ^ v22 ^ [v23 hash];

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(RCConfigurationResource);
  uint64_t v5 = [(RCConfigurationResource *)self requestKey];
  [(RCConfigurationResource *)v4 setRequestKey:v5];

  uint64_t v6 = [(RCConfigurationResource *)self gzippedConfigurationData];
  [(RCConfigurationResource *)v4 setGzippedConfigurationData:v6];

  uint64_t v7 = [(RCConfigurationResource *)self userSegmentationConfiguration];
  [(RCConfigurationResource *)v4 setUserSegmentationConfiguration:v7];

  uint64_t v8 = [(RCConfigurationResource *)self treatmentIDs];
  [(RCConfigurationResource *)v4 setTreatmentIDs:v8];

  uint64_t v9 = [(RCConfigurationResource *)self segmentSetIDs];
  [(RCConfigurationResource *)v4 setSegmentSetIDs:v9];

  uint64_t v10 = [(RCConfigurationResource *)self userID];
  [(RCConfigurationResource *)v4 setUserID:v10];

  double v11 = [(RCConfigurationResource *)self storefrontID];
  [(RCConfigurationResource *)v4 setStorefrontID:v11];

  uint64_t v12 = [(RCConfigurationResource *)self configurationID];
  [(RCConfigurationResource *)v4 setConfigurationID:v12];

  uint64_t v13 = [(RCConfigurationResource *)self contentHash];
  [(RCConfigurationResource *)v4 setContentHash:v13];

  uint64_t v14 = [(RCConfigurationResource *)self lastModifiedString];
  [(RCConfigurationResource *)v4 setLastModifiedString:v14];

  uint64_t v15 = [(RCConfigurationResource *)self etag];
  [(RCConfigurationResource *)v4 setEtag:v15];

  uint64_t v16 = [(RCConfigurationResource *)self lastModifiedFallbackString];
  [(RCConfigurationResource *)v4 setLastModifiedFallbackString:v16];

  uint64_t v17 = [(RCConfigurationResource *)self lastFetchedDate];
  [(RCConfigurationResource *)v4 setLastFetchedDate:v17];

  uint64_t v18 = [(RCConfigurationResource *)self fallbackMaxAge];
  [(RCConfigurationResource *)v4 setFallbackMaxAge:v18];

  uint64_t v19 = [(RCConfigurationResource *)self endpointMaxAge];
  [(RCConfigurationResource *)v4 setEndpointMaxAge:v19];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RCConfigurationResource *)self requestKey];
  [v4 encodeObject:v5 forKey:@"requestKey"];

  uint64_t v6 = [(RCConfigurationResource *)self gzippedConfigurationData];
  [v4 encodeObject:v6 forKey:@"gzippedConfigurationData"];

  uint64_t v7 = [(RCConfigurationResource *)self userSegmentationConfiguration];
  [v4 encodeObject:v7 forKey:@"userSegmentationConfiguration"];

  uint64_t v8 = [(RCConfigurationResource *)self treatmentIDs];
  [v4 encodeObject:v8 forKey:@"treatmentIDs"];

  uint64_t v9 = [(RCConfigurationResource *)self segmentSetIDs];
  [v4 encodeObject:v9 forKey:@"segmentSetIDs"];

  uint64_t v10 = [(RCConfigurationResource *)self userID];
  [v4 encodeObject:v10 forKey:@"userID"];

  double v11 = [(RCConfigurationResource *)self storefrontID];
  [v4 encodeObject:v11 forKey:@"storefrontID"];

  uint64_t v12 = [(RCConfigurationResource *)self configurationID];
  [v4 encodeObject:v12 forKey:@"configurationID"];

  uint64_t v13 = [(RCConfigurationResource *)self contentHash];
  [v4 encodeObject:v13 forKey:@"contentHash"];

  uint64_t v14 = [(RCConfigurationResource *)self lastModifiedString];
  [v4 encodeObject:v14 forKey:@"lastModifiedString"];

  uint64_t v15 = [(RCConfigurationResource *)self etag];
  [v4 encodeObject:v15 forKey:@"etag"];

  uint64_t v16 = [(RCConfigurationResource *)self lastModifiedFallbackString];
  [v4 encodeObject:v16 forKey:@"lastModifiedFallbackString"];

  uint64_t v17 = [(RCConfigurationResource *)self lastFetchedDate];
  [v4 encodeObject:v17 forKey:@"lastFetchedDate"];

  uint64_t v18 = [(RCConfigurationResource *)self fallbackMaxAge];
  [v4 encodeObject:v18 forKey:@"fallbackMaxAge"];

  id v19 = [(RCConfigurationResource *)self endpointMaxAge];
  [v4 encodeObject:v19 forKey:@"endpointMaxAge"];
}

- (id)description
{
  uint64_t v15 = NSString;
  uint64_t v14 = objc_opt_class();
  uint64_t v16 = [(RCConfigurationResource *)self requestKey];
  uint64_t v3 = [(RCConfigurationResource *)self configurationID];
  id v4 = [(RCConfigurationResource *)self contentHash];
  uint64_t v5 = [(RCConfigurationResource *)self lastModifiedString];
  uint64_t v6 = [(RCConfigurationResource *)self etag];
  uint64_t v7 = [(RCConfigurationResource *)self lastModifiedFallbackString];
  uint64_t v8 = [(RCConfigurationResource *)self lastFetchedDate];
  uint64_t v9 = [(RCConfigurationResource *)self fallbackMaxAge];
  uint64_t v10 = [(RCConfigurationResource *)self endpointMaxAge];
  double v11 = [(RCConfigurationResource *)self userSegmentationConfiguration];
  objc_msgSend(v15, "stringWithFormat:", @"<%@: %p; requestKey: %@ configurationID: %@ contentHash: %@ lastModified: %@, etag: %@ lastModifiedFallback: %@ lastFetched: %@ fallbackMaxAge: %@ endpointMaxAge: %@ userSegmentationConfig: %@>",
    v14,
    self,
    v16,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  uint64_t v12 = v11);

  return v12;
}

- (void)setRequestKey:(id)a3
{
}

- (void)setGzippedConfigurationData:(id)a3
{
}

- (void)setUserSegmentationConfiguration:(id)a3
{
}

- (void)setTreatmentIDs:(id)a3
{
}

- (void)setSegmentSetIDs:(id)a3
{
}

- (void)setUserID:(id)a3
{
}

- (void)setStorefrontID:(id)a3
{
}

- (NSString)configurationID
{
  return self->_configurationID;
}

- (void)setConfigurationID:(id)a3
{
}

- (NSString)contentHash
{
  return self->_contentHash;
}

- (void)setContentHash:(id)a3
{
}

- (NSString)lastModifiedString
{
  return self->_lastModifiedString;
}

- (void)setLastModifiedString:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSString)lastModifiedFallbackString
{
  return self->_lastModifiedFallbackString;
}

- (void)setLastModifiedFallbackString:(id)a3
{
}

- (void)setLastFetchedDate:(id)a3
{
}

- (NSNumber)fallbackMaxAge
{
  return self->_fallbackMaxAge;
}

- (void)setFallbackMaxAge:(id)a3
{
}

- (void)setEndpointMaxAge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointMaxAge, 0);
  objc_storeStrong((id *)&self->_fallbackMaxAge, 0);
  objc_storeStrong((id *)&self->_lastFetchedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedFallbackString, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_lastModifiedString, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_configurationID, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_segmentSetIDs, 0);
  objc_storeStrong((id *)&self->_treatmentIDs, 0);
  objc_storeStrong((id *)&self->_userSegmentationConfiguration, 0);
  objc_storeStrong((id *)&self->_gzippedConfigurationData, 0);

  objc_storeStrong((id *)&self->_requestKey, 0);
}

@end