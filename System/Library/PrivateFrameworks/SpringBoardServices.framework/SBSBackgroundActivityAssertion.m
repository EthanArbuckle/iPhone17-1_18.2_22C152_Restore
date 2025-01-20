@interface SBSBackgroundActivityAssertion
+ (id)assertionWithBackgroundActivityIdentifier:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6;
+ (id)assertionWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6;
+ (id)backgroundLocationAssertionForPID:(int)a3;
- (BOOL)isExclusive;
- (BOOL)showsWhenForeground;
- (NSSet)backgroundActivityIdentifiers;
- (NSString)description;
- (NSString)statusString;
- (NSString)uniqueIdentifier;
- (SBSBackgroundActivityAssertion)initWithBackgroundActivityAssertionData:(id)a3;
- (SBSBackgroundActivityAssertion)initWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6;
- (SBSBackgroundActivityAssertionData)assertionData;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)invalidationHandler;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
- (void)acquireWithHandler:(id)a3 invalidationHandler:(id)a4;
- (void)acquireWithHandler:(id)a3 onQueue:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setAssertionData:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setStatusString:(id)a3;
@end

@implementation SBSBackgroundActivityAssertion

+ (id)backgroundLocationAssertionForPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = getSTBackgroundActivityIdentifierBackgroundLocation();
  v5 = +[SBSBackgroundActivityAssertion assertionWithBackgroundActivityIdentifier:v4 forPID:v3 exclusive:0 showsWhenForeground:0];

  return v5;
}

+ (id)assertionWithBackgroundActivityIdentifier:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];

  v13 = (void *)[v11 initWithBackgroundActivityIdentifiers:v12 forPID:v8 exclusive:v7 showsWhenForeground:v6];
  return v13;
}

+ (id)assertionWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithBackgroundActivityIdentifiers:v10 forPID:v8 exclusive:v7 showsWhenForeground:v6];

  return v11;
}

- (SBSBackgroundActivityAssertion)initWithBackgroundActivityIdentifiers:(id)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = [[SBSBackgroundActivityAssertionData alloc] initWithBackgroundActivityIdentifiers:v10 forPID:v8 exclusive:v7 showsWhenForeground:v6];

  v12 = [(SBSBackgroundActivityAssertion *)self initWithBackgroundActivityAssertionData:v11];
  return v12;
}

- (SBSBackgroundActivityAssertion)initWithBackgroundActivityAssertionData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSBackgroundActivityAssertion;
  BOOL v6 = [(SBSBackgroundActivityAssertion *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assertionData, a3);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = +[SBSBackgroundActivityAssertionManager sharedInstance];
  [v3 removeBackgroundActivityAssertion:self];

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBSBackgroundActivityAssertion;
  [(SBSBackgroundActivityAssertion *)&v5 dealloc];
}

- (NSSet)backgroundActivityIdentifiers
{
  return [(SBSBackgroundActivityAssertionData *)self->_assertionData backgroundActivityIdentifiers];
}

- (int)pid
{
  return [(SBSBackgroundActivityAssertionData *)self->_assertionData pid];
}

- (BOOL)isExclusive
{
  return [(SBSBackgroundActivityAssertionData *)self->_assertionData isExclusive];
}

- (BOOL)showsWhenForeground
{
  return [(SBSBackgroundActivityAssertionData *)self->_assertionData showsWhenForeground];
}

- (NSString)statusString
{
  return [(SBSBackgroundActivityAssertionData *)self->_assertionData statusString];
}

- (void)setStatusString:(id)a3
{
  id v7 = a3;
  v4 = [(SBSBackgroundActivityAssertionData *)self->_assertionData statusString];
  char v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    [(SBSBackgroundActivityAssertionData *)self->_assertionData setStatusString:v7];
    BOOL v6 = +[SBSBackgroundActivityAssertionManager sharedInstance];
    [v6 updateStatusStringForAssertion:self];
  }
}

- (NSString)uniqueIdentifier
{
  return [(SBSBackgroundActivityAssertionData *)self->_assertionData uniqueIdentifier];
}

- (void)acquireWithHandler:(id)a3 invalidationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SBSBackgroundActivityAssertionManager sharedInstance];
  if (v8)
  {
    objc_super v9 = (void *)[v7 copy];
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = v9;

    [v8 addBackgroundActivityAssertion:self withHandler:v6 onQueue:0];
  }
  else if (v6)
  {
    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__SBSBackgroundActivityAssertion_acquireWithHandler_invalidationHandler___block_invoke;
    block[3] = &unk_1E566B4D8;
    id v13 = v6;
    dispatch_async(v11, block);
  }
}

uint64_t __73__SBSBackgroundActivityAssertion_acquireWithHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acquireWithHandler:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SBSBackgroundActivityAssertionManager sharedInstance];
  objc_super v9 = v8;
  if (v8)
  {
    [v8 addBackgroundActivityAssertion:self withHandler:v6 onQueue:v7];
  }
  else if (v6)
  {
    id v10 = v7;
    if (!v7)
    {
      id v10 = dispatch_get_global_queue(0, 0);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__SBSBackgroundActivityAssertion_acquireWithHandler_onQueue___block_invoke;
    block[3] = &unk_1E566B4D8;
    id v12 = v6;
    dispatch_async(v10, block);
    if (!v7) {
  }
    }
}

uint64_t __61__SBSBackgroundActivityAssertion_acquireWithHandler_onQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  id v3 = +[SBSBackgroundActivityAssertionManager sharedInstance];
  [v3 removeBackgroundActivityAssertion:self];
}

- (NSString)description
{
  return (NSString *)[(SBSBackgroundActivityAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSBackgroundActivityAssertion *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSBackgroundActivityAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  char v5 = [(SBSBackgroundActivityAssertion *)self assertionData];
  id v6 = [v5 descriptionBuilderWithMultilinePrefix:v4];

  return v6;
}

- (SBSBackgroundActivityAssertionData)assertionData
{
  return self->_assertionData;
}

- (void)setAssertionData:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_assertionData, 0);
}

@end