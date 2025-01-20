@interface NSObject(MusicKit_SoftLinking_MPCPlayerPath)
- (id)_musicKit_self_playerPath;
- (id)musicKit_playerPath_bundleID;
- (id)musicKit_playerPath_mrPlayerPath;
- (id)musicKit_playerPath_playerID;
- (id)musicKit_playerPath_route;
- (uint64_t)musicKit_playerPath_hasNonLocalEndpointRoute;
- (uint64_t)musicKit_playerPath_isCompanion;
- (uint64_t)musicKit_playerPath_isInProcess;
- (uint64_t)musicKit_playerPath_isLocal;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerPath)

- (id)musicKit_playerPath_playerID
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerPath");
  v2 = [v1 playerID];

  return v2;
}

- (id)musicKit_playerPath_route
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerPath");
  v2 = [v1 route];

  return v2;
}

- (id)_musicKit_self_playerPath
{
  getMPCPlayerPathClass();
  if (objc_opt_isKindOfClass()) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)musicKit_playerPath_bundleID
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerPath");
  id v2 = [v1 bundleID];

  return v2;
}

- (uint64_t)musicKit_playerPath_isInProcess
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerPath");
  uint64_t v2 = [v1 isInProcess];

  return v2;
}

- (uint64_t)musicKit_playerPath_isLocal
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerPath");
  uint64_t v2 = [v1 isLocalDevice];

  return v2;
}

- (uint64_t)musicKit_playerPath_hasNonLocalEndpointRoute
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(a1, "_musicKit_self_playerPath");
  uint64_t v2 = [v1 route];
  getMPAVEndpointRouteClass();
  uint64_t v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v2)
  {
    v4 = [v2 endpointObject];
    v5 = [v4 outputDevices];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (!objc_msgSend(v11, "isLocalDevice", (void)v13)
            || [v11 deviceSubtype] == 19
            || [v11 deviceSubtype] == 3)
          {
            uint64_t v3 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        uint64_t v3 = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
LABEL_16:
  }
  return v3;
}

- (uint64_t)musicKit_playerPath_isCompanion
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerPath");
  uint64_t v2 = [v1 route];
  getMPAVEndpointRouteClass();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v3 = v2) != 0)
  {
    v4 = v3;
    v5 = [v3 endpointObject];
    uint64_t v6 = [v5 isCompanionEndpoint];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)musicKit_playerPath_mrPlayerPath
{
  v1 = objc_msgSend(a1, "_musicKit_self_playerPath");
  uint64_t v2 = [v1 mrPlayerPath];

  return v2;
}

@end