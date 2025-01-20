@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  objc_msgSend(a4, "setExportedInterface:", objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26DB3B8B8));
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_deviceClassAttached_options_withReply_, 1, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_bootstrapWithOptions_, 0, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_findFirmwareWithOptions_remote_, 0, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_downloadFirmwareWithOptions_, 0, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_prepareFirmwareWithOptions_, 0, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_applyFirmwareWithOptions_, 0, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_finishWithOptions_, 0, 0);
  objc_msgSend(a4, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26DB3D318));
  objc_msgSend(a4, "setExportedObject:", +[AUServiceAdapter sharedInstance](AUServiceAdapter, "sharedInstance"));
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3052000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v17 = 0;
  v17 = +[AUServiceAdapter sharedInstance];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3052000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  v15[5] = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_2647FC910;
  v14[4] = v15;
  v14[5] = v16;
  [a4 setInvalidationHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v13[3] = &unk_2647FC910;
  v13[4] = v15;
  v13[5] = v16;
  [a4 setInterruptionHandler:v13];
  if (-[AUServiceAdapter hasActiveConnection](+[AUServiceAdapter sharedInstance](AUServiceAdapter, "sharedInstance"), "hasActiveConnection")|| ![a4 valueForEntitlement:@"com.apple.private.accessoryupdater.client"])
  {
    NSLog(&cfstr_SDenyingIncomi.isa, "-[ServiceDelegate listener:shouldAcceptNewConnection:]", [+[AUServiceAdapter sharedInstance](AUServiceAdapter, "sharedInstance") hasActiveConnection]);
    BOOL v11 = 0;
  }
  else
  {
    [+[AUServiceAdapter sharedInstance] setActiveConnection:a4];
    [a4 resume];
    BOOL v11 = 1;
  }
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);
  return v11;
}

uint64_t __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_XpcConnectionI.isa);
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setInvalidationHandler:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setInterruptionHandler:0];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 setActiveConnection:0];
}

uint64_t __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_XpcConnectionI_0.isa);
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setInvalidationHandler:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setInterruptionHandler:0];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 setActiveConnection:0];
}

@end