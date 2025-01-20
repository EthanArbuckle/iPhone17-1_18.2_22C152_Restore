@interface TUSimulatedIDSIDQueryController
- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8;
@end

@implementation TUSimulatedIDSIDQueryController

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v10 = a8;
  v11 = _validDictionaryForDestinations(a3);
  (*((void (**)(id, void *))a8 + 2))(v10, v11);

  return 1;
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v10 = a8;
  v11 = _validDictionaryForDestinations(a3);
  (*((void (**)(id, void *))a8 + 2))(v10, v11);

  return 1;
}

- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v10 = a8;
  v11 = _validDictionaryForDestinations(a3);
  (*((void (**)(id, void *))a8 + 2))(v10, v11);

  return 1;
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v26 = (void (**)(id, void *))a8;
  v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v29 = *(void *)v32;
    uint64_t v28 = *MEMORY[0x1E4F6B288];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * v12);
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F6B5C8]) initWithPrefixedURI:v13];
        id v15 = objc_alloc(MEMORY[0x1E4F6B440]);
        v16 = [@"push-token" dataUsingEncoding:4];
        v17 = [MEMORY[0x1E4F1C9B8] data];
        v18 = [MEMORY[0x1E4F1C9C8] date];
        v19 = [MEMORY[0x1E4F1C9C8] date];
        v20 = (void *)[v15 initWithURI:v14 clientData:MEMORY[0x1E4F1CC08] pushToken:v16 sessionToken:v17 expireDate:v18 refreshDate:v19];

        id v21 = objc_alloc(MEMORY[0x1E4F6B448]);
        uint64_t v36 = v28;
        v37 = &unk_1EED240F0;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v23 = (void *)[v21 initWithCapabilitiesMap:v22];

        [v20 setValue:v23 forKey:@"_capabilities"];
        v35 = v20;
        v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
        [v30 setObject:v24 forKeyedSubscript:v13];

        ++v12;
      }
      while (v11 != v12);
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v11);
  }

  v26[2](v26, v30);
  return 1;
}

@end