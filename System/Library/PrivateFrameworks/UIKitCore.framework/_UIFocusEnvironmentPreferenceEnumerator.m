@interface _UIFocusEnvironmentPreferenceEnumerator
- (BOOL)_shouldInferDefaultPreferenceForEnvironmentInContext:(id)a3;
- (BOOL)allowsInferringPreferences;
- (_UIDebugLogNode)debugLog;
- (_UIFocusEnvironmentPreferenceEnumerator)init;
- (_UIFocusEnvironmentPreferenceEnumerator)initWithEnumerationMode:(int64_t)a3;
- (id)didVisitAllPreferencesForEnvironmentHandler;
- (id)shouldInferPreferenceForEnvironmentHandler;
- (int64_t)enumerationMode;
- (void)enumeratePreferencesForEnvironment:(id)a3 usingBlock:(id)a4;
- (void)setAllowsInferringPreferences:(BOOL)a3;
- (void)setDebugLog:(id)a3;
- (void)setDidVisitAllPreferencesForEnvironmentHandler:(id)a3;
- (void)setShouldInferPreferenceForEnvironmentHandler:(id)a3;
@end

@implementation _UIFocusEnvironmentPreferenceEnumerator

- (_UIFocusEnvironmentPreferenceEnumerator)init
{
  return [(_UIFocusEnvironmentPreferenceEnumerator *)self initWithEnumerationMode:0];
}

- (_UIFocusEnvironmentPreferenceEnumerator)initWithEnumerationMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFocusEnvironmentPreferenceEnumerator;
  result = [(_UIFocusEnvironmentPreferenceEnumerator *)&v5 init];
  if (result)
  {
    result->_allowsInferringPreferences = 1;
    result->_enumerationMode = a3;
  }
  return result;
}

- (void)enumeratePreferencesForEnvironment:(id)a3 usingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIFocusEnvironmentPreferenceEnumerator.m", 529, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"_UIFocusEnvironmentPreferenceEnumerator.m", 530, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  v10 = [[_UIFocusEnvironmentPreferenceEnumerationContext alloc] initWithFocusEnvironment:v7 enumerationMode:[(_UIFocusEnvironmentPreferenceEnumerator *)self enumerationMode]];
  [(_UIFocusEnvironmentPreferenceEnumerationContext *)v10 setDelegate:self];
  if (self->_debugLog)
  {
    v11 = [(_UIFocusEnvironmentPreferenceEnumerationContext *)v10 _startLogging];
    [(_UIDebugLogNode *)self->_debugLog addMessage:v11];
  }
  uint64_t v14 = 0;
  _enumeratePreferredFocusEnvironments(self, v10, v9, &v14);
  if (self->_debugLog) {
    [(_UIFocusEnvironmentPreferenceEnumerationContext *)v10 _stopLogging];
  }
}

- (BOOL)_shouldInferDefaultPreferenceForEnvironmentInContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_allowsInferringPreferences && [v4 isInPreferredSubtree])
  {
    v6 = _Block_copy(self->_shouldInferPreferenceForEnvironmentHandler);
    id v7 = v6;
    if (v6) {
      char v8 = (*((uint64_t (**)(void *, void *))v6 + 2))(v6, v5);
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (int64_t)enumerationMode
{
  return self->_enumerationMode;
}

- (id)didVisitAllPreferencesForEnvironmentHandler
{
  return self->_didVisitAllPreferencesForEnvironmentHandler;
}

- (void)setDidVisitAllPreferencesForEnvironmentHandler:(id)a3
{
}

- (BOOL)allowsInferringPreferences
{
  return self->_allowsInferringPreferences;
}

- (void)setAllowsInferringPreferences:(BOOL)a3
{
  self->_allowsInferringPreferences = a3;
}

- (id)shouldInferPreferenceForEnvironmentHandler
{
  return self->_shouldInferPreferenceForEnvironmentHandler;
}

- (void)setShouldInferPreferenceForEnvironmentHandler:(id)a3
{
}

- (_UIDebugLogNode)debugLog
{
  return self->_debugLog;
}

- (void)setDebugLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLog, 0);
  objc_storeStrong(&self->_shouldInferPreferenceForEnvironmentHandler, 0);
  objc_storeStrong(&self->_didVisitAllPreferencesForEnvironmentHandler, 0);
}

@end