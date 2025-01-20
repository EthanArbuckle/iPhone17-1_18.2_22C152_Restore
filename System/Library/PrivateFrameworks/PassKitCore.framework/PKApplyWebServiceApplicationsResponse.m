@interface PKApplyWebServiceApplicationsResponse
+ (BOOL)supportsSecureCoding;
- (NSArray)allFeatureApplications;
- (NSString)lastUpdated;
- (PKApplyWebServiceApplicationsResponse)initWithCoder:(id)a3;
- (PKApplyWebServiceApplicationsResponse)initWithData:(id)a3;
- (PKFeatureFailureCollection)featureFailures;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplyWebServiceApplicationsResponse

- (PKApplyWebServiceApplicationsResponse)initWithData:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)PKApplyWebServiceApplicationsResponse;
  v3 = [(PKWebServiceResponse *)&v39 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 objectForKey:@"applications"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v5 PKStringForKey:@"lastUpdated"];
        lastUpdated = v4->_lastUpdated;
        v4->_lastUpdated = (NSString *)v7;

        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v10 = v6;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v36;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v36 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * v14);
              v16 = [PKFeatureApplication alloc];
              v17 = -[PKFeatureApplication initWithDictionary:](v16, "initWithDictionary:", v15, (void)v35);
              if (v17) {
                [v9 addObject:v17];
              }

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v12);
        }

        uint64_t v18 = [v9 copy];
        allFeatureApplications = v4->_allFeatureApplications;
        v4->_allFeatureApplications = (NSArray *)v18;

        v20 = [v5 objectForKey:@"featureFailures"];
        if (v20)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = [[PKFeatureFailureCollection alloc] initWithArray:v20];
            featureFailures = v4->_featureFailures;
            v4->_featureFailures = v21;
          }
        }

        goto LABEL_17;
      }
      v29 = PKLogFacilityTypeGetObject(0xDuLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        *(_DWORD *)buf = 138543618;
        v42 = v31;
        __int16 v43 = 2114;
        v44 = v33;
        _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v24 = PKLogFacilityTypeGetObject(0xDuLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138543618;
        v42 = v26;
        __int16 v43 = 2114;
        v44 = v28;
        _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
    }

    v23 = 0;
    goto LABEL_25;
  }
LABEL_17:
  v23 = v4;
LABEL_25:

  return v23;
}

- (PKApplyWebServiceApplicationsResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKApplyWebServiceApplicationsResponse;
  v5 = [(PKWebServiceResponse *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"allFeatureApplications"];
    allFeatureApplications = v5->_allFeatureApplications;
    v5->_allFeatureApplications = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceApplicationsResponse;
  id v4 = a3;
  [(PKWebServiceResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_allFeatureApplications, @"allFeatureApplications", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_lastUpdated forKey:@"allFeatureApplications"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)allFeatureApplications
{
  return self->_allFeatureApplications;
}

- (PKFeatureFailureCollection)featureFailures
{
  return self->_featureFailures;
}

- (NSString)lastUpdated
{
  return self->_lastUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_featureFailures, 0);
  objc_storeStrong((id *)&self->_allFeatureApplications, 0);
}

@end