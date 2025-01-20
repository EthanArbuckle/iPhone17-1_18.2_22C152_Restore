@interface SBKeyboardFocusRedirection
- (BKSHIDEventDeferringTarget)deferringTarget;
- (FBSSceneIdentityToken)fromToken;
- (FBSSceneIdentityToken)toToken;
- (NSString)reason;
- (UIWindow)containingWindow;
- (id)description;
- (id)focusTarget;
- (int)fromProcessIdentifier;
- (int)toProcessIdentifier;
- (void)setContainingWindow:(id)a3;
- (void)setFromProcessIdentifier:(int)a3;
- (void)setFromToken:(id)a3;
- (void)setReason:(id)a3;
- (void)setToProcessIdentifier:(int)a3;
- (void)setToToken:(id)a3;
@end

@implementation SBKeyboardFocusRedirection

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%d, %@) -> (%d, %@) because %@", self->_fromProcessIdentifier, self->_fromToken, self->_toProcessIdentifier, self->_toToken, self->_reason];
}

- (id)focusTarget
{
  if (a1)
  {
    a1 = +[SBKeyboardFocusTarget targetForSceneIdentityToken:*(void *)(a1 + 32) pid:*(unsigned int *)(a1 + 12)];
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (int)fromProcessIdentifier
{
  return self->_fromProcessIdentifier;
}

- (void)setFromProcessIdentifier:(int)a3
{
  self->_fromProcessIdentifier = a3;
}

- (FBSSceneIdentityToken)fromToken
{
  return self->_fromToken;
}

- (void)setFromToken:(id)a3
{
}

- (int)toProcessIdentifier
{
  return self->_toProcessIdentifier;
}

- (void)setToProcessIdentifier:(int)a3
{
  self->_toProcessIdentifier = a3;
}

- (FBSSceneIdentityToken)toToken
{
  return self->_toToken;
}

- (void)setToToken:(id)a3
{
}

- (BKSHIDEventDeferringTarget)deferringTarget
{
  return self->_deferringTarget;
}

- (UIWindow)containingWindow
{
  return self->_containingWindow;
}

- (void)setContainingWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingWindow, 0);
  objc_storeStrong((id *)&self->_deferringTarget, 0);
  objc_storeStrong((id *)&self->_toToken, 0);
  objc_storeStrong((id *)&self->_fromToken, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end