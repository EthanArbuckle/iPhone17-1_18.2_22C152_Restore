@interface NSArray
@end

@implementation NSArray

void __85__NSArray_MRAdditions__changeDescriptionTo_keyBlock_isUpdatedBlock_descriptionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5)
  {
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))()) {
      v6 = *(void **)(a1 + 40);
    }
    else {
      v6 = *(void **)(a1 + 48);
    }
    uint64_t v7 = (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    v6 = *(void **)(a1 + 56);
    uint64_t v7 = (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  v8 = (void *)v7;
  [v6 addObject:v7];
}

id __45__NSArray_MRAVAdditions__mr_allOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [v2 activatedClusterMembersOutputDevices];
  if (v3)
  {
    v8[0] = v2;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

    v5 = [v4 arrayByAddingObjectsFromArray:v3];
    id v2 = v4;
  }
  else
  {
    id v7 = v2;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  }

  return v5;
}

MRAVDistantEndpoint *__45__NSArray_MRAVAdditions__mr_distantEndpoints__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = (MRAVDistantEndpoint *)v2;
  }
  else
  {
    v4 = [MRAVDistantEndpoint alloc];
    v5 = [v2 descriptor];
    v3 = [(MRAVDistantEndpoint *)v4 initWithDescriptor:v5];
  }

  return v3;
}

MRAVDistantOutputDevice *__49__NSArray_MRAVAdditions__mr_distantOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [MRAVDistantOutputDevice alloc];
  v4 = [v2 descriptor];

  v5 = [(MRAVDistantOutputDevice *)v3 initWithDescriptor:v4];

  return v5;
}

BOOL __54__NSArray_MRAVAdditions__mr_containsVideoOutputDevice__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = [v2 deviceSubtype] == 7
  }
      || [v2 deviceSubtype] == 8
      || [v2 deviceSubtype] == 11
      || [v2 deviceSubtype] == 13
      || [v2 deviceSubtype] == 15 && objc_msgSend(v2, "clusterType") == 2
      || [v2 deviceSubtype] == 16
      || [v2 deviceSubtype] == 17
      || [v2 deviceSubtype] == 18;
  else {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t __57__NSArray_MRAVAdditions__mr_arrayByRemovingLocalEndpoint__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocalEndpoint] ^ 1;
}

MRAVDistantOutputDevice *__49__NSArray_MRAVAdditions__mr_redactClusterMembers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 descriptor];
  [v2 setActivatedClusterMembers:0];
  BOOL v3 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v2];

  return v3;
}

BOOL __57__NSArray_MRCommandInfoAdditions__mr_isCommandSupported___block_invoke(uint64_t a1, void *a2)
{
  return [a2 command] == *(_DWORD *)(a1 + 32);
}

uint64_t __67__NSArray_MRCommandInfoAdditions__mr_isCommandSupportedAndEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 command] == *(_DWORD *)(a1 + 32)) {
    uint64_t v4 = [v3 isEnabled];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL __60__NSArray_MRCommandInfoAdditions__mr_ifDisabledWhyDisabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 command] == *(_DWORD *)(a1 + 32);
}

@end