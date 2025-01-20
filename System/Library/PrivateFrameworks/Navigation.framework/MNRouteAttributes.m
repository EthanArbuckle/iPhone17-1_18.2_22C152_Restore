@interface MNRouteAttributes
+ (BOOL)supportsSecureCoding;
+ (void)_loadLPRRulesForWaypoints:(id)a3 forceUpdate:(BOOL)a4 queue:(id)a5 completion:(id)a6;
- (BOOL)hasResolvedRules;
- (BOOL)shouldRetryForError:(id)a3;
- (MNRouteAttributes)initWithAttributes:(id)a3 latLngs:(id)a4;
- (MNRouteAttributes)initWithAttributes:(id)a3 latLngs:(id)a4 isStepping:(BOOL)a5;
- (MNRouteAttributes)initWithAttributes:(id)a3 waypoints:(id)a4;
- (MNRouteAttributes)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)vehicle;
- (void)_commonInit;
- (void)_loadRulesIfNecessaryWithVehicle:(id)a3 queue:(id)a4 finishedHandler:(id)a5;
- (void)_populateRouteAttributesWithVehicle:(id)a3 finishedHandler:(id)a4;
- (void)_resolveSelectedVehicle:(id)a3;
- (void)buildRouteAttributes:(id)a3 queue:(id)a4 result:(id)a5;
- (void)buildRouteAttributes:(id)a3 result:(id)a4;
- (void)buildRouteAttributesForETAUpdateRequest:(id)a3 queue:(id)a4 result:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setHasResolvedRules:(BOOL)a3;
@end

@implementation MNRouteAttributes

- (MNRouteAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MNRouteAttributes;
  v5 = [(MNRouteAttributes *)&v13 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    [(MNRouteAttributes *)v5 _commonInit];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"LatLngs"];
    latLngs = v6->_latLngs;
    v6->_latLngs = (NSArray *)v10;

    v6->_isStepping = [v4 decodeBoolForKey:@"IsStepping"];
  }

  return v6;
}

- (void)_commonInit
{
  v3 = (geo_isolater *)geo_isolater_create();
  vehicleIsolator = self->_vehicleIsolator;
  self->_vehicleIsolator = v3;
  MEMORY[0x1F41817F8](v3, vehicleIsolator);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MNRouteAttributes;
  id v4 = a3;
  [(MNRouteAttributes *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_latLngs, @"LatLngs", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_isStepping forKey:@"IsStepping"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MNRouteAttributes;
  id v4 = [(MNRouteAttributes *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_latLngs copy];
  v6 = (void *)*((void *)v4 + 28);
  *((void *)v4 + 28) = v5;

  *((unsigned char *)v4 + 233) = self->_isStepping;
  objc_storeStrong((id *)v4 + 30, self->_vehicle);
  objc_storeStrong((id *)v4 + 31, self->_vgError);
  objc_storeStrong((id *)v4 + 34, self->_lprRules);
  *((unsigned char *)v4 + 264) = self->_hasResolvedRules;
  objc_storeStrong((id *)v4 + 35, self->_lprError);
  [v4 _commonInit];
  return v4;
}

- (MNRouteAttributes)initWithAttributes:(id)a3 waypoints:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v7 firstObject];
  int v9 = [v8 isCurrentLocation];

  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v15), "bestLatLng", (void)v19);
        if (v16) {
          [v10 addObject:v16];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  v17 = [(MNRouteAttributes *)self initWithAttributes:v6 latLngs:v10 isStepping:v9 ^ 1u];
  return v17;
}

- (MNRouteAttributes)initWithAttributes:(id)a3 latLngs:(id)a4
{
  return [(MNRouteAttributes *)self initWithAttributes:a3 latLngs:a4 isStepping:0];
}

- (MNRouteAttributes)initWithAttributes:(id)a3 latLngs:(id)a4 isStepping:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MNRouteAttributes;
  uint64_t v10 = [(MNRouteAttributes *)&v15 init];
  id v11 = v10;
  if (v10)
  {
    [(MNRouteAttributes *)v10 _commonInit];
    if (v8) {
      [(MNRouteAttributes *)v11 mergeFrom:v8];
    }
    uint64_t v12 = [v9 copy];
    latLngs = v11->_latLngs;
    v11->_latLngs = (NSArray *)v12;

    v11->_isStepping = a5;
  }

  return v11;
}

- (id)vehicle
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__11;
  id v8 = __Block_byref_object_dispose__11;
  id v9 = 0;
  geo_isolate_sync_data();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

uint64_t __28__MNRouteAttributes_vehicle__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 240) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setHasResolvedRules:(BOOL)a3
{
}

void __41__MNRouteAttributes_setHasResolvedRules___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 264) != v2)
  {
    *(unsigned char *)(v1 + 264) = v2;
    uint64_t v4 = MNGetMNRouteAttributesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = @"YES";
      if (!*(unsigned char *)(a1 + 40)) {
        uint64_t v6 = @"NO";
      }
      int v11 = 134218242;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "%p setHasResolvedRules: %@", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v7 + 264))
    {
      id v8 = *(void **)(v7 + 272);
      *(void *)(v7 + 272) = 0;

      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 280);
      *(void *)(v9 + 280) = 0;
    }
  }
}

- (void)_resolveSelectedVehicle:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MNGetMNRouteAttributesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int v11 = self;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "%p _resolveSelectedVehicle: calling into MNVirtualGarageManager to get selected vehicle", buf, 0xCu);
  }

  uint64_t v6 = +[MNVirtualGarageManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__MNRouteAttributes__resolveSelectedVehicle___block_invoke;
  v8[3] = &unk_1E60FAEA8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 updatedVehicleStateWithHandler:v8];
}

void __45__MNRouteAttributes__resolveSelectedVehicle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  geo_isolate_sync();
  if (!v7 || v6)
  {
    if (v7 && [v7 isPureElectricVehicle]) {
      [MEMORY[0x1E4F63E30] captureUserAction:6094 target:0 value:0];
    }
    uint64_t v12 = MNGetMNRouteAttributesLog();
    id v9 = v12;
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v20 = v13;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "%p Error getting updated vehicle state when building route attributes: %@", buf, 0x16u);
      }

      id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:debugDescription:underlyingError:", 17, @"Failed to get virtual garage", v6);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v16;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_INFO, "%p No vehicle selected in VirtualGarage when building route attributes.", buf, 0xCu);
    }
  }
  else
  {
    int v8 = [v7 isPureElectricVehicle];
    id v9 = MNGetMNRouteAttributesLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v20 = v11;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_INFO, "%p Got SoC of vehicle: %@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = [v7 displayName];
      if ([v15 length]) {
        [v7 displayName];
      }
      else {
      v17 = [v7 licensePlate];
      }
      v18 = [v7 identifier];
      *(_DWORD *)buf = 134218498;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      id v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_INFO, "%p Got selected vehicle: %@ | %@", buf, 0x20u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __45__MNRouteAttributes__resolveSelectedVehicle___block_invoke_2(void *a1)
{
  if (a1[5]) {
    int v2 = 0;
  }
  else {
    int v2 = (void *)a1[6];
  }
  objc_storeStrong((id *)(a1[4] + 240), v2);
  uint64_t v3 = (void *)a1[5];
  id v4 = (id *)(a1[4] + 248);
  objc_storeStrong(v4, v3);
}

+ (void)_loadLPRRulesForWaypoints:(id)a3 forceUpdate:(BOOL)a4 queue:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  if (v11 && v12)
  {
    if ([v10 count])
    {
      uint64_t v14 = objc_alloc_init(MNLPRRuleHelper);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __76__MNRouteAttributes__loadLPRRulesForWaypoints_forceUpdate_queue_completion___block_invoke_2;
      v16[3] = &unk_1E60FAED0;
      id v18 = a1;
      id v17 = v13;
      [(MNLPRRuleHelper *)v14 fetchRulesForWaypoints:v10 forceUpdateManifest:0 forceUpdateRules:v8 completionQueue:v11 completion:v16];
    }
    else
    {
      uint64_t v15 = MNGetMNRouteAttributesLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v22 = a1;
        _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_INFO, "%p No waypoints provided, not looking up lpr rules", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__MNRouteAttributes__loadLPRRulesForWaypoints_forceUpdate_queue_completion___block_invoke;
      block[3] = &unk_1E60F6C58;
      uint64_t v20 = v13;
      dispatch_async(v11, block);
      uint64_t v14 = v20;
    }
  }
}

uint64_t __76__MNRouteAttributes__loadLPRRulesForWaypoints_forceUpdate_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__MNRouteAttributes__loadLPRRulesForWaypoints_forceUpdate_queue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = MNGetMNRouteAttributesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v14 = 134218242;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "%p Failed to get LPR rules. Error: %@", (uint8_t *)&v14, 0x16u);
    }

    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:debugDescription:underlyingError:", 17, @"Failed to get LPR rules", v7);

    [MEMORY[0x1E4F63E30] captureUserAction:2191 target:0 value:@"EmptyRules"];
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = MNGetMNRouteAttributesLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = [v5 count];
    int v14 = 134218240;
    uint64_t v15 = v12;
    __int16 v16 = 1024;
    LODWORD(v17) = v13;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "%p Found %d lpr rule sets", (uint8_t *)&v14, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_loadRulesIfNecessaryWithVehicle:(id)a3 queue:(id)a4 finishedHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 licensePlate];
  if ([v11 length])
  {
    BOOL v12 = [(MNRouteAttributes *)self hasResolvedRules];

    if (!v12)
    {
      int v13 = MNGetMNRouteAttributesLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = [v8 licensePlate];
        *(_DWORD *)buf = 134218240;
        v26 = self;
        __int16 v27 = 1024;
        int v28 = [v14 length];
        _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_INFO, "%p Will load rules for plate of %d chars length", buf, 0x12u);
      }
      latLngs = self->_latLngs;
      BOOL forceUpdate = self->_forceUpdate;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __76__MNRouteAttributes__loadRulesIfNecessaryWithVehicle_queue_finishedHandler___block_invoke;
      v22[3] = &unk_1E60FAEF8;
      v22[4] = self;
      id v24 = v10;
      id v23 = v8;
      +[MNRouteAttributes _loadLPRRulesForWaypoints:latLngs forceUpdate:forceUpdate queue:v9 completion:v22];

      goto LABEL_12;
    }
  }
  else
  {
  }
  id v17 = MNGetMNRouteAttributesLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [v8 licensePlate];
    int v19 = [v18 length];
    BOOL v20 = [(MNRouteAttributes *)self hasResolvedRules];
    __int16 v21 = "NO";
    *(_DWORD *)buf = 134218498;
    v26 = self;
    if (v20) {
      __int16 v21 = "YES";
    }
    __int16 v27 = 1024;
    int v28 = v19;
    __int16 v29 = 2080;
    v30 = v21;
    _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_INFO, "%p Not loading rules plate is %d chars & hasResolvedRules: %s", buf, 0x1Cu);
  }
  (*((void (**)(id, id, uint64_t))v10 + 2))(v10, v8, 1);
LABEL_12:
}

void __76__MNRouteAttributes__loadRulesIfNecessaryWithVehicle_queue_finishedHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 272);
  *(void *)(v7 + 272) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 280);
  *(void *)(v9 + 280) = v6;
  id v11 = v6;

  [*(id *)(a1 + 32) setHasResolvedRules:1];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_populateRouteAttributesWithVehicle:(id)a3 finishedHandler:(id)a4
{
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, uint64_t))a4;
  id v8 = (void *)[(MNRouteAttributes *)self copy];
  uint64_t v9 = [v8 automobileOptions];
  [v9 setVehicleSpecifications:0];

  int BOOL = GEOConfigGetBOOL();
  int v11 = GEOConfigGetBOOL();
  v144 = self;
  if (self->_isStepping) {
    int v12 = v11 | BOOL ^ 1;
  }
  else {
    int v12 = 1;
  }
  v147 = v6;
  if ([v6 isPureElectricVehicle] && v12)
  {
    v138 = v7;
    v140 = v8;
    int v13 = [v6 identifier];
    int v14 = [MEMORY[0x1E4FB3E48] sharedService];
    [v14 setActiveVehicleIdentifier:v13];

    id v15 = objc_alloc_init(MEMORY[0x1E4F64588]);
    __int16 v16 = [v6 currentVehicleState];
    id v17 = [v16 consumptionArguments];
    uint64_t v18 = (void *)[v17 copy];
    [v15 setConsumptionArguments:v18];

    int v19 = [v6 currentVehicleState];
    BOOL v20 = [v19 chargingArguments];
    __int16 v21 = (void *)[v20 copy];
    [v15 setChargingArguments:v21];

    id v22 = [v6 currentVehicleState];
    id v23 = [v22 maxEVRange];
    id v24 = [MEMORY[0x1E4F291E0] meters];
    uint64_t v25 = [v23 measurementByConvertingToUnit:v24];
    [v25 doubleValue];
    [v15 setMaxRange:v26];

    __int16 v27 = [v6 currentVehicleState];
    int v28 = [v27 minBatteryCapacity];
    __int16 v29 = [MEMORY[0x1E4F291B0] kilowattHours];
    v30 = [v28 measurementByConvertingToUnit:v29];
    [v30 doubleValue];
    [v15 setMinBatteryCharge:(v31 * 1000.0)];

    v32 = +[MNVirtualGarageManager sharedManager];
    LODWORD(v28) = [v32 assumesFullCharge];

    v33 = [v6 currentVehicleState];
    v34 = v33;
    if (v28)
    {
      v35 = [v33 maxBatteryCapacity];
      v36 = [MEMORY[0x1E4F291B0] kilowattHours];
      v37 = [v35 measurementByConvertingToUnit:v36];
      [v37 doubleValue];
      [v15 setCurrentBatteryCharge:(v38 * 1000.0)];

      uint64_t v39 = 100;
    }
    else
    {
      v40 = [v33 currentBatteryCapacity];
      v41 = [MEMORY[0x1E4F291B0] kilowattHours];
      v42 = [v40 measurementByConvertingToUnit:v41];
      [v42 doubleValue];
      [v15 setCurrentBatteryCharge:(v43 * 1000.0)];

      uint64_t v39 = [v6 displayedBatteryPercentage];
    }
    [v15 setCurrentBatteryPercentage:v39];
    v44 = [v6 currentVehicleState];
    v45 = [v44 maxBatteryCapacity];
    v46 = [MEMORY[0x1E4F291B0] kilowattHours];
    v47 = [v45 measurementByConvertingToUnit:v46];
    [v47 doubleValue];
    [v15 setMaxBatteryCharge:(v48 * 1000.0)];

    v49 = [v6 currentVehicleState];
    v50 = [v49 dateOfUpdate];
    [v50 timeIntervalSinceReferenceDate];
    [v15 setLastSocUpdateDate:v51];

    v52 = [v6 currentVehicleState];
    objc_msgSend(v15, "setIsCharging:", objc_msgSend(v52, "isCharging"));

    id v53 = objc_alloc_init(MEMORY[0x1E4F64448]);
    v145 = v15;
    [v15 setChargerPlugsInfo:v53];

    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    v54 = [v6 powerByConnector];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v153 objects:v160 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v154;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v154 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void **)(*((void *)&v153 + 1) + 8 * i);
          [v59 unsignedIntegerValue];
          uint64_t v60 = GEOEvChargingConnectorTypeFromVGConnectorType();
          if (v60)
          {
            uint64_t v61 = v60;
            v62 = [v6 powerByConnector];
            v63 = [v62 objectForKeyedSubscript:v59];

            id v64 = objc_alloc_init(MEMORY[0x1E4F64440]);
            [v64 setType:v61];
            v65 = [MEMORY[0x1E4F291F0] watts];
            v66 = [v63 measurementByConvertingToUnit:v65];
            [v66 doubleValue];
            [v64 setMaximumPower:v67];

            v68 = [v145 chargerPlugsInfo];
            [v68 addSupportedChargerPlug:v64];
          }
          else
          {
            v63 = MNGetMNRouteAttributesLog();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              *(void *)&uint8_t buf[4] = v144;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v59;
              _os_log_impl(&dword_1B542B000, v63, OS_LOG_TYPE_ERROR, "%p Skipping unknown VG connector: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v153 objects:v160 count:16];
      }
      while (v56);
    }

    id v8 = v140;
    v69 = [v140 _vehicleSpecifications];
    v70 = v145;
    [v69 setEvInfo:v145];
    if ([v6 usesPreferredNetworksForRouting])
    {
      v142 = v69;
      id v71 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v149 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      v72 = [v6 preferredChargingNetworks];
      uint64_t v73 = [v72 countByEnumeratingWithState:&v149 objects:v159 count:16];
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = *(void *)v150;
        do
        {
          for (uint64_t j = 0; j != v74; ++j)
          {
            if (*(void *)v150 != v75) {
              objc_enumerationMutation(v72);
            }
            v77 = *(void **)(*((void *)&v149 + 1) + 8 * j);
            id v78 = objc_alloc_init(MEMORY[0x1E4F64580]);
            id v79 = objc_alloc_init(MEMORY[0x1E4F64878]);
            objc_msgSend(v79, "setChargingNetworkMuid:", objc_msgSend(v77, "globalBrandID"));
            [v78 setPreferenceEntity:v79];
            [v78 setPreferenceType:1];
            [v71 addObject:v78];
          }
          uint64_t v74 = [v72 countByEnumeratingWithState:&v149 objects:v159 count:16];
        }
        while (v74);
      }

      id v8 = v140;
      v80 = [v140 _userPreferences];
      v81 = (void *)[v71 copy];
      [v80 setEvChargingPreferences:v81];

      v70 = v145;
      id v6 = v147;
      v69 = v142;
    }

    uint64_t v7 = v138;
  }
  if ([(NSArray *)v144->_lprRules count])
  {
    v82 = [v6 licensePlate];
    uint64_t v83 = [v82 length];

    if (v83)
    {
      v139 = v7;
      v141 = v8;
      id v84 = objc_alloc_init(MEMORY[0x1E4F64628]);
      v85 = [v6 licensePlate];
      [v84 setLicensePlate:v85];

      v86 = [v6 lprVehicleType];
      [v84 setVehicleTypeKey:v86];

      v87 = [v6 lprPowerType];
      [v84 setPowerTypeKey:v87];

      v88 = GEOConfigGetDate();
      v146 = v88;
      if (v88)
      {
        id v89 = v88;
        v90 = MNGetMNRouteAttributesLog();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v89;
          _os_log_impl(&dword_1B542B000, v90, OS_LOG_TYPE_DEFAULT, "!!!IMPORTANT!!! The date for LPR masking has been overridden to %@ !!!IMPORTANT!!! ", buf, 0xCu);
        }

        uint64_t v91 = 0;
      }
      else
      {
        id v89 = [MEMORY[0x1E4F1C9C8] now];
        uint64_t v91 = [MEMORY[0x1E4F1CAF0] localTimeZone];
      }
      id v98 = [[MNLPRRuleMatcher alloc] initForVehicle:v84 withRules:v144->_lprRules];
      v99 = v144;
      latLngs = v144->_latLngs;
      id v148 = 0;
      id v137 = v98;
      v143 = (void *)v91;
      v101 = [v98 generateMaskedPlateForWaypoints:latLngs date:v89 timeZone:v91 error:&v148];
      id v102 = v148;
      id v103 = objc_alloc_init(MEMORY[0x1E4F64608]);
      v104 = [v147 lprVehicleType];
      [v103 setVehicleTypeKey:v104];

      v105 = [v147 lprPowerType];
      [v103 setPowerTypeKey:v105];

      [v89 timeIntervalSinceReferenceDate];
      [v103 setTimestamp:(unint64_t)v106];
      [v103 setMaskedplateGeneratorValidatorVersion:2];
      if (!v144->_forceUpdate)
      {
        v107 = [MEMORY[0x1E4F64860] sharedPlatform];
        if ([v107 isInternalInstall])
        {
          int HasValue = _GEOConfigHasValue();

          v99 = v144;
          if (HasValue)
          {
            v109 = GEOConfigGetString();
            v110 = [v109 dataUsingEncoding:4];
            [v103 setVersionId:v110];

            uint64_t v112 = NavigationConfig_LPRProvideBadVersion_DEBUG;
            v111 = off_1E9D56990;
            GEOConfigGetDouble();
            double v114 = fmin(v113, 3600.0);
            if (v114 >= 0.1)
            {
              dispatch_time_t v136 = dispatch_time(0, (uint64_t)(v114 * 1000000000.0));
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = ____scheduleDebugConfigKeyReset_block_invoke;
              v162 = &__block_descriptor_48_e5_v8__0l;
              uint64_t v163 = v112;
              v164 = v111;
              dispatch_after(v136, MEMORY[0x1E4F14428], buf);
            }
            else
            {
              _GEOConfigRemoveValue();
            }
            v117 = v144;
            if (v102) {
              goto LABEL_58;
            }
            goto LABEL_52;
          }
        }
        else
        {

          v99 = v144;
        }
      }
      v115 = [(NSArray *)v99->_lprRules firstObject];
      v116 = [v115 version];
      [v103 setVersionId:v116];

      v117 = v99;
      if (v102)
      {
LABEL_58:
        v126 = [v141 _vehicleSpecifications];
        if (![v101 length] || v102)
        {
          v128 = MNGetMNRouteAttributesLog();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)&uint8_t buf[4] = v117;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v102;
            _os_log_impl(&dword_1B542B000, v128, OS_LOG_TYPE_ERROR, "%p Failed to mask license plate. Error: %@", buf, 0x16u);
          }

          v129 = [v102 domain];
          int v130 = [v129 isEqualToString:@"MapsNavLPRErrorDomain"];

          v127 = v137;
          if (v130)
          {
            if ((unint64_t)([v102 code] + 12) > 2) {
              uint64_t v131 = 3;
            }
            else {
              uint64_t v131 = 2;
            }
            [v126 setLprPlateMissingReason:v131];
          }
        }
        else
        {
          [v103 setLicensePlate:v101];
          v127 = v137;
        }
        [v126 setLprInfo:v103];

        id v6 = v147;
        uint64_t v7 = v139;
        id v8 = v141;
        goto LABEL_69;
      }
LABEL_52:
      if (_GEOConfigHasValue())
      {
        uint64_t Integer = GEOConfigGetInteger();
        v119 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v157 = *MEMORY[0x1E4F1D138];
        v158 = @"Error was generated by request of LPRMaskPlateFailureCode_DEBUG key";
        v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
        id v102 = [v119 errorWithDomain:@"MapsNavLPRErrorDomain" code:Integer userInfo:v120];

        uint64_t v122 = NavigationConfig_LPRMaskPlateFailureCode_DEBUG;
        v121 = off_1E9D569A0;
        GEOConfigGetDouble();
        double v124 = fmin(v123, 3600.0);
        if (v124 >= 0.1)
        {
          dispatch_time_t v125 = dispatch_time(0, (uint64_t)(v124 * 1000000000.0));
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = ____scheduleDebugConfigKeyReset_block_invoke;
          v162 = &__block_descriptor_48_e5_v8__0l;
          uint64_t v163 = v122;
          v164 = v121;
          dispatch_after(v125, MEMORY[0x1E4F14428], buf);
        }
        else
        {
          _GEOConfigRemoveValue();
        }
      }
      else
      {
        id v102 = 0;
      }
      v117 = v144;
      goto LABEL_58;
    }
  }
  if (!v6)
  {
    v96 = +[MNVirtualGarageManager sharedManager];
    uint64_t v97 = [v96 vehiclesCount];

    if (v97)
    {
      v94 = [v8 _vehicleSpecifications];
      id v84 = v94;
      uint64_t v95 = 1;
      goto LABEL_43;
    }
  }
  if ([(MNRouteAttributes *)v144 hasResolvedRules])
  {
    if (![(NSArray *)v144->_lprRules count])
    {
      v92 = [v6 licensePlate];
      uint64_t v93 = [v92 length];

      if (v93)
      {
        v94 = [v8 _vehicleSpecifications];
        id v84 = v94;
        uint64_t v95 = 3;
LABEL_43:
        [v94 setLprPlateMissingReason:v95];
LABEL_69:
      }
    }
  }
  v132 = objc_opt_new();
  v133 = +[MNCarPlayConnectionMonitor sharedInstance];
  objc_msgSend(v132, "setCarPlayConnectionStatus:", objc_msgSend(v133, "isConnected"));

  v134 = +[MNVirtualGarageManager sharedManager];
  objc_msgSend(v132, "setIntentsConnectionStatus:", objc_msgSend(v134, "isProviderStarted"));

  v135 = [v8 _vehicleSpecifications];
  [v135 setVehicleInfo:v132];

  v7[2](v7, v8, 1);
}

- (void)buildRouteAttributes:(id)a3 queue:(id)a4 result:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10 && ![(MNRouteAttributes *)self mainTransportType])
  {
    int v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "bestLatLng", (void)v19);
          if (v17) {
            [(NSArray *)v11 addObject:v17];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    latLngs = self->_latLngs;
    self->_latLngs = v11;
  }
  -[MNRouteAttributes buildRouteAttributes:result:](self, "buildRouteAttributes:result:", v9, v10, (void)v19);
}

- (void)buildRouteAttributes:(id)a3 result:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(MNRouteAttributes *)self mainTransportType])
    {
      id v8 = MNGetMNRouteAttributesLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [(MNRouteAttributes *)self mainTransportType];
        if (v9 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
          id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v10 = off_1E60FAF90[(int)v9];
        }
        uint64_t v16 = [(MNRouteAttributes *)self formattedText];
        *(_DWORD *)buf = 134218498;
        double v26 = self;
        __int16 v27 = 2112;
        int v28 = (const char *)v10;
        __int16 v29 = 2112;
        *(void *)v30 = v16;
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_ERROR, "%p Requested updated route attributes for an unsupported transportType: %@, attributes:\n%@", buf, 0x20u);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke;
      block[3] = &unk_1E60F6058;
      void block[4] = self;
      uint64_t v24 = (MNSequence *)v7;
      dispatch_async(v6, block);
      int v11 = v24;
    }
    else
    {
      id v13 = +[MNCarPlayConnectionMonitor sharedInstance];
      uint64_t v14 = MNGetMNRouteAttributesLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [(MNRouteAttributes *)self formattedText];
        *(_DWORD *)buf = 134218242;
        double v26 = self;
        __int16 v27 = 2112;
        int v28 = v15;
        _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_DEFAULT, "%p Requesting updated route attributes:\n%@", buf, 0x16u);
      }
      int v11 = [[MNSequence alloc] initWithQueue:v6];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_95;
      v22[3] = &unk_1E60F8308;
      v22[4] = self;
      [(MNSequence *)v11 addStep:v22];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_2;
      v20[3] = &unk_1E60FAF20;
      v20[4] = self;
      long long v21 = v6;
      [(MNSequence *)v11 addStep:v20];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_3;
      v19[3] = &unk_1E60FAF48;
      v19[4] = self;
      [(MNSequence *)v11 addStep:v19];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_4;
      v17[3] = &unk_1E60FAF70;
      v17[4] = self;
      id v18 = v7;
      [(MNSequence *)v11 addStep:v17];
      [(MNSequence *)v11 start];
    }
  }
  else
  {
    int v11 = [NSString stringWithFormat:@"defaultRouteAttributesForTransportType called without a handler"];
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      double v26 = (MNRouteAttributes *)"-[MNRouteAttributes buildRouteAttributes:result:]";
      __int16 v27 = 2080;
      int v28 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEORouteAttributes+MNExtras.m";
      __int16 v29 = 1024;
      *(_DWORD *)v30 = 627;
      *(_WORD *)&v30[4] = 2080;
      *(void *)&v30[6] = "result != nil";
      __int16 v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
}

void __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

uint64_t __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_95(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolveSelectedVehicle:");
}

uint64_t __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _loadRulesIfNecessaryWithVehicle:a2 queue:*(void *)(a1 + 40) finishedHandler:a3];
}

uint64_t __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _populateRouteAttributesWithVehicle:a2 finishedHandler:a3];
}

void __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(*(void *)(a1 + 32) + 240);
  id v7 = a3;
  id v8 = [v6 combinedDisplayName];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 248);
  if (v10)
  {
    id v11 = v10;
    goto LABEL_4;
  }
  id v11 = *(id *)(v9 + 280);
  if (v11)
  {
LABEL_4:
    id v12 = MNGetMNRouteAttributesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = [v5 formattedText];
      int v17 = 134218754;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      long long v20 = v8;
      __int16 v21 = 2112;
      id v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "%p Error updating route attributes with vehicle \"%@\". Error: %@.\nRoute attributes:\n%@", (uint8_t *)&v17, 0x2Au);
    }
    goto LABEL_9;
  }
  id v12 = MNGetMNRouteAttributesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = [v5 formattedText];
    int v17 = 134218498;
    uint64_t v18 = v15;
    __int16 v19 = 2112;
    long long v20 = v8;
    __int16 v21 = 2112;
    id v22 = v16;
    _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_DEFAULT, "%p Used vehicle \"%@\" to update route attributes:\n%@", (uint8_t *)&v17, 0x20u);
  }
  id v11 = 0;
LABEL_9:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
}

- (void)buildRouteAttributesForETAUpdateRequest:(id)a3 queue:(id)a4 result:(id)a5
{
  id v22 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 currentUserLocation];
  if (v9)
  {
    if ([(NSArray *)self->_latLngs count])
    {
      id v10 = [(NSArray *)self->_latLngs firstObject];
      [v10 coordinate];
      double v12 = v11;
      double v14 = v13;

      [v9 coordinate];
      if (vabdd_f64(v15, v12) >= 0.0001 || vabdd_f64(v16, v14) >= 0.0001)
      {
        int v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64638]), "initWithCoordinate:", v15, v16);
        uint64_t v18 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_latLngs, "count"));
        [(NSArray *)v18 addObject:v17];
        if ([(NSArray *)self->_latLngs count] >= 2)
        {
          unint64_t v19 = 1;
          do
          {
            long long v20 = [(NSArray *)self->_latLngs objectAtIndexedSubscript:v19];
            [(NSArray *)v18 addObject:v20];

            ++v19;
          }
          while (v19 < [(NSArray *)self->_latLngs count]);
        }
        latLngs = self->_latLngs;
        self->_latLngs = v18;

        [(MNRouteAttributes *)self setHasResolvedRules:0];
      }
    }
  }
  [(MNRouteAttributes *)self buildRouteAttributes:v22 result:v8];
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  id v6 = GEOErrorDomain();
  if (![v5 isEqualToString:v6])
  {

    goto LABEL_5;
  }
  uint64_t v7 = [v4 code];

  if (v7 != -28)
  {
LABEL_5:
    BOOL v8 = 0;
    goto LABEL_6;
  }
  BOOL v8 = 1;
  self->_BOOL forceUpdate = 1;
  [(MNRouteAttributes *)self setHasResolvedRules:0];
LABEL_6:

  return v8;
}

- (BOOL)hasResolvedRules
{
  return self->_hasResolvedRules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lprError, 0);
  objc_storeStrong((id *)&self->_lprRules, 0);
  objc_storeStrong((id *)&self->_vehicleIsolator, 0);
  objc_storeStrong((id *)&self->_vgError, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_latLngs, 0);
}

@end