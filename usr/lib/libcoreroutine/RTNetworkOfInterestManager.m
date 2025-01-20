@interface RTNetworkOfInterestManager
- (NWNetworkOfInterest)cellNoi;
- (NWNetworkOfInterest)wifiNoi;
- (NWNetworkOfInterestManager)noiManager;
- (RTNetworkOfInterestManager)init;
- (RTNetworkOfInterestManager)initWithNoiManager:(id)a3;
- (id)getCellLinkQualityNotification;
- (id)getWifiLinkQualityNotification;
- (unint64_t)cellLinkQuality;
- (unint64_t)convertLinkQuality:(int64_t)a3;
- (unint64_t)wifiLinkQuality;
- (void)_didStartTrackingCellNOI:(id)a3;
- (void)_didStartTrackingWifiNOI:(id)a3;
- (void)_didStopTrackingCellNOI:(id)a3;
- (void)_didStopTrackingWifiNOI:(id)a3;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_processCellNetworkOfInterestChange:(int64_t)a3;
- (void)_processWifiNetworkOfInterestChange:(int64_t)a3;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCellLinkQuality:(unint64_t)a3;
- (void)setCellNoi:(id)a3;
- (void)setNoiManager:(id)a3;
- (void)setWifiLinkQuality:(unint64_t)a3;
- (void)setWifiNoi:(id)a3;
@end

@implementation RTNetworkOfInterestManager

- (RTNetworkOfInterestManager)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA91C8]);
  v4 = [(RTNetworkOfInterestManager *)self initWithNoiManager:v3];

  return v4;
}

- (RTNetworkOfInterestManager)initWithNoiManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTNetworkOfInterestManager;
    v6 = [(RTNotifier *)&v11 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_noiManager, a3);
      v7->_cellLinkQuality = 0;
      v7->_wifiLinkQuality = 0;
      [(RTService *)v7 setup];
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: noiManager", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)_setup
{
  id v3 = [(RTNetworkOfInterestManager *)self noiManager];
  v4 = [(RTNotifier *)self queue];
  [v3 setQueue:v4];

  id v5 = [(RTNetworkOfInterestManager *)self noiManager];
  [v5 setDelegate:self];

  v6 = [(RTNetworkOfInterestManager *)self noiManager];
  [v6 trackNOIAnyForInterfaceType:2 options:0];

  id v7 = [(RTNetworkOfInterestManager *)self noiManager];
  [v7 trackNOIAnyForInterfaceType:1 options:0];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v9 = a3;
  [(RTNetworkOfInterestManager *)self setCellLinkQuality:0];
  v4 = [(RTNetworkOfInterestManager *)self cellNoi];

  if (v4)
  {
    id v5 = [(RTNetworkOfInterestManager *)self cellNoi];
    [v5 removeObserver:self forKeyPath:@"linkQuality"];

    [(RTNetworkOfInterestManager *)self setCellNoi:0];
  }
  [(RTNetworkOfInterestManager *)self setWifiLinkQuality:0];
  v6 = [(RTNetworkOfInterestManager *)self wifiNoi];

  if (v6)
  {
    id v7 = [(RTNetworkOfInterestManager *)self wifiNoi];
    [v7 removeObserver:self forKeyPath:@"linkQuality"];

    [(RTNetworkOfInterestManager *)self setWifiNoi:0];
  }
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
    v8 = v9;
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = +[RTNotification notificationName];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [(RTNetworkOfInterestManager *)self getCellLinkQualityNotification];
LABEL_5:
    v13 = (void *)v10;
    [(RTNotifier *)self postNotification:v10 toObserver:v6];

    goto LABEL_11;
  }
  objc_super v11 = +[RTNotification notificationName];
  int v12 = [v7 isEqualToString:v11];

  if (v12)
  {
    uint64_t v10 = [(RTNetworkOfInterestManager *)self getWifiLinkQualityNotification];
    goto LABEL_5;
  }
  v14 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315394;
    v17 = "-[RTNetworkOfInterestManager internalAddObserver:name:]";
    __int16 v18 = 2112;
    v19 = (const char *)v7;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%s, unsupported notification, %@", (uint8_t *)&v16, 0x16u);
  }

  v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412802;
    v17 = (const char *)v7;
    __int16 v18 = 2080;
    v19 = "-[RTNetworkOfInterestManager internalAddObserver:name:]";
    __int16 v20 = 1024;
    int v21 = 123;
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "unsupported notification, %@ (in %s:%d)", (uint8_t *)&v16, 0x1Cu);
  }

LABEL_11:
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = +[RTNotification notificationName];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = +[RTNotification notificationName];
    char v8 = [v4 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      int v9 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v11, 0xCu);
      }

      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412802;
        id v12 = v4;
        __int16 v13 = 2080;
        v14 = "-[RTNetworkOfInterestManager internalRemoveObserver:name:]";
        __int16 v15 = 1024;
        int v16 = 137;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "unsupported notification, %@ (in %s:%d)", (uint8_t *)&v11, 0x1Cu);
      }
    }
  }
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__RTNetworkOfInterestManager_didStartTrackingNOI___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__RTNetworkOfInterestManager_didStartTrackingNOI___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) interface];
  if (v2 == 1)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    [v5 _didStartTrackingWifiNOI:v6];
  }
  else if (v2 == 2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    [v3 _didStartTrackingCellNOI:v4];
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [*(id *)(a1 + 32) interface];
      int v9 = 136315394;
      uint64_t v10 = "-[RTNetworkOfInterestManager didStartTrackingNOI:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%s, received noi for unsupported interface, %d", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)_didStartTrackingCellNOI:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 interface] == 2)
    {
      uint64_t v6 = [(RTNetworkOfInterestManager *)self cellNoi];

      if (!v6)
      {
        [(RTNetworkOfInterestManager *)self setCellNoi:v5];
        __int16 v11 = [(RTNetworkOfInterestManager *)self cellNoi];
        [v11 addObserver:self forKeyPath:@"linkQuality" options:5 context:0];

        goto LABEL_11;
      }
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        int v8 = "received second cell noi";
LABEL_8:
        int v9 = v7;
        uint32_t v10 = 2;
LABEL_14:
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        uint64_t v13 = "-[RTNetworkOfInterestManager _didStartTrackingCellNOI:]";
        __int16 v14 = 2048;
        uint64_t v15 = [v5 interface];
        int v8 = "%s, interface, %ld, is not cell";
        int v9 = v7;
        uint32_t v10 = 22;
        goto LABEL_14;
      }
    }
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      int v8 = "Invalid parameter not satisfying: cellNoi";
      goto LABEL_8;
    }
  }

LABEL_11:
}

- (void)_didStartTrackingWifiNOI:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 interface] == 1)
    {
      uint64_t v6 = [(RTNetworkOfInterestManager *)self wifiNoi];

      if (!v6)
      {
        [(RTNetworkOfInterestManager *)self setWifiNoi:v5];
        __int16 v11 = [(RTNetworkOfInterestManager *)self wifiNoi];
        [v11 addObserver:self forKeyPath:@"linkQuality" options:5 context:0];

        goto LABEL_11;
      }
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        int v8 = "received second wifi noi";
LABEL_8:
        int v9 = v7;
        uint32_t v10 = 2;
LABEL_14:
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      id v7 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        uint64_t v13 = "-[RTNetworkOfInterestManager _didStartTrackingWifiNOI:]";
        __int16 v14 = 2048;
        uint64_t v15 = [v5 interface];
        int v8 = "%s, interface, %ld, is not wifi";
        int v9 = v7;
        uint32_t v10 = 22;
        goto LABEL_14;
      }
    }
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      int v8 = "Invalid parameter not satisfying: wifiNoi";
      goto LABEL_8;
    }
  }

LABEL_11:
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__RTNetworkOfInterestManager_didStopTrackingNOI___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__RTNetworkOfInterestManager_didStopTrackingNOI___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) interface];
  if (v2 == 1)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    [v5 _didStopTrackingWifiNOI:v6];
  }
  else if (v2 == 2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    [v3 _didStopTrackingCellNOI:v4];
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [*(id *)(a1 + 32) interface];
      int v9 = 136315394;
      uint32_t v10 = "-[RTNetworkOfInterestManager didStopTrackingNOI:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = v8;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%s, received noi for unsupported interface, %d", (uint8_t *)&v9, 0x12u);
    }
  }
}

- (void)_didStopTrackingCellNOI:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    LOWORD(v12) = 0;
    int v9 = "Invalid parameter not satisfying: cellNoi";
    uint32_t v10 = v8;
    uint32_t v11 = 2;
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, v11);
    goto LABEL_7;
  }
  id v5 = [(RTNetworkOfInterestManager *)self cellNoi];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v12 = 136315394;
    uint64_t v13 = "-[RTNetworkOfInterestManager _didStopTrackingCellNOI:]";
    __int16 v14 = 2112;
    id v15 = v4;
    int v9 = "%s, unrecognized noi, %@";
    uint32_t v10 = v8;
    uint32_t v11 = 22;
    goto LABEL_10;
  }
  id v7 = [(RTNetworkOfInterestManager *)self cellNoi];
  [v7 removeObserver:self forKeyPath:@"linkQuality"];

  [(RTNetworkOfInterestManager *)self setCellNoi:0];
  [(RTNetworkOfInterestManager *)self setCellLinkQuality:0];
LABEL_8:
}

- (void)_didStopTrackingWifiNOI:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    LOWORD(v12) = 0;
    int v9 = "Invalid parameter not satisfying: wifiNoi";
    uint32_t v10 = v8;
    uint32_t v11 = 2;
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, v11);
    goto LABEL_7;
  }
  id v5 = [(RTNetworkOfInterestManager *)self wifiNoi];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v12 = 136315394;
    uint64_t v13 = "-[RTNetworkOfInterestManager _didStopTrackingWifiNOI:]";
    __int16 v14 = 2112;
    id v15 = v4;
    int v9 = "%s, unrecognized noi, %@";
    uint32_t v10 = v8;
    uint32_t v11 = 22;
    goto LABEL_10;
  }
  id v7 = [(RTNetworkOfInterestManager *)self wifiNoi];
  [v7 removeObserver:self forKeyPath:@"linkQuality"];

  [(RTNetworkOfInterestManager *)self setWifiNoi:0];
  [(RTNetworkOfInterestManager *)self setWifiLinkQuality:0];
LABEL_8:
}

- (void)_processCellNetworkOfInterestChange:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(RTNetworkOfInterestManager *)self convertLinkQuality:a3];
  unint64_t v5 = [(RTNetworkOfInterestManager *)self cellLinkQuality];
  char v6 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
  id v7 = v6;
  if (v4 == v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = RTLinkQualityToString();
      int v11 = 136315394;
      int v12 = "-[RTNetworkOfInterestManager _processCellNetworkOfInterestChange:]";
      __int16 v13 = 2112;
      __int16 v14 = v8;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%s, no change in linkQuality, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      [(RTNetworkOfInterestManager *)self cellLinkQuality];
      int v9 = RTLinkQualityToString();
      uint32_t v10 = RTLinkQualityToString();
      int v11 = 136315650;
      int v12 = "-[RTNetworkOfInterestManager _processCellNetworkOfInterestChange:]";
      __int16 v13 = 2112;
      __int16 v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, linkQuality changed from, %@, to, %@", (uint8_t *)&v11, 0x20u);
    }
    [(RTNetworkOfInterestManager *)self setCellLinkQuality:v4];
    id v7 = [(RTNetworkOfInterestManager *)self getCellLinkQualityNotification];
    [(RTNotifier *)self postNotification:v7];
  }
}

- (void)_processWifiNetworkOfInterestChange:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(RTNetworkOfInterestManager *)self convertLinkQuality:a3];
  unint64_t v5 = [(RTNetworkOfInterestManager *)self wifiLinkQuality];
  char v6 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
  id v7 = v6;
  if (v4 == v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = RTLinkQualityToString();
      int v11 = 136315394;
      int v12 = "-[RTNetworkOfInterestManager _processWifiNetworkOfInterestChange:]";
      __int16 v13 = 2112;
      __int16 v14 = v8;
      _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "%s, no change in linkQuality, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      [(RTNetworkOfInterestManager *)self wifiLinkQuality];
      int v9 = RTLinkQualityToString();
      uint32_t v10 = RTLinkQualityToString();
      int v11 = 136315650;
      int v12 = "-[RTNetworkOfInterestManager _processWifiNetworkOfInterestChange:]";
      __int16 v13 = 2112;
      __int16 v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, linkQuality changed from, %@, to, %@", (uint8_t *)&v11, 0x20u);
    }
    [(RTNetworkOfInterestManager *)self setWifiLinkQuality:v4];
    id v7 = [(RTNetworkOfInterestManager *)self getWifiLinkQualityNotification];
    [(RTNotifier *)self postNotification:v7];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__RTNetworkOfInterestManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6B90F80;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  int v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __77__RTNetworkOfInterestManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _observeValueForKeyPath:*(void *)(a1 + 40) ofObject:*(void *)(a1 + 48) change:*(void *)(a1 + 56) context:*(void *)(a1 + 64)];
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = [(RTNetworkOfInterestManager *)self cellNoi];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    -[RTNetworkOfInterestManager _processCellNetworkOfInterestChange:](self, "_processCellNetworkOfInterestChange:", [v7 linkQuality]);
  }
  else
  {
    id v10 = [(RTNetworkOfInterestManager *)self wifiNoi];
    int v11 = [v7 isEqual:v10];

    if (v11)
    {
      -[RTNetworkOfInterestManager _processWifiNetworkOfInterestChange:](self, "_processWifiNetworkOfInterestChange:", [v7 linkQuality]);
    }
    else
    {
      id v12 = _rt_log_facility_get_os_log(RTLogFacilityReachability);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        id v14 = "-[RTNetworkOfInterestManager _observeValueForKeyPath:ofObject:change:context:]";
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%s, Unexpected noi, %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
}

- (unint64_t)convertLinkQuality:(int64_t)a3
{
  unint64_t v3 = 3;
  uint64_t v4 = 4;
  if (a3 != 100) {
    uint64_t v4 = 0;
  }
  if (a3 != 50) {
    unint64_t v3 = v4;
  }
  unint64_t v5 = 1;
  uint64_t v6 = 2;
  if (a3 != 20) {
    uint64_t v6 = 0;
  }
  if (a3) {
    unint64_t v5 = v6;
  }
  if (a3 <= 49) {
    return v5;
  }
  else {
    return v3;
  }
}

- (id)getCellLinkQualityNotification
{
  uint64_t v2 = [[RTNetworkOfInterestManagerCellLinkQualityChangedNotification alloc] initWithLinkQuality:[(RTNetworkOfInterestManager *)self cellLinkQuality]];

  return v2;
}

- (id)getWifiLinkQualityNotification
{
  uint64_t v2 = [[RTNetworkOfInterestManagerWifiLinkQualityChangedNotification alloc] initWithLinkQuality:[(RTNetworkOfInterestManager *)self wifiLinkQuality]];

  return v2;
}

- (NWNetworkOfInterestManager)noiManager
{
  return self->_noiManager;
}

- (void)setNoiManager:(id)a3
{
}

- (NWNetworkOfInterest)cellNoi
{
  return self->_cellNoi;
}

- (void)setCellNoi:(id)a3
{
}

- (NWNetworkOfInterest)wifiNoi
{
  return self->_wifiNoi;
}

- (void)setWifiNoi:(id)a3
{
}

- (unint64_t)cellLinkQuality
{
  return self->_cellLinkQuality;
}

- (void)setCellLinkQuality:(unint64_t)a3
{
  self->_cellLinkQuality = a3;
}

- (unint64_t)wifiLinkQuality
{
  return self->_wifiLinkQuality;
}

- (void)setWifiLinkQuality:(unint64_t)a3
{
  self->_wifiLinkQuality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiNoi, 0);
  objc_storeStrong((id *)&self->_cellNoi, 0);

  objc_storeStrong((id *)&self->_noiManager, 0);
}

@end