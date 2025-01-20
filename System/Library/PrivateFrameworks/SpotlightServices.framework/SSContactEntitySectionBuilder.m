@interface SSContactEntitySectionBuilder
- (BOOL)shouldSkipSection;
- (SSContactResultBuilder)contactResultBuilder;
- (void)setContactResultBuilder:(id)a3;
@end

@implementation SSContactEntitySectionBuilder

- (BOOL)shouldSkipSection
{
  return ![(SSSectionBuilder *)self isContactEntitySearch];
}

- (SSContactResultBuilder)contactResultBuilder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactResultBuilder);
  return (SSContactResultBuilder *)WeakRetained;
}

- (void)setContactResultBuilder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end