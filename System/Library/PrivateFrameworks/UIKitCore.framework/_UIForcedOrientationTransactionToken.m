@interface _UIForcedOrientationTransactionToken
- (BOOL)disablesInterfaceAutorotation;
- (NSString)debugDescription;
- (NSString)transactionReason;
- (_UIForcedOrientationTransactionHandler)transactionHandler;
- (_UIForcedOrientationTransactionToken)initWithOriginalOrientation:(int64_t)a3 handler:(id)a4 reason:(id)a5;
- (_UIForcedOrientationTransactionToken)initWithOriginalOrientation:(int64_t)a3 handler:(id)a4 reason:(id)a5 disablingInterfaceAutorotation:(BOOL)a6;
- (id)_orientationDebugDescription;
- (id)commitCompletionBlock;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)originalInterfaceOrientation;
- (unint64_t)state;
- (void)cancel;
- (void)commitAnimated:(BOOL)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)didCommitOrientation;
- (void)setCommitCompletionBlock:(id)a3;
- (void)setTransactionHandler:(id)a3;
@end

@implementation _UIForcedOrientationTransactionToken

- (_UIForcedOrientationTransactionToken)initWithOriginalOrientation:(int64_t)a3 handler:(id)a4 reason:(id)a5
{
  return [(_UIForcedOrientationTransactionToken *)self initWithOriginalOrientation:a3 handler:a4 reason:a5 disablingInterfaceAutorotation:1];
}

- (_UIForcedOrientationTransactionToken)initWithOriginalOrientation:(int64_t)a3 handler:(id)a4 reason:(id)a5 disablingInterfaceAutorotation:(BOOL)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UIForcedOrientationTransactionToken;
  v12 = [(_UIForcedOrientationTransactionToken *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_originalInterfaceOrientation = a3;
    objc_storeWeak((id *)&v12->_transactionHandler, v10);
    uint64_t v14 = [v11 copy];
    transactionReason = v13->_transactionReason;
    v13->_transactionReason = (NSString *)v14;

    v13->_state = 1;
    v13->_disablesInterfaceAutorotation = a6;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OrientationTransaction", &initWithOriginalOrientation_handler_reason_disablingInterfaceAutorotation____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v18 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Created new orientation transaction token: %@", buf, 0xCu);
    }
  }

  return v13;
}

- (void)commitAnimated:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(_UIForcedOrientationTransactionToken *)self state] == 1)
  {
    self->_state = 2;
    [(_UIForcedOrientationTransactionToken *)self setCommitCompletionBlock:v6];
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OrientationTransaction", &_MergedGlobals_1125);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v10 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = @"non-animated";
        if (v4) {
          id v11 = @"animated";
        }
        int v13 = 138412546;
        uint64_t v14 = (_UIForcedOrientationTransactionToken *)v11;
        __int16 v15 = 2112;
        v16 = self;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Beginning %@ commit of orientation transaction token: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    v8 = [(_UIForcedOrientationTransactionToken *)self transactionHandler];
    [v8 commitOrientationTransaction:self animated:v4];
  }
  else
  {
    unint64_t v9 = __UILogGetCategoryCachedImpl("OrientationTransaction", &qword_1EB261988);
    if (*(unsigned char *)v9)
    {
      v12 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        uint64_t v14 = self;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Commit called on an inactive orientation transaction token: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)didCommitOrientation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(_UIForcedOrientationTransactionToken *)self state] == 2)
  {
    self->_state = 0;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OrientationTransaction", &didCommitOrientation___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v5 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 138412290;
        v7 = self;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Commit finished for orientation transaction token: %@", (uint8_t *)&v6, 0xCu);
      }
    }
    BOOL v4 = [(_UIForcedOrientationTransactionToken *)self commitCompletionBlock];
    [(_UIForcedOrientationTransactionToken *)self setCommitCompletionBlock:0];
    if (v4) {
      v4[2](v4);
    }
  }
}

- (void)cancel
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(_UIForcedOrientationTransactionToken *)self state] == 1)
  {
    self->_state = 0;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("OrientationTransaction", &cancel___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v5 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 138412290;
        v7 = self;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Cancelling orientation transaction token: %@", (uint8_t *)&v6, 0xCu);
      }
    }
    BOOL v4 = [(_UIForcedOrientationTransactionToken *)self transactionHandler];
    [v4 cancelOrientationTransaction:self];
  }
}

- (void)dealloc
{
  [(_UIForcedOrientationTransactionToken *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)_UIForcedOrientationTransactionToken;
  [(_UIForcedOrientationTransactionToken *)&v3 dealloc];
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIForcedOrientationTransactionToken *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UIForcedOrientationTransactionToken *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t v4 = [(_UIForcedOrientationTransactionToken *)self state];
  if (v4 > 2) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E52FA3B8[v4];
  }
  [v3 appendString:v5 withName:@"state"];
  id v6 = (id)objc_msgSend(v3, "ui_appendInterfaceOrientation:withName:", -[_UIForcedOrientationTransactionToken originalInterfaceOrientation](self, "originalInterfaceOrientation"), @"originalOrientation");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(_UIForcedOrientationTransactionToken *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(_UIForcedOrientationTransactionToken *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  v7 = [v6 activeMultilinePrefix];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78___UIForcedOrientationTransactionToken_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E52D9F98;
  id v8 = v6;
  id v12 = v8;
  int v13 = self;
  [v8 appendBodySectionWithName:0 multilinePrefix:v7 block:v11];

  id v9 = v8;
  return v9;
}

- (id)_orientationDebugDescription
{
  return [(_UIForcedOrientationTransactionToken *)self descriptionWithMultilinePrefix:0];
}

- (int64_t)originalInterfaceOrientation
{
  return self->_originalInterfaceOrientation;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)transactionReason
{
  return self->_transactionReason;
}

- (id)commitCompletionBlock
{
  return self->_commitCompletionBlock;
}

- (void)setCommitCompletionBlock:(id)a3
{
}

- (_UIForcedOrientationTransactionHandler)transactionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionHandler);
  return (_UIForcedOrientationTransactionHandler *)WeakRetained;
}

- (void)setTransactionHandler:(id)a3
{
}

- (BOOL)disablesInterfaceAutorotation
{
  return self->_disablesInterfaceAutorotation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transactionHandler);
  objc_storeStrong(&self->_commitCompletionBlock, 0);
  objc_storeStrong((id *)&self->_transactionReason, 0);
}

@end