@interface TVRViewServiceConfigContext
- (NSDictionary)userInfo;
- (NSString)deviceIdentifier;
- (NSString)lastActiveEndpointIdentifier;
- (TVRViewServiceConfigContext)init;
- (TVRViewServiceConfigContext)initWithDeviceIdentifier:(id)a3 identifierType:(int64_t)a4 deviceType:(int64_t)a5 launchContext:(int64_t)a6;
- (TVRViewServiceConfigContext)initWithDeviceIdentifier:(id)a3 identifierType:(int64_t)a4 deviceType:(int64_t)a5 launchContext:(int64_t)a6 launchMethod:(int64_t)a7;
- (id)_initWithLaunchContext:(int64_t)a3;
- (id)_initWithUserInfo:(id)a3;
- (id)description;
- (id)dismissalAnimations;
- (id)presentationAnimations;
- (int64_t)deviceIdentifierType;
- (int64_t)deviceType;
- (int64_t)launchContext;
- (int64_t)launchMethod;
- (unint64_t)dismissalType;
- (void)_commonInit;
- (void)setDismissalAnimations:(id)a3;
- (void)setDismissalType:(unint64_t)a3;
- (void)setLastActiveEndpointIdentifier:(id)a3;
- (void)setPresentationAnimations:(id)a3;
@end

@implementation TVRViewServiceConfigContext

- (TVRViewServiceConfigContext)init
{
  return 0;
}

- (id)_initWithLaunchContext:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TVRViewServiceConfigContext;
  v4 = [(TVRViewServiceConfigContext *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(TVRViewServiceConfigContext *)v4 _commonInit];
    v5->_deviceIdentifierType = TVRViewServiceDeviceIdentifierTypeNone;
    v5->_deviceType = 0;
    v5->_launchContext = a3;
    v5->_launchMethod = 1;
  }
  return v5;
}

- (id)_initWithUserInfo:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TVRViewServiceConfigContext;
  v5 = [(TVRViewServiceConfigContext *)&v31 init];
  v6 = v5;
  if (v5)
  {
    [(TVRViewServiceConfigContext *)v5 _commonInit];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"deviceIdentifier"];
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v7;

    v9 = _TVRUIViewServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v6->_deviceIdentifier;
      *(_DWORD *)buf = 138412290;
      unint64_t v33 = (unint64_t)v10;
      _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_DEFAULT, "Received device id %@", buf, 0xCu);
    }

    v11 = [v4 objectForKeyedSubscript:@"deviceIdentifierType"];
    v6->_int64_t deviceIdentifierType = [v11 integerValue];
    v12 = _TVRUIViewServiceLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int64_t deviceIdentifierType = v6->_deviceIdentifierType;
      *(_DWORD *)buf = 134217984;
      unint64_t v33 = deviceIdentifierType;
      _os_log_impl(&dword_227326000, v12, OS_LOG_TYPE_DEFAULT, "Received device id type %ld", buf, 0xCu);
    }

    v14 = [v4 objectForKeyedSubscript:@"deviceType"];
    v6->_int64_t deviceType = [v14 integerValue];
    v15 = _TVRUIViewServiceLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int64_t deviceType = v6->_deviceType;
      *(_DWORD *)buf = 134217984;
      unint64_t v33 = deviceType;
      _os_log_impl(&dword_227326000, v15, OS_LOG_TYPE_DEFAULT, "Received device type %ld", buf, 0xCu);
    }

    v17 = [v4 objectForKeyedSubscript:@"launchContext"];
    v6->_int64_t launchContext = [v17 integerValue];
    v18 = _TVRUIViewServiceLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int64_t launchContext = v6->_launchContext;
      *(_DWORD *)buf = 134217984;
      unint64_t v33 = launchContext;
      _os_log_impl(&dword_227326000, v18, OS_LOG_TYPE_DEFAULT, "Received lauch context %ld", buf, 0xCu);
    }

    v20 = [v4 objectForKeyedSubscript:@"dismissalType"];
    v6->_unint64_t dismissalType = [v20 unsignedIntegerValue];
    v21 = _TVRUIViewServiceLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t dismissalType = v6->_dismissalType;
      *(_DWORD *)buf = 134217984;
      unint64_t v33 = dismissalType;
      _os_log_impl(&dword_227326000, v21, OS_LOG_TYPE_DEFAULT, "Received dismissal type %ld", buf, 0xCu);
    }

    uint64_t v23 = [v4 objectForKeyedSubscript:@"lastActiveIdentifier"];
    lastActiveEndpointIdentifier = v6->_lastActiveEndpointIdentifier;
    v6->_lastActiveEndpointIdentifier = (NSString *)v23;

    v25 = _TVRUIViewServiceLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v6->_lastActiveEndpointIdentifier;
      *(_DWORD *)buf = 138412290;
      unint64_t v33 = (unint64_t)v26;
      _os_log_impl(&dword_227326000, v25, OS_LOG_TYPE_DEFAULT, "Received last active endpoint id %@", buf, 0xCu);
    }

    v27 = [v4 objectForKeyedSubscript:@"launchMethod"];
    v6->_int64_t launchMethod = [v27 integerValue];
    v28 = _TVRUIViewServiceLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int64_t launchMethod = v6->_launchMethod;
      *(_DWORD *)buf = 134217984;
      unint64_t v33 = launchMethod;
      _os_log_impl(&dword_227326000, v28, OS_LOG_TYPE_DEFAULT, "Received launch method %ld", buf, 0xCu);
    }
  }
  return v6;
}

- (TVRViewServiceConfigContext)initWithDeviceIdentifier:(id)a3 identifierType:(int64_t)a4 deviceType:(int64_t)a5 launchContext:(int64_t)a6
{
  return [(TVRViewServiceConfigContext *)self initWithDeviceIdentifier:a3 identifierType:a4 deviceType:a5 launchContext:a6 launchMethod:1];
}

- (TVRViewServiceConfigContext)initWithDeviceIdentifier:(id)a3 identifierType:(int64_t)a4 deviceType:(int64_t)a5 launchContext:(int64_t)a6 launchMethod:(int64_t)a7
{
  id v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TVRViewServiceConfigContext;
  v13 = [(TVRViewServiceConfigContext *)&v18 init];
  v14 = v13;
  if (v13)
  {
    [(TVRViewServiceConfigContext *)v13 _commonInit];
    uint64_t v15 = [v12 copy];
    deviceIdentifier = v14->_deviceIdentifier;
    v14->_deviceIdentifier = (NSString *)v15;

    v14->_int64_t deviceIdentifierType = a4;
    v14->_int64_t deviceType = a5;
    v14->_int64_t launchContext = a6;
    v14->_int64_t launchMethod = a7;
  }

  return v14;
}

- (NSDictionary)userInfo
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(TVRViewServiceConfigContext *)self deviceIdentifier];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(TVRViewServiceConfigContext *)self deviceIdentifier];
    [v3 setObject:v6 forKeyedSubscript:@"deviceIdentifier"];
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[TVRViewServiceConfigContext deviceIdentifierType](self, "deviceIdentifierType"));
  [v3 setObject:v7 forKeyedSubscript:@"deviceIdentifierType"];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[TVRViewServiceConfigContext deviceType](self, "deviceType"));
  [v3 setObject:v8 forKeyedSubscript:@"deviceType"];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[TVRViewServiceConfigContext launchContext](self, "launchContext"));
  [v3 setObject:v9 forKeyedSubscript:@"launchContext"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TVRViewServiceConfigContext dismissalType](self, "dismissalType"));
  [v3 setObject:v10 forKeyedSubscript:@"dismissalType"];

  v11 = [(TVRViewServiceConfigContext *)self lastActiveEndpointIdentifier];

  if (v11)
  {
    id v12 = [(TVRViewServiceConfigContext *)self lastActiveEndpointIdentifier];
    [v3 setObject:v12 forKeyedSubscript:@"lastActiveIdentifier"];
  }
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[TVRViewServiceConfigContext launchMethod](self, "launchMethod"));
  [v3 setObject:v13 forKeyedSubscript:@"launchMethod"];

  v14 = [NSDictionary dictionaryWithDictionary:v3];

  return (NSDictionary *)v14;
}

- (id)description
{
  v2 = NSString;
  v3 = [(TVRViewServiceConfigContext *)self userInfo];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (void)_commonInit
{
  self->_unint64_t dismissalType = 1;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)deviceIdentifierType
{
  return self->_deviceIdentifierType;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (int64_t)launchContext
{
  return self->_launchContext;
}

- (int64_t)launchMethod
{
  return self->_launchMethod;
}

- (id)presentationAnimations
{
  return self->_presentationAnimations;
}

- (void)setPresentationAnimations:(id)a3
{
}

- (id)dismissalAnimations
{
  return self->_dismissalAnimations;
}

- (void)setDismissalAnimations:(id)a3
{
}

- (unint64_t)dismissalType
{
  return self->_dismissalType;
}

- (void)setDismissalType:(unint64_t)a3
{
  self->_unint64_t dismissalType = a3;
}

- (NSString)lastActiveEndpointIdentifier
{
  return self->_lastActiveEndpointIdentifier;
}

- (void)setLastActiveEndpointIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveEndpointIdentifier, 0);
  objc_storeStrong(&self->_dismissalAnimations, 0);
  objc_storeStrong(&self->_presentationAnimations, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end