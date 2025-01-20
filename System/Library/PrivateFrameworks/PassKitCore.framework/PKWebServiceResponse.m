@interface PKWebServiceResponse
+ (BOOL)jsonDataOptional;
+ (BOOL)supportsSecureCoding;
+ (id)responseWithData:(id)a3;
+ (id)responseWithData:(id)a3 headers:(id)a4;
- (NSData)rawData;
- (NSDictionary)headers;
- (PKWebServiceResponse)initWithCoder:(id)a3;
- (PKWebServiceResponse)initWithData:(id)a3;
- (PKWebServiceResponse)initWithData:(id)a3 headers:(id)a4;
- (id)JSONObject;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKWebServiceResponse

- (PKWebServiceResponse)initWithData:(id)a3
{
  return [(PKWebServiceResponse *)self initWithData:a3 headers:0];
}

- (PKWebServiceResponse)initWithData:(id)a3 headers:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    BOOL v8 = [v6 length] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  int v9 = [(id)objc_opt_class() jsonDataOptional];
  int v10 = v9;
  if (!v8 && !v9)
  {
    p_super = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = (id)objc_opt_class();
      id v12 = v25;
      _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: %@ is missing data", buf, 0xCu);
    }
    id v13 = 0;
    v14 = 0;
    v15 = self;
    goto LABEL_20;
  }
  if (v8)
  {
    id v23 = 0;
    v15 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v23];
    id v13 = v23;
    if (v15) {
      goto LABEL_17;
    }
  }
  else
  {
    v15 = 0;
    id v13 = 0;
  }
  if ((v10 ^ 1 | v8))
  {
    v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v13 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v25 = v17;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Malformed response: %@", buf, 0xCu);
    }
    v15 = 0;
    v14 = 0;
    p_super = &self->super;
    goto LABEL_20;
  }
LABEL_17:
  v22.receiver = self;
  v22.super_class = (Class)PKWebServiceResponse;
  v14 = [(PKWebServiceResponse *)&v22 init];
  if (v14)
  {
    uint64_t v18 = [v6 copy];
    rawData = v14->_rawData;
    v14->_rawData = (NSData *)v18;

    objc_storeStrong(&v14->_JSONObject, v15);
    if (v7)
    {
      v20 = (NSDictionary *)v7;
      p_super = &v14->_headers->super;
      v14->_headers = v20;
LABEL_20:
    }
  }

  return v14;
}

+ (id)responseWithData:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v3];

  return v4;
}

+ (id)responseWithData:(id)a3 headers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithData:v6 headers:v5];

  return v7;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@: %p> JSONObject: %@ Headers: %@", objc_opt_class(), self, self->_JSONObject, self->_headers];
}

+ (BOOL)jsonDataOptional
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKWebServiceResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawData"];

  id v6 = [(PKWebServiceResponse *)self initWithData:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKWebServiceResponse *)self rawData];
  [v4 encodeObject:v5 forKey:@"rawData"];
}

- (NSData)rawData
{
  return self->_rawData;
}

- (id)JSONObject
{
  return self->_JSONObject;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong(&self->_JSONObject, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end