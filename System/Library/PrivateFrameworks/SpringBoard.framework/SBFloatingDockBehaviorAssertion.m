@interface SBFloatingDockBehaviorAssertion
- (BOOL)gesturePossible;
- (BOOL)isAnimated;
- (BOOL)isPinned;
- (NSDate)timestamp;
- (NSString)description;
- (NSString)reason;
- (SBFloatingDockBehaviorAssertion)initWithFloatingDockController:(id)a3 visibleProgress:(double)a4 animated:(BOOL)a5 gesturePossible:(BOOL)a6 atLevel:(unint64_t)a7 reason:(id)a8 withCompletion:(id)a9;
- (SBFloatingDockController)floatingDockController;
- (double)progress;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)level;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithCompletion:(id)a3;
- (void)modifyProgress:(double)a3 interactive:(BOOL)a4 completion:(id)a5;
@end

@implementation SBFloatingDockBehaviorAssertion

- (SBFloatingDockBehaviorAssertion)initWithFloatingDockController:(id)a3 visibleProgress:(double)a4 animated:(BOOL)a5 gesturePossible:(BOOL)a6 atLevel:(unint64_t)a7 reason:(id)a8 withCompletion:(id)a9
{
  id v17 = a3;
  id v18 = a8;
  id v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)SBFloatingDockBehaviorAssertion;
  v20 = [(SBFloatingDockBehaviorAssertion *)&v28 init];
  if (v20)
  {
    if (a7 >= 0xD)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:v20 file:@"SBFloatingDockBehaviorAssertion.m" lineNumber:26 description:@"invalid floating dock pinned level"];

      if (v18) {
        goto LABEL_4;
      }
    }
    else if (v18)
    {
LABEL_4:
      v20->_progress = a4;
      v20->_level = a7;
      uint64_t v21 = [v18 copy];
      reason = v20->_reason;
      v20->_reason = (NSString *)v21;

      uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
      timestamp = v20->_timestamp;
      v20->_timestamp = (NSDate *)v23;

      v20->_gesturePossible = a6;
      objc_storeWeak((id *)&v20->_floatingDockController, v17);
      v20->_animated = a5;
      [v17 _addFloatingDockBehaviorAssertion:v20 withCompletion:v19];
      goto LABEL_5;
    }
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:v20 file:@"SBFloatingDockBehaviorAssertion.m" lineNumber:27 description:@"invalid reason"];

    goto LABEL_4;
  }
LABEL_5:

  return v20;
}

- (void)dealloc
{
  [(SBFloatingDockBehaviorAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBFloatingDockBehaviorAssertion;
  [(SBFloatingDockBehaviorAssertion *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)invalidateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockBehaviorAssertion *)self floatingDockController];
  [v5 _removeFloatingDockBehaviorAssertion:self withCompletion:v4];
}

- (void)modifyProgress:(double)a3 interactive:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_progress = a3;
    v8 = [(SBFloatingDockBehaviorAssertion *)self floatingDockController];
    [v8 _updateFloatingDockBehaviorAssertionsInteractive:v5 completion:v9];
  }
}

- (BOOL)isPinned
{
  return BSFloatIsOne();
}

- (NSString)description
{
  return (NSString *)[(SBFloatingDockBehaviorAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFloatingDockBehaviorAssertion *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBFloatingDockBehaviorAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBFloatingDockBehaviorAssertion *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBFloatingDockBehaviorAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __73__SBFloatingDockBehaviorAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:BSFloatIsOne() withName:@"pinned"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:BSFloatIsOne() withName:@"animated"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9) withName:@"gesture possible"];
  id v5 = (id)[*(id *)(a1 + 32) appendFloat:@"visible progress" withName:*(double *)(*(void *)(a1 + 40) + 24)];
  id v6 = *(void **)(a1 + 32);
  id v7 = SBFloatingDockBehaviorLevelDescription(*(void *)(*(void *)(a1 + 40) + 16));
  id v8 = (id)[v6 appendObject:v7 withName:@"level"];

  id v9 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"reason"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"timestamp"];
}

- (unint64_t)level
{
  return self->_level;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (BOOL)gesturePossible
{
  return self->_gesturePossible;
}

- (double)progress
{
  return self->_progress;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (SBFloatingDockController)floatingDockController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingDockController);
  return (SBFloatingDockController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_floatingDockController);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end