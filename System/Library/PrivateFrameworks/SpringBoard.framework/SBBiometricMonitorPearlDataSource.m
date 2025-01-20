@interface SBBiometricMonitorPearlDataSource
- (BOOL)matchRunning;
- (BOOL)poseIsMarginal;
- (BOOL)presenceDetectRunning;
- (SBBiometricMonitorPearlDataSource)init;
- (SBBiometricMonitorPearlDataSource)initWithPearlDevice:(id)a3;
- (void)_forEachObserver:(id)a3;
- (void)_setFaceDetecting:(BOOL)a3;
- (void)_setMatching:(BOOL)a3;
- (void)_setPoseIsMarginal:(BOOL)a3;
- (void)_updateFaceDetecting;
- (void)_updateMatching;
- (void)addObserver:(id)a3;
- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4;
- (void)dealloc;
- (void)device:(id)a3 pearlEventOccurred:(int64_t)a4;
- (void)device:(id)a3 pearlStateChanged:(int64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation SBBiometricMonitorPearlDataSource

- (SBBiometricMonitorPearlDataSource)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA7DC8]);
  v4 = [v3 createPearlDevice];

  v5 = [MEMORY[0x1E4FA7C68] sharedInstance];
  [v5 addObserver:self];
  v6 = [(SBBiometricMonitorPearlDataSource *)self initWithPearlDevice:v4];

  return v6;
}

- (SBBiometricMonitorPearlDataSource)initWithPearlDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBiometricMonitorPearlDataSource;
  v6 = [(SBBiometricMonitorPearlDataSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pearlDevice, a3);
    [(BKDevicePearl *)v7->_pearlDevice setDelegate:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(BKDevicePearl *)self->_pearlDevice setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SBBiometricMonitorPearlDataSource;
  [(SBBiometricMonitorPearlDataSource *)&v3 dealloc];
}

- (void)_forEachObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_setMatching:(BOOL)a3
{
  if (self->_matching != a3)
  {
    self->_matching = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__SBBiometricMonitorPearlDataSource__setMatching___block_invoke;
    v3[3] = &unk_1E6AF8720;
    v3[4] = self;
    [(SBBiometricMonitorPearlDataSource *)self _forEachObserver:v3];
  }
}

void __50__SBBiometricMonitorPearlDataSource__setMatching___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    char v3 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v3 & 1) == 0) {
      goto LABEL_7;
    }
    [v6 biometricMonitorDataSourceMatchingStarted:*(void *)(a1 + 32)];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    [v6 biometricMonitorDataSourceMatchingEnded:*(void *)(a1 + 32)];
  }
  v4 = v6;
LABEL_7:
}

- (void)_setFaceDetecting:(BOOL)a3
{
  if (self->_faceDetecting != a3)
  {
    self->_faceDetecting = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__SBBiometricMonitorPearlDataSource__setFaceDetecting___block_invoke;
    v3[3] = &unk_1E6AF8720;
    v3[4] = self;
    [(SBBiometricMonitorPearlDataSource *)self _forEachObserver:v3];
  }
}

void __55__SBBiometricMonitorPearlDataSource__setFaceDetecting___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    char v3 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v3 & 1) == 0) {
      goto LABEL_7;
    }
    [v6 biometricMonitorDataSourcePresenceDetectionStarted:*(void *)(a1 + 32)];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    [v6 biometricMonitorDataSourcePresenceDetectionEnded:*(void *)(a1 + 32)];
  }
  v4 = v6;
LABEL_7:
}

- (void)_setPoseIsMarginal:(BOOL)a3
{
  if (self->_poseIsMarginal != a3)
  {
    self->_poseIsMarginal = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__SBBiometricMonitorPearlDataSource__setPoseIsMarginal___block_invoke;
    v3[3] = &unk_1E6AF8720;
    v3[4] = self;
    [(SBBiometricMonitorPearlDataSource *)self _forEachObserver:v3];
  }
}

void __56__SBBiometricMonitorPearlDataSource__setPoseIsMarginal___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 biometricMonitorDataSourcePoseUpdated:*(void *)(a1 + 32)];
  }
}

- (void)_updateMatching
{
  BOOL v3 = [(BKDevicePearl *)self->_pearlDevice pearlState] == 3;
  [(SBBiometricMonitorPearlDataSource *)self _setMatching:v3];
}

- (void)_updateFaceDetecting
{
  BOOL v3 = (unint64_t)([(BKDevicePearl *)self->_pearlDevice pearlState] - 2) < 3;
  [(SBBiometricMonitorPearlDataSource *)self _setFaceDetecting:v3];
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  [(SBBiometricMonitorPearlDataSource *)self _setPoseIsMarginal:a4 == 23];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)presenceDetectRunning
{
  return self->_faceDetecting;
}

- (BOOL)matchRunning
{
  return self->_matching;
}

- (BOOL)poseIsMarginal
{
  return self->_poseIsMarginal;
}

- (void)device:(id)a3 pearlStateChanged:(int64_t)a4
{
  id v6 = a3;
  char v7 = a4 - 1;
  if ((unint64_t)(a4 - 1) <= 4)
  {
    uint64_t v8 = (0xEu >> v7) & 1;
    id v9 = v6;
    [(SBBiometricMonitorPearlDataSource *)self _setMatching:(v7 & 0x1F) == 2];
    [(SBBiometricMonitorPearlDataSource *)self _setFaceDetecting:v8];
    id v6 = v9;
  }
}

- (void)device:(id)a3 pearlEventOccurred:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 3:
      char v7 = v11;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      uint64_t v8 = __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_3;
      goto LABEL_6;
    case 4:
      char v7 = &v9;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      uint64_t v8 = __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_4;
      goto LABEL_6;
    case 6:
      char v7 = v13;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      uint64_t v8 = __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke;
      goto LABEL_6;
    case 7:
      char v7 = v12;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      uint64_t v8 = __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_2;
LABEL_6:
      v7[2] = (uint64_t)v8;
      v7[3] = (uint64_t)&unk_1E6AF8720;
      v7[4] = (uint64_t)self;
      -[SBBiometricMonitorPearlDataSource _forEachObserver:](self, "_forEachObserver:", v9, v10);
      break;
    default:
      break;
  }
}

void __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 biometricMonitorDataSourceMatchingSucceeded:*(void *)(a1 + 32)];
  }
}

void __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 biometricMonitorDataSourceMatchingFailed:*(void *)(a1 + 32)];
  }
}

void __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 biometricMonitorDataSourcePresenceDetectionSucceeded:*(void *)(a1 + 32)];
  }
}

void __63__SBBiometricMonitorPearlDataSource_device_pearlEventOccurred___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 biometricMonitorDataSourcePresenceDetectionFailed:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
}

@end