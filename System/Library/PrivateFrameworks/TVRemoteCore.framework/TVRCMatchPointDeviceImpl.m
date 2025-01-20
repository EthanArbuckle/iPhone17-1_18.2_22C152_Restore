@interface TVRCMatchPointDeviceImpl
+ (id)implWithService:(id)a3;
- (BOOL)supportsDirectCaptionQueries;
- (BOOL)supportsFindMyRemote;
- (BOOL)supportsTouchEvents;
- (NSString)description;
- (TVRCHMServiceWrapper)service;
- (TVRCMatchPointDeviceImpl)initWithService:(id)a3;
- (_TVRCDeviceImplDelegate)delegate;
- (id)alternateIdentifiers;
- (id)identifier;
- (id)keyboardController;
- (id)model;
- (id)name;
- (id)supportedButtons;
- (int64_t)connectionType;
- (unint64_t)pairingCapability;
- (unint64_t)priority;
- (void)connect;
- (void)connectedToService:(id)a3;
- (void)disconnect;
- (void)disconnectedFromService:(id)a3 error:(id)a4;
- (void)sendButtonEvent:(id)a3;
- (void)service:(id)a3 updatedName:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setService:(id)a3;
@end

@implementation TVRCMatchPointDeviceImpl

+ (id)implWithService:(id)a3
{
  id v3 = a3;
  v4 = [[TVRCMatchPointDeviceImpl alloc] initWithService:v3];

  return v4;
}

- (TVRCMatchPointDeviceImpl)initWithService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRCMatchPointDeviceImpl;
  v6 = [(TVRCMatchPointDeviceImpl *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    [(TVRCHMServiceWrapper *)v7->_service setDelegate:v7];
    v7->_priority = 1;
  }

  return v7;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(TVRCMatchPointDeviceImpl *)self name];
  [v3 appendString:v4 withName:@"name"];

  id v5 = [v3 build];

  return (NSString *)v5;
}

- (BOOL)supportsDirectCaptionQueries
{
  return 0;
}

- (BOOL)supportsFindMyRemote
{
  return 0;
}

- (BOOL)supportsTouchEvents
{
  return 0;
}

- (id)name
{
  v2 = [(TVRCHMServiceWrapper *)self->_service name];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)identifier
{
  v2 = [(TVRCHMServiceWrapper *)self->_service identifier];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)alternateIdentifiers
{
  return 0;
}

- (id)model
{
  v2 = [(TVRCHMServiceWrapper *)self->_service model];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)supportedButtons
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v4 = [[TVRCButton alloc] _initWithButtonType:1];
  [v3 addObject:v4];

  id v5 = [[TVRCButton alloc] _initWithButtonType:12];
  [v3 addObject:v5];

  id v6 = [[TVRCButton alloc] _initWithButtonType:13];
  [v3 addObject:v6];

  id v7 = [[TVRCButton alloc] _initWithButtonType:14];
  [v3 addObject:v7];

  id v8 = [[TVRCButton alloc] _initWithButtonType:15];
  [v3 addObject:v8];

  id v9 = [[TVRCButton alloc] _initWithButtonType:5];
  [v3 addObject:v9];

  id v10 = [[TVRCButton alloc] _initWithButtonType:23];
  [v3 addObject:v10];

  id v11 = [[TVRCButton alloc] _initWithButtonType:24];
  [v3 addObject:v11];

  if ([(TVRCHMServiceWrapper *)self->_service supportsPowerButton])
  {
    id v12 = [[TVRCButton alloc] _initWithButtonType:30];
    [v3 addObject:v12];
  }
  if ([(TVRCHMServiceWrapper *)self->_service supportsInfoKey])
  {
    id v13 = [[TVRCButton alloc] _initWithButtonType:25];
    [v3 addObject:v13];
  }
  if ([(TVRCHMServiceWrapper *)self->_service supportsVolumeControl])
  {
    id v14 = [[TVRCButton alloc] _initWithButtonType:10];
    [v3 addObject:v14];

    id v15 = [[TVRCButton alloc] _initWithButtonType:11];
    [v3 addObject:v15];
  }
  if ([(TVRCHMServiceWrapper *)self->_service supportsMute])
  {
    id v16 = [[TVRCButton alloc] _initWithButtonType:29];
    [v3 addObject:v16];
  }
  v17 = (void *)[v3 copy];

  return v17;
}

- (void)connect
{
}

- (void)disconnect
{
}

- (void)sendButtonEvent:(id)a3
{
}

- (id)keyboardController
{
  return 0;
}

- (unint64_t)pairingCapability
{
  return 0;
}

- (int64_t)connectionType
{
  return 2;
}

- (void)connectedToService:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didConnectWithDevice:self];
}

- (void)disconnectedFromService:(id)a3 error:(id)a4
{
  uint64_t v5 = 4 * (a4 != 0);
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained device:self didDisconnectWithReason:v5 error:v7];
}

- (void)service:(id)a3 updatedName:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained device:self didUpdateName:v6];
}

- (unint64_t)priority
{
  return self->_priority;
}

- (_TVRCDeviceImplDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_TVRCDeviceImplDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRCHMServiceWrapper)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end