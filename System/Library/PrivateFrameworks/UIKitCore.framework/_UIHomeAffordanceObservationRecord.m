@interface _UIHomeAffordanceObservationRecord
- (NSString)debugDescription;
- (NSString)description;
- (_UIHomeAffordanceObservationRecord)init;
- (id)initWithObserver:(void *)a3 window:(void *)a4 viewServiceSessionIdentifier:;
- (id)observer;
- (id)succinctDescription;
- (void)appendDescriptionToStream:(id)a3;
- (void)setLegacyViewServiceSessionIdentifier:(uint64_t)a1;
@end

@implementation _UIHomeAffordanceObservationRecord

- (void)setLegacyViewServiceSessionIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)initWithObserver:(void *)a3 window:(void *)a4 viewServiceSessionIdentifier:
{
  if (!a1) {
    return 0;
  }
  v11.receiver = a1;
  v11.super_class = (Class)_UIHomeAffordanceObservationRecord;
  v7 = (id *)objc_msgSendSuper2(&v11, sel_init);
  if (v7)
  {
    if (a2)
    {
      if (a3)
      {
LABEL_5:
        objc_storeWeak(v7 + 1, a2);
        objc_storeWeak(v7 + 2, a3);
        objc_storeStrong(v7 + 3, a4);
        return v7;
      }
    }
    else
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel_initWithObserver_window_viewServiceSessionIdentifier_, v7, @"_UIHomeAffordanceSceneNotifier.m", 430, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

      if (a3) {
        goto LABEL_5;
      }
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel_initWithObserver_window_viewServiceSessionIdentifier_, v7, @"_UIHomeAffordanceSceneNotifier.m", 431, @"Invalid parameter not satisfying: %@", @"window" object file lineNumber description];

    goto LABEL_5;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyViewServiceSessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_destroyWeak((id *)&self->_observer);
}

- (void)appendDescriptionToStream:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64___UIHomeAffordanceObservationRecord_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = a3;
  v6[5] = self;
  [a3 appendProem:self block:v6];
  if ([a3 hasDebugStyle])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64___UIHomeAffordanceObservationRecord_appendDescriptionToStream___block_invoke_2;
    v5[3] = &unk_1E52D9F98;
    v5[4] = a3;
    v5[5] = self;
    [a3 appendBodySectionWithName:0 block:v5];
  }
}

- (id)observer
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (_UIHomeAffordanceObservationRecord)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIHomeAffordanceSceneNotifier.m", 421, @"%s: init is not allowed on %@", "-[_UIHomeAffordanceObservationRecord init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)succinctDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  v4 = [MEMORY[0x1E4F4F728] succinctStyle];
  v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return v5;
}

- (NSString)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  v4 = [MEMORY[0x1E4F4F728] debugStyle];
  v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

@end