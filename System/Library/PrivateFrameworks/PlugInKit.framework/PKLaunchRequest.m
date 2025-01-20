@interface PKLaunchRequest
+ (id)launchRequestWithUUID:(id)a3 launchPersona:(id)a4;
- (NSUUID)uuid;
- (PKPersona)launchPersona;
- (id)_initWithUUID:(id)a3 launchPersona:(id)a4;
- (void)setLaunchPersona:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PKLaunchRequest

- (id)_initWithUUID:(id)a3 launchPersona:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKLaunchRequest;
  v8 = [(PKLaunchRequest *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v9;

    objc_storeStrong((id *)&v8->_launchPersona, a4);
  }

  return v8;
}

+ (id)launchRequestWithUUID:(id)a3 launchPersona:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithUUID:v7 launchPersona:v6];

  return v8;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
}

- (PKPersona)launchPersona
{
  return (PKPersona *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLaunchPersona:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchPersona, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end