@interface _MapEngineRenderQueueSource
- (BOOL)isDelayedRenderQueueConsumptionSupported;
- (_MapEngineRenderQueueSource)initWithEngine:(void *)a3;
- (void)renderQueueForTimestamp:(double)a3;
@end

@implementation _MapEngineRenderQueueSource

- (BOOL)isDelayedRenderQueueConsumptionSupported
{
  mapEngine = self->_mapEngine;
  v3 = (uint64_t *)mapEngine[141];
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v4;
  if (v4 != v5)
  {
    uint64_t v6 = v4;
    while (*(unsigned char *)v6 != 20)
    {
      v6 += 16;
      if (v6 == v5) {
        goto LABEL_9;
      }
    }
  }
  if (v6 == v5)
  {
LABEL_9:
    LODWORD(v7) = 0;
    if (v4 != v5)
    {
LABEL_10:
      while (*(unsigned char *)v4 != 22)
      {
        v4 += 16;
        if (v4 == v5) {
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    uint64_t v7 = *(void *)(v6 + 8);
    if (v4 != v5) {
      goto LABEL_10;
    }
  }
  if (v4 == v5) {
LABEL_15:
  }
    BOOL v8 = 1;
  else {
    BOOL v8 = *(void *)(v4 + 8) == 0;
  }
  if (*((unsigned char *)mapEngine + 1241)) {
    BOOL v9 = v7 > 0xA;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    goto LABEL_24;
  }
  LOBYTE(v10) = 1;
  if (((1 << v7) & 0x418) != 0)
  {
LABEL_26:
    *(unsigned char *)(mapEngine[112] + 377) = 1;
    return v10;
  }
  if (((1 << v7) & 6) == 0)
  {
LABEL_24:
    *(unsigned char *)(mapEngine[112] + 377) = 0;
    if (v7 > 0xA)
    {
      LOBYTE(v10) = 1;
      return v10;
    }
    return (0x3E7u >> v7) & 1;
  }
  if (!v8) {
    goto LABEL_26;
  }
  *(unsigned char *)(mapEngine[112] + 377) = 0;
  return (0x3E7u >> v7) & 1;
}

- (_MapEngineRenderQueueSource)initWithEngine:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MapEngineRenderQueueSource;
  uint64_t v4 = [(_MapEngineRenderQueueSource *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_mapEngine = a3;
    uint64_t v6 = v4;
  }

  return v5;
}

- (void)renderQueueForTimestamp:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  v3 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v5 = 136315650;
    uint64_t v6 = "false";
    __int16 v7 = 2080;
    objc_super v8 = "/Library/Caches/com.apple.xbs/Sources/VectorKit/src/MDMapEngine.mm";
    __int16 v9 = 1024;
    int v10 = 2166;
    _os_log_impl(&dword_1A1780000, v3, OS_LOG_TYPE_FAULT, "Unsupported: Assertion with expression - %s : Failed in file - %s line - %i", (uint8_t *)&v5, 0x1Cu);
  }

  return 0;
}

@end