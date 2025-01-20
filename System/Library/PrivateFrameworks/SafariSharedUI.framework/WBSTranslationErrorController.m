@interface WBSTranslationErrorController
- (WBSTranslationErrorController)init;
- (WBSTranslationErrorControllerDelegate)delegate;
- (id)_overriddenThresholdForError:(id)a3;
- (void)addError:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
@end

@implementation WBSTranslationErrorController

- (WBSTranslationErrorController)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSTranslationErrorController;
  v2 = [(WBSTranslationErrorController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28BD0] set];
    errorCounter = v2->_errorCounter;
    v2->_errorCounter = (NSCountedSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    errorKeysReachingThreshold = v2->_errorKeysReachingThreshold;
    v2->_errorKeysReachingThreshold = (NSMutableSet *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)addError:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (v4)
  {
    uint64_t v5 = NSString;
    v6 = [v4 domain];
    v7 = [v5 stringWithFormat:@"%@:%ld", v6, objc_msgSend(v14, "code")];
  }
  else
  {
    v7 = 0;
  }
  [(NSCountedSet *)self->_errorCounter addObject:v7];
  NSUInteger v8 = [(NSCountedSet *)self->_errorCounter countForObject:v7];
  objc_super v9 = [(WBSTranslationErrorController *)self _overriddenThresholdForError:v14];
  v10 = v9;
  if (v9)
  {
    unint64_t v11 = [v9 unsignedIntegerValue];
  }
  else
  {
    v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    if ([v12 BOOLForKey:@"WBSTranslationLowErrorAlertThresholdSettingsKey"]) {
      unint64_t v11 = 1;
    }
    else {
      unint64_t v11 = 5;
    }
  }
  if (v8 >= v11 && ([(NSMutableSet *)self->_errorKeysReachingThreshold containsObject:v7] & 1) == 0)
  {
    [(NSMutableSet *)self->_errorKeysReachingThreshold addObject:v7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained errorController:self didReachThresholdForError:v14];
    }
  }
}

- (void)invalidate
{
  [(NSCountedSet *)self->_errorCounter removeAllObjects];
  errorKeysReachingThreshold = self->_errorKeysReachingThreshold;
  [(NSMutableSet *)errorKeysReachingThreshold removeAllObjects];
}

- (id)_overriddenThresholdForError:(id)a3
{
  uint64_t v3 = [a3 domain];
  if ([v3 isEqualToString:*MEMORY[0x1E4F46820]]) {
    id v4 = &unk_1F0341928;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (WBSTranslationErrorControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSTranslationErrorControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_errorKeysReachingThreshold, 0);
  objc_storeStrong((id *)&self->_errorCounter, 0);
}

@end