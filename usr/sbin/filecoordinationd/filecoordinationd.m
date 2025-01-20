uint64_t receive_nspace_handle()
{
  return 5;
}

uint64_t receive_vfs_resolve_dir_with_audit_token(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (*a7 | a7[1] | a7[2] | a7[3])
  {
    int v8 = a2;
    int v9 = 1;
LABEL_3:
    make_nspace_handle_response(v8, 0, 0, v9);
    return 0;
  }
  v14 = _NSFCLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = *(_DWORD *)(a6 + 20);
    *(_DWORD *)v20 = 67109891;
    *(_DWORD *)&v20[4] = v15;
    *(_WORD *)&v20[8] = 2081;
    *(void *)&v20[10] = a5;
    *(_WORD *)&v20[18] = 1024;
    *(_DWORD *)&v20[20] = a2;
    *(_WORD *)&v20[24] = 2081;
    *(void *)&v20[26] = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Received nspace IPC from %u for %{private}s - req: %d - subitem: %{private}s", v20, 0x22u);
  }
  if (!a5)
  {
    int v8 = a2;
    int v9 = 22;
    goto LABEL_3;
  }
  if (a3 == 0x4000) {
    v17 = (NSFileProviderKernelMaterializationInfo *)+[NSFileProviderKernelMaterializationInfo partialFolderMaterializationInfoWithOperation:0x4000 fileName:a4];
  }
  else {
    v17 = +[NSFileProviderKernelMaterializationInfo kernelMaterializationInfoWithOperation:a3];
  }
  long long v18 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)v20 = *(_OWORD *)a6;
  *(_OWORD *)&v20[16] = v18;
  handle_nspace_request_with_info(a2, v20, a5, (uint64_t)v17);
  return 0;
}

uint64_t make_nspace_handle_response(int a1, uint64_t a2, uint64_t a3, int a4)
{
  int v8 = _NSFCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 67109120;
    int v12 = a1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Made nspace response - req: %d", (uint8_t *)&v11, 8u);
  }
  if (a3)
  {
    int v11 = a1;
    int v12 = a4;
    uint64_t v13 = a2;
    uint64_t v14 = a3;
    size_t v9 = 24;
  }
  else
  {
    int v11 = a1;
    int v12 = a4;
    if (a2)
    {
      uint64_t v13 = a2;
      size_t v9 = 16;
    }
    else
    {
      size_t v9 = 8;
    }
  }
  return sysctlbyname("vfs.nspace.complete", 0, 0, &v11, v9);
}

void handle_nspace_request_with_info(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  int v8 = +[NSURL fileURLWithFileSystemRepresentation:a3 isDirectory:0 relativeToURL:0];
  if (!v8)
  {
    uint64_t v13 = _NSFCLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      handle_nspace_request_with_info_cold_1(a3, v13, v14, v15, v16, v17, v18, v19);
    }
    int v9 = 12;
    *((_DWORD *)v24 + 6) = 12;
    goto LABEL_7;
  }
  int v9 = *((_DWORD *)v24 + 6);
  if (v9)
  {
LABEL_7:
    make_nspace_handle_response(a1, 0, 0, v9);
    goto LABEL_8;
  }
  v10 = (void *)mainArbiter;
  int v11 = +[NSNumber numberWithUnsignedInt:a1];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __handle_nspace_request_with_info_block_invoke;
  v21[3] = &unk_1000041E0;
  v21[4] = &v23;
  int v22 = a1;
  long long v12 = a2[1];
  v20[0] = *a2;
  v20[1] = v12;
  [v10 makeProviderMaterializeFileAtURL:v8 kernelInfo:a4 withRequestID:v11 fromProcess:v20 completionHandler:v21];
LABEL_8:
  _Block_object_dispose(&v23, 8);
}

void sub_100002054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t receive_vfs_resolve_file_with_audit_token(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  if (*a8 | a8[1] | a8[2] | a8[3])
  {
    int v9 = a2;
    int v10 = 1;
  }
  else
  {
    uint64_t v16 = _NSFCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = *(_DWORD *)(a7 + 20);
      *(_DWORD *)int v22 = 67110147;
      *(_DWORD *)&v22[4] = v17;
      *(_WORD *)&v22[8] = 2081;
      *(void *)&v22[10] = a6;
      *(_WORD *)&v22[18] = 1024;
      *(_DWORD *)&v22[20] = a2;
      *(_WORD *)&v22[24] = 2048;
      *(void *)&v22[26] = a4;
      __int16 v23 = 2048;
      uint64_t v24 = a5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Received nspace IPC from %u for %{private}s - req: %d - offset: %lld, size: %lld", v22, 0x2Cu);
    }
    if (a6)
    {
      id v19 = +[NSFileProviderKernelMaterializationInfo fileMaterializationInfoWithOperation:a3 size:a5 offset:a4];
      long long v20 = *(_OWORD *)(a7 + 16);
      *(_OWORD *)int v22 = *(_OWORD *)a7;
      *(_OWORD *)&v22[16] = v20;
      handle_nspace_request_with_info(a2, v22, a6, (uint64_t)v19);
      return 0;
    }
    int v9 = a2;
    int v10 = 22;
  }
  make_nspace_handle_response(v9, 0, 0, v10);
  return 0;
}

uint64_t receive_vfs_resolve_reparent_with_audit_token(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (!(*a7 | a7[1] | a7[2] | a7[3]))
  {
    long long v12 = _NSFCLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = *(_DWORD *)(a6 + 20);
      *(_DWORD *)buf = 67109891;
      *(_DWORD *)&buf[4] = v13;
      LOWORD(v41) = 2081;
      *(void *)((char *)&v41 + 2) = a4;
      WORD5(v41) = 1024;
      HIDWORD(v41) = a2;
      LOWORD(v42[0]) = 2081;
      *(void *)((char *)v42 + 2) = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Received nspace reparent IPC from %u for %{private}s - req: %d - destination %{private}s", buf, 0x22u);
    }
    if (!a4 || !a5)
    {
      make_nspace_handle_response(a2, 0, 0, 22);
      return 0;
    }
    *(void *)buf = 0;
    *(void *)&long long v41 = buf;
    *((void *)&v41 + 1) = 0x2020000000;
    v42[0] = 0;
    uint64_t v15 = +[NSURL fileURLWithFileSystemRepresentation:a4 isDirectory:0 relativeToURL:0];
    uint64_t v16 = +[NSURL fileURLWithFileSystemRepresentation:a5 isDirectory:1 relativeToURL:0];
    if (v15)
    {
      int v17 = v16;
      if (v16)
      {
        int v18 = *(_DWORD *)(v41 + 24);
        if (!v18)
        {
          id v19 = (void *)mainArbiter;
          long long v20 = +[NSNumber numberWithUnsignedInt:a2];
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = __receive_vfs_resolve_reparent_with_audit_token_block_invoke;
          v38[3] = &unk_100004158;
          v38[4] = buf;
          int v39 = a2;
          long long v21 = *(_OWORD *)(a6 + 16);
          v37[0] = *(_OWORD *)a6;
          v37[1] = v21;
          [v19 resolveReparentRequestOfFileAtURL:v15 toDestinationDirectory:v17 withRequestID:v20 operation:a3 fromProcess:v37 completionHandler:v38];
LABEL_18:
          _Block_object_dispose(buf, 8);
          return 0;
        }
LABEL_17:
        make_nspace_handle_response(a2, 0, 0, v18);
        goto LABEL_18;
      }
      v29 = _NSFCLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        handle_nspace_request_with_info_cold_1(a5, v29, v30, v31, v32, v33, v34, v35);
      }
    }
    else
    {
      int v22 = _NSFCLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        handle_nspace_request_with_info_cold_1(a4, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    int v18 = 12;
    *(_DWORD *)(v41 + 24) = 12;
    goto LABEL_17;
  }
  make_nspace_handle_response(a2, 0, 0, 1);
  return 0;
}

void sub_1000024A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __receive_vfs_resolve_reparent_with_audit_token_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = nspaceErrnoFromNSError(a4);
  }
  int v7 = *(_DWORD *)(a1 + 40);
  int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  return make_nspace_handle_response(v7, a3, a2, v8);
}

uint64_t nspaceErrnoFromNSError(void *a1)
{
  id v2 = [a1 code];
  id v3 = [a1 domain];
  if ((uint64_t)v2 > 0)
  {
    if (v2 != (id)1)
    {
      if (v2 == (id)3072 && ([v3 isEqualToString:NSCocoaErrorDomain] & 1) != 0) {
        return 89;
      }
      return 60;
    }
    if ([v3 isEqualToString:NSPOSIXErrorDomain]) {
      return 1;
    }
    else {
      return 60;
    }
  }
  else
  {
    if (v2 != (id)-1005)
    {
      if (v2 == (id)-1000) {
        return 81;
      }
      return 60;
    }
    return 70;
  }
}

uint64_t receive_vfs_resolve_dir(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v11 = _NSFCLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v15 = 67109891;
    *(_DWORD *)&v15[4] = a3;
    *(_WORD *)&v15[8] = 2081;
    *(void *)&v15[10] = a6;
    *(_WORD *)&v15[18] = 1024;
    int v16 = a2;
    LOWORD(v17[0]) = 2081;
    *(void *)((char *)v17 + 2) = a5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Received nspace IPC from %u for %{private}s - req: %d - subitem: %{private}s", v15, 0x22u);
  }
  if (a6)
  {
    if (a4 == 0x4000) {
      int v13 = (NSFileProviderKernelMaterializationInfo *)+[NSFileProviderKernelMaterializationInfo partialFolderMaterializationInfoWithOperation:0x4000 fileName:a5];
    }
    else {
      int v13 = +[NSFileProviderKernelMaterializationInfo kernelMaterializationInfoWithOperation:a4];
    }
    memset(v15, 0, sizeof(v15));
    int v16 = a3;
    v17[0] = 0;
    handle_nspace_request_with_info(a2, v15, a6, (uint64_t)v13);
  }
  else
  {
    make_nspace_handle_response(a2, 0, 0, 22);
  }
  return 0;
}

uint64_t receive_vfs_resolve_file(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v13 = _NSFCLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v17 = 67110147;
    *(_DWORD *)&v17[4] = a3;
    *(_WORD *)&v17[8] = 2081;
    *(void *)&v17[10] = a7;
    *(_WORD *)&v17[18] = 1024;
    int v18 = a2;
    *(_WORD *)id v19 = 2048;
    *(void *)&v19[2] = a5;
    __int16 v20 = 2048;
    uint64_t v21 = a6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Received nspace IPC from %u for %{private}s - req: %d - offset: %lld, size: %lld", v17, 0x2Cu);
  }
  if (a7)
  {
    memset(v17, 0, sizeof(v17));
    id v15 = +[NSFileProviderKernelMaterializationInfo fileMaterializationInfoWithOperation:a4 size:a6 offset:a5];
    int v18 = a3;
    *(void *)id v19 = 0;
    handle_nspace_request_with_info(a2, v17, a7, (uint64_t)v15);
  }
  else
  {
    make_nspace_handle_response(a2, 0, 0, 22);
  }
  return 0;
}

uint64_t receive_nspace_resolve_path(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v9 = _NSFCLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v13 = 67109635;
    *(_DWORD *)&v13[4] = a3;
    *(_WORD *)&v13[8] = 2081;
    *(void *)&v13[10] = a5;
    *(_WORD *)&v13[18] = 1024;
    int v14 = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received nspace IPC from %u for %{private}s - req: %d", v13, 0x18u);
  }
  if (a5)
  {
    memset(v13, 0, sizeof(v13));
    int v11 = +[NSFileProviderKernelMaterializationInfo kernelMaterializationInfoWithOperation:a4];
    int v14 = a3;
    uint64_t v15 = 0;
    handle_nspace_request_with_info(a2, v13, a5, (uint64_t)v11);
  }
  else
  {
    make_nspace_handle_response(a2, 0, 0, 22);
  }
  return 0;
}

uint64_t receive_nspace_resolve_cancel(uint64_t a1, uint64_t a2)
{
  v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received nspace cancel request - req: %d", (uint8_t *)v6, 8u);
  }
  [mainArbiter cancelMaterializationWithRequestID:[NSNumber numberWithUnsignedInt:a2]];
  return 0;
}

void init_mig_server()
{
  int v2 = 1;
  if (sysctlbyname("vfs.nspace.resolver", 0, 0, &v2, 4uLL))
  {
    v0 = _NSFCLog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "filecoordinationd is unable to mark itself as an nspace resolver", v1, 2u);
    }
  }
  else
  {
    if (bootstrap_check_in(bootstrap_port, "com.apple.FileCoordination.kernel.ipc", (mach_port_t *)&server_port)) {
      init_mig_server_cold_1();
    }
    mig_queue = (uint64_t)dispatch_queue_create("com.apple.FileCoordination.fault-mig", 0);
    mig_source = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, server_port, 0, (dispatch_queue_t)mig_queue);
    dispatch_source_set_cancel_handler((dispatch_source_t)mig_source, &__block_literal_global);
    dispatch_source_set_event_handler((dispatch_source_t)mig_source, &__block_literal_global_8);
    dispatch_resume((dispatch_object_t)mig_source);
  }
}

void __init_mig_server_block_invoke(id a1)
{
  if (mach_port_mod_refs(mach_task_self_, server_port, 1u, -1)) {
    _os_assumes_log();
  }
}

void __init_mig_server_block_invoke_2(id a1)
{
  if (dispatch_mig_server()) {
    _os_assumes_log();
  }
}

int main(int argc, const char **argv, const char **envp)
{
  +[NSError _setFileNameLocalizationEnabled:0];
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.FileCoordination"];
  [v3 _setQueue:&_dispatch_main_q];
  mainArbiter = (uint64_t)[objc_alloc((Class)NSFileAccessArbiter) initWithQueue:&_dispatch_main_q isSubarbiter:0 listener:v3];
  [v3 setDelegate:mainArbiter];
  [v3 resume];
  id v4 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.ProgressReporting"];
  [v4 setDelegate:[objc_alloc(NSClassFromString(@"NSProgressRegistrar")) initWithQueue:&_dispatch_main_q rootFileAccessNode:objc_msgSend((id)mainArbiter, "rootNode")]];
  [v4 resume];
  init_mig_server();
  dispatch_main();
}

uint64_t __handle_nspace_request_with_info_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = nspaceErrnoFromNSError(a3);
  }
  int v5 = *(_DWORD *)(a1 + 40);
  int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  return make_nspace_handle_response(v5, a2, 0, v6);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t vfs_nspace_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 867808) >= 0xFFFFFFF8) {
    return (uint64_t)*(&receive_vfs_nspace_subsystem + 5 * (v1 - 867800) + 5);
  }
  else {
    return 0;
  }
}

_DWORD *_Xnspace_handle(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 4132 && (result = memchr(result + 9, 0, 0x1000uLL)) != 0)
  {
    result = (_DWORD *)receive_nspace_handle();
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *_Xnspace_resolve_cancel(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    result = (_DWORD *)receive_nspace_resolve_cancel(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = result;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xnspace_resolve_path(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (NDR_record_t v3 = result, result[1] == 8236)
    && (result = memchr(result + 11, 0, 0x2000uLL)) != 0)
  {
    result = (_DWORD *)receive_nspace_resolve_path(v3[3], v3[8], v3[9], v3[10], (uint64_t)(v3 + 11));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v4 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v4 = NDR_record;
  }
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

_DWORD *_Xvfs_resolve_file(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (NDR_record_t v3 = result, result[1] == 8252)
    && (result = memchr(result + 15, 0, 0x2000uLL)) != 0)
  {
    result = (_DWORD *)receive_vfs_resolve_file(v3[3], v3[8], v3[9], v3[10], *(void *)(v3 + 11), *(void *)(v3 + 13), (uint64_t)(v3 + 15));
    *(_DWORD *)(a2 + 32) = result;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xvfs_resolve_dir(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (NDR_record_t v3 = result, result[1] == 16428)
    && (result = memchr(result + 11, 0, 0x2000uLL)) != 0
    && (result = memchr(v3 + 2059, 0, 0x2000uLL)) != 0)
  {
    result = (_DWORD *)receive_vfs_resolve_dir(v3[3], v3[8], v3[9], v3[10], (uint64_t)(v3 + 11), (uint64_t)(v3 + 2059));
    *(_DWORD *)(a2 + 32) = result;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xvfs_resolve_file_with_audit_token(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (NDR_record_t v3 = result, result[1] == 8280)
    && (result = memchr(result + 14, 0, 0x2000uLL)) != 0)
  {
    if (!v3[2070] && v3[2071] > 0x1Fu)
    {
      uint64_t v5 = v3[3];
      uint64_t v6 = v3[8];
      uint64_t v7 = v3[9];
      uint64_t v8 = *((void *)v3 + 5);
      uint64_t v9 = *((void *)v3 + 6);
      long long v10 = *(_OWORD *)(v3 + 2066);
      v13[0] = *(_OWORD *)(v3 + 2062);
      v13[1] = v10;
      long long v11 = *(_OWORD *)(v3 + 2079);
      v12[0] = *(_OWORD *)(v3 + 2075);
      v12[1] = v11;
      result = (_DWORD *)receive_vfs_resolve_file_with_audit_token(v5, v6, v7, v8, v9, (uint64_t)(v3 + 14), (uint64_t)v13, v12);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_9;
    }
    int v4 = -309;
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
LABEL_9:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xvfs_resolve_dir_with_audit_token(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (NDR_record_t v3 = result, result[1] == 16456)
    && (result = memchr(result + 10, 0, 0x2000uLL)) != 0
    && (result = memchr(v3 + 2058, 0, 0x2000uLL)) != 0)
  {
    if (!v3[4114] && v3[4115] > 0x1Fu)
    {
      uint64_t v5 = v3[3];
      uint64_t v6 = v3[8];
      uint64_t v7 = v3[9];
      long long v8 = *(_OWORD *)(v3 + 4110);
      v11[0] = *(_OWORD *)(v3 + 4106);
      v11[1] = v8;
      long long v9 = *(_OWORD *)(v3 + 4123);
      v10[0] = *(_OWORD *)(v3 + 4119);
      v10[1] = v9;
      result = (_DWORD *)receive_vfs_resolve_dir_with_audit_token(v5, v6, v7, (uint64_t)(v3 + 10), (uint64_t)(v3 + 2058), (uint64_t)v11, v10);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_10;
    }
    int v4 = -309;
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xvfs_resolve_reparent_with_audit_token(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (NDR_record_t v3 = result, result[1] == 16456)
    && (result = memchr(result + 10, 0, 0x2000uLL)) != 0
    && (result = memchr(v3 + 2058, 0, 0x2000uLL)) != 0)
  {
    if (!v3[4114] && v3[4115] > 0x1Fu)
    {
      uint64_t v5 = v3[3];
      uint64_t v6 = v3[8];
      uint64_t v7 = v3[9];
      long long v8 = *(_OWORD *)(v3 + 4110);
      v11[0] = *(_OWORD *)(v3 + 4106);
      v11[1] = v8;
      long long v9 = *(_OWORD *)(v3 + 4123);
      v10[0] = *(_OWORD *)(v3 + 4119);
      v10[1] = v9;
      result = (_DWORD *)receive_vfs_resolve_reparent_with_audit_token(v5, v6, v7, (uint64_t)(v3 + 10), (uint64_t)(v3 + 2058), (uint64_t)v11, v10);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_10;
    }
    int v4 = -309;
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t vfs_nspace_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 867808) >= 0xFFFFFFF8
    && (uint64_t v5 = (void (*)(void))*(&receive_vfs_nspace_subsystem + 5 * (v4 - 867800) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void handle_nspace_request_with_info_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void init_mig_server_cold_1()
{
  _os_assert_log();
  v0 = (NSString *)_os_crash();
  __break(1u);
  NSClassFromString(v0);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSFCLog()
{
  return __NSFCLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

void dispatch_main(void)
{
}

uint64_t dispatch_mig_server()
{
  return _dispatch_mig_server();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return [a1 rootNode];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}