@interface PKPaymentAvailableDevicesResponse
- (NSDictionary)devices;
- (PKPaymentAvailableDevicesResponse)initWithData:(id)a3;
- (void)setDevices:(id)a3;
@end

@implementation PKPaymentAvailableDevicesResponse

- (PKPaymentAvailableDevicesResponse)initWithData:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)PKPaymentAvailableDevicesResponse;
  v3 = [(PKWebServiceResponse *)&v32 initWithData:a3];
  if (v3)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v20 = v3;
    [(PKWebServiceResponse *)v3 JSONObject];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v19 = long long v31 = 0u;
    id obj = [v19 objectForKeyedSubscript:@"paymentDevices"];
    uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v22 = *(void *)v29;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v9 = [v7 objectForKeyedSubscript:@"cards"];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v25;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v25 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = [[PKPaymentAvailableDevicesResponseCardItem alloc] initWithDictionary:*(void *)(*((void *)&v24 + 1) + 8 * v13)];
                [v8 safelyAddObject:v14];

                ++v13;
              }
              while (v11 != v13);
              uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
            }
            while (v11);
          }

          v15 = [v7 objectForKeyedSubscript:@"deviceSerialNumber"];
          [v23 setObject:v8 forKey:v15];

          ++v6;
        }
        while (v6 != v5);
        uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v5);
    }

    uint64_t v16 = [v23 copy];
    v3 = v20;
    devices = v20->_devices;
    v20->_devices = (NSDictionary *)v16;
  }
  return v3;
}

- (NSDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end