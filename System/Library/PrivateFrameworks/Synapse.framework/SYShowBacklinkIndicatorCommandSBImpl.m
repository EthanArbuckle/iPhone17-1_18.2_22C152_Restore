@interface SYShowBacklinkIndicatorCommandSBImpl
- (BOOL)isActive;
- (SBSSystemNotesPresentationHandle)_handle;
- (SYShowBacklinkIndicatorCommandSBImpl)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4;
- (void)invalidate;
- (void)runWithCompletion:(id)a3;
- (void)set_handle:(id)a3;
- (void)systemNotesPresentationHandle:(id)a3 didChangePresentationMode:(int64_t)a4;
@end

@implementation SYShowBacklinkIndicatorCommandSBImpl

- (SYShowBacklinkIndicatorCommandSBImpl)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SYShowBacklinkIndicatorCommandSBImpl;
  v8 = [(SYShowBacklinkIndicatorCommandSBImpl *)&v20 init];
  if (v8 && [v7 count])
  {
    v9 = SYMakeEditNoteUserActivity(v6, v7);
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v10 = (void *)getSBSSystemNotesPresentationConfigurationClass_softClass;
    uint64_t v24 = getSBSSystemNotesPresentationConfigurationClass_softClass;
    if (!getSBSSystemNotesPresentationConfigurationClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSBSSystemNotesPresentationConfigurationClass_block_invoke;
      v26 = &unk_1E64635F8;
      v27 = &v21;
      __getSBSSystemNotesPresentationConfigurationClass_block_invoke((uint64_t)buf);
      v10 = (void *)v22[3];
    }
    v11 = v10;
    _Block_object_dispose(&v21, 8);
    v12 = (void *)[[v11 alloc] initWithSceneBundleIdentifier:@"com.apple.mobilenotes" userActivity:v9 preferredPresentationMode:1];
    v13 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v7 count];
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_1C2C5F000, v13, OS_LOG_TYPE_DEFAULT, "BackLinkIndicatorCommand %p: Creating notes presentation handle with link identifier count: %ld.", buf, 0x16u);
    }

    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v15 = (void *)getSBSSystemNotesPresentationHandleClass_softClass;
    uint64_t v24 = getSBSSystemNotesPresentationHandleClass_softClass;
    if (!getSBSSystemNotesPresentationHandleClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSBSSystemNotesPresentationHandleClass_block_invoke;
      v26 = &unk_1E64635F8;
      v27 = &v21;
      __getSBSSystemNotesPresentationHandleClass_block_invoke((uint64_t)buf);
      v15 = (void *)v22[3];
    }
    v16 = v15;
    _Block_object_dispose(&v21, 8);
    uint64_t v17 = [[v16 alloc] initWithConfiguration:v12];
    handle = v8->__handle;
    v8->__handle = (SBSSystemNotesPresentationHandle *)v17;

    [(SBSSystemNotesPresentationHandle *)v8->__handle addObserver:v8];
  }

  return v8;
}

- (BOOL)isActive
{
  v2 = [(SYShowBacklinkIndicatorCommandSBImpl *)self _handle];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)runWithCompletion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  v5 = [(SYShowBacklinkIndicatorCommandSBImpl *)self _handle];

  id v6 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = 134217984;
      v9 = self;
      _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_DEFAULT, "BackLinkIndicatorCommand %p: Sending notes presentation handle with link identifiers.", (uint8_t *)&v8, 0xCu);
    }

    id v6 = [(SYShowBacklinkIndicatorCommandSBImpl *)self _handle];
    [v6 activate];
  }
  else if (v7)
  {
    int v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_DEFAULT, "BackLinkIndicatorCommand %p: Not sending notes presentation request, no link identifiers.", (uint8_t *)&v8, 0xCu);
  }

  if (v4) {
    v4[2](v4);
  }
}

- (void)invalidate
{
  id v2 = [(SYShowBacklinkIndicatorCommandSBImpl *)self _handle];
  [v2 invalidate];
}

- (void)systemNotesPresentationHandle:(id)a3 didChangePresentationMode:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    int v8 = self;
    __int16 v9 = 2048;
    int64_t v10 = a4;
    _os_log_impl(&dword_1C2C5F000, v6, OS_LOG_TYPE_DEFAULT, "BackLinkIndicatorCommand %p: Notes presentation request changed mode to %ld.", (uint8_t *)&v7, 0x16u);
  }
}

- (SBSSystemNotesPresentationHandle)_handle
{
  return self->__handle;
}

- (void)set_handle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end