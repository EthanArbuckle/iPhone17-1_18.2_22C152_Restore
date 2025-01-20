@interface SATravelTypeClassifier
+ (id)convertSATravelTypeToString:(unint64_t)a3;
- (BOOL)_setNewTravelType:(unint64_t)a3 hints:(unint64_t)a4;
- (NSDate)currentTravelTypeChangeDate;
- (NSHashTable)clients;
- (SATimeServiceProtocol)clock;
- (SATravelTypeClassifier)initWithClock:(id)a3;
- (id)_vehicularHintsToString:(unint64_t)a3;
- (unint64_t)currentTravelType;
- (void)_handleUserActivityEvent:(id)a3;
- (void)_handleVehicleStateEvent:(id)a3;
- (void)_notifyAllClientsOfTravelTypeChangeFrom:(unint64_t)a3 to:(unint64_t)a4 hints:(unint64_t)a5;
- (void)addClient:(id)a3;
- (void)ingestTAEvent:(id)a3;
- (void)removeClient:(id)a3;
- (void)setClients:(id)a3;
- (void)setClock:(id)a3;
- (void)setCurrentTravelType:(unint64_t)a3;
- (void)setCurrentTravelTypeChangeDate:(id)a3;
@end

@implementation SATravelTypeClassifier

- (void)ingestTAEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SATravelTypeClassifier *)self _handleVehicleStateEvent:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SATravelTypeClassifier *)self _handleUserActivityEvent:v4];
    }
  }
}

- (SATravelTypeClassifier)initWithClock:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SATravelTypeClassifier;
  v6 = [(SATravelTypeClassifier *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    clients = v6->_clients;
    v6->_clients = (NSHashTable *)v7;

    v6->_currentTravelType = 0;
    objc_storeStrong((id *)&v6->_clock, a3);
    uint64_t v9 = [(SATimeServiceProtocol *)v6->_clock getCurrentTime];
    currentTravelTypeChangeDate = v6->_currentTravelTypeChangeDate;
    v6->_currentTravelTypeChangeDate = (NSDate *)v9;
  }
  return v6;
}

+ (id)convertSATravelTypeToString:(unint64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 1) {
    v3 = @"Vehicular";
  }
  if (a3 == 2) {
    return @"NonVehicular";
  }
  else {
    return v3;
  }
}

- (id)_vehicularHintsToString:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(NSString);
  id v5 = v4;
  if (v3) {
    v6 = @"M";
  }
  else {
    v6 = @"-";
  }
  id v7 = (id)[v4 stringByAppendingString:v6];
  if ((v3 & 2) != 0) {
    v8 = @"G";
  }
  else {
    v8 = @"-";
  }
  id v9 = (id)[v5 stringByAppendingString:v8];
  if ((v3 & 4) != 0) {
    v10 = @"C";
  }
  else {
    v10 = @"-";
  }
  id v11 = (id)[v5 stringByAppendingString:v10];
  if ((v3 & 8) != 0) {
    objc_super v12 = @"W";
  }
  else {
    objc_super v12 = @"-";
  }
  id v13 = (id)[v5 stringByAppendingString:v12];
  if ((v3 & 0x10) != 0) {
    v14 = @"B";
  }
  else {
    v14 = @"-";
  }
  id v15 = (id)[v5 stringByAppendingString:v14];
  return v5;
}

- (BOOL)_setNewTravelType:(unint64_t)a3 hints:(unint64_t)a4
{
  unint64_t v7 = [(SATravelTypeClassifier *)self currentTravelType];
  [(SATravelTypeClassifier *)self setCurrentTravelType:a3];
  unint64_t v8 = [(SATravelTypeClassifier *)self currentTravelType];
  if (v8 != v7)
  {
    id v9 = [(SATimeServiceProtocol *)self->_clock getCurrentTime];
    [(SATravelTypeClassifier *)self setCurrentTravelTypeChangeDate:v9];

    [(SATravelTypeClassifier *)self _notifyAllClientsOfTravelTypeChangeFrom:v7 to:[(SATravelTypeClassifier *)self currentTravelType] hints:a4];
  }
  return v8 != v7;
}

- (void)_handleVehicleStateEvent:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 vehicularState];
  uint64_t v6 = [v4 vehicularHints];

  switch(v5)
  {
    case 2:
      objc_super v12 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        id v14 = +[SATravelTypeClassifier convertSATravelTypeToString:[(SATravelTypeClassifier *)self currentTravelType]];
        uint64_t v15 = [v14 UTF8String];
        id v16 = [(SATravelTypeClassifier *)self _vehicularHintsToString:v6];
        int v24 = 68289795;
        int v25 = 0;
        __int16 v26 = 2082;
        v27 = "";
        __int16 v28 = 2081;
        uint64_t v29 = v15;
        __int16 v30 = 2081;
        v31 = "Vehicular";
        __int16 v32 = 2081;
        uint64_t v33 = [v16 UTF8String];
        _os_log_impl(&dword_1D15FC000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SATravelTypeClassifier handleVehicleState\", \"curr\":\"%{private}s\", \"new\":\"%{private}s\", \"hints\":\"%{private}s\"}", (uint8_t *)&v24, 0x30u);
      }
      v17 = self;
      uint64_t v18 = 1;
      goto LABEL_12;
    case 1:
      v19 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        id v21 = +[SATravelTypeClassifier convertSATravelTypeToString:[(SATravelTypeClassifier *)self currentTravelType]];
        uint64_t v22 = [v21 UTF8String];
        id v23 = [(SATravelTypeClassifier *)self _vehicularHintsToString:v6];
        int v24 = 68289795;
        int v25 = 0;
        __int16 v26 = 2082;
        v27 = "";
        __int16 v28 = 2081;
        uint64_t v29 = v22;
        __int16 v30 = 2081;
        v31 = "NonVehicular";
        __int16 v32 = 2081;
        uint64_t v33 = [v23 UTF8String];
        _os_log_impl(&dword_1D15FC000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SATravelTypeClassifier handleVehicleState\", \"curr\":\"%{private}s\", \"new\":\"%{private}s\", \"hints\":\"%{private}s\"}", (uint8_t *)&v24, 0x30u);
      }
      v17 = self;
      uint64_t v18 = 2;
LABEL_12:
      [(SATravelTypeClassifier *)v17 _setNewTravelType:v18 hints:v6];
      return;
    case 0:
      unint64_t v7 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = v7;
        id v9 = +[SATravelTypeClassifier convertSATravelTypeToString:[(SATravelTypeClassifier *)self currentTravelType]];
        uint64_t v10 = [v9 UTF8String];
        id v11 = [(SATravelTypeClassifier *)self _vehicularHintsToString:v6];
        int v24 = 68289795;
        int v25 = 0;
        __int16 v26 = 2082;
        v27 = "";
        __int16 v28 = 2081;
        uint64_t v29 = v10;
        __int16 v30 = 2081;
        v31 = "Unknown";
        __int16 v32 = 2081;
        uint64_t v33 = [v11 UTF8String];
        _os_log_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SATravelTypeClassifier handleVehicleState\", \"curr\":\"%{private}s\", \"new\":\"%{private}s\", \"hints\":\"%{private}s\"}", (uint8_t *)&v24, 0x30u);
      }
      break;
  }
}

- (void)_handleUserActivityEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  switch([a3 activityType])
  {
    case 0:
      id v4 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = v4;
        id v6 = +[SATravelTypeClassifier convertSATravelTypeToString:[(SATravelTypeClassifier *)self currentTravelType]];
        int v11 = 68289539;
        int v12 = 0;
        __int16 v13 = 2082;
        id v14 = "";
        __int16 v15 = 2081;
        uint64_t v16 = [v6 UTF8String];
        __int16 v17 = 2081;
        uint64_t v18 = "Unknown";
        goto LABEL_12;
      }
      break;
    case 1:
      unint64_t v7 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = v7;
        id v6 = +[SATravelTypeClassifier convertSATravelTypeToString:[(SATravelTypeClassifier *)self currentTravelType]];
        int v11 = 68289539;
        int v12 = 0;
        __int16 v13 = 2082;
        id v14 = "";
        __int16 v15 = 2081;
        uint64_t v16 = [v6 UTF8String];
        __int16 v17 = 2081;
        uint64_t v18 = "NonVehicular - Static";
        goto LABEL_12;
      }
      break;
    case 2:
      unint64_t v8 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = v8;
        id v6 = +[SATravelTypeClassifier convertSATravelTypeToString:[(SATravelTypeClassifier *)self currentTravelType]];
        int v11 = 68289539;
        int v12 = 0;
        __int16 v13 = 2082;
        id v14 = "";
        __int16 v15 = 2081;
        uint64_t v16 = [v6 UTF8String];
        __int16 v17 = 2081;
        uint64_t v18 = "NonVehicular - Pedestrian";
        goto LABEL_12;
      }
      break;
    case 3:
      id v9 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = v9;
        id v6 = +[SATravelTypeClassifier convertSATravelTypeToString:[(SATravelTypeClassifier *)self currentTravelType]];
        int v11 = 68289539;
        int v12 = 0;
        __int16 v13 = 2082;
        id v14 = "";
        __int16 v15 = 2081;
        uint64_t v16 = [v6 UTF8String];
        __int16 v17 = 2081;
        uint64_t v18 = "Vehicular";
        goto LABEL_12;
      }
      break;
    case 4:
      uint64_t v10 = (void *)TASALog;
      if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = v10;
        id v6 = +[SATravelTypeClassifier convertSATravelTypeToString:[(SATravelTypeClassifier *)self currentTravelType]];
        int v11 = 68289539;
        int v12 = 0;
        __int16 v13 = 2082;
        id v14 = "";
        __int16 v15 = 2081;
        uint64_t v16 = [v6 UTF8String];
        __int16 v17 = 2081;
        uint64_t v18 = "NonVehicular - Cycling";
LABEL_12:
        _os_log_impl(&dword_1D15FC000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SATravelTypeClassifier handleUserActivity\", \"curr\":\"%{private}s\", \"new\":\"%{private}s\"}", (uint8_t *)&v11, 0x26u);
      }
      break;
    default:
      return;
  }
}

- (void)_notifyAllClientsOfTravelTypeChangeFrom:(unint64_t)a3 to:(unint64_t)a4 hints:(unint64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = (void *)TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    id v11 = +[SATravelTypeClassifier convertSATravelTypeToString:a3];
    uint64_t v12 = [v11 UTF8String];
    id v13 = +[SATravelTypeClassifier convertSATravelTypeToString:a4];
    uint64_t buf = 68289539;
    __int16 v25 = 2082;
    __int16 v26 = "";
    __int16 v27 = 2081;
    uint64_t v28 = v12;
    __int16 v29 = 2081;
    uint64_t v30 = [v13 UTF8String];
    _os_log_impl(&dword_1D15FC000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SATravelTypeClassifier notifyTravelTypeChange\", \"from\":\"%{private}s\", \"to\":\"%{private}s\"}", (uint8_t *)&buf, 0x26u);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = [(SATravelTypeClassifier *)self clients];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v18++) didChangeTravelTypeFrom:a3 to:a4 hints:a5];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  id v5 = [(SATravelTypeClassifier *)self clients];
  [v5 addObject:v4];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [(SATravelTypeClassifier *)self clients];
  [v5 removeObject:v4];
}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (unint64_t)currentTravelType
{
  return self->_currentTravelType;
}

- (void)setCurrentTravelType:(unint64_t)a3
{
  self->_currentTravelType = a3;
}

- (NSDate)currentTravelTypeChangeDate
{
  return self->_currentTravelTypeChangeDate;
}

- (void)setCurrentTravelTypeChangeDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTravelTypeChangeDate, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end