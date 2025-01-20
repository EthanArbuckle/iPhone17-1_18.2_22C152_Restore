@interface MRServiceClientRemoteResolvedPlayerPathCommandCallbacks
@end

@implementation MRServiceClientRemoteResolvedPlayerPathCommandCallbacks

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_2;
  v6[3] = &unk_1E57D0790;
  v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_sync(v4, v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(a1 + 40)];
}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_3(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_4;
  v8[3] = &__block_descriptor_36_e26___NSArray_16__0__NSArray_8l;
  int v9 = *(_DWORD *)(a1 + 56);
  v2 = (void (**)(void, void))MEMORY[0x1997190F0](v8);
  id v3 = [MRCommandResult alloc];
  v4 = v2[2](v2, *(void *)(a1 + 32));
  uint64_t v5 = *(unsigned int *)(a1 + 60);
  v6 = [*(id *)(a1 + 40) playerPath];
  id v7 = [(MRCommandResult *)v3 initWithResultStatuses:v4 sendError:v5 playerPath:v6];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[v3 mutableCopy];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_5;
  v11 = &unk_1E57D5590;
  id v5 = v4;
  id v12 = v5;
  v13 = &v14;
  [v3 enumerateObjectsUsingBlock:&v8];
  if (*((unsigned char *)v15 + 24) && !objc_msgSend(v5, "count", v8, v9, v10, v11))
  {
    v6 = +[MRSendCommandResultStatus statusWithCode:2 * (MRMediaRemoteCommandIsLegacy(*(_DWORD *)(a1 + 32)) == 0)];
    [v5 addObject:v6];
  }
  _Block_object_dispose(&v14, 8);

  return v5;
}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallbacks_block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 statusCode] == 3)
  {
    [*(id *)(a1 + 32) removeObject:v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end