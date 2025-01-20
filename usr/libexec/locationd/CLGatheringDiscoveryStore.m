@interface CLGatheringDiscoveryStore
- (CLGatheringDiscoveryStore)initWithQueue:(id)a3 withSettings:(id)a4;
- (CLGatheringSettings)settings;
- (NSFileHandle)fileHandleForReadWrite;
- (NSURL)basePersistenceURL;
- (id)fetchAllBleAdvertisements;
- (id)persistenceDirectory;
- (void)_cleanupPersistentStorage;
- (void)_cleanupVolatileStorage;
- (void)bootstrapAdvertisements;
- (void)dealloc;
- (void)didReceiveAdvertisement:(id)a3;
- (void)fetchFromStatisticsNumberOfAdvs:(unint64_t *)p_uniqueAdvertisementsReceived accumulatedTime:(double *)a4;
- (void)markScanEndTimeFromBoot:(double)a3 withReason:(int64_t)a4 withPolicy:(BOOL)a5;
- (void)markScanStartTimeFromBoot:(double)a3 withReason:(int64_t)a4 withRate:(int64_t)a5;
- (void)openAdvertisementsFile;
- (void)setBasePersistenceURL:(id)a3;
- (void)setFileHandleForReadWrite:(id)a3;
- (void)setSettings:(id)a3;
- (void)writeAdvertisement:(id)a3;
@end

@implementation CLGatheringDiscoveryStore

- (CLGatheringDiscoveryStore)initWithQueue:(id)a3 withSettings:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLGatheringDiscoveryStore;
  v6 = [(CLGatheringDiscoveryStore *)&v8 init];
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    [(CLGatheringDiscoveryStore *)v6 setSettings:a4];
    v6->_storage = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2400];
    if ([(CLGatheringSettings *)[(CLGatheringDiscoveryStore *)v6 settings] loggingPersistentEnabled])
    {
      [(CLGatheringDiscoveryStore *)v6 bootstrapAdvertisements];
      [(CLGatheringDiscoveryStore *)v6 openAdvertisementsFile];
    }
  }
  return v6;
}

- (void)dealloc
{
  self->_storage = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLGatheringDiscoveryStore;
  [(CLGatheringDiscoveryStore *)&v3 dealloc];
}

- (void)bootstrapAdvertisements
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F9718);
  }
  objc_super v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "bootstrapAdvertisements()", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    LOWORD(v28) = 0;
    v22 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n", v22);
    if (v22 != (char *)buf) {
      free(v22);
    }
  }
  id v4 = [[-[CLGatheringDiscoveryStore persistenceDirectory](self) URLByAppendingPathComponent:@"gathering_ble_advs_bootstrap.bin"];
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [v4 path]))
  {
    v27 = 0;
    v5 = +[NSFileHandle fileHandleForReadingFromURL:v4 error:&v27];
    if (v27)
    {
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      v6 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v27;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "error opening file handle for bootstrapping: %@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F9718);
        }
        int v28 = 138412290;
        id v29 = v27;
        v7 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n");
LABEL_24:
        if (v7 != buf) {
          free(v7);
        }
      }
    }
    else
    {
      v10 = v5;
      v11 = [(NSFileHandle *)v5 availableData];
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      v12 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v31 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "bootstrapAdvertisements data %p", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F9718);
        }
        int v28 = 134217984;
        id v29 = v11;
        v23 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n", v23);
        if (v23 != (char *)buf) {
          free(v23);
        }
      }
      if ([(NSData *)v11 length])
      {
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F9718);
        }
        v13 = qword_1024194B8;
        if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
        {
          v14 = [(NSData *)v11 length];
          *(_DWORD *)buf = 134217984;
          v31 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "available data for bootstrapping length: %zu", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024194B0 != -1) {
            dispatch_once(&qword_1024194B0, &stru_1022F9718);
          }
          id v24 = [(NSData *)v11 length];
          int v28 = 134217984;
          id v29 = v24;
          v25 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n", v25);
          if (v25 != (char *)buf) {
            free(v25);
          }
        }
        unint64_t v15 = [(NSData *)v11 length];
        unint64_t v16 = v15 / 0x54;
        v17 = [(NSData *)v11 bytes];
        if (v15 >= 0x54)
        {
          v18 = v17;
          if (v16 <= 1) {
            unint64_t v19 = 1;
          }
          else {
            unint64_t v19 = v15 / 0x54;
          }
          do
          {
            id v20 = [objc_alloc((Class)CLGatheringBleAdvertisement) initWithPersistenceBytes:v18];
            [(NSMutableArray *)self->_storage addObject:v20];

            v18 += 84;
            --v19;
          }
          while (v19);
        }
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F9718);
        }
        v21 = qword_1024194B8;
        if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          v31 = (NSData *)v16;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "bootstrapped %zu advs from persistent storage", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024194B0 != -1) {
            dispatch_once(&qword_1024194B0, &stru_1022F9718);
          }
          int v28 = 134217984;
          id v29 = (id)v16;
          v26 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n", v26);
          if (v26 != (char *)buf) {
            free(v26);
          }
        }
      }
      [(NSFileHandle *)v10 closeAndReturnError:&v27];
    }
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    objc_super v8 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (NSData *)[v4 absoluteString];
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "file %@ does not exist, bypass bootstrapping", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      int v28 = 138412290;
      id v29 = [v4 absoluteString];
      v7 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore bootstrapAdvertisements]", "%s\n");
      goto LABEL_24;
    }
  }
}

- (void)openAdvertisementsFile
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F9718);
  }
  objc_super v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "openAdvertisementsFile()", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    LOWORD(v20) = 0;
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore openAdvertisementsFile]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100DFA494;
  block[3] = &unk_10229FED8;
  block[4] = self;
  if (qword_102481840 != -1) {
    dispatch_once(&qword_102481840, block);
  }
  id v4 = +[NSFileManager defaultManager];
  if (!-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", [(id)qword_102481830 path]))
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    v5 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(id)qword_102481830 absoluteString];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = (uint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "creating file %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      id v13 = [(id)qword_102481830 absoluteString];
      int v20 = 138412290;
      uint64_t v21 = (uint64_t)v13;
      v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore openAdvertisementsFile]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    v7 = +[NSFileManager defaultManager];
    if (!-[NSFileManager createFileAtPath:contents:attributes:](v7, "createFileAtPath:contents:attributes:", [(id)qword_102481830 path], 0, 0))
    {
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      objc_super v8 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = qword_102481830;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "creating advertisements file %@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F9718);
        }
        int v20 = 138412290;
        uint64_t v21 = qword_102481830;
        v17 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGatheringDiscoveryStore openAdvertisementsFile]", "%s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
      }
    }
  }
  uint64_t v18 = 0;
  [(CLGatheringDiscoveryStore *)self setFileHandleForReadWrite:+[NSFileHandle fileHandleForUpdatingURL:qword_102481830 error:&v18]];
  if (v18)
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    v9 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "error opening file handle for writing: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      int v20 = 138412290;
      uint64_t v21 = v18;
LABEL_46:
      unint64_t v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore openAdvertisementsFile]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    v10 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [(id)qword_102481830 absoluteString];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = (uint64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "opened advertisements file: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      id v15 = [(id)qword_102481830 absoluteString];
      int v20 = 138412290;
      uint64_t v21 = (uint64_t)v15;
      goto LABEL_46;
    }
  }
}

- (void)writeAdvertisement:(id)a3
{
  if ([(CLGatheringDiscoveryStore *)self fileHandleForReadWrite])
  {
    [(NSFileHandle *)[(CLGatheringDiscoveryStore *)self fileHandleForReadWrite] seekToEndOfFile];
    v5 = [(CLGatheringDiscoveryStore *)self fileHandleForReadWrite];
    id v6 = [a3 encodedBytes];
    [(NSFileHandle *)v5 writeData:v6];
  }
}

- (id)persistenceDirectory
{
  objc_super v3 = (NSString *)[(-[NSArray firstObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1)) stringByAppendingPathComponent:@"locationd"]);
  if (!v3
    || (id v4 = v3,
        [(CLGatheringSettings *)[(CLGatheringDiscoveryStore *)self settings] loggingPersistentInTempFolder]))
  {
    id v4 = NSTemporaryDirectory();
  }
  v5 = [(NSString *)v4 stringByAppendingPathComponent:@"Gathering"];
  if (![+[NSFileManager defaultManager] fileExistsAtPath:v5])
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    id v6 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "creating persistent storage directory %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      int v12 = 138412290;
      id v13 = v5;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore persistenceDirectory]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    id v11 = 0;
    if (![+[NSFileManager defaultManager] createDirectoryAtPath:v5 withIntermediateDirectories:0 attributes:0 error:&v11])
    {
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      v7 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "failed creating persistent storage directory: %@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F9718);
        }
        int v12 = 138412290;
        id v13 = v11;
        v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGatheringDiscoveryStore persistenceDirectory]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
    }
  }
  return +[NSURL fileURLWithPath:v5 isDirectory:1];
}

- (id)fetchAllBleAdvertisements
{
  id v3 = [(NSMutableArray *)self->_storage copy];
  [(NSMutableArray *)self->_storage removeAllObjects];
  return v3;
}

- (void)fetchFromStatisticsNumberOfAdvs:(unint64_t *)p_uniqueAdvertisementsReceived accumulatedTime:(double *)a4
{
  double observationStopTimestamp = self->_observationStopTimestamp;
  double observationDuration = self->_observationDuration;
  double observationStartTimestamp = self->_observationStartTimestamp;
  if (observationStopTimestamp <= observationStartTimestamp
    && (observationStopTimestamp != 0.0 || observationStartTimestamp != 0.0))
  {
    double v10 = sub_10016C458();
    double observationDuration = observationDuration + v10 - self->_observationStartTimestamp;
    self->_double observationStartTimestamp = v10;
    self->_double observationStopTimestamp = v10;
  }
  self->_double observationDuration = 0.0;
  if (p_uniqueAdvertisementsReceived)
  {
    if (observationDuration > 0.0)
    {
      *p_uniqueAdvertisementsReceived = self->_uniqueAdvertisementsReceived;
      p_uniqueAdvertisementsReceived = &self->_uniqueAdvertisementsReceived;
    }
    *p_uniqueAdvertisementsReceived = 0;
  }
  if (a4) {
    *a4 = observationDuration;
  }
}

- (void)_cleanupVolatileStorage
{
  [+[NSDate now] timeIntervalSince1970];
  double v4 = v3;
  uint64_t v5 = [(CLGatheringSettings *)[(CLGatheringDiscoveryStore *)self settings] loggingVolatileMaxAge];
  id v6 = &qword_102419000;
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F9718);
  }
  v7 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [(NSMutableArray *)self->_storage count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v50) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "volatile storage cleanup (has %d)", buf, 8u);
  }
  double v9 = (double)v5;
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    unsigned int v32 = [(NSMutableArray *)self->_storage count];
    int v46 = 67109120;
    LODWORD(v47) = v32;
    v33 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v33);
    if (v33 != (char *)buf) {
      free(v33);
    }
  }
  double v10 = v4 - v9;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  storage = self->_storage;
  id v12 = [(NSMutableArray *)storage countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v43;
    while (2)
    {
      unint64_t v16 = 0;
      uint64_t v17 = (uint64_t)v13 + v14;
      do
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(storage);
        }
        uint64_t v18 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v16);
        [v18 unixTime];
        if (v19 >= v10)
        {
          [v18 unixTime];
          double v10 = v20;
          if (qword_1024194B0 != -1) {
            dispatch_once(&qword_1024194B0, &stru_1022F9718);
          }
          uint64_t v17 = (uint64_t)v16 + v14;
          uint64_t v21 = qword_1024194B8;
          if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
          {
            [v18 unixTime];
            *(double *)&v22 = COERCE_DOUBLE(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
            *(_DWORD *)buf = 138412290;
            double v50 = *(double *)&v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "volatile storage oldest found %@", buf, 0xCu);
          }
          id v6 = &qword_102419000;
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024194B0 != -1) {
              dispatch_once(&qword_1024194B0, &stru_1022F9718);
            }
            [v18 unixTime];
            v35 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
            int v46 = 138412290;
            double v47 = *(double *)&v35;
            v36 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v36);
            if (v36 != (char *)buf) {
              free(v36);
            }
          }
          goto LABEL_20;
        }
        unint64_t v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      id v13 = [(NSMutableArray *)storage countByEnumeratingWithState:&v42 objects:v48 count:16];
      uint64_t v14 = v17;
      if (v13) {
        continue;
      }
      break;
    }
    id v6 = &qword_102419000;
LABEL_20:
    if (v17 >= 1)
    {
      if (v6[150] != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      uint64_t v23 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v50) = v17;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "volatile storage removing %d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (v6[150] != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F9718);
        }
        int v46 = 67109120;
        LODWORD(v47) = v17;
        v37 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v37);
        if (v37 != (char *)buf) {
          free(v37);
        }
      }
      -[NSMutableArray removeObjectsInRange:](self->_storage, "removeObjectsInRange:", 0, v17);
    }
  }
  if ([(NSMutableArray *)self->_storage count])
  {
    double v24 = v10
        - v4
        + (double)[(CLGatheringSettings *)[(CLGatheringDiscoveryStore *)self settings] loggingVolatileMaxAge];
    if (v24 < 0.0)
    {
      if (v6[150] != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      v25 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_ERROR))
      {
        *(double *)&v26 = COERCE_DOUBLE(+[NSDate dateWithTimeIntervalSince1970:v10]);
        *(_DWORD *)buf = 138412290;
        double v50 = *(double *)&v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "volatile storage has negative cleanupTimeOffset! timeOldest %@", buf, 0xCu);
      }
      double v24 = 0.0;
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (v6[150] != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022F9718);
        }
        v39 = +[NSDate dateWithTimeIntervalSince1970:v10];
        int v46 = 138412290;
        double v47 = *(double *)&v39;
        v40 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v40);
        if (v40 != (char *)buf) {
          free(v40);
        }
      }
    }
    if (v6[150] != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    v27 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v50 = v24 + 60.0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "volatile storage cleaning again in %.3f s", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (v6[150] != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      double v28 = v24 + 60.0;
      int v46 = 134217984;
      double v47 = v28;
      v34 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v34);
      if (v34 != (char *)buf) {
        free(v34);
      }
    }
    else
    {
      double v28 = v24 + 60.0;
    }
    dispatch_time_t v29 = dispatch_time(0, (uint64_t)(v28 * 1000000000.0));
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100DFB450;
    block[3] = &unk_10229FED8;
    block[4] = self;
    dispatch_after(v29, queue, block);
  }
  else
  {
    if (v6[150] != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    v31 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "volatile storage emptied", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (v6[150] != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      LOWORD(v46) = 0;
      v38 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupVolatileStorage]", "%s\n", v38);
      if (v38 != (char *)buf) {
        free(v38);
      }
    }
    self->_volatileCleanupScheduled = 0;
  }
}

- (void)_cleanupPersistentStorage
{
  [+[NSDate now] timeIntervalSince1970];
  double v4 = v3;
  uint64_t v5 = [(CLGatheringSettings *)[(CLGatheringDiscoveryStore *)self settings] loggingPersistentMaxAge];
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F9718);
  }
  id v6 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "persistent storage cleanup", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    LOWORD(v32) = 0;
    v27 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupPersistentStorage]", "%s\n", v27);
    if (v27 != (char *)buf) {
      free(v27);
    }
  }
  [(NSFileHandle *)[(CLGatheringDiscoveryStore *)self fileHandleForReadWrite] seekToFileOffset:0];
  v7 = [(NSFileHandle *)[(CLGatheringDiscoveryStore *)self fileHandleForReadWrite] availableData];
  unint64_t v8 = [(NSData *)v7 length];
  if (v8 <= 0x53)
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    double v9 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "persistent storage is empty", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_50;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    LOWORD(v32) = 0;
LABEL_63:
    dispatch_time_t v29 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupPersistentStorage]", "%s\n", v29);
    if (v29 != (char *)buf) {
      free(v29);
    }
LABEL_50:
    self->_persistentCleanupScheduled = 0;
    return;
  }
  double v10 = v4 - (double)v5;
  unint64_t v11 = v8 / 0x54;
  id v12 = [(NSData *)v7 bytes];
  if (v11 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v11;
  }
  double v14 = *v12;
  if (*v12 > v10)
  {
LABEL_23:
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    double v19 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "all advertisements kept in file", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_38;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    LOWORD(v32) = 0;
    goto LABEL_58;
  }
  uint64_t v15 = (double *)((char *)v12 + 84);
  unint64_t v16 = 1;
  do
  {
    if (v13 == v16)
    {
      BOOL v18 = v16 < v11;
      goto LABEL_32;
    }
    double v17 = *v15;
    uint64_t v15 = (double *)((char *)v15 + 84);
    double v14 = v17;
    ++v16;
  }
  while (v17 <= v10);
  uint64_t v13 = v16 - 1;
  BOOL v18 = v16 - 1 < v11;
  if (v16 == 1) {
    goto LABEL_23;
  }
LABEL_32:
  [(NSFileHandle *)[(CLGatheringDiscoveryStore *)self fileHandleForReadWrite] truncateAtOffset:0 error:0];
  if (!v18)
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    v26 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "emptied persistent storage (had %zu entries)", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_50;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    int v32 = 134217984;
    v33 = (NSDate *)v11;
    goto LABEL_63;
  }
  -[NSFileHandle writeData:](-[CLGatheringDiscoveryStore fileHandleForReadWrite](self, "fileHandleForReadWrite"), "writeData:", -[NSData subdataWithRange:](v7, "subdataWithRange:", 84 * v13, 84 * (v11 - v13)));
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F9718);
  }
  double v20 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "removed %zu entries from persistent storage", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    int v32 = 134217984;
    v33 = (NSDate *)v13;
LABEL_58:
    double v28 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore _cleanupPersistentStorage]", "%s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
  }
LABEL_38:
  double v21 = v14
      - v4
      + (double)[(CLGatheringSettings *)[(CLGatheringDiscoveryStore *)self settings] loggingPersistentMaxAge];
  if (v21 < 0.0)
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    v22 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = +[NSDate dateWithTimeIntervalSince1970:v14];
      *(_DWORD *)buf = 138412290;
      unint64_t v35 = (unint64_t)v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "persistent storage has negative cleanupTimeOffset! timeOldest %@", buf, 0xCu);
    }
    double v21 = 0.0;
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      int v32 = 138412290;
      v33 = +[NSDate dateWithTimeIntervalSince1970:v14];
      v30 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGatheringDiscoveryStore _cleanupPersistentStorage]", "%s\n", v30);
      if (v30 != (char *)buf) {
        free(v30);
      }
    }
  }
  dispatch_time_t v24 = dispatch_time(0, (uint64_t)((v21 + 60.0) * 1000000000.0));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100DFBD5C;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_after(v24, queue, block);
}

- (void)didReceiveAdvertisement:(id)a3
{
  if ((-[NSMutableArray containsObject:](self->_storage, "containsObject:") & 1) == 0) {
    ++self->_uniqueAdvertisementsReceived;
  }
  [(NSMutableArray *)self->_storage addObject:a3];
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022F9718);
  }
  uint64_t v5 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [a3 description];
    id v7 = [(NSMutableArray *)self->_storage count];
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = (uint64_t)v6;
    __int16 v25 = 2048;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "rx adv %@, have %zu now", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    id v13 = [a3 description];
    id v14 = [(NSMutableArray *)self->_storage count];
    int v19 = 138412546;
    uint64_t v20 = (uint64_t)v13;
    __int16 v21 = 2048;
    id v22 = v14;
    uint64_t v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore didReceiveAdvertisement:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  if ([(CLGatheringSettings *)[(CLGatheringDiscoveryStore *)self settings] loggingVolatileMaxAge] >= 1&& !self->_volatileCleanupScheduled)
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    unint64_t v8 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = 0x404E000000000000;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Volatile storage cleanup schedule in %.2f seconds", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      int v19 = 134217984;
      uint64_t v20 = 0x404E000000000000;
      unint64_t v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore didReceiveAdvertisement:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    dispatch_time_t v9 = dispatch_time(0, 60000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100DFC200;
    block[3] = &unk_10229FED8;
    block[4] = self;
    dispatch_after(v9, queue, block);
    self->_volatileCleanupScheduled = 1;
  }
  if ([(CLGatheringSettings *)[(CLGatheringDiscoveryStore *)self settings] loggingPersistentEnabled])
  {
    [(CLGatheringDiscoveryStore *)self writeAdvertisement:a3];
    if ([(CLGatheringSettings *)[(CLGatheringDiscoveryStore *)self settings] loggingPersistentMaxAge] >= 1&& !self->_persistentCleanupScheduled)
    {
      dispatch_time_t v11 = dispatch_time(0, 60000000000);
      id v12 = self->_queue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100DFC208;
      v17[3] = &unk_10229FED8;
      v17[4] = self;
      dispatch_after(v11, v12, v17);
      self->_persistentCleanupScheduled = 1;
    }
  }
}

- (void)markScanStartTimeFromBoot:(double)a3 withReason:(int64_t)a4 withRate:(int64_t)a5
{
  self->_scanStart = a3;
  self->_double observationStartTimestamp = a3;
  double scanStop = self->_scanStop;
  if (scanStop > 0.0)
  {
    self->_double scanIntervalSinceLast = a3 - scanStop;
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    dispatch_time_t v9 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_INFO))
    {
      double v10 = (&off_102474150)[a4];
      double scanIntervalSinceLast = self->_scanIntervalSinceLast;
      *(_DWORD *)buf = 136315394;
      id v14 = v10;
      __int16 v15 = 2048;
      double v16 = scanIntervalSinceLast;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "mark start, reason %s, timeSinceLast %.3f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      id v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore markScanStartTimeFromBoot:withReason:withRate:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
  self->_scanReason = a4;
  self->_scanRate = a5;
}

- (void)markScanEndTimeFromBoot:(double)a3 withReason:(int64_t)a4 withPolicy:(BOOL)a5
{
  if (self->_scanReason)
  {
    self->_double scanStop = a3;
    double scanStart = self->_scanStart;
    double v9 = self->_observationDuration + a3 - self->_observationStartTimestamp;
    self->_double observationStopTimestamp = a3;
    self->_double observationDuration = v9;
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022F9718);
    }
    double v10 = a3 - scanStart;
    dispatch_time_t v11 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_INFO))
    {
      id v12 = (&off_102474150)[a4];
      *(_DWORD *)buf = 136315394;
      __int16 v15 = v12;
      __int16 v16 = 2048;
      double v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "mark stop, reason %s, duration %.3f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022F9718);
      }
      id v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringDiscoveryStore markScanEndTimeFromBoot:withReason:withPolicy:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    AnalyticsSendEventLazy();
  }
  self->_scanReason = 0;
}

- (CLGatheringSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  self->_settings = (CLGatheringSettings *)a3;
}

- (NSURL)basePersistenceURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBasePersistenceURL:(id)a3
{
}

- (NSFileHandle)fileHandleForReadWrite
{
  return (NSFileHandle *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFileHandleForReadWrite:(id)a3
{
}

@end