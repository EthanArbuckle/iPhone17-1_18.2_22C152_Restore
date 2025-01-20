@interface PKPaginatedWebServiceResponse
+ (BOOL)supportsSecureCoding;
+ (PKPaginatedWebServiceResponse)responseWithData:(id)a3;
- (BOOL)moreComing;
- (NSArray)rawDataList;
- (NSDate)lastUpdated;
- (PKPaginatedWebServiceResponse)initWithCoder:(id)a3;
- (PKPaginatedWebServiceResponse)initWithData:(id)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaginatedWebServiceResponse

- (PKPaginatedWebServiceResponse)initWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKPaginatedWebServiceResponse;
  v3 = [(PKWebServiceResponse *)&v16 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4->_moreComing = [v5 PKBoolForKey:@"moreComing"];
      uint64_t v6 = [v5 PKDateForKey:@"lastUpdated"];
      lastUpdated = v4->_lastUpdated;
      v4->_lastUpdated = (NSDate *)v6;

      uint64_t v8 = [v5 PKArrayContaining:objc_opt_class() forKey:@"data"];
      rawDataList = v4->_rawDataList;
      v4->_rawDataList = (NSArray *)v8;
    }
    else
    {
      v10 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        __int16 v19 = 2112;
        v20 = v13;
        id v14 = v13;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      rawDataList = v4;
      v4 = 0;
    }
  }
  return v4;
}

+ (PKPaginatedWebServiceResponse)responseWithData:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v3];

  return (PKPaginatedWebServiceResponse *)v4;
}

- (id)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PKWebServiceResponse *)self JSONObject];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> JSONObject: %@", v4, self, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaginatedWebServiceResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawData"];

  uint64_t v6 = [(PKPaginatedWebServiceResponse *)self initWithData:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKWebServiceResponse *)self rawData];
  [v4 encodeObject:v5 forKey:@"rawData"];
}

- (NSArray)rawDataList
{
  return self->_rawDataList;
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_rawDataList, 0);
}

@end