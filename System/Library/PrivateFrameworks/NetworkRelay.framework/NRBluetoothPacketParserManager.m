@interface NRBluetoothPacketParserManager
- (NRBluetoothPacketParserManager)init;
@end

@implementation NRBluetoothPacketParserManager

- (void).cxx_destruct
{
}

- (NRBluetoothPacketParserManager)init
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)NRBluetoothPacketParserManager;
  v2 = [(NRBluetoothPacketParserManager *)&v18 init];
  if (!v2)
  {
    v7 = nrCopyLogObj_518();
    v8 = v7;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

      if (!v9)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v16 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v16 = 136446210;
        *(void *)(v16 + 4) = "-[NRBluetoothPacketParserManager init]";
        id v17 = nrCopyLogObj_518();
        _NRLogAbortWithPack(v17);
      }
    }
    id v10 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v10, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v11, v12, v13, v14, v15, (uint64_t)"");

    goto LABEL_8;
  }
  v3 = v2;
  v2->_lock._os_unfair_lock_opaque = 0;
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  parserDictionary = v3->_parserDictionary;
  v3->_parserDictionary = v4;

  return v3;
}

uint64_t __51__NRBluetoothPacketParserManager_copySharedManager__block_invoke()
{
  v0 = objc_alloc_init(NRBluetoothPacketParserManager);
  uint64_t v1 = copySharedManager_manager;
  copySharedManager_manager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end