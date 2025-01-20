@interface SBAssistantSceneController
- (BOOL)commandeerCaptureDropletPreludeForVisionInvocation:(id)a3;
- (BOOL)isSystemAssistantExperienceAvailable;
- (BOOL)isSystemAssistantExperienceEnabled;
- (BOOL)isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled;
- (BOOL)isSystemAssistantExperiencePersistentSiriEnabled;
- (BOOL)isVisible;
- (NSHashTable)observers;
- (SBAssistantRootViewController)assistantRootViewController;
- (SBAssistantSceneController)initWithWindowScene:(id)a3;
- (SBAssistantSessionPresentationContext)presentationContext;
- (SBWindow)window;
- (SBWindowScene)windowScene;
- (void)addObserver:(id)a3;
- (void)assistantDidAppear:(id)a3 windowScene:(id)a4;
- (void)assistantDidChangePresentation:(id)a3 windowScene:(id)a4;
- (void)assistantDidChangeSystemAssistantExperienceEnablement:(id)a3;
- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3;
- (void)assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:(id)a3;
- (void)assistantDidDisappear:(id)a3 windowScene:(id)a4;
- (void)assistantWillAppear:(id)a3 windowScene:(id)a4;
- (void)assistantWillDisappear:(id)a3 windowScene:(id)a4;
- (void)dismissAssistantViewIfNecessary;
- (void)dismissAssistantViewIfNecessaryForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4;
- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3;
- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation SBAssistantSceneController

- (BOOL)isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  char v3 = [WeakRetained isContinuityDisplayWindowScene];

  if (v3) {
    return 0;
  }
  v5 = +[SBAssistantController sharedInstance];
  char v6 = [v5 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  return v6;
}

- (BOOL)isSystemAssistantExperienceEnabled
{
  v2 = +[SBAssistantController sharedInstance];
  char v3 = [v2 isSystemAssistantExperienceEnabled];

  return v3;
}

- (SBAssistantSessionPresentationContext)presentationContext
{
  char v3 = +[SBAssistantController sharedInstance];
  v4 = [(SBAssistantSceneController *)self windowScene];
  v5 = [v3 sessionForWindowScene:v4];
  char v6 = [v5 presentationContext];

  return (SBAssistantSessionPresentationContext *)v6;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (BOOL)isVisible
{
  char v3 = +[SBAssistantController sharedInstance];
  v4 = [(SBAssistantSceneController *)self windowScene];
  char v5 = [v3 isVisibleInWindowScene:v4];

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v7;
    if (!v5)
    {
      char v6 = [(SBAssistantSceneController *)self observers];
      [v6 addObject:v7];

      id v4 = v7;
    }
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (SBAssistantSceneController)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAssistantSceneController;
  BOOL v5 = [(SBAssistantSceneController *)&v11 init];
  char v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    uint64_t v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    v9 = +[SBAssistantController sharedInstance];
    [v9 addObserver:v6];
  }
  return v6;
}

- (BOOL)isSystemAssistantExperienceAvailable
{
  v2 = +[SBAssistantController sharedInstance];
  char v3 = [v2 isSystemAssistantExperienceAvailable];

  return v3;
}

- (BOOL)isSystemAssistantExperiencePersistentSiriEnabled
{
  v2 = +[SBAssistantController sharedInstance];
  char v3 = [v2 isSystemAssistantExperiencePersistentSiriEnabled];

  return v3;
}

- (SBWindow)window
{
  char v3 = +[SBAssistantController sharedInstance];
  id v4 = [(SBAssistantSceneController *)self windowScene];
  BOOL v5 = [v3 sessionForWindowScene:v4];
  char v6 = [v5 window];

  return (SBWindow *)v6;
}

- (SBAssistantRootViewController)assistantRootViewController
{
  char v3 = +[SBAssistantController sharedInstance];
  id v4 = [(SBAssistantSceneController *)self windowScene];
  BOOL v5 = [v3 sessionForWindowScene:v4];
  char v6 = [v5 assistantRootViewController];

  return (SBAssistantRootViewController *)v6;
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SBAssistantSceneController *)self observers];
    [v5 removeObject:v4];
  }
}

- (void)dismissAssistantViewIfNecessary
{
  id v4 = +[SBAssistantController sharedInstance];
  char v3 = [(SBAssistantSceneController *)self windowScene];
  [v4 dismissAssistantViewIfNecessaryInWindowScene:v3];
}

- (void)dismissAssistantViewIfNecessaryForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  id v10 = +[SBAssistantController sharedInstance];
  v9 = [(SBAssistantSceneController *)self windowScene];
  objc_msgSend(v10, "dismissAssistantViewIfNecessaryForGestureTranslation:velocity:windowScene:", v9, v7, v6, x, y);
}

- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3
{
  id v6 = +[SBAssistantController sharedInstance];
  id v5 = [(SBAssistantSceneController *)self windowScene];
  [v6 dismissAssistantViewIfNecessaryWithAnimation:a3 windowScene:v5];
}

- (void)dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = +[SBAssistantController sharedInstance];
  double v7 = [(SBAssistantSceneController *)self windowScene];
  [v8 dismissAssistantViewIfNecessaryWithAnimation:a3 windowScene:v7 completion:v6];
}

- (BOOL)commandeerCaptureDropletPreludeForVisionInvocation:(id)a3
{
  id v4 = a3;
  id v5 = +[SBAssistantController sharedInstance];
  id v6 = [(SBAssistantSceneController *)self windowScene];
  char v7 = [v5 commandeerCaptureDropletPreludeForVisionInvocation:v4 windowScene:v6];

  return v7;
}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(SBAssistantSceneController *)self windowScene];

  if (v6 == v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    char v7 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 assistantWillAppear:self];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)assistantDidAppear:(id)a3 windowScene:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(SBAssistantSceneController *)self windowScene];

  if (v6 == v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    char v7 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 assistantDidAppear:self];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)assistantWillDisappear:(id)a3 windowScene:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(SBAssistantSceneController *)self windowScene];

  if (v6 == v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    char v7 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 assistantWillDisappear:self];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)assistantDidDisappear:(id)a3 windowScene:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(SBAssistantSceneController *)self windowScene];

  if (v6 == v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    char v7 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 assistantDidDisappear:self];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)assistantDidChangePresentation:(id)a3 windowScene:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(SBAssistantSceneController *)self windowScene];

  if (v6 == v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    char v7 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 assistantDidChangePresentation:self];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)assistantDidChangeSystemAssistantExperienceEnablement:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 assistantDidChangeSystemAssistantExperienceEnablement:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_windowScene);
}

@end