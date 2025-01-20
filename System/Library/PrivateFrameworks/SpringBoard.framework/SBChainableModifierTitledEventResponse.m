@interface SBChainableModifierTitledEventResponse
+ (id)responseWithTitle:(id)a3;
- (NSString)title;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
@end

@implementation SBChainableModifierTitledEventResponse

+ (id)responseWithTitle:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SBChainableModifierTitledEventResponse);
  uint64_t v5 = [v3 copy];

  title = v4->_title;
  v4->_title = (NSString *)v5;

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBChainableModifierTitledEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v6 descriptionBuilderWithMultilinePrefix:a3];
  [v4 appendString:self->_title withName:@"title"];
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
}

@end