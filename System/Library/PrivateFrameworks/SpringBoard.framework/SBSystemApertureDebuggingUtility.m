@interface SBSystemApertureDebuggingUtility
- (BOOL)isSystemApertureUnderAutomationTesting;
- (NSMutableArray)systemApertureModelStateDump;
- (NSMutableDictionary)animationFrameRecordings;
- (SBSystemApertureDebuggingUtility)initWithDelegate:(id)a3;
- (SBSystemApertureDebuggingUtilityDelegate)delegate;
- (id)_repackageDictionaryDescribable:(id)a3;
- (void)_collectPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6;
- (void)_handleStreamBuddySessionForPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6;
- (void)_observeAnimationFrames:(id)a3;
- (void)_setupTestRecipe;
- (void)clearBufferEntries;
- (void)setAnimationFrameRecording:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSystemApertureUnderAutomationTesting:(BOOL)a3;
- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)streamBuddySession:(id)a3 connectionState:(int)a4 withError:(id)a5;
- (void)updatedPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6;
@end

@implementation SBSystemApertureDebuggingUtility

- (void)updatedPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6
{
  self->_queryIteration = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [(SBSystemApertureDebuggingUtility *)self _collectPreferences:v12 context:v11 withStackDepiction:v10 andQueryIteration:a6];
  [(SBSystemApertureDebuggingUtility *)self _handleStreamBuddySessionForPreferences:v12 context:v11 withStackDepiction:v10 andQueryIteration:a6];
}

- (void)_handleStreamBuddySessionForPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6
{
  v19[4] = *MEMORY[0x1E4F143B8];
  if (self->_streamBuddySession)
  {
    id v10 = NSString;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    v14 = objc_msgSend(v10, "stringWithFormat:", @"%lu", a6, @"queryIteration");
    v19[0] = v14;
    v18[1] = @"SBSAPreferences";
    v15 = [(SBSystemApertureDebuggingUtility *)self _repackageDictionaryDescribable:v13];

    v19[1] = v15;
    v18[2] = @"SBSAContext";
    v16 = [(SBSystemApertureDebuggingUtility *)self _repackageDictionaryDescribable:v12];

    v18[3] = @"stackDepiction";
    v19[2] = v16;
    v19[3] = v11;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];

    [(SBStreamBuddySession *)self->_streamBuddySession sendSystemApertureStateDump:v17];
  }
}

- (void)_collectPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_isAppleInternal)
  {
    id v12 = +[SBDefaults localDefaults];
    id v13 = [v12 systemApertureDefaults];
    int v14 = [v13 enableSystemApertureStateCollection];

    if (v14)
    {
      v15 = [[SBSystemApertureDebuggingUtilityBufferEntry alloc] initWithQueryIteration:a6 preferences:v16 context:v10 stackDepiction:v11];
      if ([(NSMutableArray *)self->_bufferEntries count] == 50
        && ![(SBSystemApertureDebuggingUtility *)self isSystemApertureUnderAutomationTesting])
      {
        [(NSMutableArray *)self->_bufferEntries removeObjectAtIndex:0];
      }
      [(NSMutableArray *)self->_bufferEntries addObject:v15];
    }
  }
}

- (void)clearBufferEntries
{
}

- (SBSystemApertureDebuggingUtility)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSystemApertureDebuggingUtility;
  v5 = [(SBSystemApertureDebuggingUtility *)&v11 init];
  if (v5)
  {
    v5->_isAppleInternal = os_variant_has_internal_diagnostics();
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v6 = objc_opt_new();
    bufferEntries = v5->_bufferEntries;
    v5->_bufferEntries = (NSMutableArray *)v6;

    uint64_t v8 = +[SBSystemApertureDomain rootSettings];
    settings = v5->_settings;
    v5->_settings = (SBSystemApertureSettings *)v8;

    [(PTSettings *)v5->_settings addKeyPathObserver:v5];
    [(SBSystemApertureDebuggingUtility *)v5 _setupTestRecipe];
  }

  return v5;
}

- (void)setAnimationFrameRecording:(BOOL)a3
{
  displayLink = self->_displayLink;
  if (displayLink) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (v5)
  {
    [(CADisplayLink *)displayLink invalidate];
    animationFrameRecordings = self->_displayLink;
    self->_displayLink = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__observeAnimationFrames_];
    v7 = self->_displayLink;
    self->_displayLink = v6;

    uint64_t v8 = self->_displayLink;
    v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

    id v10 = (NSMutableDictionary *)objc_opt_new();
    animationFrameRecordings = self->_animationFrameRecordings;
    self->_animationFrameRecordings = v10;
  }
}

- (NSMutableArray)systemApertureModelStateDump
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v17 = (id)objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_bufferEntries;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v22[0] = @"queryIteration";
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v6, "queryIteration"));
        v23[0] = v7;
        v22[1] = @"SBSAPreferences";
        uint64_t v8 = [v6 preferences];
        v9 = [(SBSystemApertureDebuggingUtility *)self _repackageDictionaryDescribable:v8];
        v23[1] = v9;
        v22[2] = @"SBSAContext";
        id v10 = [v6 context];
        objc_super v11 = [(SBSystemApertureDebuggingUtility *)self _repackageDictionaryDescribable:v10];
        v23[2] = v11;
        v22[3] = @"stackDepiction";
        id v12 = [v6 stackDepiction];
        v23[3] = v12;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];

        [v17 addObject:v13];
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v4);
  }

  return (NSMutableArray *)v17;
}

- (void)_setupTestRecipe
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SBSystemApertureDebuggingUtility__setupTestRecipe__block_invoke;
  v3[3] = &unk_1E6AF5350;
  v3[4] = self;
  v2 = [MEMORY[0x1E4F941F8] recipeWithTitle:@"Toggle StreamBuddy" toggleAction:v3];
  +[PTDomain registerTestRecipe:v2];
}

void __52__SBSystemApertureDebuggingUtility__setupTestRecipe__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2 && *(unsigned char *)(v3 + 40) && !*(void *)(v3 + 8))
  {
    uint64_t v6 = objc_alloc_init(SBStreamBuddySession);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
    v9 = *(void **)(*(void *)(a1 + 32) + 8);
    [v9 start];
  }
  else
  {
    [*(id *)(v3 + 8) stop];
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = 0;
  }
}

- (id)_repackageDictionaryDescribable:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 dictionaryDescription];
  uint64_t v4 = (void *)[v3 copy];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v6 objectForKey:v11];
        if (objc_opt_respondsToSelector())
        {
          id v13 = [(SBSystemApertureDebuggingUtility *)self _repackageDictionaryDescribable:v12];
          int v14 = [v13 description];
          [v5 setObject:v14 forKey:v11];
        }
        else
        {
          [v5 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__SBSystemApertureDebuggingUtility_setSystemApertureUnderAutomationTesting___block_invoke;
  v3[3] = &unk_1E6AF5D38;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __76__SBSystemApertureDebuggingUtility_setSystemApertureUnderAutomationTesting___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained systemApertureDebuggingUtility:*(void *)(a1 + 32) shouldCreateDebuggingLabel:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_observeAnimationFrames:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained systemApertureDebuggingUtilityOrderedContainerViews:self];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v5;
  uint64_t v26 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v8 = [v7 elementViewController];
        uint64_t v9 = [v8 elementViewProvider];
        id v10 = [v9 element];

        if (v10)
        {
          uint64_t v11 = [v10 elementIdentifier];
          id v12 = (void *)MEMORY[0x1E4F29238];
          id v13 = [v7 layer];
          int v14 = [v13 presentationLayer];
          [v14 frame];
          v15 = objc_msgSend(v12, "valueWithRect:");

          uint64_t v16 = NSNumber;
          long long v17 = [v7 layer];
          long long v18 = [v17 presentationLayer];
          [v18 cornerRadius];
          *(float *)&double v19 = v19;
          long long v20 = [v16 numberWithFloat:v19];

          long long v21 = [NSNumber numberWithInteger:self->_queryIteration];
          v31[0] = @"frame";
          v31[1] = @"cornerRadius";
          v32[0] = v15;
          v32[1] = v20;
          v31[2] = @"queryIteration";
          v32[2] = v21;
          uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
          v23 = [(NSMutableDictionary *)self->_animationFrameRecordings objectForKey:v11];
          if (!v23) {
            v23 = objc_opt_new();
          }
          [v23 addObject:v22];
          [(NSMutableDictionary *)self->_animationFrameRecordings setObject:v23 forKey:v11];
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v26);
  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  if ([a4 isEqualToString:@"showQueryIterationLabel"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "systemApertureDebuggingUtility:shouldCreateDebuggingLabel:", self, -[SBSystemApertureSettings showQueryIterationLabel](self->_settings, "showQueryIterationLabel"));
  }
}

- (void)streamBuddySession:(id)a3 connectionState:(int)a4 withError:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = SBLogStreamBuddy();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(a2);
    uint64_t v11 = SBStringFromStreamBuddyConnectionState(v5);
    id v12 = [v8 debugDescription];
    int v14 = 138412802;
    v15 = v10;
    __int16 v16 = 2112;
    long long v17 = v11;
    __int16 v18 = 2112;
    double v19 = v12;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%@ State:%@ withError:%@", (uint8_t *)&v14, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained systemApertureDebuggingUtility:self updateUIForConnectionState:v5];
}

- (SBSystemApertureDebuggingUtilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSystemApertureDebuggingUtilityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)animationFrameRecordings
{
  return self->_animationFrameRecordings;
}

- (BOOL)isSystemApertureUnderAutomationTesting
{
  return self->_systemApertureUnderAutomationTesting;
}

- (void)setIsSystemApertureUnderAutomationTesting:(BOOL)a3
{
  self->_isSystemApertureUnderAutomationTesting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationFrameRecordings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_bufferEntries, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_streamBuddySession, 0);
}

@end