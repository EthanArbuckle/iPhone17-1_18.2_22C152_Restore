@interface WiFiLogDumpTaker
- (BOOL)didLastCaptureFallback;
- (WiFiLogDumpTaker)init;
- (id)XPCConnection:(const char *)a3;
- (void)handleConnection:(id)a3;
- (void)takeWiFiCoreCaptureDumpWithReason:(const char *)a3 callback:(id)a4;
- (void)takeWiFiDiagnosticsDumpWithPath:(const char *)a3 reason:(const char *)a4 callback:(id)a5;
- (void)takeWiFiDiagnosticsDumpWithPath:(const char *)a3 reason:(const char *)a4 shouldTryFallback:(BOOL)a5 callback:(id)a6;
- (void)takeWiFiDiagnosticsDumpWithPathAndReason:(id)a3 :(const char *)a4 :(const char *)a5;
@end

@implementation WiFiLogDumpTaker

- (WiFiLogDumpTaker)init
{
  v7.receiver = self;
  v7.super_class = (Class)WiFiLogDumpTaker;
  v2 = [(WiFiLogDumpTaker *)&v7 init];
  v3 = v2;
  if (v2)
  {
    event_queue = v2->event_queue;
    v2->event_queue = 0;

    xpc_connection = v3->xpc_connection;
    v3->xpc_connection = 0;
  }
  return v3;
}

- (void)handleConnection:(id)a3
{
}

- (id)XPCConnection:(const char *)a3
{
  NSLog(&cfstr_SCreating.isa, a2, "-[WiFiLogDumpTaker XPCConnection:]");
  v5 = (OS_dispatch_queue *)dispatch_queue_create(a3, 0);
  event_queue = self->event_queue;
  self->event_queue = v5;

  if (self->event_queue)
  {
    mach_service = xpc_connection_create_mach_service(a3, 0, 2uLL);
    xpc_connection = self->xpc_connection;
    self->xpc_connection = mach_service;

    v9 = self->xpc_connection;
    if (v9)
    {
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __34__WiFiLogDumpTaker_XPCConnection___block_invoke;
      handler[3] = &unk_264887BE0;
      handler[4] = self;
      xpc_connection_set_event_handler(v9, handler);
      xpc_connection_resume(self->xpc_connection);
      v9 = self->xpc_connection;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __34__WiFiLogDumpTaker_XPCConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleConnection:a2];
}

- (void)takeWiFiCoreCaptureDumpWithReason:(const char *)a3 callback:(id)a4
{
  objc_super v7 = (void (**)(id, uint64_t))a4;
  NSLog(&cfstr_S_0.isa, "-[WiFiLogDumpTaker takeWiFiCoreCaptureDumpWithReason:callback:]");
  uint64_t v4 = CoreCaptureControlCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    uint64_t v6 = 2 * (CoreCaptureControlCapture() == 0);
    CFRelease(v5);
  }
  else
  {
    uint64_t v6 = 1;
  }
  v7[2](v7, v6);
}

- (void)takeWiFiDiagnosticsDumpWithPath:(const char *)a3 reason:(const char *)a4 callback:(id)a5
{
  id v8 = a5;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  int v18 = 0;
  if (self->xpc_connection
    || (id v9 = [(WiFiLogDumpTaker *)self XPCConnection:"com.apple.wifi.logdumperd"],
        self->xpc_connection))
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "command", "dump");
    if (a3) {
      xpc_dictionary_set_string(v10, "log_path", a3);
    }
    if (a4) {
      xpc_dictionary_set_string(v10, "reason", a4);
    }
    NSLog(&cfstr_SendingXpcMess.isa);
    p_event_queue = &self->event_queue;
    event_queue = self->event_queue;
    v12 = p_event_queue[1];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __68__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_callback___block_invoke;
    handler[3] = &unk_264887C08;
    v16 = v17;
    id v15 = v8;
    xpc_connection_send_message_with_reply(v12, v10, event_queue, handler);
  }
  else
  {
    NSLog(&cfstr_SFailedToCreat.isa, "-[WiFiLogDumpTaker takeWiFiDiagnosticsDumpWithPath:reason:callback:]");
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
  _Block_object_dispose(v17, 8);
}

void __68__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_callback___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  NSLog(&cfstr_SReply.isa, "-[WiFiLogDumpTaker takeWiFiDiagnosticsDumpWithPath:reason:callback:]_block_invoke", xdict);
  uint64_t v3 = MEMORY[0x230F3F8D0](xdict);
  if (v3 == MEMORY[0x263EF8720])
  {
    int v5 = 1;
    goto LABEL_6;
  }
  if (v3 == MEMORY[0x263EF8708])
  {
    string = xpc_dictionary_get_string(xdict, "rc");
    if (strncmp(string, "rc.ok", 5uLL))
    {
      int v5 = 2;
LABEL_6:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)takeWiFiDiagnosticsDumpWithPath:(const char *)a3 reason:(const char *)a4 shouldTryFallback:(BOOL)a5 callback:(id)a6
{
  id v10 = a6;
  self->_didLastCaptureFallback = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_shouldTryFallback_callback___block_invoke;
  v12[3] = &unk_264887C58;
  BOOL v15 = a5;
  id v13 = v10;
  v14 = a4;
  v12[4] = self;
  id v11 = v10;
  [(WiFiLogDumpTaker *)self takeWiFiDiagnosticsDumpWithPath:a3 reason:a4 callback:v12];
}

void __86__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_shouldTryFallback_callback___block_invoke(uint64_t a1, int a2)
{
  if (a2 == 1 && *(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __86__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_shouldTryFallback_callback___block_invoke_2;
    v6[3] = &unk_264887C30;
    uint64_t v4 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v4 takeWiFiCoreCaptureDumpWithReason:v3 callback:v6];
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  }
  else
  {
    int v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

uint64_t __86__WiFiLogDumpTaker_takeWiFiDiagnosticsDumpWithPath_reason_shouldTryFallback_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)takeWiFiDiagnosticsDumpWithPathAndReason:(id)a3 :(const char *)a4 :(const char *)a5
{
}

- (BOOL)didLastCaptureFallback
{
  return self->_didLastCaptureFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->xpc_connection, 0);

  objc_storeStrong((id *)&self->event_queue, 0);
}

@end