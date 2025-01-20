@interface NWStatsEntityMapperNEHelper
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
@end

@implementation NWStatsEntityMapperNEHelper

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  v16[0] = 0;
  v16[1] = 0;
  if (v5)
  {
    [v5 getUUIDBytes:v16];
    uint64_t v7 = NEHelperCacheCopySigningIdentifierMapping();
    v8 = (void *)v7;
    if (!v7)
    {
LABEL_8:
      int v11 = 0;
      v12 = 0;
      goto LABEL_9;
    }
    if (MEMORY[0x21D4A87B0](v7) == MEMORY[0x263EF8798])
    {
      uint64_t v14 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v8)];
      if (v14)
      {
        v12 = (void *)v14;
        int v11 = 4;
LABEL_9:

        if (!a4) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      v9 = NStatGetLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      *(_WORD *)v15 = 0;
      v10 = "NEHelper signing id is string but no identifier";
    }
    else
    {
      v9 = NStatGetLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        goto LABEL_8;
      }
      *(_WORD *)v15 = 0;
      v10 = "xpc get type does not give a string";
    }
    _os_log_impl(&dword_21C4BC000, v9, OS_LOG_TYPE_ERROR, v10, v15, 2u);
    goto LABEL_7;
  }
  int v11 = 0;
  v12 = 0;
  if (a4) {
LABEL_10:
  }
    *a4 = v11;
LABEL_11:

  return v12;
}

@end