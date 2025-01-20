@interface SBUISystemApertureElementPresentationSession
- (void)_associateWithSourceIfNeeded:(id)a3;
- (void)_associateWithSourceWithIdentityToken:(id)a3;
- (void)_handleSourceDidConnect:(id)a3;
- (void)activateWithElementProvider:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBUISystemApertureElementPresentationSession

- (void)activateWithElementProvider:(id)a3
{
  id obj = a3;
  if (SBUIIsSystemApertureEnabled())
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__handleSourceDidConnect_ name:@"SBUISystemApertureElementSourceDidConnectNotification" object:0];

    objc_storeWeak((id *)&self->_elementProvider, obj);
    v6 = (SBSSystemApertureScenePresentationSessionClient *)objc_alloc_init(MEMORY[0x1E4FA6C40]);
    client = self->_client;
    self->_client = v6;

    [(SBSSystemApertureScenePresentationSessionClient *)self->_client requestScene];
  }
  else
  {
    v8 = [NSString stringWithFormat:@"requested system aperture sscene when system aperture not available."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBUISystemApertureElementPresentationSession *)a2 activateWithElementProvider:(uint64_t)v8];
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)dealloc
{
  v3 = [(SBSSystemApertureScenePresentationSessionClient *)self->_client connection];
  [v3 invalidate];

  client = self->_client;
  self->_client = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBUISystemApertureElementPresentationSession;
  [(SBUISystemApertureElementPresentationSession *)&v5 dealloc];
}

- (void)invalidate
{
}

- (void)_handleSourceDidConnect:(id)a3
{
  v4 = [a3 object];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 identityToken];

  [(SBUISystemApertureElementPresentationSession *)self _associateWithSourceWithIdentityToken:v9];
}

- (void)_associateWithSourceIfNeeded:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id obj = v4;
    uint64_t v5 = [v4 systemApertureElement];

    id v4 = obj;
    if (!v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedSource);

      if (!WeakRetained)
      {
        objc_storeWeak((id *)&self->_associatedSource, obj);
        id v7 = objc_loadWeakRetained((id *)&self->_elementProvider);
        [obj setSystemApertureElementViewControllerProvider:v7];
      }
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 removeObserver:self name:@"SBUISystemApertureElementSourceDidConnectNotification" object:0];

      id v4 = obj;
    }
  }
}

- (void)_associateWithSourceWithIdentityToken:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = +[SBUISystemApertureElementSource openSources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 identityToken];
        v11 = [(SBSSystemApertureScenePresentationSessionClient *)self->_client identityToken];
        int v12 = [v10 isEqual:v11];

        if (v12)
        {
          [(SBUISystemApertureElementPresentationSession *)self _associateWithSourceIfNeeded:v9];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_associatedSource);
  objc_destroyWeak((id *)&self->_elementProvider);
}

- (void)activateWithElementProvider:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  long long v15 = @"SBUISystemApertureElementPresentationSession.m";
  __int16 v16 = 1024;
  int v17 = 27;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A7607000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end