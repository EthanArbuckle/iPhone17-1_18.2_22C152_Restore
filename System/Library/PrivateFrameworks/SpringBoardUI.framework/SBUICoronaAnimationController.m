@interface SBUICoronaAnimationController
+ (id)animationSettingsForTransitionToStyle:(int64_t)a3;
- (UIViewPropertyAnimator)_propertyAnimator;
- (id)_configurePropertyAnimatorIfNecessaryForChangeToUserInterfaceStyle:(int64_t)a3;
- (void)_setPropertyAnimator:(id)a3;
- (void)addParticipant:(id)a3;
- (void)coronaDidChange:(int64_t)a3;
- (void)removeParticipant:(id)a3;
@end

@implementation SBUICoronaAnimationController

+ (id)animationSettingsForTransitionToStyle:(int64_t)a3
{
  v3 = (void *)MEMORY[0x263F15EB0];
  if (a3 == 2) {
    v3 = (void *)MEMORY[0x263F15EC0];
  }
  v4 = [MEMORY[0x263F15808] functionWithName:*v3];
  v5 = [MEMORY[0x263F29BC8] settingsWithDuration:v4 timingFunction:0.5];

  return v5;
}

- (void)addParticipant:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    participants = self->_participants;
    id v9 = v5;
    if (!participants)
    {
      v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      v8 = self->_participants;
      self->_participants = v7;

      participants = self->_participants;
    }
    id v4 = (id)[(NSHashTable *)participants addObject:v9];
    id v5 = v9;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)removeParticipant:(id)a3
{
  if (a3)
  {
    participants = self->_participants;
    if (participants) {
      -[NSHashTable removeObject:](participants, "removeObject:");
    }
  }
}

- (id)_configurePropertyAnimatorIfNecessaryForChangeToUserInterfaceStyle:(int64_t)a3
{
  propertyAnimator = self->_propertyAnimator;
  if (!propertyAnimator)
  {
    if (a3 == 2) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    id v6 = objc_alloc(MEMORY[0x263F1CB78]);
    v7 = (void *)[objc_alloc(MEMORY[0x263F1C5A0]) initWithAnimationCurve:v5];
    v8 = (UIViewPropertyAnimator *)[v6 initWithDuration:v7 timingParameters:0.5];
    id v9 = self->_propertyAnimator;
    self->_propertyAnimator = v8;

    objc_initWeak(&location, self);
    v10 = self->_propertyAnimator;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __100__SBUICoronaAnimationController__configurePropertyAnimatorIfNecessaryForChangeToUserInterfaceStyle___block_invoke;
    v12[3] = &unk_2645D4420;
    objc_copyWeak(&v13, &location);
    [(UIViewPropertyAnimator *)v10 addCompletion:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    propertyAnimator = self->_propertyAnimator;
  }

  return propertyAnimator;
}

void __100__SBUICoronaAnimationController__configurePropertyAnimatorIfNecessaryForChangeToUserInterfaceStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setPropertyAnimator:0];
}

- (void)coronaDidChange:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [(SBUICoronaAnimationController *)self _configurePropertyAnimatorIfNecessaryForChangeToUserInterfaceStyle:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_participants;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "coronaAnimationController:willAnimateCoronaTransitionWithAnimator:", self, self->_propertyAnimator, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(UIViewPropertyAnimator *)self->_propertyAnimator startAnimation];
}

- (UIViewPropertyAnimator)_propertyAnimator
{
  return self->_propertyAnimator;
}

- (void)_setPropertyAnimator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAnimator, 0);

  objc_storeStrong((id *)&self->_participants, 0);
}

@end