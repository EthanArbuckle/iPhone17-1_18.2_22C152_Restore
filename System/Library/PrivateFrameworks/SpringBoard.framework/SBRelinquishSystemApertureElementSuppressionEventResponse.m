@interface SBRelinquishSystemApertureElementSuppressionEventResponse
- (NSUUID)invalidationIdentifier;
- (SBRelinquishSystemApertureElementSuppressionEventResponse)initWithInvalidationIdentifier:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBRelinquishSystemApertureElementSuppressionEventResponse

- (int64_t)type
{
  return 36;
}

- (SBRelinquishSystemApertureElementSuppressionEventResponse)initWithInvalidationIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRelinquishSystemApertureElementSuppressionEventResponse;
  v6 = [(SBChainableModifierEventResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_invalidationIdentifier, a3);
  }

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBRelinquishSystemApertureElementSuppressionEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v8 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = [(NSUUID *)self->_invalidationIdentifier UUIDString];
  id v6 = (id)[v4 appendObject:v5 withName:@"invalidationIdentifier"];

  return v4;
}

- (NSUUID)invalidationIdentifier
{
  return self->_invalidationIdentifier;
}

- (void).cxx_destruct
{
}

@end