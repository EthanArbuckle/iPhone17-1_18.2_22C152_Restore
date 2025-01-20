@interface SBRecordingIndicatorSystemApertureElement
- (BOOL)hasIndicatorBehavior;
- (BOOL)isSuppressed;
- (BOOL)shouldSuppressElementWhileOnCoversheet;
- (BOOL)shouldSuppressElementWhileOtherElementsPresent;
- (BOOL)shouldSuppressElementWhileOverLiquidDetectionCriticalUI;
- (NSString)elementIdentifier;
- (SBRecordingIndicatorManager)recordingIndicatorManager;
- (SBRecordingIndicatorSystemApertureElement)initWithRecordingIndicatorView:(id)a3 recordingIndicatorManager:(id)a4;
- (SBSystemAperturePlatformElementHosting)platformElementHost;
- (UIView)indicatorView;
- (void)element:(id)a3 visibilityWillChange:(BOOL)a4;
- (void)pulse;
- (void)setPlatformElementHost:(id)a3;
- (void)setRecordingIndicatorManager:(id)a3;
- (void)setSuppressed:(BOOL)a3;
@end

@implementation SBRecordingIndicatorSystemApertureElement

- (UIView)indicatorView
{
  return self->_indicatorView;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (BOOL)hasIndicatorBehavior
{
  return 1;
}

- (void)element:(id)a3 visibilityWillChange:(BOOL)a4
{
  id v4 = [(SBRecordingIndicatorSystemApertureElement *)self recordingIndicatorManager];
  [v4 updateRecordingIndicatorLocationIfNecessary];
}

- (void)setSuppressed:(BOOL)a3
{
  self->_suppressed = a3;
  id v3 = [(SBRecordingIndicatorSystemApertureElement *)self recordingIndicatorManager];
  [v3 updateRecordingIndicatorLocationIfNecessary];
}

- (SBRecordingIndicatorManager)recordingIndicatorManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingIndicatorManager);
  return (SBRecordingIndicatorManager *)WeakRetained;
}

- (void)setPlatformElementHost:(id)a3
{
}

- (BOOL)shouldSuppressElementWhileOverLiquidDetectionCriticalUI
{
  return 0;
}

- (BOOL)shouldSuppressElementWhileOtherElementsPresent
{
  return 1;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (void)pulse
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformElementHost);
  [WeakRetained elementRequestsDiscreteAnimationOfType:3];
}

- (SBRecordingIndicatorSystemApertureElement)initWithRecordingIndicatorView:(id)a3 recordingIndicatorManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBRecordingIndicatorSystemApertureElement.m", 31, @"Invalid parameter not satisfying: %@", @"indicatorView" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBRecordingIndicatorSystemApertureElement;
  v10 = [(SBRecordingIndicatorSystemApertureElement *)&v16 init];
  if (v10)
  {
    v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    elementIdentifier = v10->_elementIdentifier;
    v10->_elementIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v10->_indicatorView, a3);
    objc_storeWeak((id *)&v10->_recordingIndicatorManager, v9);
  }

  return v10;
}

- (SBSystemAperturePlatformElementHosting)platformElementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformElementHost);
  return (SBSystemAperturePlatformElementHosting *)WeakRetained;
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (void)setRecordingIndicatorManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recordingIndicatorManager);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_destroyWeak((id *)&self->_platformElementHost);
}

@end