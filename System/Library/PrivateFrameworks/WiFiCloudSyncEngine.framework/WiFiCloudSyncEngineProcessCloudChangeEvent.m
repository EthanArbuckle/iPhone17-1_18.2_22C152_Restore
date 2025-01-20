@interface WiFiCloudSyncEngineProcessCloudChangeEvent
@end

@implementation WiFiCloudSyncEngineProcessCloudChangeEvent

void ____WiFiCloudSyncEngineProcessCloudChangeEvent_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48))
  {
    v2 = 0;
    v3 = &_os_log_internal;
    do
    {
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v2, v7, v8);
      if (v4)
      {
        v5 = (void *)v4;
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136316162;
          v10 = "__WiFiCloudSyncEngineProcessCloudChangeEvent_block_invoke";
          __int16 v11 = 2080;
          v12 = "WiFiCloudSyncEngine.m";
          __int16 v13 = 1024;
          int v14 = 1176;
          __int16 v15 = 2048;
          v16 = v2;
          __int16 v17 = 2112;
          v18 = v5;
          LODWORD(v8) = 48;
          v7 = &v9;
          _os_log_send_and_compose_impl();
        }
        if (objc_msgSend(*(id *)(a1 + 40), "isKVSEncrypted", v7, v8))
        {
          if ([v5 hasPrefix:@"network."]) {
            goto LABEL_11;
          }
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            int v9 = 136315906;
            v10 = "__WiFiCloudSyncEngineProcessCloudChangeEvent_block_invoke";
            __int16 v11 = 2080;
            v12 = "WiFiCloudSyncEngine.m";
            __int16 v13 = 1024;
            int v14 = 1184;
            __int16 v15 = 2112;
            v16 = (char *)v5;
            LODWORD(v8) = 38;
            v7 = &v9;
LABEL_14:
            _os_log_send_and_compose_impl();
          }
        }
        else
        {
          unint64_t v6 = [v5 length];
          if (v6 < [@"WiFiCloudSyncEngineNonSSIDKeyPrefix_" length])
          {
LABEL_11:
            __WiFiCloudSyncEngineProcessCloudNetworkChangeEvent(*(void *)(a1 + 56), *(void **)(a1 + 40));
            goto LABEL_15;
          }
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            int v9 = 136315906;
            v10 = "__WiFiCloudSyncEngineProcessCloudChangeEvent_block_invoke";
            __int16 v11 = 2080;
            v12 = "WiFiCloudSyncEngine.m";
            __int16 v13 = 1024;
            int v14 = 1193;
            __int16 v15 = 2112;
            v16 = (char *)v5;
            LODWORD(v8) = 38;
            v7 = &v9;
            goto LABEL_14;
          }
        }
      }
LABEL_15:
      ++v2;
    }
    while ((unint64_t)v2 < *(void *)(a1 + 48));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 56) + 280));
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

@end