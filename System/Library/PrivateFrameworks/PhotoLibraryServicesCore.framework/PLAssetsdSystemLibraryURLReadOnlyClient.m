@interface PLAssetsdSystemLibraryURLReadOnlyClient
- (id)systemPhotoLibraryURLWithError:(id *)a3;
@end

@implementation PLAssetsdSystemLibraryURLReadOnlyClient

- (id)systemPhotoLibraryURLWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v31) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: systemPhotoLibraryURLWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  v9 = PLRequestGetLog();
  *((void *)&v33 + 1) = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v32 = v10;
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(*((SEL *)&v33 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__11756;
  v37 = __Block_byref_object_dispose__11757;
  id v38 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11756;
  v29 = __Block_byref_object_dispose__11757;
  id v30 = 0;
  v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__PLAssetsdSystemLibraryURLReadOnlyClient_systemPhotoLibraryURLWithError___block_invoke;
  v24[3] = &unk_1E58A1C40;
  v24[4] = &v25;
  v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __74__PLAssetsdSystemLibraryURLReadOnlyClient_systemPhotoLibraryURLWithError___block_invoke_2;
  v23[3] = &unk_1E58A1B00;
  v23[4] = &buf;
  v23[5] = &v25;
  [v15 systemPhotoLibraryURL:v23];

  if (a3)
  {
    v16 = (void *)v26[5];
    if (v16) {
      *a3 = v16;
    }
  }
  id v17 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    v18 = PLRequestGetLog();
    v19 = v18;
    os_signpost_id_t v20 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      v21 = sel_getName(*((SEL *)&v33 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v21;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v17;
}

void __74__PLAssetsdSystemLibraryURLReadOnlyClient_systemPhotoLibraryURLWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __74__PLAssetsdSystemLibraryURLReadOnlyClient_systemPhotoLibraryURLWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

@end