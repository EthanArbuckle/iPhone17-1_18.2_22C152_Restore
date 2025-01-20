@interface SBSceneViewStatusBarAssertion
- (BOOL)isStatusBarHidden;
- (NSString)description;
- (SBSceneViewStatusBarAssertion)initWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5;
- (SBSceneViewStatusBarAssertion)initWithStatusBarSettings:(id)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5;
- (SBStatusBarSettings)settings;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)nubViewHidden;
- (unint64_t)level;
- (void)_notifyObserversDidInvalidate;
- (void)_notifyObserversDidUpdate;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setNubViewHidden:(int64_t)a3;
- (void)setSettings:(id)a3;
- (void)setStatusBarHidden:(BOOL)a3;
@end

@implementation SBSceneViewStatusBarAssertion

- (SBStatusBarSettings)settings
{
  return self->_settings;
}

- (BOOL)isStatusBarHidden
{
  v3 = [(SBStatusBarSettings *)self->_settings alpha];

  if (!v3) {
    return 0;
  }
  v4 = [(SBStatusBarSettings *)self->_settings alpha];
  [v4 floatValue];
  char IsZero = BSFloatIsZero();

  return IsZero;
}

- (void)setNubViewHidden:(int64_t)a3
{
  if (self->_nubViewHidden != a3)
  {
    self->_nubViewHidden = a3;
    [(SBSceneViewStatusBarAssertion *)self _notifyObserversDidUpdate];
  }
}

- (void)setStatusBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBSceneViewStatusBarAssertion *)self isStatusBarHidden] != a3)
  {
    id v6 = (id)[(SBStatusBarSettings *)self->_settings mutableCopy];
    v5 = [NSNumber numberWithInt:!v3];
    [v6 setAlpha:v5];

    [(SBSceneViewStatusBarAssertion *)self setSettings:v6];
  }
}

- (void)setSettings:(id)a3
{
  id v6 = a3;
  if (!-[SBStatusBarSettings isEqual:](self->_settings, "isEqual:"))
  {
    v4 = (SBStatusBarSettings *)[v6 copy];
    settings = self->_settings;
    self->_settings = v4;

    [(SBSceneViewStatusBarAssertion *)self _notifyObserversDidUpdate];
  }
}

- (void)dealloc
{
  [(SBSceneViewStatusBarAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSceneViewStatusBarAssertion;
  [(SBSceneViewStatusBarAssertion *)&v3 dealloc];
}

- (int64_t)nubViewHidden
{
  return self->_nubViewHidden;
}

- (SBSceneViewStatusBarAssertion)initWithStatusBarSettings:(id)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSceneViewStatusBarAssertion;
  v9 = [(SBSceneViewStatusBarAssertion *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    settings = v9->_settings;
    v9->_settings = (SBStatusBarSettings *)v10;

    v9->_nubViewHidden = a4;
    v9->_level = a5;
  }

  return v9;
}

- (void)addObserver:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    BOOL v4 = [(NSHashTable *)self->_observers containsObject:v9];
    v5 = v9;
    if (v4) {
      goto LABEL_8;
    }
    observers = self->_observers;
    if (!observers)
    {
      v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v9];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ cannot be observed by a nil object", objc_opt_class() format];
  }
  v5 = v9;
LABEL_8:
}

- (void)_notifyObserversDidInvalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) statusBarAssertionDidInvalidate:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversDidUpdate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) statusBarAssertionDidUpdate:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (SBSceneViewStatusBarAssertion)initWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5
{
  BOOL v7 = a3;
  long long v9 = objc_alloc_init(SBMutableStatusBarSettings);
  double v10 = 1.0;
  if (v7) {
    double v10 = 0.0;
  }
  long long v11 = [NSNumber numberWithDouble:v10];
  [(SBMutableStatusBarSettings *)v9 setAlpha:v11];

  v12 = [(SBSceneViewStatusBarAssertion *)self initWithStatusBarSettings:v9 nubViewHidden:a4 atLevel:a5];
  return v12;
}

- (NSString)description
{
  return (NSString *)[(SBSceneViewStatusBarAssertion *)self descriptionWithMultilinePrefix:0];
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (id)succinctDescription
{
  v2 = [(SBSceneViewStatusBarAssertion *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t level = self->_level;
  if (level >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown %lu)", self->_level);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = off_1E6AFADB0[level];
  }
  [v3 appendString:v5 withName:@"level"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBSceneViewStatusBarAssertion isStatusBarHidden](self, "isStatusBarHidden"), @"statusBarHidden", 1);
  id v7 = (id)[v3 appendBool:BSSettingFlagIsYes() withName:@"nubHidden" ifEqualTo:1];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBSceneViewStatusBarAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBSceneViewStatusBarAssertion *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SBSceneViewStatusBarAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  long long v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __71__SBSceneViewStatusBarAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"settings"];
}

- (unint64_t)level
{
  return self->_level;
}

@end