@interface MAManifestStorageServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_descriptionForConnection:(id)a3;
@end

@implementation MAManifestStorageServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.private.MobileAsset.ManifestStorageService"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    v11 = [(MAManifestStorageServiceDelegate *)self _descriptionForConnection:v5];
    _MobileAssetLog(0, 6, (uint64_t)"-[MAManifestStorageServiceDelegate listener:shouldAcceptNewConnection:]", @"Client connected: %@", v12, v13, v14, v15, (uint64_t)v11);
    v16 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MAManifestStorageServiceProtocol];
    [v5 setExportedInterface:v16];

    v17 = objc_alloc_init(MAManifestStorageService);
    [v5 setExportedObject:v17];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100003018;
    v24[3] = &unk_1000082E8;
    id v18 = v11;
    id v25 = v18;
    [v5 setInvalidationHandler:v24];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100003058;
    v22[3] = &unk_1000082E8;
    id v23 = v18;
    id v19 = v18;
    [v5 setInterruptionHandler:v22];
    [v5 resume];

    BOOL v20 = 1;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageServiceDelegate listener:shouldAcceptNewConnection:]", @"Rejecting incoming XPC connection: %@", v7, v8, v9, v10, (uint64_t)v5);
    BOOL v20 = 0;
  }

  return v20;
}

- (id)_descriptionForConnection:(id)a3
{
  id v3 = a3;
  id v4 = [v3 processIdentifier];
  id v5 = [v3 effectiveUserIdentifier];

  bzero(buffer, 0x1000uLL);
  if (proc_pidpath((int)v4, buffer, 0x1000u) < 1)
  {
    v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    v6 = +[NSString stringWithUTF8String:buffer];
    uint64_t v7 = [v6 lastPathComponent];
  }
  uint64_t v8 = +[NSString stringWithFormat:@"%@ (pid = %d, uid = %d, path = %@)", v7, v4, v5, v6];

  return v8;
}

@end