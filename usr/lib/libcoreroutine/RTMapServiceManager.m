@interface RTMapServiceManager
- (NSXPCConnection)xpcConnection;
- (RTMapServiceManager)init;
- (id)_proxyForServicingSelector:(SEL)a3 withErrorHandler:(id)a4;
- (id)mapItemWithIdentifier:(id)a3 geoMapItem:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 error:(id *)a7;
- (id)mapItemWithIdentifier:(id)a3 geoMapItemStorage:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 error:(id *)a7;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)createMapItemWithIdentifier:(id)a3 geoMapItemStorage:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 handler:(id)a7;
- (void)fetchAppClipURLsForMapItem:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchBuildingPolygonsFromLocation:(id)a3 radius:(double)a4 handler:(id)a5;
- (void)fetchCountryAndSubdivisionCodesFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemWithIdentifier:(id)a3 geoMapItem:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 handler:(id)a7;
- (void)fetchMapItemsFromAddressDictionary:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromAddressString:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromIdentifiers:(id)a3 options:(id)a4 source:(unint64_t)a5 handler:(id)a6;
- (void)fetchMapItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMapItemsFromLocations:(id)a3 accessPoints:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(id)a7 handler:(id)a8;
- (void)fetchMapItemsFromNaturalLanguageQuery:(id)a3 location:(id)a4 options:(id)a5 handler:(id)a6;
- (void)fetchMapItemsRelatedPlacesFromLocation:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchPointOfInterestAttributesWithIdentifier:(unint64_t)a3 options:(id)a4 handler:(id)a5;
- (void)fetchPointOfInterestsAroundCoordinate:(id)a3 radius:(double)a4 options:(id)a5 handler:(id)a6;
- (void)fetchPostalAddressForMapItem:(id)a3 options:(id)a4 handler:(id)a5;
- (void)setXpcConnection:(id)a3;
@end

@implementation RTMapServiceManager

- (void)fetchMapItemsFromIdentifiers:(id)a3 options:(id)a4 source:(unint64_t)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = [(RTNotifier *)self queue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__RTMapServiceManager_fetchMapItemsFromIdentifiers_options_source_handler___block_invoke;
  v18[3] = &unk_1E6B92D00;
  v18[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v21 = v13;
  SEL v22 = a2;
  unint64_t v23 = a5;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(v14, v18);
}

void __78__RTMapServiceManager_fetchMapItemsRelatedPlacesFromLocation_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__RTMapServiceManager_fetchMapItemsRelatedPlacesFromLocation_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchMapItemsRelatedPlacesFromLocation:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

void __75__RTMapServiceManager_fetchMapItemsFromIdentifiers_options_source_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__RTMapServiceManager_fetchMapItemsFromIdentifiers_options_source_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchMapItemsFromIdentifiers:*(void *)(a1 + 40) options:*(void *)(a1 + 48) source:*(void *)(a1 + 72) handler:*(void *)(a1 + 56)];
}

- (id)_proxyForServicingSelector:(SEL)a3 withErrorHandler:(id)a4
{
  id v6 = a4;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __67__RTMapServiceManager__proxyForServicingSelector_withErrorHandler___block_invoke;
  v22[3] = &unk_1E6B916B8;
  v22[4] = self;
  SEL v24 = a3;
  id v7 = v6;
  id v23 = v7;
  v8 = (void (**)(void, void))MEMORY[0x1E016DB00](v22);
  v9 = self->_xpcConnection;
  id v16 = v9;
  if (v9)
  {
    id v17 = [(NSXPCConnection *)v9 remoteObjectProxyWithErrorHandler:v8];
    if (v17) {
      goto LABEL_6;
    }
    v18 = @"no remote object proxy";
  }
  else
  {
    v18 = @"no xpc connection";
  }
  id v19 = RTErrorConnectionCreate(a3, v18, v10, v11, v12, v13, v14, v15, v21);
  ((void (**)(void, void *))v8)[2](v8, v19);

  id v17 = 0;
LABEL_6:

  return v17;
}

- (void)fetchMapItemsRelatedPlacesFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__RTMapServiceManager_fetchMapItemsRelatedPlacesFromLocation_options_handler___block_invoke;
  block[3] = &unk_1E6B923E8;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

- (RTMapServiceManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTMapServiceManager;
  v2 = [(RTNotifier *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(RTService *)v2 setup];
  }
  return v3;
}

- (void)_setup
{
  uint64_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.CoreRoutine.helperservice"];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  objc_super v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34A5330];
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v5];

  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __29__RTMapServiceManager__setup__block_invoke;
  v30[3] = &unk_1E6B91900;
  objc_copyWeak(&v31, &location);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v30];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  id v14 = [v6 setWithObjects:v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0];
  id v15 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v15 setClasses:v14 forSelector:sel_fetchMapItemsFromNaturalLanguageQuery_location_options_handler_ argumentIndex:0 ofReply:1];

  id v16 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v16 setClasses:v14 forSelector:sel_fetchMapItemsFromLocation_options_handler_ argumentIndex:0 ofReply:1];

  id v17 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v17 setClasses:v14 forSelector:sel_fetchMapItemsRelatedPlacesFromLocation_options_handler_ argumentIndex:0 ofReply:1];

  id v18 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v18 setClasses:v14 forSelector:sel_fetchMapItemsRelatedPlacesFromLocation_options_handler_ argumentIndex:1 ofReply:1];

  id v19 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v19 setClasses:v14 forSelector:sel_fetchMapItemsFromIdentifiers_options_source_handler_ argumentIndex:0 ofReply:1];

  SEL v20 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v20 setClasses:v14 forSelector:sel_fetchMapItemsFromLocations_accessPoints_startDate_endDate_options_handler_ argumentIndex:0 ofReply:1];

  uint64_t v21 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v21 setClasses:v14 forSelector:sel_fetchMapItemsFromAddressString_options_handler_ argumentIndex:0 ofReply:1];

  SEL v22 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v22 setClasses:v14 forSelector:sel_fetchMapItemsFromAddressDictionary_options_handler_ argumentIndex:0 ofReply:1];

  id v23 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v23 setClasses:v14 forSelector:sel_fetchPostalAddressForMapItem_options_handler_ argumentIndex:0 ofReply:1];

  SEL v24 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v24 setClasses:v14 forSelector:sel_fetchAppClipURLsForMapItem_options_handler_ argumentIndex:0 ofReply:1];

  v25 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v25 setClasses:v14 forSelector:sel_createMapItemWithIdentifier_geoMapItemStorage_source_creationDate_handler_ argumentIndex:0 ofReply:1];

  v26 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v26 setClasses:v14 forSelector:sel_fetchCountryAndSubdivisionCodesFromLocation_options_handler_ argumentIndex:0 ofReply:1];

  v27 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v27 setClasses:v14 forSelector:sel_fetchBuildingPolygonsFromLocation_radius_handler_ argumentIndex:0 ofReply:1];

  v28 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v28 setClasses:v14 forSelector:sel_fetchPointOfInterestAttributesWithIdentifier_options_handler_ argumentIndex:0 ofReply:1];

  v29 = [(NSXPCConnection *)self->_xpcConnection remoteObjectInterface];
  [v29 setClasses:v14 forSelector:sel_fetchPointOfInterestsAroundCoordinate_radius_options_handler_ argumentIndex:0 ofReply:1];

  [(NSXPCConnection *)self->_xpcConnection resume];
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __29__RTMapServiceManager__setup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setXpcConnection:0];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v5 = a3;
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    v4 = v5;
  }
}

void __67__RTMapServiceManager__proxyForServicingSelector_withErrorHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = RTErrorConnectionCreate(*(const char **)(a1 + 48), @"%@", a3, a4, a5, a6, a7, a8, a2);
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityMapService);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v9;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);
  }
}

- (void)fetchMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__RTMapServiceManager_fetchMapItemFromHandle_options_handler___block_invoke;
  block[3] = &unk_1E6B923E8;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __62__RTMapServiceManager_fetchMapItemFromHandle_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__RTMapServiceManager_fetchMapItemFromHandle_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchMapItemFromHandle:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

uint64_t __62__RTMapServiceManager_fetchMapItemFromHandle_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchMapItemsFromNaturalLanguageQuery:(id)a3 location:(id)a4 options:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(RTNotifier *)self queue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__RTMapServiceManager_fetchMapItemsFromNaturalLanguageQuery_location_options_handler___block_invoke;
  v20[3] = &unk_1E6B92140;
  id v24 = v14;
  SEL v25 = a2;
  v20[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v14;
  dispatch_async(v15, v20);
}

void __86__RTMapServiceManager_fetchMapItemsFromNaturalLanguageQuery_location_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__RTMapServiceManager_fetchMapItemsFromNaturalLanguageQuery_location_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 64);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchMapItemsFromNaturalLanguageQuery:*(void *)(a1 + 40) location:*(void *)(a1 + 48) options:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

uint64_t __86__RTMapServiceManager_fetchMapItemsFromNaturalLanguageQuery_location_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchMapItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTMapServiceManager_fetchMapItemsFromLocation_options_handler___block_invoke;
  block[3] = &unk_1E6B923E8;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __65__RTMapServiceManager_fetchMapItemsFromLocation_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__RTMapServiceManager_fetchMapItemsFromLocation_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchMapItemsFromLocation:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

uint64_t __65__RTMapServiceManager_fetchMapItemsFromLocation_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __78__RTMapServiceManager_fetchMapItemsRelatedPlacesFromLocation_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

uint64_t __75__RTMapServiceManager_fetchMapItemsFromIdentifiers_options_source_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchMapItemsFromLocations:(id)a3 accessPoints:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(id)a7 handler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = [(RTNotifier *)self queue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __97__RTMapServiceManager_fetchMapItemsFromLocations_accessPoints_startDate_endDate_options_handler___block_invoke;
  v28[3] = &unk_1E6B9AB58;
  id v34 = v20;
  SEL v35 = a2;
  v28[4] = self;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v22 = v19;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  id v27 = v20;
  dispatch_async(v21, v28);
}

void __97__RTMapServiceManager_fetchMapItemsFromLocations_accessPoints_startDate_endDate_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__RTMapServiceManager_fetchMapItemsFromLocations_accessPoints_startDate_endDate_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 88);
  id v6 = *(id *)(a1 + 80);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchMapItemsFromLocations:*(void *)(a1 + 40) accessPoints:*(void *)(a1 + 48) startDate:*(void *)(a1 + 56) endDate:*(void *)(a1 + 64) options:*(void *)(a1 + 72) handler:*(void *)(a1 + 80)];
}

uint64_t __97__RTMapServiceManager_fetchMapItemsFromLocations_accessPoints_startDate_endDate_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchMapItemsFromAddressString:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTMapServiceManager_fetchMapItemsFromAddressString_options_handler___block_invoke;
  block[3] = &unk_1E6B923E8;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __70__RTMapServiceManager_fetchMapItemsFromAddressString_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__RTMapServiceManager_fetchMapItemsFromAddressString_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchMapItemsFromAddressString:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

uint64_t __70__RTMapServiceManager_fetchMapItemsFromAddressString_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchMapItemsFromAddressDictionary:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__RTMapServiceManager_fetchMapItemsFromAddressDictionary_options_handler___block_invoke;
  block[3] = &unk_1E6B923E8;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __74__RTMapServiceManager_fetchMapItemsFromAddressDictionary_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__RTMapServiceManager_fetchMapItemsFromAddressDictionary_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchMapItemsFromAddressDictionary:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

uint64_t __74__RTMapServiceManager_fetchMapItemsFromAddressDictionary_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchPostalAddressForMapItem:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTMapServiceManager_fetchPostalAddressForMapItem_options_handler___block_invoke;
  block[3] = &unk_1E6B923E8;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __68__RTMapServiceManager_fetchPostalAddressForMapItem_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__RTMapServiceManager_fetchPostalAddressForMapItem_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchPostalAddressForMapItem:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

uint64_t __68__RTMapServiceManager_fetchPostalAddressForMapItem_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchAppClipURLsForMapItem:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__RTMapServiceManager_fetchAppClipURLsForMapItem_options_handler___block_invoke;
  block[3] = &unk_1E6B923E8;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __66__RTMapServiceManager_fetchAppClipURLsForMapItem_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__RTMapServiceManager_fetchAppClipURLsForMapItem_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchAppClipURLsForMapItem:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

uint64_t __66__RTMapServiceManager_fetchAppClipURLsForMapItem_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)createMapItemWithIdentifier:(id)a3 geoMapItemStorage:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__RTMapServiceManager_createMapItemWithIdentifier_geoMapItemStorage_source_creationDate_handler___block_invoke;
  block[3] = &unk_1E6B99738;
  id v26 = v16;
  SEL v27 = a2;
  block[4] = self;
  id v23 = v13;
  unint64_t v28 = a5;
  id v24 = v14;
  id v25 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v16;
  dispatch_async(v17, block);
}

void __97__RTMapServiceManager_createMapItemWithIdentifier_geoMapItemStorage_source_creationDate_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__RTMapServiceManager_createMapItemWithIdentifier_geoMapItemStorage_source_creationDate_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 64);
  v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 createMapItemWithIdentifier:*(void *)(a1 + 40) geoMapItemStorage:*(void *)(a1 + 48) source:*(void *)(a1 + 80) creationDate:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

uint64_t __97__RTMapServiceManager_createMapItemWithIdentifier_geoMapItemStorage_source_creationDate_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (id)mapItemWithIdentifier:(id)a3 geoMapItemStorage:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 error:(id *)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__125;
  v52 = __Block_byref_object_dispose__125;
  id v53 = 0;
  uint64_t v42 = 0;
  v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__125;
  v46 = __Block_byref_object_dispose__125;
  id v47 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __89__RTMapServiceManager_mapItemWithIdentifier_geoMapItemStorage_source_creationDate_error___block_invoke;
  v38[3] = &unk_1E6B920F0;
  v40 = &v48;
  v41 = &v42;
  id v15 = v14;
  v39 = v15;
  v36 = v11;
  [(RTMapServiceManager *)self createMapItemWithIdentifier:v11 geoMapItemStorage:v12 source:a5 creationDate:v13 handler:v38];
  id v16 = v15;
  id v17 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v16, v18)) {
    goto LABEL_6;
  }
  id v19 = [MEMORY[0x1E4F1C9C8] now];
  [v19 timeIntervalSinceDate:v17];
  double v21 = v20;
  id v22 = objc_opt_new();
  id v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_99];
  id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v25 = [v24 filteredArrayUsingPredicate:v23];
  id v26 = [v25 firstObject];

  [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
  SEL v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  unint64_t v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v54 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v54 count:1];
  id v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

  if (v30)
  {
    id v31 = v30;

    char v32 = 0;
  }
  else
  {
LABEL_6:
    id v31 = 0;
    char v32 = 1;
  }

  id v33 = v31;
  if ((v32 & 1) == 0) {
    objc_storeStrong(v43 + 5, v31);
  }
  if (a7) {
    *a7 = v43[5];
  }
  id v34 = (id)v49[5];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v34;
}

void __89__RTMapServiceManager_mapItemWithIdentifier_geoMapItemStorage_source_creationDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchMapItemWithIdentifier:(id)a3 geoMapItem:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__RTMapServiceManager_fetchMapItemWithIdentifier_geoMapItem_source_creationDate_handler___block_invoke;
  block[3] = &unk_1E6B9AB80;
  id v23 = v14;
  id v24 = self;
  id v27 = v16;
  SEL v28 = a2;
  unint64_t v29 = a5;
  id v25 = v13;
  id v26 = v15;
  id v18 = v15;
  id v19 = v13;
  id v20 = v16;
  id v21 = v14;
  dispatch_async(v17, block);
}

void __89__RTMapServiceManager_fetchMapItemWithIdentifier_geoMapItem_source_creationDate_handler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F646E0] mapItemStorageForGEOMapItem:*(void *)(a1 + 32)];
  uint64_t v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__RTMapServiceManager_fetchMapItemWithIdentifier_geoMapItem_source_creationDate_handler___block_invoke_2;
  v6[3] = &unk_1E6B90C18;
  uint64_t v4 = *(void *)(a1 + 72);
  id v7 = *(id *)(a1 + 64);
  id v5 = [v3 _proxyForServicingSelector:v4 withErrorHandler:v6];
  [v5 createMapItemWithIdentifier:*(void *)(a1 + 48) geoMapItemStorage:v2 source:*(void *)(a1 + 80) creationDate:*(void *)(a1 + 56) handler:*(void *)(a1 + 64)];
}

uint64_t __89__RTMapServiceManager_fetchMapItemWithIdentifier_geoMapItem_source_creationDate_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (id)mapItemWithIdentifier:(id)a3 geoMapItem:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 error:(id *)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__125;
  v52 = __Block_byref_object_dispose__125;
  id v53 = 0;
  uint64_t v42 = 0;
  v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__125;
  v46 = __Block_byref_object_dispose__125;
  id v47 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __82__RTMapServiceManager_mapItemWithIdentifier_geoMapItem_source_creationDate_error___block_invoke;
  v38[3] = &unk_1E6B920F0;
  v40 = &v48;
  v41 = &v42;
  id v15 = v14;
  v39 = v15;
  v36 = v11;
  [(RTMapServiceManager *)self fetchMapItemWithIdentifier:v11 geoMapItem:v12 source:a5 creationDate:v13 handler:v38];
  id v16 = v15;
  id v17 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v16, v18)) {
    goto LABEL_6;
  }
  id v19 = [MEMORY[0x1E4F1C9C8] now];
  [v19 timeIntervalSinceDate:v17];
  double v21 = v20;
  id v22 = objc_opt_new();
  id v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_99];
  id v24 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v25 = [v24 filteredArrayUsingPredicate:v23];
  id v26 = [v25 firstObject];

  [v22 submitToCoreAnalytics:v26 type:1 duration:v21];
  id v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  SEL v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v54 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  unint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v54 count:1];
  id v30 = [v28 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v29];

  if (v30)
  {
    id v31 = v30;

    char v32 = 0;
  }
  else
  {
LABEL_6:
    id v31 = 0;
    char v32 = 1;
  }

  id v33 = v31;
  if ((v32 & 1) == 0) {
    objc_storeStrong(v43 + 5, v31);
  }
  if (a7) {
    *a7 = v43[5];
  }
  id v34 = (id)v49[5];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v34;
}

void __82__RTMapServiceManager_mapItemWithIdentifier_geoMapItem_source_creationDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchCountryAndSubdivisionCodesFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__RTMapServiceManager_fetchCountryAndSubdivisionCodesFromLocation_options_handler___block_invoke;
  block[3] = &unk_1E6B923E8;
  id v19 = v11;
  SEL v20 = a2;
  void block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __83__RTMapServiceManager_fetchCountryAndSubdivisionCodesFromLocation_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__RTMapServiceManager_fetchCountryAndSubdivisionCodesFromLocation_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  uint64_t v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchCountryAndSubdivisionCodesFromLocation:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

uint64_t __83__RTMapServiceManager_fetchCountryAndSubdivisionCodesFromLocation_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchBuildingPolygonsFromLocation:(id)a3 radius:(double)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__RTMapServiceManager_fetchBuildingPolygonsFromLocation_radius_handler___block_invoke;
  block[3] = &unk_1E6B908B8;
  id v16 = v10;
  SEL v17 = a2;
  void block[4] = self;
  id v15 = v9;
  double v18 = a4;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);
}

void __72__RTMapServiceManager_fetchBuildingPolygonsFromLocation_radius_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__RTMapServiceManager_fetchBuildingPolygonsFromLocation_radius_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  uint64_t v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchBuildingPolygonsFromLocation:*(void *)(a1 + 40) radius:*(void *)(a1 + 48) handler:*(double *)(a1 + 64)];
}

uint64_t __72__RTMapServiceManager_fetchBuildingPolygonsFromLocation_radius_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchPointOfInterestAttributesWithIdentifier:(unint64_t)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__RTMapServiceManager_fetchPointOfInterestAttributesWithIdentifier_options_handler___block_invoke;
  block[3] = &unk_1E6B908B8;
  id v16 = v10;
  SEL v17 = a2;
  unint64_t v18 = a3;
  void block[4] = self;
  id v15 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, block);
}

void __84__RTMapServiceManager_fetchPointOfInterestAttributesWithIdentifier_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__RTMapServiceManager_fetchPointOfInterestAttributesWithIdentifier_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  uint64_t v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchPointOfInterestAttributesWithIdentifier:*(void *)(a1 + 64) options:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __84__RTMapServiceManager_fetchPointOfInterestAttributesWithIdentifier_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchPointOfInterestsAroundCoordinate:(id)a3 radius:(double)a4 options:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(RTNotifier *)self queue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__RTMapServiceManager_fetchPointOfInterestsAroundCoordinate_radius_options_handler___block_invoke;
  v18[3] = &unk_1E6B92D00;
  id v21 = v13;
  SEL v22 = a2;
  v18[4] = self;
  id v19 = v11;
  double v23 = a4;
  id v20 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(v14, v18);
}

void __84__RTMapServiceManager_fetchPointOfInterestsAroundCoordinate_radius_options_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__RTMapServiceManager_fetchPointOfInterestsAroundCoordinate_radius_options_handler___block_invoke_2;
  v5[3] = &unk_1E6B90C18;
  uint64_t v3 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  uint64_t v4 = [v2 _proxyForServicingSelector:v3 withErrorHandler:v5];
  [v4 fetchPointOfInterestsAroundCoordinate:*(void *)(a1 + 40) radius:*(void *)(a1 + 48) options:*(void *)(a1 + 56) handler:*(double *)(a1 + 72)];
}

uint64_t __84__RTMapServiceManager_fetchPointOfInterestsAroundCoordinate_radius_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end