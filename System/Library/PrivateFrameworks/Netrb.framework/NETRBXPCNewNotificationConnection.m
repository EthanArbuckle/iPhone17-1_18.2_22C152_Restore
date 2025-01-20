@interface NETRBXPCNewNotificationConnection
@end

@implementation NETRBXPCNewNotificationConnection

void ____NETRBXPCNewNotificationConnection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x2166B88A0](a2);
  uint64_t v5 = MEMORY[0x2166B87C0](a2);
  if (v5)
  {
    v6 = (void *)v5;
    NETRBInfoLog();
    free(v6);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    BOOL v8 = v7 == __netrbNotificationConnection;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 && v4 == MEMORY[0x263EF8720])
  {
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    NETRBInfoLog();
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    xpc_release(*(xpc_object_t *)(a1 + 32));
    __netrbNotificationConnection = 0;
  }
  else
  {
    if (__netrbNotificationConnection) {
      BOOL v10 = v4 == MEMORY[0x263EF8708];
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      NETRBClientSendNotification(a2);
    }
    else
    {
      NETRBNoticeLog();
    }
  }
}

@end