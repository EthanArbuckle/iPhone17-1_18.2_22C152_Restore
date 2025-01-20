@interface TAOutgoingRequests
- (NSDate)date;
- (NSDictionary)additionalInformation;
- (NSString)key;
- (TAOutgoingRequests)initWithRequestKey:(id)a3 additionalInformation:(id)a4 date:(id)a5;
- (id)description;
- (id)descriptionDictionary;
- (void)description;
@end

@implementation TAOutgoingRequests

- (TAOutgoingRequests)initWithRequestKey:(id)a3 additionalInformation:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TAOutgoingRequests;
  v11 = [(TAOutgoingRequests *)&v20 init];
  if (!v11)
  {
LABEL_8:
    v12 = v11;
    goto LABEL_9;
  }
  v12 = 0;
  if (v8 && v10)
  {
    uint64_t v13 = [v8 copy];
    key = v11->_key;
    v11->_key = (NSString *)v13;

    if (v9)
    {
      uint64_t v15 = [v9 copy];
    }
    else
    {
      uint64_t v15 = [NSDictionary dictionary];
    }
    additionalInformation = v11->_additionalInformation;
    v11->_additionalInformation = (NSDictionary *)v15;

    uint64_t v17 = [v10 copy];
    date = v11->_date;
    v11->_date = (NSDate *)v17;

    goto LABEL_8;
  }
LABEL_9:

  return v12;
}

- (id)descriptionDictionary
{
  v10[3] = *MEMORY[0x263EF8340];
  key = self->_key;
  additionalInformation = self->_additionalInformation;
  v10[0] = key;
  v9[0] = @"Key";
  v9[1] = @"AdditionalInformation";
  v5 = [(NSDictionary *)additionalInformation description];
  v10[1] = v5;
  v9[2] = @"Date";
  v6 = [(NSDate *)self->_date getDateString];
  v10[2] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (id)description
{
  v3 = [(TAOutgoingRequests *)self descriptionDictionary];
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (NSString)key
{
  return self->_key;
}

- (NSDictionary)additionalInformation
{
  return self->_additionalInformation;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_additionalInformation, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)description
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = a1;
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_22345C000, v4, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", (uint8_t *)&v7, 0x16u);
}

@end