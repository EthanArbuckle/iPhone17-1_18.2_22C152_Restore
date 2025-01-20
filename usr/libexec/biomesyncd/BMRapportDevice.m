@interface BMRapportDevice
+ (BOOL)supportsSecureCoding;
- (BMAccount)account;
- (BMRapportDevice)initWithCoder:(id)a3;
- (BMRapportDevice)initWithRPCompanionLinkDevice:(id)a3;
- (BMRapportDeviceCommunicationClient)client;
- (BOOL)isEqual:(id)a3;
- (NSArray)serviceTypes;
- (NSMutableArray)requestQueue;
- (NSString)bmDeviceIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)rapportIdentifier;
- (NSString)shortenedRapportIdentifier;
- (RPCompanionLinkDevice)device;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)platform;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)handleInvalidationWithError:(id)a3;
- (void)invalidateClientWithError:(id)a3;
- (void)setBmDeviceIdentifier:(id)a3;
- (void)setClient:(id)a3;
- (void)setDevice:(id)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation BMRapportDevice

- (BMRapportDevice)initWithRPCompanionLinkDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMRapportDevice;
  v6 = [(BMRapportDevice *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = [v5 bm_companionLinkDeviceIdentifier];
    rapportIdentifier = v7->_rapportIdentifier;
    v7->_rapportIdentifier = (NSString *)v8;

    uint64_t v10 = +[NSMutableArray array];
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = (NSMutableArray *)v10;
  }
  return v7;
}

- (BMAccount)account
{
  v2 = [(RPCompanionLinkDevice *)self->_device accountAltDSID];
  if (v2) {
    id v3 = [objc_alloc((Class)BMAccount) initWithAccountIdentifier:v2];
  }
  else {
    id v3 = 0;
  }

  return (BMAccount *)v3;
}

- (NSString)shortenedRapportIdentifier
{
  return [(NSString *)self->_rapportIdentifier substringToIndex:8];
}

- (NSString)name
{
  v2 = [(BMRapportDevice *)self device];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)model
{
  v2 = [(BMRapportDevice *)self device];
  id v3 = [v2 model];

  return (NSString *)v3;
}

- (NSArray)serviceTypes
{
  v2 = [(BMRapportDevice *)self device];
  id v3 = [v2 serviceTypes];

  return (NSArray *)v3;
}

- (int64_t)platform
{
  v2 = [(BMRapportDevice *)self device];
  id v3 = [v2 model];
  int64_t v4 = BMDevicePlatformFromModelString();

  return v4;
}

- (void)invalidateClientWithError:(id)a3
{
  client = self->_client;
  if (client)
  {
    self->_client = 0;
    v6 = client;
    id v7 = a3;

    [(BMRapportDeviceCommunicationClient *)v6 invalidate];
    [(BMRapportDevice *)self handleInvalidationWithError:v7];
  }
}

- (void)handleInvalidationWithError:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v15 = self;
  id v5 = self->_requestQueue;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKeyedSubscript:@"~~RESPONSE_HANDLER~~"];
        v11 = (void (**)(void, void, void, void))v10;
        if (v10)
        {
          if (v4)
          {
            (*(void (**)(uint64_t, void, void, id))(v10 + 16))(v10, 0, 0, v4);
          }
          else
          {
            v12 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:4 userInfo:0];
            ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v12);
          }
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)v15->_requestQueue removeAllObjects];
  objc_super v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [(BMRapportDevice *)v15 shortenedRapportIdentifier];
    *(_DWORD *)buf = 138412290;
    v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: invalidated", buf, 0xCu);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 rapportIdentifier];
    id v6 = [(BMRapportDevice *)self rapportIdentifier];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(BMRapportDevice *)self rapportIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  long long v13 = 0uLL;
  id v3 = [(BMRapportDevice *)self device];
  id v4 = v3;
  if (v3) {
    [v3 operatingSystemVersion];
  }
  else {
    long long v13 = 0uLL;
  }

  id v5 = objc_alloc((Class)NSString);
  id v6 = [(BMRapportDevice *)self shortenedRapportIdentifier];
  unsigned __int8 v7 = [(BMRapportDevice *)self rapportIdentifier];
  uint64_t v8 = [(BMRapportDevice *)self bmDeviceIdentifier];
  v9 = [(BMRapportDevice *)self model];
  uint64_t v10 = [(BMRapportDevice *)self name];
  id v11 = [v5 initWithFormat:@"BMRapportDevice[%@]: id=%@ bmID=%@ model=%@ name=%@ version=%ld.%ld.%ld", v6, v7, v8, v9, v10, v13, 0];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = self;
  device = v3->_device;

  return [(BMRapportDevice *)v3 initWithRPCompanionLinkDevice:device];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMRapportDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device"];

  id v6 = [(BMRapportDevice *)self initWithRPCompanionLinkDevice:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMRapportDevice *)self device];
  [v4 encodeObject:v5 forKey:@"device"];
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (NSString)bmDeviceIdentifier
{
  return self->_bmDeviceIdentifier;
}

- (void)setBmDeviceIdentifier:(id)a3
{
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BMRapportDeviceCommunicationClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_bmDeviceIdentifier, 0);

  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
}

@end