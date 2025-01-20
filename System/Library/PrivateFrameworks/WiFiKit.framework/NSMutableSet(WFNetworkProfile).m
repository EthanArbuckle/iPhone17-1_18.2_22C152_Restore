@interface NSMutableSet(WFNetworkProfile)
- (BOOL)removeNetworkProfile:()WFNetworkProfile;
- (id)_equivalentExistingNetworkProfile:()WFNetworkProfile;
- (uint64_t)replaceNetworkProfile:()WFNetworkProfile;
@end

@implementation NSMutableSet(WFNetworkProfile)

- (uint64_t)replaceNetworkProfile:()WFNetworkProfile
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 _equivalentExistingNetworkProfile:v4];
  if (v5)
  {
    [a1 removeObject:v5];
  }
  else
  {
    v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      int v9 = 136315394;
      v10 = "-[NSMutableSet(WFNetworkProfile) replaceNetworkProfile:]";
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_226071000, v7, v8, "%s: no existing network matching profile %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  [a1 addObject:v4];

  return 1;
}

- (BOOL)removeNetworkProfile:()WFNetworkProfile
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 _equivalentExistingNetworkProfile:v4];
  if (v5)
  {
    [a1 removeObject:v5];
  }
  else
  {
    v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      int v9 = 136315394;
      v10 = "-[NSMutableSet(WFNetworkProfile) removeNetworkProfile:]";
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_226071000, v6, v7, "%s: no existing network matching profile %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v5 != 0;
}

- (id)_equivalentExistingNetworkProfile:()WFNetworkProfile
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__NSMutableSet_WFNetworkProfile___equivalentExistingNetworkProfile___block_invoke;
  v8[3] = &unk_26478FA90;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end