@interface SBOrientationAggdLogger
- (SBOrientationAggdLogger)init;
- (double)_bucketedElapsedTimeWithStartTime:(unint64_t)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_noteSignificantTimeChanged:(id)a3;
- (void)_saveOrientationLockAggdValues;
- (void)dealloc;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
@end

@implementation SBOrientationAggdLogger

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [v6 displayConfiguration];
  int v8 = [v7 isMainDisplay];

  if (v8)
  {
    currentElements = self->_currentElements;
    v10 = [v6 elements];
    if ([(NSArray *)currentElements isEqualToArray:v10])
    {
      int64_t currentOrientation = self->_currentOrientation;
      uint64_t v12 = [v6 interfaceOrientation];

      if (currentOrientation == v12) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v13 = self->_currentElements;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          int v19 = objc_msgSend(v18, "isUIApplicationElement", (void)v29);
          v20 = [v18 identifier];
          v21 = v20;
          if (v19)
          {
            SBOrientationAppUsageTimeAggdKey((uint64_t)v20, self->_currentOrientation);
          }
          else
          {
            v22 = [v20 pathExtension];
            SBOrientationSpringBoardUsageTimeAggdKey((uint64_t)v22, self->_currentOrientation);
          }
          [(SBOrientationAggdLogger *)self _bucketedElapsedTimeWithStartTime:self->_currentOrientationStartTime];
          if ((unint64_t)v23) {
            ADClientPushValueForDistributionKey();
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v15);
    }

    v24 = [(FBSDisplayLayoutMonitor *)self->_layoutMonitor currentLayout];
    self->_int64_t currentOrientation = [v24 interfaceOrientation];

    self->_currentOrientationStartTime = mach_absolute_time();
    v25 = [(FBSDisplayLayoutMonitor *)self->_layoutMonitor currentLayout];
    v26 = [v25 elements];
    v27 = (NSArray *)[v26 copy];
    v28 = self->_currentElements;
    self->_currentElements = v27;
  }
LABEL_19:
}

- (double)_bucketedElapsedTimeWithStartTime:(unint64_t)a3
{
  if (*(double *)&_bucketedElapsedTimeWithStartTime__timebaseFactor == 0.0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v5) = info.denom;
    LODWORD(v4) = info.numer;
    *(double *)&_bucketedElapsedTimeWithStartTime__timebaseFactor = (double)v4 / (double)v5 * 0.000000001;
  }
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = 0;
  double result = 3600.0;
  while (*(double *)&_bucketedElapsedTimeWithStartTime__timebaseFactor * (double)(v6 - a3) >= (double)_bucketedElapsedTimeWithStartTime__buckets[v7])
  {
    if (++v7 == 8) {
      return result;
    }
  }
  if ((int)v7 <= 1) {
    LODWORD(v7) = 1;
  }
  return (double)_bucketedElapsedTimeWithStartTime__buckets[(v7 - 1)];
}

- (SBOrientationAggdLogger)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBOrientationAggdLogger;
  v2 = [(SBOrientationAggdLogger *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F62940] sharedMonitorForDisplayType:0];
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v3;

    [(FBSDisplayLayoutMonitor *)v2->_layoutMonitor addObserver:v2];
    unint64_t v5 = [(FBSDisplayLayoutMonitor *)v2->_layoutMonitor currentLayout];
    v2->_int64_t currentOrientation = [v5 interfaceOrientation];

    v2->_currentOrientationStartTime = mach_absolute_time();
    uint64_t v6 = [(FBSDisplayLayoutMonitor *)v2->_layoutMonitor currentLayout];
    uint64_t v7 = [v6 elements];
    uint64_t v8 = [v7 copy];
    currentElements = v2->_currentElements;
    v2->_currentElements = (NSArray *)v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4F43AC8] object:0];
    [v10 addObserver:v2 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];
    [v10 addObserver:v2 selector:sel__noteSignificantTimeChanged_ name:@"SBSignificantTimeChangedNotification" object:0];
    [v10 addObserver:v2 selector:sel__orientationLockChanged_ name:*MEMORY[0x1E4FA7A88] object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor removeObserver:self];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBOrientationAggdLogger;
  [(SBOrientationAggdLogger *)&v4 dealloc];
}

- (void)_keyboardDidShow:(id)a3
{
  self->_isKeyboardOnScreen = 1;
  self->_keyboardOnScreenStartTime = mach_absolute_time();
}

- (void)_keyboardWillHide:(id)a3
{
  SBOrientationKeyboardUsageTimeAggdKey(self->_currentOrientation);
  [(SBOrientationAggdLogger *)self _bucketedElapsedTimeWithStartTime:self->_currentOrientationStartTime];
  if ((unint64_t)v4) {
    ADClientPushValueForDistributionKey();
  }
  self->_isKeyboardOnScreen = 0;
}

- (void)_noteSignificantTimeChanged:(id)a3
{
  double v4 = [a3 userInfo];
  unint64_t v5 = [v4 objectForKey:@"SBSignificantTimeChangeWasMidnight"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    [(SBOrientationAggdLogger *)self _saveOrientationLockAggdValues];
  }
}

- (void)_saveOrientationLockAggdValues
{
  v2 = +[SBOrientationLockManager sharedInstance];
  [v2 isUserLocked];

  ADClientSetValueForScalarKey();
  id v3 = +[SBOrientationLockManager sharedInstance];
  [v3 userLockOrientation];
  ADClientSetValueForScalarKey();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentElements, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end