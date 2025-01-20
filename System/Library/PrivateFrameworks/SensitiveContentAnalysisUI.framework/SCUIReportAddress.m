@interface SCUIReportAddress
- (NSString)address;
- (NSString)city;
- (NSString)country;
- (NSString)postCode;
- (NSString)state;
- (SCUIReportAddress)initWithAddress:(id)a3 city:(id)a4 state:(id)a5 country:(id)a6 postCode:(id)a7;
@end

@implementation SCUIReportAddress

- (SCUIReportAddress)initWithAddress:(id)a3 city:(id)a4 state:(id)a5 country:(id)a6 postCode:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SCUIReportAddress;
  v17 = [(SCUIReportAddress *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    address = v17->_address;
    v17->_address = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    city = v17->_city;
    v17->_city = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    state = v17->_state;
    v17->_state = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    country = v17->_country;
    v17->_country = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    postCode = v17->_postCode;
    v17->_postCode = (NSString *)v26;
  }
  return v17;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)city
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)country
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)postCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end