@interface FMDActingRequestDecorator
- (FMDActingRequestDecorator)init;
- (FMDActingRequestDecorator)initWithDeviceContextGenerator:(id)a3 deviceInfoGenerator:(id)a4 serverContextGenerator:(id)a5 requestHeaderGenerator:(id)a6;
- (id)deviceContextGenerator;
- (id)deviceInfoGenerator;
- (id)registerDeviceContextForAccount:(id)a3;
- (id)requestHeaderGenerator;
- (id)serverContextGenerator;
- (id)standardDeviceContext;
- (void)setDeviceContextGenerator:(id)a3;
- (void)setDeviceInfoGenerator:(id)a3;
- (void)setRequestHeaderGenerator:(id)a3;
- (void)setServerContextGenerator:(id)a3;
@end

@implementation FMDActingRequestDecorator

- (FMDActingRequestDecorator)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDActingRequestDecorator;
  v2 = [(FMDActingRequestDecorator *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(FMDActingRequestDecorator *)v2 setDeviceContextGenerator:&stru_1002DB1C0];
    [(FMDActingRequestDecorator *)v3 setDeviceInfoGenerator:&stru_1002DB1C0];
    [(FMDActingRequestDecorator *)v3 setServerContextGenerator:&stru_1002DB1C0];
    [(FMDActingRequestDecorator *)v3 setRequestHeaderGenerator:&stru_1002DB1C0];
  }
  return v3;
}

- (FMDActingRequestDecorator)initWithDeviceContextGenerator:(id)a3 deviceInfoGenerator:(id)a4 serverContextGenerator:(id)a5 requestHeaderGenerator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(FMDActingRequestDecorator *)self init];
  v15 = v14;
  if (v14)
  {
    id deviceContextGenerator = v10;
    if (!v10) {
      id deviceContextGenerator = v14->_deviceContextGenerator;
    }
    [(FMDActingRequestDecorator *)v14 setDeviceContextGenerator:deviceContextGenerator];
    id deviceInfoGenerator = v11;
    if (!v11) {
      id deviceInfoGenerator = v15->_deviceInfoGenerator;
    }
    [(FMDActingRequestDecorator *)v15 setDeviceInfoGenerator:deviceInfoGenerator];
    id serverContextGenerator = v12;
    if (!v12) {
      id serverContextGenerator = v15->_serverContextGenerator;
    }
    [(FMDActingRequestDecorator *)v15 setServerContextGenerator:serverContextGenerator];
    id requestHeaderGenerator = v13;
    if (!v13) {
      id requestHeaderGenerator = v15->_requestHeaderGenerator;
    }
    [(FMDActingRequestDecorator *)v15 setRequestHeaderGenerator:requestHeaderGenerator];
  }

  return v15;
}

- (id)registerDeviceContextForAccount:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(FMDActingRequestDecorator *)self standardDeviceContext];
  v6 = [v4 lastLoggedInDsid];

  [v5 fm_safelyMapKey:@"lastLoggedInDsid" toObject:v6];

  return v5;
}

- (id)standardDeviceContext
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[NSDate date];
  objc_super v5 = [v4 stringValueForServer];

  [v2 fm_safeSetObject:v5 forKey:@"deviceTS"];
  v6 = +[FMPreferencesUtil stringForKey:@"lastCommandId" inDomain:kFMDNotBackedUpPrefDomain];
  [v2 fm_safeSetObject:v6 forKey:@"lastCommandId"];

  return v2;
}

- (id)deviceContextGenerator
{
  return self->_deviceContextGenerator;
}

- (void)setDeviceContextGenerator:(id)a3
{
}

- (id)deviceInfoGenerator
{
  return self->_deviceInfoGenerator;
}

- (void)setDeviceInfoGenerator:(id)a3
{
}

- (id)serverContextGenerator
{
  return self->_serverContextGenerator;
}

- (void)setServerContextGenerator:(id)a3
{
}

- (id)requestHeaderGenerator
{
  return self->_requestHeaderGenerator;
}

- (void)setRequestHeaderGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestHeaderGenerator, 0);
  objc_storeStrong(&self->_serverContextGenerator, 0);
  objc_storeStrong(&self->_deviceInfoGenerator, 0);

  objc_storeStrong(&self->_deviceContextGenerator, 0);
}

@end