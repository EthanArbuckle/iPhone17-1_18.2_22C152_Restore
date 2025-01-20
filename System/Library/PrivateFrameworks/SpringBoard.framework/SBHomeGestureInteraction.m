@interface SBHomeGestureInteraction
- (BOOL)_isGestureRunning:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEnabled;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)translationInView:(id)a3;
- (CGPoint)velocityInView:(id)a3;
- (NSSet)gestureRecognizers;
- (SBFluidScrunchGestureRecognizer)scrunchGestureRecognizer;
- (SBHomeGestureInteraction)initWithSystemGestureManager:(id)a3 delegate:(id)a4;
- (SBHomeGestureInteractionDelegate)delegate;
- (SBHomeGesturePanGestureRecognizer)screenEdgePanGestureRecognizer;
- (SBIndirectPanGestureRecognizer)indirectPanGestureRecognizer;
- (SBSystemGestureManager)gestureManager;
- (UIGestureRecognizer)recognizedGestureRecognizer;
- (double)indirectScreenEdgeGestureRecognitionDistance;
- (id)gestureRecognizerForType:(int64_t)a3;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (int64_t)recognizedGestureType;
- (int64_t)typeOfGestureRecognizer:(id)a3;
- (void)_configureGestureRecognizers;
- (void)_configureIndirectPanGestureRecognizer;
- (void)_configureScreenEdgePanGestureRecognizer;
- (void)_configureScrunchGestureRecognizer;
- (void)_handleGestureRecognizer:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGestureManager:(id)a3;
- (void)setIndirectPanGestureRecognizer:(id)a3;
- (void)setRecognizedGestureType:(int64_t)a3;
- (void)setScreenEdgePanGestureRecognizer:(id)a3;
- (void)setScrunchGestureRecognizer:(id)a3;
@end

@implementation SBHomeGestureInteraction

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  v6 = [(SBHomeGestureInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 homeGestureInteraction:self shouldReceiveTouch:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (SBHomeGestureInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHomeGestureInteractionDelegate *)WeakRetained;
}

- (SBHomeGestureInteraction)initWithSystemGestureManager:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBHomeGestureInteraction;
  v10 = [(SBHomeGestureInteraction *)&v13 init];
  if (v10)
  {
    if (!v8)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:v10 file:@"SBHomeGestureInteraction.m" lineNumber:37 description:@"invalid system gesture manager"];
    }
    objc_storeWeak((id *)&v10->_delegate, v9);
    v10->_enabled = 1;
    objc_storeStrong((id *)&v10->_gestureManager, a3);
    [(SBHomeGestureInteraction *)v10 _configureGestureRecognizers];
  }

  return v10;
}

- (void)invalidate
{
  [(SBSystemGestureManager *)self->_gestureManager removeGestureRecognizer:self->_screenEdgePanGestureRecognizer];
  [(SBSystemGestureManager *)self->_gestureManager removeGestureRecognizer:self->_indirectPanGestureRecognizer];
  gestureManager = self->_gestureManager;
  scrunchGestureRecognizer = self->_scrunchGestureRecognizer;
  [(SBSystemGestureManager *)gestureManager removeGestureRecognizer:scrunchGestureRecognizer];
}

- (void)dealloc
{
  [(SBHomeGestureInteraction *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBHomeGestureInteraction;
  [(SBHomeGestureInteraction *)&v3 dealloc];
}

- (void)_configureGestureRecognizers
{
  [(SBHomeGestureInteraction *)self _configureScreenEdgePanGestureRecognizer];
  objc_super v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(SBHomeGestureInteraction *)self _configureIndirectPanGestureRecognizer];
    [(SBHomeGestureInteraction *)self _configureScrunchGestureRecognizer];
  }
}

- (void)_configureScreenEdgePanGestureRecognizer
{
  id v8 = [(SBHomeGestureInteraction *)self delegate];
  uint64_t v3 = [v8 homeGestureInteraction:self systemGestureTypeForType:1];
  if (v3)
  {
    uint64_t v4 = v3;
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v8 customScreenEdgePanGestureRecognizerForHomeGestureInteraction:self];
    }
    else
    {
      id v5 = +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:0 action:0];
      [(UIScreenEdgePanGestureRecognizer *)v5 setEdges:4];
      [(SBHomeGesturePanGestureRecognizer *)v5 setInstalledAsSystemGesture:1];
    }
    [(SBHomeGesturePanGestureRecognizer *)v5 addTarget:self action:sel__handleGestureRecognizer_];
    [(SBHomeGesturePanGestureRecognizer *)v5 setDelegate:self];
    screenEdgePanGestureRecognizer = self->_screenEdgePanGestureRecognizer;
    self->_screenEdgePanGestureRecognizer = v5;
    char v7 = v5;

    [(SBSystemGestureManager *)self->_gestureManager addGestureRecognizer:v7 withType:v4];
  }
}

- (void)_configureIndirectPanGestureRecognizer
{
  id v8 = [(SBHomeGestureInteraction *)self delegate];
  uint64_t v3 = [v8 homeGestureInteraction:self systemGestureTypeForType:2];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [[SBIndirectPanGestureRecognizer alloc] initWithTarget:self action:sel__handleGestureRecognizer_ edges:4];
    [(SBIndirectPanGestureRecognizer *)v5 setName:@"indirectHomeInteractionGestureRecognizer"];
    [(SBIndirectPanGestureRecognizer *)v5 setDelegate:self];
    [(SBIndirectPanGestureRecognizer *)v5 setShouldInvertYAxis:1];
    indirectPanGestureRecognizer = self->_indirectPanGestureRecognizer;
    self->_indirectPanGestureRecognizer = v5;
    char v7 = v5;

    [(SBSystemGestureManager *)self->_gestureManager addGestureRecognizer:v7 withType:v4];
  }
}

- (void)_configureScrunchGestureRecognizer
{
  id v8 = [(SBHomeGestureInteraction *)self delegate];
  uint64_t v3 = [v8 homeGestureInteraction:self systemGestureTypeForType:3];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [[SBFluidScrunchGestureRecognizer alloc] initWithTarget:self action:sel__handleGestureRecognizer_];
    [(SBFluidScrunchGestureRecognizer *)v5 setDelegate:self];
    scrunchGestureRecognizer = self->_scrunchGestureRecognizer;
    self->_scrunchGestureRecognizer = v5;
    char v7 = v5;

    [(SBSystemGestureManager *)self->_gestureManager addGestureRecognizer:v7 withType:v4];
  }
}

- (void)_handleGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  int64_t v6 = [(SBHomeGestureInteraction *)self typeOfGestureRecognizer:v4];

  char v7 = [(SBHomeGestureInteraction *)self delegate];
  id v8 = v7;
  switch(v5)
  {
    case 1:
      self->_recognizedGestureType = v6;
      [v7 homeGestureInteractionBegan:self];
      goto LABEL_4;
    case 2:
      [v7 homeGestureInteractionChanged:self];
LABEL_4:
      char v7 = v8;
      break;
    case 3:
      [v7 homeGestureInteractionEnded:self];
      goto LABEL_7;
    case 4:
      [v7 homeGestureInteractionCancelled:self];
LABEL_7:
      char v7 = v8;
      if (self->_recognizedGestureType == v6) {
        self->_recognizedGestureType = 0;
      }
      break;
    default:
      break;
  }
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  int64_t v6 = [WeakRetained viewForSystemGestureRecognizer:v4];

  return v6;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHomeGestureInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = objc_msgSend(v5, "homeGestureInteraction:shouldBeginGestureRecognizerOfType:", self, -[SBHomeGestureInteraction typeOfGestureRecognizer:](self, "typeOfGestureRecognizer:", v4));
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBHomeGestureInteraction *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v9 = [v8 homeGestureInteraction:self shouldRecognizeSimultaneouslyWithGestureRecognizer:v7];
  }
  else
  {
    v10 = [(SBHomeGestureInteraction *)self gestureRecognizers];
    char v9 = [v10 containsObject:v6] && (objc_msgSend(v10, "containsObject:", v7) & 1) != 0;
  }
  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHomeGestureInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 homeGestureInteraction:self shouldRequireFailureOfGestureRecognizer:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHomeGestureInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 homeGestureInteraction:self shouldBeRequiredToFailByGestureRecognizer:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeGestureInteraction *)self gestureRecognizerForType:self->_recognizedGestureType];
  id v6 = v5;
  if (v5)
  {
    [v5 locationInView:v4];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeGestureInteraction *)self gestureRecognizerForType:self->_recognizedGestureType];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 translationInView:v4];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeGestureInteraction *)self gestureRecognizerForType:self->_recognizedGestureType];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 velocityInView:v4];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(SBHomeGestureInteraction *)self gestureRecognizers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setEnabled:v3];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)gestureRecognizerForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *((id *)&self->_recognizedGestureType + a3);
  }
  return v4;
}

- (int64_t)typeOfGestureRecognizer:(id)a3
{
  id v4 = (SBFluidScrunchGestureRecognizer *)a3;
  if ((SBFluidScrunchGestureRecognizer *)self->_screenEdgePanGestureRecognizer == v4)
  {
    int64_t v5 = 1;
  }
  else if ((SBFluidScrunchGestureRecognizer *)self->_indirectPanGestureRecognizer == v4)
  {
    int64_t v5 = 2;
  }
  else if (self->_scrunchGestureRecognizer == v4)
  {
    int64_t v5 = 3;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSSet)gestureRecognizers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  objc_msgSend(v3, "bs_safeAddObject:", self->_screenEdgePanGestureRecognizer);
  objc_msgSend(v3, "bs_safeAddObject:", self->_indirectPanGestureRecognizer);
  objc_msgSend(v3, "bs_safeAddObject:", self->_scrunchGestureRecognizer);
  return (NSSet *)v3;
}

- (UIGestureRecognizer)recognizedGestureRecognizer
{
  return (UIGestureRecognizer *)[(SBHomeGestureInteraction *)self gestureRecognizerForType:self->_recognizedGestureType];
}

- (double)indirectScreenEdgeGestureRecognitionDistance
{
  if (self->_recognizedGestureType != 2) {
    return 0.0;
  }
  [(SBIndirectPanGestureRecognizer *)self->_indirectPanGestureRecognizer activationRecognitionDistance];
  return result;
}

- (BOOL)_isGestureRunning:(id)a3
{
  return (unint64_t)([a3 state] - 1) < 3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)recognizedGestureType
{
  return self->_recognizedGestureType;
}

- (void)setRecognizedGestureType:(int64_t)a3
{
  self->_recognizedGestureType = a3;
}

- (SBHomeGesturePanGestureRecognizer)screenEdgePanGestureRecognizer
{
  return self->_screenEdgePanGestureRecognizer;
}

- (void)setScreenEdgePanGestureRecognizer:(id)a3
{
}

- (SBIndirectPanGestureRecognizer)indirectPanGestureRecognizer
{
  return self->_indirectPanGestureRecognizer;
}

- (void)setIndirectPanGestureRecognizer:(id)a3
{
}

- (SBFluidScrunchGestureRecognizer)scrunchGestureRecognizer
{
  return self->_scrunchGestureRecognizer;
}

- (void)setScrunchGestureRecognizer:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (SBSystemGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (void)setGestureManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrunchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_screenEdgePanGestureRecognizer, 0);
}

@end