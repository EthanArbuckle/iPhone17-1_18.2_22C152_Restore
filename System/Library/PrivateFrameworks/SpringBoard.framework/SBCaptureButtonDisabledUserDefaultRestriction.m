@interface SBCaptureButtonDisabledUserDefaultRestriction
- (SBCaptureButtonDisabledUserDefaultRestriction)initWithCoordinator:(id)a3;
- (void)_evaluateCaptureButtonDisablement;
@end

@implementation SBCaptureButtonDisabledUserDefaultRestriction

- (SBCaptureButtonDisabledUserDefaultRestriction)initWithCoordinator:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBCaptureButtonDisabledUserDefaultRestriction;
  v5 = [(SBCaptureButtonInternalRestrictionGlue *)&v21 initWithCoordinator:v4];
  if (v5)
  {
    v6 = +[SBDefaults localDefaults];
    uint64_t v7 = [v6 captureButtonDefaults];
    captureButtonDefaults = v5->_captureButtonDefaults;
    v5->_captureButtonDefaults = (SBCaptureButtonDefaults *)v7;

    objc_initWeak(&location, v5);
    v9 = v5->_captureButtonDefaults;
    v10 = [NSString stringWithUTF8String:"disableCaptureButton"];
    uint64_t v11 = MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __69__SBCaptureButtonDisabledUserDefaultRestriction_initWithCoordinator___block_invoke;
    v18 = &unk_1E6AF4B10;
    objc_copyWeak(&v19, &location);
    id v13 = (id)[(SBCaptureButtonDefaults *)v9 observeDefault:v10 onQueue:v11 withBlock:&v15];

    [(SBCaptureButtonDisabledUserDefaultRestriction *)v5 _evaluateCaptureButtonDisablement];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __69__SBCaptureButtonDisabledUserDefaultRestriction_initWithCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _evaluateCaptureButtonDisablement];
    id WeakRetained = v2;
  }
}

- (void)_evaluateCaptureButtonDisablement
{
  if ([(SBCaptureButtonDefaults *)self->_captureButtonDefaults disableCaptureButton])
  {
    [(SBCaptureButtonInternalRestrictionGlue *)self acquireRestriction:@"disabled by UserDefault"];
  }
  else
  {
    [(SBCaptureButtonInternalRestrictionGlue *)self relinquishRestriction];
  }
}

- (void).cxx_destruct
{
}

@end