@interface PlayerLoadForService
@end

@implementation PlayerLoadForService

void __mt_PlayerLoadForService_block_invoke(uint64_t a1)
{
  v2 = (ipc_space_t *)MEMORY[0x263EF8960];
  MEMORY[0x22A64C330](*(unsigned int *)(*(void *)(a1 + 32) + 112), 32, *MEMORY[0x263EF8960], *(void *)(a1 + 40));
  mach_port_mod_refs(*v2, *(_DWORD *)(a1 + 48), 1u, -1);
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_group_leave(v3);
}

uint64_t __mt_PlayerLoadForService_block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!dispatch_source_testcancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 128))
    && !IODataQueueWaitForAvailableData(*(IODataQueueMemory **)(a1 + 40), *(_DWORD *)(a1 + 48))
    && IODataQueueDataAvailable(*(IODataQueueMemory **)(a1 + 40)))
  {
    uint32_t v13 = 528;
    MEMORY[0x270FA5388]();
    memset(v12, 170, 0x210uLL);
    uint64_t result = IODataQueueDequeue(*(IODataQueueMemory **)(a1 + 40), v12, &v13);
    if (result) {
      return result;
    }
    unsigned int v3 = -536870201;
    unsigned int v4 = bswap32(v12[0]);
    unsigned int v5 = bswap32(v12[2]);
    unsigned int v14 = v4;
    unsigned int v16 = v5;
    uint64_t v6 = bswap32(v12[131]);
    unsigned int v18 = v6;
    memcpy(v17, &v12[3], sizeof(v17));
    unsigned int v15 = -536870201;
    if (v4 == 1)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(uint64_t (**)(uint64_t, void, unsigned char *, uint64_t, void))(v10 + 200);
      if (!v11) {
        goto LABEL_15;
      }
      unsigned int v9 = v11(v10, v5, v17, v6, *(void *)(v10 + 192));
    }
    else
    {
      if (v4
        || (uint64_t v7 = *(void *)(a1 + 32),
            (v8 = *(uint64_t (**)(uint64_t, void, unsigned char *, uint64_t, unsigned int *, void))(v7 + 184)) == 0))
      {
LABEL_15:
        unsigned int v14 = bswap32(v14);
        unsigned int v15 = bswap32(v3);
        unsigned int v16 = bswap32(v16);
        unsigned int v18 = bswap32(v18);
        uint64_t result = IOConnectCallStructMethod(*(_DWORD *)(*(void *)(a1 + 32) + 112), 1u, &v14, 0x210uLL, 0, 0);
        if (result) {
          return printf("error 0x%08X handling control request\n", result);
        }
        return result;
      }
      unsigned int v9 = v8(v7, v5, v17, v6, &v18, *(void *)(v7 + 192));
    }
    unsigned int v3 = v9;
    goto LABEL_15;
  }
  return puts("unable to handle control requests");
}

@end