@interface PCSupportReceiver
- (APXPCConnection)connection;
- (PCSupportReceiver)initWithConnection:(id)a3;
- (Protocol)exportedInterface;
- (id)requiredEntitlements;
- (void)addClientToSegments:(id)a3 replaceExisting:(BOOL)a4 privateSegment:(BOOL)a5;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)extendCollectionClassesForExportedInterface:(id)a3;
- (void)fetchConfigurationForClass:(id)a3 completion:(id)a4;
- (void)fetchGenderAndAgeGroupData:(id)a3;
- (void)finishedWithRequests;
- (void)invokeTestingRigHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5;
- (void)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5 completion:(id)a6;
- (void)policiesToEnforce:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation PCSupportReceiver

- (PCSupportReceiver)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCSupportReceiver;
  v6 = [(PCSupportReceiver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)connectionInvalidated
{
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Connection to client for PromotedContentSupport was invalidated.", v4, 2u);
  }

  [(PCSupportReceiver *)self finishedWithRequests];
}

- (void)extendCollectionClassesForExportedInterface:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setClasses:v6 forSelector:"addClientToSegments:replaceExisting:privateSegment:" argumentIndex:0 ofReply:0];
}

- (void)fetchConfigurationForClass:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, void *))a4;
  id v7 = +[APConfigurationMediator configurationForClass:NSClassFromString((NSString *)a3) usingCache:0];
  id v6 = [v7 configDictionary];
  v5[2](v5, v6);
}

- (void)setConnection:(id)a3
{
}

- (id)requiredEntitlements
{
  return +[NSArray arrayWithObject:@"com.apple.private.iad.news-client"];
}

- (void)finishedWithRequests
{
}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___PCSupportDaemonInterface;
}

- (void).cxx_destruct
{
}

- (void)addClientToSegments:(id)a3 replaceExisting:(BOOL)a4 privateSegment:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)ADTrackingTransparency);
  unsigned int v10 = [v9 personalizedAds];

  if (v10)
  {
    v11 = [v8 componentsJoinedByString:@","];
    v12 = +[NSUUID UUID];
    v13 = objc_alloc_init(APThirdPartySegmentUpdateLegacyInterface);
    v14 = [(PCSupportReceiver *)self connection];
    v15 = [v14 bundleID];
    [(APThirdPartySegmentUpdateLegacyInterface *)v13 addClientToSegments:v8 token:v12 bundleID:v15 replaceExisting:v6 privateSegment:v5];

    v16 = APLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = [v12 UUIDString];
      int v18 = 138543619;
      v19 = v17;
      __int16 v20 = 2113;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@ Add client to segments: %{private}@.", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Unable to update third-party segment data due to disabled Personalized Ads.", (uint8_t *)&v18, 2u);
    }
  }

  [(PCSupportReceiver *)self finishedWithRequests];
}

- (void)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5 completion:(id)a6
{
  id v9 = (void (**)(id, id))a6;
  id v10 = +[APPCPolicyEngine policiesForContainerType:a3 adType:a4 adFormatType:a5];
  v9[2](v9, v10);
}

- (void)policiesToEnforce:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = +[APPCPolicyEngine policiesToEnforce];
  v3[2](v3, v4);
}

- (void)fetchGenderAndAgeGroupData:(id)a3
{
  +[APIDAccountProvider fetchGenderAndAgeData:0 completionHandler:a3];

  [(PCSupportReceiver *)self finishedWithRequests];
}

- (void)invokeTestingRigHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[APTestingRig sharedInstance];
  [v10 invokeHandlerForMessage:v9 payload:v8 completionHandler:v7];
}

- (void)connectionInterrupted
{
  id v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Connection to client for PromotedContentSupport was interrupted.", v4, 2u);
  }

  [(PCSupportReceiver *)self finishedWithRequests];
}

- (APXPCConnection)connection
{
  return self->_connection;
}

@end