@interface CLIndoorServiceDelegate
+ (BOOL)isEntitled:(id)a3 forEntitlement:(id)a4;
+ (BOOL)isEntitled:(id)a3 forEntitlement:(id)a4 allowRootEverything:(BOOL)a5;
+ (BOOL)validateEntitlement:(id)a3 forConnection:(id)a4 forSelector:(SEL)a5;
+ (id)defaultWorkdir;
+ (id)versionString;
+ (void)logViolation:(id)a3 ofEntitlement:(id)a4 forSelector:(SEL)a5;
- (BOOL)initializeDb;
- (BOOL)initializeDb:(BOOL)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldImportFromPrefetchOnProviderShutdown;
- (BOOL)tilePrefetchShouldPrefetchMetadataForFloor:(const void *)a3 withLocationContext:(int64_t)a4;
- (BOOL)tilePrefetchShouldPrefetchTileDataForFloor:(const void *)a3;
- (CLIndoorProvider)currentProvider;
- (CLIndoorServiceDelegate)init;
- (CLIndoorServiceDelegate)initWithWorkdir:(id)a3;
- (CLIndoorTileEvictionPolicy)delayedClearTilesPolicy;
- (CLIndoorTilePrefetcher)prefetcher;
- (IndoorServiceTransactionManager)transactionManager;
- (Keybag)keybag;
- (NSURL)workdir;
- (OS_dispatch_queue)q;
- (id).cxx_construct;
- (id)onQueueCreateProviderForConnection:(id)a3;
- (id)prefetchCompletion;
- (int)getMaxPriorityForPrefetch:(id)a3;
- (int64_t)numFloors;
- (int64_t)onQueueNumFloors;
- (shared_ptr<ITileDb>)createDbAtBasedir:(id)a3 rootdir:(id)a4 relativeTo:(id)a5;
- (shared_ptr<ITileDb>)createLocalizerDbWithRootDir:(BOOL)a3 relativeTo:(id)a4;
- (vector<std::shared_ptr<ITileDb>,)onQueueDbsToClear;
- (void)_setWorkingdir:(id)a3;
- (void)cancelPrefetch;
- (void)clearTiles:(id)a3;
- (void)createIndoorProvderTransaction;
- (void)deleteLegacyPrefetchDatabase;
- (void)fullyVacuumAllDBs;
- (void)fullyVacuumAllDBsWithReply:(id)a3;
- (void)keybagDidLock;
- (void)keybagDidUnlock;
- (void)onQueueClearTiles:(id)a3;
- (void)onQueueClearTiles:(id)a3 fromDbs:()vector<std:(std::allocator<std::shared_ptr<ITileDb>>> *)a4 :shared_ptr<ITileDb>;
- (void)onQueueClearTilesIfPossible:(id)a3 fromDbs:()vector<std:(std::allocator<std::shared_ptr<ITileDb>>> *)a4 :shared_ptr<ITileDb>;
- (void)onQueuePrefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5;
- (void)onQueueShutdown;
- (void)prefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5;
- (void)prefetcher:(id)a3 didFinishForegroundRequest:(id)a4;
- (void)prefetcher:(id)a3 didFinishForegroundRequest:(id)a4 withError:(id)a5;
- (void)releaseObjectsNotNeededForLocalization;
- (void)reloadAvailabilityTilePrefetchParameters;
- (void)setCurrentProvider:(id)a3;
- (void)setKeybag:(id)a3;
- (void)setPrefetchCompletion:(id)a3;
- (void)setPrefetcher:(id)a3;
- (void)setTransactionManager:(id)a3;
- (void)setWorkdir:(id)a3;
- (void)shutdown;
- (void)tileForegroundFetchFinishedAllDownloads;
- (void)tilePrefetchDidDownload:(const void *)a3 forRequest:(id)a4;
- (void)tilePrefetchFinishedAllDownloads;
- (void)tilePrefetchForTileId:(const void *)a3 updateRelevancy:(id)a4;
@end

@implementation CLIndoorServiceDelegate

+ (BOOL)validateEntitlement:(id)a3 forConnection:(id)a4 forSelector:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = [a1 isEntitled:v9 forEntitlement:v8];
  if ((v10 & 1) == 0) {
    [a1 logViolation:v9 ofEntitlement:v8 forSelector:a5];
  }

  return v10;
}

- (void)tilePrefetchFinishedAllDownloads
{
  v3 = [(CLIndoorServiceDelegate *)self q];
  dispatch_assert_queue_V2(v3);

  if (qword_10047BEF8 == -1)
  {
    v4 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  v4 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TileFetch, prefetchFinished", buf, 2u);
  }
LABEL_4:
  v5 = [(CLIndoorServiceDelegate *)self transactionManager];
  unsigned __int8 v6 = [v5 hasOpenTransactionWithDescription:@"Prefetching"];

  if (v6)
  {
    [(CLIndoorServiceDelegate *)self initializeDb];
    ptr = self->_fsDb.__ptr_;
    if (ptr) {
      (*(void (**)(ITileDb *, TileStorageLimits *))(*(void *)ptr + 176))(ptr, &self->_tileStorageLimits);
    }
    if ([(CLIndoorServiceDelegate *)self initializeDb])
    {
      id v9 = [(CLIndoorServiceDelegate *)self prefetchCompletion];

      if (v9)
      {
        unsigned __int8 v10 = [(CLIndoorServiceDelegate *)self prefetchCompletion];
        v10[2]();
      }
      [(CLIndoorServiceDelegate *)self setPrefetchCompletion:0];
      v11 = [(CLIndoorServiceDelegate *)self transactionManager];
      unsigned int v12 = [v11 isLastOpenTransactionWithDescription:@"Prefetching"];

      if (v12)
      {
        [(CLIndoorServiceDelegate *)self releaseObjectsNotNeededForLocalization];
        goto LABEL_22;
      }
      if (qword_10047BEF8 == -1)
      {
        v15 = qword_10047BF00;
        if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
          goto LABEL_22;
        }
      }
      else
      {
        dispatch_once(&qword_10047BEF8, &stru_10046BB50);
        v15 = qword_10047BF00;
        if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
        {
LABEL_22:
          if (qword_10047BEF8 == -1)
          {
            v16 = qword_10047BF00;
            if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
            {
LABEL_25:
              v17 = [(CLIndoorServiceDelegate *)self transactionManager];
              [v17 closeTransactionWithDescription:@"Prefetching"];

              goto LABEL_26;
            }
          }
          else
          {
            dispatch_once(&qword_10047BEF8, &stru_10046BB50);
            v16 = qword_10047BF00;
            if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
              goto LABEL_25;
            }
          }
          *(_WORD *)v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Releasing the prefetch transaction", v18, 2u);
          goto LABEL_25;
        }
      }
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Deferring destruction of FilesystemDB objects and prefetcher since we're still active", v19, 2u);
      goto LABEL_22;
    }
    if (qword_10047BEF8 == -1)
    {
      v14 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      v14 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
    }
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Couldn't import all prefetched venues - before first unlock!?", v20, 2u);
    goto LABEL_26;
  }
  if (qword_10047BEF8 == -1)
  {
    v13 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      return;
    }
    goto LABEL_14;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  v13 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_14:
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Got notified that all prefetch downloads are completed", v21, 2u);
  }
}

- (id)onQueueCreateProviderForConnection:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CLIndoorServiceDelegate isEntitled:v4 forEntitlement:@"replay" allowRootEverything:0];
  unsigned __int8 v6 = [[CLIndoorProvider alloc] initWithConnection:v4];
  [(CLIndoorServiceDelegate *)self initializeDb:v5];
  cntrl = self->_fsDb.__cntrl_;
  ptr = self->_fsDb.__ptr_;
  v13 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  [(CLIndoorProvider *)v6 setFsDb:&ptr];
  id v8 = (std::__shared_weak_count *)v13;
  if (v13 && !atomic_fetch_add((atomic_ullong *volatile)v13 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  id v9 = [(CLIndoorServiceDelegate *)self prefetcher];
  [(CLIndoorProvider *)v6 setPrefetcher:v9];

  unsigned __int8 v10 = [(CLIndoorServiceDelegate *)self workdir];
  [(CLIndoorProvider *)v6 setWorkdir:v10];

  return v6;
}

+ (BOOL)isEntitled:(id)a3 forEntitlement:(id)a4 allowRootEverything:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    if (qword_10047BEF8 == -1)
    {
      v11 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        unsigned __int8 v10 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      v11 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Attempt to check entitlement of nil connection", v14, 2u);
    goto LABEL_9;
  }
  if (v5 && ![v7 effectiveUserIdentifier]
    || (unsigned int v9 = [v7 processIdentifier], v9 == getpid()))
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    unsigned int v12 = [v7 valueForEntitlement:@"com.apple.pipelined"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      unsigned __int8 v10 = [v12 containsObject:v8];
    }
    else {
      unsigned __int8 v10 = 0;
    }
  }
LABEL_15:

  return v10;
}

- (CLIndoorTilePrefetcher)prefetcher
{
  prefetcher = self->_prefetcher;
  if (!prefetcher)
  {
    id v4 = +[GEOCountryConfiguration sharedConfiguration];
    BOOL v5 = [v4 defaultForKey:@"CLPipelineTileServer" defaultValue:0];
    unsigned __int8 v6 = +[NSURL URLWithString:v5];

    id v7 = +[GEOCountryConfiguration sharedConfiguration];
    id v8 = [v7 defaultForKey:@"CLPipelineTilePrefix" defaultValue:0];

    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    }
    unsigned int v9 = (id)qword_10047BF00;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v10 = [v6 description];
      *(_DWORD *)__p = 138412546;
      *(void *)&__p[4] = v10;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Country specific tile data URL override: %@, path prefix override: %@", __p, 0x16u);
    }
    sub_100010540(v6, v8, (uint64_t)__p);
    v11 = [CLIndoorTilePrefetcher alloc];
    unsigned int v12 = [(CLIndoorServiceDelegate *)self q];
    v13 = [(CLIndoorTilePrefetcher *)v11 initWithServerConfiguration:__p usingDelegate:self queue:v12];
    v14 = self->_prefetcher;
    self->_prefetcher = v13;

    if (v19 < 0) {
      operator delete(*(void **)__p);
    }

    prefetcher = self->_prefetcher;
  }

  return prefetcher;
}

- (shared_ptr<ITileDb>)createDbAtBasedir:(id)a3 rootdir:(id)a4 relativeTo:(id)a5
{
  unsigned int v9 = v5;
  id v69 = a3;
  id v70 = a4;
  id v68 = a5;
  sub_10009D074((uint64_t)&buf);
  unint64_t v10 = sub_10009CA88((uint64_t)&buf, (uint64_t *)&buf.__r_.__value_.__r.__words[2]);
  id v11 = v68;
  unsigned int v12 = (const char *)[v11 fileSystemRepresentation];
  size_t v13 = strlen(v12);
  if (v13 > 0x7FFFFFFFFFFFFFF7) {
    sub_1000A6968();
  }
  std::string::size_type v14 = v13;
  if (v13 >= 0x17)
  {
    uint64_t v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v16 = v13 | 7;
    }
    uint64_t v17 = v16 + 1;
    p_dst = (std::string *)operator new(v16 + 1);
    __dst.__r_.__value_.__l.__size_ = v14;
    __dst.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v13;
    p_dst = &__dst;
    if (!v13) {
      goto LABEL_9;
    }
  }
  memmove(p_dst, v12, v14);
LABEL_9:
  p_dst->__r_.__value_.__s.__data_[v14] = 0;
  *(void *)&v72.__val_ = 0;
  v72.__cat_ = 0;
  std::string::size_type v73 = 0;
  sub_10009F598((uint64_t)&__dst, &v72, &buf);
  std::string::size_type v18 = buf.__r_.__value_.__r.__words[2];
  if ((v73 & 1) != 0 && (v73 != 1 || v72.__val_))
  {
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    }
    id v20 = (id)qword_10047BF00;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    if (v73)
    {
      if (v73 == 1)
      {
        std::error_code::message(&buf, &v72);
LABEL_27:
        p_std::string buf = &buf;
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
        }
        LODWORD(v79.__r_.__value_.__l.__data_) = 136380675;
        *(std::string::size_type *)((char *)v79.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_buf;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Couldn't determine amount of disk space available - assuming we have enough. %{private}s", (uint8_t *)&v79, 0xCu);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf.__r_.__value_.__l.__data_);
        }
LABEL_31:

LABEL_32:
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__dst.__r_.__value_.__l.__data_);
        }
        v23 = [(CLIndoorServiceDelegate *)self transactionManager];
        unsigned __int8 v24 = [v23 hasAnyOpenTransaction];

        if ((v24 & 1) == 0)
        {
          sub_1003A89CC(&buf);

          v66 = (ITileDb *)abort_report_np();
          goto LABEL_151;
        }
        v25 = [v11 URLByAppendingPathComponent:v69];
        v26 = [v25 path];

        if (v26) {
          [v26 ps_STLString];
        }
        else {
          memset(&buf, 0, sizeof(buf));
        }
        std::string __dst = buf;
        *(void *)&v72.__val_ = 0;
        v72.__cat_ = 0;
        std::string::size_type v73 = 0;
        if (!v70)
        {
LABEL_42:
          p_fsDbHandle = (sqlite3 ***)&self->_fsDbHandle;
          ptr = (sqlite3 **)self->_fsDbHandle.__ptr_;
          if (!ptr) {
            goto LABEL_78;
          }
          v31 = sub_1002965E4(ptr, "main");
          size_t v32 = strlen(v31);
          if (v32 > 0x7FFFFFFFFFFFFFF7) {
            sub_1000A6968();
          }
          std::string::size_type v33 = v32;
          if (v32 >= 0x17)
          {
            uint64_t v35 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v32 | 7) != 0x17) {
              uint64_t v35 = v32 | 7;
            }
            uint64_t v36 = v35 + 1;
            v34 = (std::string *)operator new(v35 + 1);
            v79.__r_.__value_.__l.__size_ = v33;
            v79.__r_.__value_.__r.__words[2] = v36 | 0x8000000000000000;
            v79.__r_.__value_.__r.__words[0] = (std::string::size_type)v34;
          }
          else
          {
            *((unsigned char *)&v79.__r_.__value_.__s + 23) = v32;
            v34 = &v79;
            if (!v32)
            {
LABEL_51:
              v34->__r_.__value_.__s.__data_[v33] = 0;
              std::string buf = v79;
              sub_100056B28((const char *)&buf, 0, (int *)&v71);
              unsigned int data = v71.__r_.__value_.__l.__data_;
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(buf.__r_.__value_.__l.__data_);
                uint64_t v38 = qword_10047BEF8;
                if (data >= 2)
                {
LABEL_53:
                  if (v38 == -1)
                  {
                    v39 = qword_10047BF00;
                    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
                      goto LABEL_56;
                    }
                  }
                  else
                  {
                    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
                    v39 = qword_10047BF00;
                    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
                    {
LABEL_56:
                      v40 = operator new(0x58uLL);
                      sub_100098EA0(v40, (long long *)&__dst, (long long *)&v72.__val_, &self->_fsDbHandle.__ptr_);
                    }
                  }
                  LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Recreating the base.local database with a cached file handle", (uint8_t *)&buf, 2u);
                  goto LABEL_56;
                }
              }
              else
              {
                uint64_t v38 = qword_10047BEF8;
                if (LODWORD(v71.__r_.__value_.__l.__data_) >= 2) {
                  goto LABEL_53;
                }
              }
              if (v38 != -1) {
                dispatch_once(&qword_10047BEF8, &stru_10046BB50);
              }
              v41 = (id)qword_10047BF00;
              if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
                goto LABEL_75;
              }
              v42 = sub_1002965E4(*p_fsDbHandle, "main");
              size_t v43 = strlen(v42);
              if (v43 > 0x7FFFFFFFFFFFFFF7) {
                sub_1000A6968();
              }
              std::string::size_type v44 = v43;
              if (v43 >= 0x17)
              {
                uint64_t v46 = (v43 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v43 | 7) != 0x17) {
                  uint64_t v46 = v43 | 7;
                }
                uint64_t v47 = v46 + 1;
                v45 = (std::string *)operator new(v46 + 1);
                buf.__r_.__value_.__l.__size_ = v44;
                buf.__r_.__value_.__r.__words[2] = v47 | 0x8000000000000000;
                buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v45;
              }
              else
              {
                *((unsigned char *)&buf.__r_.__value_.__s + 23) = v43;
                v45 = &buf;
                if (!v43) {
                  goto LABEL_71;
                }
              }
              memmove(v45, v42, v44);
LABEL_71:
              v45->__r_.__value_.__s.__data_[v44] = 0;
              v48 = &buf;
              if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                v48 = (std::string *)buf.__r_.__value_.__r.__words[0];
              }
              LODWORD(v79.__r_.__value_.__l.__data_) = 136380675;
              *(std::string::size_type *)((char *)v79.__r_.__value_.__r.__words + 4) = (std::string::size_type)v48;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Path to db no longer exists: %{private}s", (uint8_t *)&v79, 0xCu);
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(buf.__r_.__value_.__l.__data_);
              }
LABEL_75:

              cntrl = self->_fsDbHandle.__cntrl_;
              self->_fsDbHandle.__ptr_ = 0;
              self->_fsDbHandle.__cntrl_ = 0;
              if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
              {
                (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
                std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
              }
LABEL_78:
              if (!sub_100007944((uint64_t)&__dst))
              {
LABEL_118:
                if (!*p_fsDbHandle)
                {
                  *((unsigned char *)&v79.__r_.__value_.__s + 23) = 10;
                  strcpy((char *)&v79, "privacy.db");
                  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
                    sub_1000559FC(&buf, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
                  }
                  else {
                    std::string buf = __dst;
                  }
                  sub_1000512AC(&buf, (uint64_t)&v79);
                  sub_1000A3E48((uint64_t)&buf, 0, (uint64_t *)&v71);
                  shared_ptr<db::resources::handle> v61 = *(shared_ptr<db::resources::handle> *)&v71.__r_.__value_.__l.__data_;
                  *(_OWORD *)&v71.__r_.__value_.__l.__data_ = 0uLL;
                  v62 = self->_fsDbHandle.__cntrl_;
                  self->_fsDbHandle = v61;
                  if (v62 && !atomic_fetch_add((atomic_ullong *volatile)v62 + 1, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    (*(void (**)(__shared_weak_count *))(*(void *)v62 + 16))(v62);
                    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v62);
                  }
                  size = (std::__shared_weak_count *)v71.__r_.__value_.__l.__size_;
                  if (v71.__r_.__value_.__l.__size_
                    && !atomic_fetch_add((atomic_ullong *volatile)(v71.__r_.__value_.__l.__size_ + 8), 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
                    std::__shared_weak_count::__release_weak(size);
                    if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    {
LABEL_128:
                      if ((SHIBYTE(v79.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                        goto LABEL_129;
                      }
                      goto LABEL_136;
                    }
                  }
                  else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  {
                    goto LABEL_128;
                  }
                  operator delete(buf.__r_.__value_.__l.__data_);
                  if ((SHIBYTE(v79.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  {
LABEL_129:
                    if (qword_10047BEF8 == -1) {
                      goto LABEL_130;
                    }
LABEL_137:
                    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
LABEL_130:
                    v64 = (id)qword_10047BF00;
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                    {
                      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Creating the base.local database with a new file handle", (uint8_t *)&buf, 2u);
                    }

                    v65 = operator new(0x58uLL);
                    sub_100098EA0(v65, (long long *)&__dst, (long long *)&v72.__val_, &self->_fsDbHandle.__ptr_);
                  }
LABEL_136:
                  operator delete(v79.__r_.__value_.__l.__data_);
                  if (qword_10047BEF8 == -1) {
                    goto LABEL_130;
                  }
                  goto LABEL_137;
                }
                sub_1003A88B8(&buf);

                v66 = (ITileDb *)abort_report_np();
LABEL_151:
                __break(1u);
                goto LABEL_152;
              }
              if (qword_10047BEF8 != -1) {
                dispatch_once(&qword_10047BEF8, &stru_10046BB50);
              }
              v50 = (id)qword_10047BF00;
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Resetting the handle to filesystem db just to be safe (it may actually be nil)", (uint8_t *)&buf, 2u);
              }

              v51 = self->_fsDbHandle.__cntrl_;
              self->_fsDbHandle.__ptr_ = 0;
              self->_fsDbHandle.__cntrl_ = 0;
              if (v51 && !atomic_fetch_add((atomic_ullong *volatile)v51 + 1, 0xFFFFFFFFFFFFFFFFLL))
              {
                (*(void (**)(__shared_weak_count *))(*(void *)v51 + 16))(v51);
                std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v51);
              }
              if (qword_10047BEF8 == -1)
              {
                v52 = (id)qword_10047BF00;
                if (!os_log_type_enabled(v52, OS_LOG_TYPE_INFO)) {
                  goto LABEL_91;
                }
              }
              else
              {
                dispatch_once(&qword_10047BEF8, &stru_10046BB50);
                v52 = (id)qword_10047BF00;
                if (!os_log_type_enabled(v52, OS_LOG_TYPE_INFO)) {
                  goto LABEL_91;
                }
              }
              v53 = &__dst;
              if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                v53 = (std::string *)__dst.__r_.__value_.__r.__words[0];
              }
              LODWORD(buf.__r_.__value_.__l.__data_) = 136380675;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v53;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "removing the db path due to version mismatch: %{private}s", (uint8_t *)&buf, 0xCu);
LABEL_91:

              memset(&v79, 0, sizeof(v79));
              sub_1000B2334((uint64_t)&__dst, &v79);
              if ((v79.__r_.__value_.__s.__data_[16] & 1) == 0
                || v79.__r_.__value_.__r.__words[2] == 1 && !LODWORD(v79.__r_.__value_.__l.__data_))
              {
                goto LABEL_118;
              }
              if (qword_10047BEF8 == -1)
              {
                v54 = (id)qword_10047BF00;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_96;
                }
              }
              else
              {
                dispatch_once(&qword_10047BEF8, &stru_10046BB50);
                v54 = (id)qword_10047BF00;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                {
LABEL_96:
                  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                    v55 = &__dst;
                  }
                  else {
                    v55 = (std::string *)__dst.__r_.__value_.__r.__words[0];
                  }
                  if (v79.__r_.__value_.__r.__words[2])
                  {
                    if (v79.__r_.__value_.__r.__words[2] == 1)
                    {
                      std::error_code::message(&v71, (const std::error_code *)&v79);
LABEL_105:
                      if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                        v57 = &v71;
                      }
                      else {
                        v57 = (std::string *)v71.__r_.__value_.__r.__words[0];
                      }
                      if (v79.__r_.__value_.__r.__words[2])
                      {
                        if (v79.__r_.__value_.__r.__words[2] == 1) {
                          v58 = &boost::system::detail::interop_cat_holder<void>::instance;
                        }
                        else {
                          v58 = (uint64_t (***)())v79.__r_.__value_.__l.__size_;
                        }
                      }
                      else
                      {
                        v58 = &boost::system::detail::system_cat_holder<void>::instance;
                      }
                      uint64_t v59 = ((uint64_t (*)(uint64_t (***)()))**v58)(v58);
                      int v60 = (int)v79.__r_.__value_.__l.__data_;
                      if (v79.__r_.__value_.__r.__words[2] == 1) {
                        int v60 = LODWORD(v79.__r_.__value_.__l.__data_) + 1000 * (v79.__r_.__value_.__l.__size_ % 0x1FFFF7);
                      }
                      LODWORD(buf.__r_.__value_.__l.__data_) = 136446978;
                      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v55;
                      WORD2(buf.__r_.__value_.__r.__words[1]) = 2082;
                      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v57;
                      HIWORD(buf.__r_.__value_.__r.__words[2]) = 2082;
                      unint64_t v76 = v59;
                      __int16 v77 = 1026;
                      int v78 = v60;
                      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Failed to remove on-disk db in %{public}s, msg, %{public}s, categoryName, %{public}s, %{public}d", (uint8_t *)&buf, 0x26u);
                      if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0) {
                        operator delete(v71.__r_.__value_.__l.__data_);
                      }
                      goto LABEL_117;
                    }
                    v56 = (uint64_t (***)())v79.__r_.__value_.__l.__size_;
                  }
                  else
                  {
                    v56 = &boost::system::detail::system_cat_holder<void>::instance;
                  }
                  ((void (*)(std::string *__return_ptr))(*v56)[4])(&v71);
                  goto LABEL_105;
                }
              }
LABEL_117:

              goto LABEL_118;
            }
          }
          memmove(v34, v31, v33);
          goto LABEL_51;
        }
        v27 = [v11 URLByAppendingPathComponent:v70];
        v28 = [v27 path];

        if (v28)
        {
          [v28 ps_STLString];
          if ((SHIBYTE(v73) & 0x80000000) == 0)
          {
LABEL_41:
            std::error_code v72 = *(std::error_code *)&buf.__r_.__value_.__l.__data_;
            std::string::size_type v73 = buf.__r_.__value_.__r.__words[2];

            goto LABEL_42;
          }
        }
        else
        {
          memset(&buf, 0, sizeof(buf));
          if ((SHIBYTE(v73) & 0x80000000) == 0) {
            goto LABEL_41;
          }
        }
        operator delete(*(void **)&v72.__val_);
        goto LABEL_41;
      }
      cat = v72.__cat_;
    }
    else
    {
      cat = (const std::error_category *)&boost::system::detail::system_cat_holder<void>::instance;
    }
    ((void (*)(std::string *__return_ptr))cat->equivalent)(&buf);
    goto LABEL_27;
  }
  if (buf.__r_.__value_.__r.__words[2] >= v10) {
    goto LABEL_32;
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    char v19 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  char v19 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_15:
    LODWORD(buf.__r_.__value_.__l.__data_) = 138478339;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v69;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2050;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v18;
    HIWORD(buf.__r_.__value_.__r.__words[2]) = 2050;
    unint64_t v76 = v10;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Cannot open %{private}@: only %{public}llu bytes remaining but need %{public}llu bytes", (uint8_t *)&buf, 0x20u);
  }
LABEL_16:
  *unsigned int v9 = 0;
  v9[1] = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }

LABEL_152:
  result.__cntrl_ = v67;
  result.__ptr_ = v66;
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  }
  unsigned int v9 = (id)qword_10047BF00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t v10 = +[CLIndoorServiceDelegate versionString];
    *(_DWORD *)std::string buf = 138543362;
    v37[0] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "New XPC connection to pipelined %{public}@", buf, 0xCu);
  }
  if (+[CLIndoorServiceDelegate validateEntitlement:@"positioning" forConnection:v8 forSelector:a2])
  {
    id v11 = [v7 _queue];
    [v8 _setQueue:v11];

    p_currentProvider = &self->_currentProvider;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);
    std::string::size_type v14 = WeakRetained;
    BOOL v15 = WeakRetained == 0;
    if (WeakRetained)
    {
      uint64_t v16 = [WeakRetained xpcConnection];
      unsigned int v17 = [v16 processIdentifier];
      if (v17 == [v8 processIdentifier])
      {
        if (qword_10047BEF8 != -1) {
          dispatch_once(&qword_10047BEF8, &stru_10046BB50);
        }
        std::string::size_type v18 = (id)qword_10047BF00;
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_28;
        }
        unsigned int v19 = [v16 processIdentifier];
        *(_DWORD *)std::string buf = 67174657;
        LODWORD(v37[0]) = v19;
        id v20 = "WARNING: Already have a connection from %{private}d - rejecting";
        id v21 = v18;
        uint32_t v22 = 8;
      }
      else
      {
        if (qword_10047BEF8 != -1) {
          dispatch_once(&qword_10047BEF8, &stru_10046BB50);
        }
        std::string::size_type v18 = (id)qword_10047BF00;
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_28;
        }
        unsigned int v28 = [v16 processIdentifier];
        unsigned int v29 = [v8 processIdentifier];
        *(_DWORD *)std::string buf = 67174913;
        LODWORD(v37[0]) = v28;
        WORD2(v37[0]) = 1025;
        *(_DWORD *)((char *)v37 + 6) = v29;
        id v20 = "WARNING: Already have a connection from %{private}d - rejecting connection from  %{private}d";
        id v21 = v18;
        uint32_t v22 = 14;
      }
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
LABEL_28:

      goto LABEL_29;
    }
    if (self->_shutdown)
    {
      if (qword_10047BEF8 != -1) {
        dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      }
      v23 = (id)qword_10047BF00;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        unsigned int v24 = [v8 processIdentifier];
        *(_DWORD *)std::string buf = 67174657;
        LODWORD(v37[0]) = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "WARNING: Connection from %{private}d postponing shutdown", buf, 8u);
      }
    }
    v25 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLIndoorProtocolPrivate];
    [v8 setExportedInterface:v25];

    v26 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLIndoorDelegateProtocolInternal];
    [v8 setRemoteObjectInterface:v26];

    [(CLIndoorServiceDelegate *)self createIndoorProvderTransaction];
    uint64_t v16 = [(CLIndoorServiceDelegate *)self onQueueCreateProviderForConnection:v8];
    [v16 setPrefetchFloorLimitIndoor:sub_10009C188((unsigned int *)&self->_tileStorageLimits)];
    [v16 setPrefetchByteSizeLimitIndoor:sub_10009BF30((uint64_t)&self->_tileStorageLimits)];
    [v16 setPrefetchFloorLimitRegional:sub_10009C05C((uint64_t)&self->_tileStorageLimits)];
    [v16 setPrefetchByteSizeLimitRegional:sub_10009BE04((uint64_t)&self->_tileStorageLimits)];
    [v8 setExportedObject:v16];
    objc_initWeak(&location, v8);
    objc_initWeak(&from, self);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10039DC04;
    v31[3] = &unk_10046BB30;
    objc_copyWeak(&v32, &location);
    objc_copyWeak(&v33, &from);
    v31[4] = self;
    [v8 setInvalidationHandler:v31];
    if (qword_10047BEF8 == -1)
    {
      v27 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_22:
        [v8 resume];
        objc_storeWeak((id *)p_currentProvider, v16);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&v32);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      v27 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
    }
    *(_DWORD *)std::string buf = 134283521;
    v37[0] = v16;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Resuming XPC connection with %{private}p as the provider", buf, 0xCu);
    goto LABEL_22;
  }
  BOOL v15 = 0;
LABEL_30:

  return v15;
}

+ (id)versionString
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 infoDictionary];

  BOOL v5 = [v4 objectForKeyedSubscript:@"CFBundleVersion"];
  unsigned __int8 v6 = [v4 objectForKeyedSubscript:@"Revision"];
  if ([(__CFString *)v6 length])
  {
    id v7 = +[NSString stringWithFormat:@"%@-%@", v5, v6];
  }
  else
  {
    id v8 = @"<unknown version>";
    if (v6) {
      id v8 = v6;
    }
    id v7 = v8;
  }
  unsigned int v9 = v7;

  return v9;
}

- (void)reloadAvailabilityTilePrefetchParameters
{
  if (qword_10047BEF8 == -1)
  {
    v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "@IndoorAvl, load, request to reload availability tile prefetch params", (uint8_t *)&buf, 2u);
  }
LABEL_4:
  id v4 = [CLAvailabilityTileParser alloc];
  BOOL v5 = [(CLIndoorServiceDelegate *)self workdir];
  unsigned __int8 v6 = +[CLIndoorProvider getAvailabilityTilePathFromWorkdir:v5];
  id v7 = [(CLAvailabilityTileParser *)v4 initWithTilePathIncrementalIO:v6];

  if (v7)
  {
    id v8 = [(CLAvailabilityTileParser *)v7 getAvlTile];
    v32[0] = sub_10009D0F4();
    v32[1] = v9;
    unsigned int v31 = sub_10009C50C((uint64_t)v8);
    int v10 = sub_100058BC0((uint64_t)v32, &v31);
    v30[0] = sub_10009D090();
    v30[1] = v11;
    unsigned int v29 = sub_10000D688((uint64_t)v8);
    int v12 = sub_100058BC0((uint64_t)v30, &v29);
    v28[0] = sub_10009D0D4();
    v28[1] = v13;
    unsigned int v27 = sub_10000BC74((uint64_t)v8);
    int v14 = sub_100058BC0((uint64_t)v28, &v27);
    v26[0] = sub_10009D050();
    v26[1] = v15;
    unsigned int v25 = sub_10000BAA0((uint64_t)v8);
    int v16 = sub_100058BC0((uint64_t)v26, &v25);
    v24[0] = sub_10009D064();
    v24[1] = v17;
    float v23 = sub_10009C418((uint64_t)v8);
    float v18 = sub_10005BF74((uint64_t)v24, &v23);
    v22[0] = sub_10009D040();
    v22[1] = v19;
    float v21 = sub_10009C40C((uint64_t)v8);
    float v20 = sub_10005BF74((uint64_t)v22, &v21);
    sub_1000A2128((uint64_t)&buf, v10, v12, v14, v16, v18, v20);
    *(_OWORD *)&self->_tileStorageLimits._maxIndoorCount = buf;
    *(void *)&self->_tileStorageLimits._numOfDaysBeforeIndoorTileRedownload = v34;
  }
}

- (BOOL)tilePrefetchShouldPrefetchTileDataForFloor:(const void *)a3
{
  BOOL v5 = [(CLIndoorServiceDelegate *)self q];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = [(CLIndoorServiceDelegate *)self transactionManager];
  unsigned __int8 v7 = [v6 hasAnyOpenTransaction];

  if ((v7 & 1) == 0)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v12 = qword_10047BF00;
      if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        int v18 = 136315138;
        *(void *)uint64_t v19 = "-[CLIndoorServiceDelegate tilePrefetchShouldPrefetchTileDataForFloor:]";
        uint64_t v13 = "%s Got delegate call from prefetcher while shutting down. Ignoring";
        int v14 = v12;
        uint32_t v15 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v12 = qword_10047BF00;
      if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
    }
    return 0;
  }
  [(CLIndoorServiceDelegate *)self initializeDb];
  if (!self->_fsDb.__ptr_)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v16 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v16 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    LOWORD(v18) = 0;
    uint64_t v13 = "Attempt to prefetch before first unlock";
    int v14 = v16;
    uint32_t v15 = 2;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v18, v15);
    return 0;
  }
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
  ptr = self->_fsDb.__ptr_;
  sub_100085B24(&v18, (uint64_t)a3);
  char v10 = (*(uint64_t (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, int *))(*(void *)ptr + 208))(ptr, rep, &v18);
  uint64_t v11 = *(std::__shared_weak_count **)&v19[4];
  if (*(void *)&v19[4]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v19[4] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  return v10;
}

- (BOOL)tilePrefetchShouldPrefetchMetadataForFloor:(const void *)a3 withLocationContext:(int64_t)a4
{
  unsigned __int8 v7 = [(CLIndoorServiceDelegate *)self q];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CLIndoorServiceDelegate *)self transactionManager];
  unsigned __int8 v9 = [v8 hasAnyOpenTransaction];

  if ((v9 & 1) == 0)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v12 = qword_10047BF00;
      if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
      {
LABEL_8:
        int v23 = 136315138;
        v24[0] = "-[CLIndoorServiceDelegate tilePrefetchShouldPrefetchMetadataForFloor:withLocationContext:]";
        uint64_t v13 = "%s Got delegate call from prefetcher while shutting down. Ignoring";
        int v14 = v12;
        uint32_t v15 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v12 = qword_10047BF00;
      if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
    }
    return 0;
  }
  [(CLIndoorServiceDelegate *)self initializeDb];
  if (!self->_fsDb.__ptr_)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v16 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v16 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
    }
    LOWORD(v23) = 0;
    uint64_t v13 = "Attempt to prefetch before first unlock";
    int v14 = v16;
    uint32_t v15 = 2;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v23, v15);
    return 0;
  }
  v10.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  if (a4 == 1)
  {
    double v11 = sub_1002767A8((uint64_t)&self->_tileStorageLimits);
    goto LABEL_19;
  }
  if (a4)
  {
    if (qword_10047BEF8 == -1)
    {
      int v18 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        double v11 = sub_100093D50((uint64_t)&self->_tileStorageLimits);
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      int v18 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
    }
    int v23 = 67109120;
    LODWORD(v24[0]) = a4;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unimplemented CLPipelinedLocationContext %d, default to indoor...", (uint8_t *)&v23, 8u);
    goto LABEL_18;
  }
  double v11 = sub_100093D50((uint64_t)&self->_tileStorageLimits);
LABEL_19:
  double v19 = v11;
  ptr = self->_fsDb.__ptr_;
  sub_100085B24(&v23, (uint64_t)a3);
  char v17 = (*(uint64_t (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, int *, double))(*(void *)ptr + 200))(ptr, v10.__d_.__rep_, &v23, v19);
  float v21 = *(std::__shared_weak_count **)((char *)v24 + 4);
  if (*(void *)((char *)v24 + 4)
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)((char *)v24 + 4) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
  return v17;
}

- (IndoorServiceTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (BOOL)initializeDb
{
  return [(CLIndoorServiceDelegate *)self initializeDb:0];
}

- (BOOL)initializeDb:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CLIndoorServiceDelegate *)self workdir];
  if (!v5)
  {
    sub_1003A87A4(buf);

    abort_report_np();
    __break(1u);
    goto LABEL_37;
  }
  if (!+[Keybag afterFirstUserUnlock])
  {
    if (qword_10047BEF8 == -1)
    {
      double v11 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_38;
      }
LABEL_19:
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Cannot initialize db - not unlocked yet", buf, 2u);
      goto LABEL_38;
    }
LABEL_37:
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    double v11 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_38;
    }
    goto LABEL_19;
  }
  ptr = self->_fsDb.__ptr_;
  if (ptr)
  {
    if (v3)
    {
      uint64_t v7 = (*(uint64_t (**)(ITileDb *))(*(void *)ptr + 240))(ptr);
      uint64_t v8 = *(unsigned __int8 *)(v7 + 23);
      if ((v8 & 0x80u) != 0) {
        uint64_t v8 = *(void *)(v7 + 8);
      }
      if (!v8)
      {
        [(CLIndoorServiceDelegate *)self createLocalizerDbWithRootDir:1 relativeTo:v5];
        if (*(void *)buf)
        {
          unsigned __int8 v9 = *(__shared_weak_count **)&buf[8];
          if (*(void *)&buf[8]) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
          }
          cntrl = self->_fsDb.__cntrl_;
          self->_fsDb.__ptr_ = *(ITileDb **)buf;
          self->_fsDb.__cntrl_ = v9;
          if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
          {
            (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
          }
        }
        if (*(void *)&buf[8]
          && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          (*(void (**)(void))(**(void **)&buf[8] + 16))(*(void *)&buf[8]);
          std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
        }
      }
    }
    goto LABEL_35;
  }
  [(CLIndoorServiceDelegate *)self createLocalizerDbWithRootDir:0 relativeTo:v5];
  shared_ptr<ITileDb> v12 = *(shared_ptr<ITileDb> *)buf;
  memset(buf, 0, sizeof(buf));
  uint64_t v13 = self->_fsDb.__cntrl_;
  self->_fsDb = v12;
  if (v13 && !atomic_fetch_add((atomic_ullong *volatile)v13 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v13 + 16))(v13);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v13);
  }
  if (*(void *)&buf[8]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**(void **)&buf[8] + 16))(*(void *)&buf[8]);
    std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
  }
  if (!self->_fsDb.__ptr_)
  {
LABEL_38:
    BOOL v17 = 0;
    goto LABEL_39;
  }
  uint64_t v20 = 0;
  float v21 = objc_alloc_init(CLIndoorTileEvictionPolicy);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  int v14 = self->_fsDb.__ptr_;
  uint32_t v15 = (uint8_t *)operator new(0x28uLL);
  *(void *)uint32_t v15 = off_10046BBA0;
  *((void *)v15 + 1) = &v20;
  *((void *)v15 + 2) = &v21;
  *((void *)v15 + 3) = &Current;
  *((void *)v15 + 4) = (char *)&v20 + 4;
  int v23 = v15;
  (*(void (**)(ITileDb *, uint8_t *))(*(void *)v14 + 152))(v14, buf);
  if (v23 == buf)
  {
    (*(void (**)(uint8_t *))(*(void *)buf + 32))(buf);
  }
  else if (v23)
  {
    (*(void (**)(void))(*(void *)v23 + 40))();
  }
  if (qword_10047BF08 != -1)
  {
    dispatch_once(&qword_10047BF08, &stru_10046BB70);
    uint64_t v16 = qword_10047BF10;
    if (!os_log_type_enabled((os_log_t)qword_10047BF10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  uint64_t v16 = qword_10047BF10;
  if (os_log_type_enabled((os_log_t)qword_10047BF10, OS_LOG_TYPE_DEFAULT))
  {
LABEL_33:
    *(_DWORD *)long long buf = 67240448;
    *(_DWORD *)&uint8_t buf[4] = HIDWORD(v20);
    *(_WORD *)&buf[8] = 1026;
    *(_DWORD *)&buf[10] = v20;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "VenueList, clearVisit, indoor, -1, -1, regional, %{public}d, %{public}d", buf, 0xEu);
  }
LABEL_34:

LABEL_35:
  BOOL v17 = 1;
LABEL_39:

  return v17;
}

- (NSURL)workdir
{
  return self->_workdir;
}

- (void)tilePrefetchForTileId:(const void *)a3 updateRelevancy:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CLIndoorServiceDelegate *)self q];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(CLIndoorServiceDelegate *)self transactionManager];
  unsigned __int8 v9 = [v8 hasAnyOpenTransaction];

  if ((v9 & 1) == 0)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v12 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v12 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
    }
    int v17 = 136315138;
    int v18 = "-[CLIndoorServiceDelegate tilePrefetchForTileId:updateRelevancy:]";
    uint64_t v13 = "%s Got delegate call from prefetcher while shutting down. Ignoring";
    int v14 = v12;
    uint32_t v15 = 12;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
    goto LABEL_11;
  }
  [(CLIndoorServiceDelegate *)self initializeDb];
  if (!self->_fsDb.__ptr_)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v16 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v16 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
    }
    LOWORD(v17) = 0;
    uint64_t v13 = "@TileFetch, error, Couldn't mark venue as relevant - before first unlock!?";
    int v14 = v16;
    uint32_t v15 = 2;
    goto LABEL_10;
  }
  [v6 timeIntervalSince1970];
  v11.__d_.__rep_ = std::chrono::system_clock::from_time_t((uint64_t)v10).__d_.__rep_;
  (*(void (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, const void *))(*(void *)self->_fsDb.__ptr_ + 192))(self->_fsDb.__ptr_, v11.__d_.__rep_, a3);
LABEL_11:
}

- (void)prefetcher:(id)a3 didFinishForegroundRequest:(id)a4
{
  id v7 = a4;
  BOOL v5 = [(CLIndoorServiceDelegate *)self q];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CLIndoorServiceDelegate *)self currentProvider];
  [v6 foregroundRequestCompleted:v7];
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (CLIndoorProvider)currentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);

  return (CLIndoorProvider *)WeakRetained;
}

- (shared_ptr<ITileDb>)createLocalizerDbWithRootDir:(BOOL)a3 relativeTo:(id)a4
{
  if (a3) {
    id v4 = (ITileDb *)[(CLIndoorServiceDelegate *)self createDbAtBasedir:@"base.local" rootdir:@"playback" relativeTo:a4];
  }
  else {
    id v4 = (ITileDb *)[(CLIndoorServiceDelegate *)self createDbAtBasedir:@"base.local" rootdir:0 relativeTo:a4];
  }
  result.__cntrl_ = v5;
  result.__ptr_ = v4;
  return result;
}

- (void)createIndoorProvderTransaction
{
  id v2 = [(CLIndoorServiceDelegate *)self transactionManager];
  [v2 openTransactionWithDescription:@"start indoor provider"];
}

+ (BOOL)isEntitled:(id)a3 forEntitlement:(id)a4
{
  return +[CLIndoorServiceDelegate isEntitled:a3 forEntitlement:a4 allowRootEverything:1];
}

+ (void)logViolation:(id)a3 ofEntitlement:(id)a4 forSelector:(SEL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  }
  unsigned __int8 v9 = (id)qword_10047BF00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    double v10 = NSStringFromSelector(a5);
    int v11 = 138543875;
    uint64_t v12 = v10;
    __int16 v13 = 1025;
    unsigned int v14 = [v7 processIdentifier];
    __int16 v15 = 2113;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Attempt to invoke %{public}@ by pid %{private}d without the appropriate entitlement %{private}@ set", (uint8_t *)&v11, 0x1Cu);
  }
}

+ (id)defaultWorkdir
{
  id v2 = +[NSFileManager defaultManager];
  if (+[Keybag supportsMultiUser])
  {
    if (+[Keybag supportsMultiUser]) {
      BOOL v3 = @"mobile";
    }
    else {
      BOOL v3 = 0;
    }
    id v4 = getpwnam((const char *)[(__CFString *)v3 UTF8String]);
    if (v4)
    {
      BOOL v5 = +[NSString stringWithUTF8String:v4->pw_dir];
    }
    else
    {
      BOOL v5 = 0;
    }
    id v8 = [&off_10046F1F0 componentsJoinedByString:@"/"];
    id v6 = [v5 stringByAppendingPathComponent:v8];

    uint64_t v7 = +[NSURL fileURLWithPath:v6];
  }
  else
  {
    BOOL v5 = [v2 URLsForDirectory:13 inDomains:1];
    if (![v5 count])
    {
      sub_1003A8468(buf);

      abort_report_np();
      goto LABEL_29;
    }
    id v6 = [v5 objectAtIndex:0];
    uint64_t v7 = [v6 URLByAppendingPathComponent:@"com.apple.pipelined"];
  }
  unsigned __int8 v9 = (void *)v7;

  if (!v9)
  {
    sub_1003A8094(buf);

    abort_report_np();
    goto LABEL_29;
  }
  id v25 = 0;
  [v2 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v10 = v25;
  if (v10)
  {
    id v16 = v10;
    int v17 = sub_1003976C0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      id v18 = [v16 localizedDescription];
      id v19 = [v18 UTF8String];
      *(_DWORD *)long long buf = 68289795;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v27 = 2082;
      unsigned int v28 = "";
      __int16 v29 = 2081;
      id v30 = v19;
      __int16 v31 = 2082;
      id v32 = "assert";
      __int16 v33 = 2081;
      uint64_t v34 = "error == nullptr";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Failed to create directory:\", \"error\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
    uint64_t v20 = sub_1003976C0();
    if (os_signpost_enabled(v20))
    {
      id v21 = [v16 localizedDescription];
      id v22 = [v21 UTF8String];
      *(_DWORD *)long long buf = 68289795;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v27 = 2082;
      unsigned int v28 = "";
      __int16 v29 = 2081;
      id v30 = v22;
      __int16 v31 = 2082;
      id v32 = "assert";
      __int16 v33 = 2081;
      uint64_t v34 = "error == nullptr";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to create directory:", "{\"msg%{public}.0s\":\"Failed to create directory:\", \"error\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
    int v23 = sub_1003976C0();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = [v16 localizedDescription];
      sub_1003A83D0((uint64_t)[v24 UTF8String], buf, v23, v24);
    }

    abort_report_np();
LABEL_29:
    __break(1u);
  }
  id v11 = v9;
  uint64_t v12 = realpath_DARWIN_EXTSN((const char *)[v11 fileSystemRepresentation], 0);
  if (!v12)
  {
    sub_1003A81A8(buf);

    abort_report_np();
    goto LABEL_29;
  }
  __int16 v13 = +[NSString stringWithUTF8String:v12];
  unsigned int v14 = +[NSURL fileURLWithPath:v13];

  if (!v14)
  {
    sub_1003A82BC(buf);

    abort_report_np();
    goto LABEL_29;
  }
  free(v12);

  return v14;
}

- (CLIndoorServiceDelegate)initWithWorkdir:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CLIndoorServiceDelegate;
  BOOL v5 = [(CLIndoorServiceDelegate *)&v45 init];
  if (!v5
    || (dispatch_queue_t v6 = dispatch_queue_create("com.apple.pipelined.positioning", 0),
        uint64_t v7 = (void *)*((void *)v5 + 14),
        *((void *)v5 + 14) = v6,
        v7,
        !*((void *)v5 + 14)))
  {
    v26 = 0;
    goto LABEL_7;
  }
  v5[56] = 0;
  id location = (id)sub_10009D0F4();
  uint64_t v42 = v8;
  int v9 = sub_100058BC0((uint64_t)&location, (unsigned int *)&v42 + 1);
  v39 = sub_10009D090();
  uint64_t v40 = v10;
  int v11 = sub_100058BC0((uint64_t)&v39, (unsigned int *)&v40 + 1);
  v37 = sub_10009D0D4();
  uint64_t v38 = v12;
  int v13 = sub_100058BC0((uint64_t)&v37, (unsigned int *)&v38 + 1);
  uint64_t v35 = sub_10009D050();
  uint64_t v36 = v14;
  int v15 = sub_100058BC0((uint64_t)&v35, (unsigned int *)&v36 + 1);
  __int16 v33 = sub_10009D064();
  uint64_t v34 = v16;
  float v17 = sub_10005BF74((uint64_t)&v33, (float *)&v34 + 1);
  __int16 v31 = sub_10009D040();
  uint64_t v32 = v18;
  float v19 = sub_10005BF74((uint64_t)&v31, (float *)&v32 + 1);
  sub_1000A2128((uint64_t)to, v9, v11, v13, v15, v17, v19);
  *(_OWORD *)(v5 + 60) = *(_OWORD *)to;
  *(void *)(v5 + 76) = v44;
  if (v4
    || (+[CLIndoorServiceDelegate defaultWorkdir],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v5 _setWorkingdir:v4];
    [v5 deleteLegacyPrefetchDatabase];
    objc_initWeak(&location, v5);
    uint64_t v20 = sub_100078A58();
    uint64_t v21 = *((void *)v5 + 14);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3321888768;
    void v28[2] = sub_10039830C;
    v28[3] = &unk_10046B9A0;
    objc_copyWeak(to, &location);
    id v22 = v4;
    to[1] = v22;
    objc_copyWeak(&v29, to);
    id v30 = to[1];
    (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v20 + 48))(v20, v21, v28);

    objc_destroyWeak(to);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", *((dispatch_queue_t *)v5 + 14), &stru_10046B9D0);
    int v23 = objc_alloc_init(IndoorServiceTransactionManager);
    [v5 setTransactionManager:v23];

    id v24 = [[Keybag alloc] initWithDelegate:v5];
    id v25 = (void *)*((void *)v5 + 17);
    *((void *)v5 + 17) = v24;

    v26 = v5;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    id v4 = v22;
LABEL_7:

    return v26;
  }
  sub_1003A857C(to);

  shared_ptr<ITileDb> result = (CLIndoorServiceDelegate *)abort_report_np();
  __break(1u);
  return result;
}

- (CLIndoorServiceDelegate)init
{
  return [(CLIndoorServiceDelegate *)self initWithWorkdir:0];
}

- (void)keybagDidLock
{
  if (qword_10047BEF8 == -1)
  {
    id v2 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      return;
    }
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v2 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      return;
    }
  }
  *(_WORD *)BOOL v3 = 0;
  _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "keybag did lock", v3, 2u);
}

- (void)keybagDidUnlock
{
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    BOOL v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "keybag did unlock", (uint8_t *)buf, 2u);
  }
LABEL_4:
  objc_initWeak(buf, self);
  q = self->_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100398784;
  v5[3] = &unk_10046B128;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  dispatch_async(q, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)_setWorkingdir:(id)a3
{
  id v5 = a3;
  id v6 = [(CLIndoorServiceDelegate *)self workdir];

  if (v6)
  {
    sub_1003A8690(&v23);

    uint64_t v18 = 344;
    float v19 = "-[CLIndoorServiceDelegate _setWorkingdir:]";
    float v17 = "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorServiceDelegate.mm";
    abort_report_np();
    __break(1u);
LABEL_21:
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    goto LABEL_13;
  }
  sub_100398DC8((uint64_t)&v23);
  if ((_BYTE)v23)
  {
    if (v25 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    uint64_t v8 = +[NSURL fileURLWithFileSystemRepresentation:p_p isDirectory:1 relativeToURL:0];
    int v9 = v8;
    if (v8)
    {
      id v10 = v8;

      id v5 = v10;
    }
  }
  id v6 = +[NSFileManager defaultManager];
  int v11 = [v5 path];
  unsigned __int8 v12 = [v6 fileExistsAtPath:v11];

  if (v12)
  {
    id v3 = 0;
    goto LABEL_16;
  }
  int v13 = [v5 path];
  id v20 = 0;
  unsigned __int8 v14 = [v6 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v3 = v20;

  if (v14) {
    goto LABEL_16;
  }
  if (qword_10047BEF8 != -1) {
    goto LABEL_21;
  }
LABEL_13:
  int v15 = (id)qword_10047BF00;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = [v3 description];
    *(_DWORD *)long long buf = 138477827;
    id v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failure to create working directory, %{private}@", buf, 0xCu);
  }
LABEL_16:
  -[CLIndoorServiceDelegate setWorkdir:](self, "setWorkdir:", v5, v17, v18, v19);

  if ((_BYTE)v23 && v25 < 0) {
    operator delete(__p);
  }
}

- (void)deleteLegacyPrefetchDatabase
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(CLIndoorServiceDelegate *)self workdir];
  id v5 = [v4 path];
  v16[0] = v5;
  v16[1] = @"prefetch";
  id v6 = +[NSArray arrayWithObjects:v16 count:2];
  uint64_t v7 = +[NSString pathWithComponents:v6];

  if (![v3 fileExistsAtPath:v7])
  {
    id v10 = 0;
    goto LABEL_11;
  }
  if (qword_10047BEF8 == -1)
  {
    uint64_t v8 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  uint64_t v8 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_4:
    *(_DWORD *)long long buf = 138477827;
    int v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Deleting legacy prefetch database directory, %{private}@", buf, 0xCu);
  }
LABEL_5:
  id v13 = 0;
  unsigned __int8 v9 = [v3 removeItemAtPath:v7 error:&v13];
  id v10 = v13;
  if ((v9 & 1) == 0)
  {
    if (qword_10047BEF8 == -1)
    {
      int v11 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      int v11 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
    }
    unsigned __int8 v12 = [v10 description];
    *(_DWORD *)long long buf = 138477827;
    int v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error, while deleting legacy prefetch database directory, %{private}@", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_11:
}

- (void)fullyVacuumAllDBs
{
}

- (void)fullyVacuumAllDBsWithReply:(id)a3
{
  id v4 = a3;
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Dispatching request to vacuum databases", (uint8_t *)buf, 2u);
  }
LABEL_4:
  objc_initWeak(buf, self);
  q = self->_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100399338;
  v8[3] = &unk_10046BA18;
  objc_copyWeak(&v10, buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(q, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)clearTiles:(id)a3
{
  id v4 = a3;
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Dispatching request to clear tiles", (uint8_t *)buf, 2u);
  }
LABEL_4:
  objc_initWeak(buf, self);
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003999F8;
  block[3] = &unk_10046BA40;
  objc_copyWeak(&v11, buf);
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(q, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

- (void)cancelPrefetch
{
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Dispatching request to cancel prefetch", (uint8_t *)buf, 2u);
  }
LABEL_4:
  objc_initWeak(buf, self);
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100399D88;
  block[3] = &unk_100468918;
  objc_copyWeak(&v6, buf);
  dispatch_async(q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)prefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  id v10 = [(CLIndoorServiceDelegate *)self q];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10039A06C;
  block[3] = &unk_10046BA68;
  objc_copyWeak(&v16, &location);
  id v14 = v8;
  id v15 = v9;
  unsigned __int8 v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (int)getMaxPriorityForPrefetch:(id)a3
{
  id v36 = a3;
  [(CLIndoorServiceDelegate *)self initializeDb];
  if (!self->_fsDb.__ptr_)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v34 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
      {
LABEL_45:
        int v19 = 0;
        goto LABEL_48;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v34 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
    }
    LOWORD(__s) = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Prefetched file before first unlock!", (uint8_t *)&__s, 2u);
    goto LABEL_45;
  }
  __p = 0;
  uint64_t v44 = 0;
  unint64_t v45 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = v36;
  id v5 = [v4 countByEnumeratingWithState:&v39 objects:v75 count:16];
  if (!v5) {
    goto LABEL_20;
  }
  uint64_t v6 = *(void *)v40;
  id v37 = v4;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v40 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      id v9 = [v8 venueUuid];
      __s = (char *)[v9 UTF8String];
      unsigned int v38 = [v8 priority];
      id v10 = v44;
      if ((unint64_t)v44 >= v45)
      {
        id v15 = sub_10039E3BC(&__p, (const char **)&__s, &v38);
        goto LABEL_18;
      }
      id v11 = __s;
      size_t v12 = strlen(__s);
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        sub_1000A6968();
      }
      size_t v13 = v12;
      if (v12 >= 0x17)
      {
        id v16 = self;
        uint64_t v17 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v17 = v12 | 7;
        }
        uint64_t v18 = v17 + 1;
        id v14 = operator new(v17 + 1);
        *((void *)v10 + 1) = v13;
        *((void *)v10 + 2) = v18 | 0x8000000000000000;
        *(void *)id v10 = v14;
        self = v16;
        id v4 = v37;
      }
      else
      {
        v44[23] = v12;
        id v14 = v10;
        if (!v12) {
          goto LABEL_17;
        }
      }
      memmove(v14, v11, v13);
LABEL_17:
      *((unsigned char *)v14 + v13) = 0;
      *((_DWORD *)v10 + 6) = v38;
      id v15 = v10 + 32;
LABEL_18:
      uint64_t v44 = v15;
    }
    id v5 = [v4 countByEnumeratingWithState:&v39 objects:v75 count:16];
  }
  while (v5);
LABEL_20:

  int v19 = (*(uint64_t (**)(ITileDb *, void **, TileStorageLimits *, int *))(*(void *)self->_fsDb.__ptr_ + 216))(self->_fsDb.__ptr_, &__p, &self->_tileStorageLimits, &v46);
  if (qword_10047BEF8 == -1)
  {
    id v20 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v20 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
    {
LABEL_22:
      LODWORD(__s) = 67240704;
      HIDWORD(__s) = v19;
      __int16 v56 = 2050;
      *(void *)v57 = (v44 - (unsigned char *)__p) >> 5;
      *(_WORD *)&v57[8] = 1026;
      *(_DWORD *)v58 = v47;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "TileFetch, maxpriority, %{public}d, len, %{public}lu, queued, %{public}d", (uint8_t *)&__s, 0x18u);
    }
  }
  if (v47)
  {
    int v21 = 100;
    if (v53) {
      int v21 = 100 * v47 / v53;
    }
    int v22 = v50 + v51;
    if (v52)
    {
      int v23 = 100 * v22 / v52;
      int v24 = 100 * v48 / v52;
      int v25 = v46;
      if (v46) {
        goto LABEL_28;
      }
LABEL_50:
      int v26 = 0;
      if (qword_10047BEF8 != -1) {
        goto LABEL_51;
      }
LABEL_29:
      __int16 v27 = qword_10047BF00;
      if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
    }
    else
    {
      int v23 = 0;
      int v24 = 0;
      int v25 = v46;
      if (!v46) {
        goto LABEL_50;
      }
LABEL_28:
      int v26 = 100 * v47 / v25;
      if (qword_10047BEF8 == -1) {
        goto LABEL_29;
      }
LABEL_51:
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      __int16 v27 = qword_10047BF00;
      if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        LODWORD(__s) = 67243008;
        HIDWORD(__s) = v46;
        __int16 v56 = 1026;
        *(_DWORD *)v57 = v47;
        *(_WORD *)&v57[4] = 1026;
        *(_DWORD *)&v57[6] = v48;
        *(_WORD *)v58 = 1026;
        *(_DWORD *)&v58[2] = v49;
        __int16 v59 = 1026;
        int v60 = v50;
        __int16 v61 = 1026;
        int v62 = v51;
        __int16 v63 = 1026;
        int v64 = v52;
        __int16 v65 = 1026;
        int v66 = v53;
        __int16 v67 = 1026;
        int v68 = v21;
        __int16 v69 = 1026;
        int v70 = v23;
        __int16 v71 = 1026;
        int v72 = v24;
        __int16 v73 = 1026;
        int v74 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Wifi2Metric, prefetch, incoming, %{public}d, queued, %{public}d, ondisk, %{public}d, lowpriortity, %{public}d, evictlow, %{public}d, evictoff, %{public}d, tiles, %{public}d, max, %{public}d, pctRequest, %{public}d, pctEvict, %{public}d, pctOndisk, %{public}d, pctFetch, %{public}d", (uint8_t *)&__s, 0x4Au);
      }
    }
    AnalyticsSendEventLazy();
    if (v22)
    {
      int v28 = 100 * v54;
      if (qword_10047BEF8 == -1)
      {
        id v29 = qword_10047BF00;
        int v30 = v28 / v22;
        if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_34;
        }
      }
      else
      {
        dispatch_once(&qword_10047BEF8, &stru_10046BB50);
        id v29 = qword_10047BF00;
        int v30 = v28 / v22;
        if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
        {
LABEL_34:
          LODWORD(__s) = 67240704;
          HIDWORD(__s) = v22;
          __int16 v56 = 1026;
          *(_DWORD *)v57 = v54;
          *(_WORD *)&v57[4] = 1026;
          *(_DWORD *)&v57[6] = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Wifi2Metric, eviction, %{public}d, untouched, %{public}d, pct, %{public}d, trigger, prefetch", (uint8_t *)&__s, 0x14u);
        }
      }
      AnalyticsSendEventLazy();
    }
  }
  __int16 v31 = (char *)__p;
  if (__p)
  {
    uint64_t v32 = v44;
    __int16 v33 = __p;
    if (v44 != __p)
    {
      do
      {
        if (*(v32 - 9) < 0) {
          operator delete(*((void **)v32 - 4));
        }
        v32 -= 32;
      }
      while (v32 != v31);
      __int16 v33 = __p;
    }
    uint64_t v44 = v31;
    operator delete(v33);
  }
LABEL_48:

  return v19;
}

- (void)onQueuePrefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5
{
  int v5 = a5;
  id v44 = a3;
  unint64_t v45 = (void (**)(void))a4;
  int v46 = self;
  id v8 = [(CLIndoorServiceDelegate *)self q];
  dispatch_assert_queue_V2(v8);

  if (v5)
  {
    if (v5 == 1) {
      [(CLIndoorServiceDelegate *)v46 setPrefetchCompletion:v45];
    }
  }
  else
  {
    v45[2]();
  }
  id v9 = [(CLIndoorServiceDelegate *)v46 transactionManager];
  [v9 openTransactionWithDescription:@"Prefetching"];

  if (![(CLIndoorServiceDelegate *)v46 initializeDb])
  {
    if (qword_10047BEF8 == -1)
    {
      id v36 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
      {
LABEL_43:
        id v10 = [(CLIndoorServiceDelegate *)v46 transactionManager];
        [v10 closeTransactionWithDescription:@"Prefetching"];
        goto LABEL_55;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      id v36 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
    }
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "TileFetch, onPrefetch, skip, database handle unavailable", buf, 2u);
    goto LABEL_43;
  }
  [(CLIndoorServiceDelegate *)v46 reloadAvailabilityTilePrefetchParameters];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v48 = objc_alloc_init((Class)NSMutableArray);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v44;
  id v11 = [obj countByEnumeratingWithState:&v58 objects:v77 count:16];
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = *(void *)v59;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v59 != v12) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      id v15 = [v14 locationContext];
      id v16 = v10;
      if (!v15) {
        goto LABEL_9;
      }
      if (v15 == (id)1)
      {
        id v16 = v48;
LABEL_9:
        [v16 addObject:v14];
        continue;
      }
    }
    id v11 = [obj countByEnumeratingWithState:&v58 objects:v77 count:16];
  }
  while (v11);
LABEL_17:

  id v43 = [v10 count];
  if (![v48 count])
  {
    int v34 = 0;
    signed int v28 = 0;
    goto LABEL_48;
  }
  id v76 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"priority" ascending:1];
  long long v42 = v76;
  uint64_t v17 = +[NSArray arrayWithObjects:&v76 count:1];
  uint64_t v18 = [v48 sortedArrayUsingDescriptors:v17];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v47 = v18;
  id v19 = [v47 countByEnumeratingWithState:&v54 objects:v75 count:16];
  if (!v19) {
    goto LABEL_31;
  }
  uint64_t v20 = *(void *)v55;
  while (2)
  {
    uint64_t v21 = 0;
    while (2)
    {
      if (*(void *)v55 != v20) {
        objc_enumerationMutation(v47);
      }
      int v22 = *(void **)(*((void *)&v54 + 1) + 8 * v21);
      if (qword_10047BEF8 == -1)
      {
        int v23 = (id)qword_10047BF00;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
      }
      else
      {
        dispatch_once(&qword_10047BEF8, &stru_10046BB50);
        int v23 = (id)qword_10047BF00;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
LABEL_25:
          id v24 = [v22 venueUuid];
          id v25 = [v24 UTF8String];
          unsigned int v26 = [v22 priority];
          *(_DWORD *)long long buf = 136380931;
          id v63 = v25;
          __int16 v64 = 1026;
          LODWORD(v65) = v26;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "TileMaxPri, sortedreg, %{private}s, %{public}d", buf, 0x12u);
        }
      }

      if (v19 != (id)++v21) {
        continue;
      }
      break;
    }
    id v27 = [v47 countByEnumeratingWithState:&v54 objects:v75 count:16];
    id v19 = v27;
    if (v27) {
      continue;
    }
    break;
  }
LABEL_31:

  signed int v28 = [(CLIndoorServiceDelegate *)v46 getMaxPriorityForPrefetch:v47];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v29 = v47;
  id v30 = [v29 countByEnumeratingWithState:&v50 objects:v74 count:16];
  if (v30)
  {
    int v31 = 0;
    uint64_t v32 = *(void *)v51;
    while (2)
    {
      __int16 v33 = 0;
      int v34 = v31 + v30;
      do
      {
        if (*(void *)v51 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v35 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v33);
        if ((uint64_t)[v35 priority] > v28)
        {
          int v34 = v31 + v33;
          goto LABEL_47;
        }
        [v10 addObject:v35];
        __int16 v33 = (char *)v33 + 1;
      }
      while (v30 != v33);
      id v30 = [v29 countByEnumeratingWithState:&v50 objects:v74 count:16];
      int v31 = v34;
      if (v30) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v34 = 0;
  }
LABEL_47:

LABEL_48:
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  }
  id v37 = (id)qword_10047BF00;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    id v38 = [obj count];
    id v39 = [v10 count];
    id v40 = [v48 count];
    *(_DWORD *)long long buf = 134350336;
    id v63 = v38;
    __int16 v64 = 2050;
    id v65 = v39;
    __int16 v66 = 2050;
    id v67 = v43;
    __int16 v68 = 2050;
    id v69 = v40;
    __int16 v70 = 1026;
    int v71 = v34;
    __int16 v72 = 1026;
    signed int v73 = v28;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "TileFetch, onPrefetch, %{public}lu, reduced, %{public}lu, indoor, %{public}lu, regional, %{public}lu, %{public}d, prioritylimit, %{public}d", buf, 0x36u);
  }

  if ([v10 count])
  {
    long long v41 = [(CLIndoorServiceDelegate *)v46 prefetcher];
    [v41 prefetch:v10];
  }
LABEL_55:
}

- (void)tilePrefetchDidDownload:(const void *)a3 forRequest:(id)a4
{
  id v6 = a4;
  id v7 = [(CLIndoorServiceDelegate *)self q];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CLIndoorServiceDelegate *)self transactionManager];
  unsigned __int8 v9 = [v8 hasAnyOpenTransaction];

  if ((v9 & 1) == 0)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v13 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v13 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CLIndoorServiceDelegate tilePrefetchDidDownload:forRequest:]";
    id v14 = "%s Got delegate call from prefetcher while shutting down. Ignoring";
    id v15 = v13;
    uint32_t v16 = 12;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_50;
  }
  [(CLIndoorServiceDelegate *)self initializeDb];
  if (!self->_fsDb.__ptr_)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v17 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v17 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
    }
    *(_WORD *)long long buf = 0;
    id v14 = "Prefetched file before first unlock!";
    id v15 = v17;
    uint32_t v16 = 2;
    goto LABEL_11;
  }
  v10.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  id v11 = [v6 venueUuid];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 ps_STLString];
  }
  else
  {
    v40[0] = 0;
    v40[1] = 0;
    uint64_t v41 = 0;
  }

  uint64_t v18 = [v6 floorUuid];
  id v19 = v18;
  if (v18)
  {
    [v18 ps_STLString];
  }
  else
  {
    v38[0] = 0;
    v38[1] = 0;
    uint64_t v39 = 0;
  }

  if (SHIBYTE(v39) < 0)
  {
    sub_1000559FC(__dst, v38[0], (unint64_t)v38[1]);
  }
  else
  {
    *(_OWORD *)std::string __dst = *(_OWORD *)v38;
    uint64_t v37 = v39;
  }
  if (SHIBYTE(v41) < 0)
  {
    sub_1000559FC(__p, v40[0], (unint64_t)v40[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v40;
    uint64_t v35 = v41;
  }
  *(void *)&double v20 = sub_100091630((uint64_t)buf, (long long *)__dst, (__n128 *)__p, +[CLLocationContextConversions fromCLPipelinedLocationContext:](CLLocationContextConversions, "fromCLPipelinedLocationContext:", [v6 context:__p[0] __p[1] v35])).n128_u64[0];
  if (SHIBYTE(v35) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v37) & 0x80000000) == 0) {
      goto LABEL_24;
    }
  }
  else if ((SHIBYTE(v37) & 0x80000000) == 0)
  {
    goto LABEL_24;
  }
  operator delete(__dst[0]);
LABEL_24:
  uint64_t v21 = [v6 lastRelevant:v20];
  [(CLIndoorServiceDelegate *)self tilePrefetchForTileId:buf updateRelevancy:v21];

  unsigned int v22 = [v6 kind];
  if (v22)
  {
    if (v22 == 1) {
      (*(void (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, unsigned char *, uint64_t, const void *, TileStorageLimits *))(*(void *)self->_fsDb.__ptr_ + 168))(self->_fsDb.__ptr_, v10.__d_.__rep_, buf, -1, a3, &self->_tileStorageLimits);
    }
  }
  else
  {
    (*(void (**)(ITileDb *, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep, unsigned char *, const void *, TileStorageLimits *))(*(void *)self->_fsDb.__ptr_ + 160))(self->_fsDb.__ptr_, v10.__d_.__rep_, buf, a3, &self->_tileStorageLimits);
  }
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  }
  int v23 = (id)qword_10047BF00;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v24 = [v6 kind];
    unsigned int v25 = [v6 session];
    int v26 = SHIBYTE(v39);
    id v27 = (void **)v38[0];
    int v28 = SHIBYTE(v41);
    id v29 = (void **)v40[0];
    id v30 = [v6 context];
    int v31 = v40;
    *(_DWORD *)long long v42 = 67241219;
    if (v28 < 0) {
      int v31 = v29;
    }
    unsigned int v43 = v24;
    uint64_t v32 = v38;
    __int16 v44 = 1026;
    if (v26 < 0) {
      uint64_t v32 = v27;
    }
    unsigned int v45 = v25;
    __int16 v46 = 2081;
    if (v30 == (id)1) {
      int v33 = 82;
    }
    else {
      int v33 = 73;
    }
    id v47 = v32;
    __int16 v48 = 2081;
    int v49 = v31;
    __int16 v50 = 1026;
    int v51 = v33;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "@TileFetch, kind, %{public}d, session, %{public}d, %{private}s, %{private}s, %{public}c", v42, 0x28u);
  }

  if (v55 < 0)
  {
    operator delete(v54);
    if ((v53 & 0x80000000) == 0)
    {
LABEL_43:
      if ((SHIBYTE(v39) & 0x80000000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_48;
    }
  }
  else if ((v53 & 0x80000000) == 0)
  {
    goto LABEL_43;
  }
  operator delete(*(void **)buf);
  if ((SHIBYTE(v39) & 0x80000000) == 0)
  {
LABEL_44:
    if (SHIBYTE(v41) < 0) {
      goto LABEL_49;
    }
    goto LABEL_50;
  }
LABEL_48:
  operator delete(v38[0]);
  if (SHIBYTE(v41) < 0) {
LABEL_49:
  }
    operator delete(v40[0]);
LABEL_50:
}

- (void)releaseObjectsNotNeededForLocalization
{
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Destroying FilesystemDB objects", buf, 2u);
  }
LABEL_4:
  cntrl = self->_fsDb.__cntrl_;
  self->_fsDb.__ptr_ = 0;
  self->_fsDb.__cntrl_ = 0;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  if (!self->_fsDbHandle.__ptr_)
  {
LABEL_13:
    if (!self->_prefetcher) {
      return;
    }
LABEL_14:
    if (qword_10047BEF8 == -1)
    {
      id v7 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      id v7 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_17:
        id v8 = [(CLIndoorServiceDelegate *)self prefetcher];
        [v8 invalidate];

        if (qword_10047BEF8 == -1)
        {
          unsigned __int8 v9 = qword_10047BF00;
          if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
          {
LABEL_20:
            [(CLIndoorServiceDelegate *)self setPrefetcher:0];
            return;
          }
        }
        else
        {
          dispatch_once(&qword_10047BEF8, &stru_10046BB50);
          unsigned __int8 v9 = qword_10047BF00;
          if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
            goto LABEL_20;
          }
        }
        *(_WORD *)std::chrono::system_clock::time_point v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Destroying the prefetcher", v10, 2u);
        goto LABEL_20;
      }
    }
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Invalidating the prefetcher", v11, 2u);
    goto LABEL_17;
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    int v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  int v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_10:
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Closing the base.local db handle", v12, 2u);
  }
LABEL_11:
  id v6 = self->_fsDbHandle.__cntrl_;
  self->_fsDbHandle.__ptr_ = 0;
  self->_fsDbHandle.__cntrl_ = 0;
  if (!v6 || atomic_fetch_add((atomic_ullong *volatile)v6 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_13;
  }
  (*(void (**)(__shared_weak_count *))(*(void *)v6 + 16))(v6);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  if (self->_prefetcher) {
    goto LABEL_14;
  }
}

- (void)tileForegroundFetchFinishedAllDownloads
{
  if (qword_10047BEF8 == -1)
  {
    id v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  id v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "TileFetch, prefetchFinished", v5, 2u);
  }
LABEL_4:
  [(CLIndoorServiceDelegate *)self initializeDb];
  ptr = self->_fsDb.__ptr_;
  if (ptr) {
    (*(void (**)(ITileDb *, TileStorageLimits *))(*(void *)ptr + 176))(ptr, &self->_tileStorageLimits);
  }
}

- (void)prefetcher:(id)a3 didFinishForegroundRequest:(id)a4 withError:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(CLIndoorServiceDelegate *)self q];
  dispatch_assert_queue_V2(v8);

  unsigned __int8 v9 = [(CLIndoorServiceDelegate *)self currentProvider];
  [v9 foregroundRequestCompleted:v10 withError:v7];
}

- (vector<std::shared_ptr<ITileDb>,)onQueueDbsToClear
{
  int v5 = [(CLIndoorServiceDelegate *)self q];
  dispatch_assert_queue_V2(v5);

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  ptr = self->_fsDb.__ptr_;
  p_fsDb = (long long *)&self->_fsDb;
  if (ptr)
  {
    if (qword_10047BEF8 == -1)
    {
      unsigned __int8 v9 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_6:
        shared_ptr<ITileDb> result = (vector<std::shared_ptr<ITileDb>, std::allocator<std::shared_ptr<ITileDb>>> *)sub_1001F4898((uint64_t)retstr, p_fsDb);
        retstr->var1 = result;
        return result;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      unsigned __int8 v9 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Device will evict from the real DB", v12, 2u);
    goto LABEL_6;
  }
  if (qword_10047BEF8 == -1)
  {
    id v11 = qword_10047BF00;
    shared_ptr<ITileDb> result = (vector<std::shared_ptr<ITileDb>, std::allocator<std::shared_ptr<ITileDb>>> *)os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO);
    if (result)
    {
LABEL_11:
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Device appears to be locked.", buf, 2u);
    }
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v11 = qword_10047BF00;
    shared_ptr<ITileDb> result = (vector<std::shared_ptr<ITileDb>, std::allocator<std::shared_ptr<ITileDb>>> *)os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO);
    if (result) {
      goto LABEL_11;
    }
  }
  return result;
}

- (void)onQueueClearTiles:(id)a3
{
  id v4 = a3;
  [(CLIndoorServiceDelegate *)self initializeDb];
  [(CLIndoorServiceDelegate *)self onQueueDbsToClear];
  if (v25 == v26)
  {
    if (qword_10047BEF8 == -1)
    {
      unsigned __int8 v9 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      unsigned __int8 v9 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
      {
LABEL_12:
        id v10 = [v4 activity];
        BOOL v11 = v10 == 0;

        if (v11) {
          goto LABEL_23;
        }
        uint64_t v12 = [v4 activity];
        BOOL v13 = xpc_activity_set_state(v12, 5);

        if (v13)
        {
LABEL_18:
          if (qword_10047BEF8 == -1)
          {
            uint64_t v17 = qword_10047BF00;
            if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_23;
            }
          }
          else
          {
            dispatch_once(&qword_10047BEF8, &stru_10046BB50);
            uint64_t v17 = qword_10047BF00;
            if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_23;
            }
          }
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "@CtsClear, DONE", buf, 2u);
          goto LABEL_23;
        }
        if (qword_10047BEF8 == -1)
        {
          id v14 = (id)qword_10047BF00;
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
LABEL_17:

            goto LABEL_18;
          }
        }
        else
        {
          dispatch_once(&qword_10047BEF8, &stru_10046BB50);
          id v14 = (id)qword_10047BF00;
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
        }
        id v15 = [v4 activity];
        xpc_activity_state_t state = xpc_activity_get_state(v15);
        *(_DWORD *)long long buf = 134349056;
        xpc_activity_state_t v29 = state;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "@CtsClear, failed to mark tile cleanup activity as done.  current state is %{public}ld", buf, 0xCu);

        goto LABEL_17;
      }
    }
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No DB handles could be obtained to process tile eviction request.", buf, 2u);
    goto LABEL_12;
  }
  __p = v25;
  int v23 = v26;
  uint64_t v24 = v27;
  unsigned int v25 = 0;
  int v26 = 0;
  uint64_t v27 = 0;
  [(CLIndoorServiceDelegate *)self onQueueClearTilesIfPossible:v4 fromDbs:&__p];
  int v5 = (char *)__p;
  if (__p)
  {
    id v6 = v23;
    id v7 = __p;
    if (v23 != __p)
    {
      do
      {
        id v8 = (std::__shared_weak_count *)*((void *)v6 - 1);
        if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
        v6 -= 16;
      }
      while (v6 != v5);
      id v7 = __p;
    }
    int v23 = v5;
    operator delete(v7);
  }
LABEL_23:
  uint64_t v18 = (char *)v25;
  if (v25)
  {
    id v19 = v26;
    double v20 = v25;
    if (v26 != v25)
    {
      do
      {
        uint64_t v21 = (std::__shared_weak_count *)*((void *)v19 - 1);
        if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
        v19 -= 16;
      }
      while (v19 != v18);
      double v20 = v25;
    }
    int v26 = v18;
    operator delete(v20);
  }
}

- (void)onQueueClearTiles:(id)a3 fromDbs:()vector<std:(std::allocator<std::shared_ptr<ITileDb>>> *)a4 :shared_ptr<ITileDb>
{
  id v53 = a3;
  id v6 = [(CLIndoorServiceDelegate *)self q];
  dispatch_assert_queue_V2(v6);

  delayedClearTilesPolicy = self->_delayedClearTilesPolicy;
  self->_delayedClearTilesPolicy = 0;

  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v8 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v8 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Releasing the database file handles before clearing tiles", buf, 2u);
  }
LABEL_4:
  cntrl = self->_fsDbHandle.__cntrl_;
  self->_fsDbHandle.__ptr_ = 0;
  self->_fsDbHandle.__cntrl_ = 0;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  *((unsigned char *)&v52.__r_.__value_.__s + 23) = 3;
  LODWORD(v52.__r_.__value_.__l.__data_) = 6645601;
  [v53 maxModifiedAge];
  if (*(double *)&v10 == -1.79769313e308) {
    std::string::assign(&v52, "privacy");
  }
  var0 = a4->var0;
  var1 = a4->var1;
  if (a4->var0 != var1)
  {
    p_fsDb = &self->_fsDb;
    *(void *)&long long v10 = 136380675;
    long long v42 = v10;
    do
    {
      if (qword_10047BEF8 == -1)
      {
        BOOL v13 = (id)qword_10047BF00;
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
      }
      else
      {
        dispatch_once(&qword_10047BEF8, &stru_10046BB50);
        BOOL v13 = (id)qword_10047BF00;
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
      }
      uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*var0 + 232))(*var0, v14, v15);
      if (*(char *)(v16 + 23) >= 0) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = *(void *)v16;
      }
      uint64_t v18 = &v52;
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint64_t v18 = (std::string *)v52.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)long long buf = 136380931;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&unsigned char buf[12] = 2082;
      *(void *)char v55 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "TileEvict, fromDB, %{private}s, trigger, %{public}s", buf, 0x16u);
LABEL_20:

      CFAbsoluteTime Current = 0.0;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      uint64_t v50 = 0;
      uint64_t v19 = *var0;
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
        sub_1000559FC(&__p, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v52;
      }
      double v20 = operator new(0x28uLL);
      *double v20 = off_10046BC80;
      v20[1] = &v53;
      v20[2] = &Current;
      v20[3] = (char *)&v50 + 4;
      v20[4] = &v50;
      *(void *)&v55[10] = v20;
      (*(void (**)(uint64_t, std::string *, unsigned char *))(*(void *)v19 + 112))(v19, &__p, buf);
      if (*(unsigned char **)&v55[10] == buf)
      {
        (*(void (**)(unsigned char *))(*(void *)buf + 32))(buf);
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_27;
        }
      }
      else
      {
        if (*(void *)&v55[10]) {
          (*(void (**)(void, uint64_t, uint64_t))(**(void **)&v55[10] + 40))(*(void *)&v55[10], v21, v22);
        }
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_27:
          if (qword_10047BEF8 == -1) {
            goto LABEL_28;
          }
          goto LABEL_44;
        }
      }
      operator delete(__p.__r_.__value_.__l.__data_);
      if (qword_10047BEF8 == -1)
      {
LABEL_28:
        int v23 = (id)qword_10047BF00;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        goto LABEL_33;
      }
LABEL_44:
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      int v23 = (id)qword_10047BF00;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_29:
        int v27 = v50;
        int v26 = HIDWORD(v50);
        uint64_t v28 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*var0 + 232))(*var0, v24, v25);
        if (*(char *)(v28 + 23) >= 0) {
          uint64_t v29 = v28;
        }
        else {
          uint64_t v29 = *(void *)v28;
        }
        *(_DWORD *)long long buf = 67240962;
        *(_DWORD *)&uint8_t buf[4] = v26;
        *(_WORD *)&uint8_t buf[8] = 1026;
        *(_DWORD *)&buf[10] = v27;
        *(_WORD *)char v55 = 2082;
        *(void *)&v55[2] = v29;
        *(_WORD *)&v55[10] = 1026;
        *(_DWORD *)&v55[12] = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "@TileEvict, numVenuesRemoved, %{public}d, untouched, %{public}d, db, %{public}s, removeAll, %{public}d", buf, 0x1Eu);
      }
LABEL_33:

      int v30 = HIDWORD(v50);
      if (HIDWORD(v50))
      {
        int v31 = v50;
        if (qword_10047BEF8 != -1) {
          dispatch_once(&qword_10047BEF8, &stru_10046BB50);
        }
        uint64_t v32 = qword_10047BF00;
        int v33 = 100 * v31 / v30;
        if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = &v52;
          if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            int v34 = (std::string *)v52.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)long long buf = 67240962;
          *(_DWORD *)&uint8_t buf[4] = HIDWORD(v50);
          *(_WORD *)&uint8_t buf[8] = 1026;
          *(_DWORD *)&buf[10] = v50;
          *(_WORD *)char v55 = 1026;
          *(_DWORD *)&v55[2] = v33;
          *(_WORD *)&v55[6] = 2082;
          *(void *)&v55[8] = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Wifi2Metric, eviction, %{public}d, untouched, %{public}d, pct, %{public}d, trigger, %{public}s", buf, 0x1Eu);
        }
        int v46 = HIDWORD(v50);
        int v47 = v50;
        int v48 = v33;
        if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
          sub_1000559FC(&v45, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
        }
        else {
          std::string v45 = v52;
        }
        AnalyticsSendEventLazy();
        if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v45.__r_.__value_.__l.__data_);
        }
      }
      var0 += 2;
    }
    while (var0 != var1);
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  uint64_t v35 = [v53 activity];
  BOOL v36 = v35 == 0;

  if (!v36)
  {
    uint64_t v37 = [v53 activity];
    BOOL v38 = xpc_activity_set_state(v37, 5);

    if (!v38)
    {
      if (qword_10047BEF8 == -1)
      {
        uint64_t v39 = (id)qword_10047BF00;
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
LABEL_58:

          goto LABEL_59;
        }
      }
      else
      {
        dispatch_once(&qword_10047BEF8, &stru_10046BB50);
        uint64_t v39 = (id)qword_10047BF00;
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
      }
      [v53 activity:v42 p_fsDb];
      id v40 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
      xpc_activity_state_t state = xpc_activity_get_state(v40);
      *(_DWORD *)long long buf = 134349056;
      *(void *)&uint8_t buf[4] = state;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "failed to mark tile cleanup activity as done.  current state is %{public}ld", buf, 0xCu);

      goto LABEL_58;
    }
  }
LABEL_59:
}

- (void)onQueueClearTilesIfPossible:(id)a3 fromDbs:()vector<std:(std::allocator<std::shared_ptr<ITileDb>>> *)a4 :shared_ptr<ITileDb>
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  }
  unsigned __int8 v9 = (id)qword_10047BF00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v7 forceClean];
    [v7 maxModifiedAge];
    *(_DWORD *)long long buf = 67240704;
    BOOL v26 = WeakRetained == 0;
    __int16 v27 = 1026;
    unsigned int v28 = v10;
    __int16 v29 = 2050;
    uint64_t v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "@CtsClear, check, providernil, %{public}d, force, %{public}d, agethresh, %{public}.1f", buf, 0x18u);
  }

  if (WeakRetained)
  {
    if (![v7 forceClean])
    {
      objc_storeStrong((id *)&self->_delayedClearTilesPolicy, a3);
      if (qword_10047BEF8 == -1)
      {
        double v20 = qword_10047BF00;
        if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
          goto LABEL_32;
        }
      }
      else
      {
        dispatch_once(&qword_10047BEF8, &stru_10046BB50);
        double v20 = qword_10047BF00;
        if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
          goto LABEL_32;
        }
      }
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "@CtsClear, scheduled deferred tile clear when localizer stops", buf, 2u);
      goto LABEL_32;
    }
    if (qword_10047BEF8 == -1)
    {
      uint64_t v12 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v12 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_10:
        sub_10039EA44(&__p, (uint64_t *)a4);
        [(CLIndoorServiceDelegate *)self onQueueClearTiles:v7 fromDbs:&__p];
        BOOL v13 = (char *)__p;
        if (__p)
        {
          uint64_t v14 = v22;
          uint64_t v15 = __p;
          if (v22 != __p)
          {
            do
            {
              uint64_t v16 = (std::__shared_weak_count *)*((void *)v14 - 1);
              if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
                std::__shared_weak_count::__release_weak(v16);
              }
              v14 -= 16;
            }
            while (v14 != v13);
            uint64_t v15 = __p;
          }
          uint64_t v22 = v13;
LABEL_31:
          operator delete(v15);
          goto LABEL_32;
        }
        goto LABEL_32;
      }
    }
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "WARNING: Request to force a clean of all tiles while localizer is active - crash may occur", buf, 2u);
    goto LABEL_10;
  }
  sub_10039EA44(&v23, (uint64_t *)a4);
  [(CLIndoorServiceDelegate *)self onQueueClearTiles:v7 fromDbs:&v23];
  uint64_t v17 = v23;
  if (v23)
  {
    uint64_t v18 = v24;
    uint64_t v15 = v23;
    if (v24 != v23)
    {
      do
      {
        uint64_t v19 = (std::__shared_weak_count *)*((void *)v18 - 1);
        if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
        v18 -= 16;
      }
      while (v18 != v17);
      uint64_t v15 = v23;
    }
    uint64_t v24 = v17;
    goto LABEL_31;
  }
LABEL_32:
}

- (void)shutdown
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10039D6E8;
  block[3] = &unk_1004527B8;
  void block[4] = self;
  dispatch_sync(q, block);
}

- (void)onQueueShutdown
{
  self->_shutdown = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);
  [WeakRetained onConnectionQueueShutdown];
}

- (int64_t)numFloors
{
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dispatching request get number of floors", (uint8_t *)&v7, 2u);
  }
LABEL_4:
  objc_initWeak(&location, self);
  uint64_t v11 = -1;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10039D8B0;
  block[3] = &unk_10046BAF8;
  objc_copyWeak(&v7, &location);
  id v8 = &v11;
  objc_copyWeak(v10, &v7);
  v10[1] = v8;
  dispatch_sync(q, block);
  objc_destroyWeak(&v7);
  int64_t v5 = v11;
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  return v5;
}

- (int64_t)onQueueNumFloors
{
  if (!+[Keybag afterFirstUserUnlock]) {
    return -1;
  }
  [(CLIndoorServiceDelegate *)self initializeDb];
  ptr = self->_fsDb.__ptr_;
  if (!ptr) {
    return -1;
  }
  int64_t result = (*(uint64_t (**)(ITileDb *))(*(void *)ptr + 72))(ptr);
  if (result < 0)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    exception->__vftable = 0;
    id v6 = sub_10015F6A0(exception);
  }
  return result;
}

- (void)setWorkdir:(id)a3
{
}

- (void)setCurrentProvider:(id)a3
{
}

- (Keybag)keybag
{
  return self->_keybag;
}

- (void)setKeybag:(id)a3
{
}

- (void)setPrefetcher:(id)a3
{
}

- (CLIndoorTileEvictionPolicy)delayedClearTilesPolicy
{
  return self->_delayedClearTilesPolicy;
}

- (BOOL)shouldImportFromPrefetchOnProviderShutdown
{
  return self->_shouldImportFromPrefetchOnProviderShutdown;
}

- (void)setTransactionManager:(id)a3
{
}

- (id)prefetchCompletion
{
  return self->_prefetchCompletion;
}

- (void)setPrefetchCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prefetchCompletion, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_delayedClearTilesPolicy, 0);
  objc_storeStrong((id *)&self->_prefetcher, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_destroyWeak((id *)&self->_currentProvider);
  objc_storeStrong((id *)&self->_workdir, 0);
  objc_storeStrong((id *)&self->_q, 0);
  cntrl = self->_fsDbHandle.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    id v4 = self->_fsDb.__cntrl_;
    if (!v4) {
      goto LABEL_7;
    }
  }
  else
  {
    id v4 = self->_fsDb.__cntrl_;
    if (!v4) {
      goto LABEL_7;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
LABEL_7:
  if (self->_workdirOverride.m_initialized)
  {
    if ((char)self->_anon_11[22] < 0) {
      operator delete(*(void **)((char *)&self->_workdirOverride.m_storage.dummy_.aligner_ + 7));
    }
    self->_workdirOverride.m_initialized = 0;
  }
}

- (id).cxx_construct
{
  self->_workdirOverride.m_initialized = 0;
  self->_fsDb.__ptr_ = 0;
  self->_fsDb.__cntrl_ = 0;
  sub_100276794((uint64_t)&self->_tileStorageLimits);
  self->_fsDbHandle.__ptr_ = 0;
  self->_fsDbHandle.__cntrl_ = 0;
  return self;
}

@end