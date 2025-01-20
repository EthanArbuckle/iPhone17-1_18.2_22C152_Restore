@interface BKOfflineCacheLoadingController
- (BKOfflineCacheLoadingController)init;
- (id)prewarmForLaunchIfNeeded;
@end

@implementation BKOfflineCacheLoadingController

- (id)prewarmForLaunchIfNeeded
{
  uint64_t v0 = sub_1007F6BC0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F6C10();
  char v4 = sub_1007F6BF0();
  char v5 = sub_1007F6BE0();
  sub_1007F6D40();
  v6 = (void *)sub_1007F6D20();
  sub_1007F6D30();

  uint64_t v7 = sub_1007F6DB0();
  uint64_t v8 = sub_1007F6DB0();
  sub_1007F6B50();
  v9 = sub_1007F6BA0();
  os_log_type_t v10 = sub_1007FE3E0();
  if (os_log_type_enabled(v9, v10))
  {
    BOOL v11 = v7 == v8;
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 67109632;
    v14[3] = v4 & 1;
    sub_1007FEE10();
    *(_WORD *)(v12 + 8) = 1024;
    v14[2] = v5 & 1;
    sub_1007FEE10();
    *(_WORD *)(v12 + 14) = 1024;
    v14[1] = v11;
    sub_1007FEE10();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Prewarming offline cache, generate=%{BOOL}d, run=%{BOOL}d, PPT=%{BOOL}d", (uint8_t *)v12, 0x14u);
    swift_slowDealloc();
  }

  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v5)
  {

    [self prewarmOfflineCache];
    return [self prewarmOfflineCache];
  }
  return result;
}

- (BKOfflineCacheLoadingController)init
{
  return (BKOfflineCacheLoadingController *)OfflineCacheLoadingController.init()();
}

- (void).cxx_destruct
{
}

@end