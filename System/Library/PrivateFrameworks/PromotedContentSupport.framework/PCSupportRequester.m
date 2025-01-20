@interface PCSupportRequester
+ (BOOL)canShareConnection;
+ (id)machService;
- (PCSupportRequester)init;
- (id)fetchGenderAndAgeGroupData;
- (id)remoteObjectInterface;
- (void)addClientToSegments:(id)a3 replaceExisting:(BOOL)a4 privateSegment:(BOOL)a5;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)fetchConfigurationForClass:(id)a3 completion:(id)a4;
- (void)fetchGenderAndAgeGroupData:(id)a3;
- (void)invokeTestingRigHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5;
- (void)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5 completion:(id)a6;
- (void)policiesToEnforce:(id)a3;
@end

@implementation PCSupportRequester

- (PCSupportRequester)init
{
  v3.receiver = self;
  v3.super_class = (Class)PCSupportRequester;
  return [(APXPCActionRequester *)&v3 init];
}

- (void)fetchConfigurationForClass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(APXPCActionRequester *)self remoteObjectProxy];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_220C1D190;
  v11[3] = &unk_26457C0B8;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 fetchConfigurationForClass:v9 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

+ (id)machService
{
  return @"com.apple.ap.promotedcontent.supportinterface";
}

+ (BOOL)canShareConnection
{
  return 1;
}

- (id)remoteObjectInterface
{
  return &unk_26D2ABA48;
}

- (void)addClientToSegments:(id)a3 replaceExisting:(BOOL)a4 privateSegment:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if ([v9 count] || v6)
  {
    v8 = [(APXPCActionRequester *)self remoteObjectProxy];
    [v8 addClientToSegments:v9 replaceExisting:v6 privateSegment:v5];
  }
}

- (id)fetchGenderAndAgeGroupData
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_220C1DEC8;
  v11 = sub_220C1DED8;
  id v12 = 0;
  objc_super v3 = [(APXPCActionRequester *)self synchronousRemoteObjectProxyWithErrorHandler:&unk_26D2A87A0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_220C1DF90;
  v6[3] = &unk_26457C040;
  v6[4] = &v7;
  [v3 fetchGenderAndAgeGroupData:v6];
  [(APXPCActionRequester *)self finished];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)fetchGenderAndAgeGroupData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(APXPCActionRequester *)self remoteObjectProxy];
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_220C1E1A8;
    v6[3] = &unk_26457C068;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [v5 fetchGenderAndAgeGroupData:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = [(APXPCActionRequester *)self remoteObjectProxy];
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_220C1E400;
    v15[3] = &unk_26457C090;
    objc_copyWeak(&v17, &location);
    id v16 = v13;
    [v14 policiesForContainerType:v10 adType:v11 adFormatType:v12 completion:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)policiesToEnforce:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(APXPCActionRequester *)self remoteObjectProxy];
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_220C1E614;
    v6[3] = &unk_26457C090;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [v5 policiesToEnforce:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)invokeTestingRigHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x263F20B88] isAppleInternalInstall])
  {
    id v11 = [(APXPCActionRequester *)self remoteObjectProxy];
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_220C1E87C;
    v12[3] = &unk_26457C0E0;
    id v13 = v10;
    objc_copyWeak(&v14, &location);
    [v11 invokeTestingRigHandlerForMessage:v8 payload:v9 completionHandler:v12];
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)connectionInterrupted
{
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_220C1C000, v2, OS_LOG_TYPE_ERROR, "Connection to PCSupport in Daemon was interrupted.", v3, 2u);
  }
}

- (void)connectionInvalidated
{
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_220C1C000, v2, OS_LOG_TYPE_INFO, "Connection to PCSupport in Daemon was invalidated.", v3, 2u);
  }
}

@end