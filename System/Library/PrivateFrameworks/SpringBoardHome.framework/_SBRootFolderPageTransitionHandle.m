@interface _SBRootFolderPageTransitionHandle
- (BOOL)isValid;
- (BOOL)matchesTransitionSnapshot:(SBRootFolderPageStateTransitionSnapshot *)a3;
- (BSInvalidatable)customIconImageViewControllerCancelTouchesAssertion;
- (NSString)description;
- (NSString)reason;
- (SBRootFolderController)folderController;
- (_SBRootFolderPageTransitionHandle)initWithFolderController:(id)a3 destinationPageState:(int64_t)a4 destinationPageIndex:(int64_t)a5 reason:(id)a6;
- (double)pageTransitionProgress;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)destinationPageIndex;
- (int64_t)destinationPageState;
- (int64_t)sourcePageIndex;
- (int64_t)sourcePageState;
- (void)endTransitionSuccessfully:(BOOL)a3;
- (void)setCustomIconImageViewControllerCancelTouchesAssertion:(id)a3;
- (void)setDestinationPageIndex:(int64_t)a3;
- (void)setDestinationPageState:(int64_t)a3;
- (void)setPageTransitionProgress:(double)a3;
- (void)setSourcePageIndex:(int64_t)a3;
- (void)setSourcePageState:(int64_t)a3;
- (void)setTransitionProgress:(double)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation _SBRootFolderPageTransitionHandle

- (_SBRootFolderPageTransitionHandle)initWithFolderController:(id)a3 destinationPageState:(int64_t)a4 destinationPageIndex:(int64_t)a5 reason:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_SBRootFolderPageTransitionHandle;
  v13 = [(_SBRootFolderPageTransitionHandle *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_folderController, a3);
    uint64_t v15 = [v12 copy];
    reason = v14->_reason;
    v14->_reason = (NSString *)v15;

    v14->_sourcePageState = [v11 pageState];
    v14->_destinationPageState = a4;
    v14->_sourcePageIndex = [v11 currentPageIndex];
    v14->_destinationPageIndex = a5;
    v14->_valid = 1;
  }

  return v14;
}

- (BOOL)matchesTransitionSnapshot:(SBRootFolderPageStateTransitionSnapshot *)a3
{
  int64_t var0 = a3->var0;
  if (var0 != [(_SBRootFolderPageTransitionHandle *)self sourcePageState]) {
    return 0;
  }
  int64_t var1 = a3->var1;
  if (var1 != [(_SBRootFolderPageTransitionHandle *)self destinationPageState]) {
    return 0;
  }
  unint64_t var2 = a3->var2;
  int64_t v8 = [(_SBRootFolderPageTransitionHandle *)self destinationPageIndex];
  v9 = [(_SBRootFolderPageTransitionHandle *)self folderController];
  BOOL v10 = var2 == v8 - [v9 minimumPageIndex];

  return v10;
}

- (void)setTransitionProgress:(double)a3
{
  if ([(_SBRootFolderPageTransitionHandle *)self isValid])
  {
    [(_SBRootFolderPageTransitionHandle *)self setPageTransitionProgress:a3];
    id v6 = [(_SBRootFolderPageTransitionHandle *)self folderController];
    [v6 pageTransitionHandle:self updateCurrentPageStateTransitionToProgress:a3];
  }
  else
  {
    v5 = SBLogRootController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(_SBRootFolderPageTransitionHandle *)self setTransitionProgress:a3];
    }
  }
}

- (void)endTransitionSuccessfully:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_SBRootFolderPageTransitionHandle *)self isValid])
  {
    double v5 = 0.0;
    if (v3) {
      double v5 = 1.0;
    }
    [(_SBRootFolderPageTransitionHandle *)self setPageTransitionProgress:v5];
    id v7 = [(_SBRootFolderPageTransitionHandle *)self folderController];
    [v7 pageTransitionHandle:self endPageStateTransitionSuccessfully:v3];
  }
  else
  {
    id v6 = SBLogRootController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(_SBRootFolderPageTransitionHandle *)self endTransitionSuccessfully:v6];
    }
  }
}

- (NSString)description
{
  return (NSString *)[(_SBRootFolderPageTransitionHandle *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBRootFolderPageTransitionHandle *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(_SBRootFolderPageTransitionHandle *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(_SBRootFolderPageTransitionHandle *)self succinctDescriptionBuilder];
  double v5 = [(_SBRootFolderPageTransitionHandle *)self reason];
  id v6 = (id)[v4 appendObject:v5 withName:@"reason"];

  id v7 = SBStringForRootFolderPageState([(_SBRootFolderPageTransitionHandle *)self sourcePageState]);
  id v8 = (id)[v4 appendObject:v7 withName:@"sourcePageState"];

  v9 = SBStringForRootFolderPageState([(_SBRootFolderPageTransitionHandle *)self destinationPageState]);
  id v10 = (id)[v4 appendObject:v9 withName:@"destinationPageState"];

  [(_SBRootFolderPageTransitionHandle *)self pageTransitionProgress];
  id v11 = (id)objc_msgSend(v4, "appendFloat:withName:", @"pageTransitionProgress");
  id v12 = (id)objc_msgSend(v4, "appendInteger:withName:", -[_SBRootFolderPageTransitionHandle sourcePageIndex](self, "sourcePageIndex"), @"sourcePageIndex");
  id v13 = (id)objc_msgSend(v4, "appendInteger:withName:", -[_SBRootFolderPageTransitionHandle destinationPageIndex](self, "destinationPageIndex"), @"destinationPageIndex");
  v14 = [(_SBRootFolderPageTransitionHandle *)self folderController];
  id v15 = (id)[v4 appendPointer:v14 withName:@"folderController"];

  id v16 = (id)objc_msgSend(v4, "appendBool:withName:", -[_SBRootFolderPageTransitionHandle isValid](self, "isValid"), @"valid");
  v17 = [(_SBRootFolderPageTransitionHandle *)self customIconImageViewControllerCancelTouchesAssertion];
  id v18 = (id)[v4 appendObject:v17 withName:@"customIconImageViewControllerCancelTouchesAssertion" skipIfNil:1];

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBRootFolderController)folderController
{
  return self->_folderController;
}

- (int64_t)sourcePageState
{
  return self->_sourcePageState;
}

- (void)setSourcePageState:(int64_t)a3
{
  self->_sourcePageState = a3;
}

- (int64_t)destinationPageState
{
  return self->_destinationPageState;
}

- (void)setDestinationPageState:(int64_t)a3
{
  self->_destinationPageState = a3;
}

- (double)pageTransitionProgress
{
  return self->_pageTransitionProgress;
}

- (void)setPageTransitionProgress:(double)a3
{
  self->_pageTransitionProgress = a3;
}

- (int64_t)sourcePageIndex
{
  return self->_sourcePageIndex;
}

- (void)setSourcePageIndex:(int64_t)a3
{
  self->_sourcePageIndex = a3;
}

- (int64_t)destinationPageIndex
{
  return self->_destinationPageIndex;
}

- (void)setDestinationPageIndex:(int64_t)a3
{
  self->_destinationPageIndex = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BSInvalidatable)customIconImageViewControllerCancelTouchesAssertion
{
  return self->_customIconImageViewControllerCancelTouchesAssertion;
}

- (void)setCustomIconImageViewControllerCancelTouchesAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customIconImageViewControllerCancelTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_folderController, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)setTransitionProgress:(double)a3 .cold.1(void *a1, NSObject *a2, double a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = SBStringForRootFolderPageState([a1 sourcePageState]);
  id v7 = SBStringForRootFolderPageState([a1 destinationPageState]);
  id v8 = [a1 reason];
  int v9 = 138544130;
  id v10 = v6;
  __int16 v11 = 2114;
  id v12 = v7;
  __int16 v13 = 2114;
  v14 = v8;
  __int16 v15 = 2048;
  double v16 = a3;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Trying to update a page state transition that has ended (%{public}@ -> %{public}@, %{public}@), progress: %g", (uint8_t *)&v9, 0x2Au);
}

- (void)endTransitionSuccessfully:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = SBStringForRootFolderPageState([a1 sourcePageState]);
  id v7 = SBStringForRootFolderPageState([a1 destinationPageState]);
  id v8 = [a1 reason];
  int v9 = 138544130;
  id v10 = v6;
  __int16 v11 = 2114;
  id v12 = v7;
  __int16 v13 = 2114;
  v14 = v8;
  __int16 v15 = 1024;
  int v16 = a2 & 1;
  _os_log_error_impl(&dword_1D7F0A000, a3, OS_LOG_TYPE_ERROR, "Trying to end a page state transition that has already ended (%{public}@ -> %{public}@, %{public}@, successful: %{BOOL}u)", (uint8_t *)&v9, 0x26u);
}

@end