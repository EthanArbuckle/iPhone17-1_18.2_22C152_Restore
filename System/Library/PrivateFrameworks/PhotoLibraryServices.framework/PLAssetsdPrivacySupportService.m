@interface PLAssetsdPrivacySupportService
- (PLAssetsdPrivacySupportService)initWithConnectionAuthorization:(id)a3;
- (void)presentLimitedLibraryPickerReprompt:(id)a3;
- (void)setClientPrivacyOptions:(id)a3 reply:(id)a4;
@end

@implementation PLAssetsdPrivacySupportService

- (void).cxx_destruct
{
}

- (void)setClientPrivacyOptions:(id)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  long long v17 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v15) = v8;
  if (v8)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setClientPrivacyOptions:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v17 + 8));
  }
  uint64_t v9 = *MEMORY[0x1E4F8C4D8];
  v10 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F8C4D8], (void)v15);

  if (v10)
  {
    v11 = [v6 objectForKeyedSubscript:v9];
    -[PLAssetsdConnectionAuthorization setClientLimitedLibraryCapable:](self->_connectionAuthorization, "setClientLimitedLibraryCapable:", [v11 BOOLValue]);
  }
  v7[2](v7, 0);
  if (v16) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v17 + 8));
  }
  if ((void)v17)
  {
    v12 = PLRequestGetLog();
    v13 = v12;
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v20 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)presentLimitedLibraryPickerReprompt:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t))a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: presentLimitedLibraryPickerReprompt:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  id v6 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerDisplayName];
  v7 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerPhotoLibraryUsageDescription];
  uint64_t v8 = PLPresentLimitedLibraryPickerRepromptForApplication();
  v4[2](v4, v8);

  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    uint64_t v9 = PLRequestGetLog();
    v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      long long v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (PLAssetsdPrivacySupportService)initWithConnectionAuthorization:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAssetsdPrivacySupportService;
  id v6 = [(PLAssetsdPrivacySupportService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connectionAuthorization, a3);
  }

  return v7;
}

@end