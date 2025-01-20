@interface SBSAElementViewInteractionResultMutator
- (NSString)clientIdentifier;
- (NSString)elementIdentifier;
- (SBSAElementViewInteractionResult)interactionResult;
- (SBSAElementViewInteractionResultMutator)initWithElementViewInteractionResult:(id)a3;
- (int64_t)viewInteractionResult;
- (unint64_t)interactionSource;
- (void)setClientIdentifier:(id)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setInteractionSource:(unint64_t)a3;
- (void)setViewInteractionResult:(int64_t)a3;
@end

@implementation SBSAElementViewInteractionResultMutator

- (SBSAElementViewInteractionResultMutator)initWithElementViewInteractionResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAElementViewInteractionResultMutator;
  v6 = [(SBSAElementViewInteractionResultMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_interactionResult, a3);
  }

  return v7;
}

- (NSString)clientIdentifier
{
  return [(SBSAElementViewInteractionResult *)self->_interactionResult clientIdentifier];
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)elementIdentifier
{
  return [(SBSAElementViewInteractionResult *)self->_interactionResult elementIdentifier];
}

- (void)setElementIdentifier:(id)a3
{
}

- (unint64_t)interactionSource
{
  return [(SBSAElementViewInteractionResult *)self->_interactionResult interactionSource];
}

- (void)setInteractionSource:(unint64_t)a3
{
}

- (int64_t)viewInteractionResult
{
  return [(SBSAElementViewInteractionResult *)self->_interactionResult viewInteractionResult];
}

- (void)setViewInteractionResult:(int64_t)a3
{
}

- (SBSAElementViewInteractionResult)interactionResult
{
  return self->_interactionResult;
}

- (void).cxx_destruct
{
}

@end