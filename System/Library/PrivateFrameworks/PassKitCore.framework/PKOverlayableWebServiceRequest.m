@interface PKOverlayableWebServiceRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)hasOverlayParameters;
- (BOOL)requiresConfigurationForRedirect;
- (BOOL)requiresConfigurationForRetry;
- (NSDictionary)overlayParameters;
- (NSDictionary)secureOverlayParameters;
- (PKOverlayableWebServiceRequest)init;
- (PKOverlayableWebServiceRequest)initWithCoder:(id)a3;
- (PKZeroingDataContainer)archivedData;
- (id)overlayValueForKey:(id)a3;
- (id)secureOverlayValueForKey:(id)a3;
- (void)_applyOverlayToDictionary:(id)a3;
- (void)_applySecureOverlayToDictionary:(id)a3;
- (void)_setOverriddenKeys:(id)a3;
- (void)_updateRequestForRedirect:(id)a3 overrides:(id)a4 webService:(id)a5 withCompletion:(id)a6;
- (void)_updateRequestForRetry:(id)a3 retryFields:(id)a4 webService:(id)a5 withCompletion:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setOverlayParameters:(id)a3;
- (void)setOverlayValue:(id)a3 forKey:(id)a4;
- (void)setRequiresConfigurationForRedirect:(BOOL)a3;
- (void)setRequiresConfigurationForRetry:(BOOL)a3;
- (void)setSecureOverlayParameters:(id)a3;
- (void)setSecureOverlayValue:(id)a3 forKey:(id)a4;
@end

@implementation PKOverlayableWebServiceRequest

- (PKOverlayableWebServiceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKOverlayableWebServiceRequest;
  v5 = [(PKWebServiceRequest *)&v21 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"overlayParameters"];
    overlayParameters = v5->_overlayParameters;
    v5->_overlayParameters = (NSMutableDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v13 forKey:@"secureOverlayParameters"];
    secureOverlayParameters = v5->_secureOverlayParameters;
    v5->_secureOverlayParameters = (NSMutableDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:v13 forKey:@"overridenKeys"];
    overridenKeys = v5->_overridenKeys;
    v5->_overridenKeys = (NSArray *)v18;

    v5->_requiresConfigurationForRetry = [v4 decodeBoolForKey:@"requiresConfigurationForRetry"];
    v5->_requiresConfigurationForRedirect = [v4 decodeBoolForKey:@"requiresConfigurationForRedirect"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKOverlayableWebServiceRequest;
  id v4 = a3;
  [(PKWebServiceRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_overlayParameters, @"overlayParameters", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_secureOverlayParameters forKey:@"secureOverlayParameters"];
  [v4 encodeObject:self->_overridenKeys forKey:@"overridenKeys"];
  [v4 encodeBool:self->_requiresConfigurationForRetry forKey:@"requiresConfigurationForRetry"];
  [v4 encodeBool:self->_requiresConfigurationForRedirect forKey:@"requiresConfigurationForRedirect"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKZeroingDataContainer)archivedData
{
  id v7 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  id v3 = v7;
  id v4 = v3;
  if (v3)
  {
    NSLog(&cfstr_CouldNotCreate_0.isa, v3);
    objc_super v5 = 0;
  }
  else
  {
    objc_super v5 = [[PKZeroingDataContainer alloc] initWithData:v2];
  }

  return v5;
}

- (PKOverlayableWebServiceRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKOverlayableWebServiceRequest;
  v2 = [(PKOverlayableWebServiceRequest *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    overlayParameters = v2->_overlayParameters;
    v2->_overlayParameters = v3;

    objc_super v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    secureOverlayParameters = v2->_secureOverlayParameters;
    v2->_secureOverlayParameters = v5;
  }
  return v2;
}

- (void)setOverlayValue:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    overlayParameters = self->_overlayParameters;
    if (v8) {
      [(NSMutableDictionary *)overlayParameters setObject:v8 forKeyedSubscript:v6];
    }
    else {
      [(NSMutableDictionary *)overlayParameters removeObjectForKey:v6];
    }
  }
}

- (id)overlayValueForKey:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_overlayParameters, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (NSDictionary)overlayParameters
{
  v2 = (void *)[(NSMutableDictionary *)self->_overlayParameters copy];
  return (NSDictionary *)v2;
}

- (void)setOverlayParameters:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    id v5 = (id)[v4 mutableCopy];
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v6 = v5;
  objc_storeStrong((id *)&self->_overlayParameters, v5);
}

- (void)setSecureOverlayValue:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    secureOverlayParameters = self->_secureOverlayParameters;
    if (v8) {
      [(NSMutableDictionary *)secureOverlayParameters setObject:v8 forKeyedSubscript:v6];
    }
    else {
      [(NSMutableDictionary *)secureOverlayParameters removeObjectForKey:v6];
    }
  }
}

- (id)secureOverlayValueForKey:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_secureOverlayParameters, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (NSDictionary)secureOverlayParameters
{
  v2 = (void *)[(NSMutableDictionary *)self->_secureOverlayParameters copy];
  return (NSDictionary *)v2;
}

- (void)setSecureOverlayParameters:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    id v5 = (id)[v4 mutableCopy];
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v6 = v5;
  objc_storeStrong((id *)&self->_secureOverlayParameters, v5);
}

- (void)_applyOverlayToDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_overlayParameters;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_overlayParameters, "objectForKeyedSubscript:", v10, (void)v12);
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_applySecureOverlayToDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_secureOverlayParameters;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_secureOverlayParameters, "objectForKeyedSubscript:", v10, (void)v12);
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_setOverriddenKeys:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  overridenKeys = self->_overridenKeys;
  self->_overridenKeys = v4;
}

- (void)_updateRequestForRedirect:(id)a3 overrides:(id)a4 webService:(id)a5 withCompletion:(id)a6
{
  id v14 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a6;
  uint64_t v11 = (void *)[(NSMutableDictionary *)self->_overlayParameters mutableCopy];
  long long v12 = v11;
  if (v11) {
    [v11 removeObjectsForKeys:self->_overridenKeys];
  }
  if (v9) {
    [v12 addEntriesFromDictionary:v9];
  }
  long long v13 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v12];
  [v14 setHTTPBody:v13];

  if (v10) {
    v10[2](v10, v14);
  }
}

- (void)_updateRequestForRetry:(id)a3 retryFields:(id)a4 webService:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  uint64_t v8 = (void (**)(id, id))a6;
  id v9 = [(id)objc_opt_class() _HTTPBodyWithDictionary:self->_overlayParameters];
  [v10 setHTTPBody:v9];

  if (v8) {
    v8[2](v8, v10);
  }
}

- (BOOL)hasOverlayParameters
{
  return [(NSMutableDictionary *)self->_secureOverlayParameters count]
      || [(NSMutableDictionary *)self->_overlayParameters count] != 0;
}

- (BOOL)requiresConfigurationForRetry
{
  return self->_requiresConfigurationForRetry;
}

- (void)setRequiresConfigurationForRetry:(BOOL)a3
{
  self->_requiresConfigurationForRetry = a3;
}

- (BOOL)requiresConfigurationForRedirect
{
  return self->_requiresConfigurationForRedirect;
}

- (void)setRequiresConfigurationForRedirect:(BOOL)a3
{
  self->_requiresConfigurationForRedirect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridenKeys, 0);
  objc_storeStrong((id *)&self->_secureOverlayParameters, 0);
  objc_storeStrong((id *)&self->_overlayParameters, 0);
}

@end